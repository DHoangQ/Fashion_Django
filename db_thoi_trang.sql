CREATE  DATABASE db_thoi_trang;
USE db_thoi_trang;

-- CREATE TABLE users (
-- ma_nv INT AUTO_INCREMENT PRIMARY KEY,
-- username VARCHAR(50) NOT NULL UNIQUE,
-- password VARCHAR(255) NOT NULL,
-- role ENUM('admin', 'mod', 'guest') NOT NULL
-- );
-- thêm dữ liệu trước

CREATE TABLE users (
id_user INT AUTO_INCREMENT PRIMARY KEY,
avatar TEXT NOT NULL,
account_type VARCHAR(100) NOT NULL,
token VARCHAR(100) NULL,
password VARCHAR(100) NULL,
create_at DATETIME NOT NULL,
update_at DATETIME NOT NULL,
create_by VARCHAR(50) NOT NULL,
update_by VARCHAR(50) NOT NULL
);
CREATE TABLE employees(
id_emp INT AUTO_INCREMENT PRIMARY KEY,
id_user INT NULL,
emp_name VARCHAR(100) NOT NULL,
email VARCHAR(100) NOT NULL,
phone VARCHAR(15) NOT NULL,
address VARCHAR(100) NOT NULL,
salary INT NOT NULL,
FOREIGN KEY (id_user) REFERENCES users(id_user) ON DELETE CASCADE
);

CREATE TABLE customer(
id_customer INT AUTO_INCREMENT PRIMARY KEY,
id_user INT NULL,
name_customer VARCHAR(100) NOT NULL,
email VARCHAR(100) NOT NULL,
phone VARCHAR(15) NOT NULL,
address VARCHAR(100) NOT NULL,
FOREIGN KEY (id_user) REFERENCES users(id_user) ON DELETE CASCADE
);

CREATE TABLE categories(
id_category INT AUTO_INCREMENT PRIMARY KEY,
category_name VARCHAR(100) NOT NULL,
icon TEXT NOT NULL,
image_banner TEXT NOT NULL,
create_at DATETIME NOT NULL,
update_at DATETIME NOT NULL,
create_by VARCHAR(50) NOT NULL,
update_by VARCHAR(50) NOT NULL
);

CREATE TABLE products (
id_product INT AUTO_INCREMENT PRIMARY KEY,
product_name VARCHAR(50) NOT NULL,
SKU VARCHAR(50) NOT NULL UNIQUE,
id_category INT NOT NULL,
export_price INT NOT NULL,
product_quantity INT NOT NULL,
product_description VARCHAR(1000) NOT NULL,
image_product TEXT NOT NULL,
brand VARCHAR(200) NOT NULL,
size VARCHAR(10) NOT NULL,
color VARCHAR(255) NOT NULL,
activate BOOLEAN NOT NULL,
status ENUM('Còn hàng','Hết hàng'),
create_at DATETIME NOT NULL,
update_at DATETIME NOT NULL,
create_by VARCHAR(50) NOT NULL,
update_by VARCHAR(50) NOT NULL,
FOREIGN KEY (id_category) REFERENCES categories(id_category) ON DELETE CASCADE
);



CREATE TABLE import_products(
id_imp INT AUTO_INCREMENT PRIMARY KEY,
id_product INT NOT NULL,
import_quantity INT NOT NULL,
import_price INT NOT NULL,
supplier VARCHAR(100) NOT NULL,
import_at DATETIME NOT NULL,
update_at DATETIME NOT NULL,
import_by VARCHAR(50) NOT NULL,
update_by VARCHAR(50) NOT NULL,
FOREIGN KEY (id_product) REFERENCES products(id_product) ON DELETE CASCADE
);

