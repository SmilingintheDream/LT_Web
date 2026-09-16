-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 16, 2026 at 12:13 PM
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
-- Database: `shop_qa`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `ho_ten` varchar(100) DEFAULT NULL,
  `ngay_tao` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `password`, `ho_ten`, `ngay_tao`) VALUES
(1, 'Huy', '123123', 'Trần Huy', '2025-12-05 13:32:23'),
(2, 'Trương Đức Duy', '$2y$10$1sGCsKN1C2GO4n8yEJXTcOw5khDk8UUcDiCKP7wpgyrH.NA7yoSu.', 'Trương Đức Duy', '2025-12-05 18:08:04');

-- --------------------------------------------------------

--
-- Table structure for table `chi_tiet_don_hang`
--

CREATE TABLE `chi_tiet_don_hang` (
  `id` int(11) NOT NULL,
  `id_don_hang` int(11) NOT NULL,
  `id_san_pham` int(11) NOT NULL,
  `so_luong` int(11) NOT NULL,
  `don_gia` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `chi_tiet_don_hang`
--

INSERT INTO `chi_tiet_don_hang` (`id`, `id_don_hang`, `id_san_pham`, `so_luong`, `don_gia`) VALUES
(1, 1, 64, 2, 230000.00),
(2, 2, 62, 1, 220000.00),
(3, 3, 63, 1, 210000.00),
(4, 4, 63, 2, 210000.00),
(5, 4, 64, 2, 230000.00),
(238, 1, 62, 25, 220000.00),
(239, 1, 62, 25, 220000.00),
(240, 1, 63, 20, 210000.00),
(241, 1, 64, 30, 230000.00),
(242, 2, 64, 45, 230000.00),
(243, 2, 62, 38, 220000.00),
(244, 3, 59, 50, 250000.00),
(245, 3, 60, 42, 240000.00),
(246, 4, 63, 55, 210000.00),
(247, 4, 64, 48, 230000.00),
(439, 201, 62, 3, 220000.00),
(440, 201, 64, 5, 230000.00),
(441, 201, 59, 2, 250000.00),
(442, 202, 63, 8, 210000.00),
(443, 202, 64, 7, 230000.00),
(444, 202, 60, 4, 240000.00),
(445, 203, 64, 12, 230000.00),
(446, 203, 62, 9, 220000.00),
(447, 203, 59, 5, 250000.00),
(448, 204, 63, 10, 210000.00),
(449, 204, 64, 8, 230000.00),
(450, 204, 60, 6, 240000.00),
(451, 205, 64, 18, 230000.00),
(452, 205, 62, 15, 220000.00),
(453, 205, 63, 12, 210000.00),
(454, 205, 59, 8, 250000.00),
(455, 206, 64, 14, 230000.00),
(456, 206, 60, 10, 240000.00),
(457, 206, 62, 11, 220000.00),
(458, 207, 64, 16, 230000.00),
(459, 207, 62, 13, 220000.00),
(460, 207, 63, 10, 210000.00),
(461, 208, 64, 12, 230000.00),
(462, 208, 59, 7, 250000.00),
(463, 208, 60, 8, 240000.00),
(464, 209, 64, 25, 230000.00),
(465, 209, 62, 20, 220000.00),
(466, 209, 63, 18, 210000.00),
(467, 209, 59, 10, 250000.00),
(468, 210, 64, 22, 230000.00),
(469, 210, 60, 15, 240000.00),
(470, 210, 62, 16, 220000.00),
(471, 211, 64, 20, 230000.00),
(472, 211, 62, 18, 220000.00),
(473, 211, 63, 15, 210000.00),
(474, 212, 64, 17, 230000.00),
(475, 212, 59, 9, 250000.00),
(476, 212, 60, 11, 240000.00),
(477, 213, 64, 23, 230000.00),
(478, 213, 62, 19, 220000.00),
(479, 213, 63, 16, 210000.00),
(480, 213, 59, 8, 250000.00),
(481, 214, 64, 20, 230000.00),
(482, 214, 60, 12, 240000.00),
(483, 214, 62, 14, 220000.00),
(484, 215, 64, 10, 230000.00),
(485, 216, 62, 15, 220000.00),
(486, 216, 63, 8, 210000.00),
(487, 217, 59, 6, 250000.00),
(488, 218, 63, 1, 210000.00),
(489, 219, 62, 1, 220000.00),
(490, 220, 24, 1, 800000.00);

-- --------------------------------------------------------

--
-- Table structure for table `chi_tiet_san_pham`
--

CREATE TABLE `chi_tiet_san_pham` (
  `id` int(11) NOT NULL,
  `id_san_pham` int(11) NOT NULL,
  `mau_sac` varchar(50) DEFAULT NULL,
  `kich_co` varchar(10) DEFAULT NULL,
  `so_luong` int(11) NOT NULL,
  `gia` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `danh_muc`
--

CREATE TABLE `danh_muc` (
  `id` int(11) NOT NULL,
  `ten_danh_muc` varchar(100) NOT NULL,
  `id_cha` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `danh_muc`
--

INSERT INTO `danh_muc` (`id`, `ten_danh_muc`, `id_cha`) VALUES
(1, 'Thời trang nam', NULL),
(2, 'Thời trang nữ', NULL),
(3, 'Trẻ em', NULL),
(4, 'Áo thun', 1),
(5, 'Áo vest', 1),
(6, 'Áo sơ mi', 1),
(7, 'Hoodie', 1),
(8, 'Quần jeans nam', 1),
(9, 'Quần tây nam', 1),
(10, 'Áo khoác nam', 1),
(11, 'Đồ thể thao nam', 1);

-- --------------------------------------------------------

--
-- Table structure for table `don_hang`
--

CREATE TABLE `don_hang` (
  `id_don_hang` int(11) NOT NULL,
  `id_khach_hang` int(11) NOT NULL,
  `ho_ten` varchar(100) NOT NULL,
  `dien_thoai` varchar(20) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `dia_chi` text NOT NULL,
  `ghi_chu` text DEFAULT NULL,
  `phuong_thuc_thanh_toan` enum('cod','bank') DEFAULT 'cod',
  `tong_tien` decimal(15,2) NOT NULL,
  `trang_thai` varchar(50) DEFAULT 'cho_xac_nhan',
  `ngay_dat` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `don_hang`
--

INSERT INTO `don_hang` (`id_don_hang`, `id_khach_hang`, `ho_ten`, `dien_thoai`, `email`, `dia_chi`, `ghi_chu`, `phuong_thuc_thanh_toan`, `tong_tien`, `trang_thai`, `ngay_dat`) VALUES
(1, 1, 'Trương Duy', '0325144221', 'Ducduy102938@gmail.com', '123', '', '', 460000.00, 'cho_xac_nhan', '2025-12-02 16:35:44'),
(2, 1, 'Trương Duy', '0325144221', 'Ducduy102938@gmail.com', '123', '', '', 220000.00, 'cho_xac_nhan', '2025-12-02 16:37:50'),
(3, 1, 'Trương Duy', '0325144221', 'Ducduy102938@gmail.com', 'An Xuân', '', '', 210000.00, 'cho_xac_nhan', '2025-12-02 16:43:02'),
(4, 1, 'Trương Duy', '0325144221', 'Ducduy102938@gmail.com', '123', '', '', 880000.00, 'cho_xac_nhan', '2025-12-02 17:06:38'),
(125, 1, 'Nguyễn Lan Anh', '0905123456', 'lananh@gmail.com', 'Hà Nội', '', 'cod', 1290000.00, 'hoan_thanh', '2025-11-26 09:30:00'),
(126, 1, 'Trần Minh Tuấn', '0918234567', 'tuan@gmail.com', 'TP.HCM', '', 'bank', 2180000.00, 'hoan_thanh', '2025-11-26 14:20:00'),
(127, 1, 'Lê Thị Mai', '0927345678', 'mai@gmail.com', 'Đà Nẵng', '', 'cod', 890000.00, 'dang_giao', '2025-11-27 10:15:00'),
(128, 1, 'Phạm Văn Hùng', '0936456789', 'hung@gmail.com', 'Hà Nội', '', 'cod', 1790000.00, 'hoan_thanh', '2025-11-27 16:45:00'),
(129, 1, 'Hoàng Ngọc Linh', '0945567890', 'linh@gmail.com', 'TP.HCM', '', 'bank', 3290000.00, 'hoan_thanh', '2025-11-27 20:10:00'),
(130, 1, 'Vũ Anh Thư', '0956678901', 'thu@gmail.com', 'Cần Thơ', '', 'cod', 670000.00, 'da_xac_nhan', '2025-11-28 11:30:00'),
(131, 1, 'Đỗ Quốc Bảo', '0967789012', 'bao@gmail.com', 'Hà Nội', '', 'cod', 2490000.00, 'hoan_thanh', '2025-11-28 15:55:00'),
(132, 1, 'Bùi Thị Huyền', '0978890123', 'huyen2@gmail.com', 'Hải Phòng', '', 'cod', 1390000.00, 'dang_giao', '2025-11-28 19:20:00'),
(133, 1, 'Mai Anh Đào', '0989901234', 'dao@gmail.com', 'TP.HCM', '', 'bank', 4190000.00, 'hoan_thanh', '2025-11-29 08:50:00'),
(134, 1, 'Ngô Đức Nam', '0905012345', 'nam3@gmail.com', 'Đà Nẵng', '', 'cod', 890000.00, 'cho_xac_nhan', '2025-11-29 13:10:00'),
(135, 1, 'Trương Bảo Ngọc', '0916123456', 'ngoc3@gmail.com', 'Hà Nội', '', 'cod', 1890000.00, 'hoan_thanh', '2025-11-29 18:30:00'),
(136, 1, 'Lý Thanh Hà', '0927234567', 'ha@gmail.com', 'TP.HCM', '', 'cod', 460000.00, 'da_huy', '2025-11-30 10:05:00'),
(137, 1, 'Hà Văn Khôi', '0938345678', 'khoi@gmail.com', 'Hà Nội', '', 'bank', 5980000.00, 'hoan_thanh', '2025-11-30 14:40:00'),
(138, 1, 'Đinh Thị Lan', '0949456789', 'lan2@gmail.com', 'Bình Dương', '', 'cod', 1790000.00, 'dang_giao', '2025-11-30 20:15:00'),
(139, 1, 'Phan Quốc Cường', '0950567890', 'cuong2@gmail.com', 'TP.HCM', '', 'cod', 2690000.00, 'hoan_thanh', '2025-12-01 09:25:00'),
(140, 1, 'Tô Ngọc Yến', '0961678901', 'yen3@gmail.com', 'Hà Nội', '', 'bank', 4590000.00, 'hoan_thanh', '2025-12-01 12:50:00'),
(141, 1, 'Huỳnh Minh Trí', '0972789012', 'tri@gmail.com', 'Đà Nẵng', '', 'cod', 890000.00, 'cho_xac_nhan', '2025-12-01 16:20:00'),
(142, 1, 'Dương Thị Kim', '0983890123', 'kim@gmail.com', 'TP.HCM', '', 'cod', 3390000.00, 'hoan_thanh', '2025-12-01 19:45:00'),
(143, 1, 'Lâm Văn Hiếu', '0904901234', 'hieu@gmail.com', 'Hà Nội', '', 'bank', 6890000.00, 'hoan_thanh', '2025-12-02 08:40:00'),
(144, 1, 'Võ Thị Thu Trang', '0915012345', 'trang@gmail.com', 'Cần Thơ', '', 'cod', 2290000.00, 'dang_giao', '2025-12-02 13:55:00'),
(145, 1, 'Nguyễn Lan Anh', '0905123456', 'lananh@gmail.com', 'Hà Nội', NULL, 'cod', 2890000.00, 'hoan_thanh', '2025-11-26 10:30:00'),
(146, 1, 'Trần Minh Tuấn', '0918234567', 'tuan@gmail.com', 'TP.HCM', NULL, 'bank', 4560000.00, 'hoan_thanh', '2025-11-26 15:20:00'),
(147, 1, 'Lê Thị Mai', '0927345678', 'mai@gmail.com', 'Đà Nẵng', NULL, 'cod', 1890000.00, 'dang_giao', '2025-11-27 11:10:00'),
(148, 1, 'Phạm Văn Hùng', '0936456789', 'hung@gmail.com', 'Hà Nội', NULL, 'cod', 3780000.00, 'hoan_thanh', '2025-11-27 17:40:00'),
(149, 1, 'Hoàng Ngọc Linh', '0945567890', 'linh@gmail.com', 'TP.HCM', NULL, 'bank', 5290000.00, 'hoan_thanh', '2025-11-28 09:15:00'),
(150, 1, 'Vũ Anh Thư', '0956678901', 'thu@gmail.com', 'Cần Thơ', NULL, 'cod', 2670000.00, 'da_xac_nhan', '2025-11-28 14:30:00'),
(151, 1, 'Đỗ Quốc Bảo', '0967789012', 'bao@gmail.com', 'Hà Nội', NULL, 'cod', 4980000.00, 'hoan_thanh', '2025-11-28 20:00:00'),
(152, 1, 'Bùi Thị Huyền', '0978890123', 'huyen@gmail.com', 'Hà Nội', NULL, 'cod', 3290000.00, 'dang_giao', '2025-11-29 10:45:00'),
(153, 1, 'Mai Anh Đào', '0989901234', 'dao@gmail.com', 'TP.HCM', NULL, 'bank', 6890000.00, 'hoan_thanh', '2025-11-29 16:20:00'),
(154, 1, 'Ngô Đức Nam', '0905012345', 'nam@gmail.com', 'Đà Nẵng', NULL, 'cod', 1780000.00, 'cho_xac_nhan', '2025-11-29 21:10:00'),
(155, 1, 'Trương Bảo Ngọc', '0916123456', 'ngoc@gmail.com', 'Hà Nội', NULL, 'cod', 4590000.00, 'hoan_thanh', '2025-11-30 09:30:00'),
(156, 1, 'Lý Thanh Hà', '0927234567', 'ha@gmail.com', 'TP.HCM', NULL, 'cod', 890000.00, 'da_huy', '2025-11-30 14:15:00'),
(157, 1, 'Hà Văn Khôi', '0938345678', 'khoi@gmail.com', 'Hà Nội', NULL, 'bank', 7980000.00, 'hoan_thanh', '2025-11-30 19:50:00'),
(158, 1, 'Đinh Thị Lan', '0949456789', 'lan2@gmail.com', 'Bình Dương', NULL, 'cod', 3670000.00, 'dang_giao', '2025-12-01 10:20:00'),
(159, 1, 'Phan Quốc Cường', '0950567890', 'cuong@gmail.com', 'TP.HCM', NULL, 'cod', 5780000.00, 'hoan_thanh', '2025-12-01 15:45:00'),
(160, 1, 'Tô Ngọc Yến', '0961678901', 'yen@gmail.com', 'Hà Nội', NULL, 'bank', 6590000.00, 'hoan_thanh', '2025-12-01 20:30:00'),
(161, 1, 'Huỳnh Minh Trí', '0972789012', 'tri@gmail.com', 'Đà Nẵng', NULL, 'cod', 2390000.00, 'cho_xac_nhan', '2025-12-02 08:15:00'),
(162, 1, 'Dương Thị Kim', '0983890123', 'kim@gmail.com', 'TP.HCM', NULL, 'cod', 4890000.00, 'hoan_thanh', '2025-12-02 12:40:00'),
(163, 1, 'Lâm Văn Hiếu', '0904901234', 'hieu@gmail.com', 'Hà Nội', NULL, 'bank', 8790000.00, 'hoan_thanh', '2025-12-02 14:20:00'),
(164, 1, 'Võ Thu Trang', '0915012345', 'trang@gmail.com', 'Cần Thơ', NULL, 'cod', 3980000.00, 'dang_giao', '2025-12-02 16:55:00'),
(165, 1, 'Khách lẻ 21', '0906123456', 'kh21@gmail.com', 'Hà Nội', NULL, 'cod', 5670000.00, 'hoan_thanh', '2025-11-27 13:20:00'),
(166, 1, 'Khách lẻ 22', '0917234567', 'kh22@gmail.com', 'TP.HCM', NULL, 'bank', 7340000.00, 'hoan_thanh', '2025-11-28 18:10:00'),
(167, 1, 'Khách lẻ 23', '0928345678', 'kh23@gmail.com', 'Đà Nẵng', NULL, 'cod', 2980000.00, 'dang_giao', '2025-11-29 12:30:00'),
(168, 1, 'Khách lẻ 24', '0939456789', 'kh24@gmail.com', 'Hà Nội', NULL, 'cod', 4560000.00, 'hoan_thanh', '2025-11-30 16:45:00'),
(169, 1, 'Khách lẻ 25', '0940567890', 'kh25@gmail.com', 'TP.HCM', NULL, 'bank', 6890000.00, 'hoan_thanh', '2025-12-01 11:20:00'),
(170, 1, 'Khách lẻ 26', '0951678901', 'kh26@gmail.com', 'Hà Nội', NULL, 'cod', 5120000.00, 'hoan_thanh', '2025-12-02 10:50:00'),
(201, 1, 'Nguyễn Lan Anh', '0905123456', 'lananh@gmail.com', 'Hà Nội', '', 'cod', 1290000.00, 'hoan_thanh', '2025-11-26 09:30:00'),
(202, 1, 'Trần Minh Tuấn', '0918234567', 'tuan@gmail.com', 'TP.HCM', '', 'bank', 2980000.00, 'hoan_thanh', '2025-11-26 14:20:00'),
(203, 1, 'Lê Thị Mai', '0927345678', 'mai@gmail.com', 'Đà Nẵng', '', 'cod', 4560000.00, 'hoan_thanh', '2025-11-27 10:15:00'),
(204, 1, 'Phạm Văn Hùng', '0936456789', 'hung@gmail.com', 'Hà Nội', '', 'cod', 3890000.00, 'dang_giao', '2025-11-27 16:45:00'),
(205, 1, 'Hoàng Ngọc Linh', '0945567890', 'linh@gmail.com', 'TP.HCM', '', 'bank', 7890000.00, 'hoan_thanh', '2025-11-28 11:30:00'),
(206, 1, 'Vũ Anh Thư', '0956678901', 'thu@gmail.com', 'Cần Thơ', '', 'cod', 5670000.00, 'hoan_thanh', '2025-11-28 15:55:00'),
(207, 1, 'Đỗ Quốc Bảo', '0967789012', 'bao@gmail.com', 'Hà Nội', '', 'cod', 6780000.00, 'hoan_thanh', '2025-11-29 14:20:00'),
(208, 1, 'Mai Anh Đào', '0989901234', 'dao@gmail.com', 'TP.HCM', '', 'bank', 4890000.00, 'da_xac_nhan', '2025-11-29 19:10:00'),
(209, 1, 'Hà Văn Khôi', '0938345678', 'khoi@gmail.com', 'Hà Nội', '', 'bank', 9870000.00, 'hoan_thanh', '2025-11-30 10:40:00'),
(210, 1, 'Phan Quốc Cường', '0950567890', 'cuong@gmail.com', 'TP.HCM', '', 'cod', 8760000.00, 'hoan_thanh', '2025-11-30 17:30:00'),
(211, 1, 'Tô Ngọc Yến', '0961678901', 'yen@gmail.com', 'Hà Nội', '', 'bank', 8790000.00, 'hoan_thanh', '2025-12-01 13:20:00'),
(212, 1, 'Dương Thị Kim', '0983890123', 'kim@gmail.com', 'TP.HCM', '', 'cod', 6540000.00, 'dang_giao', '2025-12-01 18:45:00'),
(213, 1, 'Lâm Văn Hiếu', '0904901234', 'hieu@gmail.com', 'Hà Nội', '', 'bank', 9870000.00, 'hoan_thanh', '2025-12-02 09:40:00'),
(214, 1, 'Võ Thị Thu Trang', '0915012345', 'trang@gmail.com', 'Cần Thơ', '', 'cod', 7890000.00, 'da_xac_nhan', '2025-12-02 14:55:00'),
(215, 1, 'Khách lẻ mới', '0909090909', 'khachle@gmail.com', 'Hà Nội', NULL, 'cod', 2300000.00, 'cho_xac_nhan', '2025-12-02 10:30:00'),
(216, 1, 'Khách VIP', '0919191919', 'vip@gmail.com', 'TP.HCM', NULL, 'cod', 4600000.00, 'dang_giao', '2025-12-02 11:15:00'),
(217, 1, 'Khách hủy', '0929292929', 'huy@gmail.com', 'Đà Nẵng', NULL, 'cod', 1500000.00, 'da_huy', '2025-12-02 12:00:00'),
(218, 1, 'Trương Duy', '0325144221', 'Ducduy102938@gmail.com', '123', '', '', 210000.00, 'cho_xac_nhan', '2025-12-02 22:46:30'),
(219, 1, 'Trương Duy', '0325144221', 'Ducduy102938@gmail.com', '123', '', '', 220000.00, 'cho_xac_nhan', '2025-12-04 18:06:13'),
(220, 13, 'Huy Anh', '0834066567', 'anhhuyvts123@gmail.com', '123', '', '', 800000.00, 'Đang giao hàng', '2026-09-09 21:51:53');

-- --------------------------------------------------------

--
-- Table structure for table `khach_hang`
--

CREATE TABLE `khach_hang` (
  `id_khach_hang` int(11) NOT NULL,
  `ho_ten` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `dien_thoai` varchar(20) DEFAULT NULL,
  `ngay_sinh` date DEFAULT NULL,
  `dia_chi` text DEFAULT NULL,
  `anh_dai_dien` varchar(255) DEFAULT NULL,
  `mat_khau` varchar(255) NOT NULL,
  `ngay_tao` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `khach_hang`
--

INSERT INTO `khach_hang` (`id_khach_hang`, `ho_ten`, `email`, `dien_thoai`, `ngay_sinh`, `dia_chi`, `anh_dai_dien`, `mat_khau`, `ngay_tao`) VALUES
(1, 'Trương Duy', 'Ducduy102938@gmail.com', '0325144221', NULL, NULL, 'uploads/avatars/1765036325_avt.jpg', '$2y$10$UFM8hfFfQ9AL9apSgxhqEuC1t2jdLNdozTXOJeaKHFG0pSDaPDBQe', '2025-12-02 16:24:55'),
(2, 'Nguyễn Văn An', 'an.nguyen@gmail.com', '0901234567', NULL, NULL, NULL, '$2y$10$examplehash1234567890', '2025-11-15 10:30:00'),
(3, 'Trần Thị Bé', 'be.tran@yahoo.com', '0912345678', NULL, NULL, NULL, '$2y$10$examplehash1234567890', '2025-11-18 14:20:00'),
(4, 'Lê Văn Cường', 'cuong.le@hotmail.com', '0329876543', NULL, NULL, NULL, '$2y$10$examplehash1234567890', '2025-11-20 09:15:00'),
(5, 'Phạm Minh Đức', 'duc.pham@gmail.com', '0388889999', NULL, NULL, NULL, '$2y$10$examplehash1234567890', '2025-11-22 16:45:00'),
(6, 'Hoàng Yến Nhi', 'nhi.hoang@gmail.com', '0777123456', NULL, NULL, NULL, '$2y$10$examplehash1234567890', '2025-11-25 11:00:00'),
(7, 'Vũ Ngọc Lan', 'lan.vu@gmail.com', NULL, NULL, NULL, NULL, '$2y$10$examplehash1234567890', '2025-11-28 08:30:00'),
(8, 'Đỗ Quang Huy', 'huy.do@gmail.com', '0935123456', NULL, NULL, NULL, '$2y$10$examplehash1234567890', '2025-12-01 13:20:00'),
(9, 'Bùi Thị Mai', 'mai.bui@gmail.com', '0966789123', NULL, NULL, NULL, '$2y$10$examplehash1234567890', '2025-12-02 17:55:00'),
(10, 'Ngô Văn Tuấn', 'tuan.ngo@gmail.com', '0355558888', NULL, NULL, NULL, '$2y$10$examplehash1234567890', '2025-12-03 10:10:00'),
(11, 'Lý Kim Ngân', 'ngan.ly@gmail.com', '0399991111', NULL, NULL, NULL, '$2y$10$examplehash1234567890', '2025-12-04 15:40:00'),
(12, 'H Trương', 'vipro@gmail.com', '0898538893', NULL, NULL, NULL, '$2y$10$SoLdCpg8k/r3FSDP9d8.1eswHfvWq4Q7Pw01vpbz/ix573d0xXhBq', '2025-12-06 13:11:19'),
(13, 'Huy Anh', 'anhhuyvts123@gmail.com', '0834066567', NULL, NULL, NULL, '$2y$10$.h4/HeLUEN1dKmeF/YXE.uWqMJfwUOalv/FHejPNe/yAEzp/2lql2', '2026-09-09 21:14:48');

-- --------------------------------------------------------

--
-- Table structure for table `lien_he`
--

CREATE TABLE `lien_he` (
  `id` int(11) NOT NULL,
  `ho_ten` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `noi_dung` text NOT NULL,
  `trang_thai` varchar(50) DEFAULT 'Chờ xử lý',
  `phan_hoi` text DEFAULT NULL,
  `ngay_gui` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `lien_he`
--

INSERT INTO `lien_he` (`id`, `ho_ten`, `email`, `noi_dung`, `trang_thai`, `phan_hoi`, `ngay_gui`) VALUES
(1, 'Trương Đức Duy', 'Ducduy102938@gmail.com', 'THASLAKS', 'Đã phản hồi', 'Cảm ơn bạn đã', '2025-12-06 07:41:23'),
(2, 'Huy', 'anhhuyvts123@gmail.com', 'hello', 'Chờ xử lý', NULL, '2026-09-09 21:26:38'),
(3, 'huy', 'anhhuyvts123@gmail.com', 'hi', 'Chờ xử lý', NULL, '2026-09-09 21:47:21');

-- --------------------------------------------------------

--
-- Table structure for table `nguoi_dung`
--

CREATE TABLE `nguoi_dung` (
  `id` int(11) NOT NULL,
  `ho_ten` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `so_dien_thoai` varchar(20) DEFAULT NULL,
  `mat_khau` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nguoi_dung`
--

INSERT INTO `nguoi_dung` (`id`, `ho_ten`, `email`, `so_dien_thoai`, `mat_khau`) VALUES
(1, 'Trương Đức Duy', 'ducduy102938@gmail.com', NULL, '0712');

-- --------------------------------------------------------

--
-- Table structure for table `san_pham`
--

CREATE TABLE `san_pham` (
  `id_san_pham` int(11) NOT NULL,
  `ten_san_pham` varchar(255) DEFAULT NULL,
  `id_danh_muc` int(11) DEFAULT NULL,
  `gia` decimal(10,2) DEFAULT NULL,
  `mo_ta` text DEFAULT NULL,
  `link_anh` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `san_pham`
--

INSERT INTO `san_pham` (`id_san_pham`, `ten_san_pham`, `id_danh_muc`, `gia`, `mo_ta`, `link_anh`) VALUES
(1, 'Áo thun cotton basic', 4, 150000.00, 'Áo thun cotton co giãn 4 chiều', 'ThoiTrangNam/AoThun/ao_thun_cotton.jpg'),
(2, 'Áo thun thể thao', 4, 200000.00, 'Áo thun thể thao thoát mồ hôi nhanh', 'ThoiTrangNam/AoThun/ao_thun_thethao.jpg'),
(3, 'Áo thun oversize', 4, 180000.00, 'Áo thun oversize phong cách Hàn Quốc', 'ThoiTrangNam/AoThun/ao_thun_oversize.jpg'),
(4, 'Áo vest công sở', 5, 1200000.00, 'Áo vest nam lịch lãm', 'ThoiTrangNam/AoVest/ao_vest_congso.jpg'),
(5, 'Áo vest dự tiệc', 5, 1500000.00, 'Áo vest dự tiệc cao cấp', 'ThoiTrangNam/AoVest/ao_vest_dutiec.jpg'),
(6, 'Áo vest slimfit', 5, 1350000.00, 'Áo vest slimfit trẻ trung', 'ThoiTrangNam/AoVest/ao_vest_slimfit.jpg'),
(7, 'Áo sơ mi caro', 6, 300000.00, 'Áo sơ mi caro tay dài', 'ThoiTrangNam/AoSoMi/ao_somi_caro.jpg'),
(8, 'Áo sơ mi trắng basic', 6, 250000.00, 'Áo sơ mi trắng trơn', 'ThoiTrangNam/AoSoMi/ao_somi_trang.jpg'),
(9, 'Áo sơ mi ngắn tay', 6, 280000.00, 'Áo sơ mi ngắn tay thoải mái', 'ThoiTrangNam/AoSoMi/ao_somi_ngantay.jpg'),
(10, 'Hoodie oversize', 7, 450000.00, 'Áo hoodie nỉ bông form rộng', 'ThoiTrangNam/Hoodie/hoodie_oversize.jpg'),
(11, 'Hoodie có nón', 7, 480000.00, 'Áo hoodie có nón dây rút', 'ThoiTrangNam/Hoodie/hoodie_conon.jpg'),
(12, 'Hoodie zipper', 7, 500000.00, 'Áo hoodie kéo khóa', 'ThoiTrangNam/Hoodie/hoodie_zipper.jpg'),
(13, 'Quần jeans slimfit', 8, 400000.00, 'Quần jeans slimfit ôm vừa', 'ThoiTrangNam/QuanJeansNam/jeans_slimfit.jpg'),
(14, 'Quần jeans rách gối', 8, 450000.00, 'Quần jeans rách gối cá tính', 'ThoiTrangNam/QuanJeansNam/jeans_rachgoi.jpg'),
(15, 'Quần jeans ống rộng', 8, 420000.00, 'Quần jeans ống rộng phong cách', 'ThoiTrangNam/QuanJeansNam/jeans_ongrong.jpg'),
(16, 'Quần tây công sở', 9, 500000.00, 'Quần tây nam form đứng', 'ThoiTrangNam/QuanTayNam/quantay_congso.jpg'),
(17, 'Quần tây slimfit', 9, 520000.00, 'Quần tây slimfit trẻ trung', 'ThoiTrangNam/QuanTayNam/quantay_slimfit.jpg'),
(18, 'Quần tây kaki', 9, 480000.00, 'Quần tây kaki co giãn', 'ThoiTrangNam/QuanTayNam/quantay_kaki.jpg'),
(19, 'Áo khoác bomber', 10, 650000.00, 'Áo khoác bomber Hàn Quốc', 'ThoiTrangNam/AoKhoacNam/aokhoac_bomber.jpg'),
(20, 'Áo khoác da', 10, 950000.00, 'Áo khoác da cao cấp', 'ThoiTrangNam/AoKhoacNam/aokhoac_da.jpg'),
(21, 'Áo khoác gió', 10, 550000.00, 'Áo khoác gió chống nước', 'ThoiTrangNam/AoKhoacNam/aokhoac_gio.jpg'),
(22, 'Bộ đồ thể thao Adidas', 11, 900000.00, 'Bộ đồ thể thao Adidas co giãn', 'ThoiTrangNam/DoTheThaoNam/do_adidas.jpg'),
(23, 'Bộ đồ thể thao Nike', 11, 850000.00, 'Bộ đồ thể thao Nike thoải mái', 'ThoiTrangNam/DoTheThaoNam/do_nike.jpg'),
(24, 'Bộ đồ thể thao Puma', 11, 800000.00, 'Bộ đồ thể thao Puma phong cách', 'ThoiTrangNam/DoTheThaoNam/do_puma.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `chi_tiet_don_hang`
--
ALTER TABLE `chi_tiet_don_hang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_don_hang` (`id_don_hang`),
  ADD KEY `id_san_pham` (`id_san_pham`);

--
-- Indexes for table `chi_tiet_san_pham`
--
ALTER TABLE `chi_tiet_san_pham`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_san_pham` (`id_san_pham`);

--
-- Indexes for table `danh_muc`
--
ALTER TABLE `danh_muc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cha` (`id_cha`);

--
-- Indexes for table `don_hang`
--
ALTER TABLE `don_hang`
  ADD PRIMARY KEY (`id_don_hang`),
  ADD KEY `id_khach_hang` (`id_khach_hang`);

--
-- Indexes for table `khach_hang`
--
ALTER TABLE `khach_hang`
  ADD PRIMARY KEY (`id_khach_hang`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `lien_he`
--
ALTER TABLE `lien_he`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nguoi_dung`
--
ALTER TABLE `nguoi_dung`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `san_pham`
--
ALTER TABLE `san_pham`
  ADD PRIMARY KEY (`id_san_pham`),
  ADD KEY `id_danh_muc` (`id_danh_muc`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `chi_tiet_don_hang`
--
ALTER TABLE `chi_tiet_don_hang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=491;

--
-- AUTO_INCREMENT for table `chi_tiet_san_pham`
--
ALTER TABLE `chi_tiet_san_pham`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `danh_muc`
--
ALTER TABLE `danh_muc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `don_hang`
--
ALTER TABLE `don_hang`
  MODIFY `id_don_hang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=221;

--
-- AUTO_INCREMENT for table `khach_hang`
--
ALTER TABLE `khach_hang`
  MODIFY `id_khach_hang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `lien_he`
--
ALTER TABLE `lien_he`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `nguoi_dung`
--
ALTER TABLE `nguoi_dung`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `san_pham`
--
ALTER TABLE `san_pham`
  MODIFY `id_san_pham` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chi_tiet_san_pham`
--
ALTER TABLE `chi_tiet_san_pham`
  ADD CONSTRAINT `chi_tiet_san_pham_ibfk_1` FOREIGN KEY (`id_san_pham`) REFERENCES `san_pham` (`id_san_pham`);

--
-- Constraints for table `danh_muc`
--
ALTER TABLE `danh_muc`
  ADD CONSTRAINT `danh_muc_ibfk_1` FOREIGN KEY (`id_cha`) REFERENCES `danh_muc` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `don_hang`
--
ALTER TABLE `don_hang`
  ADD CONSTRAINT `don_hang_ibfk_1` FOREIGN KEY (`id_khach_hang`) REFERENCES `khach_hang` (`id_khach_hang`);

--
-- Constraints for table `san_pham`
--
ALTER TABLE `san_pham`
  ADD CONSTRAINT `san_pham_ibfk_1` FOREIGN KEY (`id_danh_muc`) REFERENCES `danh_muc` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
