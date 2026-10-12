/*
 * Rank actors by how many films they appear in (most films first). Ties share a rank.
 *
 * HINT:
 * Join actor with film_actor.
 * Then use a window function with an appropriate ORDER BY clause (no PARTITION BY).
 */

SELECT
    a.actor_id,
    a.first_name,
    a.last_name,
    COUNT(fa.film_id) AS films,
    RANK() OVER (ORDER BY COUNT(fa.film_id) DESC) AS rnk
FROM actor a
LEFT JOIN film_actor fa ON a.actor_id = fa.actor_id
GROUP BY a.actor_id, a.first_name, a.last_name
ORDER BY rnk, a.actor_id;