CREATE TABLE coupons(
id_coupon INT AUTO_INCREMENT PRIMARY KEY,
code VARCHAR(50) NOT NULL,
discount_value INT NOT NULL, -- tính theo % nhe
discount_type ENUM('discount', 'discount_product') NOT NULL,
time_used INT NOT NULL,
start_date DATETIME NOT NULL,
end_date DATETIME NOT NULL,
activate BOOLEAN NOT NULL,
create_at DATETIME NOT NULL,
update_at DATETIME NOT NULL,
create_by VARCHAR(50) NOT NULL,
update_by VARCHAR(50) NOT NULL
);


CREATE TABLE product_coupons(
id INT AUTO_INCREMENT PRIMARY KEY,
id_coupon INT NOT NULL,
id_product INT NOT NULL,
FOREIGN KEY (id_coupon) REFERENCES coupons(id_coupon) ON DELETE CASCADE,
FOREIGN KEY (id_product) REFERENCES products(id_product) ON DELETE CASCADE
);

CREATE TABLE cart(
id_cart INT AUTO_INCREMENT PRIMARY KEY,
id_customer INT NOT NULL,
total_price INT NOT NULL,
activate BOOLEAN NOT NULL,
create_at DATETIME NOT NULL,
update_at DATETIME NOT NULL,
FOREIGN KEY (id_customer) REFERENCES customer(id_customer) ON DELETE CASCADE
);

CREATE TABLE order_product(
id_order INT AUTO_INCREMENT PRIMARY KEY,
id_cart INT NOT NULL,
id_coupon INT NOT NULL,
order_description TEXT NOT NULL,
total INT NOT NULL,
FOREIGN KEY (id_cart) REFERENCES cart(id_cart) ON DELETE CASCADE,
FOREIGN KEY (id_coupon) REFERENCES coupons(id_coupon) ON DELETE CASCADE
);

CREATE TABLE cart_detail(
id INT AUTO_INCREMENT PRIMARY KEY,
id_cart INT NOT NULL,
id_product INT NOT NULL,
id_coupon INT NOT NULL,
number INT NOT NULL,
price INT NOT NULL,
status_product BOOLEAN NOT NULL,
FOREIGN KEY (id_cart) REFERENCES cart(id_cart) ON DELETE CASCADE,
FOREIGN KEY (id_coupon) REFERENCES coupons(id_coupon) ON DELETE CASCADE,
FOREIGN KEY (id_product) REFERENCES products(id_product) ON DELETE CASCADE
);



CREATE TABLE payment(
id_payment INT AUTO_INCREMENT PRIMARY KEY,
id_order INT NOT NULL,
payment_status BOOLEAN NOT NULL,
order_status ENUM('waiting for confirmation', 'canceled', 'confirmed', 'delivered successfully') NOT NULL,
FOREIGN KEY (id_order) REFERENCES order_product(id_order) ON DELETE CASCADE
);


CREATE TABLE reviews(
id_review INT AUTO_INCREMENT PRIMARY KEY,
id_customer INT NOT NULL,
star INT NOT NULL,
review_description TEXT NULL,
FOREIGN KEY (id_customer) REFERENCES customer(id_customer) ON DELETE CASCADE
);

CREATE TABLE wishlists(
id_wishlist INT AUTO_INCREMENT PRIMARY KEY,
id_customer INT NOT NULL,
id_product INT NOT NULL,
FOREIGN KEY (id_customer) REFERENCES customer(id_customer) ON DELETE CASCADE,
FOREIGN KEY (id_product) REFERENCES products(id_product) ON DELETE CASCADE
);
select*from wishlists;


