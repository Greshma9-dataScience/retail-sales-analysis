
CREATE DATABASE IF NOT EXISTS Retail_Sales;
USE Retail_Sales;

CREATE TABLE retail_sales (
    order_id INT PRIMARY KEY,
    order_date DATE,
    product_name VARCHAR(50),
    category VARCHAR(50),
    quantity INT,
    unit_price DECIMAL(10,2),
    unit_cost DECIMAL(10,2),
    city VARCHAR(50)
);

INSERT INTO retail_sales VALUES
(1, '2026-01-05', 'Laptop', 'Electronics', 2, 50000, 40000, 'Bengaluru'),
(2, '2026-01-10', 'Mouse', 'Accessories', 5, 500, 300, 'Chennai'),
(3, '2026-01-15', 'Notebook', 'Stationery', 10, 100, 60, 'Hyderabad'),
(4, '2026-02-02', 'Phone', 'Electronics', 3, 20000, 15000, 'Chennai'),
(5, '2026-02-12', 'Keyboard', 'Accessories', 4, 1500, 900, 'Bengaluru'),
(6, '2026-02-20', 'Notebook', 'Stationery', 20, 100, 60, 'Chennai'),
(7, '2026-03-03', 'Laptop', 'Electronics', 1, 50000, 40000, 'Hyderabad'),
(8, '2026-03-11', 'Phone', 'Electronics', 2, 20000, 15000, 'Bengaluru'),
(9, '2026-03-18', 'Mouse', 'Accessories', 8, 500, 300, 'Hyderabad'),
(10, '2026-03-25', 'Keyboard', 'Accessories', 3, 1500, 900, 'Chennai');

-- 1. Total number of orders
SELECT COUNT(*) AS total_orders
FROM retail_sales;

-- 2. Total revenue
SELECT SUM(quantity * unit_price) AS total_revenue
FROM retail_sales;

-- 3. Total profit
SELECT SUM(quantity * (unit_price - unit_cost)) AS total_profit
FROM retail_sales;

-- 4. Revenue by product category
SELECT category,
       SUM(quantity * unit_price) AS revenue
FROM retail_sales
GROUP BY category
ORDER BY revenue DESC;

-- 5. Monthly revenue
SELECT MONTH(order_date) AS sales_month,
       SUM(quantity * unit_price) AS revenue
FROM retail_sales
GROUP BY MONTH(order_date)
ORDER BY sales_month;

-- 6. Best-selling products by quantity
SELECT product_name,
       SUM(quantity) AS units_sold
FROM retail_sales
GROUP BY product_name
ORDER BY units_sold DESC;

-- 7. City-wise revenue
SELECT city,
       SUM(quantity * unit_price) AS revenue
FROM retail_sales
GROUP BY city
ORDER BY revenue DESC;

-- 8. Order details with calculated revenue and profit
SELECT order_id, product_name, city,
       quantity * unit_price AS revenue,
       quantity * (unit_price - unit_cost) AS profit
FROM retail_sales
ORDER BY revenue DESC;
