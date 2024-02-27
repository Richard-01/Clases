SHOW DATABASES;


CREATE TABLE students(
    id INT PRIMARY KEY AUTO_INCREMENT,
    namess VARCHAR(45),
    lastname VARCHAR(45),
    email VARCHAR(150),
    dateofbirth DATE
);

SELECT namess, lastname FROM students;

INSERT INTO students (namess, lastname, email, dateofbirth) VALUES ('testt', 'testt', 'test2@gmail.com', '2024-02-27')


/*1. Listado de todos los usuarios con solo los nombres, apellidos y edad, que tengan 20 años de edad.*/
SELECT nombres, apellidos, edad FROM users WHERE edad = 20;
/*2. Listado de todas las mujeres en la base de datos que tengan entre 20 y 30 años de edad.*/
SELECT nombres, apellidos, genero, edad FROM users WHERE genero = 'M' AND edad BETWEEN 20 AND 30;

/*3. Quién es la persona con menos edad de la base de datos.*/
SELECT min(edad) AS edad_minima FROM users;
/*4. Cuantos usuarios hay registrados en la base de datos.*/

SELECT COUNT(id) AS total_usuarios FROM users;
/*5.Traer los 5 primeros usuarios de la base de datos*/
SELECT * from users ORDER BY id LIMIT 5;
/*6. Traer los 10 últimos usuarios de la base de datos*/
SELECT * from users ORDER BY id DESC LIMIT 10;

/*7. Listar usuarios que su correo finalice en .net*/
SELECT * FROM users WHERE correo LIKE '%.net';
/*8. Listar usuarios no vivan en  colombia.*/
SELECT * FROM users WHERE pais NOT LIKE 'colombia';
/*9. Listar usuarios que no vivan en ecuador y panamá.*/
SELECT * FROM users WHERE pais != 'panama' and pais != 'ecuador';
/*10. Cuantos(numero) usuarios son de colombia y les gusta el rock.*/
SELECT COUNT(pais) AS usuarios_Colombianos, musica, pais  FROM users WHERE pais = 'colombia' AND musica = 'rock'; 
/*11. Actualizar el género musical de todos los usuarios de la base de datos de "metal" a "carranga".*/
UPDATE users SET musica = 'carranga' WHERE musica = 'metal';
/*12. Listado de hombres que les guste la "carranga" sean de colombia y tengan entre 10 y 20 años de edad.*/
SELECT * FROM users WHERE genero = 'H' AND pais = 'colombia' AND musica = 'carranga' AND edad BETWEEN 10 AND 20;
/*13. Actualizar a todos los usuarios que tengan 99 años, su nuevo género musical favorito será la "carranga"*/
UPDATE users SET musica = 'carranga' WHERE edad = 99;
/*14. Listar todos los usuarios que su nombre inicie con "a","A"*/
SELECT * FROM users WHERE nombres LIKE 'a%' and nombres LIKE 'A%';
/*15. Listar todos los usuarios que su apellido finalice en "z","Z"*/
SELECT * FROM users WHERE apellidos LIKE '%z' and apellidos LIKE '%Z';
/*16. Actualizar los usuarios que tengan 50 años de edad su nuevo género musical será NULL*/
UPDATE users SET musica = 'NULL' WHERE edad = 50;
/*17. Listar todos los usuarios que su género musical sea igual a NULL*/
SELECT * FROM users WHERE musica = 'NULL';
/*18. Cual es el resultado de la suma de todas las edades de la base de datos.*/
SELECT SUM(edad) as suma_total FROM users;
/*19. Cuantos usuarios tenemos registrados de "ecuador"*/
SELECT COUNT(pais) AS usuarios_ecuatorianos FROM users WHERE pais = 'ecuador'; 
/*20. Cuántos usuarios son de Colombia y les gusta el vallenato.*/
SELECT COUNT(pais) AS usuarios_vallenato, pais, musica FROM users WHERE musica = 'vallenato' and pais = 'colombia'; 



