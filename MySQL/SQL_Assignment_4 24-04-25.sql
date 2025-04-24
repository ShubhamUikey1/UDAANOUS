USE assignment4;

SELECT * FROM customers;
SELECT * FROM orders;

WITH ranked AS (
  SELECT c.name, c.region,
    COUNT(*) AS order_count,
    SUM(o.total_amount) AS total_spent,
    RANK() OVER (PARTITION BY c.region ORDER BY SUM(o.total_amount) DESC) AS rnk
  FROM orders o
  JOIN customers c ON o.customer_id = c.customer_id
  WHERE o.order_date >= DATE_SUB(CURDATE(), INTERVAL 12 MONTH)
  GROUP BY c.customer_id, c.name, c.region
  HAVING order_count > 3
)
SELECT name, region, total_spent, order_count
FROM ranked
WHERE rnk <= 3
ORDER BY region, rnk;

SELECT name, region, SUM(total_amount) AS total_spent, COUNT(*) AS order_count
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE o.order_date >= DATE_SUB(CURDATE(), INTERVAL 12 MONTH)
GROUP BY o.customer_id, name, region
HAVING order_count > 3
ORDER BY region, total_spent DESC limit 5;
