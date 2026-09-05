CREATE DATABASE IF NOT EXISTS org;
USE org;

DROP TABLE IF EXISTS sales;

CREATE TABLE sales (
    sale_id       INT PRIMARY KEY,
    sale_date     DATE NOT NULL,
    customer_id   INT NOT NULL,
    customer_name VARCHAR(100) NOT NULL,
    city          VARCHAR(50) NOT NULL,
    state         VARCHAR(50) NOT NULL,
    category      VARCHAR(50) NOT NULL,
    product       VARCHAR(100) NOT NULL,
    quantity      INT NOT NULL,
    unit_price    DECIMAL(10,2) NOT NULL,
    discount      DECIMAL(5,2) NOT NULL,
    payment_mode  VARCHAR(20) NOT NULL,
    order_status  VARCHAR(20) NOT NULL
);

USE org;

DROP TABLE IF EXISTS sales;

CREATE TABLE sales (
    sale_id       INT PRIMARY KEY,
    sale_date     DATE NOT NULL,
    customer_id   INT NOT NULL,
    customer_name VARCHAR(100) NOT NULL,
    city          VARCHAR(50) NOT NULL,
    state         VARCHAR(50) NOT NULL,
    category      VARCHAR(50) NOT NULL,
    product       VARCHAR(100) NOT NULL,
    quantity      INT NOT NULL,
    unit_price    DECIMAL(10,2) NOT NULL,
    discount      DECIMAL(5,2) NOT NULL,
    payment_mode  VARCHAR(20) NOT NULL,
    order_status  VARCHAR(20) NOT NULL
);

-- Generate 5,000 numbers without recursion
INSERT INTO sales (
    sale_id, sale_date, customer_id, customer_name,
    city, state, category, product,
    quantity, unit_price, discount,
    payment_mode, order_status
)
SELECT
    n AS sale_id,

    DATE_ADD('2023-01-01',
             INTERVAL ((n * 7) % 1096) DAY) AS sale_date,

    1000 + ((n * 13) % 500) AS customer_id,

    CONCAT('Customer ', 1000 + ((n * 13) % 500))
        AS customer_name,

    ELT(1 + ((n * 17) % 15),
        'Lucknow','Kanpur','Delhi','Noida','Agra',
        'Varanasi','Prayagraj','Jaipur','Mumbai','Pune',
        'Bengaluru','Hyderabad','Chennai','Kolkata','Patna'
    ) AS city,

    ELT(1 + ((n * 17) % 15),
        'Uttar Pradesh','Uttar Pradesh','Delhi','Uttar Pradesh',
        'Uttar Pradesh','Uttar Pradesh','Uttar Pradesh','Rajasthan',
        'Maharashtra','Maharashtra','Karnataka','Telangana',
        'Tamil Nadu','West Bengal','Bihar'
    ) AS state,

    ELT(1 + ((n * 19) % 5),
        'Electronics','Furniture','Clothing','Groceries','Beauty'
    ) AS category,

    ELT(1 + ((n * 23) % 15),
        'Laptop','Mobile Phone','Headphones','Office Chair','Table',
        'T-Shirt','Jeans','Rice','Cooking Oil','Face Wash',
        'Keyboard','Monitor','Shoes','Backpack','Smart Watch'
    ) AS product,

    1 + ((n * 11) % 5) AS quantity,

    ELT(1 + ((n * 29) % 10),
        499, 799, 999, 1499, 1999,
        2499, 3999, 5999, 9999, 49999
    ) AS unit_price,

    ELT(1 + ((n * 31) % 5),
        0, 5, 10, 15, 20
    ) AS discount,

    ELT(1 + ((n * 37) % 5),
        'UPI','Credit Card','Debit Card','Cash','Net Banking'
    ) AS payment_mode,

    ELT(1 + ((n * 41) % 6),
        'Delivered','Delivered','Delivered','Delivered',
        'Cancelled','Returned'
    ) AS order_status

FROM (
    SELECT
        a.n
        + b.n * 10
        + c.n * 100
        + d.n * 1000
        + 1 AS n
    FROM
        (SELECT 0 n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
         UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) a
    CROSS JOIN
        (SELECT 0 n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
         UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) b
    CROSS JOIN
        (SELECT 0 n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
         UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) c
    CROSS JOIN
        (SELECT 0 n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
         UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) d
) numbers
WHERE n <= 5000;
