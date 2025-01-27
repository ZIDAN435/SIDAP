-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 10 Jul 2024 pada 11.40
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbsidap`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `atlet`
--

CREATE TABLE `atlet` (
  `id` int(128) NOT NULL,
  `name` varchar(256) NOT NULL,
  `kontingen_id` varchar(128) NOT NULL,
  `status` int(1) NOT NULL,
  `date_created` int(11) DEFAULT NULL,
  `foto` varchar(128) DEFAULT 'default.jpg',
  `tmp_lahir` varchar(128) DEFAULT NULL,
  `tgl_lahir` date DEFAULT '0000-00-00',
  `address_atlet` text DEFAULT NULL,
  `cabor_id` int(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `atlet`
--

INSERT INTO `atlet` (`id`, `name`, `kontingen_id`, `status`, `date_created`, `foto`, `tmp_lahir`, `tgl_lahir`, `address_atlet`, `cabor_id`) VALUES
(1, 'Arif Muhammad Hasan', '1', 1, 0, 'default.jpg', 'bandung', '2019-10-15', 'bandung', 1),
(2, 'Syaeful Indra Kurniawan', '2', 1, 0, 'default.jpg', 'semarang', '0000-00-00', 'semarang', 2),
(3, 'dendi rafahman', '1', 1, NULL, 'default.jpg', 'Cianjur', '0000-00-00', '', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `cabor`
--

CREATE TABLE `cabor` (
  `id` int(128) NOT NULL,
  `name_cabor` varchar(128) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `cabor`
--

INSERT INTO `cabor` (`id`, `name_cabor`, `status`) VALUES
(1, 'Angkat Besi', 1),
(2, 'Judo', 1),
(3, 'Panahan', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kontingen`
--

