-- Modificaciones de la base de datos para la Tarea 3
-- Ejecutar sobre la base de datos tarea2,
-- después de crear las tablas de la Tarea 2.

CREATE TABLE IF NOT EXISTS comentario (
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(80) NOT NULL,
    texto VARCHAR(300) NOT NULL,
    fecha TIMESTAMP NOT NULL,
    avistamiento_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (avistamiento_id)
        REFERENCES avistamiento(id)
) ENGINE = InnoDB;

ALTER TABLE avistamiento
ADD COLUMN tipo_ave VARCHAR(20) NULL;