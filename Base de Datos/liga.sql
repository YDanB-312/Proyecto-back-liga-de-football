-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-03-2026 a las 23:19:29
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `liga`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `games`
--

CREATE TABLE `games` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `local_goals` int(11) NOT NULL,
  `away_goals` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `games`
--

INSERT INTO `games` (`id`, `date`, `local_goals`, `away_goals`, `created_at`, `updated_at`) VALUES
(1, '2021-03-15', 2, 1, NULL, NULL),
(2, '2022-07-22', 1, 1, NULL, NULL),
(3, '2023-11-05', 3, 2, NULL, NULL),
(4, '2024-04-18', 0, 2, NULL, NULL),
(5, '2025-09-30', 2, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `goals`
--

CREATE TABLE `goals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `player_id` bigint(20) UNSIGNED NOT NULL,
  `game_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `goals`
--

INSERT INTO `goals` (`id`, `name`, `description`, `created_at`, `updated_at`, `player_id`, `game_id`) VALUES
(1, 'Gol 1', 'Remate de cabeza', NULL, NULL, 1, 1),
(2, 'Gol 2', 'Penal', NULL, NULL, 12, 1),
(3, 'Gol 3', 'Disparo lejano', NULL, NULL, 2, 2),
(4, 'Gol 4', 'Tiro libre', NULL, NULL, 23, 2),
(5, 'Gol 5', 'Contraataque', NULL, NULL, 13, 3),
(6, 'Gol 6', 'Remate dentro del área', NULL, NULL, 34, 3),
(7, 'Gol 7', 'Penal', NULL, NULL, 24, 4),
(8, 'Gol 8', 'Gol de volea', NULL, NULL, 45, 4),
(9, 'Gol 9', 'Tiro libre', NULL, NULL, 35, 5),
(10, 'Gol 10', 'Jugada colectiva', NULL, NULL, 46, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(2, '2026_03_17_195053_create_presidents_table', 1),
(3, '2026_03_17_195140_create_games_table', 1),
(4, '2026_03_17_195208_create_teams_table', 1),
(5, '2026_03_17_195237_create_players_table', 1),
(6, '2026_03_17_195256_create_goals_table', 1),
(7, '2026_03_17_195430_create_team_games_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `players`
--

CREATE TABLE `players` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `position` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `team_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `players`
--

INSERT INTO `players` (`id`, `name`, `position`, `created_at`, `updated_at`, `team_id`) VALUES
(1, 'Juan Rodríguez', 'Portero', NULL, NULL, 1),
(2, 'Carlos Méndez', 'Defensa', NULL, NULL, 1),
(3, 'Luis Herrera', 'Defensa', NULL, NULL, 1),
(4, 'Andrés Gómez', 'Defensa', NULL, NULL, 1),
(5, 'Miguel Torres', 'Defensa', NULL, NULL, 1),
(6, 'David Castro', 'Medio', NULL, NULL, 1),
(7, 'Jhon Pérez', 'Medio', NULL, NULL, 1),
(8, 'Daniel Rojas', 'Medio', NULL, NULL, 1),
(9, 'Felipe Vargas', 'Delantero', NULL, NULL, 1),
(10, 'Kevin Morales', 'Delantero', NULL, NULL, 1),
(11, 'Santiago Ruiz', 'Delantero', NULL, NULL, 1),
(12, 'Javier López', 'Portero', NULL, NULL, 2),
(13, 'Diego Ramírez', 'Defensa', NULL, NULL, 2),
(14, 'Esteban Cruz', 'Defensa', NULL, NULL, 2),
(15, 'Brayan Silva', 'Defensa', NULL, NULL, 2),
(16, 'Óscar Pineda', 'Defensa', NULL, NULL, 2),
(17, 'Camilo Díaz', 'Medio', NULL, NULL, 2),
(18, 'Nicolás León', 'Medio', NULL, NULL, 2),
(19, 'Sebastián Ortiz', 'Medio', NULL, NULL, 2),
(20, 'Alejandro Peña', 'Delantero', NULL, NULL, 2),
(21, 'Cristian Suárez', 'Delantero', NULL, NULL, 2),
(22, 'Mauricio Gil', 'Delantero', NULL, NULL, 2),
(23, 'Fernando Rincón', 'Portero', NULL, NULL, 3),
(24, 'Héctor Salazar', 'Defensa', NULL, NULL, 3),
(25, 'Ricardo Palacios', 'Defensa', NULL, NULL, 3),
(26, 'Edwin Mosquera', 'Defensa', NULL, NULL, 3),
(27, 'Julián Córdoba', 'Defensa', NULL, NULL, 3),
(28, 'Wilson Cuesta', 'Medio', NULL, NULL, 3),
(29, 'Yerson Candelo', 'Medio', NULL, NULL, 3),
(30, 'Harold Rivera', 'Medio', NULL, NULL, 3),
(31, 'Dayro Moreno', 'Delantero', NULL, NULL, 3),
(32, 'Teófilo Gutiérrez', 'Delantero', NULL, NULL, 3),
(33, 'Adrián Ramos', 'Delantero', NULL, NULL, 3),
(34, 'Álvaro Montero', 'Portero', NULL, NULL, 4),
(35, 'Jeison Murillo', 'Defensa', NULL, NULL, 4),
(36, 'Davinson Sánchez', 'Defensa', NULL, NULL, 4),
(37, 'William Tesillo', 'Defensa', NULL, NULL, 4),
(38, 'Frank Fabra', 'Defensa', NULL, NULL, 4),
(39, 'Juan Cuadrado', 'Medio', NULL, NULL, 4),
(40, 'Mateus Uribe', 'Medio', NULL, NULL, 4),
(41, 'Jefferson Lerma', 'Medio', NULL, NULL, 4),
(42, 'Luis Díaz', 'Delantero', NULL, NULL, 4),
(43, 'Rafael Santos Borré', 'Delantero', NULL, NULL, 4),
(44, 'Duván Zapata', 'Delantero', NULL, NULL, 4),
(45, 'Pedro Gallese', 'Portero', NULL, NULL, 5),
(46, 'Carlos Zambrano', 'Defensa', NULL, NULL, 5),
(47, 'Luis Advíncula', 'Defensa', NULL, NULL, 5),
(48, 'Miguel Araujo', 'Defensa', NULL, NULL, 5),
(49, 'Renato Tapia', 'Defensa', NULL, NULL, 5),
(50, 'Yoshimar Yotún', 'Medio', NULL, NULL, 5),
(51, 'Christian Cueva', 'Medio', NULL, NULL, 5),
(52, 'Sergio Peña', 'Medio', NULL, NULL, 5),
(53, 'Gianluca Lapadula', 'Delantero', NULL, NULL, 5),
(54, 'Paolo Guerrero', 'Delantero', NULL, NULL, 5),
(55, 'André Carrillo', 'Delantero', NULL, NULL, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `presidents`
--

CREATE TABLE `presidents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `year` year(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `presidents`
--

INSERT INTO `presidents` (`id`, `name`, `year`, `created_at`, `updated_at`) VALUES
(1, 'Carlos Pérez', '1998', NULL, NULL),
(2, 'Ana Gómez', '2003', NULL, NULL),
(3, 'Luis Martínez', '2007', NULL, NULL),
(4, 'Marta Rodríguez', '2011', NULL, NULL),
(5, 'Jorge Sánchez', '2016', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `teams`
--

CREATE TABLE `teams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `stadium` varchar(255) NOT NULL,
  `capacity` int(10) UNSIGNED NOT NULL,
  `year_of_fundation` year(4) NOT NULL,
  `president_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `teams`
--

INSERT INTO `teams` (`id`, `name`, `city`, `stadium`, `capacity`, `year_of_fundation`, `president_id`, `created_at`, `updated_at`) VALUES
(1, 'Tigres', 'Bogotá', 'Tigres Arena', 30000, '1985', 1, NULL, NULL),
(2, 'Águilas', 'Medellín', 'Águilas Park', 25000, '1992', 2, NULL, NULL),
(3, 'Leones', 'Cali', 'Leones Field', 28000, '1978', 3, NULL, NULL),
(4, 'Halcones', 'Barranquilla', 'Halcones Dome', 22000, '2001', 4, NULL, NULL),
(5, 'Jaguares', 'Bucaramanga', 'Jaguares Stadium', 24000, '1996', 5, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `team_games`
--

CREATE TABLE `team_games` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `team_id` bigint(20) UNSIGNED NOT NULL,
  `game_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `team_games`
--

INSERT INTO `team_games` (`id`, `created_at`, `updated_at`, `team_id`, `game_id`) VALUES
(1, NULL, NULL, 1, 1),
(2, NULL, NULL, 2, 1),
(3, NULL, NULL, 1, 2),
(4, NULL, NULL, 3, 2),
(5, NULL, NULL, 2, 3),
(6, NULL, NULL, 4, 3),
(7, NULL, NULL, 3, 4),
(8, NULL, NULL, 5, 4),
(9, NULL, NULL, 4, 5),
(10, NULL, NULL, 5, 5);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `goals`
--
ALTER TABLE `goals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `goals_player_id_foreign` (`player_id`),
  ADD KEY `goals_game_id_foreign` (`game_id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`id`),
  ADD KEY `players_team_id_foreign` (`team_id`);

--
-- Indices de la tabla `presidents`
--
ALTER TABLE `presidents`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teams_president_id_foreign` (`president_id`);

--
-- Indices de la tabla `team_games`
--
ALTER TABLE `team_games`
  ADD PRIMARY KEY (`id`),
  ADD KEY `team_games_team_id_foreign` (`team_id`),
  ADD KEY `team_games_game_id_foreign` (`game_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `games`
--
ALTER TABLE `games`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `goals`
--
ALTER TABLE `goals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `players`
--
ALTER TABLE `players`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT de la tabla `presidents`
--
ALTER TABLE `presidents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `teams`
--
ALTER TABLE `teams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `team_games`
--
ALTER TABLE `team_games`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `goals`
--
ALTER TABLE `goals`
  ADD CONSTRAINT `goals_game_id_foreign` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `goals_player_id_foreign` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `players`
--
ALTER TABLE `players`
  ADD CONSTRAINT `players_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `teams`
--
ALTER TABLE `teams`
  ADD CONSTRAINT `teams_president_id_foreign` FOREIGN KEY (`president_id`) REFERENCES `presidents` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `team_games`
--
ALTER TABLE `team_games`
  ADD CONSTRAINT `team_games_game_id_foreign` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `team_games_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
