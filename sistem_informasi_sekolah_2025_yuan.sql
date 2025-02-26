-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 13 Feb 2025 pada 09.04
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
-- Database: `sistem_informasi_sekolah_2025_yuan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `guru`
--

CREATE TABLE `guru` (
  `ID` int(15) NOT NULL,
  `NAMA` varchar(50) NOT NULL,
  `JENIS` varchar(11) NOT NULL,
  `ALAMAT` text NOT NULL,
  `HP` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelas`
--

CREATE TABLE `kelas` (
  `ID` int(11) NOT NULL,
  `NAMA` varchar(25) NOT NULL,
  `TINGKAT` varchar(11) NOT NULL,
  `RUANG` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `osis`
--

CREATE TABLE `osis` (
  `ID` int(15) NOT NULL,
  `NIS` varchar(15) NOT NULL,
  `TGL_BAYAR` date NOT NULL,
  `JUMLAH_BAYAR` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `rombel`
--

CREATE TABLE `rombel` (
  `ID` int(11) NOT NULL,
  `NIS` varchar(15) NOT NULL,
  `ID_KELAS` int(15) NOT NULL,
  `ID_GURU` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa`
--

CREATE TABLE `siswa` (
  `ID` int(15) NOT NULL,
  `NIS` varchar(15) NOT NULL,
  `NAMA` varchar(16) NOT NULL,
  `JENIS` varchar(15) NOT NULL,
  `ALAMAT` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `spi`
--

CREATE TABLE `spi` (
  `ID` int(11) NOT NULL,
  `NIS` varchar(15) NOT NULL,
  `TGL_BAYAR` date NOT NULL,
  `JUMLAH_BAYAR` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `spp`
--

CREATE TABLE `spp` (
  `ID` int(11) NOT NULL,
  `NIS` varchar(15) NOT NULL,
  `TGL_BAYAR` date NOT NULL,
  `JUMLAH_BAYAR` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `NAMA` (`NAMA`),
  ADD KEY `NAMA_2` (`NAMA`);

--
-- Indeks untuk tabel `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks untuk tabel `osis`
--
ALTER TABLE `osis`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `NIS` (`NIS`);

--
-- Indeks untuk tabel `rombel`
--
ALTER TABLE `rombel`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `NIS` (`NIS`),
  ADD KEY `ID_KELAS` (`ID_KELAS`),
  ADD KEY `ID_GURU` (`ID_GURU`),
  ADD KEY `ID_GURU_2` (`ID_GURU`);

--
-- Indeks untuk tabel `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `NIS` (`NIS`);

--
-- Indeks untuk tabel `spi`
--
ALTER TABLE `spi`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `NIS` (`NIS`);

--
-- Indeks untuk tabel `spp`
--
ALTER TABLE `spp`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `NIS` (`NIS`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `kelas`
--
ALTER TABLE `kelas`
  ADD CONSTRAINT `kelas_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `siswa` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `osis`
--
ALTER TABLE `osis`
  ADD CONSTRAINT `osis_ibfk_1` FOREIGN KEY (`NIS`) REFERENCES `siswa` (`NIS`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `rombel`
--
ALTER TABLE `rombel`
  ADD CONSTRAINT `rombel_ibfk_1` FOREIGN KEY (`NIS`) REFERENCES `siswa` (`NIS`),
  ADD CONSTRAINT `rombel_ibfk_2` FOREIGN KEY (`ID_KELAS`) REFERENCES `kelas` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rombel_ibfk_3` FOREIGN KEY (`ID_GURU`) REFERENCES `guru` (`ID`);

--
-- Ketidakleluasaan untuk tabel `spi`
--
ALTER TABLE `spi`
  ADD CONSTRAINT `spi_ibfk_1` FOREIGN KEY (`NIS`) REFERENCES `siswa` (`NIS`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `spp`
--
ALTER TABLE `spp`
  ADD CONSTRAINT `spp_ibfk_1` FOREIGN KEY (`NIS`) REFERENCES `siswa` (`NIS`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
