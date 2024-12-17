SELECT name AS category, COUNT(name) AS sales_figures, SUM(amount) AS sales FROM (
    SELECT name, category.category_id, film_category.film_id, inventory.inventory_id, rental.rental_id, payment.amount 
    FROM category
    JOIN film_category 
    ON category.category_id = film_category.category_id
    RIGHT JOIN inventory 
    ON film_category.film_id = inventory.film_id 
    RIGHT JOIN rental 
    ON inventory.inventory_id = rental.inventory_id
    RIGHT JOIN payment 
    ON rental.rental_id = payment.rental_id) 
AS data 
GROUP BY name;