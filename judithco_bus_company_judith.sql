-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Erstellungszeit: 12. Mrz 2019 um 09:28
-- Server-Version: 5.7.25
-- PHP-Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `judithco_bus_company_judith`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `bus`
--

CREATE TABLE `bus` (
  `bus_id` int(11) NOT NULL,
  `fk_driver_id` int(11) DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  `model` varchar(55) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `bus`
--

INSERT INTO `bus` (`bus_id`, `fk_driver_id`, `capacity`, `model`) VALUES
(1, 1, 50, 'Mercedes'),
(2, 2, 120, 'Dodge'),
(3, 3, 150, 'Audi'),
(4, 4, 20, 'Whatever');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `busstops`
--

CREATE TABLE `busstops` (
  `busstop_id` int(11) NOT NULL,
  `busstop_name` varchar(55) DEFAULT NULL,
  `busstop_phone` int(11) DEFAULT NULL,
  `fk_city_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `busstops`
--

INSERT INTO `busstops` (`busstop_id`, `busstop_name`, `busstop_phone`, `fk_city_id`) VALUES
(1, 'Busstop1', 234561, 1),
(2, 'Busstop2', 234562, 2),
(3, 'Busstop3', 234563, 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `city`
--

CREATE TABLE `city` (
  `city_id` int(11) NOT NULL,
  `city_name` varchar(55) DEFAULT NULL,
  `fk_street_id` int(11) DEFAULT NULL,
  `fk_zip_code_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `city`
--

INSERT INTO `city` (`city_id`, `city_name`, `fk_street_id`, `fk_zip_code_id`) VALUES
(1, 'City1', 1, 2),
(2, 'City2', 2, 2),
(3, 'City3', 1, 4),
(4, 'City4', 4, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `driver`
--

CREATE TABLE `driver` (
  `driver_id` int(11) NOT NULL,
  `first_name` varchar(55) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `phone_nr` int(11) DEFAULT NULL,
  `address` varchar(55) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `driver`
--

INSERT INTO `driver` (`driver_id`, `first_name`, `last_name`, `age`, `phone_nr`, `address`) VALUES
(1, 'Hubert', 'Schmidt', 45, 1345, 'SomeStr. 45'),
(2, 'Gerlinde', 'Hauser', 27, 1346, 'Whateverstr. 37'),
(3, 'Hans', 'Otto', 37, 1347, 'Goodtolivestr.48'),
(4, 'Sonja', 'Doe', 28, 1348, 'Wherevershelives 98');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `routes`
--

CREATE TABLE `routes` (
  `routes_id` int(11) NOT NULL,
  `route_name` varchar(55) DEFAULT NULL,
  `fk_bus_id` int(11) DEFAULT NULL,
  `distance` int(11) DEFAULT NULL,
  `start_Route` time DEFAULT NULL,
  `end_Route` time DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `routes`
--

INSERT INTO `routes` (`routes_id`, `route_name`, `fk_bus_id`, `distance`, `start_Route`, `end_Route`) VALUES
(1, 'Route 1', 1, 50, '09:10:00', '09:30:00'),
(2, 'Route 2', 2, 100, '10:00:00', '11:00:00'),
(3, 'Route 3', 3, 25, '09:40:00', '10:00:00');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `routes_connection`
--

CREATE TABLE `routes_connection` (
  `route_conn_id` tinyint(5) NOT NULL,
  `fk_routes_id` int(11) DEFAULT NULL,
  `fk_busstop_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `routes_connection`
--

INSERT INTO `routes_connection` (`route_conn_id`, `fk_routes_id`, `fk_busstop_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `street`
--

CREATE TABLE `street` (
  `street_id` int(11) NOT NULL,
  `street_name` varchar(55) DEFAULT NULL,
  `street_number` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `street`
--

INSERT INTO `street` (`street_id`, `street_name`, `street_number`) VALUES
(1, 'Schwarzenberstrasse', 123),
(2, 'Königsweg', 15),
(3, 'Bonygasse', 29),
(4, 'Anotherstreet', 15);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `zip_code`
--

CREATE TABLE `zip_code` (
  `zip_code_id` int(11) NOT NULL,
  `zip_number` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `zip_code`
--

INSERT INTO `zip_code` (`zip_code_id`, `zip_number`) VALUES
(1, 1010),
(2, 1020),
(3, 1030),
(4, 1040),
(5, 1050),
(6, 1060);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `bus`
--
ALTER TABLE `bus`
  ADD PRIMARY KEY (`bus_id`),
  ADD KEY `fk_driver_id` (`fk_driver_id`);

--
-- Indizes für die Tabelle `busstops`
--
ALTER TABLE `busstops`
  ADD PRIMARY KEY (`busstop_id`),
  ADD KEY `fk_city_id` (`fk_city_id`);

--
-- Indizes für die Tabelle `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`city_id`),
  ADD KEY `fk_street_id` (`fk_street_id`),
  ADD KEY `fk_zip_code_id` (`fk_zip_code_id`);

--
-- Indizes für die Tabelle `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`driver_id`);

--
-- Indizes für die Tabelle `routes`
--
ALTER TABLE `routes`
  ADD PRIMARY KEY (`routes_id`),
  ADD KEY `fk_bus_id` (`fk_bus_id`);

--
-- Indizes für die Tabelle `routes_connection`
--
ALTER TABLE `routes_connection`
  ADD PRIMARY KEY (`route_conn_id`),
  ADD KEY `fk_routes_id` (`fk_routes_id`),
  ADD KEY `fk_busstop_id` (`fk_busstop_id`);

--
-- Indizes für die Tabelle `street`
--
ALTER TABLE `street`
  ADD PRIMARY KEY (`street_id`);

--
-- Indizes für die Tabelle `zip_code`
--
ALTER TABLE `zip_code`
  ADD PRIMARY KEY (`zip_code_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `routes`
--
ALTER TABLE `routes`
  MODIFY `routes_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `routes_connection`
--
ALTER TABLE `routes_connection`
  MODIFY `route_conn_id` tinyint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `street`
--
ALTER TABLE `street`
  MODIFY `street_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `zip_code`
--
ALTER TABLE `zip_code`
  MODIFY `zip_code_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
