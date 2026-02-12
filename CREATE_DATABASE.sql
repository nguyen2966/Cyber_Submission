CREATE DATABASE IF NOT EXISTS `Restaurants`;

--Bảng Users
CREATE TABLE IF NOT EXISTS `user` (
	`user_id` INT PRIMARY KEY AUTO_INCREMENT,
	`email` VARCHAR(255),
	`full_name` VARCHAR(255),
	`password` VARCHAR(255)
);


--Bang Restaurants
CREATE TABLE IF NOT EXISTS `restaurant` (
	`res_id` INT PRIMARY KEY AUTO_INCREMENT,
	`res_name` VARCHAR(255),
	`Image` VARCHAR(255),
	`desc` VARCHAR(255)
);

-- Bang rate_res va like_res

-- Lay user_id va res_id lam composite key
CREATE TABLE IF NOT EXISTS `rate_res` (
	`user_id` INT,
	`res_id` INT,
	`amount` INT,
	`date_rate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (`user_id`) REFERENCES `user`(`user_id`),
	FOREIGN KEY (`res_id`) REFERENCES `restaurant`(`res_id`),
	PRIMARY KEY (`user_id`,`res_id`)
);

CREATE TABLE IF NOT EXISTS `like_res` (
	`user_id` INT,
	`res_id` INT,
	`date_like` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (`user_id`) REFERENCES `user`(`user_id`),
	FOREIGN KEY (`res_id`) REFERENCES `restaurant`(`res_id`),
	PRIMARY KEY (`user_id`,`res_id`)
);

--Bang food_type
CREATE TABLE IF NOT EXISTS `food_type` (
	`type_id` INT PRIMARY KEY AUTO_INCREMENT,
	`type_name` VARCHAR(255)
);

-- Bang food
CREATE TABLE IF NOT EXISTS `food` (
	`food_id` INT PRIMARY KEY AUTO_INCREMENT,
	`food_name` VARCHAR(255),
	`image` VARCHAR(255),
	`price`FLOAT,
	`desc` VARCHAR(255),
	`type_id` INT,
	FOREIGN KEY (`type_id`) REFERENCES `food_type`(`type_id`)
);

--Bang sub_food
CREATE TABLE IF NOT EXISTS `sub_food`(
	`sub_id` INT PRIMARY KEY AUTO_INCREMENT,
	`sub_name` VARCHAR(255),
	`sub_price` FLOAT,
	`food_id` INT,
	FOREIGN KEY (`food_id`) REFERENCES `food`(`food_id`)
);

--Bang order
CREATE TABLE IF NOT EXISTS `order`(
	`food_id` INT,
	`user_id` INT,
	`amount` INT,
	`code` VARCHAR(255),
	`arr_sub_id` VARCHAR(255),
	FOREIGN KEY (`food_id`) REFERENCES `food`(`food_id`),
	FOREIGN KEY (`user_id`) REFERENCES `user`(`user_id`)
);


--INSERT DATA--

INSERT INTO user (email, full_name, password) VALUES
('user1@gmail.com', 'Nguyen Van A', '123'),
('user2@gmail.com', 'Tran Van B', '123'),
('user3@gmail.com', 'Le Van C', '123'),
('user4@gmail.com', 'Pham Van D', '123'),
('user5@gmail.com', 'Hoang Van E', '123'),
('user6@gmail.com', 'Vo Van F', '123'),
('user7@gmail.com', 'Dang Van G', '123'),
('user8@gmail.com', 'Bui Van H', '123'),
('user9@gmail.com', 'Do Van I', '123'),
('user10@gmail.com', 'Ngo Van K', '123'),
('user11@gmail.com', 'Nguyen Cyber', '123');

INSERT INTO restaurant (res_name, Image, `desc`) VALUES
('Pizza House', 'pizza.jpg', 'Italian pizza'),
('Burger King', 'burger.jpg', 'Fast food burger'),
('Sushi World', 'sushi.jpg', 'Japanese sushi'),
('Pho Viet', 'pho.jpg', 'Vietnamese pho'),
('BBQ Garden', 'bbq.jpg', 'BBQ & Grill'),
('Hotpot City', 'hotpot.jpg', 'Hotpot buffet'),
('Seafood King', 'seafood.jpg', 'Fresh seafood'),
('Steak House', 'steak.jpg', 'Western steak'),
('Vegan Life', 'vegan.jpg', 'Healthy vegan food'),
('Coffee Corner', 'coffee.jpg', 'Coffee & drinks');

INSERT INTO food_type (type_name) VALUES
('Fast Food'),
('Japanese'),
('Vietnamese'),
('BBQ'),
('Hotpot'),
('Seafood'),
('Western'),
('Vegan'),
('Dessert'),
('Drink');

INSERT INTO food (food_name, image, price, `desc`, type_id) VALUES
('Cheese Pizza', 'pizza1.jpg', 10.5, 'Cheesy pizza', 1),
('Beef Burger', 'burger1.jpg', 8.0, 'Beef burger', 1),
('Salmon Sushi', 'sushi1.jpg', 15.0, 'Fresh salmon', 2),
('Pho Bo', 'pho1.jpg', 7.5, 'Beef noodle soup', 3),
('BBQ Pork', 'bbq1.jpg', 12.0, 'Grilled pork', 4),
('Seafood Hotpot', 'hotpot1.jpg', 18.0, 'Mixed seafood', 5),
('Grilled Shrimp', 'seafood1.jpg', 14.0, 'Fresh shrimp', 6),
('Beef Steak', 'steak1.jpg', 20.0, 'Medium rare steak', 7),
('Vegan Salad', 'vegan1.jpg', 9.0, 'Healthy salad', 8),
('Milk Tea', 'drink1.jpg', 4.0, 'Bubble milk tea', 10);

INSERT INTO sub_food (sub_name, sub_price, food_id) VALUES
('Extra Cheese', 2.0, 1),
('Double Beef', 3.0, 2),
('Wasabi', 0.5, 3),
('Extra Noodles', 1.0, 4),
('BBQ Sauce', 0.8, 5),
('Extra Seafood', 4.0, 6),
('Garlic Butter', 1.5, 7),
('Pepper Sauce', 1.0, 8),
('Avocado', 2.0, 9),
('Pearl Topping', 0.7, 10);

INSERT INTO rate_res (user_id, res_id, amount) VALUES
(1, 1, 5),
(2, 1, 4),
(3, 2, 5),
(4, 3, 4),
(5, 4, 5),
(6, 5, 3),
(7, 6, 4),
(8, 7, 5),
(9, 8, 4),
(10, 9, 5);


INSERT INTO like_res (user_id, res_id) VALUES
-- user 1 (7 likes)
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),

-- user 2 (6 likes)
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(2, 6),

-- user 3 (5 likes)
(3, 1),
(3, 3),
(3, 4),
(3, 5),

-- user 4 (4 likes)
(4, 1),
(4, 2),
(4, 4),

-- user 5 (3 likes)
(5, 1),
(5, 2),

-- user 6 (2 likes)
(6, 1),

-- user 7 (2 likes)
(7, 1),

-- user 8 (1 like)
(8, 1),

-- user 9 (1 like)
(9, 1),

-- user 10 (1 like)
(10, 1);


INSERT INTO `order` (food_id, user_id, amount, code, arr_sub_id) VALUES
-- User 1 (6 orders, tổng 18 món)
(1, 1, 2, 'ORD001', '1,2'),
(2, 1, 3, 'ORD002', '2'),
(3, 1, 1, 'ORD003', NULL),
(4, 1, 5, 'ORD004', '3'),
(5, 1, 4, 'ORD005', NULL),
(6, 1, 3, 'ORD006', '1'),

-- User 2 (4 orders, tổng 10 món)
(2, 2, 2, 'ORD007', NULL),
(3, 2, 3, 'ORD008', '2'),
(4, 2, 1, 'ORD009', NULL),
(5, 2, 4, 'ORD010', '1,3'),

-- User 3 (5 orders, tổng 12 món)
(1, 3, 2, 'ORD011', NULL),
(2, 3, 2, 'ORD012', '2'),
(3, 3, 3, 'ORD013', NULL),
(4, 3, 1, 'ORD014', NULL),
(5, 3, 4, 'ORD015', '1'),

-- User 4 (3 orders, tổng 6 món)
(6, 4, 2, 'ORD016', NULL),
(7, 4, 2, 'ORD017', NULL),
(8, 4, 2, 'ORD018', '3'),

-- User 5 (2 orders, tổng 9 món)
(9, 5, 4, 'ORD019', NULL),
(10, 5, 5, 'ORD020', '2'),

-- User 6 (1 order, tổng 10 món)
(1, 6, 10, 'ORD021', '1,2,3');

