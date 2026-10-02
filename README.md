# Tarea 2 - CC5002 Desarrollo de Aplicaciones Web

**Nombre:** Valentina Rojas

## Ejecución

La aplicación requiere Python, MySQL y las dependencias indicadas en `requirements.txt`.

Se debe configurar previamente la base de datos `tarea2` utilizando los archivos SQL proporcionados para la tarea.

Para ejecutar la aplicación desde la carpeta principal del proyecto:

```bash
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
python app.py
```

La aplicación estará disponible en: http://127.0.0.1:5001/

## Configuración de la base de datos

Los datos de conexión a MySQL se mantienen en un archivo local llamado `config.py`, el cual está excluido del repositorio mediante `.gitignore`.

Para ejecutar la aplicación, se debe crear un archivo `config.py` en la carpeta principal del proyecto, junto a `app.py`, con el siguiente contenido:

```python
DATABASE_URL = "mysql+pymysql://cc5002:programacionweb@localhost:3306/tarea2"
```

La configuración corresponde a las credenciales indicadas en el enunciado de la Tarea 2.

## Consideraciones

- Los voluntarios y avistamientos se almacenan en MySQL mediante SQLAlchemy.
- Las comunas disponibles dependen de la región seleccionada.
- Se permite registrar avistamientos ocurridos durante los últimos 30 días, excluyendo fechas y horas futuras.
- Cada avistamiento debe incluir al menos una fotografía o video.
- Los archivos multimedia se almacenan localmente en `static/uploads/`.
- La portada presenta los dos últimos avistamientos registrados.
- El listado presenta cinco avistamientos por página y permite acceder al detalle de cada registro.
- Se realizan validaciones mediante JavaScript y Python.