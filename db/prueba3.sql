-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-07-2018 a las 22:05:02
-- Versión del servidor: 10.1.26-MariaDB
-- Versión de PHP: 7.0.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `prueba3`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipo`
--

CREATE TABLE `equipo` (
  `id_equipo` int(11) NOT NULL,
  `serial_equipo` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_ticket`
--

CREATE TABLE `estado_ticket` (
  `id_estado_ticket` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estado_ticket`
--

INSERT INTO `estado_ticket` (`id_estado_ticket`, `nombre`) VALUES
(1, 'Enviado'),
(2, 'En proceso'),
(3, 'Terminado'),
(4, 'Enviado'),
(5, 'En proceso'),
(6, 'Terminado'),
(7, 'Enviado'),
(8, 'En proceso'),
(9, 'Terminado'),
(10, 'Enviado'),
(11, 'En proceso'),
(12, 'Terminado'),
(13, 'Enviado'),
(14, 'En proceso'),
(15, 'Terminado'),
(16, 'Enviado'),
(17, 'En proceso'),
(18, 'Terminado'),
(19, 'Enviado'),
(20, 'En proceso'),
(21, 'Terminado'),
(22, 'Enviado'),
(23, 'En proceso'),
(24, 'Terminado'),
(25, 'Enviado'),
(26, 'En proceso'),
(27, 'Terminado'),
(28, 'Enviado'),
(29, 'En proceso'),
(30, 'Terminado'),
(31, 'Enviado'),
(32, 'En proceso'),
(33, 'Terminado'),
(34, 'Enviado'),
(35, 'En proceso'),
(36, 'Terminado'),
(37, 'Enviado'),
(38, 'En proceso'),
(39, 'Terminado'),
(40, 'Enviado'),
(41, 'En proceso'),
(42, 'Terminado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id_rol` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id_rol`, `nombre`) VALUES
(1, 'Técnico'),
(2, 'Instructor'),
(3, 'Técnico'),
(4, 'Instructor'),
(5, 'Técnico'),
(6, 'Instructor'),
(7, 'Técnico'),
(8, 'Instructor'),
(9, 'Técnico'),
(10, 'Instructor'),
(11, 'Técnico'),
(12, 'Instructor'),
(13, 'Técnico'),
(14, 'Instructor'),
(15, 'Técnico'),
(16, 'Instructor'),
(17, 'Técnico'),
(18, 'Instructor'),
(19, 'Técnico'),
(20, 'Instructor'),
(21, 'Técnico'),
(22, 'Instructor'),
(23, 'Técnico'),
(24, 'Instructor'),
(25, 'Técnico'),
(26, 'Instructor'),
(27, 'Técnico'),
(28, 'Instructor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ticket`
--

CREATE TABLE `ticket` (
  `id_ticket` int(11) NOT NULL,
  `fecha_creado` datetime DEFAULT CURRENT_TIMESTAMP,
  `descripcion` varchar(254) NOT NULL,
  `imagen` varchar(254) DEFAULT NULL,
  `respuesta` varchar(254) DEFAULT NULL,
  `estado_ticket_id_estado_ticket` int(11) NOT NULL,
  `equipo_id_equipo` int(11) NOT NULL,
  `usuario_id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(16) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contrasena` varchar(32) NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `cod_rol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD PRIMARY KEY (`id_equipo`);

--
-- Indices de la tabla `estado_ticket`
--
ALTER TABLE `estado_ticket`
  ADD PRIMARY KEY (`id_estado_ticket`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`id_ticket`),
  ADD KEY `fk_ticket_estado_ticket1_idx` (`estado_ticket_id_estado_ticket`),
  ADD KEY `fk_ticket_equipo1_idx` (`equipo_id_equipo`),
  ADD KEY `fk_ticket_usuario1_idx` (`usuario_id_usuario`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `fk_user_rol_idx` (`cod_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `equipo`
--
ALTER TABLE `equipo`
  MODIFY `id_equipo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estado_ticket`
--
ALTER TABLE `estado_ticket`
  MODIFY `id_estado_ticket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `ticket`
--
ALTER TABLE `ticket`
  MODIFY `id_ticket` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `fk_ticket_equipo1` FOREIGN KEY (`equipo_id_equipo`) REFERENCES `equipo` (`id_equipo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ticket_estado_ticket1` FOREIGN KEY (`estado_ticket_id_estado_ticket`) REFERENCES `estado_ticket` (`id_estado_ticket`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ticket_usuario1` FOREIGN KEY (`usuario_id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_user_rol` FOREIGN KEY (`cod_rol`) REFERENCES `rol` (`id_rol`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
