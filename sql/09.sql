/*
 * Use a JOIN to display the total amount rung up by each staff member in January of 2020.
 * Use tables staff and payment.
 */

SELECT staff.first_name, staff.last_name, SUM(payment.amount) AS sum
FROM staff
JOIN payment ON staff.staff_id = payment.staff_id
WHERE EXTRACT(YEAR FROM payment_date) = 2020
AND EXTRACT(MONTH FROM payment_date) = 1
GROUP BY staff.first_name, staff.last_name;
