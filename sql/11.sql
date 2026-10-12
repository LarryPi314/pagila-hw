/* 
 * Use a JOIN to list the number of copies of each film in the inventory system that begins with the letter h.
 * Use tables inventory and film.
 * Order by film title in reverse alphabetical order.
 */

SELECT film.film_id, film.title, count(*)
FROM film
JOIN inventory ON film.film_id = inventory.film_id
WHERE film.title ILIKE 'h%'
GROUP BY film.film_id, film.title
ORDER BY film.title DESC;
