SELECT * FROM ord
Q1. Display every order with the total sales of the entire table.

Q2. Display every order with the total sales of its product.

Q3. Display every order with the average sales of its product.

Q4. Display every order with the highest sale of its product.

Q5. Display every order with a row number based on sales descending.

Level 2 — Ranking

Q6. Rank orders by sales within each product using RANK().

Q7. Rank orders by sales within each product using DENSE_RANK().

Q8. Find the highest-selling order for each product.

Q9. Find the second-highest sale for each product.

Q10. Find the top 2 orders for each product.

Level 3 — Running totals

Q11. Calculate the running total of sales for each product, ordered by date.

Q12. Calculate the running total of all sales, ordered by date.

Q13. Calculate the running total of sales for each product and status combination.

Q14. Calculate the percentage contribution of each order to its products total sales.

Level 4 — LAG() and LEAD()

Q15. Find the previous orders sales for each product.

Q16. Find the next orders sales for each product.

Q17. Calculate the difference between the current sale and the previous sale.

Q18. Find the first order date for each product.

Q19. Find the last order date for each product.

Level 5 — Interview-style questions

Q20. Find the highest-selling product overall.

Q21. Find the highest-selling product for each order status.

Q22. Find the top 2 products by total sales.

Q23. Find the second-highest order sale overall.

Q24. Find the highest sale among Delivered orders for each product.

Q25. Find the running total of Delivered sales for each product.
SELECT 
order_id,
sales,
SUM(sales) OVER() totalsales
FROM ord

SELECT 
order_id,
sales,
SUM(sales) OVER(PARTITION BY product) totalsales
FROM ord

SELECT 
order_id,
sales,
AVG(sales) OVER(PARTITION BY product) avgsales
FROM ord

SELECT 
    order_id,
    product,
    sales,
    MAX(sales) OVER(
        PARTITION BY product
    ) AS highest_sale
FROM ord;


SELECT
    order_id,
    product,
    sales,
    ROW_NUMBER() OVER(
        ORDER BY sales DESC
    ) AS row_num
FROM ord;



SELECT 
	order_id,
	product,
	sales,
	RANK() OVER( PARTITION BY product
        ORDER BY sales DESC
    ) AS sales_rank
FROM ord;



SELECT 
	order_id,
	product,
	sales,
	DENSE_RANK() OVER( PARTITION BY product
        ORDER BY sales DESC
    ) AS sales_rank
FROM ord;



SELECT
    order_id,
    product,
    sales
FROM (
    SELECT 
        order_id,
        product,
        sales,
        RANK() OVER(
            PARTITION BY product 
            ORDER BY sales DESC
        ) AS sales_rank
    FROM ord
) t
WHERE sales_rank = 1;

SELECT
    order_id,
    product,
    sales
FROM (
    SELECT 
        order_id,
        product,
        sales,
        RANK() OVER(
            PARTITION BY product 
            ORDER BY sales DESC
        ) AS sales_rank
    FROM ord
) t
WHERE sales_rank = 2;


SELECT
    order_id,
    product,
    sales
FROM (
    SELECT 
        order_id,
        product,
        sales,
        RANK() OVER(
            PARTITION BY product 
            ORDER BY sales DESC
        ) AS sales_rank
    FROM ord
) t
WHERE sales_rank IN (1,2);


SELECT
order_id,
product,
sales,
SUM(sales) OVER(PARTITION BY product
ORDER BY order_date
ROWS BETWEEN UNBOUNDED PRECEDING  AND CURRENT ROW
) AS running_total
FROM ord
;



SELECT
order_id,
product,
sales,
SUM(sales) OVER( 
ORDER BY order_date
ROWS BETWEEN UNBOUNDED PRECEDING  AND CURRENT ROW
) AS running_total
FROM ord;


SELECT
order_id,
product,
sales,
SUM(sales) OVER( PARTITION BY product, order_status
ORDER BY order_date
ROWS BETWEEN UNBOUNDED PRECEDING  AND CURRENT ROW
) AS running_total
FROM ord;

SELECT
    order_id,
    product,
    sales,
    ROUND(
        sales * 100.0
        / SUM(sales) OVER (PARTITION BY product),
        2
    ) AS percentage_contribution
FROM ord;