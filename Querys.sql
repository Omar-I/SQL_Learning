#Using sakila database for multiple querys. Can find it in: https://dev.mysql.com/doc/index-other.html
SELECT * FROM sakila.actor;
SELECT actor_id, first_name, last_name, last_update from sakila.actor;

#Cambiar el nombre de una o varias columnas
SELECT actor_id, first_name as Nombre, last_name as Apellido, last_name from sakila.actor;

#Consultar datos de otra tabla en la misma BD
SELECT * FROM sakila.city;

SELECT * FROM sakila.customer;

#Conocer los valores distintos de una columna de una BD
SELECT DISTINCT(store_id) from sakila.customer;


SELECT * FROM sakila.payment;
#DISTINCT permite conocer datos únicos o diferentes
SELECT DISTINCT (customer_id) from sakila.payment;


SELECT * FROM sakila.country;
#ORDER BY permite organizar los datos ascendentes o descendentes
#DESC Ordena de mayor a menor
SELECT * FROM sakila.country ORDER BY country DESC;

# ASC ordena de menor a mayor
SELECT * FROM sakila.country ORDER BY country ASC;

SELECT * FROM sakila.customer;
#Ordenando el first name de los clientes en orden ascendente
SELECT * FROM sakila.customer ORDER BY first_name ASC;


#Ejercicio práctico #4
#Consulta store_id, first_name y last_name de la tabla customer de la base de datos sakila.
SELECT store_id, first_name, last_name from sakila.customer;

#Cambia el nombre de las columnas store_id, first_name y last_name a Tienda, Nombre y Apellido respectivamente.
Select store_id AS Tienda, first_name as Nombre, last_name AS Apellido from sakila.customer;

#Ordena de manera descendente la columna Apellido
SELECT * FROM sakila.customer ORDER BY last_name DESC;

#O se puede hacer todo junto en una sola instruccion
select store_id as Tienda, first_name as Nombre, last_name as Apellido
from sakila.customer order by Apellido desc;

#Ejercicio práctico #5
#Consulta la tabla payment de la base de datos sakila.
SELECT * FROM sakila.payment;

#¿Cuál es la cantidad mas baja y mas alta de la columna amount?
select distinct amount from sakila.payment order by amount asc;

#Tambien se puede hacer uso de MIN y MAX (min_amount solo es el nombre del resultado en columna)
SELECT MIN(amount) min_amount FROM sakila.payment;
SELECT MAX(amount) max_amount FROM sakila.payment;


SELECT * FROM sakila.actor;
SELECT * FROM sakila.actor WHERE first_name = 'DAN';


#WHERE es para segmentar datos. Si buscamos texto, entonces se agrega 1 comilla simple
SELECT * FROM sakila.city;
SELECT * FROM sakila.city WHERE city = 'LONDON';
SELECT * FROM sakila.city WHERE country_id = 102;

SELECT * FROM sakila.customer;
SELECT * FROM sakila.customer WHERE store_id = 1;

#WHERE con operadores relacionales
SELECT * from sakila.inventory;
SELECT * from sakila.inventory WHERE film_id > 50;


SELECT * FROM sakila.payment;
SELECT * FROM sakila.payment WHERE amount <3;
#Si quiero buscar valores distintos, lo combino con DISTINCT
SELECT DISTINCT amount FROM sakila.payment WHERE amount <3;

#Traer datos que sean distintos a 2
SELECT * FROM sakila.staff;
SELECT * FROM sakila.staff WHERE staff_id <>2;

#El operador relacional <> me traerá datos distintos a German
SELECT * FROM sakila.language;
SELECT * FROM sakila.language WHERE name <> 'German';


#Ejercicio práctico #9
#Consulta description, release_year de la tabla film de la base de datos sakila.
#Filtra la información donde title sea IMPACT ALADDIN

SELECT * FROM sakila.film;
SELECT description, release_year FROM sakila.film WHERE title = 'IMPACT ALADDIN';

