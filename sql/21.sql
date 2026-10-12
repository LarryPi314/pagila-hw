/*
 * For each film, show the customer who most recently rented it.
 *
 * HINT:
 * Use the first_value function.
 * The window will include both PARTITION BY and ORDER BY
 */

SELECT DISTINCT
    f.title,
    FIRST_VALUE(c.customer_id) OVER (
        PARTITION BY f.film_id
        ORDER BY r.rental_date DESC NULLS LAST, r.rental_id DESC
    ) AS customer_id,
    FIRST_VALUE(CONCAT(c.first_name, ' ', c.last_name)) OVER (
        PARTITION BY f.film_id
        ORDER BY r.rental_date DESC NULLS LAST, r.rental_id DESC
    ) AS customer_name
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN customer c ON r.customer_id = c.customer_id
ORDER BY f.title;
