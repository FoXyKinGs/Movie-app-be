-- phpMyAdmin SQL Dump
-- version 4.9.7deb1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 02, 2021 at 07:30 PM
-- Server version: 8.0.26-0ubuntu0.21.04.3
-- PHP Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `movie`
--

-- --------------------------------------------------------

--
-- Table structure for table `membership`
--

CREATE TABLE `membership` (
  `id` int NOT NULL,
  `membership_name` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `membership`
--

INSERT INTO `membership` (`id`, `membership_name`) VALUES
(1, 'bronze'),
(2, 'silver'),
(3, 'platinum');

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `id` int NOT NULL,
  `name` varchar(32) NOT NULL,
  `genre` varchar(32) NOT NULL,
  `image` varchar(255) NOT NULL,
  `rate` double NOT NULL,
  `synopsis` text NOT NULL,
  `price` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`id`, `name`, `genre`, `image`, `rate`, `synopsis`, `price`) VALUES
(1, 'Kimetsu No Yaiba: Mugen Train', 'Action, Horror', 'kny.jpeg', 8.7, 'Tanjiro Kamado, bergabung dengan Inosuke Hashibira, seorang anak laki-laki yang dibesarkan oleh babi hutan yang memakai kepala babi hutan, dan Zenitsu Agatsuma, seorang anak laki-laki ketakutan yang mengeluarkan kekuatan sejatinya ketika dia tidur, di dalam Kereta Infinity dalam misi baru dengan seorang Pilar Api, Kyojuro Rengoku , Untuk mengalahkan iblis yang telah menyiksa orang-orang dan membunuh pembunuh iblis yang menentangnya!', 35000),
(2, 'Spider-Man: Home Coming', 'Action, Sci-fi, Future', 'smh.jpg', 8.9, 'Peter Parker berusaha menyeimbangkan dua kehidupannya yang sangat bertolak belakang - menghentikan aksi penjualan senjata Chitauri oleh Adrian Toomes dan menjalani hari-hari selayaknya murid SMA.', 50000),
(3, 'Avengers: Infinity War', 'Action, Sci-fi, Future, Drama', 'aiw.jpg', 9.4, 'The Avengers dan sekutu mereka harus bersedia mengorbankan segalanya dalam upaya untuk mengalahkan Thanos yang kuat sebelum ia berhasil menghancurkan alam semesta.', 50000),
(4, 'Spider-Man: Far From Home', 'Action, Super-Heroes', 'smffh.jpeg', 8.2, 'Peter Parker (Tom Holland) tengah mengunjungi Eropa untuk liburan panjang bersama temaan-temanya. Sayangnya , Parker tidak bisa dengan tenang menikmati liburannya, karena Nick Fury datang secara tiba-tiba di kamar hotelnya. Selama di Eropa pun Peter harus menghadapi banyak musuh mulai dari Hydro Man, Sandman dan Molten Man.', 50000),
(5, 'A Silent Voice: The Movie', 'Drama, Romace', 'asvtm.jpg', 7.8, 'A Silent Voice bercerita tentang siswi SMA tuli bernama Shoko Nishimiya (Saori Hayami) yang mencoba untuk beradaptasi dengan teman-temannya dan hidup selayaknya siswi SMA lainnya. Sementara itu, Shoya Ishida (Miyu Irino) adalah seorang siswa SMA cuek yang senang mengganggu teman-temannya.', 32000),
(6, 'The Suicide Squad 2', 'Action, Sci-fi', 'tss2.jpg', 9.4, 'The Suicide Squad, juga dikenal dengan Suicide Squad 2, adalah film pahlawan super Amerika Serikat tahun 2021 yang didasarkan dari tim antipahlawan DC Comics Suicide Squad. Film ini dimaksudkan sebagai sekuel berdiri sendiri dari Suicide Squad dan juga menjadi film kesebelas di DC Extended Universe', 41000);

-- --------------------------------------------------------

--
-- Table structure for table `transaction_membership`
--

CREATE TABLE `transaction_membership` (
  `id` int NOT NULL,
  `id_user` int DEFAULT NULL,
  `id_membership` int DEFAULT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `transaction_membership`
--

INSERT INTO `transaction_membership` (`id`, `id_user`, `id_membership`, `date`) VALUES
(1, 1, 3, '2021-09-02 21:14:12'),
(2, 2, 1, '2021-09-01 21:20:32'),
(3, 3, 2, '2021-09-02 16:45:25'),
(4, 1, 2, '2021-09-02 16:46:12'),
(5, 3, 1, '2021-09-02 16:51:35'),
(6, 2, 3, '2021-09-02 17:39:12'),
(7, 2, 2, '2021-09-02 17:40:07');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_movie`
--

CREATE TABLE `transaction_movie` (
  `id` int NOT NULL,
  `id_user` int DEFAULT NULL,
  `id_movie` int DEFAULT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `transaction_movie`
--

INSERT INTO `transaction_movie` (`id`, `id_user`, `id_movie`, `date`) VALUES
(1, 1, 1, '2021-08-02 21:14:12'),
(2, 2, 4, '2021-09-02 17:42:35'),
(3, 1, 2, '2021-09-02 19:29:51');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(1, 'user', 'password'),
(2, 'user2', 'password'),
(3, 'user3', 'password'),
(4, 'user2s', 'pa'),
(5, 'user4', 'password');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `membership`
--
ALTER TABLE `membership`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaction_membership`
--
ALTER TABLE `transaction_membership`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaction_movie`
--
ALTER TABLE `transaction_movie`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `membership`
--
ALTER TABLE `membership`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `transaction_membership`
--
ALTER TABLE `transaction_membership`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `transaction_movie`
--
ALTER TABLE `transaction_movie`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