CREATE TABLE `kontingen` (
  `id` int(128) NOT NULL,
  `name_kontingen` varchar(128) NOT NULL,
  `address` text NOT NULL,
  `email` varchar(128) NOT NULL,
  `status` int(1) NOT NULL,
  `logo` varchar(128) DEFAULT 'default.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `kontingen`
--

INSERT INTO `kontingen` (`id`, `name_kontingen`, `address`, `email`, `status`, `logo`) VALUES
(1, 'PPLP Jawa Barat', 'Jalan Arcamanik No 21', 'pplpjabar@gmail.com', 1, 'default.jpg'),
(2, 'PPLP Jawa Tengah', 'Semarang', 'PPLPjawatengah@gmail.com', 1, 'default.jpg'),
(3, 'PPLP Jawa Timur', 'Surabaya', 'jawatimur@gmail.com', 1, 'default.jpg'),
(4, 'PPLP DKI Jakarta', 'JAKARTA', 'PPLPDKI@gmail.com', 1, 'default.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `prestasi`
--

CREATE TABLE `prestasi` (
  `id` int(11) NOT NULL,
  `atlet_id` int(11) NOT NULL,
  `tahun` int(4) NOT NULL,
  `kejuaraan` varchar(255) NOT NULL,
  `prestasi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `prestasi`
--

INSERT INTO `prestasi` (`id`, `atlet_id`, `tahun`, `kejuaraan`, `prestasi`) VALUES
(3, 0, 2002, 'Lomba Ngocok(Botol)', 'Juara 1 Lomba Ngocok(Botol)'),
(4, 2, 2002, 'Lomba Ngocok(Botol)', 'Juara 1 Lomba Ngocok(Botol)');

-- --------------------------------------------------------

--
-- Struktur dari tabel `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `role` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `role`
--

INSERT INTO `role` (`id`, `role`) VALUES
(1, 'administrator'),
(2, 'member');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `image` varchar(128) NOT NULL,
  `password` varchar(256) NOT NULL,
  `role_id` int(11) NOT NULL,
  `is_active` int(1) NOT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `image`, `password`, `role_id`, `is_active`, `date_created`) VALUES
(7, 'Rizkika Adam Pratama', 'rizkikaadam@gmail.com', 'default.jpg', '$2y$10$32Oo6lQN7EiazuGpFEKw5upTfgXACpiWE3btJeCPGRNJ2zZ9wZCnS', 1, 1, 1557903029),
(8, 'dendi rafahman', 'dendirafahman@gmail.com', 'default.jpg', '827ccb0eea8a706c4c34a16891f84e7b', 2, 1, 1558594839),
(9, 'dendi rafahman', 'dr@gmail.com', 'default.jpg', '$2y$10$D4AQtNnBFtRxg42rJNmoku1kHdTUo3L7gMrH.tZZ0.ecpf8JD9sMu', 2, 1, 1570847073),
(10, 'rizal', 'rizal@rizal.com', 'default.jpg', '$2y$10$yMB8pTW8GTwersVT3w8qbeEuF1aFJgdr3BS08c9xwpdqepUWgdr6i', 1, 1, 1720594478);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_access_menu`
--

CREATE TABLE `user_access_menu` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `user_access_menu`
--

INSERT INTO `user_access_menu` (`id`, `role_id`, `menu_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 2),
(4, 1, 3),
(5, 1, 4),
(6, 2, 4),
(7, 1, 5),
(8, 1, 6),
(9, 2, 6);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_menu`
--

CREATE TABLE `user_menu` (
  `id` int(11) NOT NULL,
  `menu` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `user_menu`
--

INSERT INTO `user_menu` (`id`, `menu`) VALUES
(1, 'Admin'),
(2, 'User'),
(3, 'Menu'),
(4, 'Atlet'),
(5, 'Kontingen'),
(6, 'CABOR');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_sub_menu`
--

CREATE TABLE `user_sub_menu` (
  `id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `url` varchar(128) NOT NULL,
  `icon` varchar(128) NOT NULL,
  `is_active` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `user_sub_menu`
--

INSERT INTO `user_sub_menu` (`id`, `menu_id`, `title`, `url`, `icon`, `is_active`) VALUES
(1, 1, 'Dashboard', 'admin', 'fas fa-fw fa-tachometer-alt', 1),
(2, 2, 'My Profile', 'user', 'fas fa-fw fa-user', 1),
(3, 2, 'Edit Profile', 'user/edit', 'fas fa-fw fa-user-edit', 1),
(4, 3, 'Menu Management', 'menu', 'fas fa-fw fa-folder', 1),
(5, 3, 'Submenu Management', 'menu/submenu', 'fas fa-fw fa-folder-open', 1),
(6, 4, 'Data Atlet', 'Atlet', 'fa fw-fs fas fa-users', 1),
(7, 4, 'Riwayat Atlet', 'Atlet/riwayat', 'fa fw-fs fas fa-chart-area', 1),
(8, 5, 'Kontingen', 'Kontingen', 'fa fw-fs far fa-flag', 1),
(9, 6, 'Cabang Olahraga', 'cabor', '', 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `atlet`
--
ALTER TABLE `atlet`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `cabor`
--
ALTER TABLE `cabor`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kontingen`
--
ALTER TABLE `kontingen`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `prestasi`
--
ALTER TABLE `prestasi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user_access_menu`
--
ALTER TABLE `user_access_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user_menu`
--
ALTER TABLE `user_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user_sub_menu`
--
ALTER TABLE `user_sub_menu`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `atlet`
--
ALTER TABLE `atlet`
  MODIFY `id` int(128) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `cabor`
--
ALTER TABLE `cabor`
  MODIFY `id` int(128) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `kontingen`
--
ALTER TABLE `kontingen`
  MODIFY `id` int(128) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `prestasi`
--
ALTER TABLE `prestasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `user_access_menu`
--
ALTER TABLE `user_access_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `user_menu`
--
ALTER TABLE `user_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `user_sub_menu`
--
ALTER TABLE `user_sub_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
