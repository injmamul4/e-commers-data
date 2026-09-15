CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

INSERT INTO products VALUES
(101, 'Laptop', 'Electronics', 55000),
(102, 'Mobile', 'Electronics', 25000),
(103, 'Headphones', 'Electronics', 2000),
(104, 'Shoes', 'Fashion', 3000),
(105, 'T-Shirt', 'Fashion', 1200),
(106, 'Watch', 'Fashion', 5000);

SELECT
    p.category,
    SUM(p.price * oi.quantity) AS total_sales
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id
GROUP BY p.category
ORDER BY total_sales DESC;