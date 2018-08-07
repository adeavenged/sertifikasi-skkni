-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.19-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Version:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table db_sertifikat_skkni.tb_hasil_sertifikasi
CREATE TABLE IF NOT EXISTS `tb_hasil_sertifikasi` (
  `id_trans` int(5) NOT NULL AUTO_INCREMENT,
  `assor` varchar(50) NOT NULL DEFAULT '0',
  `tgl_terbit_sk` date DEFAULT NULL,
  `status_rekomendasi` enum('KOMPETEN','BELUM KOMPETEN') NOT NULL,
  PRIMARY KEY (`id_trans`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table db_sertifikat_skkni.tb_hasil_sertifikasi: ~0 rows (approximately)
DELETE FROM `tb_hasil_sertifikasi`;
/*!40000 ALTER TABLE `tb_hasil_sertifikasi` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_hasil_sertifikasi` ENABLE KEYS */;

-- Dumping structure for table db_sertifikat_skkni.tb_lokasi
CREATE TABLE IF NOT EXISTS `tb_lokasi` (
  `id_lok` int(11) NOT NULL AUTO_INCREMENT,
  `tuk` varchar(50) NOT NULL,
  PRIMARY KEY (`id_lok`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

-- Dumping data for table db_sertifikat_skkni.tb_lokasi: ~10 rows (approximately)
DELETE FROM `tb_lokasi`;
/*!40000 ALTER TABLE `tb_lokasi` DISABLE KEYS */;
INSERT INTO `tb_lokasi` (`id_lok`, `tuk`) VALUES
	(11, 'LOKASI 1'),
	(12, 'LOKASI 2'),
	(13, 'LOKASI 3'),
	(14, 'LOKASI 4'),
	(15, 'LOKASI 5'),
	(16, 'LOKASI 6'),
	(17, 'LOKASI 7'),
	(18, 'LOKASI 8'),
	(19, 'LOKASI 9'),
	(20, 'LOKASI 10');
/*!40000 ALTER TABLE `tb_lokasi` ENABLE KEYS */;

-- Dumping structure for table db_sertifikat_skkni.tb_peserta
CREATE TABLE IF NOT EXISTS `tb_peserta` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nik` varchar(50) NOT NULL,
  `id_skema` int(5) NOT NULL,
  `id_lokasi` int(5) NOT NULL,
  `nama` varchar(200) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `hp` varchar(12) NOT NULL,
  `email` varchar(100) NOT NULL,
  `organisasi` text NOT NULL,
  `rekomendasi` enum('BERKOMPETENSI','BELUM BERKOMPETENSI') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tb_peserta_tb_skema` (`id_skema`),
  KEY `FK_tb_peserta_tb_lokasi` (`id_lokasi`),
  CONSTRAINT `FK_tb_peserta_tb_lokasi` FOREIGN KEY (`id_lokasi`) REFERENCES `tb_lokasi` (`id_lok`),
  CONSTRAINT `FK_tb_peserta_tb_skema` FOREIGN KEY (`id_skema`) REFERENCES `tb_skema` (`id_skema`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table db_sertifikat_skkni.tb_peserta: ~0 rows (approximately)
DELETE FROM `tb_peserta`;
/*!40000 ALTER TABLE `tb_peserta` DISABLE KEYS */;
INSERT INTO `tb_peserta` (`id`, `nik`, `id_skema`, `id_lokasi`, `nama`, `tgl_lahir`, `hp`, `email`, `organisasi`, `rekomendasi`) VALUES
	(2, '1', 1, 11, 'PESERTA 1', '1993-07-07', '085227281672', 'peserta1@gmail.com', 'KAMPUS 1', 'BERKOMPETENSI');
/*!40000 ALTER TABLE `tb_peserta` ENABLE KEYS */;

-- Dumping structure for table db_sertifikat_skkni.tb_skema
CREATE TABLE IF NOT EXISTS `tb_skema` (
  `id_skema` int(5) NOT NULL AUTO_INCREMENT,
  `nama_skema` varchar(100) NOT NULL,
  `ket` text NOT NULL,
  PRIMARY KEY (`id_skema`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- Dumping data for table db_sertifikat_skkni.tb_skema: ~10 rows (approximately)
DELETE FROM `tb_skema`;
/*!40000 ALTER TABLE `tb_skema` DISABLE KEYS */;
INSERT INTO `tb_skema` (`id_skema`, `nama_skema`, `ket`) VALUES
	(1, 'SKEMA 1', '-'),
	(2, 'SKEMA 2', '-'),
	(3, 'SKEMA 3', '-'),
	(4, 'SKEMA 4', '-'),
	(5, 'SKEMA 5', '-'),
	(6, 'SKEMA 6', '-'),
	(7, 'SKEMA 7', '-'),
	(8, 'SKEMA 8', '-'),
	(9, 'SKEMA 9', '-'),
	(10, 'SKEMA 10', '-');
/*!40000 ALTER TABLE `tb_skema` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
