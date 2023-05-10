CREATE DATABASE demo;
USE demo;
CREATE TABLE products(
    ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
    ProductCode VARCHAR(10),
    ProductName VARCHAR(60),
    ProductPrice FLOAT,
    ProductAmount int,
    ProductDescription TEXT(100),
    ProductStatus bit
);

ALTER TABLE products
MODIFY ProductCode VARCHAR(10) NOT NULL UNIQUE ;

-- thêm dữ liệu --
INSERT INTO products(ProductCode, ProductName, ProductPrice, ProductAmount, ProductDescription, ProductStatus)
VALUES ('123','Tủ lạnh',50000000,2,'Hàng mới',1),
       ('124','Máy Giặt',100000000,5,'Hàng mới',1),
       ('125','Điều hòa',10000000,3,'Hàng mới',1),
       ('126','Quạt',500000,2,'Hàng mới',1),
       ('127','Ti vi',12000000,8,'Hàng mới',1),
       ('128','Nồi cơm điện',800000,6,'Hàng mới',1),
       ('129','Bếp điện',8000000,8,'Hàng mới',1),
       ('130','Lò vi sóng',2000000,2,'Hàng mới',1);

-- tạo chỉ mục --
CREATE UNIQUE INDEX products_code
ON products(ProductCode);

CREATE INDEX Name_Price
ON products(ProductName,ProductPrice);

EXPLAIN SELECT * FROM  products
WHERE ProductCode = '128';

EXPLAIN SELECT * FROM products
WHERE ProductName ='Quạt' OR ProductPrice=800000;

ALTER TABLE products ADD INDEX index_product (ProductName);
DROP INDEX index_product ON products;

-- tạo view --
CREATE VIEW view_product AS
    SELECT ProductCode,ProductName,ProductPrice,ProductStatus
FROM  products;

-- sửa view --
CREATE OR REPLACE VIEW view_product AS
SELECT ProductCode,ProductName,ProductPrice,ProductAmount
FROM  products;

-- thêm mới vào bản ghi
INSERT INTO view_product VALUES ('131','Bóng đèn',10000,6);
-- ví dụ về With check Option
CREATE VIEW view_products
AS SELECT ProductCode,ProductName,ProductAmount,ProductPrice
FROM products
WHERE ProductPrice > 10000000
WITH CHECK OPTION ;

UPDATE view_products SET ProductName = 'PANASONIC' where ProductCode = '127';

-- xoa bản ghi trong view
DELETE FROM view_product where ProductCode= '131';

-- xóa View
DROP VIEW view_products;
DROP VIEW view_product;

-- store procedure
-- thêm bản ghi
DELIMITER //
CREATE PROCEDURE  add_DuLieu(IN Code varchar(10), IN Name varchar(60),price float,amount int,IN Description text(100),status bit)
BEGIN
    INSERT INTO products(ProductCode, ProductName, ProductPrice, ProductAmount, ProductDescription, ProductStatus)
        VALUES (Code,Name,price,amount,Description,status);
END //
DELIMITER // ;

CALL add_DuLieu('131','Nồi chiên không dầu',2500000,8,'Hàng mới',1);
-- hiển thị
DELIMITER //
CREATE PROCEDURE display()
BEGIN
    SELECT  * FROM products;
end //
DELIMITER //;

CALL display();

-- update theo id
DELIMITER //
CREATE PROCEDURE update_product(IN i_d int,IN Code varchar(10), IN Name varchar(60),price float,amount int,IN Description text(100),status bit)
BEGIN
    UPDATE products set ProductCode=Code,ProductName=Name,ProductPrice=price,ProductAmount=amount,ProductDescription=Description,ProductStatus=status
    WHERE ID = i_d;
end //
DELIMITER //

CALL update_product(5,'127','Ti vi',12000000,8,'Hàng mới',1);

-- xoá sản phẩm theo id
DELIMITER //
CREATE PROCEDURE delete_id(IN i_d int)
BEGIN
    DELETE FROM products WHERE ID=i_d;
end //
DELIMITER //;

CALL delete_id(10);

