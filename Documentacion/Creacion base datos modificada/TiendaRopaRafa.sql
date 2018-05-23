-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-05-2018 a las 09:16:44
-- Versión del servidor: 10.1.30-MariaDB
-- Versión de PHP: 7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mitienda`
--
CREATE DATABASE IF NOT EXISTS TiendaRopaRafa;
USE TiendaRopaRafa;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fuentePedido`
--

CREATE TABLE `fuentePedido` (
  `codFuentePed` int(11) NOT NULL,
  `descFuentePed` varchar(45) NOT NULL
 
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `fuentePedido`
--

INSERT INTO `fuentePedido` (`codFuentePed`, `descFuentePed`) VALUES
(1, "Web"),
(2, "Facebook"),
(3, "telefónico");


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoPago`
--

CREATE TABLE `tipoPago` (
  `codTipoPago` int(11) NOT NULL,
  `descTipoPago` varchar(45) NOT NULL

) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipoPago`
--

INSERT INTO `tipoPago` (`codTipoPago`, `descTipoPago`) VALUES
(1, "Contra-reembolso"),
(2, "Tarjeta"),
(3, "PayPal");

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadosPedido`
--

CREATE TABLE `estadosPedido` (
  `codEstadoPed` int(11) NOT NULL,
  `descEstadoPed` varchar(45) NOT NULL

) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estadosPedido`
--

INSERT INTO `estadosPedido` (`codEstadoPed`, `descEstadoPed`) VALUES
(1, "En espera"),
(2, "En Proceso"),
(3, "Entregado");

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulos`
--

CREATE TABLE `Articulos` (
  `codArt` int(11) NOT NULL,
  `descArt` varchar(30) NOT NULL,
  `codCatArt` int(11) NOT NULL,
  `precioArt` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `articulos`
--

INSERT INTO `articulos` (`codArt`, `descArt`, `codCatArt`, `precioArt`) VALUES
(1, 'PELELE DE BEBE', 1, 10.5),
(2, 'PANTALON URBAN', 2, 20),
(3, 'CAMISA URBAN', 3, 25.5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `Categorias` (
  `codCat` int(11) NOT NULL,
  `desCat` varchar(45) NOT NULL,
  `codTempCat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `Categorias` (`codCat`, `desCat`, `codTempCat`) VALUES
(1, 'OULET', 1),
(2, 'MILK', 2),
(3, 'URBAN NORTH', 2),
(4, 'CIES', 2),
(5, 'EARLY BIRDS', 2),
(6, 'HIVE', 2),
(7, 'MALPICA', 2),
(8, 'ONS', 2),
(9, 'SALVORA', 2),
(10, 'COMPLEMENTOS', 1);
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `temporadas`
--

CREATE TABLE `Temporadas` (
  `codTemp` int(11) NOT NULL,
  `desTemp` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `temporada`
--

INSERT INTO `Temporadas` (`codTemp`, `desTempdesCat`) VALUES
(1, 'PRIMAVERA'),
(2, 'VERANO'),
(3, 'OTOÑO'),
(4, 'INVIERNO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `Clientes` (
  `codCli` int(11) NOT NULL,
  `dniCli` varchar(9) NOT NULL,
  `nombreCli` varchar(30) NOT NULL,
  `direcCli` varchar(30) NOT NULL,
  `localCli` int(11) NOT NULL,
  `provCli` int(11) NOT NULL,
  `tfnoCli` varchar(9) NOT NULL,
  `emailCli` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `Clientes` (`codCli`, `dniCli`, `nombreCli`, `direcCli`, `localCli`, `provCli`, `tfnoCli`, `emailCli`) VALUES
(1, '36111111A', 'Ana Alvarez', 'calle Paz 21 1ºA', '213', '36', '986111111', 'ana@gmail.com'),
(2, '36222222B', 'Beatriz Barca', 'calle Pez 22 2ºA', '213', '36', '986222222', 'bea@gmail.com'),
(3, '36333333C', 'Carlos Costa', 'calle Cadiz 23 3ºA', '210', '36', '986333333', 'carlos@gmail.com');
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `LineasPedido`
--

CREATE TABLE `LineasPedido` (
  `codLineaPed` int(11) NOT NULL,
  `codPedido` int(11) NOT NULL,
  `codArtLineaPed` int(11) NOT NULL,
  `cantArticulos` int(11) NOT NULL

) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `LineasPedido`
--

INSERT INTO `LineasPedido` (`codLineaPed`, `codPedido`, `codArtLineaPed`, `cantArticulos`) VALUES
(1, 1, 1, 5),
(2, 1, 2, 3),
(3, 1, 2, 3),
(1, 2, 1, 5),
(2, 2, 2, 3),
(3, 2, 2, 3),
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Pedidos`
--

CREATE TABLE `Pedidos` (
  `codPedido` int(11) NOT NULL,
  `codCliPedido` int(11) NOT NULL,
  `fechaPedido` date NOT NULL,
  `codEstadoPed` int(11) NOT NULL,
  `codFuentePed` int(11) NOT NULL,
  `codTipoPagoPed` int(11) NOT NULL,
  `PrecioTotal` double NOT NULL,

) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `Pedidos`
--

INSERT INTO `Pedidos` (`codPedido`, `codCliPedido`, `fechaPedido`, `codEstadoPed`, `codFuentePed`, `codTipoPagoPed`,`PrecioTotal`) VALUES
(1, 1, 1, '2018-04-27', 1, 1, 1, 20.5),
(2, 2, 2, '2018-04-20', 2, 2, 2, 20.5);


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Localidades`
--

CREATE TABLE `Localidades` (
  `codLocal` int(11) NOT NULL,
  `descLocal` varchar(45) NOT NULL

) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `Localidades`
--

INSERT INTO `Localidades` (`codLocal`, `descLocal`) VALUES
(213, "Vigo"),
(210, "otroSitio");

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincias`
--

CREATE TABLE `Provincias` (
  `codProv` int(2) NOT NULL,
  `nombreProv` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `provincias`
--

INSERT INTO `Provincias` (`codProv`, `nombreProv`) VALUES
(1, 'Álava'),
(2, 'Albacete'),
(3, 'Alicante'),
(4, 'Almería'),
(5, 'Ávila'),
(6, 'Badajoz'),
(7, 'Baleares (Illes)'),
(8, 'Barcelona'),
(9, 'Burgos'),
(10, 'Cáceres'),
(11, 'Cádiz'),
(12, 'Castellón'),
(13, 'Ciudad Real'),
(14, 'Córdoba'),
(15, 'A Coruña'),
(16, 'Cuenca'),
(17, 'Girona'),
(18, 'Granada'),
(19, 'Guadalajara'),
(20, 'Guipúzcoa'),
(21, 'Huelva'),
(22, 'Huesca'),
(23, 'Jaén'),
(24, 'León'),
(25, 'Lleida'),
(26, 'La Rioja'),
(27, 'Lugo'),
(28, 'Madrid'),
(29, 'Málaga'),
(30, 'Murcia'),
(31, 'Navarra'),
(32, 'Ourense'),
(33, 'Asturias'),
(34, 'Palencia'),
(35, 'Las Palmas'),
(36, 'Pontevedra'),
(37, 'Salamanca'),
(38, 'Santa Cruz de Tenerife'),
(39, 'Cantabria'),
(40, 'Segovia'),
(41, 'Sevilla'),
(42, 'Soria'),
(43, 'Tarragona'),
(44, 'Teruel'),
(45, 'Toledo'),
(46, 'Valencia'),
(47, 'Valladolid'),
(48, 'Vizcaya'),
(49, 'Zamora'),
(50, 'Zaragoza'),
(51, 'Ceuta'),
(52, 'Melilla');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articulos`
--
ALTER TABLE `articulos`
  ADD PRIMARY KEY (`idArticulo`),
  ADD UNIQUE KEY `idArticulo` (`idArticulo`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`idcategorias`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`idcliente`),
  ADD UNIQUE KEY `idcliente` (`idcliente`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`idPedido`),
  ADD UNIQUE KEY `idPedido` (`idPedido`);

--
-- Indices de la tabla `provincias`
--
ALTER TABLE `provincias`
  ADD PRIMARY KEY (`idprovincias`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
