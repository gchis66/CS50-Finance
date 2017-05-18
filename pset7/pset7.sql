-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 31, 2017 at 06:17 AM
-- Server version: 5.5.50-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `pset7`
--

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE IF NOT EXISTS `history` (
  `id` int(10) unsigned NOT NULL,
  `transaction` varchar(4) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `symbol` varchar(4) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `shares` int(10) unsigned NOT NULL,
  `price` decimal(64,5) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `time` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`id`, `transaction`, `timestamp`, `symbol`, `shares`, `price`) VALUES
(13, 'SELL', '2017-03-31 05:44:32', 'AAPL', 4, 143.93000);

-- --------------------------------------------------------

--
-- Table structure for table `portfoliotable`
--

CREATE TABLE IF NOT EXISTS `portfoliotable` (
  `id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `symbol` varchar(5) NOT NULL,
  `shares` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`,`symbol`),
  UNIQUE KEY `symbol` (`symbol`),
  UNIQUE KEY `symbol_2` (`symbol`),
  KEY `userid` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `portfoliotable`
--

INSERT INTO `portfoliotable` (`id`, `user_id`, `symbol`, `shares`) VALUES
(0, 13, 'GOOG', 3),
(0, 13, 'MSFT', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `hash` varchar(255) NOT NULL,
  `cash` decimal(65,4) unsigned NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `hash`, `cash`) VALUES
(1, 'andi', '$2y$10$c.e4DK7pVyLT.stmHxgAleWq4yViMmkwKz3x8XCo4b/u3r8g5OTnS', 10000.0000),
(2, 'caesar', '$2y$10$0p2dlmu6HnhzEMf9UaUIfuaQP7tFVDMxgFcVs0irhGqhOxt6hJFaa', 10000.0000),
(3, 'eli', '$2y$10$COO6EnTVrCPCEddZyWeEJeH9qPCwPkCS0jJpusNiru.XpRN6Jf7HW', 10000.0000),
(4, 'hdan', '$2y$10$o9a4ZoHqVkVHSno6j.k34.wC.qzgeQTBHiwa3rpnLq7j2PlPJHo1G', 10000.0000),
(5, 'jason', '$2y$10$ci2zwcWLJmSSqyhCnHKUF.AjoysFMvlIb1w4zfmCS7/WaOrmBnLNe', 10000.0000),
(6, 'john', '$2y$10$dy.LVhWgoxIQHAgfCStWietGdJCPjnNrxKNRs5twGcMrQvAPPIxSy', 10000.0000),
(7, 'levatich', '$2y$10$fBfk7L/QFiplffZdo6etM.096pt4Oyz2imLSp5s8HUAykdLXaz6MK', 10000.0000),
(8, 'rob', '$2y$10$3pRWcBbGdAdzdDiVVybKSeFq6C50g80zyPRAxcsh2t5UnwAkG.I.2', 10000.0000),
(9, 'skroob', '$2y$10$395b7wODm.o2N7W5UZSXXuXwrC0OtFB17w4VjPnCIn/nvv9e4XUQK', 10000.0000),
(10, 'zamyla', '$2y$10$UOaRF0LGOaeHG4oaEkfO4O7vfI34B1W23WqHr9zCpXL68hfQsS3/e', 10000.0000),
(11, 'joe', '$2y$10$0xWJ8OYreAr7DrTV/0lZqeXJlJNg.DyyorwFIgAqUr.1v/8HiBfRy', 10000.0000),
(13, 'gregory', '$2y$10$4jcCd5q9Oj18uqZFJLHSeuWvSv9gbP.CILR4EeegolLpygJ3poOye', 11788.8100);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `portfoliotable`
--
ALTER TABLE `portfoliotable`
  ADD CONSTRAINT `portfoliotable_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
