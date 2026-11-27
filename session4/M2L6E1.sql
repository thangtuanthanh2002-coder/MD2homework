USE students;

-- E1
CREATE TABLE categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255)
);

INSERT INTO categories (name)
VALUES
('Điện thoại'),
('Laptop'),
('Phụ kiện');

SELECT * FROM categories;


-- Thêm 3 sản phẩm mới
INSERT INTO products (product_name, category, price, quantity)
VALUES
('iPhone 16', 'Điện thoại', 20000000, 10),
('MacBook Air', 'Laptop', 25000000, 5),
('Tai nghe Bluetooth', 'Phụ kiện', 500000, 20);
SELECT * FROM products;

-- Cập nhật giá sản phẩm
UPDATE products
SET price = 18000000
WHERE product_name = 'iPhone 16';

-- Xóa một sản phẩm
DELETE FROM products
WHERE product_name = 'Tai nghe Bluetooth';

-- Hiển thị tất cả sản phẩm, sắp xếp theo giá
SELECT *
FROM products
ORDER BY price DESC;

-- Thống kê số lượng sản phẩm trong từng danh mục
SELECT
    category,
    COUNT(product_id) AS total_products
FROM products
GROUP BY category;