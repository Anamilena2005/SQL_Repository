USE `entertaiment`;

-- ==================== Reparto de cada contenido ====================
CREATE OR REPLACE VIEW Vista_Reparto_Contenido AS
SELECT
    c.id_contenido,
    c.titulo,
    a.id_actor,
    CONCAT(a.nombre_actor, ' ', a.apellido_actor) AS nombre_actor
FROM contenido_audiovisual c
JOIN contenido_audiovisual_actor caa ON c.id_contenido = caa.id_contenido
JOIN actor a ON caa.id_actor = a.id_actor;

-- ==================== Facturas con detalles de membresía ====================
CREATE OR REPLACE VIEW Vista_Factura_Membresia AS
SELECT
    f.id_factura,
    CONCAT(c.nombre, ' ', c.apellido) AS cliente,
    m.nommembresia,
    m.precio,
    f.fecha_compra
FROM factura f
JOIN clientes c ON f.id_clientes = c.id_clientes
JOIN membresia m ON f.id_membresia = m.id_membresia;

-- ==================== Contenido por género ====================
CREATE OR REPLACE VIEW Vista_Contenido_Genero AS
SELECT
    c.id_contenido,
    c.titulo,
    g.nomgenero
FROM contenido_audiovisual c
JOIN genero_contenido_audiovisual gca ON c.id_contenido = gca.id_contenido
JOIN genero g ON gca.id_genero = g.id_genero;

-- ==================== Vista de facturación de clientes ====================
CREATE OR REPLACE VIEW Vista_Facturas AS
SELECT 
    f.id_factura,
    c.id_clientes,
    CONCAT(c.nombre, ' ', c.apellido) AS nombre_cliente,
    f.fecha_compra,
    m.nommembresia,
    m.precio,
    m.descripcion
FROM factura f
JOIN clientes c ON f.id_clientes = c.id_clientes
JOIN membresia m ON f.id_membresia = m.id_membresia;

-- ==================== Vista de puntuación y detalles de contenidos audiovisuales ====================
CREATE OR REPLACE VIEW Vista_Puntuacion_Contenido AS
SELECT 
    ca.id_contenido,
    ca.titulo,
    ca.puntuacion_promedio,
    ca.duracion,
    ca.fecha_lanzamiento,
    d.nombre_director,
    d.apellido_director
FROM contenido_audiovisual ca
LEFT JOIN director d ON ca.id_director = d.id_director;

-- ==================== Vista de clientes con su membresía actual ====================
CREATE OR REPLACE VIEW Vista_Clientes_Membresia AS
SELECT 
    c.id_clientes,
    CONCAT(c.nombre, ' ', c.apellido) AS nombre_cliente,
    m.nommembresia,
    m.precio,
    m.descripcion
FROM factura f
JOIN clientes c ON f.id_clientes = c.id_clientes
JOIN membresia m ON f.id_membresia = m.id_membresia;
