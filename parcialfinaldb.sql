-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-06-2016 a las 08:33:14
-- Versión del servidor: 10.1.9-MariaDB
-- Versión de PHP: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `parcialfinaldb`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_punto` (IN `id` INT)  NO SQL
DELETE  FROM Coordenada WHERE idCordenada = id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mostrar_todos_los_puntos` ()  NO SQL
SELECT * FROM coordenada$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `puntos_con_sus_usuarios` ()  NO SQL
SELECT usuario.idUsuario, usuario.nombre, usuario.apellido, puntovalorado.idPunto, puntovalorado.idPercepcion, puntovalorado.idCoordenada, puntovalorado.ib FROM usuario, puntovalorado WHERE idUsuario in (SELECT idUsuario from usuarioporpuntovalorado) and idPunto in (Select idPuntoValorado from usuarioporpuntovalorado)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `puntos_por_un_ib_dado` (IN `ibienestar` INT)  NO SQL
select * from coordenada where idCordenada in (select idCoordenada from puntovalorado where IB=ibienestar)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `puntos_por_un_ib_inferior_dado` (IN `ibienestar` INT)  NO SQL
select * from coordenada where idCordenada in (select idCoordenada from puntovalorado where IB<ibienestar)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `puntos_por_un_ib_superior_dado` (IN `ibienestar` INT)  NO SQL
select * from coordenada where idCordenada in (select idCoordenada from puntovalorado where IB>ibienestar)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `puntos_valorados` ()  NO SQL
SELECT * FROM puntovalorado$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `puntos_valorados_por_usuario` (IN `id` INT)  NO SQL
SELECT usuario.idUsuario, usuario.nombre, usuario.apellido, puntovalorado.idPunto, puntovalorado.idPercepcion, puntovalorado.idCoordenada, puntovalorado.ib FROM usuario, puntovalorado WHERE idUsuario=id in (SELECT idUsuario from usuarioporpuntovalorado) and idPunto in (Select idPuntoValorado from usuarioporpuntovalorado)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `registro_punto` (IN `lat` INT, IN `lon` INT)  NO SQL
INSERT INTO `Coordenada` (`idCordenada`, `latitud`, `longitud`) VALUES 
(null, lat, lon)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `usuarios_que_califican_mejor_sus_puntos` (IN `rango_ib` INT)  NO SQL
SELECT usuario.idUsuario, usuario.nombre, usuario.apellido, puntovalorado.idPunto, puntovalorado.idPercepcion, puntovalorado.idCoordenada, puntovalorado.ib FROM usuario, puntovalorado WHERE idUsuario in (SELECT idUsuario from usuarioporpuntovalorado) and idPunto in (Select idPuntoValorado from usuarioporpuntovalorado WHERE ib>rango_ib)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `usuarios_que_han_valorado` ()  NO SQL
SELECT * FROM usuario WHERE idUsuario in (SELECT idUsuario from usuarioporpercepcion)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `usuarios_que_no_han_valorado` ()  NO SQL
SELECT * FROM usuario Where NOT EXISTS (SELECT * FROM usuarioporpercepcion WHERE usuario.idUsuario = usuarioporpercepcion.idUsuario)$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `coordenada`
--

