CREATE TABLE ord (
    order_id INT PRIMARY KEY,
    product_id VARCHAR(10),
    sales DECIMAL(10, 2),
    order_date DATE
);

INSERT INTO ord (order_id, product_id, sales, order_date)
VALUES
(1,  'P101', 1200.00, '2026-01-01'),
(2,  'P102',  800.00, '2026-01-01'),
(3,  'P101', 1500.00, '2026-01-02'),
(4,  'P103',  600.00, '2026-01-02'),
(5,  'P102',  900.00, '2026-01-03'),
(6,  'P101', 1100.00, '2026-01-03'),
(7,  'P103',  700.00, '2026-01-04'),
(8,  'P102', 1200.00, '2026-01-04'),
(9,  'P101', 1800.00, '2026-01-05'),
(10, 'P103',  500.00, '2026-01-05'),
(11, 'P102', 1000.00, '2026-01-06'),
(12, 'P101', 1300.00, '2026-01-06'),
(13, 'P103',  900.00, '2026-01-07'),
(14, 'P102', 1100.00, '2026-01-07'),
(15, 'P101', 1600.00, '2026-01-08'),
(16, 'P103',  800.00, '2026-01-08'),
(17, 'P102',  950.00, '2026-01-09'),
(18, 'P101', 1400.00, '2026-01-09'),
(19, 'P103',  750.00, '2026-01-10'),
(20, 'P102', 1250.00, '2026-01-10');

UPDATE ord 
SET product = 'Laptop'
WHERE order_id IN (1, 3, 6, 9, 12, 15, 18);
UPDATE ord 
SET product = 'Smartphone'
WHERE order_id IN (2, 5, 8, 11, 14, 17, 20);
UPDATE ord 
SET product = 'Headphones'
WHERE order_id IN (4, 7, 10, 13, 16, 19);

SELECT * FROM ord;


SELECT 
order_id,
order_date,
product_id,
SUM(sales) OVER(partition by product_id) totalsales
FROM ord


ALTER TABLE ord
ADD COLUMN order_status VARCHAR(20);

UPDATE ord
SET order_status = 'Delivered'
WHERE order_id IN (1, 3, 6, 9, 12, 15, 18);
UPDATE ord
SET order_status = 'Shipped'
WHERE order_id IN (2, 5, 8, 11, 14, 17, 20);
UPDATE ord
SET order_status = 'Pending'
WHERE order_id IN (4, 7, 10, 13, 16, 19);



SELECT 
order_id,
order_date,
product_id,
order_status
,sales,
SUM(sales) OVER() totalsales,
SUM(sales) OVER(PARTITION BY product_id) salesbyproduct,
SUM(sales)  OVER(PARTITION BY product_id,order_status) salesbyproductandstatus
FROM ord