/* Evaluación Final Módulo 2: SQL

EJERCICIO 1: 
· Selecciona todos los nombres de las películas sin que aparezcan duplicados. 

*/

USE sakila; 

SELECT *
	FROM film; 
    
SELECT title
	FROM film; 

-- -----------------------------------------------------

/* EJERCICIO 2: 

Muestra los nombres de todas las películas que tengan una clasificación de "PG-13". 

*/

SELECT * 	
	FROM film; 
    
SELECT title, rating
	FROM film
    WHERE rating IN ('PG-13'); 
    
-- -----------------------------------------------------

/* EJERCICIO 3: 

Encuentra el título y la descripción de todas las películas que contengan la palabra "amazing" en su descripción. 

*/

SELECT *
	FROM film; 
    
SELECT title, description
	FROM film
    WHERE description LIKE '%amazing%'; 

-- -----------------------------------------------------
    
/* EJERCICIO 4: 

Encuentra el título de todas las películas que tengan una duración mayor a 120 minutos. 

*/

SELECT * 
	FROM film; 
    
SELECT title, length
	FROM film
    WHERE length > 120; 

-- -----------------------------------------------------
    
/* EJERCICIO 5: 

Recupera los nombres de todos los actores. 

*/ 

SELECT *
	FROM actor; 
    
SELECT first_name AS nombre, last_name AS apellido
	FROM actor; 
    
SELECT CONCAT(first_name, ' ', last_name) AS nombre_completo 
	FROM actor; 

-- -----------------------------------------------------
    
/* EJERCICIO 6: 

Encuentra el nombre y apellido de los actores que tengan Gibson en su apellido. 

*/

SELECT *
	FROM actor; 
    
SELECT first_name AS nombre, last_name AS apellido
	FROM actor
    WHERE last_name LIKE '%Gibson%';

-- -----------------------------------------------------

/* EJERCICIO 7: 

Encuentra los nombres de los actores que tengan un actor_id entre 10 y 20. 

*/ 

SELECT * 
	FROM actor
    WHERE actor_id BETWEEN 10 and 20; 
    
-- -----------------------------------------------------

/* EJERCICIO 8: 

Encuentra el título de las películas en la tabla film que no sean ni "R" ni "PG-13" en cuanto a tu clasificación. 

*/

SELECT * 
	FROM film; 

SELECT title, rating
	FROM film
    WHERE rating NOT IN ('R', 'PG-13'); 

-- -----------------------------------------------------

/* EJERCICIO 9: 

Encuentra la cantidad total de películas en cada clasificación de la tabla film y muestra la clasificación junto con el recuento. 

*/

SELECT *
	FROM film; 
    
SELECT COUNT(*), rating
	FROM film
    GROUP BY rating; 