CREATE TABLE `coordenada` (
  `idCordenada` int(20) NOT NULL,
  `latitud` double NOT NULL,
  `longitud` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `coordenada`
--

INSERT INTO `coordenada` (`idCordenada`, `latitud`, `longitud`) VALUES
(1, 4.7014, -74.0325),
(2, -74.09464423, 4.687127118),
(3, -13.41344, 3.24232),
(4, 672.13871, 14.1414121),
(5, 1.3342332, -4.3513512),
(6, 53.4511, -4.6223),
(9, 99.999845, -75.86954),
(12, 5, -74),
(13, 5, -74);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `coordenadaporrango`
--

CREATE TABLE `coordenadaporrango` (
  `idCoordenada` int(11) NOT NULL,
  `idRango` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `coordenadaporrango`
--

INSERT INTO `coordenadaporrango` (`idCoordenada`, `idRango`) VALUES
(2, 1),
(1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `coordenadaporvia`
--

CREATE TABLE `coordenadaporvia` (
  `idCoordenada` int(11) NOT NULL,
  `idVia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `coordenadaporvia`
--

INSERT INTO `coordenadaporvia` (`idCoordenada`, `idVia`) VALUES
(1, 1),
(4, 3),
(5, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `localidad`
--

CREATE TABLE `localidad` (
  `idLocalidad` int(20) NOT NULL,
  `nombre` varchar(40) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `areaTotal` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `areaUrbana` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `areaRural` varchar(40) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `localidad`
--

INSERT INTO `localidad` (`idLocalidad`, `nombre`, `areaTotal`, `areaUrbana`, `areaRural`) VALUES
(1, 'Chapinero', '3.898,96 hectáreas', '1.234,71 ha (32%).', '2.664,25 ha (68%)'),
(2, 'Suba', '3.898,96 hectáreas', '1.234,71 ha (32%).', '2.664,25 ha (68%)');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `localidadporlugarinteres`
--

CREATE TABLE `localidadporlugarinteres` (
  `idLocalidad` int(11) NOT NULL,
  `idLugarInteres` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `localidadporlugarinteres`
--

INSERT INTO `localidadporlugarinteres` (`idLocalidad`, `idLugarInteres`) VALUES
(1, 4),
(2, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lugaresdeinteres`
--

CREATE TABLE `lugaresdeinteres` (
  `idlugarInteres` int(20) NOT NULL,
  `nombre` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `tipo` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(40) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `lugaresdeinteres`
--

INSERT INTO `lugaresdeinteres` (`idlugarInteres`, `nombre`, `tipo`, `descripcion`) VALUES
(1, 'Doña Juana', 'Restaurante', 'Restaurante y Pescaderia'),
(2, 'BICIS', 'Bicicleteria', 'bicicleteria '),
(3, 'Jorge Elieser Gaitan', 'TEATRO', 'teatro'),
(4, 'Virgilio Varco', 'BIBLIOTECA', 'biblioteca ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mediotransporte`
--

CREATE TABLE `mediotransporte` (
  `idMTransporte` int(20) NOT NULL,
  `idUsuario` int(20) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Estado` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `color` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `idTipo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `mediotransporte`
--

INSERT INTO `mediotransporte` (`idMTransporte`, `idUsuario`, `nombre`, `Estado`, `color`, `idTipo`) VALUES
(1, 1, 'Bicicleta', 'Pinchada', 'Negro', 2),
(2, 1, 'Bicicleta', 'Activa', 'Rojo', 1),
(3, 3, 'Bicicleta ', 'Bueno', 'Amarillo', 3),
(4, 4, 'Patineta', 'Bueno', 'negro', 6),
(5, 5, 'Bicicleta Electrica', 'Bueno', 'Naranja', 4),
(6, 6, 'Bicicleta GW', 'Bueno', 'Rojo', 4),
(7, 2, 'Bicicleta Shimano', 'Bueno', 'Naranja', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `percepcion`
--

CREATE TABLE `percepcion` (
  `idPercepcion` int(11) NOT NULL,
  `seguridad` int(11) NOT NULL,
  `salud` int(11) NOT NULL,
  `agrado` int(11) NOT NULL,
  `ib` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `percepcion`
--

INSERT INTO `percepcion` (`idPercepcion`, `seguridad`, `salud`, `agrado`, `ib`) VALUES
(1, 30, 80, 35, 0),
(2, 60, 30, 70, 0),
(3, 80, 20, 50, NULL),
(4, 75, 56, 39, NULL),
(5, 15, 30, 20, NULL),
(6, 45, 12, 60, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puntovalorado`
--

CREATE TABLE `puntovalorado` (
  `idPercepcion` int(11) NOT NULL,
  `idCoordenada` int(11) NOT NULL,
  `valoracionSeguridad` int(11) DEFAULT NULL,
  `valoracionSalud` int(11) DEFAULT NULL,
  `valoracionAgrado` int(11) DEFAULT NULL,
  `idPunto` int(11) NOT NULL,
  `IB` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `puntovalorado`
--

INSERT INTO `puntovalorado` (`idPercepcion`, `idCoordenada`, `valoracionSeguridad`, `valoracionSalud`, `valoracionAgrado`, `idPunto`, `IB`) VALUES
(1, 1, NULL, NULL, NULL, 1, 57),
(2, 5, NULL, NULL, NULL, 2, 60),
(4, 2, NULL, NULL, NULL, 3, 100),
(5, 9, NULL, NULL, NULL, 4, 25),
(3, 5, NULL, NULL, NULL, 6, 80);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rango`
--

CREATE TABLE `rango` (
  `idRango` int(11) NOT NULL,
  `metrosA_la_redonda` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `rango`
--

INSERT INTO `rango` (`idRango`, `metrosA_la_redonda`) VALUES
(1, 3000),
(2, 500);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rangoporlocalidad`
--

CREATE TABLE `rangoporlocalidad` (
  `idRango` int(11) NOT NULL,
  `idLocalidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `rangoporlocalidad`
--

INSERT INTO `rangoporlocalidad` (`idRango`, `idLocalidad`) VALUES
(1, 2),
(2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo`
--

CREATE TABLE `tipo` (
  `idTipo` int(11) NOT NULL,
  `nombre` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(40) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tipo`
--

INSERT INTO `tipo` (`idTipo`, `nombre`, `descripcion`) VALUES
(1, 'BICICLETA TODO TERRENO', 'bicicleta todo terreno con llantas rin26'),
(2, 'BICICLETA BMX', 'bicicleta usada para hacer trucos'),
(3, 'MonoPatin', ''),
(4, 'Cicla Electrica', 'Clicla con dos reudas, impulsada por ele'),
(5, 'Bicicleta con motor', 'bicicleta con mecanismo de combustion'),
(6, 'Patineta', 'tabla con dos ruedas ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(20) NOT NULL,
  `nombre` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `apellido` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `correo` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `telefono` int(20) NOT NULL,
  `A` varchar(8) COLLATE utf8_spanish_ci NOT NULL,
  `B` varchar(8) COLLATE utf8_spanish_ci NOT NULL,
  `C` varchar(8) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `nombre`, `apellido`, `correo`, `telefono`, `A`, `B`, `C`) VALUES
(1, 'Daniel', 'Perez', 'dpre@ha.com', 21312312, '0.2', '0.3', '0.5'),
(2, 'Pedro', 'Caseres', 'pedroc@ga.com', 314214, '0.4', '0.4', '0.2'),
(3, 'Anderson ', 'Velandia', 'Anve@hotmail.com', 1223123, '0.3', '0.2', '0.5'),
(4, 'Carlos ', 'Gomez', 'cgomez@gmail.com', 134134, '0.3', '0.6', '0.1'),
(5, 'Pepe', 'Cierra', 'pcpepe@gkoa.com', 3413421, '0.2', '0.6', '0.2'),
(6, 'Jaime', 'Coronoado', 'coronado87@hotmail.com', 1324198, '0.3', '0.4', '0.3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarioporcoordenada`
--

CREATE TABLE `usuarioporcoordenada` (
  `idUsuario` int(11) NOT NULL,
  `idCoordenada` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuarioporcoordenada`
--

INSERT INTO `usuarioporcoordenada` (`idUsuario`, `idCoordenada`) VALUES
(3, 1),
(5, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarioporpercepcion`
--

CREATE TABLE `usuarioporpercepcion` (
  `idUsuario` int(11) NOT NULL,
  `idPercepcion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuarioporpercepcion`
--

INSERT INTO `usuarioporpercepcion` (`idUsuario`, `idPercepcion`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(5, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarioporpuntovalorado`
--

CREATE TABLE `usuarioporpuntovalorado` (
  `idUsuario` int(11) NOT NULL,
  `idPuntoValorado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuarioporpuntovalorado`
--

INSERT INTO `usuarioporpuntovalorado` (`idUsuario`, `idPuntoValorado`) VALUES
(1, 1),
(2, 1),
(1, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vias`
--

CREATE TABLE `vias` (
  `idVia` int(50) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `tipo` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `estado` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `distancia` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `vias`
--

INSERT INTO `vias` (`idVia`, `nombre`, `tipo`, `estado`, `distancia`) VALUES
(1, 'Avenida Boyaca', 'Ciclo Ruta - Anden', 'BUENO', '4 KM'),
(2, 'Avenida 68', 'Ciclo Ruta - Anden', 'MALO', '5 km'),
(3, ' Calle 80', 'Ciclo Ruta - Anden', 'Medio', '2 km');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `coordenada`
--
ALTER TABLE `coordenada`
  ADD PRIMARY KEY (`idCordenada`);

--
-- Indices de la tabla `coordenadaporrango`
--
ALTER TABLE `coordenadaporrango`
  ADD KEY `idCoordenada` (`idCoordenada`),
  ADD KEY `idRango` (`idRango`);

--
-- Indices de la tabla `coordenadaporvia`
--
ALTER TABLE `coordenadaporvia`
  ADD KEY `idCoordenada` (`idCoordenada`),
  ADD KEY `idVia` (`idVia`);

--
-- Indices de la tabla `localidad`
--
ALTER TABLE `localidad`
  ADD PRIMARY KEY (`idLocalidad`);

--
-- Indices de la tabla `localidadporlugarinteres`
--
ALTER TABLE `localidadporlugarinteres`
  ADD KEY `idLocalidad` (`idLocalidad`),
  ADD KEY `idLugarInteres` (`idLugarInteres`);

--
-- Indices de la tabla `lugaresdeinteres`
--
ALTER TABLE `lugaresdeinteres`
  ADD PRIMARY KEY (`idlugarInteres`);

--
-- Indices de la tabla `mediotransporte`
--
ALTER TABLE `mediotransporte`
  ADD PRIMARY KEY (`idMTransporte`),
  ADD KEY `idUsuario` (`idUsuario`),
  ADD KEY `idTipo` (`idTipo`);

--
-- Indices de la tabla `percepcion`
--
ALTER TABLE `percepcion`
  ADD PRIMARY KEY (`idPercepcion`);

--
-- Indices de la tabla `puntovalorado`
--
ALTER TABLE `puntovalorado`
  ADD PRIMARY KEY (`idPunto`),
  ADD KEY `idPercepcion` (`idPercepcion`),
  ADD KEY `idCoordenada` (`idCoordenada`);

--
-- Indices de la tabla `rango`
--
ALTER TABLE `rango`
  ADD PRIMARY KEY (`idRango`);

--
-- Indices de la tabla `rangoporlocalidad`
--
ALTER TABLE `rangoporlocalidad`
  ADD KEY `idRango` (`idRango`),
  ADD KEY `idLocalidad` (`idLocalidad`);

--
-- Indices de la tabla `tipo`
--
ALTER TABLE `tipo`
  ADD PRIMARY KEY (`idTipo`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`);

--
-- Indices de la tabla `usuarioporcoordenada`
--
ALTER TABLE `usuarioporcoordenada`
  ADD KEY `idUsuario` (`idUsuario`),
  ADD KEY `idCoordenada` (`idCoordenada`);

--
-- Indices de la tabla `usuarioporpercepcion`
--
ALTER TABLE `usuarioporpercepcion`
  ADD KEY `idUsuario` (`idUsuario`),
  ADD KEY `idPercepcion` (`idPercepcion`);

--
-- Indices de la tabla `usuarioporpuntovalorado`
--
ALTER TABLE `usuarioporpuntovalorado`
  ADD KEY `idUsuario` (`idUsuario`),
  ADD KEY `idPuntoValorado` (`idPuntoValorado`);

--
-- Indices de la tabla `vias`
--
ALTER TABLE `vias`
  ADD PRIMARY KEY (`idVia`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `coordenada`
--
ALTER TABLE `coordenada`
  MODIFY `idCordenada` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT de la tabla `localidad`
--
ALTER TABLE `localidad`
  MODIFY `idLocalidad` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `lugaresdeinteres`
--
ALTER TABLE `lugaresdeinteres`
  MODIFY `idlugarInteres` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `mediotransporte`
--
ALTER TABLE `mediotransporte`
  MODIFY `idMTransporte` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `percepcion`
--
ALTER TABLE `percepcion`
  MODIFY `idPercepcion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `puntovalorado`
--
ALTER TABLE `puntovalorado`
  MODIFY `idPunto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `rango`
--
ALTER TABLE `rango`
  MODIFY `idRango` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `tipo`
--
ALTER TABLE `tipo`
  MODIFY `idTipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `vias`
--
ALTER TABLE `vias`
  MODIFY `idVia` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `coordenadaporrango`
--
ALTER TABLE `coordenadaporrango`
  ADD CONSTRAINT `coordenadaporrango_ibfk_1` FOREIGN KEY (`idCoordenada`) REFERENCES `coordenada` (`idCordenada`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `coordenadaporrango_ibfk_2` FOREIGN KEY (`idRango`) REFERENCES `rango` (`idRango`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `coordenadaporvia`
--
ALTER TABLE `coordenadaporvia`
  ADD CONSTRAINT `coordenadaporvia_ibfk_1` FOREIGN KEY (`idCoordenada`) REFERENCES `coordenada` (`idCordenada`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `coordenadaporvia_ibfk_2` FOREIGN KEY (`idVia`) REFERENCES `vias` (`idVia`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `localidadporlugarinteres`
--
ALTER TABLE `localidadporlugarinteres`
  ADD CONSTRAINT `localidadporlugarinteres_ibfk_1` FOREIGN KEY (`idLocalidad`) REFERENCES `localidad` (`idLocalidad`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `localidadporlugarinteres_ibfk_2` FOREIGN KEY (`idLugarInteres`) REFERENCES `lugaresdeinteres` (`idlugarInteres`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `mediotransporte`
--
ALTER TABLE `mediotransporte`
  ADD CONSTRAINT `mediotransporte_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mediotransporte_ibfk_2` FOREIGN KEY (`idTipo`) REFERENCES `tipo` (`idTipo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `puntovalorado`
--
ALTER TABLE `puntovalorado`
  ADD CONSTRAINT `puntovalorado_ibfk_1` FOREIGN KEY (`idCoordenada`) REFERENCES `coordenada` (`idCordenada`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `puntovalorado_ibfk_2` FOREIGN KEY (`idPercepcion`) REFERENCES `percepcion` (`idPercepcion`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `rangoporlocalidad`
--
ALTER TABLE `rangoporlocalidad`
  ADD CONSTRAINT `rangoporlocalidad_ibfk_1` FOREIGN KEY (`idRango`) REFERENCES `rango` (`idRango`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rangoporlocalidad_ibfk_2` FOREIGN KEY (`idLocalidad`) REFERENCES `localidad` (`idLocalidad`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarioporcoordenada`
--
ALTER TABLE `usuarioporcoordenada`
  ADD CONSTRAINT `usuarioporcoordenada_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarioporcoordenada_ibfk_2` FOREIGN KEY (`idCoordenada`) REFERENCES `coordenada` (`idCordenada`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarioporpercepcion`
--
ALTER TABLE `usuarioporpercepcion`
  ADD CONSTRAINT `usuarioporpercepcion_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarioporpercepcion_ibfk_2` FOREIGN KEY (`idPercepcion`) REFERENCES `percepcion` (`idPercepcion`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarioporpuntovalorado`
--
ALTER TABLE `usuarioporpuntovalorado`
  ADD CONSTRAINT `usuarioporpuntovalorado_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarioporpuntovalorado_ibfk_2` FOREIGN KEY (`idPuntoValorado`) REFERENCES `puntovalorado` (`idPunto`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
