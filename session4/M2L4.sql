USE students;
ALTER TABLE students
ADD COLUMN email VARCHAR(100);

-- E1
INSERT INTO students
(student_id, full_name, birth_date, gender, email)
VALUES
(1, 'Nguyen Van A', '2002-05-10', 'Nam', 'a@gmail.com'),
(2, 'Tran Thi B', '2003-08-15', 'Nu', 'b@gmail.com'),
(3, 'Le Van C', '2002-12-20', 'Nam', NULL),
(4, 'Pham Thi D', '2003-03-25', 'Nu', 'C@gmail.com'),
(5, 'Hoang Van E', '2002-09-05', 'Nam', 'E@gmail.com');

-- E2
UPDATE students
SET email = 'b@gmail.com'
WHERE student_id = 2;

SELECT *
FROM students
WHERE student_id = 2;

UPDATE students
SET gender = 'Nu'
WHERE student_id = 5;

SELECT *
FROM students
WHERE student_id = 5;

DELETE FROM students
WHERE student_id = 3;

SELECT *
FROM students;

-- E3
SELECT *
FROM students
WHERE birth_date BETWEEN '2003-01-01' AND '2005-12-31';

SELECT *
FROM students
WHERE gender IN ('Nam', 'Nu');

SELECT *
FROM students
WHERE student_id IN ('1', '4', '5');

SELECT student_id, full_name, birth_date
FROM students;

-- E4
SELECT *
FROM students
WHERE email IS NULL;

SELECT *
FROM students
WHERE email IS NOT NULL;

SELECT *
FROM students
WHERE full_name LIKE 'Ng%';

SELECT *
FROM students
WHERE NOT gender = 'Nam';

-- E5
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    full_name VARCHAR(100),
    birth_year INT,
    department VARCHAR(50),
    salary DECIMAL(15, 2),
    phone VARCHAR(20)
);

INSERT INTO employees
(emp_id, full_name, birth_year, department, salary, phone)
VALUES
(1, 'Nguyen Van Anh', 2000, 'IT', 15000000, '0901234567'),
(2, 'Tran Thi Anh', 1999, 'HR', 12000000, '0912345678'),
(3, 'Le Van Nam', 1998, 'IT', 18000000, NULL),
(4, 'Pham Thi Hoa', 2001, 'Sales', 9000000, '0923456789'),
(5, 'Hoang Minh Anh', 2000, 'HR', 20000000, NULL),
(6, 'Do Van Hung', 1997, 'IT', 25000000, '0934567890'),
(7, 'Nguyen Thi Lan', 2002, 'Marketing', 4500000, '0945678901'),
(8, 'Bui Van Long', 1996, 'Sales', 3500000, NULL),
(9, 'Vu Thi Mai Anh', 2001, 'IT', 11000000, '0956789012'),
(10, 'Tran Van Duc', 1995, 'HR', 8000000, '0967890123');

-- HIEN THI TOAN BO NHAN VIEN
SELECT *
FROM employees;

-- NHAN VIEN CO LUONG TU 10 DEN 20 TRIEU
SELECT *
FROM employees
WHERE salary BETWEEN 10000000 AND 20000000;

-- NHAN VIEN THUOC PHONG IT HOAC HR
SELECT *
FROM employees
WHERE department IN ('IT', 'HR');

-- NHAN VIEN CO HO TEN CHUA CHU ANH
SELECT *
FROM employees
WHERE full_name LIKE '%Anh%';

-- NHAN VIEN CHUA CO SO DIEN THOAI
SELECT *
FROM employees
WHERE phone IS NULL;

-- TANG LUONG 10% CHO NHAN VIEN IT
UPDATE employees
SET salary = salary * 1.1
WHERE department = 'IT';

-- Kiem tra
SELECT *
FROM employees
WHERE department = 'IT';

-- CAP NHAT SO DIEN THOAI CHO NHAN VIEN CHUA CO SO DIEN THOAI
UPDATE employees
SET phone = '0987654321'
WHERE phone IS NULL;

-- Kiem tra
SELECT *
FROM employees
WHERE phone IS NOT NULL;

-- 10. XOA NHAN VIEN CO LUONG DUOI 5 TRIEU
DELETE FROM employees
WHERE salary < 5000000;

-- Kiem tra ket qua cuoi cung
SELECT *
FROM employees;

-- E6

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(15, 2),
    quantity INT
);

-- INSERT: Thêm sản phẩm
INSERT INTO products
(product_id, product_name, category, price, quantity)
VALUES
(1, 'Samsung Galaxy Book', 'Laptop', 15000000, 10),
(2, 'Dell Inspiron', 'Laptop', 12000000, 5),
(3, 'Samsung Galaxy A20', 'Phone', 18000000, 8),
(4, 'iPhone 18', 'Phone', 20000000, 0),
(5, 'Samsung Galaxy Tab', 'Tablet', 9000000, 12),
(6, 'iPad Air', 'Tablet', 14000000, 0),
(7, 'Lenovo', 'Laptop', 25000000, 3);

-- Kiểm tra dữ liệu ban đầu
SELECT * FROM products;

-- SELECT: Giá từ 5 triệu đến 15 triệu
SELECT * FROM products
WHERE price BETWEEN 5000000 AND 15000000;

-- SELECT: Laptop hoặc Tablet
SELECT * FROM products
WHERE category IN ('Laptop', 'Tablet');

-- SELECT: Tên bắt đầu bằng Sam
SELECT * FROM products
WHERE product_name LIKE 'Sam%';

-- SELECT: Không thuộc loại Phone
SELECT * FROM products
WHERE NOT category = 'Phone';

-- UPDATE: Giảm giá 5% cho Laptop
UPDATE products
SET price = price * 0.95
WHERE category = 'Laptop';

-- Kiểm tra sau khi cập nhật
SELECT * FROM products;

-- DELETE: Xóa sản phẩm hết hàng
DELETE FROM products
WHERE quantity = 0;

-- Kiểm tra sau khi xóa
SELECT * FROM products;
