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

SELECT rating AS clasificacion, COUNT(*) AS recuento
	FROM film
    GROUP BY rating; 
    
-- -----------------------------------------------------

/* EJERCICIO 10: 

Encuentra la cantidad total de películas alquiladas por cada cliente y muestra el ID del cliente, su nombre y apellido junto con la cantidad de películas alquiladas. 

*/ 

SELECT * 
	FROM customer; 
    
SELECT * 
	FROM film; 
    
SELECT * 
	FROM rental; 

SELECT customer_id, first_name, last_name
	FROM customer; 
    
SELECT c. customer_id, c. first_name, c. last_name
	FROM customer AS c
    LEFT JOIN rental AS r
    ON c.customer_id = r.customer_id; 
    
SELECT c. customer_id, c. first_name, c. last_name
	FROM customer AS c
    LEFT JOIN rental AS r
    ON c.customer_id = r.customer_id
    GROUP BY c. customer_id, c. first_name, c. last_name; 
    
SELECT * 
	FROM rental; 
    
SELECT c. customer_id, c. first_name, c. last_name, COUNT(r.rental_id)
	FROM customer AS c
    LEFT JOIN rental AS r
    ON c.customer_id = r.customer_id
    GROUP BY c. customer_id, c. first_name, c. last_name; 
    
    
-- Query final: 
    
SELECT c. customer_id AS ID_Cliente, c. first_name AS Nombre, c. last_name AS Apellido, COUNT(r.rental_id) AS Cantidad_Películas_Alquiladas
	FROM customer AS c
    LEFT JOIN rental AS r
    ON c.customer_id = r.customer_id
    GROUP BY c. customer_id, c. first_name, c. last_name; 
-- -----------------------------------------------------

/* EJERCICIO 11: 

Encuentra la cantidad total de películas alquiladas por categoría y muestra el nombre de la categoría junto con el recuento de alquileres. 

*/

-- name en category, relacionada con category id en film category, recuento de alquileres rental 

SELECT *
	FROM category; 
    
SELECT *
	FROM rental; 

-- -----------------------------------------------------

/* EJERCICIO 12: 

Encuentra el promedio de duración de las películas para cada clasificación de la tabla film y muestra la clasificación junto con el promedio de duración. 

*/

SELECT * 
	FROM film; 
    
SELECT rating AS Clasificación, AVG(length) AS Promedio_De_Duración 
	FROM film
    GROUP BY rating; 

-- -----------------------------------------------------

/* EJERCICIO 13: 

Encuentra el nombre y apellido de los actores que aparecen en la película con title "Indian Love". 

*/

SELECT *
	FROM actor; 

SELECT * 
	FROM film_actor; 
    
SELECT actor_id, first_name, last_name
	FROM actor; 
    
SELECT actor_id, first_name, last_name
	FROM actor AS a
    INNER JOIN film_actor AS fa
    ON a.actor_id = fa.actor_id; 
    
SELECT first_name, last_name
	FROM actor AS a
    INNER JOIN film_actor AS fa
		ON a.actor_id = fa.actor_id
	INNER JOIN film AS f
		ON fa.film_id = f.film_id;
        
SELECT first_name, last_name
	FROM actor AS a
    INNER JOIN film_actor AS fa
		ON a.actor_id = fa.actor_id
	INNER JOIN film AS f
		ON fa.film_id = f.film_id
	WHERE f.title = 'Indian Love'; 


-- Query final: 

SELECT first_name AS Nombre, last_name AS Apellido
	FROM actor AS a
    INNER JOIN film_actor AS fa
		ON a.actor_id = fa.actor_id
	INNER JOIN film AS f
		ON fa.film_id = f.film_id
	WHERE f.title = 'Indian Love'; 
    
-- -----------------------------------------------------

/* EJERCICIO 14: 

Muestra el título de todas las películas que contengan la palabra "dog" o "cat" en su descripción.

*/

SELECT *
	FROM film; 
    
SELECT title, description
	FROM film
    WHERE description LIKE '%dog%' AND description LIKE '%cat%'; 

SELECT title
	FROM film
    WHERE description LIKE '%dog%' AND description LIKE '%cat%'; 

