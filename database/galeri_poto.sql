-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 21 Mar 2024 pada 07.35
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `galeri_poto`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `album`
--

CREATE TABLE `album` (
  `AlbumID` int(11) NOT NULL,
  `NamaAlbum` varchar(255) NOT NULL,
  `Deskripsi` text NOT NULL,
  `TanggalDibuat` date NOT NULL,
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `album`
--

INSERT INTO `album` (`AlbumID`, `NamaAlbum`, `Deskripsi`, `TanggalDibuat`, `UserID`) VALUES
(3, 'Bunga', 'Bunga Indah', '2024-02-14', 1),
(4, 'Teknologi', 'Kereta Cepat', '2024-02-14', 1),
(5, 'Hewan', 'Herbivora', '2024-02-14', 1),
(6, 'Batik', 'Batik Indonesia', '2024-03-17', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `foto`
--

CREATE TABLE `foto` (
  `FotoID` int(11) NOT NULL,
  `JudulFoto` varchar(255) NOT NULL,
  `DeskripsiFoto` text NOT NULL,
  `TanggalUnggah` date NOT NULL,
  `NamaFile` varchar(255) NOT NULL,
  `AlbumID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `foto`
--

INSERT INTO `foto` (`FotoID`, `JudulFoto`, `DeskripsiFoto`, `TanggalUnggah`, `NamaFile`, `AlbumID`, `UserID`) VALUES
(1, 'Bunga Mawar Putih', 'Bunga Mawar Putih Mawar putih adalah simbol kemurnian dan kedamaian. Mereka mengekspresikan perasaan tulus dan suci. Selain itu, mawar putih juga digunakan sebagai lambang simpati dalam situasi duka cita.', '2024-03-17', 'mawarputih.jpeg', 3, 1),
(2, 'Kereta Cepat', 'Kereta Cepat adalah transportasi rel yang menggunakan kereta api yang jauh lebih cepat daripada kereta api tradisional, menggunakan sistem terintegrasi dari bakal pelanting khusus dan jalur khusus. Meskipun tidak ada standar tunggal yang berlaku di seluruh dunia, kereta kecepatan tinggi biasanya memiliki kecepatan di atas 250 km/jam, atau kereta biasa yang ditingkatkan dengan kecepatan lebih dari 200 km/jam secara luas juga dianggap sebagai kereta kecepatan tinggi.', '2024-02-14', 'keretacepat.jpeg', 4, 1),
(3, 'Jerapah', 'Jerapah atau zarafah adalah mamalia berkuku genap endemik Afrika dan merupakan spesies hewan tertinggi yang hidup di darat. Jerapah jantan dapat mencapai tinggi 4,8 sampai 5,5 meter dan memiliki berat yang dapat mencapai 1.360 kilogram. Jerapah betina biasanya sedikit lebih pendek dan lebih ringan.', '2024-02-14', 'jerapah.jpg', 5, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `komentar`
--

CREATE TABLE `komentar` (
  `KomentarID` int(11) NOT NULL,
  `FotoID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `IsiKomentar` text NOT NULL,
  `TanggalKomentar` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `komentar`
--

INSERT INTO `komentar` (`KomentarID`, `FotoID`, `UserID`, `IsiKomentar`, `TanggalKomentar`) VALUES
(3, 1, 1, 'bagus banget', '2024-02-29');

-- --------------------------------------------------------

--
-- Struktur dari tabel `likefoto`
--

CREATE TABLE `likefoto` (
  `LikeID` int(11) NOT NULL,
  `FotoID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `TanggalLike` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `UserID` int(11) NOT NULL,
  `Username` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `NamaLengkap` varchar(255) NOT NULL,
  `Alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`UserID`, `Username`, `Password`, `Email`, `NamaLengkap`, `Alamat`) VALUES
(1, 'Nabila Afriza', '4124bc0a9335c27f086f24ba207a4912', 'nabilaafriza@gmail.com', 'Nabila Afriza', 'Jl. Klambir V Gang Amal '),
(2, 'Amanda Harun', '4124bc0a9335c27f086f24ba207a4912', 'amanda@gmail.com', 'Amanda Harun', 'Jl. Binjai Ampera II');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`AlbumID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indeks untuk tabel `foto`
--
ALTER TABLE `foto`
  ADD PRIMARY KEY (`FotoID`),
  ADD KEY `AlbumID` (`AlbumID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indeks untuk tabel `komentar`
--
ALTER TABLE `komentar`
  ADD PRIMARY KEY (`KomentarID`),
  ADD KEY `FotoID` (`FotoID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indeks untuk tabel `likefoto`
--
ALTER TABLE `likefoto`
  ADD PRIMARY KEY (`LikeID`),
  ADD KEY `FotoID` (`FotoID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserID`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `album`
--
ALTER TABLE `album`
  MODIFY `AlbumID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `foto`
--
ALTER TABLE `foto`
  MODIFY `FotoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `komentar`
--
ALTER TABLE `komentar`
  MODIFY `KomentarID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT untuk tabel `likefoto`
--
ALTER TABLE `likefoto`
  MODIFY `LikeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=210;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `album`
--
ALTER TABLE `album`
  ADD CONSTRAINT `album_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `foto`
--
ALTER TABLE `foto`
  ADD CONSTRAINT `foto_ibfk_1` FOREIGN KEY (`AlbumID`) REFERENCES `album` (`AlbumID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `foto_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `komentar`
--
ALTER TABLE `komentar`
  ADD CONSTRAINT `komentar_ibfk_1` FOREIGN KEY (`FotoID`) REFERENCES `foto` (`FotoID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `komentar_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `likefoto`
--
ALTER TABLE `likefoto`
  ADD CONSTRAINT `likefoto_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `likefoto_ibfk_2` FOREIGN KEY (`FotoID`) REFERENCES `foto` (`FotoID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
