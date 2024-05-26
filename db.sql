-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 26, 2024 at 09:20 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `filmbuzz`
--

-- --------------------------------------------------------

--
-- Table structure for table `direktor`
--

CREATE TABLE `direktor` (
  `id` int(6) NOT NULL,
  `ime` varchar(255) NOT NULL,
  `priimek` varchar(255) NOT NULL,
  `datum_rojstva` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `direktor`
--

INSERT INTO `direktor` (`id`, `ime`, `priimek`, `datum_rojstva`) VALUES
(1, 'Klemen', 'Parkelj', '2003-07-20'),
(6, 'Christopher', 'Nolan', '1970-07-30'),
(11, 'Steven ', 'Spielberg', '1946-12-18'),
(12, 'Ajda', 'Tavčar', '2005-12-18'),
(13, 'Neill', 'Blomkamp', '1979-09-17'),
(14, 'Miha', 'Hočevar', '1963-05-22'),
(15, 'Phyllida', 'Lloyd', '1957-06-17');

-- --------------------------------------------------------

--
-- Table structure for table `film`
--

CREATE TABLE `film` (
  `id` int(6) NOT NULL,
  `naslov` varchar(255) NOT NULL,
  `direktorID` int(6) NOT NULL,
  `leto` int(4) NOT NULL,
  `slika` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `film`
--

INSERT INTO `film` (`id`, `naslov`, `direktorID`, `leto`, `slika`) VALUES
(15, 'Grand Turismo', 13, 2023, './uploads/klemenp9501716642600.jpg'),
(17, 'Gremo Mi Po Svoje', 14, 2010, './uploads/klemenp9501716642728.jpg'),
(18, 'Mamma mia', 15, 2008, './uploads/klemenp9501716642950.jpg'),
(19, 'Oppenheimer', 6, 2023, './uploads/admin1716740022.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `ocena`
--

CREATE TABLE `ocena` (
  `id` int(8) NOT NULL,
  `ocena` int(1) NOT NULL,
  `opis` varchar(2500) DEFAULT NULL,
  `userID` int(6) NOT NULL,
  `filmID` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ocena`
--

INSERT INTO `ocena` (`id`, `ocena`, `opis`, `userID`, `filmID`) VALUES
(1, 5, 'Super film.', 8, 15),
(2, 3, 'Mid', 8, 15),
(3, 5, 'Woop woop&#13;&#10;', 8, 15),
(4, 2, 'Below mid.', 8, 15),
(5, 4, '&#60;script&#62;&#13;&#10;        // Prikaže opozorilo z besedilom &#34;Pozdravljen, svet!&#34;&#13;&#10;        alert(&#34;Pozdravljen, svet!&#34;);&#13;&#10;    &#60;/script&#62;', 8, 15),
(7, 5, 'Klasika', 8, 18),
(8, 4, 'Nekoliko cringe.', 8, 17),
(9, 5, 'Ja bengrčk ne?', 8, 15),
(10, 5, 'Tudi meni je bil film zelo všeč.', 11, 15),
(11, 5, '&#13;&#10;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam faucibus sit amet dui sit amet fermentum. Aenean sit amet bibendum mauris. Donec a volutpat nunc. Aenean lectus magna, malesuada nec sem et, euismod luctus elit. Vestibulum a dui orci. Donec dictum venenatis nunc, et mollis neque posuere non. Phasellus facilisis ligula ac massa posuere cursus. Pellentesque condimentum sed magna in efficitur. Aenean eu sagittis tortor. Maecenas ullamcorper urna quis eros molestie placerat. Sed dignissim augue id convallis pretium. Morbi tristique ipsum sed vehicula convallis. Mauris bibendum pharetra leo. Vivamus ut erat vestibulum, aliquam nulla et, convallis dui.&#13;&#10;&#13;&#10;Quisque vitae diam ut ex scelerisque commodo. Etiam id malesuada enim. Sed dignissim nibh lectus, vel pretium augue blandit nec. Duis ut turpis ac justo cursus maximus vel sed lorem. Donec vitae odio consectetur, vulputate tellus id, fermentum sapien. Nam at quam urna. In volutpat feugiat magna, eget ornare ante lobortis eu. Quisque magna quam, vestibulum sed mauris ac, euismod dictum sem. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam in porttitor ante. Vestibulum id mi at lectus laoreet sagittis iaculis rhoncus purus. Nullam ornare orci quis nunc rutrum, sed scelerisque sapien vestibulum.', 11, 19);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(6) NOT NULL,
  `username` varchar(350) NOT NULL,
  `password` varchar(350) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`) VALUES
(8, 'user', '$2y$10$2LtHggazeif2Q53gWE2hmuHLsOSAS..EupLYvH0kCtyuTG5jtmkFy'),
(11, 'klemenp950', '$2y$10$2/3H8oHfbKH1EvnsOF.5guCJt3ZggPOoPtbsPSrjEycW62UG4Qjqa'),
(12, 'admin', '$2y$10$yzTplcBDHVXI7mXfbovMrekmYmcch/rB0k//Tyskyv01XdtJ1L5wm'),
(13, 'profesor', '$2y$10$VzxrhBynV8q5bsLcrI8t/eCYp.iz3h1e0Mod7sRNb5jdHt2VtC9d2');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `direktor`
--
ALTER TABLE `direktor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`id`),
  ADD KEY `direktorID` (`direktorID`);

--
-- Indexes for table `ocena`
--
ALTER TABLE `ocena`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ocena_ibfk_1` (`filmID`),
  ADD KEY `ocena_ibfk_2` (`userID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `direktor`
--
ALTER TABLE `direktor`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `film`
--
ALTER TABLE `film`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `ocena`
--
ALTER TABLE `ocena`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `film`
--
ALTER TABLE `film`
  ADD CONSTRAINT `film_ibfk_1` FOREIGN KEY (`direktorID`) REFERENCES `direktor` (`id`);

--
-- Constraints for table `ocena`
--
ALTER TABLE `ocena`
  ADD CONSTRAINT `ocena_ibfk_1` FOREIGN KEY (`filmID`) REFERENCES `film` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ocena_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
