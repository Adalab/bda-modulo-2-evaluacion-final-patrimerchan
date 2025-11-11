/* Evaluación Final Módulo 2: SQL

EJERCICIO 1: 
· Selecciona todos los nombres de las películas sin que aparezcan duplicados. 
*/

USE sakila; 

SELECT *
	FROM film; 
    
SELECT title
	FROM film; 

SELECT DISTINCT title
	FROM film; 

-- -----------------------------------------------------

/* EJERCICIO 2: 
· Muestra los nombres de todas las películas que tengan una clasificación de "PG-13". 
*/

SELECT * 	
	FROM film; 

-- Query final: 
SELECT title, rating
	FROM film
    WHERE rating = 'PG-13'; 
    
-- Alternativa: 
SELECT title, rating
	FROM film
    WHERE rating IN ('PG-13'); 
    
-- -----------------------------------------------------

/* EJERCICIO 3: 
· Encuentra el título y la descripción de todas las películas que contengan la palabra "amazing" en su descripción. 
*/

SELECT *
	FROM film; 
    
SELECT title, description
	FROM film
    WHERE description LIKE '%amazing%'; 

-- -----------------------------------------------------
    
/* EJERCICIO 4: 
· Encuentra el título de todas las películas que tengan una duración mayor a 120 minutos. 
*/

SELECT * 
	FROM film; 
    
SELECT title, length
	FROM film
    WHERE length > 120; 
    
-- Query final: 
SELECT title 
	FROM film
    WHERE length > 120; 
    
-- -----------------------------------------------------
    
/* EJERCICIO 5: 
· Recupera los nombres de todos los actores. 
*/ 

SELECT *
	FROM actor; 
    
SELECT first_name AS nombre, last_name AS apellido
	FROM actor; 
    
SELECT CONCAT(first_name, ' ', last_name) AS nombre_completo 
	FROM actor; 

-- -----------------------------------------------------
    
/* EJERCICIO 6: 
· Encuentra el nombre y apellido de los actores que tengan Gibson en su apellido. 
*/

SELECT *
	FROM actor; 
    
SELECT first_name AS nombre, last_name AS apellido
	FROM actor
    WHERE last_name LIKE '%Gibson%';

-- -----------------------------------------------------

/* EJERCICIO 7: 
· Encuentra los nombres de los actores que tengan un actor_id entre 10 y 20. 
*/ 

SELECT * 
	FROM actor
    WHERE actor_id BETWEEN 10 and 20; 
    
-- Query final: 
SELECT first_name, last_name
	FROM actor
    WHERE actor_id BETWEEN 10 and 20; 
    
-- -----------------------------------------------------

/* EJERCICIO 8: 
· Encuentra el título de las películas en la tabla film que no sean ni "R" ni "PG-13" en cuanto a tu clasificación. 
*/

SELECT * 
	FROM film; 

SELECT title, rating
	FROM film
    WHERE rating NOT IN ('R', 'PG-13'); 

-- -----------------------------------------------------

/* EJERCICIO 9: 
· Encuentra la cantidad total de películas en cada clasificación de la tabla film y muestra la clasificación junto con el recuento. 
*/

SELECT *
	FROM film; 
    
SELECT COUNT(*), rating
	FROM film
    GROUP BY rating; 

SELECT rating AS clasificacion, COUNT(*) AS Recuento
	FROM film
    GROUP BY rating; 
    
-- -----------------------------------------------------

/* EJERCICIO 10: 
· Encuentra la cantidad total de películas alquiladas por cada cliente y muestra el ID del cliente, su nombre y apellido junto con la cantidad de películas alquiladas. 
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
· Encuentra la cantidad total de películas alquiladas por categoría y muestra el nombre de la categoría junto con el recuento de alquileres. 
*/

SELECT *
	FROM category; 
    
SELECT *
	FROM rental; 
    
SELECT * 
	FROM film_category; 
    
SELECT *
	FROM inventory; 

SELECT *
	FROM rental; 

SELECT c.name 
	FROM category AS c
    INNER JOIN film_category as fc
		ON c.category_id = fc.category_id; 
        
