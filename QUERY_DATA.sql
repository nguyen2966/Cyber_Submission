-- Tìm 5 người có nhiều lượt like nhà hàng nhất
-- 1. JOIN bảng like_res và user 
-- 2. Nhóm bảng JOIN theo thuộc tính user_id
-- 3. Chọn full_name. email và số lượt like  
-- 4. Sắp xếp giảm dần theo like_count và giới hạn 5 người
SELECT U.`full_name`, U.`email`, COUNT(*) AS `like_count`
FROM `user` U JOIN `like_res` L ON U.`user_id` = L.`user_id`
GROUP BY U.`user_id`
ORDER BY `like_count` DESC
LIMIT 5;


-- Tìm 2 nhà hàng có nhiều lượt like nhất
-- 1. JOIN bảng like_res và restaurant 
-- 2. Nhóm bảng JOIN theo thuộc tính res_id
-- 3. Chọn res_name và số lượt like  
-- 4. Sắp xếp giảm dần theo like_count và giới hạn 2 restaurant
SELECT R.`res_name`, COUNT(*) AS `like_count`
FROM `restaurant` R JOIN `like_res` L ON R.`res_id` = L.`res_id`
GROUP BY R.`res_id`
ORDER BY `like_count` DESC
LIMIT 2;

--Tìm người đặt hàng nhiều nhất
-- yêu cầu này có thể hiểu theo hai nghĩa :
-- 1. Tìm người có nhiều đơn hàng nhất
-- 2. Tìm người có tổng số lượng món ăn (amount) trong các đơn hàng nhiều nhất

-- Tìm người có nhiều đơn hàng nhất
--1.JOIN user và order, nhóm lại theo user_id
--2.Chọn ra full_name và order_count đại diện cho COUNT(*)
--3.Sắp xếp giảm dần theo order_count
--4.Limit 1 user
SELECT U.`full_name`, COUNT(*) AS `order_count`
FROM `user` U JOIN `order` O ON U.`user_id` = O.`user_id`
GROUP BY U.`user_id`
ORDER BY `order_count` DESC
LIMIT 1;

-- Tìm người có tổng số lượng món ăn trong các đơn hàng nhiều nhất
--1. Tạo bảng với thuộc tính num_food đại diện cho SUM(amount) 
--2. JOIN bảng vừa tạo với bảng user để lấy full_name
--3. Sắp xếp giảm dần theo num_food
--4. Limit 1 user
SELECT `full_name`, `num_food`
FROM `user` U JOIN
	(
		SELECT `user_id`, SUM(`amount`) AS `num_food`
		FROM `order` 
		GROUP BY `user_id`
	) O ON U.`user_id` = O.`user_id`
ORDER BY `num_food` DESC
LIMIT 1;


-- Tìm người không có bất kì hoạt động nào trong hệ thống
-- Nghĩa là ta chỉ cần kiểm tra user_id của người đó không tồn tại trong cả 3 bảng order, like_res, rate_res
SELECT `full_name`
FROM `user`
WHERE `user_id` NOT IN (
	SELECT `user_id`
	FROM `order`
) AND `user_id` NOT IN (
	SELECT `user_id`
	FROM `like_res`
) AND `user_id` NOT IN (
	SELECT `user_id`
	FROM `rate_res`
)