#Ejercicio práctico #10
#Consulta la tabla payment de la base de datos sakila.
#Filtra la información donde amount sea mayor a 0.99.

SELECT * FROM sakila.payment;
SELECT * FROM sakila.payment WHERE amount > 0.99;


#Operadores relacionales y lógicos(AND, OR, NOT)

SELECT * FROM sakila.country;
SELECT * FROM sakila.country WHERE country = 'Algeria' AND country_id = 2;


SELECT * FROM sakila.country;
SELECT * FROM sakila.country WHERE country = 'Algeria' OR country_id = 12;

SELECT * FROM sakila.language;
SELECT * FROM sakila.language WHERE language_id = 1 OR name = 'German';


SELECT * FROM sakila.category;
SELECT * FROM sakila.category WHERE NOT name = 'Action';

SELECT * FROM sakila.film;
SELECT * FROM sakila.film WHERE NOT rating = 'PG';

#Mostrar valores distintos de PG y únicos
SELECT DISTINCT (rating) from sakila.film WHERE NOT rating = 'PG';


#Ejercicio práctico #14
#Consulta la tabla payment de la base de datos sakila.
#Filtra la información donde customer_id sea igual a 36, amount sea mayor a 0.99 y staff_id sea igual a 1.
SELECT * FROM sakila.payment;
SELECT * FROM sakila.payment WHERE customer_id = 36 AND amount > 0.99 AND staff_id = 1;

#Ejercicio práctico #15
#Consulta la tabla rental de la base de datos sakila.
#Filtra la información donde staff_id no sea 1, customer_id sea mayor a 250 y inventory_id sea menor de 100.
SELECT * FROM sakila.rental;
SELECT * FROM sakila.rental WHERE NOT staff_id = 1 AND customer_id > 250 AND inventory_id < 100;

#OPERADORES DE COMPARACIÓN (IN)
#El operador IN de SQL filtra un conjunto de resultados en función de una lista de valores.
#El operador IN siempre se utiliza dentro de la cláusula WHERE.
SELECT * FROM sakila.customer;
SELECT * FROM sakila.customer WHERE first_name in ('MARY', 'PATRICIA');


SELECT * FROM sakila.film;
SELECT * FROM sakila.film WHERE special_features in ('Trailers', 'Deleted Scenes') AND rating in ('G', 'NC-17') AND length > 20;

#Se pueden combinar los operadores IN con NOT
SELECT * FROM sakila.category;
SELECT * FROM sakila.category WHERE name NOT IN ('Action', 'Animation', 'Children');

#Ejercicio práctico #19
#Consulta la tabla film_text de la base de datos sakila.
#Filtra la información donde title  sea ZORRO ARK, VIRGIN DAISY, UNITED PILOT
SELECT * FROM sakila.film_text;
SELECT * FROM sakila.film_text WHERE title in ('ZORRO ARK', 'VIRGIN DAISY', 'UNITED PILOT');

#Ejercicio práctico #20
#Consulta la tabla city de la base de datos sakila.
#Filtra la información donde city sea Chiayi, Dongying, Fukuyama y Kilis.
SELECT * FROM sakila.city;
SELECT * FROM sakila.city WHERE city IN ('Chiayi', 'Dongying', 'Fukuyama', 'Kilis');


#BETWEEN muestra datos en un rango determinado
SELECT * FROM sakila.rental;
SELECT * FROM sakila.rental WHERE (customer_id BETWEEN 300 AND 350) AND staff_id = 1;

#BETWEEN Con operadores NOT
SELECT * FROM sakila.payment;
SELECT * FROM sakila.payment WHERE amount NOT BETWEEN 3 AND 5;


#Ejercicio práctico #23
#Consulta la tabla payment de la base de datos sakila.
#Filtra la información donde amount esté entre 2.99 y 4.99,  staff_id sea igual a 2 y customer_id sea 1 y 2.

