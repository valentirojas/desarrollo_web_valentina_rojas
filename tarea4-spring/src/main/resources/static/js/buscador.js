"use strict";

const busqueda = document.getElementById("busqueda");
const resultados = document.getElementById("resultados");

let controladorActual = null;

const destacarTexto = (elemento, texto, termino) => {
    const posicion = texto.toLocaleLowerCase().indexOf(
        termino.toLocaleLowerCase()
    );

    if (posicion === -1 || termino === "") {
        elemento.textContent = texto;
        return;
    }

    const antes = texto.substring(0, posicion);
    const coincidencia = texto.substring(
        posicion,
        posicion + termino.length
    );
    const despues = texto.substring(posicion + termino.length);

    elemento.appendChild(document.createTextNode(antes));

    const marca = document.createElement("mark");
    marca.textContent = coincidencia;
    elemento.appendChild(marca);

    elemento.appendChild(document.createTextNode(despues));
};

const mostrarPromedio = (promedio) => {
    if (promedio === null || promedio === undefined) {
        return "-";
    }

    return promedio.toFixed(2);
};

const evaluarAvistamiento = async (id, nota, promedioElemento, boton) => {
    boton.disabled = true;

    try {
        const respuesta = await fetch(
            "/api/avistamientos/" + id + "/notas",
            {
                method: "POST",
                headers: {
                    "Content-Type": "application/json"
                },
                body: JSON.stringify({ nota: nota })
            }
        );

        if (!respuesta.ok) {
            throw new Error("No se pudo guardar la evaluación");
        }

        const datos = await respuesta.json();

        promedioElemento.textContent =
            "Promedio: " + mostrarPromedio(datos.promedio);

    } catch (error) {
        alert("Ocurrió un error al guardar la evaluación.");
        console.error(error);
    } finally {
        boton.disabled = false;
    }
};

const mostrarResultados = (avistamientos, texto) => {
    resultados.replaceChildren();

    if (avistamientos.length === 0) {
        const mensaje = document.createElement("p");
        mensaje.textContent = "No se encontraron avistamientos.";
        resultados.appendChild(mensaje);
        return;
    }

    avistamientos.forEach((avistamiento) => {
        const articulo = document.createElement("article");

        const ave = document.createElement("h3");
        destacarTexto(ave, avistamiento.ave, texto);

        const voluntario = document.createElement("p");
        voluntario.appendChild(
            document.createTextNode("Voluntario: ")
        );
        destacarTexto(voluntario, avistamiento.voluntario, texto);

        const comuna = document.createElement("p");
        comuna.appendChild(
            document.createTextNode("Comuna: ")
        );
        destacarTexto(comuna, avistamiento.comuna, texto);

        const fecha = document.createElement("p");
        fecha.textContent = "Fecha: " + avistamiento.fecha;

        const promedio = document.createElement("p");
        promedio.textContent =
            "Promedio: " + mostrarPromedio(avistamiento.promedio);

        const etiqueta = document.createElement("label");
        etiqueta.textContent = "Nota: ";

        const selector = document.createElement("select");

        for (let i = 1; i <= 7; i++) {
            const opcion = document.createElement("option");
            opcion.value = i;
            opcion.textContent = i;
            selector.appendChild(opcion);
        }

        etiqueta.appendChild(selector);

        const boton = document.createElement("button");
        boton.type = "button";
        boton.textContent = "Evaluar";

        boton.addEventListener("click", () => {
            const nota = Number(selector.value);

            evaluarAvistamiento(
                avistamiento.id,
                nota,
                promedio,
                boton
            );
        });

        articulo.appendChild(ave);
        articulo.appendChild(voluntario);
        articulo.appendChild(comuna);
        articulo.appendChild(fecha);
        articulo.appendChild(promedio);
        articulo.appendChild(etiqueta);
        articulo.appendChild(boton);

        resultados.appendChild(articulo);
    });
};

const buscarAvistamientos = async () => {
    const texto = busqueda.value.trim();

    if (controladorActual !== null) {
        controladorActual.abort();
    }

    const controlador = new AbortController();
    controladorActual = controlador;

    try {
        const respuesta = await fetch(
            "/api/avistamientos?texto=" + encodeURIComponent(texto),
            { signal: controlador.signal }
        );

        if (!respuesta.ok) {
            throw new Error("Error al buscar avistamientos");
        }

        const avistamientos = await respuesta.json();

        if (!controlador.signal.aborted) {
            mostrarResultados(avistamientos, texto);
        }

    } catch (error) {
        if (error.name === "AbortError") {
            return;
        }

        resultados.textContent =
            "Ocurrió un error al realizar la búsqueda.";
        console.error(error);
    }
};

busqueda.addEventListener("input", buscarAvistamientos);

buscarAvistamientos();
