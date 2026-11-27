USE students;

CREATE TABLE order_details (
    order_id INT,
    product_id INT,
    quantity INT,
    price DOUBLE,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Thêm 2 khách hàng mới
INSERT INTO customers (customer_name)
VALUES
('Nguyen Van A'),
('Tran Thi B');
SELECT * FROM customers;