CREATE TABLE landing_pages(
id_landing_pages INT AUTO_INCREMENT PRIMARY KEY,
id_emp INT NOT NULL,
image TEXT NOT NULL,
activate BOOLEAN NOT NULL,
create_at DATETIME NOT NULL,
update_at DATETIME NOT NULL,
create_by VARCHAR(50) NOT NULL,
update_by VARCHAR(50) NOT NULL,
FOREIGN KEY (id_emp) REFERENCES employees(id_emp) ON DELETE CASCADE
);
-- làm cách nào liên kết 2 bảng user với employees với nhau nếu account_type là admin hoặc là mod
select * from customer;
-- CREATE TABLE users (
-- id_user INT AUTO_INCREMENT PRIMARY KEY,
-- avatar TEXT NOT NULL,
-- account_type VARCHAR(100) NOT NULL,
-- token VARCHAR(100) NULL,
-- password VARCHAR(100) NULL,
-- create_at DATETIME NOT NULL,
-- update_at DATETIME NOT NULL,
-- create_by VARCHAR(50) NOT NULL,
-- update_by VARCHAR(50) NOT NULL
-- );

-- cart
-- CREATE TABLE customer(
-- id_customer INT AUTO_INCREMENT PRIMARY KEY,
-- id_user INT NULL,
-- name_customer VARCHAR(100) NOT NULL,
-- email VARCHAR(100) NOT NULL,
-- phone VARCHAR(15) NOT NULL,
-- address VARCHAR(100) NOT NULL,
-- FOREIGN KEY (id_user) REFERENCES users(id_user) ON DELETE CASCADE
-- );

-- CREATE TABLE employees(
-- id_emp INT AUTO_INCREMENT PRIMARY KEY,
-- id_user INT NULL,
-- emp_name VARCHAR(100) NOT NULL,
-- email VARCHAR(100) NOT NULL,
-- phone VARCHAR(15) NOT NULL,
-- address VARCHAR(100) NOT NULL,
-- salary INT NOT NULL,
-- FOREIGN KEY (id_user) REFERENCES users(id_user) ON DELETE CASCADE
-- );


-- CREATE TABLE categories(
-- id_category INT AUTO_INCREMENT PRIMARY KEY,
-- category_name VARCHAR(100) NOT NULL,
-- icon TEXT NOT NULL,
-- image_banner TEXT NOT NULL,
-- created_at DATETIME NOT NULL,
-- updated_at DATETIME NOT NULL,
-- create_by VARCHAR(50) NOT NULL,
-- update_by VARCHAR(50) NOT NULL
-- );

-- CREATE TABLE products (
-- id_product INT AUTO_INCREMENT PRIMARY KEY,
-- product_name VARCHAR(50) NOT NULL,
-- SKU VARCHAR(50) NOT NULL,
-- id_category INT NOT NULL,
-- export_price INT NOT NULL,
-- product_quantity INT NOT NULL,
-- product_description VARCHAR(1000) NOT NULL,
-- image_product TEXT NOT NULL,
-- brand VARCHAR(200) NOT NULL,
-- size VARCHAR(10) NOT NULL,
-- color VARCHAR(255) NOT NULL,
-- activate BOOLEAN NOT NULL,
-- create_at DATETIME NOT NULL,
-- update_at DATETIME NOT NULL,
-- create_by VARCHAR(50) NOT NULL,
-- update_by VARCHAR(50) NOT NULL,
-- FOREIGN KEY (id_category) REFERENCES categories(id_category) ON DELETE CASCADE
-- );

-- CREATE TABLE import_products(
-- id_imp INT AUTO_INCREMENT PRIMARY KEY,
-- id_product INT NOT NULL,
-- import_quantity INT NOT NULL,
-- import_price INT NOT NULL,
-- supplier VARCHAR(100) NOT NULL,
-- import_at DATETIME NOT NULL,
-- update_at DATETIME NOT NULL,
-- import_by VARCHAR(50) NOT NULL,
-- update_by VARCHAR(50) NOT NULL,
-- FOREIGN KEY (id_product) REFERENCES products(id_product) ON DELETE CASCADE
-- );

