-- Active: 1709092386717@@bjfetemvyhmxo8hrhrjh-mysql.services.clever-cloud.com@3306@bjfetemvyhmxo8hrhrjh


CREATE TABLE estudiantes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(45) NOT NULL,
    apellido VARCHAR(45) NOT NULL
);

CREATE TABLE materias(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_materia VARCHAR(60) NOT NULL
); 

CREATE TABLE notas(
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_estudiante INT,
    id_materia INT,
    nota DECIMAL(3, 1),
    CONSTRAINT fk_estudiante FOREIGN KEY (id_estudiante) REFERENCES estudiantes(id),
    CONSTRAINT fk_materia FOREIGN KEY (id_materia) REFERENCES materias(id)
);

INSERT INTO estudiantes (nombre, apellido) VALUES
    ('Richard', 'Montoya'),
    ('Sara', 'Garces'),
    ('Mateo', 'Saldarriaga'),
    ('Fulanita', 'Martínez'),
    ('Pepito', 'Rodríguez'),
    ('Ana', 'Sánchez'),
    ('David', 'Fernández'),
    ('Marta', 'González'),
    ('Alex', 'Rodríguez'),
    ('Julian', 'Roman');

INSERT INTO materias (nombre_materia) VALUES
    ('Matemáticas'),
    ('Español'),
    ('Filosofia'),
    ('Ciencias Naturales'),
    ('Inglés'),
    ('Educación Física'),
    ('Tecnología'),
    ('Música'),
    ('Artistica'),
    ('Geografía');

INSERT INTO notas (id_estudiante, id_materia, nota) VALUES
    (1, 1, 15.5),
    (1, 2, 14.2),
    (1, 3, 16.8),
    (2, 4, 12.7),
    (2, 5, 13.9),
    (2, 6, 14.6),
    (3, 7, 15.3),
    (3, 8, 17.2),
    (3, 9, 16.5),
    (4, 10, 14.8),
    (4, 1, 15.7),
    (4, 2, 16.1),
    (5, 3, 13.4),
    (5, 4, 12.9),
    (5, 5, 11.6),
    (6, 6, 14.3),
    (6, 7, 15.6),
    (6, 8, 13.9),
    (7, 9, 16.7),
    (7, 10, 15.2),
    (7, 1, 14.8),
    (8, 2, 17.5),
    (8, 3, 18.3),
    (8, 4, 15.9),
    (9, 5, 14.2),
    (9, 6, 13.7),
    (9, 7, 12.8),
    (10, 8, 15.1),
    (10, 9, 13.6),
    (10, 10, 14.9);

SELECT 
    e.nombre AS Nombre_Estudiante,
    e.apellido AS Apellido_Estudiante,
    m.nombre_materia AS Materia,
    n.nota AS Nota
FROM 
    notas n
JOIN 
    estudiantes e ON n.id_estudiante = e.id
JOIN 
    materias m ON n.id_materia = m.id;


SELECT 
    e.nombre AS Nombre_Estudiante,
    e.apellido AS Apellido_Estudiante,
    m.nombre_materia AS Materia,
    n.nota AS Nota
FROM 
    estudiantes e
JOIN 
    notas n ON e.id = n.id_estudiante
JOIN    
    materias m ON n.id_materia = m.id
WHERE e.nombre = 'Richard';