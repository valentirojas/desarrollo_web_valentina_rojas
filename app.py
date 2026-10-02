import os
import re
import uuid

from datetime import datetime, timedelta

from flask import Flask, render_template, request, jsonify, redirect, url_for
from sqlalchemy import create_engine, select, func
from sqlalchemy.orm import Session
from werkzeug.utils import secure_filename

from config import DATABASE_URL

from models import (
    Avistamiento,
    Region,
    Comuna,
    Voluntario,
    Ave,
    Registro
)


app = Flask(__name__)

engine = create_engine(DATABASE_URL)

CARPETA_ARCHIVOS = os.path.join(app.static_folder, "uploads")

EXTENSIONES_PERMITIDAS = {
    "jpg", "jpeg", "png", "gif", "webp",
    "mp4", "webm", "mov"
}

TIPOS_PERMITIDOS = {
    "jpg": {"image/jpeg"},
    "jpeg": {"image/jpeg"},
    "png": {"image/png"},
    "gif": {"image/gif"},
    "webp": {"image/webp"},
    "mp4": {"video/mp4"},
    "webm": {"video/webm"},
    "mov": {"video/quicktime"}
}

app.config["MAX_CONTENT_LENGTH"] = 50 * 1024 * 1024

os.makedirs(CARPETA_ARCHIVOS, exist_ok=True)


def archivo_permitido(archivo):
    nombre = archivo.filename

    if not nombre or "." not in nombre:
        return False

    extension = nombre.rsplit(".", 1)[1].lower()

    if extension not in EXTENSIONES_PERMITIDAS:
        return False

    if archivo.mimetype not in TIPOS_PERMITIDOS[extension]:
        return False

    return True


@app.route("/")
def index():
    mensaje_exito = request.args.get("registro", "") == "exitoso"

    with Session(engine) as session:
        ultimos_avistamientos = session.scalars(
            select(Avistamiento)
            .order_by(Avistamiento.id.desc())
            .limit(2)
        ).all()

        return render_template(
            "index.html",
            avistamientos=ultimos_avistamientos,
            mensaje_exito=mensaje_exito
        )


@app.route("/registro-voluntario", methods=["GET", "POST"])
def registro_voluntario():
    errores = []
    exito = False
    voluntario_registrado_id = None

    with Session(engine) as session:
        regiones = session.scalars(
            select(Region).order_by(Region.nombre)
        ).all()

        if request.method == "POST":
            nombre = request.form.get("nombre", "").strip()
            email = request.form.get("email", "").strip()
            telefono = request.form.get("telefono", "").strip()
            region_id = request.form.get("region", "")
            comuna_id = request.form.get("comuna", "")

            if len(nombre) < 3 or len(nombre) > 255:
                errores.append("Ingrese un nombre válido.")

            expresion_email = r"^[^\s@]+@[^\s@]+\.[^\s@]+$"

            if len(email) > 80 or not re.fullmatch(
                expresion_email,
                email
            ):
                errores.append(
                    "Ingrese un correo electrónico válido."
                )

            expresion_telefono = r"\+?[0-9]{8,12}"

            if not re.fullmatch(expresion_telefono, telefono):
                errores.append("Ingrese un teléfono válido.")

            if not region_id.isdigit() or not comuna_id.isdigit():
                errores.append(
                    "Debe seleccionar una región y una comuna."
                )

            else:
                region_seleccionada = session.get(
                    Region,
                    int(region_id)
                )

                comuna_seleccionada = session.get(
                    Comuna,
                    int(comuna_id)
                )

                if (
                    region_seleccionada is None
                    or comuna_seleccionada is None
                ):
                    errores.append(
                        "La región o comuna seleccionada no existe."
                    )

                elif comuna_seleccionada.region_id != region_seleccionada.id:
                    errores.append(
                        "La comuna no corresponde a la región seleccionada."
                    )

            if not errores:
                nuevo_voluntario = Voluntario(
                    nombre=nombre,
                    email=email,
                    telefono=telefono,
                    fecha_registro=datetime.now(),
                    comuna_id=int(comuna_id)
                )

                session.add(nuevo_voluntario)
                session.flush()

                voluntario_registrado_id = nuevo_voluntario.id

                session.commit()

                exito = True

        return render_template(
            "registro-voluntario.html",
            regiones=regiones,
            errores=errores,
            exito=exito,
            voluntario_registrado_id=voluntario_registrado_id
        )


