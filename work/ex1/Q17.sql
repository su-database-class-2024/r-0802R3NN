SELECT name AS category, AVG(DATEDIFF(day, CAST(rental_date AS DATE), CAST(return_date AS DATE))) AS ave_rental_days 
FROM(SELECT name, category.category_id, film_category.film_id, inventory.inventory_id, rental.rental_id, rental_date, return_date 
    FROM category
    JOIN film_category 
    ON category.category_id = film_category.category_id
    RIGHT JOIN inventory 
    ON film_category.film_id = inventory.film_id 
    RIGHT JOIN rental 
    ON inventory.inventory_id = rental.inventory_id) 
AS data 
GROUP BY name;