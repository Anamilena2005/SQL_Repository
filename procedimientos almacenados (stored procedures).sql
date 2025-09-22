USE entertaiment;

-- ==================== Procedimiento: Datos_Departamento ====================
DROP PROCEDURE IF EXISTS Datos_Departamento;
DELIMITER $$
CREATE PROCEDURE Datos_Departamento(
    IN p_codigo TINYINT,
    IN p_nombre VARCHAR(50)
)
BEGIN
    INSERT INTO departamento (codigo_departamento, nombre_departamento)
    VALUES (p_codigo, p_nombre)
    ON DUPLICATE KEY UPDATE nombre_departamento = VALUES(nombre_departamento);
END $$
DELIMITER ;

-- ==================== Procedimiento: Datos_Ciudad ====================
DROP PROCEDURE IF EXISTS Datos_Ciudad;
DELIMITER $$
CREATE PROCEDURE Datos_Ciudad(
    IN p_codigo INT,
    IN p_nombre VARCHAR(50),
    IN p_codigo_departamento TINYINT
)
BEGIN
    INSERT INTO ciudad (codiCiudad, nombre_ciudad, codigo_departamento)
    VALUES (p_codigo, p_nombre, p_codigo_departamento)
    ON DUPLICATE KEY UPDATE nombre_ciudad = VALUES(nombre_ciudad), codigo_departamento = VALUES(codigo_departamento);
END $$
DELIMITER ;

-- ==================== Procedimiento: Datos_Genero ====================
DROP PROCEDURE IF EXISTS Datos_Genero;
DELIMITER $$
CREATE PROCEDURE Datos_Genero(
    IN p_id TINYINT,
    IN p_nombre VARCHAR(20)
)
BEGIN
    INSERT INTO genero (id_genero, nomgenero)
    VALUES (p_id, p_nombre)
    ON DUPLICATE KEY UPDATE nomgenero = VALUES(nomgenero);
END $$
DELIMITER ;

-- ==================== Procedimiento: Datos_Director ====================
DROP PROCEDURE IF EXISTS Datos_Director;
DELIMITER $$
CREATE PROCEDURE Datos_Director(
    IN p_nombre VARCHAR(50),
    IN p_apellido VARCHAR(50),
    IN p_foto INT,
    IN p_ano_nacimiento INT
)
BEGIN
    INSERT INTO director (nombre_director, apellido_director, foto, ano_nacimiento)
    VALUES (p_nombre, p_apellido, p_foto, p_ano_nacimiento);
END $$
DELIMITER ;

-- ==================== Procedimiento: Datos_Actor ====================
DROP PROCEDURE IF EXISTS Datos_Actor;
DELIMITER $$
CREATE PROCEDURE Datos_Actor(
    IN p_nombre VARCHAR(50),
    IN p_apellido VARCHAR(50),
    IN p_foto INT
)
BEGIN
    INSERT INTO actor (nombre_actor, apellido_actor, foto)
    VALUES (p_nombre, p_apellido, p_foto);
END $$
DELIMITER ;

-- ==================== Procedimiento: Datos_Cliente ====================
DROP PROCEDURE IF EXISTS Datos_Cliente;
DELIMITER $$
CREATE PROCEDURE Datos_Cliente(
    IN p_nombre VARCHAR(50),
    IN p_apellido VARCHAR(50),
    IN p_nacionalidad VARCHAR(50),
    IN p_correo VARCHAR(50),
    IN p_telefono VARCHAR(20),
    IN p_nacimiento DATE,
    IN p_password VARCHAR(64),
    IN p_id_genero TINYINT,
    IN p_codiciudad TINYINT
)
BEGIN
    INSERT INTO clientes (nombre, apellido, nacionalidad, correo, telefono, nacimiento, password, id_genero, codiCiudad)
    SELECT p_nombre, p_apellido, p_nacionalidad, p_correo, p_telefono, p_nacimiento, SHA2(p_password,256), p_id_genero, p_codiciudad
    FROM dual
    WHERE NOT EXISTS (SELECT 1 FROM clientes WHERE correo = p_correo);
END $$
DELIMITER ;

-- ==================== Procedimiento: Datos_Contenido ====================
DROP PROCEDURE IF EXISTS Datos_Contenido;
DELIMITER $$
CREATE PROCEDURE Datos_Contenido(
    IN p_titulo VARCHAR(255),
    IN p_fecha DATE,
    IN p_descripcion VARCHAR(300),
    IN p_duracion TIME,
    IN p_clasificacion VARCHAR(10),
    IN p_idioma VARCHAR(50),
    IN p_trailer_url VARCHAR(255),
    IN p_pais VARCHAR(3),
    IN p_puntuacion DECIMAL(3,2),
    IN p_enlace VARCHAR(255)
)
BEGIN
    INSERT INTO contenido_audiovisual (titulo, fecha_lanzamiento, descripcion, duracion, clasificacion_edad, idioma_original, trailer_url, pais_produccion, puntuacion_promedio, enlace_video)
    VALUES (p_titulo, p_fecha, p_descripcion, p_duracion, p_clasificacion, p_idioma, p_trailer_url, p_pais, p_puntuacion, p_enlace);
END $$
DELIMITER ;

-- ==================== Procedimiento: Datos_Genero_Contenido ====================
DROP PROCEDURE IF EXISTS Datos_Genero_Contenido;
DELIMITER $$
CREATE PROCEDURE Datos_Genero_Contenido(
    IN p_id_genero TINYINT,
    IN p_id_contenido INT
)
BEGIN
    INSERT INTO genero_contenido_audiovisual (id_genero, id_contenido)
    VALUES (p_id_genero, p_id_contenido)
    ON DUPLICATE KEY UPDATE id_genero = VALUES(id_genero), id_contenido = VALUES(id_contenido);
END $$
DELIMITER ;

-- ==================== Procedimiento: Datos_Vistas ====================
DROP PROCEDURE IF EXISTS Datos_Vistas;
DELIMITER $$
CREATE PROCEDURE Datos_Vistas(
    IN p_id_cliente INT,
    IN p_id_contenido INT,
    IN p_termino TINYINT(1),
    IN p_tiempo TIME
)
BEGIN
    INSERT INTO vistas (id_clientes, id_contenido, termino, tiempo_visto)
    VALUES (p_id_cliente, p_id_contenido, p_termino, p_tiempo)
    ON DUPLICATE KEY UPDATE termino = VALUES(termino), tiempo_visto = VALUES(tiempo_visto);
END $$
DELIMITER ;

-- ==================== Procedimiento: Datos_Membresia ====================
DROP PROCEDURE IF EXISTS Datos_Membresia;
DELIMITER $$
CREATE PROCEDURE Datos_Membresia(
    IN p_nombre VARCHAR(50),
    IN p_precio INT,
    IN p_duracion DATE,
    IN p_imagen VARCHAR(255),
    IN p_descripcion VARCHAR(255)
)
BEGIN
    INSERT INTO membresia (nommembresia, precio, duracion, imagen, descripcion)
    VALUES (p_nombre, p_precio, p_duracion, p_imagen, p_descripcion);
END $$
DELIMITER ;

-- ==================== Procedimiento: Datos_Factura ====================
DROP PROCEDURE IF EXISTS Datos_Factura;
DELIMITER $$
CREATE PROCEDURE Datos_Factura(
    IN p_id_membresia INT,
    IN p_id_cliente INT,
    IN p_fecha DATE
)
BEGIN
    INSERT INTO factura (id_membresia, id_clientes, fecha_compra)
    VALUES (p_id_membresia, p_id_cliente, p_fecha);
END $$
DELIMITER ;




