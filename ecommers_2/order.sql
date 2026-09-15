CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO orders VALUES
(1001, 1, '2026-01-05'),
(1002, 2, '2026-01-08'),
(1003, 3, '2026-01-10'),
(1004, 1, '2026-01-15'),
(1005, 4, '2026-02-02'),
(1006, 5, '2026-02-10'),
(1007, 6, '2026-02-15'),
(1008, 3, '2026-03-01'),
(1009, 7, '2026-03-05'),
(1010, 8, '2026-03-10');

SELECT
    c.customer_name,
    c.city,
    SUM(p.price * oi.quantity) AS total_sales
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY c.customer_name, c.city
ORDER BY total_sales DESC;