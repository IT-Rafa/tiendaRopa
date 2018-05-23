

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

-- ****************************************
-- *** Crear basedatos: TiendaRopaRafa  ***
-- ****************************************

CREATE DATABASE IF NOT EXISTS TiendaRopaRafa;
USE TiendaRopaRafa;

-- --------------------------------------------------------

-- *********************************
-- *** Crear tabla: FuentesPedido ***
-- *********************************

CREATE TABLE `FuentesPedido` (
  `codFuentePed` int(11) NOT NULL,
  `descFuentePed` varchar(45) NOT NULL,

  Primary Key (codFuentePed)
  
  )ENGINE=InnoDB DEFAULT CHARSET=latin1;
 

-- *********************************
-- *** Crear tabla: TiposPago *******
-- *********************************

CREATE TABLE `TiposPago` (
  `codTipoPago` int(11) NOT NULL,
  `descTipoPago` varchar(45) NOT NULL,

  Primary Key (codTipoPago)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- **************************************
-- *** Crear tabla: EstadosPedido *******
-- **************************************

CREATE TABLE `EstadosPedido` (
  `codEstadoPed` int(11) NOT NULL,
  `descEstadoPed` varchar(45) NOT NULL,

  Primary Key (codEstadoPed)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- **************************************
-- *** Crear tabla: Temporadas **********
-- **************************************

CREATE TABLE `Temporadas` (
  `codTemp` int(11) NOT NULL,
  `descTemp` varchar(45) NOT NULL,

  Primary Key (codTemp)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- **************************************
-- *** Crear tabla: Provincias *********
-- **************************************

CREATE TABLE `Provincias` (
  `codProv` int(2) NOT NULL,
  `nombreProv` varchar(45) DEFAULT NULL,

  Primary Key (codProv)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- **************************************
-- *** Crear tabla: Localidades *********
-- **************************************

CREATE TABLE `Localidades` (
  `codLocal` int(11) NOT NULL,
  `descLocal` varchar(45) NOT NULL,

  Primary Key (codLocal)
  
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- --------------------------------------------------------

-- **************************************
-- *** Crear tabla: Categorias **********
-- **************************************

CREATE TABLE `Categorias` (
  `codCat` int(11) NOT NULL,
  `desCat` varchar(45) NOT NULL,
  `codTempCat` int(11) NOT NULL,

  Primary Key (codCat),
  foreign key (codTempCat) references Temporadas(codTemp)
  
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- **************************************
-- *** Crear tabla: Clientes   **********
-- **************************************

CREATE TABLE `Clientes` (
  `codCli` int(11) NOT NULL,
  `dniCli` varchar(9) NOT NULL,
  `nombreCli` varchar(30) NOT NULL,
  `direcCli` varchar(30) NOT NULL,
  `codLocalCli` int(11) NOT NULL,
  `codProvCli` int(11) NOT NULL,
  `tfnoCli` varchar(9) NOT NULL,
  `emailCli` varchar(30) NOT NULL,

  Primary Key (codCli),
  foreign key (codLocalCli) references Localidades(codLocal),
  foreign key (codProvCli) references Provincias(codProv)

) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- **************************************
-- *** Crear tabla: Articulos ***********
-- **************************************

CREATE TABLE `Articulos` (
  `codArt` int(11) NOT NULL,
  `descArt` varchar(30) NOT NULL,
  `codCatArt` int(11) NOT NULL,
  `precioArt` double NOT NULL,

  Primary Key (codArt),
  foreign key (codCatArt) references Categorias(codCat)
  
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- **************************************
-- *** Crear tabla: Pedidos *************
-- **************************************

CREATE TABLE `Pedidos` (
  `codPedido` int(11) NOT NULL,
  `codCliPedido` int(11) NOT NULL,
  `fechaPedido` date NOT NULL,
  `codEstadoPed` int(11) NOT NULL,
  `codFuentePed` int(11) NOT NULL,
  `codTipoPagoPed` int(11) NOT NULL,
  `PrecioTotal` double NOT NULL,

  Primary Key (codPedido),
  foreign key (codCliPedido) references Clientes(codCli),
  foreign key (codEstadoPed) references EstadosPedido(codEstadoPed),
  foreign key (codFuentePed) references FuentesPedido(codFuentePed),
  foreign key (codTipoPagoPed) references TiposPago(codTipoPago)
  
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- **************************************
-- *** Crear tabla: LineasPedido ********
-- **************************************

CREATE TABLE `LineasPedido` (
  `codLineaPed` int(11) NOT NULL,
  `codPedido` int(11) NOT NULL,
  `codArtLineaPed` int(11) NOT NULL,
  `cantArticulos` int(11) NOT NULL,

  Primary Key (codLineaPed),
  foreign key (codPedido) references Pedidos(codPedido),
  foreign key (codArtLineaPed) references Articulos(codArt)
  
) ENGINE=InnoDB DEFAULT CHARSET=latin1;







