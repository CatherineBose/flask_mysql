What query would you run to get all the customers inside city_id = 312? 
Your query should return customer first name, last name, email, and address.

SELECT  customer.first_name, customer.last_name, customer.email, address.address, address. address2, address.district, address.city_id, address.postal_code
FROM customer 
join address 
ON address.address_id = customer.address_id
Join city
ON city.city_id = address.city_id
WHERE  city.city_id = 312

2. What query would you run to get all comedy films? 
Your query should return film title, description, 
release year, rating, special features, and genre (category).

SELECT film.title, film.description, film.release_year, film.rating, film.special_features,  category.name
from film
Join film_category
ON film_category.film_id = film.film_id
Join category
on category.category_id = film_category.category_id
WHERE category.name= "comedy";

3. What query would you run to get all the films joined by actor_id=5? 
Your query should return the actor id, actor name, film title, description, and release year.

SELECT actor.actor_id, actor.first_name, actor.last_name, film.title, film.description, film.release_year
from film
Join film_actor
ON film_actor.film_id = film.film_id
Join actor
on actor.actor_id = film_actor.actor_id
WHERE actor.actor_id= 5;

4. What query would you run to get all the customers in store_id = 1 and inside these cities (1, 42, 312 and 459)? 
Your query should return customer first name, last name, email, and address.
SELECT customer.first_name, customer.last_name, customer.email, address.address, city.city_id, store.store_id
From store 
JOIN customer
on customer.store_id = store.store_id
JOIN address 
on customer.address_id = address.address_id
JOIN city
on address.city_id = city.city_id
WHERE  city.city_id in(1, 42, 312 , 459) and store.store_id=1;

5.What query would you run to get all the films with a "rating = G" and "special feature = behind the scenes", 
joined by actor_id = 15? Your query should return the film title, description, release year, rating, 
and special feature. Hint: You may use LIKE function in getting the 'behind the scenes' part.


SELECT actor.actor_id, actor.first_name, actor.last_name, film.title, film.description, film.release_year, film.special_features
from film
Join film_actor
ON film_actor.film_id = film.film_id
Join actor
on actor.actor_id = film_actor.actor_id
WHERE actor.actor_id=  15 and film.rating="G" and film.special_features LIKE '%behind the scenes%'

6. What query would you run to get all the actors that joined in the film_id = 369? 
Your query should return the film_id, title, actor_id, and actor_name.

SELECT film.film_id, film.title, actor.actor_id, actor.first_name, actor.last_name
from film
Join film_actor
ON film_actor.film_id = film.film_id
Join actor
on actor.actor_id = film_actor.actor_id
WHERE film.film_id = 369

7. What query would you run to get all drama films with a rental rate of 2.99? 
Your query should return film title, description, release year, rating, special features, and genre (category).

SELECT film.title, film.description, film.release_year, film.rating, film.special_features,  category.name
from film
Join film_category
ON film_category.film_id = film.film_id
Join category
on category.category_id = film_category.category_id
WHERE category.name= "drama" and film.rental_rate= 2.99;

8. What query would you run to get all the action films which are joined by SANDRA KILMER? 
Your query should return film title, description, release year, rating, special features, genre (category), 
and actor's first name and last name.




