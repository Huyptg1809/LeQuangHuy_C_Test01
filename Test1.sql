CREATE DATABASE StoreManage;

USE StoreManage;

-- CÂU 1 : TẠO BẢNG
CREATE TABLE categories (
    category_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE,
    category_description VARCHAR(255) NULL,
    category_status INT NOT NULL DEFAULT 1
);

CREATE TABLE posts (
    post_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    post_title VARCHAR(150) NOT NULL,
    post_content VARCHAR(255) NOT NULL,
    post_status INT NOT NULL DEFAULT 1,
    category_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

ALTER TABLE posts
ADD created_at DATETIME NULL;

ALTER TABLE posts
MODIFY post_content TEXT NOT NULL;

-- CÂU 2 : THÊM DỮ LIỆU
INSERT INTO categories (category_name, category_description, category_status) VALUES
('Công nghệ', 'Tin tức và cập nhật về công nghệ', 1),
('Thể thao', 'Thông tin các giải đấu thể thao', 1),
('Giải trí', 'Phim ảnh, âm nhạc, showbiz', 1);

INSERT INTO posts (post_title, post_content, post_status, category_id, created_at) VALUES
('Ra mắt điện thoại mới', 'Hãng điện thoại vừa ra mắt dòng sản phẩm mới.', 1, 1, '2026-04-17 08:30:00'),
('Đội tuyển quốc gia ', 'Trận đấu đầy kịch tính .', 1, 2, '2026-04-17 09:15:00'),
('Đánh giá phim ', 'Bộ phim được đầu tư kỹ xảo hoành tráng .', 0, 3, '2026-04-17 09:45:00'),
('Trí tuệ nhân tạo (AI)', 'Trí tuệ nhân tạo (AI) đang định hình lại mọi lĩnh vực trong cuộc sống. Từ y tế, giáo dục đến tài chính, AI không chỉ giúp tự động hóa các quy trình mà còn mở ra những khả năng phân tích dữ liệu khổng lồ. Việc áp dụng mô hình ngôn ngữ lớn (LLM) vào các sản phẩm tiêu dùng đã mang lại trải nghiệm cá nhân hóa chưa từng có. Tuy nhiên, cùng với sự phát triển này là những thách thức về bảo mật thông tin, đạo đức AI và sự thay đổi trên thị trường lao động. Do đó, việc xây dựng các khung pháp lý và tiêu chuẩn cho AI đang trở thành ưu tiên hàng đầu của nhiều quốc gia trên thế giới. Đây là một bước ngoặt lớn của nhân loại.', 1, 1, '2026-04-17 10:00:00'),
('mySQL là gì', 'MySQL là hệ quản trị cơ sở dữ liệu phổ biến, mạnh mẽ và dễ sử dụng. Nó hỗ trợ lưu trữ, truy vấn và quản lý dữ liệu hiệu quả, phù hợp cho cả ứng dụng nhỏ lẫn hệ thống lớn. Học MySQL giúp bạn xây dựng nền tảng vững chắc trong lập trình và phân tích dữ liệu.', 1, 2, '2026-02-12 06:36:00');

-- CÂU 3 : TRUY VẤN
SELECT post_id, post_title, post_content, post_status, category_id, created_at 
FROM posts;

SELECT post_id, post_title, post_content, post_status, category_id, created_at 
FROM posts 
WHERE post_status = 1;

SELECT post_id, post_title, post_content, post_status, category_id, created_at 
FROM posts 
WHERE category_id = 1;

SELECT post_title 
FROM posts;

-- CÂU 4 : UPDATE
UPDATE posts 
SET post_title = 'Học DATABASE cùng MySQL' 
WHERE post_id = 5;

UPDATE posts 
SET post_status = 0 
WHERE category_id = 3;

-- CÂU 5 : DELETE 
DELETE FROM posts 
WHERE post_status = 0;

DELETE FROM categories 
WHERE category_id = 3;
