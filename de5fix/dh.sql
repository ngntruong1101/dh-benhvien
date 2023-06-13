-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 13, 2023 at 05:03 PM
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
-- Database: `dh`
--

-- --------------------------------------------------------

--
-- Table structure for table `ketquathi`
--

CREATE TABLE `ketquathi` (
  `ID` int(11) NOT NULL,
  `monhoc_id` int(11) NOT NULL,
  `sinhvien_id` varchar(32) NOT NULL,
  `loaidiem` int(11) NOT NULL,
  `lanthi` int(11) NOT NULL,
  `diem` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ketquathi`
--

INSERT INTO `ketquathi` (`ID`, `monhoc_id`, `sinhvien_id`, `loaidiem`, `lanthi`, `diem`) VALUES
(1, 2, '1', 9, 1, 10),
(2, 2, '2', 3, 2, 5);

-- --------------------------------------------------------

--
-- Table structure for table `khoa`
--

CREATE TABLE `khoa` (
  `ID` int(11) NOT NULL,
  `namthanhlap` int(11) NOT NULL,
  `ten` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `khoa`
--

INSERT INTO `khoa` (`ID`, `namthanhlap`, `ten`) VALUES
(1, 2009, 'Công nghệ thông tin'),
(2, 2, 'ten 2');

-- --------------------------------------------------------

--
-- Table structure for table `lophanhchinh`
--

CREATE TABLE `lophanhchinh` (
  `ID` int(11) NOT NULL,
  `tenlop` varchar(255) NOT NULL,
  `namthanhlap` int(11) NOT NULL,
  `khoa_id` int(11) NOT NULL,
  `siso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `lophanhchinh`
--

INSERT INTO `lophanhchinh` (`ID`, `tenlop`, `namthanhlap`, `khoa_id`, `siso`) VALUES
(1, 'Công nghệ thông tin', 2009, 1, 100),
(2, 'ten lop 1', 1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `monhoc`
--

CREATE TABLE `monhoc` (
  `ID` int(11) NOT NULL,
  `khoa_id` int(11) NOT NULL,
  `tenmon` varchar(255) NOT NULL,
  `sotinchi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `monhoc`
--

INSERT INTO `monhoc` (`ID`, `khoa_id`, `tenmon`, `sotinchi`) VALUES
(2, 1, 'Anh văn cơ bản', 3),
(3, 1, 'Toán cao cấp', 4);

-- --------------------------------------------------------

--
-- Table structure for table `sinhvien`
--

CREATE TABLE `sinhvien` (
  `ID` varchar(32) NOT NULL,
  `trangthai` int(11) NOT NULL,
  `lop_id` int(11) NOT NULL,
  `hovaten` varchar(255) NOT NULL,
  `ngaysinh` datetime NOT NULL,
  `mota` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sinhvien`
--

INSERT INTO `sinhvien` (`ID`, `trangthai`, `lop_id`, `hovaten`, `ngaysinh`, `mota`) VALUES
('sv1', 2, 2, 'truong', '2002-01-11 00:00:00', 'mo ta 1'),
('sv2', 3, 1, 'dung', '0000-00-00 00:00:00', 'mo ta 2');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `matkhau` varchar(255) NOT NULL,
  `tendaydu` varchar(255) NOT NULL,
  `quyenhan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `matkhau`, `tendaydu`, `quyenhan`) VALUES
(1, 'truong', '123', 'Nguyen Quoc Truong', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ketquathi`
--
ALTER TABLE `ketquathi`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `sinhvien_id` (`sinhvien_id`),
  ADD KEY `monhoc_id` (`monhoc_id`);

--
-- Indexes for table `khoa`
--
ALTER TABLE `khoa`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `lophanhchinh`
--
ALTER TABLE `lophanhchinh`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `khoa_id` (`khoa_id`);

--
-- Indexes for table `monhoc`
--
ALTER TABLE `monhoc`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `khoa_id` (`khoa_id`);

--
-- Indexes for table `sinhvien`
--
ALTER TABLE `sinhvien`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `lop_id` (`lop_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ketquathi`
--
ALTER TABLE `ketquathi`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `khoa`
--
ALTER TABLE `khoa`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `lophanhchinh`
--
ALTER TABLE `lophanhchinh`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `monhoc`
--
ALTER TABLE `monhoc`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
