USE ASSIGNMENT3;

SELECT * FROM customers;
SELECT * FROM order_items;
SELECT * FROM orders;
SELECT * FROM products;

-- 1.	Monthly Revenue
-- Calculate total revenue per month.
-- Format: YYYY-MM, total_revenue

SELECT 
    date_format(order_date, '%y-%M') AS month,
    SUM(total_amount) AS total_revenue
FROM orders
GROUP BY month
ORDER BY month;

SELECT 
	date_format(OD.Order_date,"%Y-%M") AS Month ,
	SUM(O.Quantity * O.Price) AS Total_Revenue FROM order_items AS O
JOIN Orders AS OD ON O.Order_ID = OD.Order_ID
GROUP BY month
ORDER BY Month DESC;

-- 2.	Customer Lifetime Value
-- For each customer, calculate their total spend (total_amount from orders).
-- Show top 5 customers by lifetime value.

SELECT c.customer_id,
    SUM(o.total_amount) AS lifetime_value
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id
ORDER BY lifetime_value DESC
LIMIT 5;

-- 3.	Most Popular Product by Region
-- Join data to find the most frequently ordered product in each region.

WITH product_orders AS (
    SELECT c.region,oi.product_id,
        COUNT(*) AS order_count
    FROM order_items oi
    JOIN orders o ON oi.order_id = o.order_id
    JOIN customers c ON o.customer_id = c.customer_id
    GROUP BY c.region, oi.product_id
),
ranked_products AS (
    SELECT *,
           RANK() OVER (PARTITION BY region ORDER BY order_count DESC) AS renk_no
    FROM product_orders
)
SELECT rp.region,p.product_name,rp.order_count
FROM ranked_products rp
JOIN products p ON rp.product_id = p.product_id
WHERE rp.renk_no = 1;

-- 4.	Profit Analysis
-- For each product, compute total profit:
-- Profit = (price - cost) * quantity
-- Show top 5 most profitable products.

SELECT p.product_id,p.product_name,
    SUM((oi.price - p.cost) * oi.quantity) AS total_profit
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_profit DESC
LIMIT 5;

-- 5.	New vs Returning Customers
-- In each month, count how many orders were placed by:
-- New customers (first-time order)
-- Returning customers (second order or later)

SELECT month,type,
  COUNT(*) AS count
FROM (
  SELECT 
    DATE_FORMAT(order_date, '%Y-%M') AS month,
    CASE 
      WHEN order_date = MIN(order_date) OVER (PARTITION BY customer_id)
      THEN 'new' ELSE 'returning' 
    END AS type
  FROM orders
) AS sub
GROUP BY month, type
ORDER BY month, type;



