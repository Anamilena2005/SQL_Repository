USE entertaiment;

-- ==================== Desactivar temporalmente las claves foráneas ====================
SET FOREIGN_KEY_CHECKS = 0;

-- ==================== Eliminar tablas existentes ====================
DROP TABLE IF EXISTS vistas;
DROP TABLE IF EXISTS contenido_audiovisual_actor;
DROP TABLE IF EXISTS actor;
DROP TABLE IF EXISTS genero_contenido_audiovisual;
DROP TABLE IF EXISTS contenido_audiovisual;
DROP TABLE IF EXISTS factura;
DROP TABLE IF EXISTS membresia;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS director;
DROP TABLE IF EXISTS genero;
DROP TABLE IF EXISTS ciudad;
DROP TABLE IF EXISTS departamento;

-- ==================== Volver a activar las claves foráneas ====================
SET FOREIGN_KEY_CHECKS = 1;

-- ==================== Crear tablas ====================

-- Departamento
CREATE TABLE departamento (
    codigo_departamento TINYINT(3) PRIMARY KEY,
    nombre_departamento VARCHAR(27)
);

-- Ciudad
CREATE TABLE ciudad (
    codiCiudad TINYINT(3) AUTO_INCREMENT PRIMARY KEY,
    nombre_ciudad VARCHAR(27),
    codigo_departamento TINYINT(3),
    FOREIGN KEY (codigo_departamento) REFERENCES departamento(codigo_departamento)
);

-- Genero
CREATE TABLE genero (
    id_genero TINYINT(1) PRIMARY KEY,
    nomgenero VARCHAR(10)
);

-- Director
CREATE TABLE director (
    id_director INT(10) AUTO_INCREMENT PRIMARY KEY,
    nombre_director VARCHAR(25),
    apellido_director VARCHAR(25),
    foto INT(10),
    ano_nacimiento INT(10)
);

-- Clientes
CREATE TABLE clientes (
    id_clientes INT(10) AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(20),
    apellido VARCHAR(30),
    nacionalidad VARCHAR(15),
    id_genero TINYINT(1),
    correo VARCHAR(40) UNIQUE,
    telefono VARCHAR(14),
    nacimiento DATE,
    codiCiudad TINYINT(3),
    password VARCHAR(64),
    FOREIGN KEY (id_genero) REFERENCES genero(id_genero),
    FOREIGN KEY (codiCiudad) REFERENCES ciudad(codiCiudad)
);

-- Membresia
CREATE TABLE membresia (
    id_membresia INT(10) AUTO_INCREMENT PRIMARY KEY,
    nommembresia VARCHAR(10),
    precio INT(10),
    duracion DATE,
    imagen VARCHAR(255),
    descripcion VARCHAR(255)
);

-- Factura
CREATE TABLE factura (
    id_factura INT(10) AUTO_INCREMENT PRIMARY KEY,
    id_membresia INT(10),
    fecha_compra DATE,
    id_clientes INT(10),
    FOREIGN KEY (id_clientes) REFERENCES clientes(id_clientes),
    FOREIGN KEY (id_membresia) REFERENCES membresia(id_membresia)
);

-- Contenido Audiovisual
CREATE TABLE contenido_audiovisual (
    id_contenido INT(10) AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255),
    fecha_lanzamiento DATE,
    descripcion VARCHAR(300),
    duracion TIME,
    clasificacion_edad VARCHAR(2),
    idioma_original VARCHAR(50),
    trailer_url VARCHAR(255),
    pais_produccion VARCHAR(3),
    puntuacion_promedio DECIMAL(3,2),
    enlace_video VARCHAR(255),
    id_director INT(10),
    FOREIGN KEY (id_director) REFERENCES director(id_director)
);

-- Genero_Contenido_Audiovisual
CREATE TABLE genero_contenido_audiovisual (
    id_genero TINYINT(1),
    id_contenido INT(10),
    PRIMARY KEY (id_genero, id_contenido),
    FOREIGN KEY (id_genero) REFERENCES genero(id_genero),
    FOREIGN KEY (id_contenido) REFERENCES contenido_audiovisual(id_contenido)
);

-- Actor
CREATE TABLE actor (
    id_actor INT(10) AUTO_INCREMENT PRIMARY KEY,
    nombre_actor VARCHAR(25),
    apellido_actor VARCHAR(25),
    foto INT(10)
);

-- Contenido_Audiovisual_Actor
CREATE TABLE contenido_audiovisual_actor (
    id_contenido INT(10),
    id_actor INT(10),
    tipo_actor INT(10),
    personaje INT(10),
    PRIMARY KEY (id_contenido, id_actor),
    FOREIGN KEY (id_contenido) REFERENCES contenido_audiovisual(id_contenido),
    FOREIGN KEY (id_actor) REFERENCES actor(id_actor)
);

-- Vistas
CREATE TABLE vistas (
    id_clientes INT(10),
    id_contenido INT(10),
    termino TINYINT(1),
    tiempo_visto TIME,
    PRIMARY KEY (id_clientes, id_contenido),
    FOREIGN KEY (id_clientes) REFERENCES clientes(id_clientes),
    FOREIGN KEY (id_contenido) REFERENCES contenido_audiovisual(id_contenido)
);

