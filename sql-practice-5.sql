USE MyDatabase;

INSERT INTO persons (id,person_name,birth_date,phone)
SELECT
id,
first_name,
NULL,'Unknown'
FROM customers;
SELECT * FROM persons;

** INNER JOIN **

SELECT * FROM customers 
INNER JOIN  orders
ON customers.key = orders.key

** LEFT ANTI JOIN **

SELECT * FROM A LEFT JOIN B ON A.key = B.key WHERE B.key IS NULL



