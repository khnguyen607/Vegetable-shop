-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th4 19, 2024 lúc 06:04 AM
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
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
