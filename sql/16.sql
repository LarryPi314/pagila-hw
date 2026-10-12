/*
 * Use a JOIN to order the films by most profitable,
 * where the profit is the total amount that customers have paid for the film.
 * Use tables payment, rental, inventory, and film. 
 */

SELECT film.title, sum(payment.amount) AS profit
FROM film
JOIN inventory ON inventory.film_id = film.film_id
JOIN rental ON rental.inventory_id = inventory.inventory_id
JOIN payment ON payment.rental_id = rental.rental_id
GROUP BY film.title
ORDER BY profit DESC;
