A. Basic SQL and Filtering
1. Customers from a specific state

Find all customers who live in Maharashtra.

2. Premium customers

Display all customers belonging to the Premium segment.

3. Products above a price

Find all products whose unit price is greater than ₹10,000.

4. Products from selected categories

Display products belonging to either Electronics or Furniture.

5. Orders within a date range

Find all orders placed between 2025-01-01 and 2025-02-28.

6. Non-delivered orders

Display all orders that are either cancelled, returned, or shipped.

7. Customers from multiple cities

Find customers from Mumbai, Delhi, or Pune.

8. Products with a price range

Find products whose price is between ₹5,000 and ₹30,000.

9. Search by product name

Find products whose name contains the word Smart.

10. Sort products

Display all products from highest price to lowest price.

B. Aggregation and GROUP BY
11. Count customers by state

Find the number of customers in each state.

12. Count customers by segment

Find how many customers belong to each customer segment.

13. Average product price by category

Calculate the average unit price for every product category.

14. Maximum and minimum product price

Find the highest-priced and lowest-priced product in each category.

15. Count orders by status

Find the number of orders for each order status.

16. Total quantity sold per product

Calculate the total quantity sold for every product.

17. Total revenue per product

Calculate total delivered revenue for each product.

18. Revenue by category

Calculate total delivered revenue for each product category.

19. Revenue by month

Calculate total delivered revenue for each month.

20. Customers with multiple orders

Find customers who have placed more than one order.

21. Average order value

Calculate the average order value using only delivered orders.

22. Highest revenue category

Find the category generating the highest delivered revenue.

23. Products with high sales quantity

Find products whose total sold quantity is greater than 5.

24. States with high customer count

Find states having more than two customers.

25. Daily revenue

Calculate total delivered revenue for each order date.

C. JOIN Questions
26. Display customer orders

Display:

customer name

order ID

order date

order status

Use customers and orders.

27. Display order details

Display:

order ID

customer name

product name

quantity

unit price

Use all four tables.

28. Customer-wise spending

Find the total delivered spending of every customer.

Include customers who have not placed any delivered order.

29. Customers without orders

Find customers who have never placed an order.

30. Products never ordered

Find products that do not appear in order_items.

31. Product-wise revenue

Display:

product name

category

total quantity sold

total delivered revenue

32. City-wise revenue

Find total delivered revenue generated from each shipping city.

33. Order total

Calculate the total amount of every order.

Display:

order ID

customer name

order date

order total

34. Customers and order count

Display every customer with their total number of orders, including customers with zero orders.

35. Customer’s latest order

Find the latest order date for every customer.

36. Customers whose spending exceeds average spending

Find customers whose total delivered spending is greater than the average customer spending.

37. Most expensive product ordered by each customer

Find the most expensive product purchased by every customer.

38. Product category and customer segment

Find total revenue grouped by both:

product category

customer segment

39. Orders containing multiple products

Find orders containing more than one distinct product.

40. Orders with total quantity greater than three

Find orders where the total quantity of products is greater than 3.

D. Subquery Questions
41. Products above average price

Find products whose unit price is greater than the average product price.

42. Customers who placed the highest number of orders

Find the customer or customers with the maximum number of orders.

43. Products with revenue above average product revenue

Find products whose delivered revenue is greater than the average delivered revenue of all products.

44. Orders greater than average order value

Find orders whose total value is greater than the average order value.

45. Customers who purchased a laptop

Find customers who purchased Laptop Pro.

46. Customers who purchased from every category

Find customers who have purchased products from all available categories.

47. Second-highest product price

Find the second-highest product price without using LIMIT.

48. Third-highest customer spending

Find the customer with the third-highest delivered spending.

49. Products priced higher than their category average

Find products whose price is greater than the average price of their own category.

50. Customers spending more than customer 1

Find customers whose delivered spending is greater than the spending of customer ID 1.

E. CTE Questions
51. Customer spending CTE