SELECT c.name, f.title 
	FROM category AS c
    INNER JOIN film_category as fc
		ON c.category_id = fc.category_id 
	INNER JOIN film AS f
		ON fc.film_id = f.film_id; 

SELECT *
	FROM inventory; 
    
SELECT * 
	FROM film; 
    
SELECT c.name, f.title 
	FROM category AS c
    INNER JOIN film_category as fc
		ON c.category_id = fc.category_id 
	INNER JOIN film AS f
		ON fc.film_id = f.film_id
	INNER JOIN inventory AS i
		ON f.film_id = i.film_id;
        
SELECT *
	FROM rental; 
    
SELECT c.name, f.title 
	FROM category AS c
    INNER JOIN film_category as fc
		ON c.category_id = fc.category_id 
	INNER JOIN film AS f
		ON fc.film_id = f.film_id
	INNER JOIN inventory AS i
		ON f.film_id = i.film_id
	INNER JOIN rental AS r
		ON i.inventory_id = r.inventory_id;
        
SELECT c.name AS Categoría, f.title, r.rental_id
	FROM category AS c
    INNER JOIN film_category as fc
		ON c.category_id = fc.category_id 
	INNER JOIN film AS f
		ON fc.film_id = f.film_id
	INNER JOIN inventory AS i
		ON f.film_id = i.film_id
	INNER JOIN rental AS r
		ON i.inventory_id = r.inventory_id;

-- Query final: 
SELECT c.name AS Categoría, COUNT(r.rental_id) AS Recuento_De_Alquileres
	FROM category AS c
    INNER JOIN film_category as fc
		ON c.category_id = fc.category_id 
	INNER JOIN film AS f
		ON fc.film_id = f.film_id
	INNER JOIN inventory AS i
		ON f.film_id = i.film_id
	INNER JOIN rental AS r
		ON i.inventory_id = r.inventory_id
	GROUP BY c.name;
-- -----------------------------------------------------

/* EJERCICIO 12: 
· Encuentra el promedio de duración de las películas para cada clasificación de la tabla film y muestra la clasificación junto con el promedio de duración. 
*/

SELECT * 
	FROM film; 
    
SELECT rating AS Clasificación, AVG(length) AS Promedio_De_Duración 
	FROM film
    GROUP BY rating; 

-- -----------------------------------------------------

/* EJERCICIO 13: 
· Encuentra el nombre y apellido de los actores que aparecen en la película con title "Indian Love". 
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
· Muestra el título de todas las películas que contengan la palabra "dog" o "cat" en su descripción.
*/

SELECT *
	FROM film; 
    
SELECT title, description -- query con comprobación 
	FROM film
    WHERE description LIKE '%dog%' OR description LIKE '%cat%'; 

-- Query final: 
SELECT title
	FROM film
    WHERE description LIKE '%dog%' OR description LIKE '%cat%'; 

-- -----------------------------------------------------

/* EJERCICIO 15: 
· Hay algún actor o actriz que no aparezca en ninguna película en la tabla film_actor.
*/

SELECT * 
	FROM film_actor; 
    
SELECT * 
	FROM actor; 

SELECT a.first_name, a.last_name
	FROM actor AS a
    LEFT JOIN film_actor AS fa
		ON a.actor_id = fa.actor_id;
        
-- Query final: 
SELECT a.first_name, a.last_name
	FROM actor AS a
    LEFT JOIN film_actor AS fa
		ON a.actor_id = fa.actor_id
	WHERE fa.actor_id IS NULL;
    
-- -----------------------------------------------------

/* EJERCICIO 16: 
· Encuentra el título de todas las películas que fueron lanzadas entre el año 2005 y 2010. 
*/

SELECT *
	FROM film; 

-- Query final: 
SELECT title, release_year
	FROM film
    WHERE release_year BETWEEN 2005 AND 2010; 

-- Otra forma de consulta: 
SELECT title, release_year
	FROM film
    WHERE release_year IN (2005, 2006, 2007, 2008, 2009, 2010); 

