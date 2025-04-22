USE assignment2;

SELECT * FROM sales_data;

-- 1.	Total Sales Value
-- Calculate the total sales value across all orders.
-- Hint: quantity * price gives the value per item.

SELECT 
    SUM(quantity * price) AS Tot_sales_value
FROM sales_data;

-- 2.	Monthly Sales Trends
-- Show total sales value by month.
-- Format: YYYY-MM, total_sales

SELECT 
    FORMAT(order_date, '%Y-%m') AS Sales_month,
    SUM(quantity * price) AS total_sales
FROM sales_data
GROUP BY sales_month
ORDER BY sales_month;

-- 3.	Top 5 Products by Sales Value
-- List the top 5 best-selling products based on total revenue.

SELECT product_name,
    SUM(quantity * price) AS total_revenue
FROM sales_data
GROUP BY product_name
ORDER BY total_revenue DESC
LIMIT 5;

-- 4.	Sales by Region
-- Show total sales value per region.
SELECT region,
    SUM(quantity * price) AS total_sales
FROM sales_data
GROUP BY region
ORDER BY total_sales DESC;

-- 5.	Customer Purchase Frequency
-- Find the number of orders placed by each customer. Return top 10 most frequent buyers.

SELECT customer_id,
    COUNT(DISTINCT order_id) AS order_count
FROM sales_data
GROUP BY customer_id
ORDER BY order_count DESC
LIMIT 10;

-- 6.	Category-wise Revenue Contribution 
-- What percentage of total revenue does each product category contribute?
SELECT category,
    ROUND(SUM(quantity * price) * 100.0 / (SELECT SUM(quantity * price) FROM sales_data), 2) AS revenue_percentage
FROM sales_data
GROUP BY categorytasa
ORDER BY revenue_percentage DESC;

-- 7.	Repeat Customer Rate
-- Calculate how many customers have made more than one purchase.

SELECT 
    COUNT(*) AS repeat_customers
FROM (
    SELECT customer_id
    FROM sales_data
    GROUP BY customer_id
    HAVING COUNT(DISTINCT order_id) > 1
) AS More_than_1;

-- There are the Different way to calculate customers have made more than one purchase.

SELECT Customer_id, Count(Order_id) AS Total_purchase From Sales_data
Group BY customer_id
order by Total_purchase DESC
limit 5;