-- CREATE TABLE coupons(
-- id_coupon INT AUTO_INCREMENT PRIMARY KEY,
-- code VARCHAR(50) NOT NULL,
-- discount_value INT NOT NULL, -- tính theo % nhe
-- discount_type ENUM('discount', 'discount_product') NOT NULL,
-- time_used INT NOT NULL,
-- start_date DATETIME NOT NULL,
-- end_date DATETIME NOT NULL,
-- activate BOOLEAN NOT NULL,
-- create_at DATETIME NOT NULL,
-- update_at DATETIME NOT NULL,
-- create_by VARCHAR(50) NOT NULL,
-- update_by VARCHAR(50) NOT NULL
-- );

-- CREATE TABLE cart(
-- id_cart INT AUTO_INCREMENT PRIMARY KEY,
-- id_customer INT NOT NULL,
-- total_price INT NOT NULL,
-- activate BOOLEAN NOT NULL,
-- create_at DATETIME NOT NULL,
-- update_at DATETIME NOT NULL,
-- FOREIGN KEY (id_customer) REFERENCES customer(id_customer) ON DELETE CASCADE
-- );

-- CREATE TABLE order_product(
-- id_order INT AUTO_INCREMENT PRIMARY KEY,
-- id_cart INT NOT NULL,
-- id_coupon INT NOT NULL,
-- order_description TEXT NOT NULL,
-- total INT NOT NULL,
-- FOREIGN KEY (id_cart) REFERENCES cart(id_cart) ON DELETE CASCADE,
-- FOREIGN KEY (id_coupon) REFERENCES coupons(id_coupon) ON DELETE CASCADE
-- );

-- CREATE TABLE cart_detail(
-- id INT AUTO_INCREMENT PRIMARY KEY,
-- id_cart INT NOT NULL,
-- id_product INT NOT NULL,
-- id_coupon INT NOT NULL,
-- number INT NOT NULL,
-- price INT NOT NULL,
-- status_product BOOLEAN NOT NULL,
-- FOREIGN KEY (id_cart) REFERENCES cart(id_cart) ON DELETE CASCADE,
-- FOREIGN KEY (id_coupon) REFERENCES product_coupons(id_coupon) ON DELETE CASCADE,
-- FOREIGN KEY (id_product) REFERENCES products(id_product) ON DELETE CASCADE
-- );

insert into cart(id_customer, total_price, activate, create_at, update_at) values
(1, 0, True, '2024-06-26','2024-06-26');

insert into coupons(code, discount_value, discount_type, time_used, start_date, end_date, activate, create_at, update_at, create_by, update_by)values
('abc1234', 10, 'discount_product', 8,'2024-06-26','2024-07-04', false, '2024-06-26','2024-06-26', 'havanloi', 'havanloi');