-- -----------------------------------------------------

/* EJERCICIO 15: 

Hay algún actor o actriz que no aparezca en ninguna película en la tabla film_actor.

*/

SELECT * 
	FROM film_actor; 
    
SELECT * 
	FROM actor; 

SELECT a.first_name, a.last_name
	FROM actor AS a
    LEFT JOIN film_actor AS fa
		ON a.actor_id = fa.actor_id;
        
        
-- query final: 

SELECT a.first_name, a.last_name
	FROM actor AS a
    LEFT JOIN film_actor AS fa
		ON a.actor_id = fa.actor_id
	WHERE fa.actor_id IS NULL;
    
-- -----------------------------------------------------

/* EJERCICIO 16: 

Encuentra el título de todas las películas que fueron lanzadas entre el año 2005 y 2010. 
 
*/

SELECT *
	FROM film; 

SELECT title, release_year
	FROM film
    WHERE release_year BETWEEN 2005 AND 2010; 


-- otra forma de consulta: 

SELECT title, release_year
	FROM film
    WHERE release_year IN (2005, 2006, 2007, 2008, 2009, 2010); 

-- -----------------------------------------------------

/* EJERCICIO 17: 

Encuentra el título de todas las películas que son de la misma categoría que "Family". 
 
*/

SELECT * 
	FROM film; 
    
SELECT * 
	FROM category; 

SELECT * 
	FROM film_category; 
    
SELECT title
	FROM film AS f
    INNER JOIN film_category AS fc
		ON f.film_id = fc.film_id; 


-- query final: 

SELECT title
	FROM film AS f
    INNER JOIN film_category AS fc
		ON f.film_id = fc.film_id
	INNER JOIN category AS c
		ON c.category_id = fc.category_id
	WHERE c.name = 'Family'; 


-- alternativa utilizando una subconsulta: 

SELECT * 
	FROM category; 

SELECT category_id
	FROM category
    WHERE name = 'Family'; 

SELECT title
	FROM film AS f
    INNER JOIN film_category AS fc
		ON f.film_id = fc.film_id
	WHERE fc.category_id = (SELECT category_id
								FROM category
								WHERE name = 'Family');
                                
-- -----------------------------------------------------

/* EJERCICIO 18: 

Muestra el nombre y apellido de los actores que aparecen en más de 10 películas. 

*/

SELECT * 
	FROM film_actor; 
    
SELECT * 
	FROM actor; 

SELECT a.first_name, a.last_name
	FROM actor AS a
    INNER JOIN film_actor AS fa
		ON a.actor_id = fa.actor_id;
        
SELECT a.first_name, a.last_name, fa.film_id
	FROM actor AS a
    INNER JOIN film_actor AS fa
		ON a.actor_id = fa.actor_id;
        
SELECT a.first_name, a.last_name, COUNT(fa.film_id)
	FROM actor AS a
    INNER JOIN film_actor AS fa
		ON a.actor_id = fa.actor_id
	GROUP BY a.actor_id;
    

-- query final: 

SELECT a.first_name AS Nombre, a.last_name AS Apellido, COUNT(fa.film_id) AS Numero_Películas
	FROM actor AS a
    INNER JOIN film_actor AS fa
		ON a.actor_id = fa.actor_id
	GROUP BY a.actor_id
    HAVING COUNT(fa.film_id) > 10;

-- -----------------------------------------------------

/* EJERCICIO 19: 

Encuentra el título de todas las películas que son "R" y tienen una duración mayor a 2 horas en la tabla film. 

*/

SELECT *
	FROM film; 
    
SELECT title, rating
	FROM film 
    WHERE rating = 'R'; 
    
SELECT title, rating, length
	FROM film 
    WHERE rating = 'R' AND length > 120; 
    

-- query final: 

SELECT title AS Nombre_Película
	FROM film 
    WHERE rating = 'R' AND length > 120; 
    
-- -----------------------------------------------------

/* EJERCICIO 20: 

Encuentra las categorías de películas que tienen un promedio de duración superior a 120 minutos y muestra el nombre de la categoría junto con el promedio de la duración. 

*/

-- -----------------------------------------------------