SELECT * FROM sakila.payment;
SELECT * FROM sakila.payment WHERE (amount BETWEEN 2.99 AND 4.99) AND staff_id = 2 AND customer_id IN (1,2);

#Ejercicio práctico #24
#Consulta la tabla address de la base de datos sakila.
#Filtra la información donde city_id esté entre 300 y 350

SELECT * FROM sakila.address;
SELECT * FROM sakila.address WHERE city_id BETWEEN 300 AND 350;

#Ejercicio práctico #25
#Consulta la tabla film de la base de datos sakila.
#Filtra la información donde rental_rate esté entre 0.99 y 2.99, length sea menor igual de 50  y replacement_cost sea menor de 20

SELECT * FROM sakila.film;
SELECT * FROM sakila.film WHERE (rental_rate BETWEEN 0.99 AND 2.99) AND length <= 50 AND replacement_cost < 20;


#Operador LIKE sirve para buscar un patrón específico de una columna
SELECT * FROM sakila.actor;
#'A%' muestra los valores de un string que EMPIECE con la letra A
SELECT * FROM sakila.actor WHERE first_name LIKE 'A%';
SELECT * FROM sakila.actor WHERE first_name LIKE 'A%' AND last_name LIKE 'B%';

#'%A' muestra los valores de un string que TERMINE con la letra A
SELECT * FROM sakila.actor WHERE first_name LIKE '%A';
SELECT * FROM sakila.actor WHERE first_name LIKE '%A' AND last_name LIKE '%N';

#%NE% muestra los valores de un string que contenga NE y se encuentren en cualquier posición
SELECT * FROM sakila.actor WHERE first_name LIKE '%NE%';
SELECT * FROM sakila.actor WHERE first_name LIKE '%NE%' AND last_name LIKE '%RO%';

#'C%N' muestra los valores de un string que EMPIECEN CON C y TERMINEN con N
SELECT * FROM sakila.actor WHERE first_name LIKE 'C%N';
SELECT * FROM sakila.actor WHERE first_name LIKE 'C%N' AND last_name LIKE 'G%';


#Ejercicio práctico #30
#Consulta la tabla film de la base de datos sakila.
#Filtra la información donde release_year sea igual a 2006  y title empiece con ALI.

SELECT * FROM sakila.film;
SELECT * FROM sakila.film WHERE release_year = 2006 AND title LIKE 'ALI%';


#JOINS EN SQL
#INNER JOIN une 2 tablas mediante 1 columna en común. (Solo une la cantidad de datos en común)
#LEFT JOIN UNE la tabla IZQUIERDA con la DERECHA y mantiene los datos de la tabla IZQUIERDA
#RIGHT JOIN UNE la tabla DERECHA con la IZQUIERDA y mantiene los datos de la tabla DERECHA


#INNER JOIN

SELECT * FROM sakila.film;
SELECT * FROM sakila.language;
#Opcion 1 mostrando todos los datos
SELECT * FROM sakila.film F INNER JOIN sakila.language L ON (F.language_id = L.language_id); 

#Opción 2 mostrando solo el title y columnas importantes omitiendo los NULL
SELECT F.title, F.description, F.release_year, F.language_id, L.name FROM sakila.film F INNER JOIN sakila.language L ON (F.language_id = L.language_id); 


SELECT * FROM sakila.address;
SELECT * FROM sakila.city;


SELECT * FROM sakila.address A INNER JOIN sakila.city C ON (A.city_id = C.city_id);
#Muestra la dirección de la tabla address (sakila.address) y la tabla ciudad (sakila.city)
SELECT a.address AS Direccion, c.city AS Ciudad FROM sakila.address A INNER JOIN sakila.city C ON (A.city_id = C.city_id);


#RIGHT JOIN

SELECT * FROM sakila.customer;
SELECT * FROM sakila.actor;

