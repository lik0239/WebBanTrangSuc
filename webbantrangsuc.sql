-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 10, 2025 at 04:19 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webbantrangsuc`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `CategoryID` int(11) NOT NULL,
  `Name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `imageURL` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`CategoryID`, `Name`, `Description`, `imageURL`) VALUES
(1, 'Nhẫn', 'Nhẫn cưới, nhẫn vàng, nhẫn kim cương, nhẫn đá quý', '/images/product_2.png'),
(2, 'Dây chuyền', 'Dây chuyền vàng, dây chuyền trắng ý, dây chuyền bạc, dây chuyền bạch kim', '/images/product_5.png'),
(3, 'Lắc', 'Lắc tay, lắc chân, bạc, vàng, bạch kim, kim cương', '/images/product_7.png'),
(4, 'Vòng', 'Vòng tay nam nữ đẹp, cá tính', '/images/product_10.png'),
(5, 'Dây cổ', 'Dây cổ vàng, bạc, kim cương, mẫu mới', '/images/product_6.png');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `CustomerID` int(11) NOT NULL,
  `Name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Phone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`CustomerID`, `Name`, `Email`, `Phone`, `Address`) VALUES
(1, 'Nguyễn Thị Thu', 'thithu@example.com', '0901234567', '123 Đường Hoa Hồng, Quận 1, TP.HCM'),
(2, 'Lê Minh Tuấn', 'minhtuan@example.com', '0987654321', '456 Đường Lý Tự Trọng, Quận 3, TP.HCM'),
(3, 'Trần Văn An', 'vanan@example.com', '0912345678', '789 Đường Nam Kỳ Khởi Nghĩa, Quận 5, TP.HCM'),
(4, 'Hoàng Thị Ngọc', 'thingoc@example.com', '0938765432', '321 Đường Hai Bà Trưng, Quận 1, TP.HCM'),
(5, 'Phạm Văn Khánh', 'vankhanh@example.com', '0965432109', '567 Đường Nguyễn Trãi, Quận 7, TP.HCM'),
(11, 'Hà Chí Hân', 'abc@123.com', '0123456789', 'Tây Ninh');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `EmployeeID` bigint(20) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `Position` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`EmployeeID`, `Name`, `Address`, `Phone`, `Position`, `created_at`, `updated_at`) VALUES
(1, 'Nguyễn Văn An', '123 Lý Thường Kiệt, Hà Nội', '0912345678', 'Nhân viên bán hàng', '2025-11-05 14:15:07', '2025-11-05 14:15:07'),
(2, 'Trần Thị Bình', '45 Nguyễn Trãi, TP.HCM', '0905123456', 'Kế toán', '2025-11-05 14:15:07', '2025-11-05 14:15:07'),
(3, 'Lê Hoàng Phúc', '89 Trần Phú, Đà Nẵng', '0934789123', 'Quản lý', '2025-11-05 14:15:07', '2025-11-05 14:15:07'),
(4, 'Phạm Thị Mai', '12 Nguyễn Huệ, Huế', '0978123456', 'Nhân viên kho', '2025-11-05 14:15:07', '2025-11-05 14:15:07'),
(5, 'Hoàng Đức Minh', '78 Hai Bà Trưng, Hải Phòng', '0967456123', 'Nhân viên bán hàng', '2025-11-05 14:15:07', '2025-11-05 14:15:07');

-- --------------------------------------------------------

--
-- Table structure for table `employee_accounts`
--

CREATE TABLE `employee_accounts` (
  `AccountID` bigint(20) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  `employee_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee_accounts`
--

INSERT INTO `employee_accounts` (`AccountID`, `username`, `password`, `role_id`, `employee_id`) VALUES
(1, 'an_nvbh', '123456', 5, 1),
(2, 'binh_kt', '123456', 3, 2),
(3, 'phuc_ql', '123456', 4, 3),
(4, 'mai_kho', '123456', 6, 4),
(5, 'minh_nvbh', '123456', 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `id` bigint(20) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `role_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`id`, `username`, `password`, `customer_id`, `role_id`) VALUES
(1, 'user1', '123', NULL, 1),
(2, 'admin1', '123', NULL, 2),
(3, 'han', '123456', 11, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

CREATE TABLE `orderdetails` (
  `OrderDetailID` int(11) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL CHECK (`Quantity` > 0),
  `Price` decimal(18,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orderdetails`
--

INSERT INTO `orderdetails` (`OrderDetailID`, `OrderID`, `ProductID`, `Quantity`, `Price`) VALUES
(1, 1, 1, 1, 12000000.00),
(2, 2, 2, 1, 2500000.00),
(3, 3, 3, 1, 3500000.00),
(4, 4, 4, 1, 15000000.00),
(5, 5, 5, 1, 1800000.00);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `OrderID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `OrderDate` datetime DEFAULT current_timestamp(),
  `Status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL CHECK (`Status` in ('Đang xử lý','Đã giao','Đã hủy','Đang giao')),
  `TotalAmount` decimal(18,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`OrderID`, `CustomerID`, `OrderDate`, `Status`, `TotalAmount`) VALUES
(1, 1, '2024-11-10 10:00:00', 'Đang xử lý', 12000000.00),
(2, 2, '2024-11-11 15:00:00', 'Đã giao', 2500000.00),
(3, 3, '2024-11-12 18:00:00', 'Đang giao', 3500000.00),
(4, 4, '2024-11-13 20:00:00', 'Đã hủy', 15000000.00),
(5, 5, '2024-11-14 14:30:00', 'Đang xử lý', 1800000.00);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `PaymentID` int(11) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `PaymentDate` datetime DEFAULT current_timestamp(),
  `Amount` decimal(18,2) NOT NULL,
  `PaymentMethod` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL CHECK (`PaymentMethod` in ('Thanh toán khi nhận hàng','chuyển khoản','PayPal')),
  `Status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL CHECK (`Status` in ('Thành công','Đang xử lý','Thất bại'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`PaymentID`, `OrderID`, `PaymentDate`, `Amount`, `PaymentMethod`, `Status`) VALUES
(1, 1, '2024-11-10 11:00:00', 12000000.00, 'chuyển khoản', 'Thành công'),
(2, 2, '2024-11-11 16:00:00', 2500000.00, 'Thanh toán khi nhận hàng', 'Thành công'),
(3, 3, '2024-11-12 19:00:00', 3500000.00, 'PayPal', 'Thành công'),
(4, 4, '2024-11-13 21:00:00', 15000000.00, 'chuyển khoản', 'Thất bại'),
(5, 5, '2024-11-14 15:00:00', 1800000.00, 'PayPal', 'Đang xử lý');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `ProductID` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Price` double DEFAULT NULL,
  `Stock` int(11) NOT NULL,
  `CategoryID` int(11) DEFAULT NULL,
  `ImageURL` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`ProductID`, `Name`, `Description`, `Price`, `Stock`, `CategoryID`, `ImageURL`) VALUES
(1, 'Nhẫn cưới vàng 18k', 'Nhẫn cưới được chế tác từ vàng 18k, thiết kế đơn giản và sang trọng', 5000000, 324, 1, '/images/product_3.png'),
(2, 'Dây chuyền bạc Ý', 'Dây chuyền bạc cao cấp từ Ý, sáng bóng và bền đẹp', 1500000, 5454, 2, '/images/product_8.png'),
(3, 'Lắc tay bạch kim', 'Lắc tay bạch kim tinh xảo, phong cách hiện đại', 7500000, 333, 3, '/images/product_9.png'),
(4, 'Vòng tay da cá tính', 'Vòng tay da thật, thiết kế dành cho cả nam và nữ, rất thời trang', 1200000, 4442, 4, '/images/product_10.png'),
(5, 'Dây cổ vàng 24k', 'Dây cổ vàng 24k, mẫu mới, rất sang trọng và phù hợp làm quà tặng', 2832000, 13, 5, '/images/product_6.png'),
(11, 'Nhẫn nữ vàng', 'Nhẫn nữ vàng 18K thiết kế tinh tế, phù hợp với mọi dịp, mang đến vẻ đẹp sang trọng.', 1840000, 20, 1, '/images/product_1.png'),
(12, 'Nhẫn vàng 18K', 'Nhẫn vàng 18K đơn giản nhưng sang trọng, bền đẹp theo thời gian.', 4280000, 19, 1, '/images/product_2.png'),
(13, 'Vòng tay ba khúc', 'Vòng tay bạc ba khúc, thiết kế mạnh mẽ và hiện đại.', 2430000, 25, 4, '/images/product_4.png'),
(14, 'Dây chuyền nam', 'Dây chuyền bạc nam, phong cách mạnh mẽ, phù hợp với các chàng trai yêu thích sự đơn giản.', 6730000, 9, 2, '/images/product_5.png'),
(15, 'Lắc tay bạc nam', 'Lắc tay bạc nam chất liệu bạch kim thiết kế cá tính và mạnh mẽ, hoàn hảo cho phong cách thời trang năng động.', 7500000, 11, 3, '/images/product_7.png');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'Khách hàng'),
(2, 'ADMIN'),
(3, 'Kế toán'),
(4, 'Quản lý'),
(5, 'Nhân viên bán hàng'),
(6, 'Nhân viên kho');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`CategoryID`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`CustomerID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`EmployeeID`);

--
-- Indexes for table `employee_accounts`
--
ALTER TABLE `employee_accounts`
  ADD PRIMARY KEY (`AccountID`),
  ADD UNIQUE KEY `uq_emp_username` (`username`),
  ADD UNIQUE KEY `uq_emp_employee` (`employee_id`),
  ADD KEY `fk_empacc_role` (`role_id`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_member_customer` (`customer_id`),
  ADD KEY `FK66sx2wk0nkhxnhk0c4tmywnvg` (`role_id`);

--
-- Indexes for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`OrderDetailID`),
  ADD KEY `FK_OrderDetails_Orders` (`OrderID`),
  ADD KEY `FK_OrderDetails_Products` (`ProductID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `FK_Orders_Customers` (`CustomerID`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`PaymentID`),
  ADD KEY `FK_Payments_Orders` (`OrderID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ProductID`),
  ADD KEY `FK_Products_Categories` (`CategoryID`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `CategoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `CustomerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `EmployeeID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `employee_accounts`
--
ALTER TABLE `employee_accounts`
  MODIFY `AccountID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `OrderDetailID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `PaymentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `ProductID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employee_accounts`
--
ALTER TABLE `employee_accounts`
  ADD CONSTRAINT `fk_empacc_employee` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`EmployeeID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_empacc_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `member`
--
ALTER TABLE `member`
  ADD CONSTRAINT `FK66sx2wk0nkhxnhk0c4tmywnvg` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  ADD CONSTRAINT `fk_member_customer` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`CustomerID`) ON UPDATE CASCADE;

--
-- Constraints for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `FK_OrderDetails_Orders` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`),
  ADD CONSTRAINT `FK_OrderDetails_Products` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FK_Orders_Customers` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `FK_Payments_Orders` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_Products_Categories` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`CategoryID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
