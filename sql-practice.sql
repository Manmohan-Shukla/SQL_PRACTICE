CREATE DATABASE join_practice;
USE join_practice;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    city VARCHAR(50),
    country VARCHAR(50),
    email VARCHAR(100)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10, 2),
    status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);




INSERT INTO customers
(customer_id, customer_name, city, country, email)
VALUES
(1, 'Amit', 'Delhi', 'India', 'amit@gmail.com'),
(2, 'Priya', 'Mumbai', 'India', 'priya@gmail.com'),
(3, 'Rahul', 'Lucknow', 'India', 'rahul@gmail.com'),
(4, 'Sneha', 'Pune', 'India', 'sneha@gmail.com'),
(5, 'John', 'New York', 'USA', 'john@gmail.com'),
(6, 'Emma', 'London', 'UK', 'emma@gmail.com'),
(7, 'David', 'Toronto', 'Canada', 'david@gmail.com'),
(8, 'Anjali', 'Kanpur', 'India', 'anjali@gmail.com');

INSERT INTO orders
(order_id, customer_id, order_date, amount, status)
VALUES
(101, 1, '2026-01-10', 5000.00, 'Completed'),
(102, 1, '2026-02-15', 3000.00, 'Completed'),
(103, 2, '2026-01-20', 7000.00, 'Completed'),
(104, 2, '2026-03-05', 2000.00, 'Pending'),
(105, 3, '2026-02-10', 4500.00, 'Completed'),
(106, 5, '2026-01-25', 10000.00, 'Completed'),
(107, 5, '2026-03-12', 1500.00, 'Cancelled'),
(108, 6, '2026-02-28', 8000.00, 'Completed'),
(109, 7, '2026-03-01', 6000.00, 'Completed'),
(110, 7, '2026-03-15', 2500.00, 'Pending'),
(111, 3, '2026-03-20', 3500.00, 'Completed'),
(112, 1, '2026-03-25', 1200.00, 'Pending');



Show customer names and their order amounts.

SELECT  c.customer_name,
o.amount FROM customers AS c
INNER JOIN orders AS o
ON c.customer_id = o.customer_id

show customer name, order ID, order date, and amount for every order.

SELECT  c.customer_name,
o.order_id,o.order_date,o.amount FROM customers AS c
INNER JOIN orders AS o
ON c.customer_id = o.customer_id

Show all customers and their orders, including customers who have never placed an order.

SELECT
    c.customer_name,
    o.order_id,
    o.amount
FROM customers AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id;

Show only customers who have placed at least one order


SELECT DISTINCT
    c.customer_name,
    o.order_id,
    o.amount
FROM customers AS c
RIGHT JOIN orders AS o
    ON c.customer_id = o.customer_id;
    
    
Show orders placed by customers from India

SELECT 
    o.order_id,
    o.amount
FROM customers AS c
RIGHT JOIN orders AS o
    ON c.customer_id = o.customer_id
WHERE c.country = 'India';

Show all customers who have never placed an order.


SELECT
    c.customer_name,
    o.order_id,
    o.amount
FROM customers AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id
WHERE o.customer_id IS NULL;
    
    
CROSS JOIN

SELECT * FROM A 
CROSS JOIN B