#Aqui haré un RIGHT JOIN de 2 tablas que no contienen ID (No es recomendable ya que no hay un identificador)
SELECT C.customer_id,
C.first_name,
C.last_name,
A.actor_id,
A.first_name,
A.last_name
FROM  sakila.customer C RIGHT JOIN sakila.actor A ON (C.last_name = A.last_name);


#LEFT JOIN mantiene toda la información de customer y unirá por actor.last_name
SELECT * FROM sakila.customer;
SELECT * FROM sakila.actor;

#La consulta se hace sin un identificador único, por lo cual tampoco es recomendable esta consulta porque los datos arrojados no serán del mismo registro
SELECT C.customer_id,
C.first_name,
C.last_name,
A.actor_id,
A.first_name,
A.last_name
FROM sakila.customer C LEFT JOIN sakila.actor A ON (c.last_name = A.last_name);


#Ejercicio práctico #36
#Consulta la tabla address de la base de datos sakila.
#Realiza un INNER JOIN con las tablas city y country
#Mostrar las columnas address, city, country

SELECT * FROM sakila.address;
SELECT * FROM sakila.city;
SELECT * FROM sakila.country;

SELECT A.address, CI.city, CO.country FROM sakila.address A
INNER JOIN sakila.city CI ON (A.city_id = CI.city_id)
INNER JOIN sakila.country CO ON (CI.country_id = CO.country_id);


#Ejercicio práctico #37
#Consulta la tabla customer de la base de datos sakila.
#Realiza un LEFT JOIN con las tablas store y address
#Mostrar las columnas first_name, address, store_id

SELECT * FROM sakila.customer;
SELECT * FROM sakila.address;
SELECT * FROM sakila.store;

SELECT C.first_name, A.address, S.store_id FROM sakila.customer C
LEFT JOIN sakila.store S ON (C.store_id = S.store_id)
LEFT JOIN sakila.address A ON (C.address_id = A.address_id);
# Si pongo ("S".address_id = A.address_id) en vez de (C.address_id = A.address_id), 
#me mostrará las direcciones de las tiendas donde los clientes compraron en vez de
#la dirección de los clientes.

#Ejercicio práctico #38
#Consulta la tabla rental de la base de datos sakila.
#Realiza un INNER JOIN con la tabla staff
#Mostrar las columnas rental_id, first_name

SELECT * FROM sakila.rental;
SELECT * FROM sakila.staff;

SELECT R.rental_id, S.first_name FROM sakila.rental R
INNER JOIN sakila.staff S ON (R.staff_id = S.staff_id);


#Funciones de agregación COUNT, AVG, SUM, MAX, MIN

#SUM
SELECT * FROM sakila.payment;

#Amount muestra la suma total de una columna
SELECT SUM(amount) FROM sakila.payment;

SELECT * FROM sakila.inventory;
#Sumando múltiples tablas
SELECT inventory_id + film_id + store_id FROM sakila.inventory;


#COUNT muestra el total de registros

SELECT * FROM sakila.actor;

SELECT COUNT(*) FROM sakila.actor;
SELECT COUNT(*) FROM sakila.address;
SELECT COUNT(*) FROM sakila.category;

#Tambien se puede hacer registros de una columna en específico(aunque
SELECT COUNT(first_name) FROM sakila.actor;


#AVERAGE muestra el promedio de una  tabla

SELECT * FROM sakila.payment;
SELECT AVG(amount) FROM sakila.payment;

SELECT* FROM sakila.film;
SELECT AVG(rental_duration) FROM sakila.film;

#MAX & MIN muestra los valores más altos o bajos de una columna

SELECT * FROM sakila.film;
SELECT MIN(length) FROM sakila.film;
SELECT MAX(length) FROM sakila.film;


#Ejercicio práctico #44
#Consulta la tabla rental de la base de datos sakila.
#Realiza un COUNT de  la columna rental_id

SELECT * FROM sakila.rental;
SELECT COUNT(rental_id) FROM sakila.rental;

