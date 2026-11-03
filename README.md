## Tarea 3 - Estadísticas y comentarios

Esta entrega continúa el desarrollo del sistema de registro de avistamientos de aves implementado en las tareas anteriores.

### Nuevas funcionalidades

**1. Estadísticas**

Se incorporaron tres gráficos que utilizan información almacenada en MySQL:

- Gráfico de líneas: cantidad de avistamientos registrados por día.
- Gráfico de torta: distribución de avistamientos por tipo de ave.
- Gráfico de barras: cantidad de voluntarios registrados por comuna.

Los datos se obtienen mediante una solicitud asíncrona `fetch()` a la ruta `/api/estadisticas`, implementada con Flask y SQLAlchemy.

**2. Comentarios en avistamientos**

Se agregó un formulario de comentarios en la página de detalle de cada avistamiento.

Cada comentario contiene nombre, texto, fecha y el identificador del avistamiento correspondiente.

Se implementaron validaciones tanto en JavaScript como en Flask. El registro y la consulta de comentarios se realizan mediante solicitudes asíncronas, sin recargar la página.

Los comentarios se muestran utilizando `textContent` para evitar interpretar el contenido ingresado como HTML.

### Modificaciones a la base de datos

Se incorporó la tabla `comentario`, relacionada con `avistamiento` mediante una clave foránea.

También se agregó la columna `tipo_ave` a la tabla `avistamiento` para permitir la clasificación de los registros en las estadísticas.

Los avistamientos registrados antes de esta modificación pueden tener `tipo_ave` con valor `NULL` y se muestran como «Sin clasificar» en el gráfico correspondiente.

### Consideraciones

- La aplicación continúa utilizando Python, Flask, MySQL y SQLAlchemy.
- Se reutilizaron las funcionalidades y validaciones de las entregas anteriores.
- Los gráficos utilizan Chart.js.
- Las operaciones asíncronas se implementaron con JavaScript mediante `fetch()`.
- Para ejecutar la aplicación es necesario disponer de la base de datos configurada y de las dependencias indicadas en `requirements.txt`.
