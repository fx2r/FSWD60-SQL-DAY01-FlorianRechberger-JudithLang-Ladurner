-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Erstellungszeit: 12. Mrz 2019 um 09:27
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
-- Datenbank: `judithco_books_judith`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `authors`
--

CREATE TABLE `authors` (
  `author_id` int(11) NOT NULL,
  `author_name` varchar(100) DEFAULT NULL,
  `author_contact` varchar(100) DEFAULT NULL,
  `author_birth_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `authors`
--

INSERT INTO `authors` (`author_id`, `author_name`, `author_contact`, `author_birth_date`) VALUES
(1, 'J.K.Rowling', 'jkrowling@email.com', '1969-10-23'),
(2, 'John Grisham', 'johngrisham@email.com', '1950-04-26'),
(3, 'Tim Ferriss', 'timferriss@email.com', '1973-05-23'),
(4, 'Paulo Coello', 'paulocoello@email.com', '1947-08-24');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `books`
--

CREATE TABLE `books` (
  `book_id` int(11) NOT NULL,
  `fk_author_id` int(11) DEFAULT NULL,
  `fk_pub_id` int(11) DEFAULT NULL,
  `fk_genre_id` int(11) DEFAULT NULL,
  `fk_shop_ind` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `page_count` int(11) DEFAULT NULL,
  `chapter_count` int(11) DEFAULT NULL,
  `book_language` varchar(100) DEFAULT NULL,
  `year_pub` year(4) DEFAULT NULL,
  `date_buy` date DEFAULT NULL,
  `date_read_start` date DEFAULT NULL,
  `date_read_end` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `books`
--

INSERT INTO `books` (`book_id`, `fk_author_id`, `fk_pub_id`, `fk_genre_id`, `fk_shop_ind`, `title`, `page_count`, `chapter_count`, `book_language`, `year_pub`, `date_buy`, `date_read_start`, `date_read_end`) VALUES
(1, 1, 2, 1, 1, 'Chamber of Secrets', 340, 26, 'eng', 1991, '2018-12-21', '2018-12-21', '2019-01-07'),
(2, 2, 1, 2, 3, 'Jury', 350, 30, 'de', 1986, '2018-07-07', '2018-07-07', '2018-08-08'),
(3, 1, 2, 1, 1, 'Half Blood Prince', 870, 67, 'eng', 2001, '2010-10-30', '2017-10-20', '2017-11-04');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `genre`
--

CREATE TABLE `genre` (
  `genre_id` int(11) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `sub_genre` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `genre`
--

INSERT INTO `genre` (`genre_id`, `description`, `sub_genre`) VALUES
(1, 'Fantasy', 'Teen'),
(2, 'Cime', 'legal');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `publisher`
--

CREATE TABLE `publisher` (
  `pub_id` int(11) NOT NULL,
  `pub_name` varchar(100) DEFAULT NULL,
  `contact_person` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `year_est` year(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `publisher`
--

INSERT INTO `publisher` (`pub_id`, `pub_name`, `contact_person`, `address`, `year_est`) VALUES
(1, 'Verlag Peter Erd', 'Hans Peter', 'Verlag-Erd-Str 112', 1984),
(2, 'Bloomsbury', 'Jane Doe', 'Londonstr. 223', 1986);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `shop`
--

CREATE TABLE `shop` (
  `shop_id` int(11) NOT NULL,
  `shop_name` varchar(100) DEFAULT NULL,
  `shop_ADDRESS` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `shop`
--

INSERT INTO `shop` (`shop_id`, `shop_name`, `shop_ADDRESS`) VALUES
(1, 'Amazon', 'amazon.de'),
(2, 'Thalia', 'Mariahilferstrasse'),
(3, 'GoodReads', 'Landstasse');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`author_id`);

--
-- Indizes für die Tabelle `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`book_id`),
  ADD KEY `fk_author_id` (`fk_author_id`),
  ADD KEY `fk_pub_id` (`fk_pub_id`),
  ADD KEY `fk_genre_id` (`fk_genre_id`),
  ADD KEY `fk_shop_ind` (`fk_shop_ind`);

--
-- Indizes für die Tabelle `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`genre_id`);

--
-- Indizes für die Tabelle `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`pub_id`);

--
-- Indizes für die Tabelle `shop`
--
ALTER TABLE `shop`
  ADD PRIMARY KEY (`shop_id`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`fk_author_id`) REFERENCES `authors` (`author_id`),
  ADD CONSTRAINT `books_ibfk_2` FOREIGN KEY (`fk_pub_id`) REFERENCES `publisher` (`pub_id`),
  ADD CONSTRAINT `books_ibfk_3` FOREIGN KEY (`fk_genre_id`) REFERENCES `genre` (`genre_id`),
  ADD CONSTRAINT `books_ibfk_4` FOREIGN KEY (`fk_shop_ind`) REFERENCES `shop` (`shop_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