#Ejercicio práctico #45
#Consulta la tabla payment de la base de datos sakila.
#Realiza un MAX de  la columna amount

SELECT * FROM sakila.payment;
SELECT MAX(amount) FROM sakila.payment;


#GROUP BY

SELECT last_name FROM sakila.actor;

SELECT last_name FROM sakila.actor
GROUP BY last_name;

#Muestra los datos de last_name sin repetir y agrega una columna contando cuantas veces están
SELECT last_name, COUNT(*) FROM sakila.actor
GROUP BY last_name;


SELECT * FROM sakila.payment;
SELECT * FROM sakila.customer;

#Este query muestra la cantidad de dinero que gastó un cliente y cuántas compras hizo
SELECT
C.customer_id,
C.first_name,
C.last_name,
SUM(p.amount), COUNT(*) FROM sakila.payment P
INNER JOIN sakila.customer C ON (C.customer_id = P.customer_id)
GROUP BY C.customer_id, C.first_name, C.last_name;
#Si reemplazo GROUP BY 1,2,3 es el mismo resultado del query(toma las columnas por el orden)


#Ejercicio práctico #48
#Consulta la tabla rental de la base de datos sakila.
#Realiza un MAX de  la columna rental_date 

SELECT * FROM sakila.rental;
SELECT customer_id, MAX(rental_date) FROM sakila.rental
GROUP BY customer_id;
#No tiene sentido que se agrupe por customer_id porque no tendría un orden cronológico


#HAVING

SELECT * FROM sakila.actor;
#Cuenta los apellidos individuales de la columna
SELECT last_name, COUNT(*) FROM sakila.actor GROUP BY 1;

#Muestra los apellidos que tengan más de 3 registros
SELECT last_name, COUNT(*) FROM sakila.actor GROUP BY 1
HAVING COUNT(*) > 3;

#Query que muestra el gasto menos a 100 que los clientes han hecho
SELECT * FROM sakila.payment;
SELECT C.customer_id, C.last_name, C.first_name,
SUM(p.amount) FROM sakila.payment P
INNER JOIN sakila.customer C ON (C.customer_id = P.customer_id)
GROUP BY 1,2,3 
HAVING SUM(P.amount) < 100
ORDER BY SUM(P.amount) DESC;

#Ejercicio práctico #51

#Consulta la tabla actor de la base de datos sakila.
#Realiza un COUNT de  last_name
#Mostrar cuando el COUNT sea mayor de 2

SELECT * FROM sakila.actor;

SELECT last_name, COUNT(*) FROM sakila.actor
GROUP BY last_name
HAVING COUNT(*) > 2;


#Ejercicios complementarios. #5

#¿Qué actores tienen el primer nombre 'Scarlett'?
SELECT * FROM sakila.actor;
SELECT actor_id, first_name, last_name FROM sakila.actor
WHERE first_name = "Scarlett";

#¿Qué actores tienen el apellido "Johansson"?
SELECT * FROM sakila.actor;
SELECT actor_id, first_name, last_name FROM sakila.actor
WHERE last_name = "Johansson";

#¿Cuántos apellidos de actores distintos hay?
SELECT * FROM sakila.actor;
SELECT COUNT(DISTINCT last_name) FROM sakila.actor;


#¿Qué apellidos no se repiten?
SELECT * FROM sakila.actor;
SELECT last_name FROM sakila.actor GROUP BY last_name HAVING COUNT(*) = 1;

#¿Qué actor ha aparecido en la mayoría de las películas?

select actor.actor_id, actor.first_name, actor.last_name,

       count(actor_id) as film_count

from actor join film_actor using (actor_id)

group by actor_id

order by film_count desc;

#¿Se puede alquilar ‘Academy Dinosaur’ en la tienda 1?
select film.film_id, film.title, store.store_id, inventory.inventory_id

from inventory join store using (store_id) join film using (film_id)

where film.title = 'Academy Dinosaur' and store.store_id = 1;





