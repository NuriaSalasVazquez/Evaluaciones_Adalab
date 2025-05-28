###########################################################################################
#######################   EJERCICIOS EVALUACION MODULO 2  #################################

 -- 1. Selecciona todos los nombres de las películas sin que aparezcan duplicados.
 
 SELECT DISTINCT title
   FROM film;
   
   
-- 2. Muestra los nombres de todas las películas que tengan una clasificación de "PG-13".
   
SELECT title
     FROM film
     WHERE rating="PG-13";
     
-- 3.Encuentra el título y la descripción de todas las películas que contengan la palabra "amazing" en su descripcion
				
SELECT title,description
      FROM film
      WHERE description LIKE "%amazing%";
      
### comodines ne LIKE "%" representa cualquier cantidad de caracteres, incluyendo ninguno.



-- 4. Encuentra el título de todas las películas que tengan una duración mayor a 120 minutos.

SELECT title
   FROM film
   WHERE length>120;
   
-- 5.. Recupera los nombres de todos los actores

SELECT CONCAT(first_name,' ',last_name) AS name
  FROM actor;
  
###La función CONCAT en SQL se usa para concatenar (unir) dos o más cadenas de texto en una sola. Es una función muy útil cuando necesitas combinar valores de diferentes columnas o valores literales dentro de una consulta.
  

-- 6. Encuentra el nombre y apellido de los actores que tengan "Gibson" en su apellido.

SELECT first_name,last_name
   FROM actor 
   WHERE last_name LIKE "%Gibson%";
   
-- 7. Encuentra los nombres de los actores que tengan un actor_id entre 10 y 20.

SELECT CONCAT(first_name,' ', last_name) AS name
   FROM actor
   WHERE actor_id BETWEEN 10 AND 20;
   
   
   
-- 8. Encuentra el título de las películas en la tabla film que no sean ni "R" ni "PG-13" en cuanto a su clasificacion.


SELECT title
   FROM film 
   WHERE rating NOT IN ("R","PG-13"); 
   

-- 9.Encuentra la cantidad total de películas en cada clasificación de la tabla film y muestra la clasificacion junto al recuento.

SELECT rating, COUNT(film_id) AS film_id_rating
   FROM film
   GROUP BY rating;
   
   
-- 10.Encuentra la cantidad total de películas alquiladas por cada cliente y muestra el ID del cliente, su nombre y apellido junto con la cantidad de películas alquiladas.

SELECT r.customer_id,c.first_name,c.last_name, COUNT(r.rental_id) AS total_peliculas_alquiladas
FROM rental AS r
INNER JOIN customer AS c
USING (customer_id)
GROUP BY r.customer_id,r.customer_id,c.first_name,c.last_name;


-- 11.Encuentra la cantidad total de películas alquiladas por categoría y muestra el nombre de la categoría junto con el recuento de alquileres


SELECT c.name, COUNT(r.rental_id) AS total_alquileres
   FROM category AS c
   INNER JOIN film_category AS f
   USING (category_id)
   INNER JOIN inventory AS i
   USING (film_id)
   INNER JOIN rental AS r
   USING (inventory_id)
   GROUP BY name;
   
   
-- 12.Encuentra el promedio de duración de las películas para cada clasificación de la tabla film y muestra la clasificación junto con el promedio de duración.


SELECT rating, ROUND(AVG(length),2) AS prom_duracion
   FROM film
   GROUP BY rating
   ORDER BY prom_duracion DESC;
   
   ### ROUND() es una función que redondea un número a una cantidad específica de decimales.
## El primer parámetro de ROUND() es el valor que deseas redondear (en este caso, el resultado de AVG(length)).
## El segundo parámetro indica la cantidad de decimales a los que deseas redondear el número.

   
-- 13.Encuentra el nombre y apellido de los actores que aparecen en la película con title "Indian Love".

SELECT a.first_name,a.last_name
   FROM actor AS a
   INNER JOIN film_actor AS fa
   USING(actor_id)
   INNER JOIN film AS f
   USING (film_id)
   WHERE f.title="Indian Love";
   

-- 14.Muestra el título de todas las películas que contengan la palabra "dog" o "cat" en su descripción.


SELECT title
   FROM film
   WHERE description LIKE "%dog%" OR description LIKE "%cat%";
   
-- 15.Hay algún actor o actriz que no aparezca en ninguna película en la tabla film_actor.

#### Te devuelve la tabla vacía si no hay ningún actor sin película ###
SELECT a.first_name, a.last_name
   FROM actor AS a
   LEFT JOIN film_actor AS fa
   USING (actor_id)
   WHERE fa.actor_id IS NULL;
   
   
        ###Se usa LEFT JOIN ###
       ## Devuelve todos los actores (actor), aunque no tengan coincidencias en film_actor.
	   ## Se filtra con WHERE fa.actor_id IS NULL:		
       ## fa.actor_id será NULL si un actor no tiene películas en film_actor.

   
#### Te contesta con un SI O un NO a la pregunta de "¿Hay algún actor o actriz que no aparezcan en ninuna pelicula en la tabla film_actor?

SELECT IF(COUNT(*) > 0, 'Sí', 'No') AS hay_actores_sin_peliculas
   FROM actor AS a
   LEFT JOIN film_actor AS fa
   USING (actor_id)
   WHERE fa.actor_id IS NULL;

   
   
                 ### COUNT(*) > 0 ###
