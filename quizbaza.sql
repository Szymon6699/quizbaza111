-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 26 Paź 2022, 15:41
-- Wersja serwera: 10.4.24-MariaDB
-- Wersja PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `quizbaza`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `answers`
--

CREATE TABLE `answers` (
  `id` int(11) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  `questions_id` int(11) NOT NULL,
  `is_right` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `answers`
--

INSERT INTO `answers` (`id`, `description`, `questions_id`, `is_right`) VALUES
(1, '4', 1, '1'),
(2, 'kongo', 1, '0'),
(3, 'rafal', 1, '0'),
(4, '16', 2, '1'),
(5, '17', 2, '0'),
(6, 'adam', 2, '0'),
(7, 'rafal', 3, '1'),
(8, 'platyniarz', 3, '0'),
(9, 'adam', 3, '0'),
(10, 'super', 4, '1'),
(11, 'fajne', 4, '1'),
(12, 'przyjazne', 4, '1'),
(13, 'gorsze od innych szkol', 4, '0'),
(14, 'nudne', 4, '0'),
(15, 'czarny', 5, '1'),
(16, 'bialy', 5, '1'),
(17, 'niebieski', 5, '1'),
(18, 'zolty', 5, '0'),
(19, 'fioletowy', 5, '0'),
(20, '2', 6, '1'),
(21, '2-0', 6, '1'),
(22, '8', 6, '0'),
(23, '2137', 6, '0'),
(24, '20', 7, '1'),
(25, '20-0', 7, '1'),
(26, '12', 7, '0'),
(27, '2022', 7, '0'),
(28, '10', 8, '1'),
(29, '10-0', 8, '1'),
(30, '222', 8, '0'),
(31, '2112', 8, '0'),
(32, '24', 9, '1'),
(33, '24-0', 9, '1'),
(34, '20', 9, '0'),
(35, '4', 9, '0'),
(36, 'bezsensu', 10, '0'),
(37, 'nudny', 10, '0'),
(38, 'najlepszy', 10, '1'),
(39, 'dobrze zrobiony', 10, '1');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `content` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `questions`
--

INSERT INTO `questions` (`id`, `content`) VALUES
(1, '2+2'),
(2, '8+8'),
(3, 'rafal to?'),
(4, 'ZSP Witkowo jest?'),
(5, 'Jaki kolor?'),
(6, '1+1?'),
(7, '10+10?'),
(8, '5+5?'),
(9, '12+12?'),
(10, 'ten quiz jest?');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `students_cheks`
--

CREATE TABLE `students_cheks` (
  `id` int(11) NOT NULL,
  `students_id` int(11) NOT NULL,
  `tests_id` int(11) NOT NULL,
  `questions_id` int(11) NOT NULL,
  `answers_id` int(11) NOT NULL,
  `answers_questions_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `tests`
--

CREATE TABLE `tests` (
  `id` int(11) NOT NULL,
  `data` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `tests_has_questions`
--

CREATE TABLE `tests_has_questions` (
  `tests_id` int(11) NOT NULL,
  `questions_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `tests_has_students`
--

CREATE TABLE `tests_has_students` (
  `tests_id` int(11) NOT NULL,
  `students_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`,`questions_id`),
  ADD KEY `fk_answers_questions` (`questions_id`);

--
-- Indeksy dla tabeli `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `students_cheks`
--
ALTER TABLE `students_cheks`
  ADD PRIMARY KEY (`id`,`students_id`,`tests_id`,`questions_id`,`answers_id`,`answers_questions_id`),
  ADD KEY `fk_students_cheks_students1` (`students_id`),
  ADD KEY `fk_students_cheks_tests1` (`tests_id`),
  ADD KEY `fk_students_cheks_questions1` (`questions_id`),
  ADD KEY `fk_students_cheks_answers1` (`answers_id`,`answers_questions_id`);

--
-- Indeksy dla tabeli `tests`
--
ALTER TABLE `tests`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `tests_has_questions`
--
ALTER TABLE `tests_has_questions`
  ADD PRIMARY KEY (`tests_id`,`questions_id`),
  ADD KEY `fk_tests_has_questions_questions1` (`questions_id`);

--
-- Indeksy dla tabeli `tests_has_students`
--
ALTER TABLE `tests_has_students`
  ADD PRIMARY KEY (`tests_id`,`students_id`),
  ADD KEY `fk_tests_has_students_students1` (`students_id`);

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `answers`
--
ALTER TABLE `answers`
  ADD CONSTRAINT `fk_answers_questions` FOREIGN KEY (`questions_id`) REFERENCES `questions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `students_cheks`
--
ALTER TABLE `students_cheks`
  ADD CONSTRAINT `fk_students_cheks_answers1` FOREIGN KEY (`answers_id`,`answers_questions_id`) REFERENCES `answers` (`id`, `questions_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_students_cheks_questions1` FOREIGN KEY (`questions_id`) REFERENCES `questions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_students_cheks_students1` FOREIGN KEY (`students_id`) REFERENCES `students` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_students_cheks_tests1` FOREIGN KEY (`tests_id`) REFERENCES `tests` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `tests_has_questions`
--
ALTER TABLE `tests_has_questions`
  ADD CONSTRAINT `fk_tests_has_questions_questions1` FOREIGN KEY (`questions_id`) REFERENCES `questions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tests_has_questions_tests1` FOREIGN KEY (`tests_id`) REFERENCES `tests` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `tests_has_students`
--
ALTER TABLE `tests_has_students`
  ADD CONSTRAINT `fk_tests_has_students_students1` FOREIGN KEY (`students_id`) REFERENCES `students` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tests_has_students_tests1` FOREIGN KEY (`tests_id`) REFERENCES `tests` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
