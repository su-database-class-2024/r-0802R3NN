SELECT city 
FROM city 
WHERE city NOT IN (SELECT city 
        FROM address 
            JOIN city 
                ON address.city_id = 
                    city.city_id);