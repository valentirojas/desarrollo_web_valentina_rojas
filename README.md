
# Tarea 2 - CC5002 Desarrollo de Aplicaciones Web

**Nombre:** Valentina Rojas

Aplicación web para el registro de voluntarios y avistamientos de aves en Chile, desarrollada utilizando HTML, CSS, JavaScript, Python, Flask, MySQL y SQLAlchemy.

## Ejecución

La aplicación requiere Python, MySQL y las dependencias de Flask, SQLAlchemy y PyMySQL.

Se debe configurar previamente la base de datos `tarea2` utilizando los archivos SQL proporcionados para la tarea y ajustar los datos de conexión en `app.py` según la configuración local.

Para ejecutar la aplicación desde la carpeta del proyecto:

```bash
source venv/bin/activate
python app.py
```

La aplicación estará disponible en:

http://127.0.0.1:5001/

## Consideraciones

- Los voluntarios y avistamientos se almacenan en MySQL mediante SQLAlchemy.
- Las comunas disponibles dependen de la región seleccionada.
- Se permite registrar avistamientos ocurridos durante los últimos 30 días, excluyendo fechas y horas futuras.
- Cada avistamiento debe incluir al menos una fotografía o video.
- Los archivos multimedia se almacenan localmente en `static/uploads/`.
- La portada presenta los dos últimos avistamientos registrados.
- El listado presenta cinco avistamientos por página y permite acceder al detalle de cada registro.
- Se realizan validaciones mediante JavaScript y Python.