-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Inang: 127.0.0.1
-- Waktu pembuatan: 02 Jan 2014 pada 01.44
-- Versi Server: 5.6.11
-- Versi PHP: 5.5.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Basis data: `db_si_gamais`
--
CREATE DATABASE IF NOT EXISTS `db_si_gamais` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `db_si_gamais`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `list_amanah_anggota`
--

CREATE TABLE IF NOT EXISTS `list_amanah_anggota` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_anggota` varchar(255) NOT NULL,
  `rincian` varchar(255) DEFAULT NULL,
  `tanggal_mulai` date DEFAULT NULL,
  `tanggal_selesai` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_anggota` (`id_anggota`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `list_anggota_kelompok`
--

CREATE TABLE IF NOT EXISTS `list_anggota_kelompok` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_kelompok` varchar(255) DEFAULT NULL,
  `id_anggota` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_anggota` (`id_anggota`),
  KEY `id_kelompok` (`id_kelompok`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `list_event`
--

CREATE TABLE IF NOT EXISTS `list_event` (
  `id_event` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  PRIMARY KEY (`id_event`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `list_kehadiran`
--

CREATE TABLE IF NOT EXISTS `list_kehadiran` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_event` varchar(255) NOT NULL,
  `id_anggota` varchar(255) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `id_status` varchar(255) DEFAULT NULL COMMENT 'hadir/sakit/izin/alfa',
  PRIMARY KEY (`id`),
  KEY `id_anggota` (`id_anggota`),
  KEY `id_event` (`id_event`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `list_kelompok`
--

CREATE TABLE IF NOT EXISTS `list_kelompok` (
  `id_kelompok` varchar(255) NOT NULL,
  `nama_kelompok` varchar(255) DEFAULT NULL,
  `id_mentor` varchar(255) DEFAULT NULL,
  `id_tipe_kelompok` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_kelompok`),
  KEY `id_mentor` (`id_mentor`),
  KEY `id_tipe_kelompok` (`id_tipe_kelompok`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `list_kontak_anggota`
--

CREATE TABLE IF NOT EXISTS `list_kontak_anggota` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_anggota` varchar(255) NOT NULL,
  `id_tipe_kontak` varchar(255) DEFAULT NULL,
  `rincian` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_anggota` (`id_anggota`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `list_profil_anggota`
--

CREATE TABLE IF NOT EXISTS `list_profil_anggota` (
  `nama_lengkap` varchar(255) NOT NULL,
  `nama_panggilan` varchar(255) DEFAULT NULL,
  `asal_daerah` varchar(255) DEFAULT NULL,
  `alamat_asal` varchar(255) DEFAULT NULL,
  `alamat_bandung` varchar(255) DEFAULT NULL,
  `nim` varchar(255) NOT NULL,
  `id_anggota` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` int(11) NOT NULL DEFAULT '0' COMMENT '0 - anggota, 1 - admin, 2 - mentor',
  PRIMARY KEY (`id_anggota`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `list_tipe_kelompok`
--

CREATE TABLE IF NOT EXISTS `list_tipe_kelompok` (
  `id_tipe_kelompok` varchar(255) NOT NULL,
  `jenis_kelompok` varchar(255) NOT NULL,
  `deskripsi` text,
  PRIMARY KEY (`id_tipe_kelompok`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `list_event`
--
ALTER TABLE `list_event`
  ADD CONSTRAINT `fk_event_kehadiran` FOREIGN KEY (`id_event`) REFERENCES `list_kehadiran` (`id_event`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `list_kelompok`
--
ALTER TABLE `list_kelompok`
  ADD CONSTRAINT `fk_kelompok_anggota_kelompok` FOREIGN KEY (`id_kelompok`) REFERENCES `list_anggota_kelompok` (`id_kelompok`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `list_profil_anggota`
--
ALTER TABLE `list_profil_anggota`
  ADD CONSTRAINT `fk_profil_kelompok` FOREIGN KEY (`id_anggota`) REFERENCES `list_kelompok` (`id_mentor`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_profil_amanah` FOREIGN KEY (`id_anggota`) REFERENCES `list_amanah_anggota` (`id_anggota`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_profil_anggota_kelompok` FOREIGN KEY (`id_anggota`) REFERENCES `list_anggota_kelompok` (`id_anggota`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_profil_kehadiran` FOREIGN KEY (`id_anggota`) REFERENCES `list_kehadiran` (`id_anggota`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_profil_kontak` FOREIGN KEY (`id_anggota`) REFERENCES `list_kontak_anggota` (`id_anggota`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `list_tipe_kelompok`
--
ALTER TABLE `list_tipe_kelompok`
  ADD CONSTRAINT `fk_tipe_kelompok_kelompok` FOREIGN KEY (`id_tipe_kelompok`) REFERENCES `list_kelompok` (`id_tipe_kelompok`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