@app.route("/comunas/<int:region_id>")
def obtener_comunas(region_id):
    with Session(engine) as session:
        comunas = session.scalars(
            select(Comuna)
            .where(Comuna.region_id == region_id)
            .order_by(Comuna.nombre)
        ).all()

        resultado = []

        for comuna in comunas:
            resultado.append({
                "id": comuna.id,
                "nombre": comuna.nombre
            })

    return jsonify(resultado)


@app.route("/registrar-avistamiento", methods=["GET", "POST"])
def registrar_avistamiento():
    errores = []
    exito = False

    voluntario_seleccionado = request.args.get(
        "voluntario_id",
        type=int
    )

    with Session(engine) as session:
        voluntarios = session.scalars(
            select(Voluntario).order_by(Voluntario.nombre)
        ).all()

        aves = session.scalars(
            select(Ave).order_by(Ave.nombre)
        ).all()

        if request.method == "POST":
            voluntario_id = request.form.get("voluntario", "")
            ave_id = request.form.get("ave", "")
            tipo_ave = request.form.get("tipo_ave", "")
            lugar = request.form.get("lugar", "").strip()
            fecha = request.form.get("fecha", "")
            hora = request.form.get("hora", "")

            archivos = request.files.getlist("registro")

            if voluntario_id.isdigit():
                voluntario_seleccionado = int(voluntario_id)

            if not voluntario_id.isdigit():
                errores.append("Debe seleccionar un voluntario.")

            elif session.get(Voluntario, int(voluntario_id)) is None:
                errores.append(
                    "El voluntario seleccionado no existe."
                )

            if not ave_id.isdigit():
                errores.append("Debe seleccionar un ave.")

            elif session.get(Ave, int(ave_id)) is None:
                errores.append("El ave seleccionada no existe.")

            tipos_ave = {
                "rapaz",
                "acuatica",
                "terrestre",
                "marina",
                "otra"
            }

            if tipo_ave not in tipos_ave:
                errores.append("Debe seleccionar un tipo de ave.")

            if len(lugar) == 0 or len(lugar) > 200:
                errores.append("Ingrese un lugar válido.")

            fecha_hora = None

            try:
                fecha_hora = datetime.strptime(
                    fecha + " " + hora,
                    "%Y-%m-%d %H:%M"
                )

                ahora = datetime.now()

                if fecha_hora > ahora:
                    errores.append(
                        "La fecha del avistamiento no puede ser futura."
                    )

                elif fecha_hora < ahora - timedelta(days=30):
                    errores.append(
                        "El avistamiento no puede tener más de 30 días de antigüedad."
                    )

            except ValueError:
                errores.append("Ingrese una fecha y hora válidas.")

            archivos_validos = []

            for archivo in archivos:
                if archivo.filename == "":
                    continue

                if not archivo_permitido(archivo):
                    errores.append(
                        "Solo se permiten fotografías y videos válidos."
                    )

                else:
                    archivos_validos.append(archivo)

            if len(archivos_validos) == 0:
                errores.append(
                    "Debe adjuntar al menos una fotografía o video."
                )

            if not errores:
                rutas_guardadas = []

                try:
                    nuevo_avistamiento = Avistamiento(
                        voluntario_id=int(voluntario_id),
                        ave_id=int(ave_id),
                        fecha_hora=fecha_hora,
                        lugar=lugar,
                        descripcion=None
                    )

                    session.add(nuevo_avistamiento)
                    session.flush()

                    for archivo in archivos_validos:
                        nombre_original = secure_filename(
                            archivo.filename
                        )

                        extension = nombre_original.rsplit(
                            ".",
                            1
                        )[1].lower()

                        nombre_guardado = (
                            uuid.uuid4().hex + "." + extension
                        )

                        ruta_completa = os.path.join(
                            CARPETA_ARCHIVOS,
                            nombre_guardado
                        )

                        archivo.save(ruta_completa)

                        rutas_guardadas.append(ruta_completa)

                        nuevo_registro = Registro(
                            ruta_archivo="uploads/" + nombre_guardado,
                            nombre_archivo=nombre_original,
                            avistamiento_id=nuevo_avistamiento.id
                        )

                        session.add(nuevo_registro)

                    session.commit()

                    return redirect(
                        url_for("index", registro="exitoso")
                    )

                except Exception:
                    session.rollback()

                    for ruta in rutas_guardadas:
                        if os.path.exists(ruta):
                            os.remove(ruta)

                    errores.append(
                        "No fue posible guardar el avistamiento."
                    )

        return render_template(
            "registrar-avistamiento.html",
            voluntarios=voluntarios,
            aves=aves,
            errores=errores,
            exito=exito,
            voluntario_seleccionado=voluntario_seleccionado
        )


