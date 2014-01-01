-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Inang: 127.0.0.1
-- Waktu pembuatan: 01 Jan 2014 pada 17.03
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
  `rincian` varchar(255) NOT NULL,
  `tanggal_mulai` date DEFAULT NULL,
  `tanggal_selesai` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `list_anggota_kelompok`
--

CREATE TABLE IF NOT EXISTS `list_anggota_kelompok` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_kelompok` varchar(255) DEFAULT NULL,
  `id_anggota` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
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
  PRIMARY KEY (`id`)
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
  PRIMARY KEY (`id_kelompok`)
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `list_kontak_mentor`
--

CREATE TABLE IF NOT EXISTS `list_kontak_mentor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_mentor` varchar(255) NOT NULL,
  `id_tipe_kontak` varchar(255) DEFAULT NULL,
  `rincian` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `list_mentor`
--

CREATE TABLE IF NOT EXISTS `list_mentor` (
  `id_mentor` varchar(255) NOT NULL,
  `nama_mentor` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_mentor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `list_profil`
--

CREATE TABLE IF NOT EXISTS `list_profil` (
  `nama_lengkap` varchar(255) NOT NULL,
  `nama_panggilan` varchar(255) DEFAULT NULL,
  `asal_daerah` varchar(255) DEFAULT NULL,
  `alamat_asal` varchar(255) DEFAULT NULL,
  `alamat_bandung` varchar(255) DEFAULT NULL,
  `nim` varchar(255) NOT NULL,
  `id_anggota` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  PRIMARY KEY (`id_anggota`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `list_tipe_kelompok`
--

CREATE TABLE IF NOT EXISTS `list_tipe_kelompok` (
  `id_kelompok` varchar(255) NOT NULL,
  `jenis_kelompok` varchar(255) NOT NULL,
  `deskripsi` text,
  PRIMARY KEY (`id_kelompok`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
