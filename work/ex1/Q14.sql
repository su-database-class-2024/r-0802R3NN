SELECT * FROM store JOIN address ON store.address_id = address.address_id RIGHT JOIN city ON address.city_id = city.city_id;