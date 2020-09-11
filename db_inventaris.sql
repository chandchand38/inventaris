-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 11 Sep 2020 pada 09.29
-- Versi server: 10.4.13-MariaDB
-- Versi PHP: 7.2.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_inventaris`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `daftar_brg`
--

CREATE TABLE `daftar_brg` (
  `id_brg` int(5) NOT NULL,
  `nama_brg` varchar(255) NOT NULL,
  `ket` varchar(255) NOT NULL,
  `qty` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `daftar_brg`
--

INSERT INTO `daftar_brg` (`id_brg`, `nama_brg`, `ket`, `qty`) VALUES
(8, 'Proyektor', 'Baguss', 7),
(22, 'Router', 'Bagus', 50),
(24, 'Laptop', 'Baik', 10),
(31, 'Sound System', 'Lumayan', 3),
(33, 'Buku', 'Bagus', 50),
(44, 'Kabel LAN', 'Bagus', 8);

-- --------------------------------------------------------

--
-- Struktur dari tabel `inven`
--

CREATE TABLE `inven` (
  `id_inventaris` int(5) NOT NULL,
  `NIS` int(5) NOT NULL,
  `kode_barang` int(5) NOT NULL,
  `qty_pinjam` int(11) NOT NULL,
  `tanggal_pinjam` date NOT NULL,
  `tanggal_kembali` date NOT NULL,
  `STATUS` enum('1','0') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `inven`
--

INSERT INTO `inven` (`id_inventaris`, `NIS`, `kode_barang`, `qty_pinjam`, `tanggal_pinjam`, `tanggal_kembali`, `STATUS`) VALUES
(12, 12093, 24, 2, '2020-02-11', '2020-02-27', '0'),
(16, 12098, 8, 6, '2002-02-22', '2002-02-24', ''),
(22, 12095, 33, 2, '2020-02-12', '2020-02-13', '0'),
(33, 12096, 24, 1, '2020-02-11', '2020-02-13', '0'),
(44, 12097, 24, 1, '2020-02-02', '2020-02-03', ''),
(66, 12100, 31, 2, '2020-02-03', '2020-02-04', ''),
(69, 12099, 24, 1, '2020-03-01', '2020-03-03', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kembali`
--

CREATE TABLE `kembali` (
  `id_pengembalian` int(5) NOT NULL,
  `id_inventaris` int(5) NOT NULL,
  `NIM` int(5) NOT NULL,
  `kode_barang` int(5) NOT NULL,
  `tanggal_kembali` date NOT NULL,
  `denda` varchar(64) NOT NULL,
  `STATUS` enum('1','0') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kembali`
--

INSERT INTO `kembali` (`id_pengembalian`, `id_inventaris`, `NIM`, `kode_barang`, `tanggal_kembali`, `denda`, `STATUS`) VALUES
(23, 22, 12095, 33, '2020-02-13', '0', '1'),
(46, 44, 12097, 24, '0000-00-00', '', '1'),
(67, 16, 12098, 8, '0000-00-00', '', '1'),
(69, 33, 12096, 24, '0000-00-00', '', '1'),
(77, 12, 12093, 24, '0000-00-00', '', '1'),
(78, 66, 12100, 31, '0000-00-00', '', '1'),
(467, 69, 12099, 24, '0000-00-00', '', '1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `login`
--

CREATE TABLE `login` (
  `id_login` int(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(64) NOT NULL,
  `user` varchar(255) NOT NULL,
  `nama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `login`
--

INSERT INTO `login` (`id_login`, `username`, `password`, `user`, `nama`) VALUES
(1, 'mahasiswa', 'e10adc3949ba59abbe56e057f20f883e', 'siswa', 'Chandra'),
(2, 'operator', 'e10adc3949ba59abbe56e057f20f883e', 'operator', 'Alika');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `NIM` int(5) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `kelas` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `mahasiswa`
--

INSERT INTO `mahasiswa` (`NIM`, `nama`, `kelas`) VALUES
(2, 'Alika', '11-RPL'),
(12093, 'RIki abdul azis', 'XI-RPL3'),
(12095, 'Chandra Purnama', 'XI RPL'),
(12096, 'Alika Khansa', 'XI Farmasi'),
(12097, 'Viki Prasetyo', 'XI RPL'),
(12098, 'Naruto', 'XI Ninja'),
(12099, 'Sasuke Uchiha', 'XI Ninja'),
(12100, 'Mifuneee', 'XI Samurai'),
(12101, 'Tedy ', 'XI Ninja');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `daftar_brg`
--
ALTER TABLE `daftar_brg`
  ADD PRIMARY KEY (`id_brg`);

--
-- Indeks untuk tabel `inven`
--
ALTER TABLE `inven`
  ADD PRIMARY KEY (`id_inventaris`),
  ADD UNIQUE KEY `NIS` (`NIS`,`kode_barang`),
  ADD UNIQUE KEY `NIS_2` (`NIS`,`kode_barang`),
  ADD KEY `NIS_3` (`NIS`,`kode_barang`),
  ADD KEY `kode_barang` (`kode_barang`);

--
-- Indeks untuk tabel `kembali`
--
ALTER TABLE `kembali`
  ADD PRIMARY KEY (`id_pengembalian`),
  ADD UNIQUE KEY `id_inventaris_2` (`id_inventaris`),
  ADD KEY `id_inventaris` (`id_inventaris`,`NIM`,`kode_barang`),
  ADD KEY `NIS` (`NIM`),
  ADD KEY `kode_barang` (`kode_barang`);

--
-- Indeks untuk tabel `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id_login`),
  ADD KEY `nama` (`nama`);

--
-- Indeks untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`NIM`),
  ADD KEY `nama` (`nama`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `inven`
--
ALTER TABLE `inven`
  ADD CONSTRAINT `inven_ibfk_1` FOREIGN KEY (`NIS`) REFERENCES `mahasiswa` (`NIM`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `inven_ibfk_2` FOREIGN KEY (`kode_barang`) REFERENCES `daftar_brg` (`id_brg`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `kembali`
--
ALTER TABLE `kembali`
  ADD CONSTRAINT `kembali_ibfk_1` FOREIGN KEY (`NIM`) REFERENCES `mahasiswa` (`NIM`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `kembali_ibfk_2` FOREIGN KEY (`kode_barang`) REFERENCES `daftar_brg` (`id_brg`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `kembali_ibfk_3` FOREIGN KEY (`id_inventaris`) REFERENCES `inven` (`id_inventaris`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
