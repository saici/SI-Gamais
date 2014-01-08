-- 
-- Structure for table `list_amanah_anggota`
-- 

DROP TABLE IF EXISTS `list_amanah_anggota`;
CREATE TABLE IF NOT EXISTS `list_amanah_anggota` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_anggota` varchar(255) NOT NULL,
  `rincian` varchar(255) DEFAULT NULL,
  `tanggal_mulai` date DEFAULT NULL,
  `tanggal_selesai` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_anggota` (`id_anggota`),
  CONSTRAINT `list_amanah_anggota_ibfk_1` FOREIGN KEY (`id_anggota`) REFERENCES `list_profil_anggota` (`id_anggota`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 
-- Structure for table `list_anggota_kelompok`
-- 

DROP TABLE IF EXISTS `list_anggota_kelompok`;
CREATE TABLE IF NOT EXISTS `list_anggota_kelompok` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_kelompok` varchar(255) DEFAULT NULL,
  `id_anggota` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_anggota` (`id_anggota`),
  KEY `id_kelompok` (`id_kelompok`),
  CONSTRAINT `list_anggota_kelompok_ibfk_1` FOREIGN KEY (`id_anggota`) REFERENCES `list_profil_anggota` (`id_anggota`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `list_anggota_kelompok_ibfk_2` FOREIGN KEY (`id_kelompok`) REFERENCES `list_kelompok` (`id_kelompok`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 
-- Structure for table `list_event`
-- 

DROP TABLE IF EXISTS `list_event`;
CREATE TABLE IF NOT EXISTS `list_event` (
  `id_event` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `tanggal` date NOT NULL,
  `id_pj` varchar(255) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id_event`),
  KEY `id_pj` (`id_pj`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 
-- Structure for table `list_kehadiran`
-- 

DROP TABLE IF EXISTS `list_kehadiran`;
CREATE TABLE IF NOT EXISTS `list_kehadiran` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_event` varchar(255) NOT NULL,
  `id_anggota` varchar(255) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `id_status` varchar(255) DEFAULT NULL COMMENT 'hadir/sakit/izin/alfa',
  PRIMARY KEY (`id`),
  KEY `id_anggota` (`id_anggota`),
  KEY `id_event` (`id_event`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- 
-- Data for table `list_kehadiran`
-- 

INSERT INTO `list_kehadiran` (`id`, `id_event`, `id_anggota`, `tanggal`, `id_status`) VALUES
  ('1', '1', '1', '2014-01-01', '1');

-- 
-- Structure for table `list_kelompok`
-- 

DROP TABLE IF EXISTS `list_kelompok`;
CREATE TABLE IF NOT EXISTS `list_kelompok` (
  `id_kelompok` varchar(255) NOT NULL,
  `nama_kelompok` varchar(255) DEFAULT NULL,
  `id_mentor` varchar(255) DEFAULT NULL,
  `id_tipe_kelompok` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_kelompok`),
  KEY `id_mentor` (`id_mentor`),
  KEY `id_tipe_kelompok` (`id_tipe_kelompok`),
  CONSTRAINT `list_kelompok_ibfk_2` FOREIGN KEY (`id_mentor`) REFERENCES `list_profil_anggota` (`id_anggota`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_kelompok_anggota_kelompok` FOREIGN KEY (`id_kelompok`) REFERENCES `list_anggota_kelompok` (`id_kelompok`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `list_kelompok_ibfk_1` FOREIGN KEY (`id_tipe_kelompok`) REFERENCES `list_tipe_kelompok` (`id_tipe_kelompok`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 
-- Structure for table `list_kontak_anggota`
-- 

DROP TABLE IF EXISTS `list_kontak_anggota`;
CREATE TABLE IF NOT EXISTS `list_kontak_anggota` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_anggota` varchar(255) NOT NULL,
  `id_tipe_kontak` varchar(255) DEFAULT NULL,
  `rincian` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_anggota` (`id_anggota`),
  CONSTRAINT `list_kontak_anggota_ibfk_1` FOREIGN KEY (`id_anggota`) REFERENCES `list_profil_anggota` (`id_anggota`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 
-- Structure for table `list_profil_anggota`
-- 

DROP TABLE IF EXISTS `list_profil_anggota`;
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

-- 
-- Structure for table `list_tipe_kelompok`
-- 

DROP TABLE IF EXISTS `list_tipe_kelompok`;
CREATE TABLE IF NOT EXISTS `list_tipe_kelompok` (
  `id_tipe_kelompok` varchar(255) NOT NULL,
  `jenis_kelompok` varchar(255) NOT NULL,
  `deskripsi` text,
  PRIMARY KEY (`id_tipe_kelompok`),
  CONSTRAINT `fk_tipe_kelompok_kelompok` FOREIGN KEY (`id_tipe_kelompok`) REFERENCES `list_kelompok` (`id_tipe_kelompok`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

