USE students;
SELECT *
FROM products
WHERE price BETWEEN 500000 AND 20000000;

-- Tìm sản phẩm có tên chứa chuỗi ký tự 
SELECT *
FROM products
WHERE product_name LIKE '%phone%';

-- Tính giá trung bình của sản phẩm cho mỗi danh mục 
SELECT
    category,
    AVG(price) AS average_price
FROM products
GROUP BY category;

-- Tìm sản phẩm có giá cao hơn giá trung bình của toàn bộ sản phẩm
SELECT *
FROM products
WHERE price > (
    SELECT AVG(price)
    FROM products
);

-- Tìm sản phẩm có giá thấp nhất cho từng danh mục
SELECT *
FROM products p
WHERE price = (
    SELECT MIN(price)
    FROM products
    WHERE category = p.category
);