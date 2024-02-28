-- Active: 1708954583649@@bpgsebwzgfge9hk5k2jf-mysql.services.clever-cloud.com@3306@bpgsebwzgfge9hk5k2jf

CREATE TABLE marca (
    id INT PRIMARY KEY AUTO_INCREMENT,
    marca VARCHAR(45) NOT NULL
);

CREATE TABLE tipo_vehiculo(
    id INT PRIMARY KEY AUTO_INCREMENT,
    tipos_vehiculo VARCHAR(60) NOT NULL,
    id_marca INT,
    CONSTRAINT fk_marca FOREIGN KEY (id_marca) REFERENCES marca(id)
); 

CREATE TABLE colores(
    id INT PRIMARY KEY AUTO_INCREMENT,
    color VARCHAR(60) NOT NULL
); 

CREATE TABLE vehiculos(
    id INT PRIMARY KEY AUTO_INCREMENT,
    modelo VARCHAR(45) NOT NULL,
    placa VARCHAR(45) NOT NULL,
    id_colores INT,
    id_tipo_vehiculo INT,
    id_marca_tipo INT,
    CONSTRAINT fk_marca_id FOREIGN KEY (id_marca_tipo) REFERENCES marca(id),
    CONSTRAINT fk_tipo_vehiculo FOREIGN KEY (id_tipo_vehiculo) REFERENCES tipo_vehiculo(id),
    CONSTRAINT fk_colores FOREIGN KEY (id_colores) REFERENCES colores(id)
);

INSERT INTO marca (marca) VALUES
    ('Audi'),
    ('BMW');

INSERT INTO tipo_vehiculo (tipos_vehiculo, id_marca ) VALUES
    ('Deportivo', 1),
    ('camioneta', 2);

INSERT INTO colores (color) VALUES
    ('Azul Nebulosa'),
    ('Negro Mate');



INSERT INTO vehiculos (modelo, placa, id_colores, id_tipo_vehiculo, id_marca_tipo)
VALUES
    ('Modelo1', 'Placa1', 1, 1, 2),
    ('Modelo2', 'Placa2', 2, 2, 1),
    ('Modelo3', 'Placa3', 1, 1, 2),
    ('Modelo4', 'Placa4', 2, 2, 1),
    ('Modelo5', 'Placa5', 1, 1, 2),
    ('Modelo6', 'Placa6', 2, 2, 1),
    ('Modelo7', 'Placa7', 1, 1, 2),
    ('Modelo8', 'Placa8', 2, 2, 2),
    ('Modelo9', 'Placa9', 1, 1, 2),
    ('Modelo10', 'Placa10', 1, 1, 2);


SELECT * FROM colores;
SELECT * FROM marca;
SELECT * FROM tipo_vehiculo;

CREATE PROCEDURE ObtenerMarcas(IN marca_vehiculo VARCHAR(45))
BEGIN
    SELECT v.modelo, v.placa, c.color, tv.tipos_vehiculo, m.marca
    FROM vehiculos v
    JOIN 
        colores c ON v.id_colores = c.id
    JOIN 
        tipo_vehiculo tv ON v.id_tipo_vehiculo = tv.id
    JOIN 
        marca m ON v.id_marca_tipo = m.id
    WHERE marca = marca_vehiculo;
END

CALL ObtenerMarcas('audi')