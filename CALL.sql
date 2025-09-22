-- ==================== Departamentos ====================
CALL Datos_Departamento(1, 'Antioquia');
CALL Datos_Departamento(2, 'Cundinamarca');
CALL Datos_Departamento(3, 'Valle del Cauca');
CALL Datos_Departamento(4, 'Santander');
CALL Datos_Departamento(5, 'Bolivar');
CALL Datos_Departamento(6, 'Magdalena');
CALL Datos_Departamento(7, 'Cesar');
CALL Datos_Departamento(8, 'Risaralda');
CALL Datos_Departamento(9, 'Quindio');
CALL Datos_Departamento(10, 'Nariño');

-- ==================== Ciudades ====================
CALL Datos_Ciudad(1, 'Medellín', 1);
CALL Datos_Ciudad(2, 'Bogotá', 2);
CALL Datos_Ciudad(3, 'Cali', 3);
CALL Datos_Ciudad(4, 'Bucaramanga', 4);
CALL Datos_Ciudad(5, 'Cartagena', 5);
CALL Datos_Ciudad(6, 'Santa Marta', 6);
CALL Datos_Ciudad(7, 'Valledupar', 7);
CALL Datos_Ciudad(8, 'Pereira', 8);
CALL Datos_Ciudad(9, 'Armenia', 9);
CALL Datos_Ciudad(10, 'Pasto', 10);
CALL Datos_Ciudad(11, 'Envigado', 1);
CALL Datos_Ciudad(12, 'Soacha', 2);

-- ==================== Géneros ====================
CALL Datos_Genero(1, 'Hombre');
CALL Datos_Genero(2, 'Mujer');
CALL Datos_Genero(3, 'Otro');

-- ==================== Directores ====================
CALL Datos_Director('Christopher', 'Nolan', 1001, 1970);
CALL Datos_Director('Steven', 'Spielberg', 1002, 1946);
CALL Datos_Director('Quentin', 'Tarantino', 1003, 1963);
CALL Datos_Director('Martin', 'Scorsese', 1004, 1942);
CALL Datos_Director('James', 'Cameron', 1005, 1954);
CALL Datos_Director('Patricia', 'Smith', 1006, 1980);
CALL Datos_Director('John', 'Doe', 1007, 1975);
CALL Datos_Director('Sofia', 'Coppola', 1008, 1971);

-- ==================== Actores ====================
CALL Datos_Actor('Leonardo', 'DiCaprio', 2001);
CALL Datos_Actor('Brad', 'Pitt', 2002);
CALL Datos_Actor('Morgan', 'Freeman', 2003);
CALL Datos_Actor('Scarlett', 'Johansson', 2004);
CALL Datos_Actor('Robert', 'Downey', 2005);
CALL Datos_Actor('Emma', 'Stone', 2006);
CALL Datos_Actor('Tom', 'Hanks', 2007);
CALL Datos_Actor('Natalie', 'Portman', 2008);
CALL Datos_Actor('Chris', 'Evans', 2009);
CALL Datos_Actor('Gal', 'Gadot', 2010);

-- ==================== Clientes ====================
CALL Datos_Cliente('Carlos', 'Gomez', 'Colombiana', 'carlos@example.com', '3216549870', '1995-05-15', '1234', 1, 1);
CALL Datos_Cliente('Ana', 'Martinez', 'Colombiana', 'ana@example.com', '3126549871', '1989-08-22', '5678', 2, 2);
CALL Datos_Cliente('Luis', 'Perez', 'Colombiana', 'luis@example.com', '3116549872', '2000-02-10', '9101', 1, 3);
CALL Datos_Cliente('Sofia', 'Ramirez', 'Colombiana', 'sofia@example.com', '3106549873', '1992-11-05', 'abcd', 2, 4);
CALL Datos_Cliente('Juan', 'Torres', 'Colombiana', 'juan@example.com', '3136549874', '1987-07-20', 'efgh', 1, 5);
CALL Datos_Cliente('Maria', 'Lopez', 'Colombiana', 'maria@example.com', '3176549875', '1990-12-01', 'ijkl', 2, 6);
CALL Datos_Cliente('Pedro', 'Mendez', 'Colombiana', 'pedro@example.com', '3146549876', '1985-03-30', 'mnop', 1, 7);

-- ==================== Contenido Audiovisual ====================
CALL Datos_Contenido('Inception', '2010-07-16', 'Dream-sharing technology used for corporate espionage.', '02:28:00', '13', 'English', 'https://youtu.be/YoHD9XEInc0', 'USA', 9.0, 'https://example.com/inception');
CALL Datos_Contenido('Titanic', '1997-12-19', 'Romance aboard the ill-fated Titanic.', '03:14:00', '13', 'English', 'https://youtu.be/kVrqfYjkTdQ', 'USA', 8.5, 'https://example.com/titanic');
CALL Datos_Contenido('Jurassic Park', '1993-06-11', 'Dinosaurs escape from a theme park.', '02:07:00', '13', 'English', 'https://youtu.be/QWBKEmWWL38', 'USA', 8.1, 'https://example.com/jurassic');
CALL Datos_Contenido('The Godfather', '1972-03-24', 'Story of a mafia family.', '02:55:00', '18', 'English', 'https://youtu.be/sY1S34973zA', 'USA', 9.2, 'https://example.com/godfather');
CALL Datos_Contenido('Pulp Fiction', '1994-10-14', 'Interconnected stories of crime in LA.', '02:34:00', '18', 'English', 'https://youtu.be/s7EdQ4FqbhY', 'USA', 8.9, 'https://example.com/pulpfiction');
CALL Datos_Contenido('Avengers: Endgame', '2019-04-26', 'Heroes assemble to undo Thanos.', '03:01:00', '13', 'English', 'https://youtu.be/TcMBFSGVi1c', 'USA', 8.4, 'https://example.com/endgame');

-- ==================== Género por Contenido ====================
CALL Datos_Genero_Contenido(1, 1); 
CALL Datos_Genero_Contenido(2, 2); 
CALL Datos_Genero_Contenido(3, 1);

-- ==================== Vistas ====================
CALL Datos_Vistas(1, 1, b'1', '01:20:35');
CALL Datos_Vistas(2, 2, b'0', '00:40:00');
CALL Datos_Vistas(3, 3, b'1', '02:00:00');
CALL Datos_Vistas(4, 4, b'0', '00:15:00');

-- ==================== Membresías ====================
CALL Datos_Membresia('Básica', 15000, '2025-06-30', 'https://example.com/basic.jpg', 'Acceso limitado');
CALL Datos_Membresia('Premium', 30000, '2025-06-30', 'https://example.com/premium.jpg', 'Acceso ilimitado');
CALL Datos_Membresia('Familiar', 45000, '2025-06-30', 'https://example.com/family.jpg', '4 dispositivos');

-- ==================== Facturas ====================
CALL Datos_Factura(1, 1, '2024-06-10');
CALL Datos_Factura(2, 1, '2024-06-15');
CALL Datos_Factura(3, 2, '2024-06-20');

