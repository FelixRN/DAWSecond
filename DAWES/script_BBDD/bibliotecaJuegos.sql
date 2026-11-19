-- ============================================================
--  BIBLIOTECA DE VIDEOJUEGOS (GameVault) - Base de datos
--  Desarrollo Web en Entorno Servidor - DAW
--  Compatible con MySQL 8.x
--  Las fechas de los datos de ejemplo son RELATIVAS a CURDATE(),
--  así que el script sirve en cualquier curso.
-- ============================================================
DROP DATABASE IF EXISTS biblioteca;
CREATE DATABASE biblioteca CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE biblioteca;

CREATE TABLE plataformas (
  id      INT AUTO_INCREMENT PRIMARY KEY,
  nombre  VARCHAR(40) NOT NULL UNIQUE
);

CREATE TABLE desarrolladoras (
  id      INT AUTO_INCREMENT PRIMARY KEY,
  nombre  VARCHAR(60) NOT NULL UNIQUE,
  pais    VARCHAR(40) NOT NULL
);

CREATE TABLE videojuegos (
  id                INT AUTO_INCREMENT PRIMARY KEY,
  titulo            VARCHAR(100) NOT NULL,
  anio_lanzamiento  SMALLINT NOT NULL,
  pegi              TINYINT NOT NULL,
  id_desarrolladora INT NOT NULL,
  CONSTRAINT chk_pegi CHECK (pegi IN (3,7,12,16,18)),
  CONSTRAINT fk_juego_dev FOREIGN KEY (id_desarrolladora) REFERENCES desarrolladoras(id)
);

CREATE TABLE copias (
  id                INT AUTO_INCREMENT PRIMARY KEY,
  codigo_inventario VARCHAR(10) NOT NULL UNIQUE,
  id_videojuego     INT NOT NULL,
  id_plataforma     INT NOT NULL,
  estado            VARCHAR(12) NOT NULL DEFAULT 'BUENO',   -- NUEVO, BUENO, DESGASTADO, DANADO
  activa            BOOLEAN NOT NULL DEFAULT TRUE,
  CONSTRAINT chk_estado CHECK (estado IN ('NUEVO','BUENO','DESGASTADO','DANADO')),
  CONSTRAINT fk_copia_juego FOREIGN KEY (id_videojuego) REFERENCES videojuegos(id),
  CONSTRAINT fk_copia_plat  FOREIGN KEY (id_plataforma) REFERENCES plataformas(id)
);

