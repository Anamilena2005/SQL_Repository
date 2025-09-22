USE entertaiment;

-- 1️⃣ Total de vistas por contenido
CREATE OR REPLACE VIEW Vista_Total_Vistas AS
SELECT 
    c.ID_Contenido,
    c.Titulo,
    (SELECT COUNT(*) 
     FROM Vistas v 
     WHERE v.ID_Contenido = c.ID_Contenido) AS Total_Vistas
FROM Contenido_AudioVisual c;

-- 2️⃣ Clientes con membresía y total de facturas
CREATE OR REPLACE VIEW Vista_Cliente_Facturas AS
SELECT 
    c.ID_Clientes,
    CONCAT(c.Nombre, ' ', c.Apellido) AS Nombre_Cliente,
    (SELECT COUNT(*) 
     FROM Factura f 
     WHERE f.ID_Clientes = c.ID_Clientes) AS Total_Facturas,
    (SELECT NomMembresia 
     FROM Membresia m 
     JOIN Factura f2 ON m.ID_Membresia = f2.ID_Membresia
     WHERE f2.ID_Clientes = c.ID_Clientes
     ORDER BY f2.ID_Factura DESC
     LIMIT 1) AS Membresia_Actual
FROM Clientes c;

-- 3️⃣ Contenido con cantidad de actores
CREATE OR REPLACE VIEW Vista_Contenido_Actores AS
SELECT 
    c.ID_Contenido,
    c.Titulo,
    (SELECT COUNT(*) 
     FROM Contenido_AudioVisual_Actor caa 
     WHERE caa.ID_Contenido = c.ID_Contenido) AS Total_Actores
FROM Contenido_AudioVisual c;

-- 4️⃣ Contenido con promedio de puntuación filtrando solo puntuaciones > 0
CREATE OR REPLACE VIEW Vista_Contenido_Puntuacion AS
SELECT 
    c.ID_Contenido,
    c.Titulo,
    c.Puntuacion_Promedio,
    (SELECT AVG(Puntuacion_Promedio)
     FROM Contenido_AudioVisual 
     WHERE Puntuacion_Promedio > 0) AS Promedio_Global
FROM Contenido_AudioVisual c;

-- 5️⃣ Clientes que han visto más de 1 contenido
CREATE OR REPLACE VIEW Vista_Clientes_Varias_Vistas AS
SELECT 
    c.ID_Clientes,
    CONCAT(c.Nombre, ' ', c.Apellido) AS Nombre_Cliente,
    (SELECT COUNT(*) 
     FROM Vistas v 
     WHERE v.ID_Clientes = c.ID_Clientes) AS Total_Vistas
FROM Clientes c
WHERE (SELECT COUNT(*) 
       FROM Vistas v 
       WHERE v.ID_Clientes = c.ID_Clientes) > 1;

-- 6️⃣ Facturas con detalles de membresía (subconsulta para precio)
CREATE OR REPLACE VIEW Vista_Factura_Detalles AS
SELECT 
    f.id_factura,
    f.id_clientes,
    (SELECT CONCAT(c.nombre, ' ', c.apellido)
     FROM clientes c
     WHERE c.id_clientes = f.id_clientes) AS nombre_cliente,
    f.fecha_compra,
    (SELECT m.nommembresia
     FROM membresia m
     WHERE m.id_membresia = f.id_membresia) AS nom_membresia,
    (SELECT m.precio
     FROM membresia m
     WHERE m.id_membresia = f.id_membresia) AS precio
FROM factura f;



-- 7️⃣ Contenido por género (subconsulta para concatenar géneros)
CREATE OR REPLACE VIEW Vista_Contenido_Generos AS
SELECT 
    c.ID_Contenido,
    c.Titulo,
    (SELECT GROUP_CONCAT(g.NomGenero SEPARATOR ', ')
     FROM Genero_Contenido_AudioVisual gca
     JOIN Genero g ON gca.ID_Genero = g.ID_Genero
     WHERE gca.ID_Contenido = c.ID_Contenido) AS Generos
FROM Contenido_AudioVisual c;

-- 8️⃣ Actores con cantidad de contenidos
CREATE OR REPLACE VIEW Vista_Actor_Contenido AS
SELECT 
    a.ID_Actor,
    CONCAT(a.Nombre_Actor, ' ', a.Apellido_Actor) AS Nombre_Actor,
    (SELECT COUNT(*) 
     FROM Contenido_AudioVisual_Actor caa 
     WHERE caa.ID_Actor = a.ID_Actor) AS Total_Contenidos
FROM Actor a;

-- 9️⃣ Director con cantidad de contenidos dirigidos
CREATE OR REPLACE VIEW Vista_Director_Contenido AS
SELECT 
    d.ID_Director,
    CONCAT(d.Nombre_Director, ' ', d.Apellido_Director) AS Nombre_Director,
    (SELECT COUNT(*) 
     FROM Contenido_AudioVisual c 
     WHERE c.ID_Director = d.ID_Director) AS Total_Contenidos
FROM Director d;

-- 🔟 Clientes con últimas vistas (subconsulta para fecha de última vista)
CREATE OR REPLACE VIEW Vista_Clientes_Ultima_Vista AS
SELECT 
    c.ID_Clientes,
    CONCAT(c.Nombre, ' ', c.Apellido) AS Nombre_Cliente,
    (SELECT MAX(tiempo_visto) 
     FROM Vistas v 
     WHERE v.ID_Clientes = c.ID_Clientes) AS Ultima_Vista
FROM Clientes c;
