-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 28, 2019 at 06:30 AM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `studentdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `devicedet`
--

CREATE TABLE `devicedet` (
  `loginID` varchar(25) NOT NULL,
  `deviceser` varchar(10) NOT NULL,
  `wardName` varchar(25) NOT NULL,
  `schoolAuth` varchar(25) NOT NULL,
  `schoolAuthNumber` varchar(10) NOT NULL,
  `schoolAuthEmail` varchar(25) NOT NULL,
  `schoolLat` varchar(10) NOT NULL,
  `schoolLng` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `devicedet`
--

INSERT INTO `devicedet` (`loginID`, `deviceser`, `wardName`, `schoolAuth`, `schoolAuthNumber`, `schoolAuthEmail`, `schoolLat`, `schoolLng`) VALUES
('root', 'a12b34c56d', 'John Doe', 'Mrs. Doe John', '9874566321', 'test@gmail.com', '12.8615', '77.6644');

-- --------------------------------------------------------

--
-- Table structure for table `devicelog`
--

CREATE TABLE `devicelog` (
  `deviceser` varchar(10) NOT NULL,
  `timestamp` varchar(25) NOT NULL,
  `bodytemp` varchar(10) NOT NULL,
  `pulse` varchar(10) NOT NULL,
  `ambienttemp` varchar(10) NOT NULL,
  `ambienthumidity` varchar(10) NOT NULL,
  `COconc` varchar(10) NOT NULL,
  `Smokeconc` varchar(10) NOT NULL,
  `LPGconc` varchar(10) NOT NULL,
  `lat` varchar(10) NOT NULL,
  `lng` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `devicelog`
--

INSERT INTO `devicelog` (`deviceser`, `timestamp`, `bodytemp`, `pulse`, `ambienttemp`, `ambienthumidity`, `COconc`, `Smokeconc`, `LPGconc`, `lat`, `lng`) VALUES
('a12b34c56d', 'Tue Mar 26, 2019 19:46', '38.812', '50', '31', '', '0.00496326', '0.02043459', '0.00765900', '12.8792', '77.5879'),
('a12b34c56d', '27-03-2019 00:18', '38.875', '98', '30', '', '0.00501009', '0.02058341', '0.00771121', '12.8792', '77.5879'),
('a12b34c56d', '27-03-2019 00:19', '38.875', '169', '30', '36', '0.00506044', '0.02074305', '0.00776718', '12.8792', '77.5879'),
('a12b34c56d', '27-03-2019 00:21', '38.875', '237', '31', '36', '0.00504558', '0.02069597', '0.00775068', '12.8792', '77.5879'),
('a12b34c56d', '27-03-2019 21:41', '32.375', '116', '31', '27', '0.00498585', '0.02050641', '0.00768420', '12.8781', '77.6644'),
('a12b34c56d', '27-03-2019 21:44', '32.437', '232', '32', '26', '0.00496326', '0.02043459', '0.00765900', '12.8615', '77.6644');

-- --------------------------------------------------------

--
-- Table structure for table `main`
--

CREATE TABLE `main` (
  `response` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `main`
--

INSERT INTO `main` (`response`) VALUES
('thago'),
('thago'),
('%s'),
('\"Thank you for sending: Maga parameters kodu\"'),
('Vannakam: Maga parameters kodu'),
('Vannakam: Maga parameters kodu'),
('Vannakam: Maga parameters kodu'),
('Vannakam: Maga parameters kodu'),
('This from PHP: Maga parameters kodu'),
('This from PHP: Maga parameters kodu'),
('This from PHP: Maga parameters kodu'),
('This from PHP: Maga parameters kodu'),
('This from PHP: Maga parameters kodu'),
('This from PHP: Maga parameters kodu'),
('This from PHP: Maga parameters kodu'),
('This from PHP: Maga parameters kodu'),
('This from PHP: Maga parameters kodu'),
('This from PHP: Maga parameters kodu'),
('This from PHP: Maga parameters kodu'),
('This from PHP: {\'Smoke\': 0.020434596130316566, \'Location\': (12.8791, 77.5877), \'humidity\': 30.0, \'LP'),
('This from PHP: {\'ambient_temp\': 31.0, \'Location\': (12.8791, 77.5877), \'CO\': 0.004963269307602358, \'L'),
('This from PHP: {\'Pulse\': 54, \'ambient_temp\': 30.0, \'LPG\': 0.008086141251784898, \'humidity\': 28.0, \'S'),
('This from PHP: {\'CO\': 0.004735025382806307, \'LPG\': 0.00740256275238016, \'Smoke\': 0.01970458264426126'),
('This from PHP: {\'CO\': 0.003441635256504875, \'LPG\': 0.005876909928999687, \'Smoke\': 0.0153992689909250'),
('This from PHP: {\'LPG\': 0.008447171043969788, \'humidity\': 28.0, \'CO\': 0.005682919269346933, \'ambient_'),
('This from PHP: {\'LPG\': 0.0076590072479942135, \'humidity\': 28.0, \'CO\': 0.004963269307602358, \'ambient'),
('This from PHP: {\'ambient_temp\': 31.0, \'Smoke\': 0.019906380862527728, \'humidity\': 29.0, \'LPG\': 0.0074'),
('This from PHP: {\'ambient_temp\': 31.0, \'Smoke\': 0.019906380862527728, \'humidity\': 29.0, \'LPG\': 0.0074'),
('This from PHP: {\'Location\': (12.8791, 77.5877), \'Smoke\': 0.02017898851431831, \'Pulse\': 46, \'body_tem'),
('This from PHP: {\'Location\': (12.8791, 77.5877), \'Smoke\': 0.021537694221810323, \'Pulse\': 238, \'body_t'),
('3, \'Smoke\': 0.01807927303448163, \'ambient_temp\': 31.0, \'CO\': 0.0042358451040293245, \'body_temp\': 32.'),
('3, \'Smoke\': 0.01807927303448163, \'ambient_temp\': 31.0, \'CO\': 0.0042358451040293245, \'body_temp\': 32.'),
(': (12.8791, 77.5877), \'Smoke\': 0.020434596130316608, \'body_temp\': 32.375, \'CO\': 0.004963269307602358'),
('070483447951284915, \'Pulse\': 68, \'CO\': 0.004424713602938627, \'body_temp\': 32.437, \'ambient_temp\': 31'),
('070483447951284915, \'Pulse\': 68, \'CO\': 0.004424713602938627, \'body_temp\': 32.437, \'ambient_temp\': 31'),
('070483447951284915, \'Pulse\': 68, \'CO\': 0.004424713602938627, \'body_temp\': 32.437, \'ambient_temp\': 31'),
('\': 32.687, \'ambient_temp\': 31.0, \'CO\': 0.004963269307602338, \'Location\': (12.8791, 77.5877), \'humidi'),
('\': 32.687, \'ambient_temp\': 31.0, \'CO\': 0.0048480025755004265, \'Location\': (12.8791, 77.5877), \'humid'),
('\': 32.687, \'ambient_temp\': 31.0, \'CO\': 0.005077506121461522, \'Location\': (12.8791, 77.5877), \'humidi'),
('\': 32.687, \'ambient_temp\': 31.0, \'CO\': 0.005077506121461522, \'Location\': (12.8791, 77.5877), \'humidi'),
(': 29.0, \'body_temp\': 32.75, \'Location\': (12.8791, 77.5877), \'Smoke\': 0.020434596130316608, \'CO\': 0.0'),
(': 29.0, \'body_temp\': 32.75, \'Location\': (12.8791, 77.5877), \'Smoke\': 0.020434596130316608, \'CO\': 0.0'),
(': 29.0, \'body_temp\': 32.75, \'Location\': (12.8791, 77.5877), \'Smoke\': 0.020434596130316608, \'CO\': 0.0'),
('.020434596130316608, \'Pulse\': 29, \'body_temp\': 32.562, \'Location\': (12.8791, 77.5877), \'CO\': 0.00496'),
('.020434596130316608, \'Pulse\': 29, \'body_temp\': 32.562, \'Location\': (12.8791, 77.5877), \'CO\': 0.00496'),
('.020434596130316608, \'Pulse\': 29, \'body_temp\': 32.562, \'Location\': (12.8791, 77.5877), \'CO\': 0.00496'),
('.02005464489626352, \'Pulse\': 73, \'body_temp\': 32.5, \'Location\': (12.8791, 77.5877), \'CO\': 0.00484417'),
('0791492475792467, \'humidity\': 29.0, \'ambient_temp\': 31.0, \'Smoke\': 0.021164773118448266, \'Pulse\': 27'),
('0791492475792467, \'humidity\': 29.0, \'ambient_temp\': 31.0, \'Smoke\': 0.021164773118448266, \'Pulse\': 27'),
('.01812535302730946, \'Location\': (12.8791, 77.5877), \'LPG\': 0.006845688360596366, \'body_temp\': 32.625'),
('4772119479932415, \'ambient_temp\': 31.0, \'Pulse\': 77, \'body_temp\': 33.125, \'humidity\': 30.0, \'Locatio'),
('42358451040293245, \'ambient_temp\': 31.0, \'Pulse\': 84, \'body_temp\': 33.125, \'humidity\': 29.0, \'Locati'),
(': (12.8791, 77.5877), \'body_temp\': 33.187, \'ambient_temp\': 31.0, \'CO\': 0.005066885224044167, \'Pulse\''),
(': (12.8791, 77.5877), \'body_temp\': 33.25, \'ambient_temp\': 31.0, \'CO\': 0.004963269307602358, \'Pulse\':'),
(': (12.8791, 77.5877), \'body_temp\': 33.25, \'ambient_temp\': 31.0, \'CO\': 0.004963269307602358, \'Pulse\':'),
(': (12.8791, 77.5877), \'ambient_temp\': 31.0, \'LPG\': 0.007631280070903256, \'Smoke\': 0.0203555845490833'),
(': (12.8791, 77.5877), \'ambient_temp\': 31.0, \'LPG\': 0.007771372893354482, \'Smoke\': 0.0207549931631901'),
(': (12.8791, 77.5877), \'ambient_temp\': 31.0, \'LPG\': 0.0076590072479942135, \'Smoke\': 0.020434596130316'),
('\': 31.937, \'LPG\': 0.006851983756473417, \'Smoke\': 0.018143158404875834, \'Pulse\': 56, \'Location\': (12.'),
('\': 31.625, \'CO\': 0.004879432400850603, \'Pulse\': 161, \'LPG\': 0.007565198866420338, \'ambient_temp\': 31'),
('\': 31.625, \'CO\': 0.004963269307602358, \'Pulse\': 71, \'LPG\': 0.0076590072479942135, \'ambient_temp\': 31'),
('emp\': 31.0, \'body_temp\': 31.437, \'Smoke\': 0.018082515551678432, \'LPG\': 0.006830540820052525, \'Locati'),
('emp\': 31.0, \'body_temp\': 31.437, \'Smoke\': 0.020434596130316608, \'LPG\': 0.0076590072479942135, \'Locat'),
('emp\': 31.0, \'body_temp\': 31.437, \'Smoke\': 0.022878791960479435, \'LPG\': 0.008513488875898168, \'Locati'),
('emp\': 31.0, \'Location\': (12.8791, 77.5877), \'Pulse\': 43, \'CO\': 0.004963269307602358, \'humidity\': 33.'),
('078910587405551, \'Pulse\': 50, \'ambient_temp\': 30.0, \'Smoke\': 0.02109661034185349, \'humidity\': 30.0, '),
('06928992003297271, \'Pulse\': 50, \'ambient_temp\': 31.0, \'Smoke\': 0.018361052154418696, \'humidity\': 30.'),
('07370874971540358, \'Pulse\': 50, \'ambient_temp\': 31.0, \'Smoke\': 0.01961449635796877, \'humidity\': 30.0'),
('07582680449017987, \'Pulse\': 50, \'ambient_temp\': 31.0, \'Smoke\': 0.020217141941114836, \'humidity\': 30.'),
('07737554821320728, \'Pulse\': 50, \'ambient_temp\': 31.0, \'Smoke\': 0.02065853158727334, \'humidity\': 30.0'),
('4963269307602358, \'Location\': (12.8791, 77.5877), \'body_temp\': 31.0, \'ambient_temp\': 31.0, \'Smoke\': '),
('4228217743420585, \'Location\': (12.8791, 77.5877), \'body_temp\': 31.0, \'ambient_temp\': 30.0, \'Smoke\': '),
('3984110517275166, \'Location\': (12.8791, 77.5877), \'body_temp\': 31.0, \'ambient_temp\': 31.0, \'Smoke\': '),
('4963269307602358, \'Location\': (12.8791, 77.5877), \'body_temp\': 31.0, \'ambient_temp\': 31.0, \'Smoke\': '),
('emp\': 30.0, \'LPG\': 0.0076350079149866785, \'Smoke\': 0.020366206305514098, \'humidity\': 29.0, \'body_tem'),
('emp\': 30.0, \'LPG\': 0.007683221845849638, \'Smoke\': 0.020503614195597836, \'humidity\': 29.0, \'body_temp'),
('asd'),
('This from PHP: GET_DATA'),
('This from PHP: GET_DATA'),
('This from PHP: GET_DATA'),
('This from PHP: GET_DATA'),
('This from PHP: GET_DATA'),
('This from PHP: GET_DATA'),
('.019894694001962514, \'LPG\': 0.0074694039845076676, \'CO\': 0.0047942294111694385, \'Location\': (12.8791'),
('.020434596130316608, \'LPG\': 0.0076590072479942135, \'CO\': 0.004963269307602358, \'Location\': (12.8791,'),
('.025474413795283816, \'LPG\': 0.009414552371398252, \'CO\': 0.006601828794411152, \'Location\': (12.8791, '),
('.020434596130316608, \'LPG\': 0.0076590072479942135, \'CO\': 0.004963269307602358, \'Location\': (12.8791,'),
('.020434596130316608, \'LPG\': 0.0076590072479942135, \'CO\': 0.004963269307602358, \'Location\': (12.8791,'),
('.020434596130316608, \'LPG\': 0.0076590072479942135, \'CO\': 0.004963269307602358, \'Location\': (12.8791,'),
('.020434596130316608, \'LPG\': 0.0076590072479942135, \'CO\': 0.004963269307602358, \'Location\': (12.8791,'),
('ntBoi1: {\'ambient_temp\': 33.0, \'body_temp\': 32.125, \'humidity\': 15.0, \'CO\': 0.005011029931300725, \'L'),
('ntBoi1: {\'ambient_temp\': 33.0, \'body_temp\': 32.187, \'humidity\': 15.0, \'CO\': 0.004963269307602338, \'L'),
('tBoi1:{\'humidity\': 14.0, \'LPG\': 0.007998556831999069, \'Location\': (12.8791, 77.5877), \'body_temp\': 3'),
('tBoi1:{\'ambient_temp\': 33.0, \'Pulse\': 50, \'Smoke\': 0.020434596130316608, \'humidity\': 13.0, \'Location'),
('tBoi1:{\"Pulse\": 50, \"Location\": (12.8791, 77.5877), \"Smoke\": 0.02287060912627632, \"LPG\": 0.008510638'),
('tBoi1:{\"humidity\": 12.0, \"body_temp\": 32.375, \"ambient_temp\": 33.0, \"loc_lng\": 77.5877, \"CO\": 0.0041'),
('tBoi1:{\"humidity\": 14.0, \"body_temp\": 32.312, \"ambient_temp\": 33.0, \"loc_lng\": 77.5877, \"CO\": 0.0049'),
('tBoi1:{\"body_temp\": 32.312, \"LPG\": 0.039546866206550506, \"loc_lng\": 77.5877, \"loc_lat\": 12.8791, \"am'),
('tBoi1:{\"body_temp\": 32.312, \"LPG\": 0.039546866206550506, \"loc_lng\": 77.5877, \"loc_lat\": 12.8791, \"am'),
('tBoi1:{\"Pulse\": 50, \"body_temp\": 32.25, \"LPG\": 0.0032628984696060326, \"ambient_temp\": 33.0, \"CO\": 0.'),
('tBoi1:{\"Pulse\": 50, \"body_temp\": 32.25, \"LPG\": 0.0032628984696060326, \"ambient_temp\": 33.0, \"CO\": 0.'),
('tBoi1:{\"Pulse\": 50, \"body_temp\": 32.25, \"LPG\": 0.0032628984696060326, \"ambient_temp\": 33.0, \"CO\": 0.'),
('tBoi1:{\"Pulse\": 50, \"body_temp\": 32.25, \"LPG\": 0.0032628984696060326, \"ambient_temp\": 33.0, \"CO\": 0.'),
('tBoi1:{\"Pulse\": 50, \"body_temp\": 32.25, \"LPG\": 0.039546866206550506, \"ambient_temp\": 33.0, \"CO\": 0.0'),
('tBoi1:{\"Smoke\": 0.025160344319462593, \"humidity\": 14.0, \"loc_lat\": 12.8791, \"ambient_temp\": 33.0, \"b'),
('tBoi1:{\"Smoke\": 0.025160344319462593, \"humidity\": 14.0, \"loc_lat\": 12.8791, \"ambient_temp\": 33.0, \"b'),
('tBoi1:{\"Smoke\": 0.025160344319462593, \"humidity\": 14.0, \"loc_lat\": 12.8791, \"ambient_temp\": 33.0, \"b'),
('tBoi1:{\"Smoke\": 0.014762863989698128, \"humidity\": 15.0, \"loc_lat\": 12.8791, \"ambient_temp\": 33.0, \"b'),
('tBoi1:{\"Smoke\": 0.020434596130316608, \"humidity\": 16.0, \"loc_lat\": 12.8791, \"ambient_temp\": 33.0, \"b'),
('tBoi1:{\"Smoke\": 0.010882170537287877, \"humidity\": 15.0, \"loc_lat\": 12.8791, \"ambient_temp\": 33.0, \"b'),
('tBoi1:{\"Smoke\": 0.020063018105548492, \"humidity\": 14.0, \"loc_lat\": 12.8791, \"ambient_temp\": 33.0, \"b'),
('tBoi1:{\"Smoke\": 0.020434596130316608, \"humidity\": 13.0, \"loc_lat\": 12.8791, \"ambient_temp\": 34.0, \"b'),
('tBoi1:{\"Smoke\": 0.020434596130316608, \"humidity\": 15.0, \"loc_lat\": 12.8791, \"ambient_temp\": 34.0, \"b'),
('tBoi1:{\"Pulse\": 50, \"loc_lng\": 77.5877, \"Smoke\": 0.020434596130316608, \"body_temp\": 32.937, \"CO\": 0.'),
('tBoi1:{\"Pulse\": 50, \"loc_lng\": 77.5877, \"Smoke\": 0.020434596130316608, \"body_temp\": 32.937, \"CO\": 0.'),
('tBoi1:{\"Pulse\": 50, \"loc_lng\": 77.5877, \"Smoke\": 0.020616315844495192, \"body_temp\": 32.937, \"CO\": 0.'),
('tBoi1:{\"Pulse\": 50, \"loc_lng\": 77.5877, \"Smoke\": 0.02116076274359542, \"body_temp\": 32.937, \"CO\": 0.0'),
('tBoi1:{\"Pulse\": 50, \"loc_lng\": 77.5877, \"Smoke\": 0.02008098767975748, \"body_temp\": 32.937, \"CO\": 0.0'),
('tBoi1:{\"Pulse\": 50, \"loc_lng\": 77.5877, \"Smoke\": 0.020434596130316608, \"body_temp\": 32.937, \"CO\": 0.'),
('tBoi1:{\"Pulse\": 50, \"loc_lng\": 77.5877, \"Smoke\": 0.020434596130316608, \"body_temp\": 32.937, \"CO\": 0.'),
('tBoi1:{\"Pulse\": 50, \"loc_lng\": 77.5877, \"Smoke\": 0.020434596130316608, \"body_temp\": 32.812, \"CO\": 0.'),
('tBoi1:{\"Pulse\": 50, \"loc_lng\": 77.5877, \"Smoke\": 0.020434596130316566, \"body_temp\": 32.875, \"CO\": 0.'),
('tBoi1:{\"Pulse\": 50, \"loc_lng\": 77.5877, \"Smoke\": 0.020434596130316566, \"body_temp\": 32.875, \"CO\": 0.'),
('tBoi1:{\"Pulse\": 50, \"loc_lng\": 77.5877, \"Smoke\": 0.020434596130316608, \"body_temp\": 32.812, \"CO\": 0.'),
('tBoi1:{\"Pulse\": 50, \"loc_lng\": 77.5877, \"Smoke\": 0.020434596130316608, \"body_temp\": 32.875, \"CO\": 0.'),
('tBoi1:{\"Pulse\": 50, \"loc_lng\": 77.5877, \"Smoke\": 0.04408823053582121, \"body_temp\": 32.875, \"CO\": 0.0'),
('tBoi1:{\"Pulse\": 50, \"loc_lng\": 77.5877, \"Smoke\": 0.01952271437754297, \"body_temp\": 32.937, \"CO\": 0.0'),
('tBoi1:{\"Pulse\": 50, \"loc_lng\": 77.5877, \"Smoke\": 0.020434596130316608, \"body_temp\": 32.937, \"CO\": 0.'),
('tBoi1:{\"Pulse\": 50, \"loc_lng\": 77.5877, \"Smoke\": 0.02171749093865924, \"body_temp\": 32.875, \"CO\": 0.0'),
('tBoi1:{\"Pulse\": 50, \"loc_lng\": 77.5877, \"Smoke\": 0.02013336161089768, \"body_temp\": 32.875, \"CO\": 0.0'),
('tBoi1:{\"Pulse\": 50, \"loc_lng\": 77.5877, \"Smoke\": 0.020434596130316608, \"body_temp\": 32.937, \"CO\": 0.'),
('tBoi1:{\"Pulse\": 50, \"loc_lng\": 77.5877, \"Smoke\": 0.01977242550113638, \"body_temp\": 32.875, \"CO\": 0.0'),
('tBoi1:{\"Pulse\": 50, \"loc_lng\": 77.5877, \"Smoke\": 0.02255248168142311, \"body_temp\": 32.875, \"CO\": 0.0'),
('tBoi1:{\"Pulse\": 50, \"loc_lng\": 77.5877, \"Smoke\": 0.02147242436386813, \"body_temp\": 32.812, \"CO\": 0.0'),
('tBoi1:{\"Pulse\": 50, \"loc_lng\": 77.5877, \"Smoke\": 0.02147242436386813, \"body_temp\": 32.812, \"CO\": 0.0'),
('tBoi1:{\"Pulse\": 50, \"loc_lng\": 77.5877, \"Smoke\": 0.01637921519314713, \"body_temp\": 32.937, \"CO\": 0.0'),
('tBoi1:{\"Pulse\": 50, \"loc_lng\": 77.5877, \"Smoke\": 0.01959151505507007, \"body_temp\": 32.937, \"CO\": 0.0'),
('tBoi1:{\"Pulse\": 50, \"loc_lng\": 77.5877, \"Smoke\": 0.020434596130316608, \"body_temp\": 32.875, \"CO\": 0.'),
('tBoi1:{\"Pulse\": 50, \"loc_lng\": 77.5877, \"Smoke\": 0.020434596130316608, \"body_temp\": 32.937, \"CO\": 0.'),
('tBoi1:{\"loc_lat\": 12.8791, \"LPG\": 0.0076590072479942135, \"body_temp\": 32.875, \"loc_lng\": 77.5877, \"C'),
('tBoi1:{\"loc_lat\": 12.8791, \"LPG\": 0.0076590072479942135, \"body_temp\": 32.875, \"loc_lng\": 77.5877, \"C'),
('tBoi1:{\"loc_lat\": 12.8791, \"LPG\": 0.007863227067876183, \"body_temp\": 32.875, \"loc_lng\": 77.5877, \"CO'),
('tBoi1:{\"loc_lat\": 12.8791, \"LPG\": 0.0076590072479942135, \"body_temp\": 32.812, \"loc_lng\": 77.5877, \"C'),
('tBoi1:{\"loc_lat\": 12.8791, \"LPG\": 0.009608699380919954, \"body_temp\": 32.75, \"loc_lng\": 77.5877, \"CO\"'),
('tBoi1:{\"loc_lat\": 12.8791, \"LPG\": 0.0076590072479942135, \"body_temp\": 32.812, \"loc_lng\": 77.5877, \"C'),
('tBoi1:{\"loc_lat\": 12.8791, \"LPG\": 0.0076590072479942135, \"body_temp\": 32.75, \"loc_lng\": 77.5877, \"CO'),
('tBoi1:{\"loc_lat\": 12.8791, \"LPG\": 0.007977606013158358, \"body_temp\": 32.687, \"loc_lng\": 77.5877, \"CO'),
('tBoi1:{\"loc_lat\": 12.8791, \"LPG\": 0.0067977136262032814, \"body_temp\": 32.75, \"loc_lng\": 77.5877, \"CO'),
('tBoi1:{\"loc_lat\": 12.8791, \"LPG\": 0.0076590072479942135, \"body_temp\": 32.75, \"loc_lng\": 77.5877, \"CO'),
('tBoi1:{\"loc_lat\": 12.8791, \"LPG\": 0.007817014873505642, \"body_temp\": 32.75, \"loc_lng\": 77.5877, \"CO\"'),
('tBoi1:{\"loc_lat\": 12.8791, \"LPG\": 0.009359147022844471, \"body_temp\": 32.75, \"loc_lng\": 77.5877, \"CO\"'),
('tBoi1:{\"loc_lat\": 12.8791, \"LPG\": 0.0076590072479942135, \"body_temp\": 32.75, \"loc_lng\": 77.5877, \"CO'),
('tBoi1:{\"loc_lat\": 12.8791, \"LPG\": 0.0076590072479942135, \"body_temp\": 32.75, \"loc_lng\": 77.5877, \"CO'),
('tBoi1:{\"loc_lat\": 12.8791, \"LPG\": 0.0076590072479942135, \"body_temp\": 32.75, \"loc_lng\": 77.5877, \"CO'),
('tBoi1:{\"loc_lat\": 12.8791, \"LPG\": 0.00795415671351524, \"body_temp\": 32.812, \"loc_lng\": 77.5877, \"CO\"'),
('tBoi1:{\"loc_lat\": 12.8791, \"LPG\": 0.006673280069992385, \"body_temp\": 32.937, \"loc_lng\": 77.5877, \"CO'),
('tBoi1:{\"humidity\": 34.0, \"body_temp\": 30.312, \"Smoke\": 0.020473731926380297, \"loc_lat\": 12.8791, \"lo'),
('tBoi1:{\"Pulse\": 233, \"LPG\": 0.007694336704055359, \"ambient_temp\": 30.0, \"humidity\": 32.0, \"CO\": 0.00'),
('tBoi1:{\"Pulse\": 59, \"LPG\": 0.00770357868817632, \"ambient_temp\": 30.0, \"humidity\": 31.0, \"CO\": 0.0050'),
('tBoi1:{\"Smoke\": 0.020572569867859818, \"Pulse\": 35, \"body_temp\": 30.5, \"LPG\": 0.007707409358311729, \"'),
('tBoi1:{\"Smoke\": 0.02031945754105237, \"Pulse\": 39, \"body_temp\": 30.5, \"LPG\": 0.007618599896040754, \"a'),
('tBoi1:{\"LPG\": 0.0076590072479942135, \"loc_lat\": 12.8614, \"ambient_temp\": 28.0, \"loc_lng\": 77.6644, \"'),
('tBoi1:{\"LPG\": 0.0076590072479942135, \"loc_lat\": 12.8614, \"ambient_temp\": 28.0, \"loc_lng\": 77.6644, \"'),
('tBoi1:{\"LPG\": 0.0076590072479942135, \"loc_lat\": 12.8614, \"ambient_temp\": 28.0, \"loc_lng\": 77.6644, \"'),
('tBoi1:{\"body_temp\": 29.875, \"Smoke\": 0.019907904939449862, \"ambient_temp\": 28.0, \"loc_lng\": 77.6644,'),
('tBoi1:{\"Smoke\": 0.020001389799242264, \"humidity\": 31.0, \"LPG\": 0.007506899265920581, \"ambient_temp\":'),
('tBoi1:{\"Smoke\": 0.020001389799242264, \"humidity\": 31.0, \"LPG\": 0.007506899265920581, \"ambient_temp\":'),
('tBoi1:{\"loc_lng\": 77.6644, \"CO\": 0.005262450359958849, \"loc_lat\": 12.8614, \"humidity\": 36.0, \"LPG\": '),
('tBoi1:{\"ambient_temp\": 29.0, \"loc_lng\": 77.6644, \"Smoke\": 0.02052458381191498, \"CO\": 0.0049915727638'),
('tBoi1:{\"ambient_temp\": 31.0, \"loc_lng\": 77.6644, \"Smoke\": 0.020434596130316608, \"CO\": 0.004963269307'),
('tBoi1:{\"Pulse\": 39, \"Smoke\": 0.020458338027009693, \"LPG\": 0.007667337546303613, \"body_temp\": 28.25, '),
('tBoi1:{\"Pulse\": 39, \"Smoke\": 0.020458338027009693, \"LPG\": 0.007667337546303613, \"body_temp\": 28.25, '),
('tBoi1:{\"Pulse\": 41, \"Smoke\": 0.021025858094422336, \"LPG\": 0.007866280857998738, \"body_temp\": 28.25, '),
('tBoi1:{\"Pulse\": 229, \"Smoke\": 0.020389383007742547, \"LPG\": 0.007643141650482993, \"body_temp\": 28.25,'),
('tBoi1:{\"Pulse\": 213, \"Smoke\": 0.020407095431772975, \"LPG\": 0.007649357329891175, \"body_temp\": 28.25,'),
('tBoi1:{\"body_temp\": 28.562, \"CO\": 0.004940424877500869, \"Smoke\": 0.020361879740905874, \"ambient_temp'),
('tBoi1:{\"body_temp\": 28.562, \"CO\": 0.004940424877500869, \"Smoke\": 0.020361879740905874, \"ambient_temp'),
('tBoi1:{\"Smoke\": 0.022456630649138085, \"loc_lat\": 12.8614, \"Pulse\": 71, \"LPG\": 0.008366337238121668, '),
('tBoi1:{\"Smoke\": 0.022456630649138085, \"loc_lat\": 12.8614, \"Pulse\": 71, \"LPG\": 0.008366337238121668, '),
('tBoi1:{\"Smoke\": 0.022456630649138085, \"loc_lat\": 12.8614, \"Pulse\": 71, \"LPG\": 0.008366337238121668, '),
('tBoi1:{\"Smoke\": 0.022456630649138085, \"loc_lat\": 12.8614, \"Pulse\": 71, \"LPG\": 0.008366337238121668, '),
('tBoi1:{\"Smoke\": 0.022456630649138085, \"loc_lat\": 12.8614, \"Pulse\": 71, \"LPG\": 0.008366337238121668, '),
('tBoi1:{\"Smoke\": 0.020235999904018146, \"LPG\": 0.007589301694126388, \"CO\": 0.004900935455823243, \"body'),
('tBoi1:{\"Smoke\": 0.02229677812817031, \"LPG\": 0.008310571946191357, \"CO\": 0.005556277272329894, \"body_'),
('tBoi1:{\"loc_lat\": 12.8614, \"humidity\": 35.0, \"ambient_temp\": 31.0, \"loc_lng\": 77.6644, \"CO\": 0.00489'),
('tBoi1:{\"loc_lat\": 12.8614, \"humidity\": 35.0, \"ambient_temp\": 31.0, \"loc_lng\": 77.6644, \"CO\": 0.00489'),
('tBoi1:{\"Pulse\": 110, \"LPG\": 0.0076350142153750016, \"loc_lng\": 77.6644, \"CO\": 0.004941789068816216, \"'),
('tBoi1:{\"ambient_temp\": 31.0, \"Smoke\": 0.03248059720025407, \"LPG\": 0.011819093697374626, \"CO\": 0.0090'),
('tBoi1:{\"ambient_temp\": 31.0, \"Smoke\": 0.018143090758980712, \"LPG\": 0.0068519598398563255, \"CO\": 0.00'),
('tBoi1:{\"Pulse\": 232, \"Smoke\": 0.021219797943009024, \"humidity\": 35.0, \"CO\": 0.005211458181461714, \"L'),
('tBoi1:{\"Smoke\": 0.015779193290547243, \"body_temp\": 31.25, \"Pulse\": 45, \"loc_lng\": \"77.5879\", \"LPG\": '),
('tBoi1:{\"Smoke\": 0.02061236533433403, \"body_temp\": 31.312, \"Pulse\": 169, \"loc_lng\": \"77.5879\", \"LPG\":'),
('tBoi1:{\"ambient_temp\": 31.0, \"CO\": 0.005042886045840634, \"Pulse\": 238, \"loc_lat\": \"12.8792\", \"loc_ln'),
('tBoi1:{\"loc_lat\": \"12.8791\", \"CO\": 0.004915094374830329, \"LPG\": 0.007605156489778622, \"humidity\": 36'),
('tBoi1:{\"loc_lat\": \"12.8792\", \"CO\": 0.004963269307602338, \"LPG\": 0.007659007247994198, \"humidity\": 36'),
('tBoi1:{\"CO\": 0.005010095337550124, \"body_temp\": 38.875, \"humidity\": 36.0, \"loc_lat\": \"12.8792\", \"Pul'),
('tBoi1:{\"CO\": 0.005060440704671949, \"body_temp\": 38.875, \"humidity\": 36.0, \"loc_lat\": \"12.8792\", \"Pul'),
('tBoi1:{\"CO\": 0.005045582067397481, \"body_temp\": 38.875, \"humidity\": 36.0, \"loc_lat\": \"12.8792\", \"Pul'),
('tBoi1:{\"body_temp\": 32.375, \"loc_lat\": 12.8781, \"Pulse\": 116, \"LPG\": 0.007684203407145441, \"CO\": 0.0'),
('tBoi1:{\"humidity\": 26.0, \"LPG\": 0.007659007247994198, \"body_temp\": 32.437, \"loc_lng\": 77.6644, \"Puls');

-- --------------------------------------------------------

--
-- Table structure for table `userdet`
--

CREATE TABLE `userdet` (
  `loginID` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `name` varchar(25) NOT NULL,
  `email` varchar(30) NOT NULL,
  `phonenumber` varchar(10) NOT NULL,
  `alternatenumber` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userdet`
--

INSERT INTO `userdet` (`loginID`, `password`, `name`, `email`, `phonenumber`, `alternatenumber`) VALUES
('root', 'root', 'Ankush Arunkumar', 'ankush1997@gmail.com', '8892584484', '7019970219');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
