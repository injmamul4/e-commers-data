CREATE DATABASE ecommerce_analytics;
USE ecommerce_analytics;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    gender VARCHAR(20),
    city VARCHAR(50)
);

INSERT INTO customers VALUES
(1, 'Rahul', 'Male', 'Mumbai'),
(2, 'Aman', 'Male', 'Delhi'),
(3, 'Priya', 'Female', 'Mumbai'),
(4, 'Neha', 'Female', 'Pune'),
(5, 'Arjun', 'Male', 'Delhi'),
(6, 'Sneha', 'Female', 'Mumbai'),
(7, 'Rohit', 'Male', 'Pune'),
(8, 'Anjali', 'Female', 'Delhi');

SELECT
    o.order_id,
    o.order_date,
    c.customer_name,
    c.gender,
    c.city,
    p.product_name,
    p.category,
    p.price,
    oi.quantity,
    p.price * oi.quantity AS total_amount
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id
JOIN order_items oi
ON o.order_id = oi.order_id
JOIN products p
ON oi.product_id = p.product_id;