-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 13, 2023 at 05:06 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `benhvien`
--

-- --------------------------------------------------------

--
-- Table structure for table `benhnhan`
--

CREATE TABLE `benhnhan` (
  `ID` varchar(32) NOT NULL,
  `trangthai` int(11) NOT NULL,
  `hovaten` varchar(255) NOT NULL,
  `ngaysinh` datetime NOT NULL,
  `dienthoai` varchar(10) NOT NULL,
  `mota` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `benhnhan`
--

INSERT INTO `benhnhan` (`ID`, `trangthai`, `hovaten`, `ngaysinh`, `dienthoai`, `mota`) VALUES
('01', 123, 'nguyen quoc truong', '2023-06-14 00:00:00', '0123456789', 'mo ta 1'),
('02', 234, 'hoang anh dung', '2023-06-14 00:00:00', '0987654321', 'mo ta 2');

-- --------------------------------------------------------

--
-- Table structure for table `dieutri`
--

CREATE TABLE `dieutri` (
  `ID` int(11) NOT NULL,
  `nhanvien_ID` int(11) NOT NULL,
  `loaibenh_ID` int(11) NOT NULL,
  `benhnhan` varchar(32) NOT NULL,
  `ngaybatdau` datetime NOT NULL,
  `ngayketthuc` datetime NOT NULL,
  `nhanxet` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dieutri`
--

INSERT INTO `dieutri` (`ID`, `nhanvien_ID`, `loaibenh_ID`, `benhnhan`, `ngaybatdau`, `ngayketthuc`, `nhanxet`) VALUES
(1, 13, 34, '23', '2023-06-14 00:00:00', '2023-06-14 00:00:00', 1),
(2, 12, 35, '23', '2023-06-14 00:00:00', '2023-06-14 00:00:00', 1),
(3, 14, 34, '23', '2023-06-14 00:00:00', '2023-06-14 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `khoa`
--

CREATE TABLE `khoa` (
  `ID` int(11) NOT NULL,
  `namthanhlap` int(11) NOT NULL,
  `ten` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `khoa`
--

INSERT INTO `khoa` (`ID`, `namthanhlap`, `ten`) VALUES
(1, 2023, 'Bệnh Tim'),
(2, 2023, 'Bệnh Phổi');

-- --------------------------------------------------------

--
-- Table structure for table `loaibenh`
--

CREATE TABLE `loaibenh` (
  `ID` int(11) NOT NULL,
  `tenbenh` varchar(255) NOT NULL,
  `mota` varchar(500) NOT NULL,
  `trieutrung` text NOT NULL,
  `huongdieutri` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `loaibenh`
--

INSERT INTO `loaibenh` (`ID`, `tenbenh`, `mota`, `trieutrung`, `huongdieutri`) VALUES
(34, 'Tim', 'mo ta 1', 'dau', 'thuoc'),
(35, 'Phổi', 'mo ta 2', 'kho tho', 'thuoc');

-- --------------------------------------------------------

--
-- Table structure for table `nhanvien`
--

CREATE TABLE `nhanvien` (
  `ID` int(11) NOT NULL,
  `khoa_id` int(11) NOT NULL,
  `hovaten` varchar(255) NOT NULL,
  `dienthoai` varchar(10) NOT NULL,
  `namkyhopdong` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nhanvien`
--

INSERT INTO `nhanvien` (`ID`, `khoa_id`, `hovaten`, `dienthoai`, `namkyhopdong`) VALUES
(12, 2, 'Nguyen Quoc Truong', '0123456789', '2023-06-14 00:00:00'),
(13, 2, 'Nguyen Van A', '0987654321', '2023-06-14 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `ID` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `matkhau` varchar(255) NOT NULL,
  `tendaydu` varchar(255) NOT NULL,
  `quyenhan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`ID`, `username`, `matkhau`, `tendaydu`, `quyenhan`) VALUES
(1, 'truong', '123', 'Nguyen Quoc Truong', 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
