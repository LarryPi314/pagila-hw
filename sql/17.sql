/*
 * Use a JOIN to order the countries by most profitable,
 * where the profit is the total amount that all customers from that country have payed.
 * Use tables payment, rental, customer, address, city, and country.
 * Order by country alphabetically.
 */

SELECT country.country, sum(payment.amount) AS profit
FROM country
JOIN city ON city.country_id = country.country_id
JOIN address ON address.city_id = city.city_id
JOIN customer ON customer.address_id = address.address_id
JOIN rental ON rental.customer_id = customer.customer_id
JOIN payment ON payment.rental_id = rental.rental_id
GROUP BY country.country
ORDER BY country.country;
