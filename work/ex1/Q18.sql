SELECT country, COUNT(DISTINCT(customer_id)) AS num_customers, SUM(amount) AS sales 
FROM(
    SELECT country, country.country_id, city.city_id, address.address_id, customer.customer_id, amount 
    FROM country 
    JOIN city 
    ON country.country_id = city.country_id 
    RIGHT JOIN address 
    ON city.city_id = address.city_id 
    RIGHT JOIN customer 
    ON address.address_id = customer.address_id 
    RIGHT JOIN payment 
    ON customer.customer_id = payment.customer_id
) AS data 
GROUP BY country;