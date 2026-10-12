/*
 * For each payment, show the customer's total amount paid overall.
 *
 * HINT:
 * Use a window function with a PARTITION BY (but no ORDER BY).
 */

SELECT
    payment.customer_id,
    customer.first_name,
    customer.last_name,
    payment.payment_id,
    payment.amount,
    SUM(amount) OVER (PARTITION BY payment.customer_id) AS customer_total
FROM payment
JOIN customer on payment.customer_id = customer.customer_id
ORDER BY customer_id, payment_id;

