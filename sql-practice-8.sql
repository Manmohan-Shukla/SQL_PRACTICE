SELECT * FROM ord;
SELECT * FROM(
SELECT product_id,
sales,
AVG(sales) OVER() Avgprice
FROM ord)t
WHERE sales>Avgprice;

ALTER TABLE ord
ADD customer_id VARCHAR(10);
UPDATE ord
SET customer_id = CASE
    WHEN order_id IN (1, 4, 7, 10, 13, 16, 19) THEN 'C001'
    WHEN order_id IN (2, 5, 8, 11, 14, 17, 20) THEN 'C002'
    WHEN order_id IN (3, 6, 9, 12, 15, 18) THEN 'C003'
END
WHERE order_id IN (
    1, 2, 3, 4, 5, 6, 7, 8, 9, 10,
    11, 12, 13, 14, 15, 16, 17, 18, 19, 20
);

SELECT * ,RANK() OVER (ORDER BY totalsales DESC) customerrank FROM
(SELECT 
customer_id,
SUM(sales)  totalsales
FROM ord
GROUP BY customer_id)t


SELECT 