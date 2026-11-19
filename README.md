# Tarea 4 – Desarrollo de Aplicaciones Web (CC5002)

## Consideraciones generales

Esta entrega conserva las funcionalidades de las tareas anteriores, implementadas con Flask y SQLAlchemy, e incorpora las funcionalidades de la Tarea 4 mediante Spring Boot y JPA.

**Ambas aplicaciones utilizan la misma base de datos MySQL y deben ejecutarse simultáneamente** para que todos los enlaces de navegación funcionen.

La aplicación Flask se ejecuta en http://127.0.0.1:5001/, mientras que la aplicación Spring Boot se encuentra disponible en http://localhost:8080/buscador.html.

## Requisitos

- Python 3.12
- Java JDK 25
- MySQL Server
- Conexión a Internet para instalar las dependencias inicialmente

El proyecto incluye Maven Wrapper, por lo que no es necesario instalar Maven por separado.

## 1. Configurar la base de datos

El archivo `sql/tarea4_base_datos.sql` contiene la estructura y los datos ficticios de prueba de las ocho tablas utilizadas por la aplicación, incluida `nota`.

Con una cuenta administradora de MySQL, crear la base de datos y un usuario con permisos sobre ella:

```sql
CREATE DATABASE tarea2
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

CREATE USER 'cc5002'@'%'
IDENTIFIED BY 'TU_CONTRASENA';

GRANT ALL PRIVILEGES ON tarea2.*
TO 'cc5002'@'%';
```

Reemplazar `TU_CONTRASENA` por la contraseña elegida.

Desde la carpeta principal del proyecto, importar el respaldo:

```bash
mysql -u cc5002 -p tarea2 < sql/tarea4_base_datos.sql
```

El respaldo ya contiene las modificaciones de las tareas anteriores, por lo que **no es necesario ejecutar `tarea3.sql` adicionalmente**.

## 2. Ejecutar Flask

Desde la carpeta principal del proyecto:

```bash
python3 -m venv venv
source venv/bin/activate
python -m pip install -r requirements.txt
export DB_PASSWORD='TU_CONTRASENA'
python app.py
```

Abrir http://127.0.0.1:5001/

El archivo `config.py` se incluye en el repositorio y obtiene la contraseña de MySQL mediante la variable de entorno `DB_PASSWORD`, por lo que no requiere modificaciones.

## 3. Ejecutar Spring Boot

Abrir una **segunda terminal**, manteniendo Flask ejecutándose.

Desde la carpeta principal del proyecto:

```bash
cd tarea4-spring
export DB_PASSWORD='TU_CONTRASENA'
./mvnw spring-boot:run
```

Abrir http://localhost:8080/buscador.html

Spring Boot utiliza Java 25 y se conecta a MySQL mediante `application.properties`.

## 4. Consideraciones para la corrección

- MySQL debe estar iniciado antes de ejecutar Flask y Spring Boot.
- Ambos servidores deben permanecer activos para utilizar toda la navegación.
- Cada terminal necesita tener definida su propia variable `DB_PASSWORD`.
- La contraseña debe coincidir con la definida para el usuario de MySQL y debe ser la misma en las terminales de Flask y Spring Boot.
- Las aplicaciones comparten la base de datos `tarea2`, utilizando el usuario `cc5002` de manera predeterminada.
- Las evaluaciones se almacenan en la tabla `nota` y permanecen guardadas después de recargar la página.
- La búsqueda y el registro de evaluaciones se realizan sin recargar la página.
- El respaldo SQL contiene registros ficticios para probar las funcionalidades.
- No se incluyen entornos virtuales ni archivos generados por Maven; las dependencias se instalan utilizando los comandos anteriores.

## 5. Problemas frecuentes

- **`KeyError: DB_PASSWORD`:** falta configurar la variable de entorno antes de ejecutar Flask.
- **Error de conexión a MySQL:** verificar que el servidor esté iniciado y que las credenciales correspondan a las configuradas.
- **`No module named flask`:** activar el entorno virtual e instalar `requirements.txt`.
- **`Port 8080 already in use`:** detener la instancia anterior de Spring Boot.
- **Enlaces de navegación inaccesibles:** comprobar que Flask esté ejecutándose en el puerto 5001 y Spring Boot en el 8080.

**Nota:** los comandos de activación del entorno virtual y configuración de variables de entorno están escritos para macOS y Linux.