CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO order_items VALUES
(1, 1001, 101, 1),
(2, 1001, 103, 2),
(3, 1002, 102, 1),
(4, 1003, 104, 2),
(5, 1004, 103, 1),
(6, 1004, 106, 1),
(7, 1005, 105, 3),
(8, 1006, 101, 1),
(9, 1007, 102, 2),
(10, 1008, 104, 1),
(11, 1008, 105, 2),
(12, 1009, 106, 1),
(13, 1010, 102, 1);

SELECT 
    oi.order_id,
    SUM(p.price * oi.quantity) AS total_amount
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id
GROUP BY oi.order_id;