CREATE TABLE socios (
  id               INT AUTO_INCREMENT PRIMARY KEY,
  nombre           VARCHAR(40) NOT NULL,
  apellidos        VARCHAR(80) NOT NULL,
  email            VARCHAR(100) NOT NULL UNIQUE,
  fecha_nacimiento DATE NOT NULL,
  fecha_alta       DATE NOT NULL,
  activo           BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE prestamos (
  id                INT AUTO_INCREMENT PRIMARY KEY,
  id_socio          INT NOT NULL,
  id_copia          INT NOT NULL,
  fecha_prestamo    DATE NOT NULL,
  fecha_limite      DATE NOT NULL,
  fecha_devolucion  DATE NULL,                       -- NULL = todavía sin devolver
  multa             DECIMAL(6,2) NOT NULL DEFAULT 0,
  CONSTRAINT fk_prestamo_socio FOREIGN KEY (id_socio) REFERENCES socios(id),
  CONSTRAINT fk_prestamo_copia FOREIGN KEY (id_copia) REFERENCES copias(id)
);

-- VISTA PARA INDICAR SI UN VIDEOJUEGO ESTA DISPONIBLE Y EL NUMERO DE COPIAS
CREATE OR REPLACE VIEW v_videojuegos_detalle AS
SELECT 
    v.id, 
    v.titulo, 
    v.anio_lanzamiento, 
    v.pegi, 
    v.id_desarrolladora, 
    d.nombre AS desarrolladora,
    -- 1. Copias totales del videojuego
    (SELECT COUNT(*) 
     FROM copias c 
     WHERE c.id_videojuego = v.id) AS copias_totales,
     
    -- 2. Copias disponibles (activas y sin préstamo abierto)
    (SELECT COUNT(*) 
     FROM copias c 
     WHERE c.id_videojuego = v.id 
       AND c.activa = 1 
       AND NOT EXISTS (
           SELECT 1 FROM prestamos pr 
           WHERE pr.id_copia = c.id AND pr.fecha_devolucion IS NULL
       )) AS copias_disponibles
FROM videojuegos v 
JOIN desarrolladoras d ON d.id = v.id_desarrolladora;


-- ---------- DATOS DE EJEMPLO ----------

INSERT INTO plataformas (nombre) VALUES
  ('PC'),
  ('PlayStation 5'),
  ('Xbox Series X|S'),
  ('Nintendo Switch'),
  ('Nintendo Switch 2');

INSERT INTO desarrolladoras (nombre, pais) VALUES
  ('Nintendo', 'Japón'),
  ('CD Projekt Red', 'Polonia'),
  ('Rockstar Games', 'Estados Unidos'),
  ('Santa Monica Studio', 'Estados Unidos'),
  ('FromSoftware', 'Japón'),
  ('Supergiant Games', 'Estados Unidos'),
  ('Team Cherry', 'Australia'),
  ('Mojang Studios', 'Suecia'),
  ('ConcernedApe', 'Estados Unidos'),
  ('Valve', 'Estados Unidos'),
  ('Hazelight Studios', 'Suecia'),
  ('Asobo Studio', 'Francia'),
  ('The Game Kitchen', 'España'),
  ('Sandfall Interactive', 'Francia'),
  ('Maddy Makes Games', 'Canadá');

INSERT INTO videojuegos (titulo, anio_lanzamiento, pegi, id_desarrolladora) VALUES
  ('The Legend of Zelda: Breath of the Wild', 2017, 12, 1),
  ('Super Mario Odyssey', 2017, 7, 1),
  ('Mario Kart 8 Deluxe', 2017, 3, 1),
  ('Animal Crossing: New Horizons', 2020, 3, 1),
  ('Mario Kart World', 2025, 3, 1),
  ('The Witcher 3: Wild Hunt', 2015, 18, 2),
  ('Cyberpunk 2077', 2020, 18, 2),
  ('Red Dead Redemption 2', 2018, 18, 3),
  ('God of War Ragnarök', 2022, 18, 4),
  ('Elden Ring', 2022, 16, 5),
  ('Hades', 2020, 12, 6),
  ('Hollow Knight', 2017, 7, 7),
  ('Hollow Knight: Silksong', 2025, 7, 7),
  ('Minecraft', 2011, 7, 8),
  ('Stardew Valley', 2016, 12, 9),
  ('Portal 2', 2011, 12, 10),
  ('It Takes Two', 2021, 12, 11),
  ('A Plague Tale: Requiem', 2022, 16, 12),
  ('Blasphemous', 2019, 16, 13),
  ('Clair Obscur: Expedition 33', 2025, 16, 14),
  ('Celeste', 2018, 7, 15);

INSERT INTO copias (codigo_inventario, id_videojuego, id_plataforma, estado, activa) VALUES
  ('CP-0001', 1, 4, 'BUENO', 1),
  ('CP-0002', 1, 4, 'BUENO', 1),
  ('CP-0003', 2, 4, 'BUENO', 1),
  ('CP-0004', 3, 4, 'BUENO', 1),
  ('CP-0005', 3, 4, 'BUENO', 1),
  ('CP-0006', 4, 4, 'BUENO', 1),
  ('CP-0007', 5, 5, 'NUEVO', 1),
  ('CP-0008', 6, 1, 'BUENO', 1),
  ('CP-0009', 6, 2, 'BUENO', 1),
  ('CP-0010', 7, 1, 'BUENO', 1),
  ('CP-0011', 7, 3, 'BUENO', 1),
  ('CP-0012', 8, 2, 'BUENO', 1),
  ('CP-0013', 9, 2, 'BUENO', 1),
  ('CP-0014', 9, 2, 'DESGASTADO', 1),
  ('CP-0015', 10, 1, 'BUENO', 1),
  ('CP-0016', 10, 2, 'BUENO', 1),
  ('CP-0017', 11, 1, 'BUENO', 1),
  ('CP-0018', 11, 4, 'BUENO', 1),
  ('CP-0019', 12, 4, 'BUENO', 1),
  ('CP-0020', 12, 1, 'BUENO', 1),
  ('CP-0021', 13, 4, 'NUEVO', 1),
  ('CP-0022', 14, 4, 'BUENO', 1),
  ('CP-0023', 14, 1, 'BUENO', 1),
  ('CP-0024', 14, 3, 'BUENO', 1),
  ('CP-0025', 15, 4, 'BUENO', 1),
  ('CP-0026', 15, 1, 'BUENO', 1),
  ('CP-0027', 16, 1, 'DANADO', 0),
  ('CP-0028', 17, 2, 'DESGASTADO', 1),
  ('CP-0029', 17, 3, 'BUENO', 1),
  ('CP-0030', 18, 3, 'BUENO', 1),
  ('CP-0031', 19, 1, 'BUENO', 1),
  ('CP-0032', 19, 4, 'BUENO', 1),
  ('CP-0033', 20, 2, 'NUEVO', 1),
  ('CP-0034', 21, 4, 'BUENO', 1),
  ('CP-0035', 21, 1, 'DESGASTADO', 1);

INSERT INTO socios (nombre, apellidos, email, fecha_nacimiento, fecha_alta, activo) VALUES
  ('Lucía', 'Fernández Ruiz', 'lucia.fernandez@mail.test', DATE_SUB(CURDATE(), INTERVAL 28 YEAR) - INTERVAL 47 DAY, DATE_SUB(CURDATE(), INTERVAL 145 DAY), 1),
  ('Marcos', 'Gil Prieto', 'marcos.gil@mail.test', DATE_SUB(CURDATE(), INTERVAL 35 YEAR) - INTERVAL 84 DAY, DATE_SUB(CURDATE(), INTERVAL 170 DAY), 1),
  ('Paula', 'Ortega Marín', 'paula.ortega@mail.test', DATE_SUB(CURDATE(), INTERVAL 15 YEAR) - INTERVAL 121 DAY, DATE_SUB(CURDATE(), INTERVAL 195 DAY), 1),
  ('Hugo', 'Sanz Calvo', 'hugo.sanz@mail.test', DATE_SUB(CURDATE(), INTERVAL 11 YEAR) - INTERVAL 158 DAY, DATE_SUB(CURDATE(), INTERVAL 220 DAY), 1),
  ('Irene', 'Vázquez León', 'irene.vazquez@mail.test', DATE_SUB(CURDATE(), INTERVAL 22 YEAR) - INTERVAL 45 DAY, DATE_SUB(CURDATE(), INTERVAL 245 DAY), 1),
  ('Daniel', 'Cruz Soto', 'daniel.cruz@mail.test', DATE_SUB(CURDATE(), INTERVAL 41 YEAR) - INTERVAL 82 DAY, DATE_SUB(CURDATE(), INTERVAL 270 DAY), 0),
  ('Carmen', 'Rojo Iglesias', 'carmen.rojo@mail.test', DATE_SUB(CURDATE(), INTERVAL 19 YEAR) - INTERVAL 119 DAY, DATE_SUB(CURDATE(), INTERVAL 295 DAY), 1),
  ('Álvaro', 'Méndez Pardo', 'alvaro.mendez@mail.test', DATE_SUB(CURDATE(), INTERVAL 17 YEAR) - INTERVAL 156 DAY, DATE_SUB(CURDATE(), INTERVAL 320 DAY), 1),
  ('Sofía', 'Blanco Nieto', 'sofia.blanco@mail.test', DATE_SUB(CURDATE(), INTERVAL 30 YEAR) - INTERVAL 43 DAY, DATE_SUB(CURDATE(), INTERVAL 345 DAY), 1),
  ('Pablo', 'Herrero Gómez', 'pablo.herrero@mail.test', DATE_SUB(CURDATE(), INTERVAL 26 YEAR) - INTERVAL 80 DAY, DATE_SUB(CURDATE(), INTERVAL 370 DAY), 1);

INSERT INTO prestamos (id_socio, id_copia, fecha_prestamo, fecha_limite, fecha_devolucion, multa) VALUES
  (1, 17, DATE_SUB(CURDATE(), INTERVAL 90 DAY), DATE_SUB(CURDATE(), INTERVAL 83 DAY), DATE_SUB(CURDATE(), INTERVAL 84 DAY), 0.00),
  (1, 34, DATE_SUB(CURDATE(), INTERVAL 60 DAY), DATE_SUB(CURDATE(), INTERVAL 53 DAY), DATE_SUB(CURDATE(), INTERVAL 53 DAY), 0.00),
  (2, 15, DATE_SUB(CURDATE(), INTERVAL 80 DAY), DATE_SUB(CURDATE(), INTERVAL 73 DAY), DATE_SUB(CURDATE(), INTERVAL 68 DAY), 2.50),
  (2, 23, DATE_SUB(CURDATE(), INTERVAL 50 DAY), DATE_SUB(CURDATE(), INTERVAL 43 DAY), DATE_SUB(CURDATE(), INTERVAL 45 DAY), 0.00),
  (3, 4, DATE_SUB(CURDATE(), INTERVAL 45 DAY), DATE_SUB(CURDATE(), INTERVAL 38 DAY), DATE_SUB(CURDATE(), INTERVAL 38 DAY), 0.00),
  (3, 26, DATE_SUB(CURDATE(), INTERVAL 30 DAY), DATE_SUB(CURDATE(), INTERVAL 23 DAY), DATE_SUB(CURDATE(), INTERVAL 21 DAY), 1.00),
  (4, 6, DATE_SUB(CURDATE(), INTERVAL 40 DAY), DATE_SUB(CURDATE(), INTERVAL 33 DAY), DATE_SUB(CURDATE(), INTERVAL 36 DAY), 0.00),
  (7, 10, DATE_SUB(CURDATE(), INTERVAL 70 DAY), DATE_SUB(CURDATE(), INTERVAL 63 DAY), DATE_SUB(CURDATE(), INTERVAL 63 DAY), 0.00),
  (9, 28, DATE_SUB(CURDATE(), INTERVAL 55 DAY), DATE_SUB(CURDATE(), INTERVAL 48 DAY), DATE_SUB(CURDATE(), INTERVAL 47 DAY), 0.50),
  (9, 13, DATE_SUB(CURDATE(), INTERVAL 35 DAY), DATE_SUB(CURDATE(), INTERVAL 28 DAY), DATE_SUB(CURDATE(), INTERVAL 29 DAY), 0.00),
  (10, 19, DATE_SUB(CURDATE(), INTERVAL 25 DAY), DATE_SUB(CURDATE(), INTERVAL 18 DAY), DATE_SUB(CURDATE(), INTERVAL 18 DAY), 0.00),
  (8, 31, DATE_SUB(CURDATE(), INTERVAL 20 DAY), DATE_SUB(CURDATE(), INTERVAL 13 DAY), DATE_SUB(CURDATE(), INTERVAL 17 DAY), 0.00),
  (5, 3, DATE_SUB(CURDATE(), INTERVAL 65 DAY), DATE_SUB(CURDATE(), INTERVAL 58 DAY), DATE_SUB(CURDATE(), INTERVAL 55 DAY), 1.50),
  (2, 8, DATE_SUB(CURDATE(), INTERVAL 2 DAY), DATE_SUB(CURDATE(), INTERVAL -5 DAY), NULL, 0.00),
  (2, 12, DATE_SUB(CURDATE(), INTERVAL 3 DAY), DATE_SUB(CURDATE(), INTERVAL -4 DAY), NULL, 0.00),
  (2, 18, DATE_SUB(CURDATE(), INTERVAL 1 DAY), DATE_SUB(CURDATE(), INTERVAL -6 DAY), NULL, 0.00),
  (5, 16, DATE_SUB(CURDATE(), INTERVAL 20 DAY), DATE_SUB(CURDATE(), INTERVAL 13 DAY), NULL, 0.00),
  (1, 7, DATE_SUB(CURDATE(), INTERVAL 1 DAY), DATE_SUB(CURDATE(), INTERVAL -2 DAY), NULL, 0.00),
  (7, 21, DATE_SUB(CURDATE(), INTERVAL 2 DAY), DATE_SUB(CURDATE(), INTERVAL -1 DAY), NULL, 0.00),
  (10, 33, DATE_SUB(CURDATE(), INTERVAL 2 DAY), DATE_SUB(CURDATE(), INTERVAL -1 DAY), NULL, 0.00);
