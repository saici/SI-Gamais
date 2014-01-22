SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";
CREATE DATABASE IF NOT EXISTS `db_si_gamais` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `db_si_gamais`;


-- 
-- Structure for table `list_profil_anggota`
-- 

CREATE TABLE IF NOT EXISTS `list_profil_anggota` (
  `nama_lengkap` varchar(255) NOT NULL,
  `nama_panggilan` varchar(255) DEFAULT NULL,
  `asal_daerah` varchar(255) DEFAULT NULL,
  `alamat_asal` varchar(255) DEFAULT NULL,
  `alamat_bandung` varchar(255) DEFAULT NULL,
  `nim` varchar(255) NOT NULL,
  `id_anggota` int(11) NOT NULL AUTO_INCREMENT,
  `password_hash` varchar(255) NOT NULL,
  `role` int(11) NOT NULL DEFAULT '0' COMMENT '0 - anggota, 1 - admin, 2 - mentor',
  PRIMARY KEY (`id_anggota`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- 
-- Data for table `list_profil_anggota`
-- 

INSERT INTO `list_profil_anggota` (`nama_lengkap`, `nama_panggilan`, `asal_daerah`, `alamat_asal`, `alamat_bandung`, `nim`, `id_anggota`, `password_hash`, `role`) VALUES
  ('User 1', 'User 1 ', 'Daerah 1', 'Bandung 1', 'Bandung 1', '10111001', '1', '098f6bcd4621d373cade4e832627b4f6', '0'),
  ('User 2', 'User 2 ', 'Daerah 2', 'Bandung 2', 'Bandung 1', '10111001', '2', '098f6bcd4621d373cade4e832627b4f6', '0'),
  ('User 3', 'User 3 ', 'Daerah 3', 'Bandung 3', 'Bandung 1', '10111001', '3', '098f6bcd4621d373cade4e832627b4f6', '0'),
  ('User 4', 'User 4 ', 'Daerah 4', 'Bandung 4', 'Bandung 1', '10111001', '4', '098f6bcd4621d373cade4e832627b4f6', '0'),
  ('User 5', 'User 5 ', 'Daerah 5', 'Bandung 5', 'Bandung 1', '10111001', '5', '098f6bcd4621d373cade4e832627b4f6', '0'),
  ('User 6', 'User 6 ', 'Daerah 6', 'Bandung 6', 'Bandung 1', '10111001', '6', '098f6bcd4621d373cade4e832627b4f6', '0'),
  ('User 7', 'User 7 ', 'Daerah 7', 'Bandung 7', 'Bandung 1', '10111001', '7', '098f6bcd4621d373cade4e832627b4f6', '0'),
  ('User 8', 'User 8 ', 'Daerah 8', 'Bandung 8', 'Bandung 1', '10111001', '8', '098f6bcd4621d373cade4e832627b4f6', '0'),
  ('User 9', 'User 9 ', 'Daerah 9', 'Bandung 9', 'Bandung 1', '10111001', '9', '098f6bcd4621d373cade4e832627b4f6', '0');
-- 
-- Structure for table `list_amanah_anggota`
-- 

CREATE TABLE IF NOT EXISTS `list_amanah_anggota` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_anggota` int(11) NOT NULL,
  `rincian` varchar(255) DEFAULT NULL,
  `tanggal_mulai` date DEFAULT NULL,
  `tanggal_selesai` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_anggota` (`id_anggota`),
  CONSTRAINT `fk_profil_amanah` FOREIGN KEY (`id_anggota`) REFERENCES `list_profil_anggota` (`id_anggota`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- 
-- Data for table `list_amanah_anggota`
-- 

INSERT INTO `list_amanah_anggota` (`id`, `id_anggota`, `rincian`, `tanggal_mulai`, `tanggal_selesai`) VALUES
  ('1', '1', 'Panitia Simfoni', '2014-01-01', '2014-02-06');


-- 
-- Structure for table `list_kontak_anggota`
-- 

CREATE TABLE IF NOT EXISTS `list_kontak_anggota` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_anggota` int(11) NOT NULL,
  `id_tipe_kontak` int(11) DEFAULT NULL,
  `rincian` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_anggota` (`id_anggota`),
  CONSTRAINT `fk_profil_kontak` FOREIGN KEY (`id_anggota`) REFERENCES `list_profil_anggota` (`id_anggota`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- 
-- Structure for table `list_tipe_kelompok`
-- 

CREATE TABLE IF NOT EXISTS `list_tipe_kelompok` (
  `id_tipe_kelompok` int(11) NOT NULL AUTO_INCREMENT,
  `jenis_kelompok` varchar(255) NOT NULL,
  `deskripsi` text,
  PRIMARY KEY (`id_tipe_kelompok`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- 
-- Data for table `list_tipe_kelompok`
-- 

INSERT INTO `list_tipe_kelompok` (`id_tipe_kelompok`, `jenis_kelompok`, `deskripsi`) VALUES
  ('1', 'Mentoring BKM', NULL),
  ('2', 'Mentoring BM', NULL);
-- 

-- 
-- Structure for table `list_kelompok`
-- 

CREATE TABLE IF NOT EXISTS `list_kelompok` (
  `id_kelompok` int(11) NOT NULL AUTO_INCREMENT,
  `nama_kelompok` varchar(255) DEFAULT NULL,
  `id_mentor` int(11) DEFAULT NULL,
  `id_tipe_kelompok` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_kelompok`),
  KEY `id_mentor` (`id_mentor`),
  KEY `id_tipe_kelompok` (`id_tipe_kelompok`),
  CONSTRAINT `fk_profil_mentor` FOREIGN KEY (`id_mentor`) REFERENCES `list_profil_anggota` (`id_anggota`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tipe_kelompok_kelompok` FOREIGN KEY (`id_tipe_kelompok`) REFERENCES `list_tipe_kelompok` (`id_tipe_kelompok`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- 
-- Data for table `list_kelompok`
-- 

INSERT INTO `list_kelompok` (`id_kelompok`, `nama_kelompok`, `id_mentor`, `id_tipe_kelompok`) VALUES
  ('1', 'Kelompok 1 ABit', '1', '1'),
  ('2', 'Mentoring BM #3', '5', '2');
-- Structure for table `list_anggota_kelompok`
-- 

CREATE TABLE IF NOT EXISTS `list_anggota_kelompok` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_kelompok` int(11) DEFAULT NULL,
  `id_anggota` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_anggota` (`id_anggota`),
  KEY `id_kelompok` (`id_kelompok`),
  CONSTRAINT `fk_kelompok_asal` FOREIGN KEY (`id_kelompok`) REFERENCES `list_kelompok` (`id_kelompok`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_profil_anggota_kelompok` FOREIGN KEY (`id_anggota`) REFERENCES `list_profil_anggota` (`id_anggota`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- 
-- Data for table `list_anggota_kelompok`
-- 

INSERT INTO `list_anggota_kelompok` (`id`, `id_kelompok`, `id_anggota`) VALUES
  ('2', '1', '2'),
  ('3', '1', '3'),
  ('4', '1', '4'),
  ('5', '2', '6'),
  ('6', '2', '7'),
  ('7', '2', '8'),
  ('8', '2', '9');


-- 
-- Structure for table `list_event`
-- 

CREATE TABLE IF NOT EXISTS `list_event` (
  `id_event` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `id_pj` int(11) NOT NULL,
  `id_tipe_event` int(11) NOT NULL,
  `keterangan` text DEFAULT NULL,
  PRIMARY KEY (`id_event`),
  KEY `fk_id_pj` (`id_pj`),
  CONSTRAINT `fk_id_pj` FOREIGN KEY (`id_pj`) REFERENCES `list_profil_anggota` (`id_anggota`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Data for table `list_event`
-- 

INSERT INTO `list_event` (`id_event`, `nama`, `tanggal`, `id_pj`, `keterangan`, `id_tipe_event`) VALUES
  ('1', 'Mentoring BKM 1', '2014-01-08', '1', NULL, NULL),
  ('2', 'Simfoni day 2', '2014-01-03', '1', NULL, NULL);

-- 
-- Structure for table `list_kehadiran`
-- 

-- --------------------------------------------------------

--
-- Table structure for table `list_kehadiran`
--

CREATE TABLE IF NOT EXISTS `list_kehadiran` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_event` int(11) NOT NULL,
  `id_anggota` int(11) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `id_status` int(11) DEFAULT NULL COMMENT 'hadir/sakit/izin/alfa',
  `keterangan` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_anggota` (`id_anggota`),
  KEY `id_event` (`id_event`),
  CONSTRAINT `fk_event_kehadiran` FOREIGN KEY (`id_event`) REFERENCES `list_event` (`id_event`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_profil_kehadiran` FOREIGN KEY (`id_anggota`) REFERENCES `list_profil_anggota` (`id_anggota`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- -------------------------------------------------------

-- 
-- Data for table `list_kehadiran`
-- 

INSERT INTO `list_kehadiran` (`id`, `id_event`, `id_anggota`, `tanggal`, `id_status`) VALUES
  ('2', '2', '2', '2014-01-01', '1'),
  ('3', '2', '3', '2014-01-01', '1'),
  ('4', '2', '4', '2014-01-01', '0'),
  ('5', '2', '6', '2014-01-01', '2'),
  ('6', '2', '7', '2014-01-01', '3'),
  ('7', '2', '8', '2014-01-01', '2'),
  ('8', '2', '9', '2014-01-01', '1');

--
-- Table structure for table `list_pertemuan_mentoring`
--

CREATE TABLE IF NOT EXISTS `list_pertemuan_mentoring` (
  `id_pertemuan` int(11) NOT NULL AUTO_INCREMENT,
  `tanggal` date DEFAULT NULL,
  `id_kelompok` int(11) NOT NULL,
  `tempat` varchar(255) DEFAULT NULL,
  `materi` varchar(255) DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  PRIMARY KEY (`id_pertemuan`),
  KEY `id_kelompok` (`id_kelompok`),
  CONSTRAINT `fk_id_kelompok` FOREIGN KEY (`id_kelompok`) REFERENCES `list_kelompok` (`id_kelompok`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;


INSERT INTO `list_pertemuan_mentoring` VALUES 
  ('1', '2014-01-11', '1', NULL, NULL, NULL);
--
-- Table structure for table `list_kehadiran_mentoring`
--

CREATE TABLE IF NOT EXISTS `list_kehadiran_mentoring` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pertemuan` int(11) NOT NULL,
  `id_anggota` int(11) NOT NULL,
  `id_status` int(11) DEFAULT NULL COMMENT 'hadir/sakit/izin/alfa',
  `keterangan` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_anggota` (`id_anggota`),
  KEY `id_pertemuan` (`id_pertemuan`),
  CONSTRAINT `fk_profil_kehadiran_mentoring` FOREIGN KEY (`id_anggota`) REFERENCES `list_profil_anggota` (`id_anggota`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_pertemuan` FOREIGN KEY (`id_pertemuan`) REFERENCES `list_pertemuan_mentoring` (`id_pertemuan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

INSERT INTO `list_kehadiran_mentoring` VALUES
  ('2', '1', '2', '1', NULL),
  ('3', '1', '3', '1', NULL),
  ('4', '1', '4', '0', NULL),
  ('5', '1', '6', '2', NULL),
  ('6', '1', '7', '3', NULL),
  ('7', '1', '8', '2', NULL),
  ('8', '1', '9', '1', NULL);