@app.route("/listado-avistamientos")
def listado_avistamientos():
    pagina = request.args.get("pagina", 1, type=int)

    if pagina < 1:
        pagina = 1

    por_pagina = 5

    with Session(engine) as session:
        consulta = (
            select(
                Avistamiento.id,
                Avistamiento.fecha_hora,
                Avistamiento.lugar,
                Ave.nombre.label("nombre_ave"),
                Voluntario.nombre.label("nombre_voluntario")
            )
            .join(Ave, Avistamiento.ave_id == Ave.id)
            .join(
                Voluntario,
                Avistamiento.voluntario_id == Voluntario.id
            )
            .order_by(
                Avistamiento.fecha_hora.desc(),
                Avistamiento.id.desc()
            )
        )

        resultados = session.execute(consulta).all()

        total = len(resultados)

        inicio = (pagina - 1) * por_pagina
        fin = inicio + por_pagina

        avistamientos = resultados[inicio:fin]

        total_paginas = (
            total + por_pagina - 1
        ) // por_pagina

        return render_template(
            "listado-avistamientos.html",
            avistamientos=avistamientos,
            pagina=pagina,
            total_paginas=total_paginas
        )


@app.route("/avistamiento/<int:avistamiento_id>")
def detalle_avistamiento(avistamiento_id):
    with Session(engine) as session:
        consulta = (
            select(
                Avistamiento.id,
                Avistamiento.fecha_hora,
                Avistamiento.lugar,
                Avistamiento.descripcion,
                Ave.nombre.label("nombre_ave"),
                Voluntario.nombre.label("nombre_voluntario")
            )
            .join(Ave, Avistamiento.ave_id == Ave.id)
            .join(
                Voluntario,
                Avistamiento.voluntario_id == Voluntario.id
            )
            .where(Avistamiento.id == avistamiento_id)
        )

        avistamiento = session.execute(consulta).first()

        if avistamiento is None:
            return "El avistamiento solicitado no existe.", 404

        registros = session.scalars(
            select(Registro)
            .where(Registro.avistamiento_id == avistamiento_id)
            .order_by(Registro.id)
        ).all()

        archivos = []

        for registro in registros:
            extension = registro.nombre_archivo.rsplit(
                ".",
                1
            )[-1].lower()

            archivos.append({
                "ruta": registro.ruta_archivo,
                "nombre": registro.nombre_archivo,
                "es_video": extension in {"mp4", "webm", "mov"}
            })

        return render_template(
            "detalle-avistamiento.html",
            avistamiento=avistamiento,
            archivos=archivos
        )


@app.route("/indicadores")
def indicadores():
    with Session(engine) as session:
        total_voluntarios = session.scalar(
            select(func.count(Voluntario.id))
        )

        total_avistamientos = session.scalar(
            select(func.count(Avistamiento.id))
        )

        consulta_regiones = (
            select(
                Region.nombre,
                func.count(Voluntario.id)
            )
            .join(Comuna, Comuna.region_id == Region.id)
            .join(Voluntario, Voluntario.comuna_id == Comuna.id)
            .group_by(Region.id, Region.nombre)
            .order_by(Region.nombre)
        )

        resultados_regiones = session.execute(
            consulta_regiones
        ).all()

        voluntarios_por_region = []

        for nombre, cantidad in resultados_regiones:
            voluntarios_por_region.append({
                "nombre": nombre,
                "cantidad": cantidad
            })

        consulta_aves = (
            select(
                Ave.nombre,
                func.count(Avistamiento.id)
            )
            .join(Avistamiento, Avistamiento.ave_id == Ave.id)
            .group_by(Ave.id, Ave.nombre)
            .order_by(func.count(Avistamiento.id).desc())
        )

        resultados_aves = session.execute(
            consulta_aves
        ).all()

        avistamientos_por_ave = []

        for nombre, cantidad in resultados_aves:
            avistamientos_por_ave.append({
                "nombre": nombre,
                "cantidad": cantidad
            })

        return render_template(
            "indicadores.html",
            total_voluntarios=total_voluntarios,
            total_avistamientos=total_avistamientos,
            voluntarios_por_region=voluntarios_por_region,
            avistamientos_por_ave=avistamientos_por_ave
        )


if __name__ == "__main__":
    app.run(debug=True, port=5001)