Create a CTE that calculates delivered spending per customer, then display customers spending more than ₹50,000.

52. Product revenue CTE

Create a CTE for product revenue and display the top five products by revenue.

53. Monthly revenue CTE

Create a CTE that calculates monthly delivered revenue and display the month with the highest revenue.

54. Order total CTE

Create a CTE calculating each order’s total value. Then find orders whose total exceeds ₹50,000.

55. Category revenue CTE

Create a CTE calculating revenue by category and display categories whose revenue is above the average category revenue.

56. Repeat customer CTE

Create a CTE that counts orders per customer and classify customers as:

New Customer — one order

Repeat Customer — more than one order

57. Customer purchase summary

Using a CTE, calculate for every customer:

total orders

total quantity purchased

total delivered spending

average order value

58. Monthly growth CTE

Create a monthly revenue CTE and calculate the difference between the current month’s revenue and previous month’s revenue.

59. Top category product CTE

Create a CTE for product revenue, then find the highest-revenue product in each category.

60. Customer ranking CTE

Create a CTE for customer spending and rank customers from highest to lowest spending.

F. Window Function Questions
61. Rank products by revenue

Rank all products according to their total delivered revenue using RANK().

62. Dense rank products by revenue

Rank products by revenue using DENSE_RANK() and explain how it differs from RANK().

63. Row number for customer orders

Assign a row number to each customer’s orders based on order date.

64. Latest order per customer

Use ROW_NUMBER() to find the latest order of every customer.

65. First order per customer

Use ROW_NUMBER() to find each customer’s first order.

66. Top three products per category

Use DENSE_RANK() to find the top three products by revenue within each category.

67. Running monthly revenue

Calculate monthly revenue and then calculate the cumulative running revenue using:

SUM() OVER (...)
68. Previous month revenue

Use LAG() to display:

current month revenue

previous month revenue

69. Month-over-month growth

Calculate month-over-month revenue growth percentage using LAG().

Formula:

((current_revenue - previous_revenue) / previous_revenue) * 100
70. Difference from previous order

For every customer, display the difference in days between the current order and the previous order using LAG().

71. Customer order sequence

For every customer, display:

order ID

order date

first order date

latest order date

Use window functions.

72. Percentage contribution by product

Calculate each product’s percentage contribution to total delivered revenue.

73. Percentage contribution by category

Calculate each category’s percentage contribution to total delivered revenue.

74. Highest-value order per customer

Use ROW_NUMBER() to find the highest-value order for each customer.

75. Revenue quartiles

Divide products into four revenue groups using NTILE(4).

G. Advanced Interview Questions
76. Customer retention

Find customers who placed an order in January and also placed another order in February.

77. Customers inactive after first purchase

Find customers whose first order was in January but who did not place another order afterward.

78. Most popular product in each category

Find the product with the highest total quantity sold in each category.

79. Most profitable product

Calculate:

selling revenue - cost revenue

Then find the most profitable product.

Use:

(quantity * (unit_price - cost_price)) - discount_amount
80. Profit margin by category

Calculate profit and profit margin for every category.

Formula:

profit_margin =
profit / revenue * 100
81. Cancelled order percentage

Calculate the percentage of orders that were cancelled.

82. Return rate by product

Calculate the percentage of orders containing each product that were returned.

83. Customer lifetime value

Calculate total delivered revenue per customer and rank customers by lifetime value.

84. Average time between orders

For every repeat customer, calculate the average number of days between consecutive orders.

85. Customers buying multiple categories

Find customers who purchased products from at least three different categories.

86. Orders with above-average quantity

Find orders whose total quantity is greater than the average order quantity.

87. Category contribution by month

Display monthly revenue for each category using conditional aggregation or a pivot-style query.

88. First and last purchase product

Find the first product and last product purchased by every customer.

89. Top 10% customers

Use NTILE(10) to identify customers belonging to the top 10% by delivered spending.

90. Consecutive monthly buyers

Find customers who purchased in two consecutive months.