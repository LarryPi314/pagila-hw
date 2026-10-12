/*
 * For each film, show how many actors appear in it.
 *
 * HINT:
 * Join film and film_actor.
 * Use a window function that does NOT need an ORDER BY clause inside OVER.
 */

SELECT
    f.title,
    COUNT(fa.actor_id) OVER (PARTITION BY f.film_id) AS actor_count
FROM film f
JOIN film_actor fa ON f.film_id = fa.film_id
ORDER BY actor_count DESC, f.title COLLATE "C" ASC;
