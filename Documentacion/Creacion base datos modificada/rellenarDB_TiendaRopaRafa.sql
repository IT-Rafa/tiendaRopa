
USE TiendaRopaRafa;

-- **********************************
-- *** Rellenar tabla: FuentesPedido ***
-- **********************************

INSERT INTO `FuentesPedido` (`codFuentePed`, `descFuentePed`) VALUES
(1, "Web"),
(2, "Facebook"),
(3, "telefónico");

-- **********************************
-- *** Rellenar tabla: TiposPago   **
-- **********************************

INSERT INTO `TiposPago` (`codTipoPago`, `descTipoPago`) VALUES
(1, "Contra-reembolso"),
(2, "Tarjeta"),
(3, "PayPal");

-- **********************************
-- ** Rellenar tabla: EstadosPedido *
-- **********************************

INSERT INTO `EstadosPedido` (`codEstadoPed`, `descEstadoPed`) VALUES
(1, "En espera"),
(2, "En Proceso"),
(3, "Entregado");

-- **********************************
-- ** Rellenar tabla: Temporadas *
-- **********************************

INSERT INTO `Temporadas` (`codTemp`, `descTemp`) VALUES
(1, 'PRIMAVERA'),
(2, 'VERANO'),
(3, 'OTOÑO'),
(4, 'INVIERNO');

-- *********************************
-- ** Rellenar tabla: Provincias  **
-- *********************************


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


-- *********************************
-- ** Rellenar tabla: Localidades  *
-- *********************************
INSERT INTO `Localidades` (`codLocal`, `descLocal`) VALUES
(213, 'Vigo'),
(210, 'OtroSitio');

-- --------------------------------------------------------


-- *********************************
-- ** Rellenar tabla: Categorias  *
-- *********************************
INSERT INTO `Categorias` (`codCat`, `desCat`, `codTempCat`) VALUES
(1, 'OULET', 1),
(2, 'MILK', 2),
(3, 'URBAN NORTH', 2),
(4, 'CIES', 3),
(5, 'EARLY BIRDS', 2),
(6, 'HIVE', 3),
(7, 'MALPICA', 4),
(8, 'ONS', 4),
(9, 'SALVORA', 2),
(10, 'COMPLEMENTOS', 1);


-- *********************************
-- ** Rellenar tabla: Clientes  *
-- *********************************

 INSERT INTO `Clientes` (`codCli`, `dniCli`, `nombreCli`, `direcCli`, `codLocalCli`, `codProvCli`, `tfnoCli`, `emailCli`) VALUES
(1, '36111111A', 'Ana Alvarez', 'calle Paz 21 1ºA', '213', '36', '986111111', 'ana@gmail.com'),
(2, '36222222B', 'Beatriz Barca', 'calle Pez 22 2ºA', '213', '36', '986222222', 'bea@gmail.com'),
(3, '36333333C', 'Carlos Costa', 'calle Cadiz 23 3ºA', '210', '36', '986333333', 'carlos@gmail.com');
-- --------------------------------------------------------
-- **********************************
-- *** Rellenar tabla: Articulos   **
-- **********************************

INSERT INTO `Articulos` (`codArt`, `descArt`, `codCatArt`, `precioArt`) VALUES
(1, 'PELELE DE BEBE', 1, 10.5),
(2, 'PANTALON URBAN', 2, 20),
(3, 'CAMISA URBAN', 3, 25.5),
(4, 'ROPITA', 3, 25.5);

-- --------------------------------------------------------
-- **********************************
-- *** Rellenar tabla: Pedidos   **
-- **********************************

INSERT INTO `Pedidos` (`codPedido`, `codCliPedido`, `fechaPedido`, `codEstadoPed`, `codFuentePed`, `codTipoPagoPed`,`PrecioTotal`) VALUES
(1, 1, '2018-04-27', 1, 2, 1, 20.5),
(2, 2, '2018-04-20', 2, 1, 2, 30),
(3, 3, '2018-04-27', 1, 2, 1, 20.5),
(4, 2, '2018-04-20', 2, 1, 2, 30);

-- --------------------------------------------------------
-- **********************************
-- *** Rellenar tabla: LineasPedido   **
-- **********************************

INSERT INTO `LineasPedido` (`codLineaPed`, `codPedido`, `codArtLineaPed`, `cantArticulos`) VALUES
(1, 1, 1, 5),
(2, 1, 2, 3),
(3, 2, 3, 2),
(4, 2, 2, 6),
(5, 3, 3, 2),
(6, 3, 4, 1),
(7, 4, 2, 1),
(8, 4, 4, 2);