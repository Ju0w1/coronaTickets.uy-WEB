-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:4306
-- Generation Time: Oct 01, 2021 at 04:17 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `coronaticket`
--

-- --------------------------------------------------------

--
-- Table structure for table `paquetes`
--

CREATE TABLE `paquetes` (
  `paq_id` int(11) NOT NULL,
  `paq_nombre` varchar(250) NOT NULL,
  `paq_descripcion` text DEFAULT NULL,
  `paq_fecha_inicio` date DEFAULT NULL,
  `paq_fecha_fin` date DEFAULT NULL,
  `paq_descuento` double(15,2) DEFAULT NULL,
  `paq_costo` double DEFAULT NULL,
  `paq_fecha_compra` date DEFAULT NULL,
  `paq_fecha_alta` date DEFAULT NULL,
  `paq_vigente` tinyint(1) NOT NULL,
  `paq_imagen` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `paquetes`
--

INSERT INTO `paquetes` (`paq_id`, `paq_nombre`, `paq_descripcion`, `paq_fecha_inicio`, `paq_fecha_fin`, `paq_descuento`, `paq_costo`, `paq_fecha_compra`, `paq_fecha_alta`, `paq_vigente`, `paq_imagen`) VALUES
(2, 'paquete2', 'asd', '2021-02-02', '2021-03-03', 23.00, NULL, NULL, '2021-09-05', 0, NULL),
(3, 'paquete3', 'asdasdas', '2022-11-01', '2021-07-31', 14.00, NULL, NULL, '2021-09-05', 0, NULL),
(4, 'PaqueteNumero1', 'este es el paquete 1', '2021-02-02', '2022-02-03', 20.00, NULL, NULL, '2021-09-08', 0, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `paquetes`
--
ALTER TABLE `paquetes`
  ADD PRIMARY KEY (`paq_id`),
  ADD UNIQUE KEY `paq_nombre` (`paq_nombre`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `paquetes`
--
ALTER TABLE `paquetes`
  MODIFY `paq_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
