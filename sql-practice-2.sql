USE org;
SELECT COUNT(*) AS total_records
FROM sales;
SHOW TABLES;
DESCRIBE sales;
SELECT * FROM sales;
SELECT discount,quantity FROM sales;
SELECT * FROM sales WHERE city ='Delhi';
SELECT customer_name,sale_id,discount FROM sales ORDER BY discount DESC;
SELECT customer_name FROM sales ORDER BY city ASC ,unit_price DESC;
SELECT city,SUM(quantity) FROM sales GROUP BY city;
SELECT state, SUM(quantity) AS total,COUNT(customer_id) AS total_cust FROM sales GROUP BY state;
SELECT state,SUM(quantity) FROM sales WHERE quantity >3 GROUP BY state HAVING SUM(quantity) >800;
SELECT 123 as static_number;
SELECT 'Hello' AS static_string;


