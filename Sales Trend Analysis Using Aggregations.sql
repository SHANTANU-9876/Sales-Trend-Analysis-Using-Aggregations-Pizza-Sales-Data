Create Database pizza_data;

Use pizza_data;

CREATE TABLE `pizza_sales` (`pizza_id` FLOAT, `order_id` FLOAT, `pizza_name_id` VARCHAR(255),
  `quantity` FLOAT, `order_date` VARCHAR(255), `order_time` VARCHAR(255), `unit_price` FLOAT, `total_price` FLOAT,
  `pizza_size` VARCHAR(255), `pizza_category` VARCHAR(255), `pizza_ingredients` VARCHAR(255), `pizza_name` VARCHAR(255)
);

-- 1. Total montly revenue
SELECT 
  EXTRACT(MONTH FROM STR_TO_DATE(order_date, '%d-%m-%Y')) AS month,
  SUM(total_price) AS monthly_revenue
FROM pizza_sales
GROUP BY month
ORDER BY month;

-- 2. Monthly Order Volume
SELECT 
  DATE_FORMAT(STR_TO_DATE(order_date, '%d-%m-%Y'), '%Y-%m') AS month,
  SUM(total_price) AS revenue
FROM pizza_sales
GROUP BY month
ORDER BY revenue DESC;

-- 3. Top 5 Revenue-Generating Months
SELECT EXTRACT(YEAR_MONTH FROM STR_TO_DATE(order_date, '%d-%m-%Y')) AS month,
  SUM(total_price) AS revenue
FROM pizza_sales
GROUP BY month
ORDER BY revenue DESC
LIMIT 5;

-- 4. Monthly Revenue for a Specific Year
SELECT EXTRACT(MONTH FROM STR_TO_DATE(order_date, '%d-%m-%Y')) AS month,
  SUM(total_price) AS revenue
FROM pizza_sales
WHERE EXTRACT(YEAR FROM STR_TO_DATE(order_date, '%d-%m-%Y')) = 2015
GROUP BY month
ORDER BY month;

-- 5. Most Popular Pizza Sizes by Volume
SELECT pizza_size, COUNT(*) AS total_orders
FROM pizza_sales
GROUP BY pizza_size
ORDER BY total_orders DESC;

-- 6. Revenue by Pizza Category
SELECT pizza_category, SUM(total_price) AS revenue
FROM pizza_sales
GROUP BY pizza_category
ORDER BY revenue DESC;

-- 7. Top 5 Pizzas by Revenue
SELECT pizza_name, SUM(total_price) AS revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY revenue DESC
LIMIT 5;

-- 8. Top 5 Pizzas by Quantity Sold
SELECT pizza_name, SUM(quantity) AS total_quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_quantity DESC
LIMIT 5;

-- 9. Order Volume and Revenue by Day of Week
SELECT DAYNAME(STR_TO_DATE(order_date, '%d-%m-%Y')) AS day_of_week, 
  COUNT(DISTINCT order_id) AS order_volume,
  SUM(total_price) AS revenue
FROM pizza_sales
GROUP BY day_of_week
ORDER BY revenue DESC;

-- 10. Monthly Revenue by Pizza Category
SELECT pizza_category, EXTRACT(YEAR FROM STR_TO_DATE(order_date, '%d-%m-%Y')) AS year, 
  EXTRACT(MONTH FROM STR_TO_DATE(order_date, '%d-%m-%Y')) AS month,
  SUM(total_price) AS revenue
FROM pizza_sales
GROUP BY pizza_category, year, month
ORDER BY pizza_category, year, month;


