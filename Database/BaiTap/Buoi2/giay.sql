-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Máy chủ: db
-- Thời gian đã tạo: Th2 19, 2022 lúc 08:37 AM
-- Phiên bản máy phục vụ: 8.0.28
-- Phiên bản PHP: 8.0.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `giay`
--
CREATE DATABASE IF NOT EXISTS `giay` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `giay`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `brand`
--

DROP TABLE IF EXISTS `brand`;
CREATE TABLE `brand` (
  `id` int NOT NULL,
  `name` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `brand`
--

INSERT INTO `brand` (`id`, `name`) VALUES
(1, 'Adidas'),
(2, 'Nike'),
(3, 'Vans'),
(4, 'Thượng Đình'),
(5, 'Balenciaga'),
(6, 'Converse'),
(7, 'Puma'),
(8, 'Reebok');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int NOT NULL,
  `name` text,
  `id_gender` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `name`, `id_gender`) VALUES
(1, 'Bóng đá', 1),
(2, 'Bóng đá', 2),
(3, 'Bóng rổ', 1),
(4, 'Bóng rổ', 2),
(5, 'Thời trang', 1),
(6, 'Thời trang', 2),
(7, 'Thời trang', 3),
(8, 'Chạy', 1),
(9, 'Chạy', 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `color`
--

DROP TABLE IF EXISTS `color`;
CREATE TABLE `color` (
  `id` int NOT NULL,
  `name` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `color`
--

INSERT INTO `color` (`id`, `name`) VALUES
(1, 'Đỏ'),
(2, 'Vàng'),
(3, 'Xanh lá'),
(4, 'Cam'),
(5, 'Hồng'),
(6, 'Đen'),
(7, 'Trắng');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `gioiTinh`
--

DROP TABLE IF EXISTS `gioiTinh`;
CREATE TABLE `gioiTinh` (
  `id` int NOT NULL,
  `gioitinh` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `gioiTinh`
--

INSERT INTO `gioiTinh` (`id`, `gioitinh`) VALUES
(1, 'Nam'),
(2, 'Nữ'),
(3, 'Unnisex');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `price`
--

DROP TABLE IF EXISTS `price`;
CREATE TABLE `price` (
  `id` int NOT NULL,
  `id_product` int DEFAULT NULL,
  `price_value` bigint DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `price`
--

INSERT INTO `price` (`id`, `id_product`, `price_value`, `date`) VALUES
(1, 1, 2000000, '2021-01-02'),
(2, 2, 3000000, '2020-12-02'),
(3, 3, 1000000, '2021-02-02'),
(4, 4, 20000000, '2021-01-10'),
(5, 5, 5000000, '2021-01-12'),
(6, 6, 6000000, '2021-02-15'),
(7, 7, 3000000, '2021-01-20');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int NOT NULL,
  `name` text,
  `description` text,
  `image` text,
  `id_category` int DEFAULT NULL,
  `id_brand` int DEFAULT NULL,
  `status` text,
  `id_gender` int DEFAULT NULL,
  `soLuong` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id`, `name`, `description`, `image`, `id_category`, `id_brand`, `status`, `id_gender`, `soLuong`) VALUES
(1, 'Giày Supperstar', 'Một đôi giày tuyệt vời...', 'link ảnh', 3, 1, 'Còn hàng', 1, 10),
(2, 'Giày Siêu nhân', 'Một đôi giày tuyệt vời...', 'link ảnh', 1, 3, 'Còn hàng', 2, 14),
(3, 'GIÀY NMD_R1 PRIMEBLUE', 'Một đôi giày tuyệt vời...', 'link ảnh', 4, 6, 'Hết hàng', 3, 0),
(4, 'YEEZY 500', 'Một đôi giày tuyệt vời...', 'link ảnh', 2, 2, 'Còn hàng', 3, 10),
(5, 'GIÀY OZELIA BOBA FETT', 'Một đôi giày tuyệt vời...', 'link ảnh', 1, 7, 'Hết hàng', 2, 0),
(6, 'GIÀY FORUM PREMIERE', 'Một đôi giày tuyệt vời...', 'link ảnh', 2, 4, 'Hết hàng', 1, 0),
(7, 'GIÀY ZX 5K BOOST', 'Một đôi giày tuyệt vời...', 'link ảnh', 1, 6, 'Còn hàng', 2, 10);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `produc_color`
--

DROP TABLE IF EXISTS `produc_color`;
CREATE TABLE `produc_color` (
  `id_product` int NOT NULL,
  `id_color` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `produc_color`
--

INSERT INTO `produc_color` (`id_product`, `id_color`) VALUES
(1, 1),
(3, 2),
(2, 3),
(6, 3),
(7, 4),
(4, 5),
(5, 6);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `produc_size`
--

DROP TABLE IF EXISTS `produc_size`;
CREATE TABLE `produc_size` (
  `id_product` int NOT NULL,
  `id_size` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `produc_size`
--

INSERT INTO `produc_size` (`id_product`, `id_size`) VALUES
(3, 1),
(1, 2),
(2, 3),
(4, 5),
(6, 6),
(7, 7),
(5, 9);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `size`
--

DROP TABLE IF EXISTS `size`;
CREATE TABLE `size` (
  `id` int NOT NULL,
  `name_size` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `size`
--

INSERT INTO `size` (`id`, `name_size`) VALUES
(1, 35),
(2, 36),
(3, 37),
(4, 38),
(5, 39),
(6, 40),
(7, 41),
(8, 42),
(9, 43);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `size_color`
--

DROP TABLE IF EXISTS `size_color`;
CREATE TABLE `size_color` (
  `id_size` int NOT NULL,
  `id_color` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `size_color`
--

INSERT INTO `size_color` (`id_size`, `id_color`) VALUES
(1, 1),
(2, 1),
(3, 2),
(7, 3),
(8, 4),
(4, 5),
(6, 6),
(5, 7),
(9, 7);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_gender` (`id_gender`);

--
-- Chỉ mục cho bảng `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `gioiTinh`
--
ALTER TABLE `gioiTinh`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `price`
--
ALTER TABLE `price`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_product` (`id_product`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_category` (`id_category`),
  ADD KEY `id_brand` (`id_brand`),
  ADD KEY `id_gender` (`id_gender`);

--
-- Chỉ mục cho bảng `produc_color`
--
ALTER TABLE `produc_color`
  ADD PRIMARY KEY (`id_product`),
  ADD KEY `id_color` (`id_color`);

--
-- Chỉ mục cho bảng `produc_size`
--
ALTER TABLE `produc_size`
  ADD PRIMARY KEY (`id_product`),
  ADD KEY `id_size` (`id_size`);

--
-- Chỉ mục cho bảng `size`
--
ALTER TABLE `size`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `size_color`
--
ALTER TABLE `size_color`
  ADD PRIMARY KEY (`id_size`),
  ADD KEY `id_color` (`id_color`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `brand`
--
ALTER TABLE `brand`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `color`
--
ALTER TABLE `color`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `gioiTinh`
--
ALTER TABLE `gioiTinh`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `price`
--
ALTER TABLE `price`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `produc_color`
--
ALTER TABLE `produc_color`
  MODIFY `id_product` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `produc_size`
--
ALTER TABLE `produc_size`
  MODIFY `id_product` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `size`
--
ALTER TABLE `size`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `size_color`
--
ALTER TABLE `size_color`
  MODIFY `id_size` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `category_ibfk_1` FOREIGN KEY (`id_gender`) REFERENCES `gioiTinh` (`id`);

--
-- Các ràng buộc cho bảng `price`
--
ALTER TABLE `price`
  ADD CONSTRAINT `price_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`);

--
-- Các ràng buộc cho bảng `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`id_brand`) REFERENCES `brand` (`id`),
  ADD CONSTRAINT `product_ibfk_3` FOREIGN KEY (`id_gender`) REFERENCES `gioiTinh` (`id`);

--
-- Các ràng buộc cho bảng `produc_color`
--
ALTER TABLE `produc_color`
  ADD CONSTRAINT `produc_color_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `produc_color_ibfk_2` FOREIGN KEY (`id_color`) REFERENCES `color` (`id`);

--
-- Các ràng buộc cho bảng `produc_size`
--
ALTER TABLE `produc_size`
  ADD CONSTRAINT `produc_size_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `produc_size_ibfk_2` FOREIGN KEY (`id_size`) REFERENCES `size` (`id`);

--
-- Các ràng buộc cho bảng `size_color`
--
ALTER TABLE `size_color`
  ADD CONSTRAINT `size_color_ibfk_1` FOREIGN KEY (`id_size`) REFERENCES `size` (`id`),
  ADD CONSTRAINT `size_color_ibfk_2` FOREIGN KEY (`id_color`) REFERENCES `color` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