-- -----------------------------------------------------

/* EJERCICIO 17: 
· Encuentra el título de todas las películas que son de la misma categoría que "Family". 
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

-- Query final: 
SELECT title
	FROM film AS f
    INNER JOIN film_category AS fc
		ON f.film_id = fc.film_id
	INNER JOIN category AS c
		ON c.category_id = fc.category_id
	WHERE c.name = 'Family'; 

-- Alternativa utilizando una subconsulta: 
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
· Muestra el nombre y apellido de los actores que aparecen en más de 10 películas. 
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
    
-- Query final: 
SELECT a.first_name AS Nombre, a.last_name AS Apellido
	FROM actor AS a
    INNER JOIN film_actor AS fa
		ON a.actor_id = fa.actor_id
	GROUP BY a.actor_id, a.first_name, a.last_name
    HAVING COUNT(fa.film_id) > 10;

-- -----------------------------------------------------

/* EJERCICIO 19: 
· Encuentra el título de todas las películas que son "R" y tienen una duración mayor a 2 horas en la tabla film. 
*/

SELECT *
	FROM film; 
    
SELECT title, rating
	FROM film 
    WHERE rating = 'R'; 
    
SELECT title, rating, length
	FROM film 
    WHERE rating = 'R' AND length > 120; 
    
-- Query final: 
SELECT title AS Nombre_Película
	FROM film 
    WHERE rating = 'R' AND length > 120; 
    
-- -----------------------------------------------------

/* EJERCICIO 20: 
· Encuentra las categorías de películas que tienen un promedio de duración superior a 120 minutos y muestra el nombre de la categoría junto con el promedio de la duración. 
*/

SELECT *
	FROM category; 
    
SELECT * 
	FROM film_category; 
    
SELECT *
	FROM film;

SELECT name
	FROM category AS a
    INNER JOIN film_category AS fc
		ON a.category_id = fc.category_id; 

SELECT a.name
	FROM category AS a
    INNER JOIN film_category AS fc
		ON a.category_id = fc.category_id
	GROUP BY a.name; 
        
SELECT a.name
	FROM category AS a
    INNER JOIN film_category AS fc
		ON a.category_id = fc.category_id
	INNER JOIN film AS f
		ON f.film_id = fc.film_id
	GROUP BY a.name
    HAVING AVG(length) > 120; 

-- Query final: 
SELECT a.name, AVG(f.length) AS Promedio_Duración
	FROM category AS a
    INNER JOIN film_category AS fc
		ON a.category_id = fc.category_id
	INNER JOIN film AS f
		ON f.film_id = fc.film_id
	GROUP BY a.name
    HAVING AVG(f.length) > 120; 
    
-- -----------------------------------------------------

/* EJERCICIO 21: 
· Encuentra los actores que han actuado en al menos 5 películas y muestra el nombre del actor junto con la cantidad de películas en las que han actuado.
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

-- Query final: 
SELECT a.first_name AS Nombre, a.last_name AS Apellido, COUNT(fa.film_id) AS Numero_Películas
	FROM actor AS a
    INNER JOIN film_actor AS fa
		ON a.actor_id = fa.actor_id
	GROUP BY a.actor_id, a.first_name, a.last_name
    HAVING COUNT(fa.film_id) >= 5;

-- -----------------------------------------------------

/* EJERCICIO 22: 
· Encuentra el título de todas las películas que fueron alquiladas por más de 5 días. Utiliza una subconsulta para encontrar los rental_ids con una duración superior a 5 días y luego selecciona las películas correspondientes. 
*/

SELECT * 
	FROM rental; 
    
SELECT rental_id, rental_date, return_date
	FROM rental; 
    
SELECT rental_id, return_date, rental_date
	FROM rental
    WHERE (return_date - rental_date) > 5; 

SELECT *
	FROM film; 

SELECT f.title
	FROM film AS f
    INNER JOIN inventory AS i
		ON i.film_id = f.film_id;

SELECT * 
	FROM rental; 
    
