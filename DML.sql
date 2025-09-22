/* ==================== Género ==================== */
INSERT INTO genero (id_genero, nomgenero) VALUES 
    (1, 'Hombre'),
    (2, 'Mujer'),
    (3, 'Otro')
ON DUPLICATE KEY UPDATE nomgenero = VALUES(nomgenero);

/* ==================== Departamento ==================== */
INSERT INTO departamento (codigo_departamento, nombre_departamento) VALUES 
    (1, 'Antioquia'),
    (2, 'Cundinamarca'),
    (3, 'Valle del Cauca'),
    (4, 'Santander'),
    (5, 'Bolivar'),
    (6, 'Magdalena'),
    (7, 'Cesar'),
    (8, 'Risaralda'),
    (9, 'Quindio'),
    (10, 'Nariño')
ON DUPLICATE KEY UPDATE nombre_departamento = VALUES(nombre_departamento);

/* ==================== Ciudad ==================== */
INSERT INTO ciudad (codiciudad, nombre_ciudad, codigo_departamento) VALUES 
    (1, 'Medellín', 1),
    (2, 'Bogotá', 2),
    (3, 'Cali', 3),
    (4, 'Bucaramanga', 4),
    (5, 'Cartagena', 5),
    (6, 'Santa Marta', 6),
    (7, 'Valledupar', 7),
    (8, 'Pereira', 8),
    (9, 'Armenia', 9),
    (10, 'Pasto', 10),
    (11, 'Envigado', 1),
    (12, 'Soacha', 2)
ON DUPLICATE KEY UPDATE nombre_ciudad = VALUES(nombre_ciudad), codigo_departamento = VALUES(codigo_departamento);

/* ==================== Cliente ==================== */
INSERT INTO clientes (nombre, apellido, nacionalidad, id_genero, correo, telefono, nacimiento, codiciudad, password)
SELECT 
    'Ana', 
    'Ramírez', 
    'Colombiana',
    g.id_genero,
    'ana.ramireza@example.com', 
    '3004567890', 
    '1995-04-12',
    c.codiciudad,
    SHA2('MiClave123', 256)
FROM genero g
JOIN ciudad c ON c.nombre_ciudad = 'Bogotá'
WHERE g.nomgenero = 'Mujer'
  AND NOT EXISTS (
      SELECT 1 FROM clientes cl WHERE cl.correo = 'ana.ramireza@example.com'
  );

/* ==================== Consultas de verificación ==================== */
SELECT * FROM actor;
SELECT * FROM ciudad;
SELECT * FROM clientes;
SELECT * FROM contenido_audiovisual;
SELECT * FROM contenido_audiovisual_actor;
SELECT * FROM departamento;
SELECT * FROM director;
SELECT * FROM factura;
SELECT * FROM genero;
SELECT * FROM genero_contenido_audiovisual;
SELECT * FROM membresia;
SELECT * FROM vistas;