## COUNT(*) cuenta cuántas filas devuelve la consulta.
## Si hay al menos un actor sin películas, COUNT(*) > 0 será TRUE (verdadero).
## Si no hay ningún actor sin películas, COUNT(*) > 0 será FALSE (falso).
        
                 ### IF(condición, valor_si_verdadero, valor_si_falso) ###
## Si COUNT(*) > 0 es verdadero, la función devuelve "Sí".
## Si COUNT(*) > 0 es falso, la función devuelve "No".
   


-- 16.Encuentra el título de todas las películas que fueron lanzadas entre el año 2005 y 2010.


SELECT title
   FROM film
   WHERE release_year BETWEEN 2005 AND 2010;
   
   
-- 17.Encuentra el título de todas las películas que son de la misma categoría que "Family".

SELECT f.title
    FROM film AS f
    INNER JOIN film_category AS fc
    USING(film_id)
    INNER JOIN category AS c
    USING (category_id)
    WHERE c.name="Family";
    


-- 18.Muestra el nombre y apellido de los actores que aparecen en más de 10 películas.



SELECT a.first_name, a.last_name
   FROM actor AS a
   INNER JOIN film_actor AS fa
   USING (actor_id)
   GROUP BY a.first_name, a.last_name
   HAVING COUNT(fa.film_id)>10;
   
 
## Se usa GROUP BY correctamente con a.first_name y a.last_name.
## se usa HAVING COUNT(fa.film_id) > 10 para filtrar actores con más de 10 películas.



-- 19. Encuentra el título de todas las películas que son "R" y tienen una duración mayor a 2 horas en la tabla film.


SELECT title,rating AS clasificacion, length As duracion
   FROM film
   WHERE rating="R" AND length>120;
   
   
-- 20.Encuentra las categorías de películas que tienen un promedio de duración superior a 120 minutos y muestra el nombre de la categoría junto con el promedio de duración.

SELECT c.name,ROUND(AVG(f.length),2) AS duracion_media
   FROM category AS c
   INNER JOIN film_category AS fc
   USING (category_id)
   INNER JOIN film AS f
   USING (film_id)
   GROUP BY c.name
   HAVING AVG(f.length)>120;
   
   
-- 21.Encuentra los actores que han actuado en al menos 5 películas y muestra el nombre del actor junto con la cantidad de películas en las que han actuado.


SELECT CONCAT(a.first_name,' ',a.last_name) AS name, COUNT(f.film_id) AS num_peliculas
   FROM actor AS a
   INNER JOIN film_actor AS fa
   USING (actor_id)
   INNER JOIN film AS f
   USING (film_id)
   GROUP BY a.first_name,a.last_name
   HAVING COUNT(f.film_id)>=5;
   
   
  -- 22. Encuentra el título de todas las películas que fueron alquiladas por más de 5 días. Utiliza una
               -- subconsulta para encontrar los rental_ids con una duración superior a 5 días y luego selecciona las peliculas correspondientes.

                         ### QUERY DEFINITIVA ###
                         
SELECT f.title
   FROM film AS f
   INNER JOIN inventory AS i
   USING (film_id)
   INNER JOIN rental AS r
   USING (inventory_id)
   WHERE r.rental_id IN(
                  SELECT rental_id
                     FROM rental
					 WHERE DATEDIFF(return_date, rental_date) > 5);




             ###subconsulta para encontrar los rental_ids con una duración superior a 5 días 


SELECT rental_id
   FROM rental
   WHERE DATEDIFF(return_date, rental_date) > 5;

                    ##### DATEDIFF(return_date, rental_date) #####
##DATEDIFF es una función en MySQL que calcula la diferencia en días entre dos fechas.
##Toma dos parámetros: return_date (la fecha de devolución del alquiler) y rental_date (la fecha en que se alquiló la película).
## La función devuelve un número entero que representa la cantidad de días entre las dos fechas.



-- 23.Encuentra el nombre y apellido de los actores que no han actuado en ninguna película de la categoría "Horror". Utiliza una subconsulta para encontrar los actores que han actuado en películas de la
                      -- categoría "Horror" y luego exclúyelos de la lista de actores.
                      
                                     ## QUERY DEFINITIVA ##
                                     
                                     
SELECT first_name, last_name
   FROM actor
   WHERE (first_name,last_name) NOT IN (   # en un principio me dió problemas al no meter las dos columnas entre parentesis) 
				                        SELECT a.first_name, a.last_name
							               FROM actor AS a
							               INNER JOIN film_actor AS fa
										   USING (actor_id)
							               INNER JOIN film_category AS fc
							               USING (film_id)
							               INNER JOIN category AS c
							               USING (category_id)
							               WHERE c.name="Horror");
     
     
          
               ### Subconsulta nombres de actores que aprecen en peliculas de "Horror".	
    
SELECT a.first_name, a.last_name
	 FROM actor AS a
	 INNER JOIN film_actor AS fa
	 USING (actor_id)
	 INNER JOIN film_category AS fc
	 USING (film_id)
	 INNER JOIN category AS c
	 USING (category_id)
	 WHERE c.name="Horror";
     
     
-- 24.Encuentra el título de las películas que son comedias y tienen una duración mayor a 180 minutos en la tabla film.

     SELECT f.title
        FROM film AS f
        INNER JOIN film_category AS fc
        USING (film_id)
        INNER JOIN category AS c
        USING (category_id)
        WHERE c.name="Comedy" AND f.length>180;
        
        
        
     
	