SELECT f.title
	FROM film AS f
    INNER JOIN inventory AS i
		ON i.film_id = f.film_id
	INNER JOIN rental AS r
		ON r.inventory_id = i.inventory_id;
    
SELECT f.title
	FROM film AS f
    INNER JOIN inventory AS i
		ON i.film_id = f.film_id
	INNER JOIN rental AS r
		ON r.inventory_id = i.inventory_id
	WHERE r.rental_id IN (SELECT rental_id
							FROM rental
							WHERE (return_date - rental_date) > 5);

-- Query final: 
SELECT DISTINCT f.title
	FROM film AS f
    INNER JOIN inventory AS i
		ON i.film_id = f.film_id
	INNER JOIN rental AS r
		ON r.inventory_id = i.inventory_id
	WHERE r.rental_id IN (SELECT rental_id
							FROM rental
							WHERE (return_date - rental_date) > 5);
                            
-- -----------------------------------------------------

/* EJERCICIO 23: 
· Encuentra el nombre y apellido de los actores que no han actuado en ninguna película de la categoría "Horror". Utiliza una subconsulta para encontrar los actores que han actuado en las películas de la categoría "Horror" y luego exclúyelos de la lista de actores. 
*/

SELECT * 
	FROM film; 
    
SELECT * 
	FROM category; 

SELECT * 
	FROM film_category; 

SELECT * 
	FROM actor; 
    
SELECT * 
	FROM film_actor; 
    
SELECT category_id
	FROM category
    WHERE name = 'Horror';
    
SELECT a.actor_id, a.first_name, a.last_name 
	FROM actor AS a
    INNER JOIN film_actor AS fa
		ON a.actor_id = fa.actor_id; 
        
SELECT a.actor_id, a.first_name, a.last_name 
	FROM actor AS a
    INNER JOIN film_actor AS fa
		ON a.actor_id = fa.actor_id
	INNER JOIN film_category AS fc
		ON fa.film_id = fc.film_id;

SELECT a.actor_id, a.first_name, a.last_name 
	FROM actor AS a
    INNER JOIN film_actor AS fa
		ON a.actor_id = fa.actor_id
	INNER JOIN film_category AS fc
		ON fa.film_id = fc.film_id
	INNER JOIN category AS c
		ON c.category_id = fc.category_id; 
     
SELECT a.actor_id, a.first_name, a.last_name 
	FROM actor AS a
    INNER JOIN film_actor AS fa
		ON a.actor_id = fa.actor_id
	INNER JOIN film_category AS fc
		ON fa.film_id = fc.film_id
	INNER JOIN category AS c
		ON c.category_id = fc.category_id
	WHERE c.name = 'Horror'; 
    
SELECT a.actor_id, a.first_name, a.last_name 
	FROM actor AS a
    WHERE a.actor_id NOT IN ( SELECT fa.actor_id
								FROM film_actor AS fa
								INNER JOIN film_category AS fc
									ON fa.film_id = fc.film_id
								INNER JOIN category AS c
									ON c.category_id = fc.category_id
								WHERE c.name = 'Horror'); 

-- Query final: 
SELECT a.first_name AS Nombre, a.last_name AS Apellido
	FROM actor AS a
    WHERE a.actor_id NOT IN ( SELECT fa.actor_id
								FROM film_actor AS fa
								INNER JOIN film_category AS fc
									ON fa.film_id = fc.film_id
								INNER JOIN category AS c
									ON c.category_id = fc.category_id
								WHERE c.name = 'Horror'); 
    
-- -----------------------------------------------------

/* EJERCICIO 24: 
· Encuentra el título de las películas que son comedias y tienen una duración mayor a 180 minutos en la tabla film. 
*/

SELECT * 
	FROM category; 

SELECT category_id
	FROM category
    WHERE name = 'Comedy';
    
-- Query final: 
SELECT title
	FROM film AS f
    INNER JOIN film_category AS fc
		ON f.film_id = fc.film_id
	WHERE fc.category_id = (SELECT category_id
								FROM category
								WHERE name = 'Comedy' AND f.length > 180);

-- -----------------------------------------------------
