-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 13, 2021 at 08:06 PM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quotesdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `tblcompany`
--

CREATE TABLE `tblcompany` (
  `idCompany` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `address` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `tblCCreate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `tblCUpdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `tblcompany`
--

INSERT INTO `tblcompany` (`idCompany`, `name`, `address`, `tblCCreate`, `tblCUpdate`) VALUES
(1, 'Ventanas Alemanas S.A.', '49 Calle 18-70 Zona 12, Guatemala.', '2021-12-13 18:40:10', '2021-12-13 18:41:35'),
(2, 'Ventanas Mediterraneas S.A.', '49 Calle 18-70 Zona 12, Int. Nivel 2, Guatemala.', '2021-12-13 18:40:43', '2021-12-13 18:40:43');

-- --------------------------------------------------------

--
-- Table structure for table `tblposition`
--

CREATE TABLE `tblposition` (
  `idPosition` int(11) NOT NULL,
  `namePosition` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `tblPCreate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `tblPUpdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `tblposition`
--

INSERT INTO `tblposition` (`idPosition`, `namePosition`, `tblPCreate`, `tblPUpdate`) VALUES
(1, 'Asesor', '2021-12-13 18:42:03', '2021-12-13 18:42:03'),
(2, 'Cotizador', '2021-12-13 18:43:48', '2021-12-13 18:43:48'),
(3, 'Administrador', '2021-12-13 18:47:33', '2021-12-13 18:47:33');

--
-- Triggers `tblposition`
--
DELIMITER $$
CREATE TRIGGER `tblPosition_AFTER_INSERT` AFTER INSERT ON `tblposition` FOR EACH ROW BEGIN
	
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tblPosition_AFTER_UPDATE` AFTER UPDATE ON `tblposition` FOR EACH ROW BEGIN

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tblquote`
--

CREATE TABLE `tblquote` (
  `idQuote` int(11) NOT NULL,
  `numberQuote` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `project` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `squareMeter` float DEFAULT NULL,
  `dateReceived` datetime DEFAULT NULL,
  `dateDelivered` datetime DEFAULT NULL,
  `tblQCreate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `tblQUpdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tblTQuote_idTQuoute` int(11) NOT NULL,
  `tblTMaterial_idTMaterial` int(11) NOT NULL,
  `tblCompany_idCompany` int(11) NOT NULL,
  `tDevelopment_idTDevelopment` int(11) NOT NULL,
  `tblUser_idUser` int(11) NOT NULL,
  `tblUser_tblPosition_idPosition` int(11) NOT NULL,
  `tblStatusQuote_idSQuote` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `tblquote`
--

INSERT INTO `tblquote` (`idQuote`, `numberQuote`, `project`, `squareMeter`, `dateReceived`, `dateDelivered`, `tblQCreate`, `tblQUpdate`, `tblTQuote_idTQuoute`, `tblTMaterial_idTMaterial`, `tblCompany_idCompany`, `tDevelopment_idTDevelopment`, `tblUser_idUser`, `tblUser_tblPosition_idPosition`, `tblStatusQuote_idSQuote`) VALUES
(1, 'B135-1', 'Nehemias Cutzal', 2.54, '2021-12-09 00:00:00', '2021-12-13 00:00:00', '2021-12-13 18:59:43', '2021-12-13 18:59:43', 1, 1, 2, 2, 2, 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `tblstatusquote`
--

CREATE TABLE `tblstatusquote` (
  `idSQuote` int(11) NOT NULL,
  `stDescription` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `tblSQCreate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `tblSQUpdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `tblstatusquote`
--

INSERT INTO `tblstatusquote` (`idSQuote`, `stDescription`, `tblSQCreate`, `tblSQUpdate`) VALUES
(1, 'En Mesa', '2021-12-13 18:48:12', '2021-12-13 18:48:12'),
(2, 'Trabajando', '2021-12-13 18:48:27', '2021-12-13 18:48:27'),
(3, 'Entregado', '2021-12-13 18:48:27', '2021-12-13 18:48:27');

-- --------------------------------------------------------

--
-- Table structure for table `tbltmaterial`
--

CREATE TABLE `tbltmaterial` (
  `idTMaterial` int(11) NOT NULL,
  `mDescription` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `tblTMCreate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `tblTMUpdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `tbltmaterial`
--

INSERT INTO `tbltmaterial` (`idTMaterial`, `mDescription`, `tblTMCreate`, `tblTMUpdate`) VALUES
(1, 'Aluminio Regional', '2021-12-13 18:52:05', '2021-12-13 18:52:05'),
(2, 'Aluminio Chino', '2021-12-13 18:52:15', '2021-12-13 18:52:15'),
(3, 'PVC Aleman', '2021-12-13 18:52:27', '2021-12-13 18:52:27'),
(4, 'PVC Chino', '2021-12-13 18:52:46', '2021-12-13 18:52:46');

-- --------------------------------------------------------

--
-- Table structure for table `tbltquote`
--

CREATE TABLE `tbltquote` (
  `idTQuoute` int(11) NOT NULL,
  `qDescription` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `tblTQCreate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `tblTQUpdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `tbltquote`
--

INSERT INTO `tbltquote` (`idTQuoute`, `qDescription`, `tblTQCreate`, `tblTQUpdate`) VALUES
(1, 'Nuevo', '2021-12-13 18:53:17', '2021-12-13 18:57:49'),
(2, 'Cambio', '2021-12-13 18:53:32', '2021-12-13 18:53:32');

-- --------------------------------------------------------

--
-- Table structure for table `tbluser`
--

CREATE TABLE `tbluser` (
  `idUser` int(11) NOT NULL,
  `firsName` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `lastName` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `email` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `passwrd` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `tblUCreate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `tblPUpdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tblPosition_idPosition` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `tbluser`
--

INSERT INTO `tbluser` (`idUser`, `firsName`, `lastName`, `phone`, `email`, `passwrd`, `tblUCreate`, `tblPUpdate`, `tblPosition_idPosition`) VALUES
(2, 'Elfego Adonias', 'Apen Son', '59755752', 'eapen@ventanasalemanas.com', '123456', '2021-12-13 18:55:07', '2021-12-13 18:55:07', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tdevelopment`
--

CREATE TABLE `tdevelopment` (
  `idTDevelopment` int(11) NOT NULL,
  `tdDescription` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `tblDCreate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `tblDUpdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `tdevelopment`
--

INSERT INTO `tdevelopment` (`idTDevelopment`, `tdDescription`, `tblDCreate`, `tblDUpdate`) VALUES
(1, 'Edificio', '2021-12-13 18:55:50', '2021-12-13 18:55:50'),
(2, 'Casa', '2021-12-13 18:55:57', '2021-12-13 18:55:57'),
(3, 'Condominio', '2021-12-13 18:57:12', '2021-12-13 18:57:12'),
(4, 'Accesorio', '2021-12-13 18:57:20', '2021-12-13 18:57:20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tblcompany`
--
ALTER TABLE `tblcompany`
  ADD PRIMARY KEY (`idCompany`);

--
-- Indexes for table `tblposition`
--
ALTER TABLE `tblposition`
  ADD PRIMARY KEY (`idPosition`);

--
-- Indexes for table `tblquote`
--
ALTER TABLE `tblquote`
  ADD PRIMARY KEY (`idQuote`,`tblTQuote_idTQuoute`,`tblTMaterial_idTMaterial`,`tblCompany_idCompany`,`tDevelopment_idTDevelopment`,`tblUser_idUser`,`tblUser_tblPosition_idPosition`,`tblStatusQuote_idSQuote`),
  ADD KEY `fk_tblQuote_tblTQuote1_idx` (`tblTQuote_idTQuoute`),
  ADD KEY `fk_tblQuote_tblTMaterial1_idx` (`tblTMaterial_idTMaterial`),
  ADD KEY `fk_tblQuote_tblCompany1_idx` (`tblCompany_idCompany`),
  ADD KEY `fk_tblQuote_tDevelopment1_idx` (`tDevelopment_idTDevelopment`),
  ADD KEY `fk_tblQuote_tblUser1_idx` (`tblUser_idUser`,`tblUser_tblPosition_idPosition`),
  ADD KEY `fk_tblQuote_tblStatusQuote1_idx` (`tblStatusQuote_idSQuote`);

--
-- Indexes for table `tblstatusquote`
--
ALTER TABLE `tblstatusquote`
  ADD PRIMARY KEY (`idSQuote`);

--
-- Indexes for table `tbltmaterial`
--
ALTER TABLE `tbltmaterial`
  ADD PRIMARY KEY (`idTMaterial`);

--
-- Indexes for table `tbltquote`
--
ALTER TABLE `tbltquote`
  ADD PRIMARY KEY (`idTQuoute`);

--
-- Indexes for table `tbluser`
--
ALTER TABLE `tbluser`
  ADD PRIMARY KEY (`idUser`,`tblPosition_idPosition`),
  ADD KEY `fk_tblUser_tblPosition_idx` (`tblPosition_idPosition`);

--
-- Indexes for table `tdevelopment`
--
ALTER TABLE `tdevelopment`
  ADD PRIMARY KEY (`idTDevelopment`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tblcompany`
--
ALTER TABLE `tblcompany`
  MODIFY `idCompany` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblposition`
--
ALTER TABLE `tblposition`
  MODIFY `idPosition` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblquote`
--
ALTER TABLE `tblquote`
  MODIFY `idQuote` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblstatusquote`
--
ALTER TABLE `tblstatusquote`
  MODIFY `idSQuote` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbltmaterial`
--
ALTER TABLE `tbltmaterial`
  MODIFY `idTMaterial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbltquote`
--
ALTER TABLE `tbltquote`
  MODIFY `idTQuoute` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbluser`
--
ALTER TABLE `tbluser`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tdevelopment`
--
ALTER TABLE `tdevelopment`
  MODIFY `idTDevelopment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tblquote`
--
ALTER TABLE `tblquote`
  ADD CONSTRAINT `fk_tblQuote_tDevelopment1` FOREIGN KEY (`tDevelopment_idTDevelopment`) REFERENCES `tdevelopment` (`idTDevelopment`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tblQuote_tblCompany1` FOREIGN KEY (`tblCompany_idCompany`) REFERENCES `tblcompany` (`idCompany`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tblQuote_tblStatusQuote1` FOREIGN KEY (`tblStatusQuote_idSQuote`) REFERENCES `tblstatusquote` (`idSQuote`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tblQuote_tblTMaterial1` FOREIGN KEY (`tblTMaterial_idTMaterial`) REFERENCES `tbltmaterial` (`idTMaterial`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tblQuote_tblTQuote1` FOREIGN KEY (`tblTQuote_idTQuoute`) REFERENCES `tbltquote` (`idTQuoute`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tblQuote_tblUser1` FOREIGN KEY (`tblUser_idUser`,`tblUser_tblPosition_idPosition`) REFERENCES `tbluser` (`idUser`, `tblPosition_idPosition`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tbluser`
--
ALTER TABLE `tbluser`
  ADD CONSTRAINT `fk_tblUser_tblPosition` FOREIGN KEY (`tblPosition_idPosition`) REFERENCES `tblposition` (`idPosition`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
