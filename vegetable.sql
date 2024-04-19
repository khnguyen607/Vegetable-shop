-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th4 19, 2024 lúc 06:07 AM
-- Phiên bản máy phục vụ: 8.0.30
-- Phiên bản PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `vegetable`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `ID` int NOT NULL,
  `Name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`ID`, `Name`) VALUES
(1, 'Rau cải'),
(2, 'Hoa quả'),
(3, 'Rau xanh'),
(4, 'Củ quả'),
(5, 'Rau gia vị'),
(6, 'Hạt giống'),
(7, 'Rau sạch'),
(8, 'Hoa quả chín'),
(9, 'Rau tươi'),
(10, 'Rau ăn lá');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nutritionists`
--

CREATE TABLE `nutritionists` (
  `ID` int NOT NULL,
  `Name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `nutritionists`
--

INSERT INTO `nutritionists` (`ID`, `Name`) VALUES
(1, 'Vitamin A'),
(2, 'Vitamin C'),
(3, 'Vitamin K'),
(4, 'Chất xơ'),
(5, 'Kali'),
(6, 'Beta-carotene'),
(7, 'Protein'),
(8, 'Chất chống oxy hóa'),
(9, 'Nước'),
(10, 'Khoáng chất');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orderdetail`
--

CREATE TABLE `orderdetail` (
  `ID` int NOT NULL,
  `orderID` int NOT NULL,
  `productID` int NOT NULL,
  `Quantity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orderdetail`
--

INSERT INTO `orderdetail` (`ID`, `orderID`, `productID`, `Quantity`) VALUES
(1, 15, 20, 3),
(2, 40, 10, 5),
(3, 25, 10, 8),
(4, 21, 10, 1),
(5, 21, 1, 9),
(6, 14, 2, 8),
(7, 44, 2, 7),
(8, 46, 9, 8),
(9, 2, 15, 3),
(10, 41, 11, 2),
(11, 13, 12, 8),
(12, 1, 4, 2),
(13, 48, 15, 1),
(14, 12, 20, 8),
(15, 40, 15, 8),
(16, 4, 7, 10),
(17, 3, 1, 10),
(18, 2, 17, 9),
(19, 27, 14, 1),
(20, 14, 2, 7),
(21, 43, 12, 1),
(22, 9, 6, 7),
(23, 7, 19, 9),
(24, 32, 14, 1),
(25, 35, 16, 6),
(26, 2, 19, 4),
(27, 10, 8, 1),
(28, 39, 16, 3),
(29, 8, 2, 1),
(30, 19, 7, 8),
(31, 10, 1, 9),
(32, 44, 11, 10),
(33, 35, 10, 4),
(34, 46, 2, 1),
(35, 20, 15, 8),
(36, 8, 17, 8),
(37, 1, 10, 5),
(38, 39, 2, 9),
(39, 1, 1, 7),
(40, 1, 18, 4),
(41, 47, 15, 7),
(42, 21, 5, 3),
(43, 2, 7, 7),
(44, 5, 5, 9),
(45, 11, 17, 2),
(46, 39, 8, 1),
(47, 33, 6, 9),
(48, 47, 14, 9),
(49, 50, 20, 7),
(50, 3, 13, 7),
(51, 15, 11, 5),
(52, 18, 13, 10),
(53, 36, 7, 7),
(54, 39, 3, 6),
(55, 39, 10, 6),
(56, 22, 4, 3),
(57, 42, 18, 4),
(58, 43, 11, 2),
(59, 30, 3, 1),
(60, 18, 14, 1),
(61, 22, 15, 8),
(62, 47, 4, 7),
(63, 23, 2, 8),
(64, 49, 8, 4),
(65, 41, 9, 7),
(66, 39, 13, 9),
(67, 5, 20, 2),
(68, 6, 7, 10),
(69, 28, 4, 6),
(70, 20, 20, 1),
(71, 5, 5, 8),
(72, 49, 15, 8),
(73, 42, 8, 8),
(74, 18, 15, 5),
(75, 47, 8, 8),
(76, 9, 7, 2),
(77, 4, 10, 10),
(78, 17, 14, 4),
(79, 24, 17, 10),
(80, 24, 2, 5),
(81, 48, 3, 2),
(82, 14, 18, 1),
(83, 9, 20, 9),
(84, 22, 13, 4),
(85, 46, 11, 9),
(86, 3, 6, 10),
(87, 21, 3, 6),
(88, 1, 6, 2),
(89, 19, 7, 9),
(90, 29, 16, 5),
(91, 14, 13, 10),
(92, 15, 7, 8),
(93, 24, 10, 8),
(94, 48, 7, 8),
(95, 38, 18, 7),
(96, 35, 10, 8),
(97, 7, 11, 7),
(98, 24, 18, 6),
(99, 50, 18, 8),
(100, 38, 9, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `ID` int NOT NULL,
  `TotalPrice` int NOT NULL,
  `Status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Chờ duyệt',
  `Date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `GuestName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `GuestEmail` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `GuestPhone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `GuestAddress` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`ID`, `TotalPrice`, `Status`, `Date`, `GuestName`, `GuestEmail`, `GuestPhone`, `GuestAddress`) VALUES
(1, 282, 'Chờ duyệt', '2024-04-19 12:41:38', 'Nguyễn Văn A', 'nguyenvana@example.com', '0987654321', '123 Đường ABC, Quận 1, Thành phố Hồ Chí Minh'),
(2, 257, 'Chờ duyệt', '2024-04-19 12:41:38', 'Trần Thị B', 'tranthib@example.com', '0123456789', '456 Đường XYZ, Quận 2, Thành phố Hà Nội'),
(3, 322, 'Chờ duyệt', '2024-04-19 12:41:38', 'Lê Văn C', 'levanc@example.com', '0123456789', '789 Đường DEF, Quận 3, Thành phố Đà Nẵng'),
(4, 290, 'Chờ duyệt', '2024-04-19 12:41:38', 'Phạm Thị D', 'phamthid@example.com', '0987654321', '101 Đường GHI, Quận 4, Thành phố Cần Thơ'),
(5, 137, 'Chờ duyệt', '2024-04-19 12:41:38', 'Nguyễn Văn E', 'nguyenvane@example.com', '0987654321', '111 Đường JKL, Quận 5, Thành phố Hải Phòng'),
(6, 110, 'Chờ duyệt', '2024-04-19 12:41:38', 'Trần Văn F', 'tranvanf@example.com', '0123456789', '222 Đường MNO, Quận 6, Thành phố Vũng Tàu'),
(7, 143, 'Chờ duyệt', '2024-04-19 12:41:38', 'Lê Thị G', 'lethig@example.com', '0123456789', '333 Đường PQR, Quận 7, Thành phố Nha Trang'),
(8, 72, 'Chờ duyệt', '2024-04-19 12:41:38', 'Phạm Văn H', 'phamvanh@example.com', '0987654321', '444 Đường STU, Quận 8, Thành phố Quy Nhơn'),
(9, 166, 'Chờ duyệt', '2024-04-19 12:41:38', 'Nguyễn Thị I', 'nguyenthii@example.com', '0987654321', '555 Đường VWX, Quận 9, Thành phố Hạ Long'),
(10, 114, 'Chờ duyệt', '2024-04-19 12:41:38', 'Trần Văn K', 'tranvank@example.com', '0123456789', '666 Đường YZ1, Quận 10, Thành phố Phú Quốc'),
(11, 16, 'Chờ duyệt', '2024-04-19 12:41:38', 'Lê Thị L', 'lethil@example.com', '0987654321', '777 Đường 234, Quận 11, Thành phố Tam Kỳ'),
(12, 72, 'Chờ duyệt', '2024-04-19 12:41:38', 'Phạm Văn M', 'phamvanm@example.com', '0123456789', '888 Đường 345, Quận 12, Thành phố Tây Ninh'),
(13, 112, 'Chờ duyệt', '2024-04-19 12:41:38', 'Nguyễn Thị N', 'nguyenthin@example.com', '0123456789', '999 Đường 456, Quận 13, Thành phố Bắc Ninh'),
(14, 295, 'Chờ duyệt', '2024-04-19 12:41:38', 'Trần Văn P', 'tranvanp@example.com', '0987654321', '1010 Đường 567, Quận 14, Thành phố Cao Lãnh'),
(15, 140, 'Chờ duyệt', '2024-04-19 12:41:38', 'Lê Thị Q', 'lethiq@example.com', '0987654321', '1111 Đường 678, Quận 15, Thành phố Bảo Lộc'),
(16, 290000, 'Chờ duyệt', '2024-04-19 12:41:38', 'Phạm Văn R', 'phamvanr@example.com', '0123456789', '1212 Đường 789, Quận 16, Thành phố Bắc Giang'),
(17, 68, 'Chờ duyệt', '2024-04-19 12:41:38', 'Nguyễn Thị S', 'nguyenthis@example.com', '0987654321', '1313 Đường 890, Quận 17, Thành phố Bắc Kạn'),
(18, 277, 'Chờ duyệt', '2024-04-19 12:41:38', 'Trần Văn T', 'tranvant@example.com', '0123456789', '1414 Đường 901, Quận 18, Thành phố Bắc Ninh'),
(19, 187, 'Chờ duyệt', '2024-04-19 12:41:38', 'Lê Thị U', 'lethiu@example.com', '0123456789', '1515 Đường 012, Quận 19, Thành phố Bắc Giang'),
(20, 169, 'Chờ duyệt', '2024-04-19 12:41:38', 'Phạm Văn V', 'phamvanv@example.com', '0987654321', '1616 Đường 123, Quận 20, Thành phố Bắc Kạn'),
(21, 207, 'Chờ duyệt', '2024-04-19 12:41:38', 'Nguyễn Văn A', 'nguyenvana@example.com', '0987654321', '123 Đường ABC, Quận 1, Thành phố Hồ Chí Minh'),
(22, 269, 'Chờ duyệt', '2024-04-19 12:41:38', 'Trần Thị B', 'tranthib@example.com', '0123456789', '456 Đường XYZ, Quận 2, Thành phố Hà Nội'),
(23, 64, 'Chờ duyệt', '2024-04-19 12:41:38', 'Lê Văn C', 'levanc@example.com', '0123456789', '789 Đường DEF, Quận 3, Thành phố Đà Nẵng'),
(24, 354, 'Chờ duyệt', '2024-04-19 12:41:38', 'Phạm Thị D', 'phamthid@example.com', '0987654321', '101 Đường GHI, Quận 4, Thành phố Cần Thơ'),
(25, 144, 'Chờ duyệt', '2024-04-19 12:41:38', 'Nguyễn Văn E', 'nguyenvane@example.com', '0987654321', '111 Đường JKL, Quận 5, Thành phố Hải Phòng'),
(26, 410000, 'Chờ duyệt', '2024-04-19 12:41:38', 'Trần Văn F', 'tranvanf@example.com', '0123456789', '222 Đường MNO, Quận 6, Thành phố Vũng Tàu'),
(27, 17, 'Chờ duyệt', '2024-04-19 12:41:38', 'Lê Thị G', 'lethig@example.com', '0123456789', '333 Đường PQR, Quận 7, Thành phố Nha Trang'),
(28, 90, 'Chờ duyệt', '2024-04-19 12:41:38', 'Phạm Văn H', 'phamvanh@example.com', '0987654321', '444 Đường STU, Quận 8, Thành phố Quy Nhơn'),
(29, 50, 'Chờ duyệt', '2024-04-19 12:41:38', 'Nguyễn Thị I', 'nguyenthii@example.com', '0987654321', '555 Đường VWX, Quận 9, Thành phố Hạ Long'),
(30, 10, 'Chờ duyệt', '2024-04-19 12:41:38', 'Trần Văn K', 'tranvank@example.com', '0123456789', '666 Đường YZ1, Quận 10, Thành phố Phú Quốc'),
(31, 310000, 'Chờ duyệt', '2024-04-19 12:41:38', 'Lê Thị L', 'lethil@example.com', '0987654321', '777 Đường 234, Quận 11, Thành phố Tam Kỳ'),
(32, 17, 'Chờ duyệt', '2024-04-19 12:41:38', 'Phạm Văn M', 'phamvanm@example.com', '0123456789', '888 Đường 345, Quận 12, Thành phố Tây Ninh'),
(33, 81, 'Chờ duyệt', '2024-04-19 12:41:38', 'Nguyễn Thị N', 'nguyenthin@example.com', '0123456789', '999 Đường 456, Quận 13, Thành phố Bắc Ninh'),
(34, 280000, 'Chờ duyệt', '2024-04-19 12:41:38', 'Trần Văn P', 'tranvanp@example.com', '0987654321', '1010 Đường 567, Quận 14, Thành phố Cao Lãnh'),
(35, 276, 'Chờ duyệt', '2024-04-19 12:41:38', 'Lê Thị Q', 'lethiq@example.com', '0987654321', '1111 Đường 678, Quận 15, Thành phố Bảo Lộc'),
(36, 77, 'Chờ duyệt', '2024-04-19 12:41:38', 'Phạm Văn R', 'phamvanr@example.com', '0123456789', '1212 Đường 789, Quận 16, Thành phố Bắc Giang'),
(37, 330000, 'Chờ duyệt', '2024-04-19 12:41:38', 'Nguyễn Thị S', 'nguyenthis@example.com', '0987654321', '1313 Đường 890, Quận 17, Thành phố Bắc Kạn'),
(38, 118, 'Chờ duyệt', '2024-04-19 12:41:38', 'Trần Văn T', 'tranvant@example.com', '0123456789', '1414 Đường 901, Quận 18, Thành phố Bắc Ninh'),
(39, 420, 'Chờ duyệt', '2024-04-19 12:41:38', 'Lê Thị U', 'lethiu@example.com', '0123456789', '1515 Đường 012, Quận 19, Thành phố Bắc Giang'),
(40, 250, 'Chờ duyệt', '2024-04-19 12:41:38', 'Phạm Văn V', 'phamvanv@example.com', '0987654321', '1616 Đường 123, Quận 20, Thành phố Bắc Kạn'),
(41, 101, 'Chờ duyệt', '2024-04-19 12:41:38', 'Nguyễn Văn A', 'nguyenvana@example.com', '0987654321', '123 Đường ABC, Quận 1, Thành phố Hồ Chí Minh'),
(42, 108, 'Chờ duyệt', '2024-04-19 12:41:38', 'Trần Thị B', 'tranthib@example.com', '0123456789', '456 Đường XYZ, Quận 2, Thành phố Hà Nội'),
(43, 24, 'Chờ duyệt', '2024-04-19 12:41:38', 'Lê Văn C', 'levanc@example.com', '0123456789', '789 Đường DEF, Quận 3, Thành phố Đà Nẵng'),
(44, 106, 'Chờ duyệt', '2024-04-19 12:41:38', 'Phạm Thị D', 'phamthid@example.com', '0987654321', '101 Đường GHI, Quận 4, Thành phố Cần Thơ'),
(45, 360000, 'Chờ duyệt', '2024-04-19 12:41:38', 'Nguyễn Văn E', 'nguyenvane@example.com', '0987654321', '111 Đường JKL, Quận 5, Thành phố Hải Phòng'),
(46, 157, 'Chờ duyệt', '2024-04-19 12:41:38', 'Trần Văn F', 'tranvanf@example.com', '0123456789', '222 Đường MNO, Quận 6, Thành phố Vũng Tàu'),
(47, 446, 'Chờ duyệt', '2024-04-19 12:41:38', 'Lê Thị G', 'lethig@example.com', '0123456789', '333 Đường PQR, Quận 7, Thành phố Nha Trang'),
(48, 128, 'Chờ duyệt', '2024-04-19 12:41:38', 'Phạm Văn H', 'phamvanh@example.com', '0987654321', '444 Đường STU, Quận 8, Thành phố Quy Nhơn'),
(49, 184, 'Chờ duyệt', '2024-04-19 12:41:38', 'Nguyễn Thị I', 'nguyenthii@example.com', '0987654321', '555 Đường VWX, Quận 9, Thành phố Hạ Long'),
(50, 183, 'Chờ duyệt', '2024-04-19 12:41:38', 'Trần Văn K', 'tranvank@example.com', '0123456789', '666 Đường YZ1, Quận 10, Thành phố Phú Quốc');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `ID` int NOT NULL,
  `Name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Price` int NOT NULL,
  `Subtitle` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Description` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Img` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Unit` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`ID`, `Name`, `Price`, `Subtitle`, `Description`, `Img`, `Unit`) VALUES
(1, 'Cà chua', 12, 'Cà chua đỏ', '<p>Cà chua chín đỏ, giàu vitamin và chất chống oxy hóa.</p>', 'images/products/product1.png', 'kg'),
(2, 'Bắp cải', 8, 'Bắp cải xanh', '<p>Bắp cải xanh tươi ngon, giàu dinh dưỡng và chất xơ.</p>', 'images/products/product2.png', 'kg'),
(3, 'Cà rốt', 10, 'Cà rốt tươi', '<p>Cà rốt tươi sạch, giàu vitamin A và beta-carotene.</p>', 'images/products/product3.png', 'kg'),
(4, 'Bí đỏ', 15, 'Bí đỏ ngọt', '<p>Bí đỏ ngọt, giàu chất xơ và vitamin C.</p>', 'images/products/product4.png', 'kg'),
(5, 'Cần tây', 7, 'Cần tây xanh', '<p>Cần tây xanh tươi, giàu kali và vitamin K.</p>', 'images/products/product5.png', 'kg'),
(6, 'Cải bó xôi', 9, 'Cải bó xôi', '<p>Cải bó xôi tươi ngon, giàu chất chống oxy hóa.</p>', 'images/products/product6.png', 'kg'),
(7, 'Cải ngọt', 11, 'Cải ngọt', '<p>Cải ngọt sạch, giàu vitamin và khoáng chất.</p>', 'images/products/product7.png', 'kg'),
(8, 'Củ cải trắng', 6, 'Củ cải trắng', '<p>Củ cải trắng ngọt, giàu chất xơ và vitamin C.</p>', 'images/products/product8.png', 'kg'),
(9, 'Cà tím', 13, 'Cà tím', '<p>Cà tím tươi ngon, giàu chất chống oxy hóa và kali.</p>', 'images/products/product9.png', 'kg'),
(10, 'Bí đỏ hạt', 18, 'Bí đỏ hạt', '<p>Bí đỏ hạt tươi, giàu chất xơ và chất đạm.</p>', 'images/products/product10.png', 'kg'),
(11, 'Rau muống', 5, 'Rau muống', '<p>Rau muống tươi ngon, giàu vitamin và khoáng chất.</p>', 'images/products/product11.png', 'kg'),
(12, 'Cà rốt baby', 14, 'Cà rốt baby', '<p>Cà rốt baby tươi ngon, giàu chất xơ và vitamin A.</p>', 'images/products/product12.png', 'kg'),
(13, 'Cải thảo', 16, 'Cải thảo', '<p>Cải thảo tươi ngon, giàu chất chống oxy hóa và kali.</p>', 'images/products/product13.png', 'kg'),
(14, 'Bí đỏ baby', 17, 'Bí đỏ baby', '<p>Bí đỏ baby ngọt, giàu chất xơ và chất dinh dưỡng.</p>', 'images/products/product14.png', 'kg'),
(15, 'Rau bina', 20, 'Rau bina', '<p>Rau bina tươi ngon, giàu vitamin và khoáng chất.</p>', 'images/products/product8.png', 'kg'),
(16, 'Khoai tây', 10, 'Khoai tây', '<p>Khoai tây tươi ngon, giàu chất xơ và vitamin C.</p>', 'images/products/product9.png', 'kg'),
(17, 'Dưa leo', 8, 'Dưa leo', '<p>Dưa leo tươi ngon, giàu nước và chất xơ.</p>', 'images/products/product10.png', 'kg'),
(18, 'Cần sa', 15, 'Cần sa', '<p>Cần sa tươi ngon, giàu chất xơ và protein.</p>', 'images/products/product11.png', 'kg'),
(19, 'Bí xanh', 12, 'Bí xanh', '<p>Bí xanh tươi ngon, giàu chất xơ và chất dinh dưỡng.</p>', 'images/products/product12.png', 'kg'),
(20, 'Rau mầm', 9, 'Rau mầm', '<p>Rau mầm tươi ngon, giàu vitamin và chất dinh dưỡng.</p>', 'images/products/product19.png', 'kg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `syn_orders_users`
--

CREATE TABLE `syn_orders_users` (
  `ID` int NOT NULL,
  `userID` int NOT NULL,
  `orderID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `syn_orders_users`
--

INSERT INTO `syn_orders_users` (`ID`, `userID`, `orderID`) VALUES
(1, 20, 23),
(2, 14, 24),
(3, 11, 3),
(4, 15, 16),
(5, 7, 7),
(6, 9, 40),
(7, 1, 4),
(8, 1, 4),
(9, 14, 14),
(10, 13, 7),
(11, 20, 10),
(12, 16, 3),
(13, 17, 33),
(14, 7, 25),
(15, 9, 6),
(16, 19, 32),
(17, 4, 6),
(18, 8, 50),
(19, 6, 37),
(20, 2, 49),
(21, 20, 10),
(22, 10, 6),
(23, 20, 37),
(24, 13, 19),
(25, 19, 30),
(26, 3, 9),
(27, 15, 49),
(28, 15, 14),
(29, 1, 24),
(30, 20, 15),
(31, 15, 43),
(32, 11, 40),
(33, 9, 26),
(34, 5, 1),
(35, 3, 45),
(36, 16, 40),
(37, 9, 19),
(38, 3, 36),
(39, 20, 23),
(40, 17, 19),
(41, 11, 30),
(42, 12, 34),
(43, 12, 1),
(44, 7, 26),
(45, 11, 17),
(46, 6, 26),
(47, 18, 39),
(48, 5, 19),
(49, 5, 17),
(50, 9, 38),
(51, 8, 20),
(52, 6, 35),
(53, 3, 12),
(54, 19, 6),
(55, 9, 22),
(56, 6, 7),
(57, 13, 5),
(58, 14, 42),
(59, 1, 36),
(60, 14, 14),
(61, 14, 47),
(62, 8, 28),
(63, 12, 30),
(64, 17, 13),
(65, 11, 47),
(66, 7, 50),
(67, 20, 45),
(68, 20, 43),
(69, 20, 42),
(70, 5, 28),
(71, 19, 2),
(72, 2, 23),
(73, 16, 32),
(74, 12, 6),
(75, 14, 19),
(76, 1, 46),
(77, 17, 6),
(78, 18, 6),
(79, 9, 34),
(80, 11, 4),
(81, 17, 14),
(82, 13, 15),
(83, 16, 29),
(84, 9, 9),
(85, 2, 31),
(86, 14, 34),
(87, 9, 29),
(88, 4, 48),
(89, 2, 49),
(90, 16, 39),
(91, 12, 50),
(92, 11, 49),
(93, 6, 19),
(94, 7, 11),
(95, 9, 43),
(96, 20, 10),
(97, 12, 39),
(98, 16, 50),
(99, 11, 9),
(100, 4, 27);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `syn_products_categories`
--

CREATE TABLE `syn_products_categories` (
  `ID` int NOT NULL,
  `productID` int NOT NULL,
  `categoryID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `syn_products_categories`
--

INSERT INTO `syn_products_categories` (`ID`, `productID`, `categoryID`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10),
(11, 11, 1),
(12, 12, 2),
(13, 13, 3),
(14, 14, 4),
(15, 15, 5),
(16, 16, 6),
(17, 17, 7),
(18, 18, 8),
(19, 19, 9),
(20, 20, 10),
(21, 1, 2),
(22, 2, 3),
(23, 3, 4),
(24, 4, 5),
(25, 5, 6),
(26, 6, 7),
(27, 7, 8),
(28, 8, 9),
(29, 9, 10),
(30, 10, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `syn_products_nutritionists`
--

CREATE TABLE `syn_products_nutritionists` (
  `ID` int NOT NULL,
  `productID` int NOT NULL,
  `nutritionistID` int NOT NULL,
  `Value` int NOT NULL,
  `Unit` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'g'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `syn_products_nutritionists`
--

INSERT INTO `syn_products_nutritionists` (`ID`, `productID`, `nutritionistID`, `Value`, `Unit`) VALUES
(1, 1, 1, 10, 'g'),
(2, 2, 2, 15, 'g'),
(3, 3, 3, 20, 'g'),
(4, 4, 4, 25, 'g'),
(5, 5, 5, 30, 'g'),
(6, 6, 6, 35, 'g'),
(7, 7, 7, 40, 'g'),
(8, 8, 8, 45, 'g'),
(9, 9, 9, 50, 'g'),
(10, 10, 10, 55, 'g'),
(11, 11, 1, 60, 'g'),
(12, 12, 2, 65, 'g'),
(13, 13, 3, 70, 'g'),
(14, 14, 4, 75, 'g'),
(15, 15, 5, 80, 'g'),
(16, 16, 6, 85, 'g'),
(17, 17, 7, 90, 'g'),
(18, 18, 8, 95, 'g'),
(19, 19, 9, 100, 'g'),
(20, 20, 10, 105, 'g'),
(21, 1, 2, 110, 'g'),
(22, 2, 3, 115, 'g'),
(23, 3, 4, 120, 'g'),
(24, 4, 5, 125, 'g'),
(25, 5, 6, 130, 'g'),
(26, 6, 7, 135, 'g'),
(27, 7, 8, 140, 'g'),
(28, 8, 9, 145, 'g'),
(29, 9, 10, 150, 'g'),
(30, 10, 1, 155, 'g'),
(31, 11, 2, 160, 'g'),
(32, 12, 3, 165, 'g'),
(33, 13, 4, 170, 'g'),
(34, 14, 5, 175, 'g'),
(35, 15, 6, 180, 'g'),
(36, 16, 7, 185, 'g'),
(37, 17, 8, 190, 'g'),
(38, 18, 9, 195, 'g'),
(39, 19, 10, 200, 'g'),
(40, 20, 1, 205, 'g'),
(41, 1, 3, 210, 'g'),
(42, 2, 4, 215, 'g'),
(43, 3, 5, 220, 'g'),
(44, 4, 6, 225, 'g'),
(45, 5, 7, 230, 'g'),
(46, 6, 8, 235, 'g'),
(47, 7, 9, 240, 'g'),
(48, 8, 10, 245, 'g'),
(49, 9, 1, 250, 'g'),
(50, 10, 2, 255, 'g');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `ID` int NOT NULL,
  `Name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `UserName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Password` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Phone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Tier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Basic',
  `Role` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`ID`, `Name`, `UserName`, `Password`, `Email`, `Phone`, `Address`, `Tier`, `Role`) VALUES
(1, 'Nguyễn Văn A', 'nguyenvana', 'hashed_password_1', 'nguyenvana@example.com', '0987654321', '123 Đường ABC, Quận 1, Thành phố Hồ Chí Minh', 'Premium', 0),
(2, 'Trần Thị B', 'tranthib', 'hashed_password_2', 'tranthib@example.com', '0123456789', '456 Đường XYZ, Quận 2, Thành phố Hà Nội', 'Standard', 0),
(3, 'Lê Văn C', 'levanc', 'hashed_password_3', 'levanc@example.com', '0123456789', '789 Đường DEF, Quận 3, Thành phố Đà Nẵng', 'Basic', 0),
(4, 'Phạm Thị D', 'phamthid', 'hashed_password_4', 'phamthid@example.com', '0987654321', '101 Đường GHI, Quận 4, Thành phố Cần Thơ', 'Premium', 0),
(5, 'Nguyễn Văn E', 'nguyenvane', 'hashed_password_5', 'nguyenvane@example.com', '0987654321', '111 Đường JKL, Quận 5, Thành phố Hải Phòng', 'Standard', 0),
(6, 'Trần Văn F', 'tranvanf', 'hashed_password_6', 'tranvanf@example.com', '0123456789', '222 Đường MNO, Quận 6, Thành phố Vũng Tàu', 'Basic', 0),
(7, 'Lê Thị G', 'lethig', 'hashed_password_7', 'lethig@example.com', '0123456789', '333 Đường PQR, Quận 7, Thành phố Nha Trang', 'Premium', 0),
(8, 'Phạm Văn H', 'phamvanh', 'hashed_password_8', 'phamvanh@example.com', '0987654321', '444 Đường STU, Quận 8, Thành phố Quy Nhơn', 'Standard', 0),
(9, 'Nguyễn Thị I', 'nguyenthii', 'hashed_password_9', 'nguyenthii@example.com', '0987654321', '555 Đường VWX, Quận 9, Thành phố Hạ Long', 'Basic', 0),
(10, 'Trần Văn K', 'tranvank', 'hashed_password_10', 'tranvank@example.com', '0123456789', '666 Đường YZ1, Quận 10, Thành phố Phú Quốc', 'Premium', 0),
(11, 'Lê Thị L', 'lethil', 'hashed_password_11', 'lethil@example.com', '0987654321', '777 Đường 234, Quận 11, Thành phố Tam Kỳ', 'Standard', 0),
(12, 'Phạm Văn M', 'phamvanm', 'hashed_password_12', 'phamvanm@example.com', '0123456789', '888 Đường 345, Quận 12, Thành phố Tây Ninh', 'Basic', 0),
(13, 'Nguyễn Thị N', 'nguyenthin', 'hashed_password_13', 'nguyenthin@example.com', '0123456789', '999 Đường 456, Quận 13, Thành phố Bắc Ninh', 'Premium', 0),
(14, 'Trần Văn P', 'tranvanp', 'hashed_password_14', 'tranvanp@example.com', '0987654321', '1010 Đường 567, Quận 14, Thành phố Cao Lãnh', 'Standard', 0),
(15, 'Lê Thị Q', 'lethiq', 'hashed_password_15', 'lethiq@example.com', '0987654321', '1111 Đường 678, Quận 15, Thành phố Bảo Lộc', 'Basic', 0),
(16, 'Phạm Văn R', 'phamvanr', 'hashed_password_16', 'phamvanr@example.com', '0123456789', '1212 Đường 789, Quận 16, Thành phố Bắc Giang', 'Premium', 0),
(17, 'Nguyễn Thị S', 'nguyenthis', 'hashed_password_17', 'nguyenthis@example.com', '0987654321', '1313 Đường 890, Quận 17, Thành phố Bắc Kạn', 'Standard', 0),
(18, 'Trần Văn T', 'tranvant', 'hashed_password_18', 'tranvant@example.com', '0123456789', '1414 Đường 901, Quận 18, Thành phố Bắc Ninh', 'Basic', 0),
(19, 'Lê Thị U', 'lethiu', 'hashed_password_19', 'lethiu@example.com', '0123456789', '1515 Đường 012, Quận 19, Thành phố Bắc Giang', 'Premium', 0),
(20, 'Phạm Văn V', 'phamvanv', 'hashed_password_20', 'phamvanv@example.com', '0987654321', '1616 Đường 123, Quận 20, Thành phố Bắc Kạn', 'Standard', 0);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `nutritionists`
--
ALTER TABLE `nutritionists`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ordersdetail_oders` (`orderID`),
  ADD KEY `ordersdetail_products` (`productID`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `syn_orders_users`
--
ALTER TABLE `syn_orders_users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `syn_orders_users_orders` (`orderID`),
  ADD KEY `syn_orders_users_users` (`userID`);

--
-- Chỉ mục cho bảng `syn_products_categories`
--
ALTER TABLE `syn_products_categories`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `syn_products_categories_categories` (`categoryID`),
  ADD KEY `syn_products_categories_products` (`productID`);

--
-- Chỉ mục cho bảng `syn_products_nutritionists`
--
ALTER TABLE `syn_products_nutritionists`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `syn_products_nutritionists_products` (`productID`),
  ADD KEY `syn_products_nutritionists_nutritionists` (`nutritionistID`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `nutritionists`
--
ALTER TABLE `nutritionists`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `orderdetail`
--
ALTER TABLE `orderdetail`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `syn_orders_users`
--
ALTER TABLE `syn_orders_users`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT cho bảng `syn_products_categories`
--
ALTER TABLE `syn_products_categories`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT cho bảng `syn_products_nutritionists`
--
ALTER TABLE `syn_products_nutritionists`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD CONSTRAINT `ordersdetail_oders` FOREIGN KEY (`orderID`) REFERENCES `orders` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `ordersdetail_products` FOREIGN KEY (`productID`) REFERENCES `products` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Các ràng buộc cho bảng `syn_orders_users`
--
ALTER TABLE `syn_orders_users`
  ADD CONSTRAINT `syn_orders_users_orders` FOREIGN KEY (`orderID`) REFERENCES `orders` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `syn_orders_users_users` FOREIGN KEY (`userID`) REFERENCES `users` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Các ràng buộc cho bảng `syn_products_categories`
--
ALTER TABLE `syn_products_categories`
  ADD CONSTRAINT `syn_products_categories_categories` FOREIGN KEY (`categoryID`) REFERENCES `categories` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `syn_products_categories_products` FOREIGN KEY (`productID`) REFERENCES `products` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Các ràng buộc cho bảng `syn_products_nutritionists`
--
ALTER TABLE `syn_products_nutritionists`
  ADD CONSTRAINT `syn_products_nutritionists_nutritionists` FOREIGN KEY (`nutritionistID`) REFERENCES `nutritionists` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `syn_products_nutritionists_products` FOREIGN KEY (`productID`) REFERENCES `products` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
