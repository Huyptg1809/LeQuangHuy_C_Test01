CREATE DATABASE StoreManage

USE StoreManage;

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