insert into import_products(id_product, import_quantity, import_price, supplier, import_at, update_at, import_by, update_by) values
(1, 10, 800000, 'Xuân Mai','2024-06-26','2024-06-26', 'havanloi', 'havanloi');
update products set product_quantity = 10 where id_product = 1;
insert into products(product_name, SKU, id_category, export_price, product_quantity, product_description, image_product, brand, size, color, activate, create_at, update_at, create_by, update_by) values
('nike air force 1', 'NAF-XL-BR', 1, 1000000, 0, ' được sử dụng tất cả những công nghệ tân tiến nhất lúc bấy giờ của Nike bao gồm: Bộ đệm Air, đế viền tròn, quai dán strap ở mắt cá chân, hệ thống dây giày đa năng cùng thiết kế theo chiều phái tối giản và chất liệu chủ yếu là da.', 'nike_force_1_brown.jpg', 'nike', 'XL', 'Brown', False, '2024-06-26','2024-06-26', 'havanloi', 'havanloi'),
('nike air force 1', 'NAF-L-BR', 1, 1000000, 0, ' được sử dụng tất cả những công nghệ tân tiến nhất lúc bấy giờ của Nike bao gồm: Bộ đệm Air, đế viền tròn, quai dán strap ở mắt cá chân, hệ thống dây giày đa năng cùng thiết kế theo chiều phái tối giản và chất liệu chủ yếu là da.', 'nike_force_1_brown.jpg', 'nike', 'L', 'Brown', False, '2024-06-26','2024-06-26', 'havanloi', 'havanloi'),
('nike air force 1', 'NAF-XXL-BR', 1, 1000000, 0, ' được sử dụng tất cả những công nghệ tân tiến nhất lúc bấy giờ của Nike bao gồm: Bộ đệm Air, đế viền tròn, quai dán strap ở mắt cá chân, hệ thống dây giày đa năng cùng thiết kế theo chiều phái tối giản và chất liệu chủ yếu là da.', 'nike_force_1_brown.jpg', 'nike', 'XXL', 'Brown', False, '2024-06-26','2024-06-26', 'havanloi', 'havanloi'),
('nike air force 1', 'NAF-XL-WH', 1, 1000000, 0, ' được sử dụng tất cả những công nghệ tân tiến nhất lúc bấy giờ của Nike bao gồm: Bộ đệm Air, đế viền tròn, quai dán strap ở mắt cá chân, hệ thống dây giày đa năng cùng thiết kế theo chiều phái tối giản và chất liệu chủ yếu là da.', 'nike_force_1_white.jpg', 'nike', 'XL', 'White', False, '2024-06-26','2024-06-26', 'havanloi', 'havanloi'),
('nike air force 1', 'NAF-XL-WT', 1, 1000000, 0, ' được sử dụng tất cả những công nghệ tân tiến nhất lúc bấy giờ của Nike bao gồm: Bộ đệm Air, đế viền tròn, quai dán strap ở mắt cá chân, hệ thống dây giày đa năng cùng thiết kế theo chiều phái tối giản và chất liệu chủ yếu là da.', 'nike_force_1_white.jpg', 'nike', 'L', 'White', False, '2024-06-26','2024-06-26', 'havanloi', 'havanloi'),
('nike air force 1', 'NAF-XL-WX', 1, 1000000, 0, ' được sử dụng tất cả những công nghệ tân tiến nhất lúc bấy giờ của Nike bao gồm: Bộ đệm Air, đế viền tròn, quai dán strap ở mắt cá chân, hệ thống dây giày đa năng cùng thiết kế theo chiều phái tối giản và chất liệu chủ yếu là da.', 'nike_force_1_white.jpg', 'nike', 'XXL', 'White', False, '2024-06-26','2024-06-26', 'havanloi', 'havanloi');

insert into categories(category_name, icon, image_banner, create_at, update_at, create_by, update_by) values
('Shoes', 'sneakers.png', 'shoes.png', '2024-06-26','2024-06-26', 'havanloi', 'havanloi');
insert into employees(id_user, emp_name, email, phone, address, salary) values
(1, 'Hà Lợi', 'loi2003zzz@gmail.com', 431231231, 'Hạ Long', 10000000);
insert into customer(id_user, name_customer, email, phone, address) value 
(1, 'ha van loi', 'fsdfadsfasdfa', 231231231, 'bai chay');
update users set avatar = "image_user_01.jpg" where id_user = 1;

insert into users(avatar, account_type, password, create_at, update_at, create_by, update_by) value
('image_user_01.jpg', 'user', 'abc123','2024-06-23','2024-06-23','havanloi','havanloi' );

insert into product_coupons(id_coupon, id_product) value 
(1, 4);

insert into import_products(id_product, import_quantity,import_price,supplier,import_at, update_at,import_by, update_by ) VALUES 
(1, 10, 500000, 'Quanh Hanh', '2024-07-06','2024-07-06','haloi','haloi'),
(6, 15, 500000, 'Luis Vuiton', '2024-07-06','2024-07-06','haloi','haloi');


select * from cart;
select * from import_products;
select *from categories;
select * from employees;
select * from users;
select * from customer;
select * from products;
select * from coupons;
select * from wishlists;
select * from auth_user;
select * from auth_user;

SHOW TABLES;

DELETE FROM products
WHERE id_product BETWEEN 144 AND 277;

