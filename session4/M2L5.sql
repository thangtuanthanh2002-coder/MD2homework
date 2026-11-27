USE students;

ALTER TABLE students
ADD COLUMN score DECIMAL(4, 2);

UPDATE students
SET score = CASE
    WHEN student_id = 1 THEN 8.5
    WHEN student_id = 2 THEN 7.2
    WHEN student_id = 3 THEN 9.0
    WHEN student_id = 4 THEN 6.8
    WHEN student_id = 5 THEN 8.0
END
WHERE student_id IN (1, 2, 3, 4, 5);

SELECT
    student_id,
    UPPER(full_name) AS full_name
FROM students;

-- E1
-- Hiển thị mã sinh viên và họ tên viết hoa
SELECT
    student_id,
    UPPER(full_name) AS full_name
FROM students;

-- Hiển thị họ tên và tuổi sinh viên
SELECT
    full_name,
    YEAR(CURDATE()) - YEAR(birth_date) AS age
FROM students;

-- Hiển thị điểm trung bình được làm tròn 1 chữ số
SELECT
    full_name,
    ROUND(score, 1) AS rounded_score
FROM students;

-- Đếm tổng số sinh viên, tìm điểm cao nhất và thấp nhất
SELECT
    COUNT(*) AS total_students,
    MAX(score) AS highest_score,
    MIN(score) AS lowest_score
FROM students;

-- E2
-- Đếm số nhân viên trong mỗi phòng ban
SELECT
    department,
    COUNT(*) AS total_employees
FROM employees
GROUP BY department;

-- Tính lương trung bình của từng phòng ban
SELECT
    department,
    AVG(salary) AS average_salary
FROM employees
GROUP BY department;

-- Phòng ban có trên 3 nhân viên
SELECT
    department,
    COUNT(*) AS total_employees
FROM employees
GROUP BY department
HAVING COUNT(*) > 3;

-- Phòng ban có lương trung bình trên 12 triệu
SELECT
    department,
    AVG(salary) AS average_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 12000000;

-- E3

-- Sản phẩm có giá cao hơn giá trung bình
SELECT *
FROM products
WHERE price > (
    SELECT AVG(price)
    FROM products
);

-- Sản phẩm có giá cao nhất trong từng loại
SELECT *
FROM products p
WHERE price = (
    SELECT MAX(price)
    FROM products
    WHERE category = p.category
);

-- Sản phẩm thuộc loại có ít nhất một sản phẩm giá trên 20 triệu
SELECT *
FROM products
WHERE category IN (
    SELECT category
    FROM products
    WHERE price > 20000000
);


CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_id INT,
    customer_id INT,
    product_name VARCHAR(100),
    quantity INT,
    price DECIMAL(15, 2),
    PRIMARY KEY (order_id, product_name),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

-- E4

-- Hiển thị mã đơn hàng, ngày đặt hàng và tên khách hàng
SELECT
    Orders.order_id,
    Orders.order_date,
    Customers.customer_name
FROM Orders
INNER JOIN Customers
ON Orders.customer_id = Customers.customer_id;

-- Hiển thị danh sách sản phẩm trong mỗi đơn hàng
SELECT
    Orders.order_id,
    Order_items.product_name,
    Order_items.quantity,
    Order_items.price
FROM Orders
INNER JOIN Order_items
ON Orders.order_id = Order_items.order_id;

-- Tính tổng tiền của mỗi đơn hàng
SELECT
    order_id,
    SUM(quantity * price) AS total_amount
FROM Order_items
GROUP BY order_id;

-- Hiển thị đơn hàng có tổng tiền lớn hơn 10 triệu
SELECT
    order_id,
    SUM(quantity * price) AS total_amount
FROM Order_items
GROUP BY order_id
HAVING SUM(quantity * price) > 10000000;

-- E5
CREATE TABLE scores (
    student_id INT,
    subject VARCHAR(100),
    score DECIMAL(4, 2),
    PRIMARY KEY (student_id, subject)
);
-- Tính điểm trung bình của mỗi sinh viên
SELECT
    student_id,
    AVG(score) AS average_score
FROM scores
GROUP BY student_id;

-- Hiển thị sinh viên có điểm trung bình >= 7.0
SELECT
    student_id,
    AVG(score) AS average_score
FROM scores
GROUP BY student_id
HAVING AVG(score) >= 7.0;

-- Hiển thị sinh viên có điểm trung bình cao nhất
SELECT
    student_id,
    AVG(score) AS average_score
FROM scores
GROUP BY student_id
HAVING AVG(score) = (
    SELECT MAX(average_score)
    FROM (
        SELECT AVG(score) AS average_score
        FROM scores
        GROUP BY student_id
    ) AS student_averages
);

-- Hiển thị sinh viên có điểm trung bình cao hơn điểm trung bình chung của tất cả sinh viên
SELECT
    student_id,
    AVG(score) AS average_score
FROM scores
GROUP BY student_id
HAVING AVG(score) > (
    SELECT AVG(average_score)
    FROM (
        SELECT AVG(score) AS average_score
        FROM scores
        GROUP BY student_id
    ) AS student_averages
);

-- E6

-- Hiển thị mã đơn hàng, tên khách hàng và tổng tiền đơn hàng
SELECT
    o.order_id,
    c.customer_name,
    SUM(oi.quantity * oi.price) AS total_amount
FROM orders o
INNER JOIN customers c
    ON o.customer_id = c.customer_id
INNER JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY o.order_id, c.customer_name;

-- Tính tổng doanh thu của mỗi khách hàng
SELECT
    c.customer_id,
    c.customer_name,
    SUM(oi.quantity * oi.price) AS total_revenue
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
INNER JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.customer_name;

-- Chỉ hiển thị khách hàng có tổng doanh thu lớn hơn 20.000.000
SELECT
    c.customer_id,
    c.customer_name,
    SUM(oi.quantity * oi.price) AS total_revenue
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
INNER JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.customer_name
HAVING SUM(oi.quantity * oi.price) > 20000000;

-- Hiển thị khách hàng có doanh thu cao nhất
SELECT
    c.customer_id,
    c.customer_name,
    SUM(oi.quantity * oi.price) AS total_revenue
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
INNER JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.customer_name
HAVING SUM(oi.quantity * oi.price) = (
    SELECT MAX(total_revenue)
    FROM (
        SELECT SUM(oi.quantity * oi.price) AS total_revenue
        FROM orders o
        INNER JOIN order_items oi
            ON o.order_id = oi.order_id
        GROUP BY o.customer_id
    ) AS revenue_table
);