-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 10.4.1.122:3306
-- Generation Time: Aug 14, 2019 at 11:41 AM
-- Server version: 10.2.24-MariaDB
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u106041892_court`
--

-- --------------------------------------------------------

--
-- Table structure for table `all_complains`
--

CREATE TABLE `all_complains` (
  `complain_id` int(11) NOT NULL,
  `hostel_no` int(11) NOT NULL,
  `floor_no` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `room_no` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `issue` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `issue_type` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `roll_no` int(9) NOT NULL,
  `phone_no` bigint(12) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `all_complains`
--

INSERT INTO `all_complains` (`complain_id`, `hostel_no`, `floor_no`, `room_no`, `issue`, `issue_type`, `roll_no`, `phone_no`, `time`) VALUES
(8, 1, '2', '311', 'Emergency light not working', 'electrical', 0, 8879585099, '2017-01-16 19:33:08'),
(9, 1, '1', '210', 'GEYSER NOT WORKING.', 'electrical', 0, 8277575324, '2017-01-16 19:33:08'),
(7, 1, '2', '313', 'Bathroom tubelight not working.', 'electrical', 0, 7030893931, '2017-01-16 19:33:08'),
(10, 1, '1', '211', 'Hooks for mosquito net (machardani ).', 'carpentry', 0, 9644097807, '2017-01-16 19:33:08'),
(78, 1, '2', '301', 'Noisy fan, plastic cap loose', 'electrical', 0, 8574960350, '2017-01-16 19:33:08'),
(16, 1, '2', '311', 'Rod in bathroom to be fixed properly', 'carpentry', 0, 8879585099, '2017-01-16 19:33:08'),
(81, 1, '2', '307', 'Emergency light not working', 'electrical', 0, 7813073713, '2017-01-16 19:33:08'),
(18, 1, '1', '208', '3rd cupboard does not hav rod and drawer and extraa hook reqired in the room', 'carpentry', 0, 8989504377, '2017-01-16 19:33:08'),
(74, 1, '1', '206', 'towel rod in bathroom', 'carpentry', 0, 8277498020, '2017-01-16 19:33:08'),
(79, 1, '2', '308', 'Pigeons enter bathroom and sit on geyser.', 'carpentry', 0, 9916526604, '2017-01-16 19:33:08'),
(80, 1, '2', '308', 'Emergency light doesn\'t work', 'electrical', 0, 9916526604, '2017-01-16 19:33:08'),
(14, 1, '1', '210', 'Only one hook is present.two more has to be there', 'carpentry', 0, 8277575324, '2017-01-16 19:33:08'),
(15, 1, '1', '205', 'The shower in my room isn\'t working.', 'plumbing', 0, 8277474829, '2017-01-16 19:33:08'),
(19, 1, '1', '208', 'Tubelight holder broken and new tubelight reqired', 'electrical', 0, 8989504377, '2017-01-16 19:33:08'),
(77, 1, '2', '302', 'Bathroom rod broken. Can be fixed using screws.', 'carpentry', 0, 8277552639, '2017-01-16 19:33:08'),
(21, 1, '1', '207', 'Cupboard(lock,drawar,rod)', 'carpentry', 0, 918277530694, '2017-01-16 19:33:08'),
(75, 1, '2', '316', 'Geyser not working.', 'electrical', 0, 94965, '2017-01-16 19:33:08'),
(23, 1, '1', '204', '1) Towel hanger in bathroom.\r\n2) Clothes hanger in the room -  2(Quantity).', 'carpentry', 0, 9460795868, '2017-01-16 19:33:08'),
(24, 1, '1', '210', 'no cupboard in almirah', 'carpentry', 0, 9964065372, '2017-01-16 19:33:08'),
(76, 1, '2', '318', 'Sink tap loose', 'plumbing', 0, 8277513914, '2017-01-16 19:33:08'),
(26, 1, '1', '207', 'Water leakage from the side of the exhaust in the bathroom.\r\nTap of wash basin is not fixed. It rotates when I open it.\r\n', 'plumbing', 0, 8277530694, '2017-01-16 19:33:08'),
(27, 1, '1', '207', 'There is no common dustbin on my floor. It should be there to reduce dirtiness.', 'housekeeping', 0, 8277530694, '2017-01-16 19:33:08'),
(28, 1, '2', '301', '\r\nNo locker in wardrobe\r\n', 'carpentry', 0, 8277498120, '2017-01-16 19:33:08'),
(29, 1, '2', '303', 'No drawer and hanger rod in cupboard.', 'carpentry', 0, 8277576284, '2017-01-16 19:33:08'),
(30, 1, '2', '303', 'Fan not working', 'electrical', 0, 9481243820, '2017-01-16 19:33:08'),
(32, 1, '2', '304', 'No Drawer and Hanger Rod in Cupboard', 'carpentry', 0, 7079302400, '2017-01-16 19:33:08'),
(33, 1, '1', '209', 'Need rod and drawer in closet', 'carpentry', 0, 8277536737, '2017-01-16 19:33:08'),
(34, 1, '1', '209', 'Water keeps on dripping non stop from the ventilator in bathroom', 'plumbing', 0, 8277536737, '2017-01-16 19:33:08'),
(35, 1, '1', '216', 'No drawer and hanger in almirah', 'carpentry', 0, 9826128602, '2017-01-16 19:33:08'),
(36, 1, '1', '216', 'Tap is leaking', 'plumbing', 0, 9826128602, '2017-01-16 19:33:08'),
(37, 1, '1', '217', 'No drawer and hangers in cupboard', 'carpentry', 0, 8277459463, '2017-01-16 19:33:08'),
(38, 1, '1', '214', 'No drawer and hanger', 'carpentry', 0, 9915658251, '2017-01-16 19:33:08'),
(39, 1, '2', '304', 'Geyser not working\r\n', 'electrical', 0, 7079302400, '2017-01-16 19:33:08'),
(40, 1, '1', '210', 'Almirah lock broken', 'carpentry', 0, 9198656321, '2017-01-16 19:33:08'),
(41, 1, '2', '304', 'Electricity is not coming', 'electrical', 0, 7079302400, '2017-01-16 19:33:08'),
(42, 1, '1', '218', 'Need a hanger in the cupboard', 'carpentry', 0, 9880618176, '2017-01-16 19:33:08'),
(43, 1, '1', '213', 'Exhaust fan isn\'t working', 'electrical', 0, 9034007720, '2017-01-16 19:33:08'),
(70, 1, '2', '303', 'Fan not Working.', 'electrical', 0, 9481243820, '2017-01-16 19:33:08'),
(45, 1, '1', '204', 'Tap isn\'t properly fit', 'plumbing', 0, 9481245572, '2017-01-16 19:33:08'),
(67, 1, '0', '103', '1)water leakage from flush\r\n2)no regular water connection\r\n3) leakage of water from hand shower\r\n4)water leakage in bathroom from ventilator', 'plumbing', 0, 8277494978, '2017-01-16 19:33:08'),
(68, 1, '0', '103', '1) Carpentry for chair and table\r\n2)hooks', 'carpentry', 0, 8277494978, '2017-01-16 19:33:08'),
(69, 1, '0', '104', 'Connection of hot water tap is slow', 'plumbing', 0, 8277624223, '2017-01-16 19:33:08'),
(66, 1, '0', '102', 'Water leakage from ventilator in bathroom', 'plumbing', 0, 9492298994, '2017-01-16 19:33:08'),
(49, 1, '2', '317', '1.For the door the upper lock doesn\'t work.\r\n2.Towel hanger inside the bathroom is not present.\r\n3.One of the cupboard doesn\'t have a handle.', 'carpentry', 0, 7022034030, '2017-01-16 19:33:08'),
(50, 1, '1', '212', 'Solar light isn\'t there', 'electrical', 0, 8277541491, '2017-01-16 19:33:08'),
(51, 1, '1', '202', 'Need an upper door latch\r\n', 'carpentry', 0, 8895737633, '2017-01-16 19:33:08'),
(52, 1, '1', '216', 'Continuous leakage of water from tap', 'plumbing', 0, 9826128602, '2017-01-16 19:33:08'),
(53, 1, '1', '214', 'Need a rod inside bathroom for hanging clothes', 'carpentry', 0, 8277574277, '2017-01-16 19:33:08'),
(54, 1, '1', '210', 'Exhaust not working', 'electrical', 0, 8277575324, '2017-01-16 19:33:08'),
(55, 1, '1', '210', 'Lock of almirah broken', 'carpentry', 0, 8277575324, '2017-01-16 19:33:08'),
(56, 1, '1', '214', 'Need a rod inside bathroom for hanging clothes', 'carpentry', 0, 8277574277, '2017-01-16 19:33:08'),
(65, 1, '0', '101', '1) leakage in washroom\r\n2)water connection problems', 'plumbing', 0, 8277401949, '2017-01-16 19:33:08'),
(58, 1, '1', '208', 'Solar lamp isn\'t working', 'electrical', 0, 8989504377, '2017-01-16 19:33:08'),
(59, 1, '1', '205', 'Leakage of water from the grills ', 'other', 0, 8277474829, '2017-01-16 19:33:08'),
(60, 1, '1', '214', 'Lot of noise created by exhaust fan ', 'electrical', 0, 8277574277, '2017-01-16 19:33:08'),
(64, 1, '0', '101', '1)Hooks\r\n2) Carpentry work for chair and table', 'carpentry', 0, 8277401949, '2017-01-16 19:33:08'),
(62, 1, '1', '211', 'Solar light is not working.\r\nGeyser is not working.\r\nFan is making noise.', 'electrical', 0, 8277534660, '2017-01-16 19:33:08'),
(71, 1, '2', '307', 'Emergency light does not work at power cut.', 'electrical', 0, 9481244092, '2017-01-16 19:33:08'),
(72, 1, '2', '308', 'Emergency light not working.\r\nProblem in Bathroom Tubelight.\r\nOne switch is not working properly.', 'electrical', 0, 9985692108, '2017-01-16 19:33:08'),
(73, 1, '2', '302', 'Bathroom hanging rod broken.', 'carpentry', 0, 9454388082, '2017-01-16 19:33:08'),
(82, 1, '2', '309', 'Geyser not working', 'electrical', 0, 8987384270, '2017-01-16 19:33:08'),
(83, 1, '2', '310', 'Beehive near window', 'other', 0, 9686423072, '2017-01-16 19:33:08'),
(84, 1, '2', '314', 'Emergency light, battery regulator and battery not present', 'electrical', 0, 8277463033, '2017-01-16 19:33:08'),
(87, 1, '2', '315', 'Pigeon entering the bathroom, shitting all over the place.', 'other', 0, 9920336467, '2017-01-16 19:33:08'),
(86, 1, '2', '313', 'Cupboard doors are not closing', 'carpentry', 0, 7030893931, '2017-01-16 19:33:08'),
(89, 1, '1', '217', 'Tube light inside the bathroom isn\'t working...... need to be replaced', 'electrical', 0, 8277490721, '2017-01-16 19:33:08'),
(93, 1, '2', '311', 'Fan regulator faulty.', 'electrical', 0, 8879585099, '2017-01-16 19:33:08'),
(94, 1, '2', '315', 'WiFi router, on back wing 2nd floor not working.', 'other', 0, 9920336468, '2017-01-16 19:33:08'),
(95, 1, '2', '311', 'test complain', 'housekeeping', 0, 1, '2017-01-16 19:33:08'),
(96, 1, '2', '306', 'two tube lights needs to be replaced', 'electrical', 0, 9481243966, '2017-01-16 19:33:08'),
(97, 1, '2', '315', '3 or possibly more lizards spotted .\r\nNeed immediate cleanup!!!\r\n', 'sensitive', 0, 9920336478, '2017-01-16 19:33:08'),
(98, 1, '2', '315', 'Cockroaches, lizards and other insects spotted near the window/attic.\r\nPlease take immediate action for pest control and regulation. \r\n3-4 lizards and that many cockroaches have been spotted.\r\n', 'sensitive', 0, 9920336478, '2017-01-16 19:33:08'),
(99, 1, '1', '211', 'Geyser is not working', 'electrical', 0, 8277574473, '2017-01-16 19:33:08'),
(100, 1, '2', '315', 'Bathroom fan making too much noise as compared to other ones', 'other', 0, 9920336478, '2017-01-16 19:33:08'),
(101, 1, '1600099', '160010034', 'Geyser not working', 'electrical', 0, 7019008851, '2017-01-16 19:33:08'),
(102, 1, '2', '316', 'Geyser not working', 'electrical', 0, 7019008851, '2017-01-16 19:33:08'),
(103, 1, '2', '311', 'Solar battery regulator making too much noise continuously', 'electrical', 0, 8879585099, '2017-01-16 19:33:08'),
(104, 1, '2', '317', 'The water from the solar water tap smells like paint and bug spray mixed together.\r\nEven the color in that tap is brownish in color.\r\nThe geyser tap also has dirt color water coming out.', 'plumbing', 0, 7022034030, '2017-01-16 19:33:08'),
(105, 1, '2', '311', 'Test complain', 'other', 0, 8879585099, '2017-01-16 19:33:08'),
(106, 1, '2', '311', 'Test complain', 'other', 0, 8879585099, '2017-01-16 19:33:08'),
(107, 1, '1', '214', 'Hi A. Srikar,\r\nFrom now onwards complains of your floor will be mailed you in a similar manner.', 'other', 0, 8879585099, '2017-01-16 19:33:08'),
(108, 1, '0', '102', 'Hi A. Srikar, <br />\r\nFrom now onwards complains of your floor will be mailed you in a similar manner.', 'other', 0, 8879585099, '2017-01-16 19:33:08'),
(109, 1, '0', '102', 'Hi Samhitha, <br/>From now onwards complains of your floor will be mailed you in a similar manner.', 'other', 0, 8879585099, '2017-01-16 19:33:08'),
(110, 1, '2', '307', 'Hi Gowtham, <br />From now onwards complains of your floor will be mailed you in a similar manner.', 'other', 0, 8879585099, '2017-01-16 19:33:08'),
(111, 1, '2', '307', 'Hi Gowtham, \r\nFrom now onwards complains of your floor will be mailed you in a similar manner.', 'other', 0, 8879585099, '2017-01-16 19:33:08'),
(112, 1, '0', '102', 'Hi Samhitha, \r\nFrom now onwards complains of your floor will be mailed you in a similar manner.', 'other', 0, 8879585099, '2017-01-16 19:33:08'),
(113, 1, '1', '214', 'Hi A. Srikar, \r\nFrom now onwards complains of your floor will be mailed you in a similar manner.', 'other', 0, 8879585099, '2017-01-16 19:33:08'),
(114, 1, '2', '307', 'Hi Gowtham, \r\nFrom now onwards complains of your floor will be mailed you in a similar manner.', 'other', 0, 8879585099, '2017-01-16 19:33:08'),
(115, 1, '2', '311', 'Hi gowtham, \r\nIts Harshal here. this is a test complain.', 'other', 0, 8879585099, '2017-01-16 19:33:08'),
(116, 1, '1', '214', 'Hi Srikar,\r\nPlease confirm on WhatsApp if you\'ve received this mail.', 'other', 0, 8879585099, '2017-01-16 19:33:08'),
(117, 1, '0', '101', 'Test mail ', 'other', 0, 8879585099, '2017-01-16 19:33:08'),
(118, 1, '1', '214', 'Please confirm on WhatsApp', 'other', 0, 8879585099, '2017-01-16 19:33:08'),
(119, 1, '0', '102', 'Please confirm on WhatsApp', 'other', 0, 8879585099, '2017-01-16 19:33:08'),
(120, 1, '2', '311', 'Please confirm on WhatsApp', 'other', 0, 8879585099, '2017-01-16 19:33:08'),
(121, 1, '0', '102', 'Hi Samhitha, from now onwards you\'ll be receiving mail for every complain logged on Court. <br />\r\nHarshal Gajjar<br />\r\n160010003', 'other', 0, 8879585099, '2017-01-16 19:33:08'),
(122, 1, '1', '214', 'Hi Srikar, from now onwards you\'ll be receiving mail for every complain logged on Court. <br />\r\nHarshal Gajjar<br />\r\n160010003', 'other', 0, 8879585099, '2017-01-16 19:33:08'),
(123, 1, '2', '311', 'Hi Gowtham, from now onwards you\'ll be receiving mail for every complain logged on Court. <br />\r\nHarshal Gajjar<br />\r\n160010003', 'other', 0, 8879585099, '2017-01-16 19:33:08'),
(124, 1, '0', '102', 'test mail', 'other', 0, 8879585099, '2017-01-16 19:33:08'),
(125, 1, '2', '311', 'Test mail, please ignore', 'other', 0, 8879585099, '2017-01-16 19:33:08'),
(126, 1, '2', '311', 'test mail', 'other', 0, 8879585099, '2017-01-16 19:33:08'),
(127, 1, '0', '102', 'test mail', 'other', 0, 8879585099, '2017-01-16 19:33:08'),
(128, 1, '0', '102', 'test mail', 'other', 0, 8879585099, '2017-01-16 19:33:08'),
(129, 1, '0', '102', 'test mail', 'other', 0, 8879585099, '2017-01-16 19:33:08'),
(130, 1, '0', '102', 'Test mail', 'other', 0, 8879585099, '2017-01-16 19:33:08'),
(131, 1, '2', '311', 'Hi Gowtham, <br />from now onwards you\'ll be receiving mail for every complain logged on Court. <br />Harshal Gajjar<br />160010003', 'other', 0, 8879585099, '2017-01-16 19:33:08'),
(132, 1, '1', '214', 'Hi Srikar, <br />from now onwards you\'ll be receiving mail for every complain logged on Court. <br />Harshal Gajjar<br />160010003', 'other', 0, 8879585099, '2017-01-16 19:33:08'),
(133, 1, '0', '102', 'Hi Samhitha, <br />from now onwards you\'ll be receiving mail for every complain logged on Court. <br />Harshal Gajjar<br />160010003', 'other', 0, 8879585099, '2017-01-16 19:33:08'),
(134, 1, '2', '311', 'test complain', 'other', 0, 8879585099, '2017-01-16 19:33:08'),
(135, 1, '1', '210', 'Tube light is not working', 'electrical', 0, 9479554915, '2017-01-16 19:33:08'),
(136, 1, '1', '210', 'In Almirah lock has been broken.needed new lock .', 'carpentry', 0, 9479554915, '2017-01-16 19:33:08'),
(137, 1, '1', '211', 'geyser is showing indication of its working but warm water is not coming from it.', 'electrical', 0, 9454546138, '2017-01-16 19:33:08'),
(138, 1, '2', '313', 'Water continusly dripping . ', 'plumbing', 0, 7030893931, '2017-01-16 19:33:08'),
(139, 1, '1', '210', 'Bathroom tubelite is not working.', 'electrical', 0, 9198656321, '2017-01-16 19:33:08'),
(140, 1, '2', '311', 'Test issue', 'other', 0, 8879585099, '2017-01-16 19:33:08'),
(141, 1, '2', '315', 'Please set up more wifi routers there\'s actually no point in setting up only one  router only few people are able to access others  have to sit outside to come close to the range', 'other', 0, 9920336478, '2017-01-16 19:33:08'),
(142, 1, '2', '318', 'There is a Bee hive outside the window of Room number 318. Please Take necessary action immediately. Bees are entering the room.\r\nRoom number 316.\r\nAbhishek R, Rohan Deshpande, Asish Kumar Bhoi.', 'other', 0, 8879837548, '2017-01-16 19:33:08'),
(143, 1, '1', '214', 'Router isn\'t working', 'other', 0, 8277574277, '2017-01-16 19:33:08'),
(144, 1, '0', '103', 'White cement below toilet seat is not proper. Water is leaking.', 'plumbing', 0, 8277494979, '2017-01-16 19:33:08'),
(145, 1, '0', '103', 'Sewage water through ventilator.we need something which closes that ventilator. ', 'carpentry', 0, 8277494979, '2017-01-16 19:33:08'),
(146, 1, '1', '211', 'Wash basin tap is loose.\r\nSolar light is not working.', 'plumbing', 0, 9406647983, '2017-01-16 19:33:08'),
(147, 1, '1', '202', 'Need upper latch on the door. It is not there from the beginning. The frame of door is metalic. So needs to be weldered to fix that. ', 'carpentry', 0, 8895737633, '2017-01-16 19:33:08'),
(148, 1, '1', '217', 'Wash basin tap is very loose..', 'plumbing', 0, 8277490721, '2017-01-16 19:33:08'),
(149, 1, '2', '308', 'Cup-board\'s door link was broken.\r\nIt was not closing properly', 'carpentry', 0, 9470778815, '2017-01-16 19:33:08'),
(150, 1, '2', '305', 'Our tap is broken,so please repair it soon...thank you', 'plumbing', 0, 9492828241, '2017-01-16 19:33:08'),
(151, 1, '2', '309', 'Geyser is not working', 'electrical', 0, 8987384270, '2017-01-16 19:33:08'),
(152, 1, '2', '317', 'Solar hot water was not comming', 'plumbing', 0, 8277521843, '2017-01-16 19:33:08'),
(153, 1, '1', '216', 'Solar water not coming since today morning', 'other', 0, 9412453738, '2017-01-16 19:33:08'),
(154, 1, '1', '212', 'The tap of the wash basin is loose and not in usable condition.', 'plumbing', 0, 8277410019, '2017-01-16 19:33:08'),
(155, 1, '1', '212', 'There is no solar light at all in our room.', 'electrical', 0, 8277410019, '2017-01-16 19:33:08'),
(156, 1, '1', '216', 'Two tubelights needed.', 'electrical', 0, 9826128602, '2017-01-16 19:33:08'),
(157, 1, '1', '216', 'Tape leakage.', 'plumbing', 0, 9826128602, '2017-01-16 19:33:08'),
(158, 1, '1', '217', 'Tube light holder inside bathroom is a problem..\r\nTube light changed 2times..so problem with holder..\r\nNot switching on most of the time more than 9out of 10 times', 'electrical', 0, 8277490721, '2017-01-16 19:33:08'),
(159, 1, '2', '315', 'Tube light doesn\'t switch on immediately... Behaves like a true stereotypical tube light. ', 'electrical', 0, 9972574049, '2017-01-16 19:33:08'),
(160, 1, '2', '311', 'Bathroom tube light not working.', 'electrical', 0, 8879585099, '2017-01-16 19:33:08'),
(161, 1, '2', '316', 'geyser not working.repaired twice but never worked.', 'electrical', 0, 7019008851, '2017-01-16 19:33:08'),
(162, 1, '0', '102', 'Leakage of water from flush pipe', 'plumbing', 0, 8277546470, '2017-01-16 19:33:08'),
(163, 1, '0', '102', 'Solar light is not working', 'electrical', 0, 8277546470, '2017-01-16 19:33:08'),
(164, 1, '0', '102', 'Washroom light  not working properly', 'electrical', 0, 8277546470, '2017-01-16 19:33:08'),
(165, 1, '2', '312', 'Bathroom hanger detached from wall. ', 'carpentry', 0, 8277588731, '2017-01-16 19:33:08'),
(166, 1, '1', '211', 'Geyser is not producing hot water although it is showing the red light  indication of working.', 'electrical', 0, 9454546138, '2017-01-16 19:33:08'),
(167, 1, '1', '214', 'Fan is not working', 'electrical', 0, 8277574277, '2017-01-16 19:33:08'),
(168, 1, '1', '214', 'Bathroom\'s tube light is not working', 'electrical', 0, 8277574277, '2017-01-16 19:33:08'),
(169, 1, '1', '210', 'Fan making sound', 'electrical', 0, 9198656321, '2017-01-16 19:33:08'),
(170, 1, '1', '211', 'two tubelights are not working', 'electrical', 0, 9454546138, '2017-01-16 19:33:08'),
(171, 1, '1', '211', 'solar water is not comming', 'plumbing', 0, 9454546138, '2017-01-16 19:33:08'),
(172, 1, '1', '211', 'geyser  is not working', 'electrical', 0, 9454546138, '2017-01-16 19:33:08'),
(173, 1, '1', '210', 'Lock of almirah is broken. Need to replace it. ', 'carpentry', 0, 9479554915, '2017-01-16 19:33:08'),
(174, 1, '2', '313', 'Bottom hinge of cupboard not fixed. Cannot properly open the cupboard door.', 'plumbing', 0, 7030893931, '2017-01-16 19:33:08'),
(175, 1, '2', '311', 'A tube light in room is not working (opposite to the 3 beds)', 'electrical', 0, 8879585099, '2017-01-16 19:33:08'),
(176, 1, '1', '208', 'The cupbord without the drawer is having problem with locking', 'carpentry', 0, 8989504377, '2017-01-16 19:33:08'),
(177, 1, '2', '305', 'No solar water ', 'plumbing', 0, 9492828241, '2017-01-16 19:33:08'),
(178, 1, '1', '211', 'Geysers is not working', 'electrical', 0, 9454546138, '2017-01-16 19:33:08'),
(179, 1, '1', '211', 'Solar water is not coming', 'plumbing', 0, 9454546138, '2017-01-16 19:33:08'),
(180, 1, '1', '213', 'Geysers not working', 'electrical', 0, 9034007720, '2017-01-16 19:33:08'),
(181, 1, '1', '211', 'Bathroom light is not turning on', 'electrical', 0, 9454546138, '2017-01-16 19:33:08'),
(182, 1, '1', '201', 'Bathroom light problem ', 'electrical', 0, 7899218360, '2017-01-16 19:33:08'),
(183, 1, '1', '214', 'Bathroom light is not working', 'electrical', 0, 8277574277, '2017-01-16 19:33:08'),
(184, 1, '1', '217', 'Bathroom light is not working', 'electrical', 0, 7022990117, '2017-01-16 19:33:08'),
(185, 1, '2', '311', 'Bathroom light is not working', 'electrical', 0, 8879585099, '2017-01-16 19:33:08'),
(186, 1, '2', '316', 'Geyser is not working', 'electrical', 0, 8277546932, '2017-01-16 19:33:08'),
(187, 1, '1', '217', 'Geyser issue\r\nAnd also no remind again problem with bathroom tube light \r\nTube replaced thrice but still issue continues\r\nProblem with holder/Starter', 'electrical', 0, 8277490721, '2017-01-16 19:33:08'),
(188, 1, '2', '311', 'Solar water is not coming', 'plumbing', 0, 8879585099, '2017-01-16 19:33:08'),
(189, 1, '1', '206', 'Hand lock of the door is broken. So it is not able lock the room from inside.  ', 'carpentry', 0, 8248768614, '2017-01-16 19:33:08'),
(190, 1, '1', '214', 'One of the fans isnt working', 'electrical', 0, 8277574277, '2017-01-16 19:33:08'),
(191, 1, '1', '214', 'One of the fans isnt working', 'electrical', 0, 8277574277, '2017-01-16 19:33:08'),
(192, 1, '2', '303', 'Geyser not working', 'electrical', 0, 8277506972, '2017-01-16 19:33:08'),
(193, 1, '2', '303', ' No Geyser and solar water', 'electrical', 0, 8277506972, '2017-01-16 19:33:08'),
(194, 1, '2', '309', 'Geyser is not working.', 'electrical', 0, 8987384270, '2017-01-16 19:33:08'),
(195, 1, '1', '212', '1.Geyser is not working......\r\n2.tap of wash basin is leaking ', 'plumbing', 0, 8309296568, '2017-01-16 19:33:08'),
(196, 1, '1', '212', 'No solar light that is emergency lamp..\r\n', 'electrical', 0, 8309296568, '2017-01-16 19:33:08'),
(197, 1, '2', '310', 'Bathroom basin tap broken', 'plumbing', 0, 8277536737, '2017-01-16 19:33:08'),
(198, 1, '0', '102', 'Hanger ditached from the wall in washroom', 'carpentry', 0, 9492298994, '2017-01-16 19:33:08'),
(199, 1, '0', '102', 'Leakage of water from flush', 'plumbing', 0, 9492298994, '2017-01-16 19:33:08'),
(200, 1, '0', '102', 'Loose connection of lights in washroom ,solar light not working', 'electrical', 0, 9492298994, '2017-01-16 19:33:08'),
(201, 1, '0', '101', 'Solar is not working.\r\nLight in the washroom is not working', 'electrical', 0, 8277541872, '2017-01-16 19:33:08'),
(202, 1, '0', '101', 'Flush is not working', 'plumbing', 0, 8277541872, '2017-01-16 19:33:08'),
(203, 1, '2', '316', 'Solar water', 'plumbing', 0, 8277546932, '2017-01-16 19:33:08'),
(204, 1, '2', '303', 'Geyser and solar are not working', 'electrical', 0, 9481243820, '2017-01-16 19:33:08'),
(205, 1, '2', '303', 'Geyser and solar are not working', 'electrical', 0, 9481243820, '2017-01-16 19:33:08'),
(206, 1, '1', '217', 'Solar not working..', 'electrical', 0, 8277490721, '2017-01-16 19:33:08'),
(207, 1, '1', '202', 'Water not coming from a tap where cold water is supposed to come. Again when it was working sometimes hot water was coming from that tap( may the solar line be connected wrongly).', 'plumbing', 0, 8895737633, '2017-01-16 19:33:08'),
(208, 1, '1', '210', 'Solar not working', 'electrical', 0, 9198656321, '2017-01-16 19:33:08'),
(209, 1, '2', '309', 'Solar water is not coming in my room.\r\n', 'other', 0, 8987384270, '2017-01-16 19:33:08'),
(210, 1, '1', '218', 'bathroom light is not working .', 'electrical', 0, 8277452497, '2017-01-16 19:33:08'),
(211, 1, '2', '315', 'Solar water not clean... Has chemical smell to it.', 'plumbing', 0, 9972574049, '2017-01-16 19:33:08'),
(212, 1, '1', '216', '3 tube lights r not working \r\n2 in the room and 1 in the bathroom.', 'electrical', 0, 7995435934, '2017-01-16 19:33:08'),
(213, 1, '1', '216', 'The tap is not working and water is continuously', 'plumbing', 0, 7995921907, '2017-01-16 19:33:08'),
(214, 1, '1', '210', 'Fan not working', 'electrical', 0, 9198565321, '2017-01-16 19:33:08'),
(215, 1, '1', '210', 'Fan is not working and makong noises', 'electrical', 0, 9479554915, '2017-01-16 19:33:08'),
(216, 1, '2', '', '4 tube lights in back wing not working', 'electrical', 160010003, 8879585099, '2017-01-17 01:07:11'),
(217, 1, '2', '', '3 tube lights in the corridor connecting back wing and front wing are not working', 'electrical', 160010003, 8879585099, '2017-01-17 01:10:46'),
(218, 1, '1', '', '3 tube lights not working in front wing', 'electrical', 160010003, 8879585099, '2017-01-17 01:13:13'),
(219, 1, '1', '', '1 tube light not working in the corridor connecting back wing and front wing', 'electrical', 160010003, 8879585099, '2017-01-17 01:14:01'),
(220, 1, '1', '', '1 tube light not properly attached to the ceiling in the back wing', 'electrical', 160010003, 8879585099, '2017-01-17 01:14:37'),
(221, 1, '2', '', '1 tube light not properly attached to the ceiling in the back wing', 'electrical', 160010003, 8879585099, '2017-01-17 01:15:08'),
(222, 1, '1', '210', 'Almirah lock is broken ', 'carpentry', 160030014, 9479554915, '2017-01-17 21:35:08'),
(223, 1, '1', '210', 'Fan is not working ', 'electrical', 160030014, 9479554915, '2017-01-17 21:35:49'),
(224, 1, '1', '210', 'Wayer is not coming properly from taps ', 'plumbing', 160030014, 9479554915, '2017-01-17 21:36:36'),
(225, 1, '1', '217', 'Issue in door\r\nNuts are a bit loose and not closing properly', 'carpentry', 160030040, 7022990117, '2017-01-17 21:37:40'),
(226, 1, '1', '201', 'Related to flush ', 'plumbing', 160030020, 8989948432, '2017-01-17 21:39:02'),
(227, 1, '2', '312', 'Bathroom tubelight fused and bathroom hanger camr out. ', 'electrical', 160020033, 8277588731, '2017-01-17 21:46:08'),
(228, 1, '2', '313', 'Cupboard hinge not fixed', 'carpentry', 160020005, 7030893931, '2017-01-17 21:52:52'),
(229, 1, '1', '211', 'Geyser not working.\r\nSolar light is not working.', 'electrical', 160030015, 9406647983, '2017-01-17 21:55:59'),
(230, 1, '1', '211', 'Hot water is nit coming from solar', 'plumbing', 160030015, 9406647983, '2017-01-17 21:56:48'),
(231, 1, '2', '310', 'Basin tap completely broken. ', 'plumbing', 160010013, 8277536737, '2017-01-17 22:36:25'),
(232, 1, '2', '310', 'Shower not working properly', 'plumbing', 160010013, 8277536737, '2017-01-17 22:36:56'),
(233, 1, '2', '310', 'Closet door hinges coming out', 'carpentry', 160010013, 8277536737, '2017-01-17 22:37:44'),
(234, 1, '1st', '', 'Hinges of the door of one of the section of cupboard need to be repaired', 'carpentry', 160020009, 8085421222, '2017-01-17 23:47:30'),
(235, 1, '2', '313', 'Two cupboard\'s door is break.\r\nWe can\'t lock properly', 'carpentry', 160020039, 8277527296, '2017-01-18 00:45:08'),
(236, 1, '2', '301', 'Geyser and solar is not working', 'electrical', 160010019, 7337023279, '2017-01-18 11:44:20'),
(237, 1, '2', '312', 'Our bathroom  tubelight is not working ', 'electrical', 160020028, 8277438229, '2017-01-18 11:54:43'),
(238, 1, '2', '', 'WiFi router in front of 308 is not working', 'other', 160020023, 9985692108, '2017-01-18 12:43:39'),
(239, 1, '1', '', 'WiFi router in front of 204 not working', 'other', 160020006, 9460795868, '2017-01-18 12:44:55'),
(240, 1, '1', '', 'WiFi router in front wing not working', 'other', 160010003, 8879585099, '2017-01-18 12:45:55'),
(241, 1, '2', '308', 'Cup board\'s door link was broken', 'carpentry', 160020012, 9470778815, '2017-01-18 12:51:21'),
(242, 1, '1', '', 'Wifi router in front of 211 isn\'t working', 'other', 160020034, 8277574277, '2017-01-18 13:05:01'),
(243, 1, '1', '', 'Wifi router in the midway between front and back wings isn\'t working', 'other', 160020034, 8277574277, '2017-01-18 13:09:28'),
(244, 1, 'Ground', '', 'Two routers near Bendigiri sir room are showing green light', 'other', 160020024, 9492298994, '2017-01-18 13:18:11'),
(245, 1, '2', '', 'not only router in front of our room\r\n\r\neven the wifi router in middle of corridor is also not working (sometimes) leading our four rooms to use only router of 306 & 307    ', 'electrical', 160020023, 9985692108, '2017-01-19 18:14:31'),
(246, 1, '2', '311', 'Fan is not working', 'electrical', 160030001, 8277575490, '2017-01-19 23:23:57'),
(247, 1, '2', '311', 'Fan is not working.', 'electrical', 160030009, 8277575490, '2017-01-19 23:25:49'),
(248, 1, '2', '311', 'Test issue', 'other', 160010003, 8879585099, '2017-01-20 19:52:43'),
(249, 1, '2', '', 'Wifi router in the front wing not working at times', 'other', 160020023, 9985692108, '2017-01-22 12:58:26'),
(250, 1, '1', '210', 'Fan is not working ', 'electrical', 160030014, 9479554915, '2017-01-29 16:46:13'),
(251, 1, '2', '311', 'Hello, this is a test complaint. You\'ll see a red cross against each complaint on portal - that is used to delete a complaint. Also, please make sure that people enter floor number (0,1,2...) and not something like \"ground\" which can NOT be sorted! :)', 'other', 160010003, 8879585099, '2017-01-31 14:40:52'),
(252, 1, '', '', 'Please log in to the portal and delete this as well as the previous test complaint. :)', 'other', 160010003, 8879585099, '2017-01-31 14:42:40'),
(253, 1, '', '', 'test complaint', 'other', 160010003, 8879585099, '2017-01-31 14:45:46'),
(254, 1, '2', '311', 'test ', 'other', 160010003, 8879585099, '2017-01-31 14:47:20'),
(255, 1, '2', '311', 'test', 'other', 160010003, 8879585099, '2017-01-31 14:48:12'),
(256, 1, '1', '207', 'Hinges of the door of one of the section of cupboard need to be repaired', 'carpentry', 160020009, 8085421222, '2017-02-01 00:16:40'),
(257, 1, '1', '204', 'The tubelight in front of our room has lost its grip from the ceiling and fallen.\r\nIt is hanging just from the wires which are used to provide it electricity.\r\nTake action as soon as possible or the tubelight may fall and tube me break and simply wasted.', 'electrical', 160010010, 8867539675, '2017-02-28 12:34:56'),
(258, 1, '0', '', 'Test complaint.', 'other', 160010003, 8879585099, '2017-09-02 16:48:18'),
(259, 1, '1', '210', 'Test ', 'carpentry', 170010031, 8903784784, '2017-09-02 16:51:31'),
(260, 1, '1', '214', 'Door hinge completely broken.\r\nCurrently the door can\'t be locked at all, neither from inside nor from outside.\r\n\r\nKindly fix it as soon as possible, as it is a breach to our security and privacy.', 'carpentry', 170020039, 8700791783, '2017-09-02 17:31:33'),
(261, 1, '2', '313', 'Bathroom tube light not working', 'electrical', 170030024, 9113835046, '2017-09-02 17:57:29'),
(262, 1, '2', '313', 'bathroom light is not working', 'electrical', 170030028, 9703283331, '2017-09-02 19:42:05'),
(263, 1, '2', '309', 'cupboard lock is broken and door handle is broken.. ', 'carpentry', 170030016, 9480341335, '2017-09-04 20:51:16'),
(264, 1, '1', '211', 'Hhgf', 'carpentry', 170010031, 8903784784, '2017-09-19 01:14:59'),
(265, 1, '1', '211', 'Sound is coming from fan', 'electrical', 170010019, 9492951228, '2017-09-19 01:18:56'),
(266, 2, '2', '312', 'In our room fans are not rotating  fast and also air is not coming', 'electrical', 170020028, 9483968475, '2017-10-25 19:14:06'),
(267, 1, '1', '203', 'Tubelight in the bathroom is not working. Facing a lot of problem because of that.', 'electrical', 170010016, 7013270204, '2017-10-31 20:58:56'),
(268, 1, '2', '315', 'One of the fans in our room is not picking up speed. Further, the hood of the fan is tilted.\r\nIts condenser needs to be replaced and the hood needs to be properly fitted to the rod.\r\n', 'electrical', 170030035, 7036053327, '2017-10-31 21:00:15'),
(269, 1, '2', '310', 'My cupboard is completely locked \r\nIt is not opening .carpenter should remove the old lock and keep the new \r\nI have already complained to many people but there is no response ', 'carpentry', 170020035, 8331058662, '2017-10-31 21:02:30'),
(270, 1, '2', '315', 'Shelves in my cupboard are not present. ', 'carpentry', 170030035, 7036053327, '2017-10-31 21:02:51'),
(271, 1, '2', '301', 'No Wi Fi from past one week', 'other', 170010009, 9461015543, '2017-10-31 21:05:37'),
(272, 1, '', '', 'Washing machine maintenance:\r\nThe washed clothes are smothered by a sticky greyish substance, which is possibly the sludge that gets accumulated in the inner water tubes of the machine.\r\nThe fluff filters of these machines need to be cleaned regularly.', 'other', 170030035, 7036053327, '2017-10-31 21:08:10'),
(273, 1, '2', '312', 'Fans not working ', 'electrical', 170030001, 9731048198, '2017-10-31 21:49:52'),
(274, 1, '1', '203', 'Tube light in bathroom not working. Electrician came and tube light then worked for few hours but then again not working. Kindly replace ', 'electrical', 170010003, 8454864451, '2017-10-31 22:42:10'),
(275, 1, '1', '214', '1) One tubelight is not functioning\r\n2) door knob is knocked off', 'electrical', 170020005, 7588044188, '2017-10-31 22:55:43'),
(276, 1, '2', '306', '1) emergency light is not working\r\n2)desk locker keys are not there', 'electrical', 170030005, 9821732919, '2017-10-31 23:01:46'),
(277, 1, '2', '312', 'Fans not working  property ', 'electrical', 170020028, 9483968475, '2017-11-06 00:49:00'),
(278, 1, '2', '312', 'Fans not working  property ', 'electrical', 170020028, 9483968475, '2017-11-06 00:49:01'),
(279, 1, '2', '311', 'Foul smell in bathroom', 'sensitive', 170030012, 9772449721, '2017-11-10 10:46:28'),
(280, 1, '1', '201', 'Sparks coming out from fan.\r\nBurning smell is also there', 'electrical', 170010004, 8692854808, '2017-11-12 14:16:43'),
(281, 1, '1', '201', 'The fan produced sparks and burning smell and doesn\'t spin.', 'electrical', 170010011, 9436916948, '2017-11-24 23:24:30'),
(282, 1, '1', '210', 'Fan works but rotates extremely slow (it looks as if it is a slow motion video)', 'electrical', 170010031, 8903784784, '2018-02-22 21:56:07'),
(283, 2, '1', '311', 'switch', 'electrical', 160010003, 8879585099, '2018-08-30 20:27:22'),
(284, 1, '1', '311', 'table', 'carpentry', 160010003, 8879585099, '2018-08-30 20:31:06'),
(285, 0, '0', '311', 'switch', 'electrical', 160010003, 8879585099, '2018-08-30 20:35:27'),
(286, 0, '0', '100', 'switch!', 'electrical', 160010003, 8879585099, '2018-08-30 20:40:33'),
(287, 15, '0', '1', 'Test after rectifying mailer()', 'other', 160010003, 8879585099, '2018-08-31 15:19:32'),
(288, 15, '0', '0', 'test 10:00', 'other', 160010003, 8879585099, '2018-08-31 16:29:51'),
(289, 15, '0', '1', 'test electrical issue ', 'electrical', 160010003, 8879585099, '2018-09-01 02:44:02'),
(290, 15, '0', '1', 'test ', 'other', 160010003, 8879585099, '2018-09-01 02:49:39'),
(291, 15, '0', '1', 'Test electrical!', 'electrical', 160010003, 8879585099, '2018-09-01 02:59:06'),
(292, 0, '1', '201', 'Tube light', 'electrical', 180010038, 6377868398, '2018-09-01 21:43:05'),
(293, 1, '1', '201', 'Flushing ', 'plumbing', 180010038, 6377868398, '2018-09-01 21:44:47'),
(294, 1, '1', '201', 'Flushing', 'plumbing', 180010038, 6377868398, '2018-09-01 21:46:12'),
(295, 0, '1', '201', 'Tubelight', 'plumbing', 180010038, 6377868398, '2018-09-01 21:57:54'),
(296, 1, '1', '201', 'Flushing', 'plumbing', 180010038, 6377868398, '2018-09-01 21:58:26'),
(297, 1, '1', '204', 'Bathroom tubelight is not working', 'electrical', 180030010, 7782060859, '2018-09-03 19:41:00'),
(298, 0, '2', '318', 'Tubelight in the washroom is not working. ', 'electrical', 180030036, 8429816003, '2018-09-03 19:49:09'),
(299, 0, '2', '311', 'only one front door keys', 'other', 180030040, 9820687340, '2018-09-03 19:49:28'),
(300, 0, '1', '203', '????Chair is not there. \r\n????Tubelight is not working. \r\n????Table keys are not there. \r\n????Hooks are not there. \r\n????Cupboard keys are not working. \r\n????Dampness on wall. ', 'carpentry', 180010030, 9586270003, '2018-09-03 19:50:37'),
(301, 1, '1', '204', 'Bathroom light is not working ', 'electrical', 180010009, 6354808691, '2018-09-03 19:52:37'),
(302, 0, '1', '215', 'Insufficient study table and cupboards ', 'other', 180030017, 6379510055, '2018-09-03 19:55:08'),
(303, 0, '1', '201', 'Tube light not working', 'electrical', 180010038, 6377868398, '2018-09-03 20:05:00'),
(304, 1, '1', '201', 'Flushing problom', 'plumbing', 180010038, 6377868398, '2018-09-03 20:06:09'),
(305, 0, '1', '201', 'Flushing problem', 'plumbing', 180020022, 9676308243, '2018-09-03 20:07:53'),
(306, 0, '1', '201', 'Tube light', 'electrical', 180020022, 9676308243, '2018-09-03 20:08:40'),
(307, 0, '2', '317', 'Tubelights not working\r\nBathroom door not closing\r\nLocker keys not issued', 'electrical', 180020015, 9769719309, '2018-09-03 20:13:17'),
(308, 0, '1', '203', '????Chair is not there. \r\n????Table keys are not there. \r\n????Cupboard keys are not working. ', 'carpentry', 180010030, 9586270003, '2018-09-03 20:24:28'),
(309, 0, '1', '204', 'Bathroom light is not working ', 'electrical', 180010009, 6354808691, '2018-09-03 20:24:37'),
(310, 0, '2', '305', 'Room keys are not issued.', 'other', 180020014, 7013143705, '2018-09-03 20:28:10'),
(311, 2, '0', 'House no:6', 'We require two led bulbs one in bathroom and other one in entrance room.', 'electrical', 170010036, 9550926127, '2018-09-03 20:40:48'),
(312, 0, '2', '317', '1. bathroom light is not working.\r\n2.one room light also not working.\r\n3.bathroom gate doesn\'t closes it is in very bad condition.', 'electrical', 180010021, 9755550582, '2018-09-03 20:47:57'),
(313, 0, '1', '211', 'In our bathroom  flush is not working.water is blocking  we don\'t have another way to use. So please repair it .we are complaining fourth time about this.', 'plumbing', 180030021, 9381072557, '2018-09-03 20:52:12'),
(314, 0, '2', '310', '1.Gyser is not working hence we are not getting hot water.\r\n\r\n2.Hinges on one of the doors is broken and is swinging and also about to break.\r\n\r\n3. Main door and bathroom door locks are broken.\r\nI have written issues other than electrical also.', 'electrical', 180030024, 8179489599, '2018-09-03 20:52:44'),
(315, 0, '1', '211', 'We have only 3 study tables .our room strength is 4 .we are problem while studying and drawing tutorials .', 'carpentry', 180010018, 9916599474, '2018-09-03 20:55:30'),
(316, 0, '1', '212', 'Open Wires and fuse bulb', 'electrical', 180020002, 9962930625, '2018-09-03 21:57:53'),
(317, 1, '0', '6', 'The flush is not proper as it is not sufficiently strong enough to pass water through the drain', 'plumbing', 170030033, 9980984107, '2018-09-03 22:40:44'),
(318, 2, '2', '3', 'Router keeps disconnecting constantly', 'other', 170010033, 9542670476, '2018-09-04 00:24:41'),
(319, 8, '1', '5', 'Bulbs need to be replaced', 'electrical', 160010039, 8050851286, '2018-09-04 03:14:41'),
(320, 1, '1', '217', 'One of the tubelight is not working.\r\nAnd bed light is also not there.', 'electrical', 180010010, 9849061230, '2018-09-04 07:37:28'),
(321, 1, '1', '217', 'One of the tubelight is not working.\r\nAnd bed light is also not there.', 'electrical', 180010010, 9849061230, '2018-09-04 07:37:28'),
(322, 1, '1', '217', 'One of the tubelight is not working.\r\nAnd bed light is also not there.', 'electrical', 180010010, 9849061230, '2018-09-04 07:37:28'),
(323, 1, '1', '217', 'One of the tubelight is not working.\r\nAnd bed light is also not there.', 'electrical', 180010010, 9849061230, '2018-09-04 07:37:29'),
(324, 1, '1', '217', 'One of the tubelight is not working.\r\nAnd bed light is also not there.', 'electrical', 180010010, 9849061230, '2018-09-04 07:37:29'),
(325, 1, '1', '217', 'One of the tubelight is not working.\r\nAnd bed light is also not there.', 'electrical', 180010010, 9849061230, '2018-09-04 07:37:29'),
(326, 0, '2', '308', 'Water gets chocked in sink due to chocking of outlet holes.', 'plumbing', 180030018, 9130072278, '2018-09-04 08:21:52'),
(327, 1, '0', '101', 'Sink tap is leaking ,need hanger in bathroom. Both are necessary for us ', 'plumbing', 180020038, 7995369478, '2018-09-04 10:37:34'),
(328, 1, '0', '101', 'Wash basin tap is leaking, need hanger in bathroom. Both are necessary for us ', 'plumbing', 180020038, 7995369478, '2018-09-04 10:40:46'),
(329, 0, '0', '101', 'Washbasin sink is leaking, need hanger in bathroom .both are necessary for us ', 'plumbing', 180020038, 7995369478, '2018-09-04 10:43:42'),
(330, 4, '2', 'null', 'table tennis, table not there. Please sort that out, we need tables to play table tennis!!!', 'sensitive', 160000000, 1234567890, '2018-09-04 19:59:14'),
(331, 4, '2', 'null', 'Clean the water filter storage tank. Water is having a pungent smell.', 'other', 160000000, 1234567890, '2018-09-04 20:00:13'),
(332, 4, '0', '6', 'Bathroom fittings (hooks and towel hanger) missing', 'plumbing', 160010003, 8879585099, '2018-09-04 21:49:48'),
(333, 0, 'O', '102', '1. Water gets stagnated in the basin.\r\n2. Flush is not working properly.', 'plumbing', 180020039, 7038411894, '2018-09-05 07:48:49'),
(334, 0, '0', '102', 'Chair handle is broken.', 'carpentry', 180020039, 7038411894, '2018-09-05 07:49:56'),
(335, 0, '2', '301', 'Not received keys for drawers of desk drawer', 'carpentry', 180030039, 8861139765, '2018-09-05 22:26:24'),
(336, 1, '2', '318', 'Bathroom tubelight is not working', 'electrical', 180030041, 8275350325, '2018-09-05 22:42:53'),
(337, 1, '2', '313', 'Tap not working at all.', 'plumbing', 180010032, 7557885422, '2018-09-05 22:45:47'),
(338, 0, '0', '103', 'Water spray don\'t works in the bathroom.', 'plumbing', 180010012, 8980091029, '2018-09-06 07:04:37'),
(339, 1, '0', '104', 'Keys are not provided for the locker of study table.', 'other', 180030043, 9381125178, '2018-09-06 07:35:35'),
(340, 3, '', '', 'Hello Ojas Raundale, I\'m Harshal here. There was a bug in code which was not allowing Hostel 3 complaints to be submitted. This is a test complaint, please log in and delete this complaint.', 'other', 160010003, 8879585099, '2018-09-08 01:06:13'),
(341, 0, '0', '105', 'Rod hangers  are required in bathroom.', 'housekeeping', 180010026, 9381537239, '2018-09-08 08:16:14'),
(342, 0, '2', '308', 'No Screws for hanger and door-lock .', 'carpentry', 180030018, 9130072278, '2018-09-09 11:08:05'),
(343, 6, '0', '1', 'Flush isn\'t working', 'plumbing', 160020024, 8277546470, '2018-09-09 12:19:36'),
(344, 6, '0', '6', 'Latch of main door broke.', 'carpentry', 160010027, 8277494978, '2018-09-10 08:58:22'),
(345, 6, '0', '6', 'Toilet seat is not fixed properly ', 'plumbing', 160010027, 8277494978, '2018-09-10 09:04:04'),
(346, 1, '2', '302', 'Cupboard has been broken from days.\r\nDo repairs ASAP.', 'carpentry', 180030037, 9109534276, '2018-09-10 09:51:36'),
(347, 15, '0', '6', 'test complaint', 'electrical', 160010003, 8879585099, '2018-09-10 19:47:11'),
(348, 0, '0', '102', 'Algae are there in bathroom ceiling', 'other', 180020039, 7038411894, '2018-09-10 23:53:24'),
(349, 6, '0', '6', 'Water flow from the water inlet valve  is very thin in washing machine. Though the timer is showing 45 mins it is taking 1 hr 30 mins .', 'plumbing', 160010026, 8277624223, '2018-09-12 12:40:15'),
(350, 6, '2', 'flat 4. Ins', 'Tubelight not working', 'electrical', 183041001, 8050346246, '2018-09-14 13:16:31'),
(351, 6, '0', '1', 'New buld fixation in dinning room', 'electrical', 160020024, 8277546470, '2018-09-15 14:37:02'),
(352, 2, '1', '2 , Outside', 'WiFi is disconnecting , and very slow for the remaining time .', 'internet', 170030021, 7981320579, '2018-09-17 23:59:02'),
(353, 6, '0', '1', 'Blockage of hot water tap ', 'plumbing', 160020024, 8277546470, '2018-09-20 20:19:22'),
(354, 6, '0', '1', ' Requirement of buld in balcony ', 'electrical', 160020024, 8277546470, '2018-09-20 20:20:37'),
(355, 3, '1', '1', 'Water pipe below wash basin in leaking a lot. Please replace immediately', 'plumbing', 170010003, 8454864451, '2018-09-25 08:00:13'),
(356, 4, '', '', 'Please check for a beehive somewhere. It’s impossible to go to 2nd floor during early morning (6am) because of the presence of honey bees along the stairs.', 'sensitive', 160010003, 8879585099, '2018-10-07 05:50:30'),
(357, 1, '1', '1', 'infinity', 'sensitive', 160010003, 8879585099, '2018-10-09 21:34:29'),
(358, 1, '1', '1', 'Dhjshzj', 'electrical', 160010005, 9999999999, '2018-10-11 16:27:30'),
(359, 1, '1', '1', 'Susu', 'plumbing', 160010005, 8888888888, '2018-10-11 16:28:51'),
(360, 1, '1', '1', 'efgtfyju7yo8dfghdj', 'carpentry', 160010005, 8888888888, '2018-10-11 16:49:09'),
(361, 6, '0', '1', 'Switch isn\'t working in dinning room', 'electrical', 160020024, 8277546470, '2018-10-13 12:16:37'),
(362, 1, '2', 'H-3', 'From few days, water in the tap is coming at very slow speed.', 'plumbing', 170030016, 9131498741, '2018-10-16 15:44:56'),
(363, 0, '0', '101', 'Granting Leave for going home on the occasion of dussehra\r\nThat is from 18/10/18 to 20/10/18\r\nLeaving at evening 4.30 in the evening\r\nSo, I kindly request to grant me leave', 'other', 180020020, 9381595332, '2018-10-16 16:40:38'),
(364, 0, '0', '105', 'Granting a leave for going home  \r\nWe are  leaving on 18/10/2018 at 1:30 to 21/10/2018 by 1:00  on the occasion of dasara . So I kindly request to grant me leave ', 'other', 180020016, 9482886382, '2018-10-16 16:41:07'),
(365, 1, '0', '104', 'No keys for the locker of my study table', 'carpentry', 180030043, 9381125178, '2018-10-16 21:13:12'),
(366, 1, '0', '104', 'No keys for the locker of my study table', 'carpentry', 180030043, 9381125178, '2018-10-16 21:13:20'),
(367, 2, '2', '4', 'Too slow ', 'internet', 170010015, 8318615091, '2018-10-16 21:14:51'),
(368, 0, '0', '104', 'No keys for the locker of my study table.', 'carpentry', 180030043, 9381125178, '2018-10-16 21:41:04'),
(369, 1, '0', '6', 'Lack of water flow at the outside tap in the balcony ', 'plumbing', 170030033, 9980984107, '2018-10-16 21:44:51'),
(370, 8, '2', '2', 'Door broken', 'carpentry', 160020010, 9856248756, '2018-10-17 00:43:07'),
(371, 0, '2', '312', 'Grant me a leave sir, so that i can attend my sisters marriage...From 17th-22nd..', 'other', 180020037, 9704866726, '2018-10-17 10:31:16'),
(372, 5, '0', '1', 'The handle of toilet door has come off. It needs to be fixed.', 'carpentry', 183141002, 7738706532, '2018-10-17 11:54:31'),
(373, 2, '2', '4', 'Washing machine not working properly', 'other', 170030030, 9703364660, '2018-10-17 19:05:40'),
(374, 0, '2', '315', 'Leave Request. 18/10/18 Thursday 3:00 pm to 21/10/18 Sunday 10:00 pm.', 'other', 180020006, 9819001101, '2018-10-18 13:38:24'),
(375, 6, '0', '1', 'Electrical switch boards not working.', 'electrical', 160010002, 8277541872, '2018-10-19 17:28:12'),
(376, 6, '0', '1', 'Electrical switch boards not working.', 'electrical', 160010002, 8277541872, '2018-10-19 17:29:30'),
(377, 1, '3', '', 'Water cooler has spoiled. Water taste is too bad. ', 'other', 170020028, 9483968475, '2018-10-21 12:49:12'),
(378, 6, '0', '6', 'Honeybees in hostel corridors in all floors and tv room  due to the beehive in abandoned building opposite to hostel.', 'sensitive', 160010027, 8277494978, '2018-10-22 13:38:32'),
(379, 0, '1', '218', 'Water heater  is not working', 'electrical', 180010029, 9370333926, '2018-10-23 18:59:29'),
(380, 8, '2', '3', 'We don\'t have glass panel in our toilet.\r\nAnd we have issue with our bathroom cloth hanger, it is not screwed properly to the wall\r\nas it comes out regularly along with some sand out of the wall ( maybe bricks).', 'carpentry', 160010016, 7978313466, '2018-10-23 23:31:28'),
(381, 8, '1', '2', 'Main Door is broken.\r\nHandle of back door is broken.\r\nThe wash basin will fall very soon.\r\n\r\n', 'carpentry', 160020012, 9470778815, '2018-10-24 00:26:35'),
(382, 1, '', '', 'There is no water in the water in the water-cooler since 5 days.', 'other', 170030016, 9480341335, '2018-10-24 23:05:54'),
(383, 0, '2', '308', 'Geyser is not working (it has been checked during the given geyser-timing ).Not getting hot water.', 'electrical', 180030018, 9130072278, '2018-10-25 07:54:28'),
(384, 2, '0', 'House no:6', 'Hanger came out of the wall, as it is loosened. Need to drill another hole. Requesting to solve problem as soon as possible.', 'carpentry', 170010036, 9550926127, '2018-10-25 14:38:15'),
(385, 2, '0', 'House no:6', 'Hanger came out of the wall, as it is loosened. Need to drill another hole. Requesting to solve problem as soon as possible', 'carpentry', 170010036, 9550926127, '2018-10-25 14:40:17'),
(386, 1, '0', '1', 'Low voltage power in some houses.', 'electrical', 170030007, 9834646408, '2018-10-26 14:33:22'),
(387, 2, '0', 'House no:6', 'Bath room door broken.', 'carpentry', 170010036, 9550926127, '2018-10-27 09:22:04'),
(388, 1, '0', '1', 'Fan is not working', 'electrical', 170010028, 9483030971, '2018-10-30 18:40:21'),
(389, 2, '1', '2', 'no hooks', 'other', 170010027, 8310206163, '2018-10-30 18:41:40'),
(390, 4, '', '', 'Water Purifier\'s filter needs to be changed.', 'sensitive', 160010003, 8879585099, '2018-10-31 23:06:05'),
(391, 1, '0', 'H6', '1.Hot water tap is leaking.\r\n2.water is not coming with the required rate of flow in the sink.', 'plumbing', 170030034, 9148309474, '2018-11-02 10:48:17'),
(392, 1, '0', 'H6', 'Hanger came out of the wall, so there is a need to fix it again.', 'housekeeping', 170030034, 9148309474, '2018-11-02 10:49:32'),
(393, 0, '2', '302', 'Basin pipe broken. So basin tap not working. Please fix urgently', 'plumbing', 180010014, 9372926548, '2018-11-02 23:20:17'),
(394, 0, '1st', '201', 'Bathroom light not working', 'electrical', 180010033, 9167229258, '2018-11-03 00:15:17'),
(395, 0, '1', '204', 'Fan is not working ', 'electrical', 180030010, 7782060859, '2018-11-09 13:14:34'),
(396, 1, '0', 'House - 1 (', 'Hooks are not there in my room, it is making me difficult to dry my clothes . Please solve this problem as soon as possible ', 'carpentry', 170020034, 9951157521, '2018-11-09 14:13:39'),
(397, 1, '1', '5', 'Water cooler\'s dispenser isn\'t functioning and hence the water is of bad quality', 'sensitive', 170010039, 9182115058, '2018-11-10 09:39:37'),
(398, 1, '1', '5', 'Washing machine filter is too dirty', 'housekeeping', 170010039, 9182115058, '2018-11-14 19:45:11'),
(399, 6, '0', '1', 'Switch boards are not working', 'electrical', 160010002, 8277541972, '2018-11-16 15:05:05'),
(400, 6, '1', 'Outside roo', 'Lizards, frogs, rats and honey bees are troubling a lot .', 'other', 170010032, 9108034501, '2018-11-19 01:09:04'),
(401, 6, '2', '4', '1.There are beehives in some abandoned buildings near the Hostel No- 6 (Saveri) and as a result, bees are entering the hostel building and flats.\r\n2.There are giant rats inside the building.', 'other', 173041001, 7416452051, '2018-11-19 10:19:56'),
(402, 6, '0', 'outside roo', 'Main door and back door latch broke', 'carpentry', 160010027, 8277494978, '2018-11-20 07:16:43'),
(403, 6, '0', '6', 'The latch of the door is completely broken. We require a new latch for the door. ', 'carpentry', 160030030, 9502701360, '2018-11-21 09:59:38'),
(404, 6, '0', '6', 'Requirement of hooks in some rooms  for tying clothes. ', 'carpentry', 160030030, 9502701360, '2018-11-21 10:01:06'),
(405, 10, '2', '3', 'No light in washroom', 'electrical', 160020025, 9542956271, '2018-11-27 12:24:28');
INSERT INTO `all_complains` (`complain_id`, `hostel_no`, `floor_no`, `room_no`, `issue`, `issue_type`, `roll_no`, `phone_no`, `time`) VALUES
(406, 1, '0', 'House - 1 (', 'Hooks came from the wall that were drilled', 'carpentry', 170020034, 9951157521, '2018-11-28 23:45:43'),
(407, 1, '1', '5', 'No water from water dispenser', 'other', 170010039, 9182115058, '2018-11-29 21:12:00'),
(408, 1, '0', '1', 'There\'s a lot of Bandwidth Throttling. The download speed on Google servers doesn\'t exceed 50kbps.', 'internet', 170030007, 9834646408, '2018-12-03 09:45:58'),
(409, 0, '2', '311', 'The water geysers in our washroom have not been working since the midsems. ', 'other', 180030040, 9820687340, '2018-12-05 08:53:36'),
(410, 1, '0', '1', 'Water cooler isn\'t working.', 'other', 170030007, 9834646408, '2018-12-23 12:23:24'),
(411, 5, '3', '', 'TV remote battery cells are missing.', 'other', 173031003, 8237123330, '2018-12-25 10:44:02'),
(412, 0, '2', '311', 'Tubelight of bathroom not working. Geyser not working. ', 'electrical', 180030040, 9820687340, '2019-01-01 07:34:22'),
(413, 6, '0', '6', 'The door latch is broken and we require to get hook on wall. ', 'carpentry', 160010007, 8447169940, '2019-01-03 17:40:37'),
(414, 2, '0', '1', 'The WIFI speed is very slow and none of the websites are opening since last 2 days . We are not able to do any of our works .', 'internet', 170030021, 7981320579, '2019-01-03 19:04:57'),
(415, 2, '0', '1', 'The wifi is very slow and many times it has no internet access.', 'internet', 170030036, 7780679258, '2019-01-03 19:05:15'),
(416, 2, '0', '1', 'The outer latch/handle of the bathroom door is broken .', 'carpentry', 170030021, 7981320579, '2019-01-03 19:05:59'),
(417, 2, '0', '1', 'There were some weak hooks in our room which have come out and we need them to hang our clothes .', 'carpentry', 170030021, 7981320579, '2019-01-03 19:07:27'),
(418, 2, '0', '1', '1.door handle of bathroom is broken .\r\n2.one the hook has worn out .There is a need of  a hook.', 'carpentry', 170030036, 7780679258, '2019-01-03 19:07:48'),
(419, 5, '1', '5', 'Flush and tap in the toilet are blocked.', 'plumbing', 183081001, 8547707199, '2019-01-04 18:33:17'),
(420, 1, '1', '5', 'Water flow speed is low in balcony tap', 'plumbing', 170010039, 9182115058, '2019-01-04 22:16:49'),
(421, 6, '2', '4', '1. Hot water is not available .\r\n2. Two dustbins are required for two floors( floor 1 and 2) .', 'other', 173041001, 7416452051, '2019-01-08 11:18:44'),
(422, 2, '1', '2(left wing', 'Water is not coming properly.\r\nIt comes very slowly', 'plumbing', 170020014, 7754913060, '2019-01-08 13:51:45'),
(423, 6, '0', '6', 'Cupboard lock is not working.', 'carpentry', 160010038, 8433022578, '2019-01-09 12:04:55'),
(424, 6, '0', '1', 'Door lock/knob is broken and needs to be repaired', 'carpentry', 160010002, 8277541872, '2019-01-10 09:14:14'),
(425, 0, '2', '305', 'water is not coming in one of the taps from which hot water comes', 'plumbing', 180010027, 9619708003, '2019-01-13 12:47:12'),
(426, 1, '1', '5', 'Washing machine of hostel 1 isn\'t working properly', 'other', 170010039, 9182115058, '2019-01-13 17:47:22'),
(427, 6, '0', '6', 'Plug point is not working. ', 'electrical', 160010027, 8277494978, '2019-01-15 23:21:16'),
(428, 6, '0', '6', 'taps on third floor (tv room) washroom are not working', 'plumbing', 160010027, 8277494978, '2019-01-15 23:43:10'),
(429, 6, '0', 'Inside room', 'Need 4 hooks in my room.', 'other', 160030030, 9502701360, '2019-01-17 19:09:21'),
(430, 6, '0', 'Flat No-1 K', 'Need 4 hooks in my room.', 'other', 160020029, 9441972742, '2019-01-17 20:07:56'),
(431, 6, '2', '4', 'There are no hooks to hang curtain ..I request you to get it done soon .\r\nThank you\r\nMonika bai m g', 'carpentry', 183041001, 8050346246, '2019-01-19 10:22:41'),
(432, 1, '1', '5', 'Water filter of hostel not working', 'sensitive', 170010039, 9182115058, '2019-01-19 13:41:10'),
(433, 6, '0', 'Flat No-1 K', 'Need window glass in wash room.', 'other', 160020029, 9441972742, '2019-01-21 17:32:21'),
(434, 6, '2', '4', 'Hot water was not available this morning.', 'other', 173041001, 7416452051, '2019-01-24 11:04:55'),
(435, 1, '0', '1', 'Water cooler isn\'t working', 'other', 170030007, 9834646408, '2019-01-25 23:26:04'),
(436, 1, '1', 'House 5 ins', 'Need hooks in room', 'other', 170010023, 9492828425, '2019-01-28 19:24:21'),
(437, 1, '0', '6', 'Washing machines need to be cleaned, this has to be done regularly also. ', 'housekeeping', 170030033, 9980984107, '2019-02-04 16:20:00'),
(438, 6, '0', '1', 'Cupboard lock is not repaired still. I\'m having a lot of things getting stolen because I can\'t lock anywhere. Please repair urgently.', 'carpentry', 160010038, 8433022578, '2019-02-07 11:27:55'),
(439, 1, 'Ground', '6', 'Fan of kitchen is sparking too much on switching it on\r\n', 'electrical', 170020012, 8009155265, '2019-02-08 03:59:48'),
(440, 6, '0', '1', 'Switch board in outside room is not working', 'electrical', 160020032, 6300064096, '2019-02-18 19:55:55'),
(441, 6, '0', '1', 'Switch board in outside room is not working', 'electrical', 160020032, 6300064096, '2019-02-18 19:56:07'),
(442, 1, '0', '6', 'Hot water tap is leaking', 'plumbing', 170030033, 9980984107, '2019-02-19 07:04:39'),
(443, 1, '0', '6', 'Lack of hot water early in the morning,\r\nLukewarm comes out of the tap at around 7 am', 'other', 170030033, 9980984107, '2019-02-19 07:06:38'),
(444, 6, '2', '4', 'Hot water was not available after 7:45am, this morning. ', 'other', 173041001, 7416452051, '2019-02-21 08:43:19'),
(445, 1, '3', 'Washing mac', 'We are getting shock when we touch water cooler. ', 'electrical', 170020028, 8121353869, '2019-02-22 14:02:02'),
(446, 1, '2', '3', 'Fan got burnt in inside room.', 'electrical', 170010014, 9483983364, '2019-02-23 09:28:16'),
(447, 1, '1', '5', 'Ceiling Fan problem', 'electrical', 170030005, 9821732919, '2019-02-24 14:10:29'),
(448, 1, '1', 'House 5 ins', 'Internet randomly disconnects and when trying to reconnect, it gets stuck at \"Obtaining ip address...\". On deeper observation, it says \"NETWORK_SELECTION_DISABLED_ASSOSCIATION_REJECTION=1  NETWORK_SELECTION_DISABLED_DHCP_FAILURE\"', 'internet', 170010023, 9492828425, '2019-02-25 15:25:10'),
(449, 1, '2', '3', 'Hooks and shirt hanger in dining room and kitchen got broken', 'carpentry', 170020028, 8121353869, '2019-02-27 12:23:05'),
(450, 1, '1', '5', 'Water coming from taps is very dirty', 'plumbing', 170010039, 9182115058, '2019-02-27 15:07:07'),
(451, 0, '1', '214', 'One support of almirah is broken and hanger is not attached', 'carpentry', 180030004, 9050540897, '2019-03-01 16:37:46'),
(452, 1, '0', '6', 'drinking water filter to be replaced.\r\nThe water filter is not working properly. \r\n\r\n', 'other', 170030033, 9980984107, '2019-03-01 20:23:40'),
(453, 0, 'O', '101', 'Outing or going home', 'electrical', 180020020, 9381595332, '2019-03-02 21:37:51'),
(454, 1, '1', '5', 'Water cooler not working', 'sensitive', 170010039, 9182115058, '2019-03-03 20:30:38'),
(455, 1, '1', '5', 'Washing machine needs to be cleaned', 'housekeeping', 170010039, 9182115058, '2019-03-06 07:34:22'),
(456, 1, '1', 'House 5 ins', 'No hot water in the bathroom', 'plumbing', 170010023, 9492828425, '2019-03-06 08:23:05'),
(457, 1, '1', 'House 5 ins', 'The washing machine needs to be cleaned. Whenever we wash clothes some dirty stuff gets stuck to our clothes.', 'other', 170010023, 9492828425, '2019-03-06 08:24:11'),
(458, 1, '0', '6', 'No hot water from last 3weeks', 'plumbing', 170030034, 9148309474, '2019-03-06 13:06:30'),
(459, 1, '1', '6', 'Hot water is unavailable. \r\n\r\nWashing machine is not working properly.', 'electrical', 170010020, 7993962252, '2019-03-06 21:18:25'),
(460, 6, '2', 'Hall ', 'Switch board not working.', 'electrical', 173021001, 8762345048, '2019-03-11 00:48:43'),
(461, 1, '1', '5', 'Water filter isn\'t working', 'sensitive', 170010039, 9182115058, '2019-03-11 13:36:12'),
(462, 0, '1', '203', 'Fan, Tubelight and Gyser not working', 'electrical', 180010030, 9586270003, '2019-03-13 17:31:29'),
(463, 6, '2', '4', 'Washing Machine is not working properly, as in water supply to the machine is not proper. Moreover, it does not clean dirt from the cloths completely. Also, sometimes the machine does not drain and stops automatically.', 'other', 173041001, 7416452051, '2019-03-14 09:24:22'),
(464, 0, '1', '203', 'Gyser still not working', 'electrical', 180010030, 9586270003, '2019-03-16 12:53:03'),
(465, 6, '2', 'Hall', 'Hooks to hold the curtain rod needs to be fixed.', 'carpentry', 173021001, 8762345048, '2019-03-28 16:41:40'),
(466, 1, '3', '3', 'Bathroon door hinge has broken', 'carpentry', 170020028, 8121353869, '2019-04-04 23:51:57'),
(467, 6, '1', '1', 'Cold water flow is very slow', 'plumbing', 160020024, 8277546470, '2019-04-08 10:09:57'),
(468, 6, '1', 'Kitchen', 'Cold water tap is very slow', 'plumbing', 160020029, 9441972742, '2019-04-09 11:31:46'),
(469, 1, '3', 'Washing mac', 'Water outlet blocked. Water got stagnated and stinking. \r\n', 'plumbing', 170020028, 8121353869, '2019-04-17 22:44:09'),
(470, 1, '3', 'Washing mac', 'Washing machine tub got soiled and some mud kind of stuff is coming while washing which is resulting in making the clothes worse. ', 'electrical', 170020028, 8121353869, '2019-04-17 22:45:50'),
(471, 1, '1', '5', 'There are too many house flies and fruit flies in the rooms. There should be a better sanitary protocol followed instead of having dust bins right in front of the hostel itself. Also, mesh doors for balcony should be installed.', 'housekeeping', 170010039, 9182115058, '2019-04-25 15:01:09'),
(472, 6, '2', '4', 'The washing machine is not working properly.\r\n1.The water supply to the machine is very slow, as a result it takes a longer period of time to clean.\r\n2. Since the filter inside has broken, dirt remains and clothes come out being covered with dirt. ', 'other', 173041001, 7416452051, '2019-05-17 13:38:39'),
(473, 2, '2', '4', 'My fan\'s capacitor has to be replaced. One day someone written this complaint in their book and never did come back, hoping a fast action at least now. ', 'electrical', 170030030, 9703364660, '2019-07-31 19:56:35'),
(474, 6, '0', '6', 'Washing machine is not spinning clothes', 'other', 160010026, 8277624223, '2019-08-03 09:38:25'),
(475, 6, '0', '6', 'Hooks in room are broken and new hooks are required', 'carpentry', 160010026, 8277624223, '2019-08-03 09:42:12'),
(476, 6, '0', '6', 'Washing machine is not drying clothes as it is not spinning. It needs to be repaired.', 'other', 160010027, 8277494978, '2019-08-03 09:44:58'),
(477, 6, '1', 'Outside roo', 'motor in Washing machine is not spinning', 'electrical', 170010032, 9108034501, '2019-08-05 20:41:19'),
(478, 0, '1', '311', 'Temp issue', 'other', 160010003, 8879585099, '2019-08-14 01:20:34');

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` int(11) NOT NULL,
  `composer_level` tinytext NOT NULL,
  `hostel` int(11) NOT NULL,
  `issues` text NOT NULL,
  `subject` tinytext NOT NULL,
  `message` text NOT NULL,
  `composer_name` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `announcements`
--

INSERT INTO `announcements` (`id`, `composer_level`, `hostel`, `issues`, `subject`, `message`, `composer_name`) VALUES
(1, 'secy', 5, '', 'Issues in hostel to be resolved ', 'Dear Residents,<br />\n<br />\nI want to know if there are any issues with the rooms you are staying in,<br />\nlike  electrical, carpentry etc or in general with the hostel. Reply to me with the issues that you are facing, so that i can take it up with IPS section and get it resolved.<br />\n<br />\nRegards,<br />\nMahesh R Anigol<br />\nHostel Secretary - Hostel 05', 'Mahesh Anigol');

-- --------------------------------------------------------

--
-- Table structure for table `complains`
--

CREATE TABLE `complains` (
  `complain_id` int(11) NOT NULL,
  `hostel_no` int(11) NOT NULL,
  `floor_no` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `room_no` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `issue` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `issue_type` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `roll_no` int(9) NOT NULL,
  `phone_no` bigint(12) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `complains`
--

INSERT INTO `complains` (`complain_id`, `hostel_no`, `floor_no`, `room_no`, `issue`, `issue_type`, `roll_no`, `phone_no`, `time`) VALUES
(343, 1, '2', '313', 'Tap not working at all.', 'plumbing', 180010032, 7557885422, '2018-09-05 22:45:47'),
(340, 0, '0', '102', 'Chair handle is broken.', 'carpentry', 180020039, 7038411894, '2018-09-05 07:49:56'),
(341, 0, '2', '301', 'Not received keys for drawers of desk drawer', 'carpentry', 180030039, 8861139765, '2018-09-05 22:26:24'),
(342, 1, '2', '318', 'Bathroom tubelight is not working', 'electrical', 180030041, 8275350325, '2018-09-05 22:42:53'),
(338, 4, '0', '6', 'Bathroom fittings (hooks and towel hanger) missing', 'plumbing', 160010003, 8879585099, '2018-09-04 21:49:48'),
(339, 0, 'O', '102', '1. Water gets stagnated in the basin.\r\n2. Flush is not working properly.', 'plumbing', 180020039, 7038411894, '2018-09-05 07:48:49'),
(337, 4, '2', 'null', 'Clean the water filter storage tank. Water is having a pungent smell.', 'other', 160000000, 1234567890, '2018-09-04 20:00:13'),
(336, 4, '2', 'null', 'table tennis, table not there. Please sort that out, we need tables to play table tennis!!!', 'sensitive', 160000000, 1234567890, '2018-09-04 19:59:14'),
(335, 0, '0', '101', 'Washbasin sink is leaking, need hanger in bathroom .both are necessary for us ', 'plumbing', 180020038, 7995369478, '2018-09-04 10:43:42'),
(332, 0, '2', '308', 'Water gets chocked in sink due to chocking of outlet holes.', 'plumbing', 180030018, 9130072278, '2018-09-04 08:21:52'),
(333, 1, '0', '101', 'Sink tap is leaking ,need hanger in bathroom. Both are necessary for us ', 'plumbing', 180020038, 7995369478, '2018-09-04 10:37:34'),
(334, 1, '0', '101', 'Wash basin tap is leaking, need hanger in bathroom. Both are necessary for us ', 'plumbing', 180020038, 7995369478, '2018-09-04 10:40:46'),
(354, 0, '0', '102', 'Algae are there in bathroom ceiling', 'other', 180020039, 7038411894, '2018-09-10 23:53:24'),
(331, 1, '1', '217', 'One of the tubelight is not working.\r\nAnd bed light is also not there.', 'electrical', 180010010, 9849061230, '2018-09-04 07:37:29'),
(398, 1, '0', 'H6', 'Hanger came out of the wall, so there is a need to fix it again.', 'housekeeping', 170030034, 9148309474, '2018-11-02 10:49:32'),
(352, 1, '2', '302', 'Cupboard has been broken from days.\r\nDo repairs ASAP.', 'carpentry', 180030037, 9109534276, '2018-09-10 09:51:36'),
(348, 0, '2', '308', 'No Screws for hanger and door-lock .', 'carpentry', 180030018, 9130072278, '2018-09-09 11:08:05'),
(347, 0, '0', '105', 'Rod hangers  are required in bathroom.', 'housekeeping', 180010026, 9381537239, '2018-09-08 08:16:14'),
(397, 1, '0', 'H6', '1.Hot water tap is leaking.\r\n2.water is not coming with the required rate of flow in the sink.', 'plumbing', 170030034, 9148309474, '2018-11-02 10:48:17'),
(313, 0, '2', '317', 'Tubelights not working\r\nBathroom door not closing\r\nLocker keys not issued', 'electrical', 180020015, 9769719309, '2018-09-03 20:13:17'),
(307, 1, '1', '204', 'Bathroom light is not working ', 'electrical', 180010009, 6354808691, '2018-09-03 19:52:37'),
(325, 8, '1', '5', 'Bulbs need to be replaced', 'electrical', 160010039, 8050851286, '2018-09-04 03:14:41'),
(413, 1, '1', '5', 'No water from water dispenser', 'other', 170010039, 9182115058, '2018-11-29 21:12:00'),
(303, 1, '1', '204', 'Bathroom tubelight is not working', 'electrical', 180030010, 7782060859, '2018-09-03 19:41:00'),
(304, 0, '2', '318', 'Tubelight in the washroom is not working. ', 'electrical', 180030036, 8429816003, '2018-09-03 19:49:09'),
(305, 0, '2', '311', 'only one front door keys', 'other', 180030040, 9820687340, '2018-09-03 19:49:28'),
(314, 0, '1', '203', '????Chair is not there. \r\n????Table keys are not there. \r\n????Cupboard keys are not working. ', 'carpentry', 180010030, 9586270003, '2018-09-03 20:24:28'),
(315, 0, '1', '204', 'Bathroom light is not working ', 'electrical', 180010009, 6354808691, '2018-09-03 20:24:37'),
(308, 0, '1', '215', 'Insufficient study table and cupboards ', 'other', 180030017, 6379510055, '2018-09-03 19:55:08'),
(310, 1, '1', '201', 'Flushing problom', 'plumbing', 180010038, 6377868398, '2018-09-03 20:06:09'),
(311, 0, '1', '201', 'Flushing problem', 'plumbing', 180020022, 9676308243, '2018-09-03 20:07:53'),
(312, 0, '1', '201', 'Tube light', 'electrical', 180020022, 9676308243, '2018-09-03 20:08:40'),
(316, 0, '2', '305', 'Room keys are not issued.', 'other', 180020014, 7013143705, '2018-09-03 20:28:10'),
(411, 10, '2', '3', 'No light in washroom', 'electrical', 160020025, 9542956271, '2018-11-27 12:24:28'),
(412, 1, '0', 'House - 1 (', 'Hooks came from the wall that were drilled', 'carpentry', 170020034, 9951157521, '2018-11-28 23:45:43'),
(318, 0, '2', '317', '1. bathroom light is not working.\r\n2.one room light also not working.\r\n3.bathroom gate doesn\'t closes it is in very bad condition.', 'electrical', 180010021, 9755550582, '2018-09-03 20:47:57'),
(319, 0, '1', '211', 'In our bathroom  flush is not working.water is blocking  we don\'t have another way to use. So please repair it .we are complaining fourth time about this.', 'plumbing', 180030021, 9381072557, '2018-09-03 20:52:12'),
(320, 0, '2', '310', '1.Gyser is not working hence we are not getting hot water.\r\n\r\n2.Hinges on one of the doors is broken and is swinging and also about to break.\r\n\r\n3. Main door and bathroom door locks are broken.\r\nI have written issues other than electrical also.', 'electrical', 180030024, 8179489599, '2018-09-03 20:52:44'),
(321, 0, '1', '211', 'We have only 3 study tables .our room strength is 4 .we are problem while studying and drawing tutorials .', 'carpentry', 180010018, 9916599474, '2018-09-03 20:55:30'),
(322, 0, '1', '212', 'Open Wires and fuse bulb', 'electrical', 180020002, 9962930625, '2018-09-03 21:57:53'),
(323, 1, '0', '6', 'The flush is not proper as it is not sufficiently strong enough to pass water through the drain', 'plumbing', 170030033, 9980984107, '2018-09-03 22:40:44'),
(344, 0, '0', '103', 'Water spray don\'t works in the bathroom.', 'plumbing', 180010012, 8980091029, '2018-09-06 07:04:37'),
(345, 1, '0', '104', 'Keys are not provided for the locker of study table.', 'other', 180030043, 9381125178, '2018-09-06 07:35:35'),
(399, 0, '2', '302', 'Basin pipe broken. So basin tap not working. Please fix urgently', 'plumbing', 180010014, 9372926548, '2018-11-02 23:20:17'),
(400, 0, '1st', '201', 'Bathroom light not working', 'electrical', 180010033, 9167229258, '2018-11-03 00:15:17'),
(401, 0, '1', '204', 'Fan is not working ', 'electrical', 180030010, 7782060859, '2018-11-09 13:14:34'),
(368, 1, '2', 'H-3', 'From few days, water in the tap is coming at very slow speed.', 'plumbing', 170030016, 9131498741, '2018-10-16 15:44:56'),
(402, 1, '0', 'House - 1 (', 'Hooks are not there in my room, it is making me difficult to dry my clothes . Please solve this problem as soon as possible ', 'carpentry', 170020034, 9951157521, '2018-11-09 14:13:39'),
(361, 3, '1', '1', 'Water pipe below wash basin in leaking a lot. Please replace immediately', 'plumbing', 170010003, 8454864451, '2018-09-25 08:00:13'),
(362, 4, '', '', 'Please check for a beehive somewhere. It’s impossible to go to 2nd floor during early morning (6am) because of the presence of honey bees along the stairs.', 'sensitive', 160010003, 8879585099, '2018-10-07 05:50:30'),
(441, 1, '0', '1', 'Water cooler isn\'t working', 'other', 170030007, 9834646408, '2019-01-25 23:26:04'),
(474, 6, '1', 'Kitchen', 'Cold water tap is very slow', 'plumbing', 160020029, 9441972742, '2019-04-09 11:31:46'),
(369, 0, '0', '101', 'Granting Leave for going home on the occasion of dussehra\r\nThat is from 18/10/18 to 20/10/18\r\nLeaving at evening 4.30 in the evening\r\nSo, I kindly request to grant me leave', 'other', 180020020, 9381595332, '2018-10-16 16:40:38'),
(370, 0, '0', '105', 'Granting a leave for going home  \r\nWe are  leaving on 18/10/2018 at 1:30 to 21/10/2018 by 1:00  on the occasion of dasara . So I kindly request to grant me leave ', 'other', 180020016, 9482886382, '2018-10-16 16:41:07'),
(371, 1, '0', '104', 'No keys for the locker of my study table', 'carpentry', 180030043, 9381125178, '2018-10-16 21:13:12'),
(372, 1, '0', '104', 'No keys for the locker of my study table', 'carpentry', 180030043, 9381125178, '2018-10-16 21:13:20'),
(414, 1, '0', '1', 'There\'s a lot of Bandwidth Throttling. The download speed on Google servers doesn\'t exceed 50kbps.', 'internet', 170030007, 9834646408, '2018-12-03 09:45:58'),
(375, 1, '0', '6', 'Lack of water flow at the outside tap in the balcony ', 'plumbing', 170030033, 9980984107, '2018-10-16 21:44:51'),
(376, 8, '2', '2', 'Door broken', 'carpentry', 160020010, 9856248756, '2018-10-17 00:43:07'),
(377, 0, '2', '312', 'Grant me a leave sir, so that i can attend my sisters marriage...From 17th-22nd..', 'other', 180020037, 9704866726, '2018-10-17 10:31:16'),
(465, 1, '1', '6', 'Hot water is unavailable. \r\n\r\nWashing machine is not working properly.', 'electrical', 170010020, 7993962252, '2019-03-06 21:18:25'),
(380, 0, '2', '315', 'Leave Request. 18/10/18 Thursday 3:00 pm to 21/10/18 Sunday 10:00 pm.', 'other', 180020006, 9819001101, '2018-10-18 13:38:24'),
(403, 1, '1', '5', 'Water cooler\'s dispenser isn\'t functioning and hence the water is of bad quality', 'sensitive', 170010039, 9182115058, '2018-11-10 09:39:37'),
(383, 1, '3', '', 'Water cooler has spoiled. Water taste is too bad. ', 'other', 170020028, 9483968475, '2018-10-21 12:49:12'),
(404, 1, '1', '5', 'Washing machine filter is too dirty', 'housekeeping', 170010039, 9182115058, '2018-11-14 19:45:11'),
(470, 0, '1', '203', 'Gyser still not working', 'electrical', 180010030, 9586270003, '2019-03-16 12:53:03'),
(385, 0, '1', '218', 'Water heater  is not working', 'electrical', 180010029, 9370333926, '2018-10-23 18:59:29'),
(386, 8, '2', '3', 'We don\'t have glass panel in our toilet.\r\nAnd we have issue with our bathroom cloth hanger, it is not screwed properly to the wall\r\nas it comes out regularly along with some sand out of the wall ( maybe bricks).', 'carpentry', 160010016, 7978313466, '2018-10-23 23:31:28'),
(387, 8, '1', '2', 'Main Door is broken.\r\nHandle of back door is broken.\r\nThe wash basin will fall very soon.\r\n\r\n', 'carpentry', 160020012, 9470778815, '2018-10-24 00:26:35'),
(388, 1, '', '', 'There is no water in the water in the water-cooler since 5 days.', 'other', 170030016, 9480341335, '2018-10-24 23:05:54'),
(389, 0, '2', '308', 'Geyser is not working (it has been checked during the given geyser-timing ).Not getting hot water.', 'electrical', 180030018, 9130072278, '2018-10-25 07:54:28'),
(415, 0, '2', '311', 'The water geysers in our washroom have not been working since the midsems. ', 'other', 180030040, 9820687340, '2018-12-05 08:53:36'),
(416, 1, '0', '1', 'Water cooler isn\'t working.', 'other', 170030007, 9834646408, '2018-12-23 12:23:24'),
(392, 1, '0', '1', 'Low voltage power in some houses.', 'electrical', 170030007, 9834646408, '2018-10-26 14:33:22'),
(394, 1, '0', '1', 'Fan is not working', 'electrical', 170010028, 9483030971, '2018-10-30 18:40:21'),
(395, 2, '1', '2', 'no hooks', 'other', 170010027, 8310206163, '2018-10-30 18:41:40'),
(396, 4, '', '', 'Water Purifier\'s filter needs to be changed.', 'sensitive', 160010003, 8879585099, '2018-10-31 23:06:05'),
(418, 0, '2', '311', 'Tubelight of bathroom not working. Geyser not working. ', 'electrical', 180030040, 9820687340, '2019-01-01 07:34:22'),
(442, 1, '1', 'House 5 ins', 'Need hooks in room', 'other', 170010023, 9492828425, '2019-01-28 19:24:21'),
(471, 6, '2', 'Hall', 'Hooks to hold the curtain rod needs to be fixed.', 'carpentry', 173021001, 8762345048, '2019-03-28 16:41:40'),
(472, 1, '3', '3', 'Bathroon door hinge has broken', 'carpentry', 170020028, 8121353869, '2019-04-04 23:51:57'),
(473, 6, '1', '1', 'Cold water flow is very slow', 'plumbing', 160020024, 8277546470, '2019-04-08 10:09:57'),
(443, 1, '0', '6', 'Washing machines need to be cleaned, this has to be done regularly also. ', 'housekeeping', 170030033, 9980984107, '2019-02-04 16:20:00'),
(423, 2, '0', '1', 'There were some weak hooks in our room which have come out and we need them to hang our clothes .', 'carpentry', 170030021, 7981320579, '2019-01-03 19:07:27'),
(476, 1, '3', 'Washing mac', 'Washing machine tub got soiled and some mud kind of stuff is coming while washing which is resulting in making the clothes worse. ', 'electrical', 170020028, 8121353869, '2019-04-17 22:45:50'),
(467, 1, '1', '5', 'Water filter isn\'t working', 'sensitive', 170010039, 9182115058, '2019-03-11 13:36:12'),
(426, 1, '1', '5', 'Water flow speed is low in balcony tap', 'plumbing', 170010039, 9182115058, '2019-01-04 22:16:49'),
(445, 1, 'Ground', '6', 'Fan of kitchen is sparking too much on switching it on\r\n', 'electrical', 170020012, 8009155265, '2019-02-08 03:59:48'),
(475, 1, '3', 'Washing mac', 'Water outlet blocked. Water got stagnated and stinking. \r\n', 'plumbing', 170020028, 8121353869, '2019-04-17 22:44:09'),
(438, 1, '1', '5', 'Water filter of hostel not working', 'sensitive', 170010039, 9182115058, '2019-01-19 13:41:10'),
(431, 0, '2', '305', 'water is not coming in one of the taps from which hot water comes', 'plumbing', 180010027, 9619708003, '2019-01-13 12:47:12'),
(432, 1, '1', '5', 'Washing machine of hostel 1 isn\'t working properly', 'other', 170010039, 9182115058, '2019-01-13 17:47:22'),
(477, 1, '1', '5', 'There are too many house flies and fruit flies in the rooms. There should be a better sanitary protocol followed instead of having dust bins right in front of the hostel itself. Also, mesh doors for balcony should be installed.', 'housekeeping', 170010039, 9182115058, '2019-04-25 15:01:09'),
(448, 1, '0', '6', 'Hot water tap is leaking', 'plumbing', 170030033, 9980984107, '2019-02-19 07:04:39'),
(449, 1, '0', '6', 'Lack of hot water early in the morning,\r\nLukewarm comes out of the tap at around 7 am', 'other', 170030033, 9980984107, '2019-02-19 07:06:38'),
(451, 1, '3', 'Washing mac', 'We are getting shock when we touch water cooler. ', 'electrical', 170020028, 8121353869, '2019-02-22 14:02:02'),
(452, 1, '2', '3', 'Fan got burnt in inside room.', 'electrical', 170010014, 9483983364, '2019-02-23 09:28:16'),
(453, 1, '1', '5', 'Ceiling Fan problem', 'electrical', 170030005, 9821732919, '2019-02-24 14:10:29'),
(454, 1, '1', 'House 5 ins', 'Internet randomly disconnects and when trying to reconnect, it gets stuck at \"Obtaining ip address...\". On deeper observation, it says \"NETWORK_SELECTION_DISABLED_ASSOSCIATION_REJECTION=1  NETWORK_SELECTION_DISABLED_DHCP_FAILURE\"', 'internet', 170010023, 9492828425, '2019-02-25 15:25:10'),
(455, 1, '2', '3', 'Hooks and shirt hanger in dining room and kitchen got broken', 'carpentry', 170020028, 8121353869, '2019-02-27 12:23:05'),
(456, 1, '1', '5', 'Water coming from taps is very dirty', 'plumbing', 170010039, 9182115058, '2019-02-27 15:07:07'),
(457, 0, '1', '214', 'One support of almirah is broken and hanger is not attached', 'carpentry', 180030004, 9050540897, '2019-03-01 16:37:46'),
(458, 1, '0', '6', 'drinking water filter to be replaced.\r\nThe water filter is not working properly. \r\n\r\n', 'other', 170030033, 9980984107, '2019-03-01 20:23:40'),
(459, 0, 'O', '101', 'Outing or going home', 'electrical', 180020020, 9381595332, '2019-03-02 21:37:51'),
(460, 1, '1', '5', 'Water cooler not working', 'sensitive', 170010039, 9182115058, '2019-03-03 20:30:38'),
(461, 1, '1', '5', 'Washing machine needs to be cleaned', 'housekeeping', 170010039, 9182115058, '2019-03-06 07:34:22'),
(462, 1, '1', 'House 5 ins', 'No hot water in the bathroom', 'plumbing', 170010023, 9492828425, '2019-03-06 08:23:05'),
(463, 1, '1', 'House 5 ins', 'The washing machine needs to be cleaned. Whenever we wash clothes some dirty stuff gets stuck to our clothes.', 'other', 170010023, 9492828425, '2019-03-06 08:24:11'),
(464, 1, '0', '6', 'No hot water from last 3weeks', 'plumbing', 170030034, 9148309474, '2019-03-06 13:06:30'),
(468, 0, '1', '203', 'Fan, Tubelight and Gyser not working', 'electrical', 180010030, 9586270003, '2019-03-13 17:31:29'),
(478, 6, '2', '4', 'The washing machine is not working properly.\r\n1.The water supply to the machine is very slow, as a result it takes a longer period of time to clean.\r\n2. Since the filter inside has broken, dirt remains and clothes come out being covered with dirt. ', 'other', 173041001, 7416452051, '2019-05-17 13:38:39'),
(479, 2, '2', '4', 'My fan\'s capacitor has to be replaced. One day someone written this complaint in their book and never did come back, hoping a fast action at least now. ', 'electrical', 170030030, 9703364660, '2019-07-31 19:56:35'),
(480, 6, '0', '6', 'Washing machine is not spinning clothes', 'other', 160010026, 8277624223, '2019-08-03 09:38:25'),
(481, 6, '0', '6', 'Hooks in room are broken and new hooks are required', 'carpentry', 160010026, 8277624223, '2019-08-03 09:42:12'),
(482, 6, '0', '6', 'Washing machine is not drying clothes as it is not spinning. It needs to be repaired.', 'other', 160010027, 8277494978, '2019-08-03 09:44:58'),
(483, 6, '1', 'Outside roo', 'motor in Washing machine is not spinning', 'electrical', 170010032, 9108034501, '2019-08-05 20:41:19'),
(484, 0, '1', '311', 'Temp issue', 'other', 160010003, 8879585099, '2019-08-14 01:20:34');

-- --------------------------------------------------------

--
-- Table structure for table `issue_type_table`
--

CREATE TABLE `issue_type_table` (
  `issue_type_option_no` int(11) NOT NULL,
  `issue_type_option_name` tinytext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `issue_type_table`
--

INSERT INTO `issue_type_table` (`issue_type_option_no`, `issue_type_option_name`) VALUES
(1, 'electrical'),
(2, 'carpentry'),
(3, 'plumbing'),
(4, 'housekeeping'),
(5, 'sensitive'),
(6, 'internet'),
(7, 'other');

-- --------------------------------------------------------

--
-- Table structure for table `leave_requests`
--

CREATE TABLE `leave_requests` (
  `id` int(11) NOT NULL,
  `name` tinytext NOT NULL,
  `roll_no` int(9) NOT NULL,
  `hostel_no` int(11) NOT NULL,
  `floor_no` smallint(11) NOT NULL,
  `room_no` smallint(11) NOT NULL,
  `pnumber` bigint(12) NOT NULL,
  `dnumber` bigint(12) NOT NULL,
  `departure` timestamp NULL DEFAULT NULL,
  `arrival` timestamp NULL DEFAULT NULL,
  `cause` mediumtext NOT NULL,
  `destination` varchar(53) NOT NULL,
  `status` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `leave_requests`
--

INSERT INTO `leave_requests` (`id`, `name`, `roll_no`, `hostel_no`, `floor_no`, `room_no`, `pnumber`, `dnumber`, `departure`, `arrival`, `cause`, `destination`, `status`) VALUES
(6, 'Harshal', 160010003, 2, 2, 2, 1010101010, 1010101010, '2018-10-16 12:45:00', '2018-10-18 12:25:00', 'QWE', '28.59551453070982%2C77.10934448125373', 'Approved'),
(7, 'Soma Siddhartha', 170010037, 2, 1, 5, 9246924609, 9618266333, '2018-10-16 17:00:00', '2018-10-21 07:30:00', ' Dusshera festival!%3Cbr %2F%3E', '17.46119852490257%2C78.52955960213897', 'Approved'),
(8, 'gsdfhtjyj', 160010005, 1, 1, 1, 9999999999, 9999999999, '2018-10-18 15:30:00', '2018-10-19 15:30:00', 'retyrdyuiigrtyu%3Cbr %2F%3Egklgu', '13.937685048541184%2C75.52652610896062', 'Declined'),
(9, 'Vibhuti raman', 180010040, 0, 2, 316, 9587903088, 9934969062, '2018-10-18 06:25:00', '2018-10-22 13:10:00', 'There is a holiday for vijaydasmi..%3Cbr %2F%3EAnd my mother is not feeling well..%3Cbr %2F%3ESo I need to see her...%3Cbr %2F%3E%3Cbr %2F%3E', '26.15213783149249%2C85.33993930743124', 'Approved'),
(10, 'Ashrith Adepu', 160030031, 8, 2, 3, 8309387440, 8309387440, '2018-10-17 18:30:00', '2018-10-22 08:10:00', 'Going to home for festival.', '17.481260803258778%2C78.39153733354978', 'Approved'),
(11, 'Rohan Shrothrium ', 170020031, 1, 2, 4, 9148080316, 9148080316, '2018-10-17 14:00:00', '2018-10-22 06:00:00', 'Want to go home and chill ', '12.90771184900565%2C77.57852228682458', 'Approved'),
(12, 'PRANJAL KUMAR', 183021001, 5, 0, 1, 8770153729, 9449367745, '2018-10-17 19:25:00', '2018-10-22 08:00:00', 'Personal work and Dasshera celebration.', '12.974178517072374%2C77.57616377374787', 'Approved'),
(13, 'Muhammadzahid Pathan', 180030025, 0, 2, 307, 9380170788, 9036928151, '2018-10-18 15:00:00', '2018-10-22 07:30:00', 'Due to Dussehra festival.! ', '16.387482393426794%2C74.39162458074614', 'Approved'),
(14, 'Sushma Biradar', 170010032, 6, 1, 0, 9108034501, 9448138180, '2018-10-16 16:44:00', '2018-10-22 09:00:00', 'Dasara festival', '16.829450894098997%2C75.71260858364764', 'Approved'),
(15, 'Ketan Vaidya', 170030003, 3, 2, 3, 9113972562, 9923371946, '2018-10-18 20:00:00', '2018-10-22 07:00:00', 'Due to successive holidays and Dussehra', '20.048147226203923%2C75.1261278819061', 'Approval Pending'),
(16, 'A.Srikar', 160020034, 8, 1, 2, 8277574277, 9490192591, '2018-10-17 18:00:00', '2018-10-22 08:00:00', 'I\'m going home for the festival. And this is the only free time I have got in the whole semester and we don\'t have any important Classes that I would be missing these 4 days . Moreover at our place the festival holiday is on Thursday. ', '17.367520026150103%2C78.50593860981418', 'Approved'),
(17, 'Gagan G B', 170020029, 2, 1, 5, 9019666172, 9900194600, '2018-10-18 13:00:00', '2018-10-21 22:00:00', 'Visiting hometown to celebrate Dussehra. We do not have classes on Friday%2C Saturday and Sunday.', '14.34430694953852%2C74.89380312033983', 'Approved'),
(18, 'Ganesh ', 170020030, 1, 2, 4, 7349529323, 9844085517, '2018-10-18 12:00:00', '2018-10-22 07:25:00', 'I am travelling home for this holidays and due to some personal reasons', '13.97104432090137%2C76.19266203134922', 'Approved'),
(19, 'ABHISHEK KALOKHE', 170030007, 1, 0, 1, 9834646408, 9822007695, '2018-10-18 18:30:00', '2018-10-22 07:30:00', 'Visiting home ', '19.765272419162784%2C74.47999486038016', 'Approved'),
(20, 'Kunal Vaidya', 170020003, 2, 1, 2, 9113967533, 9923371946, '2018-10-18 18:05:00', '2018-10-22 07:00:00', 'Going home because of 3 days holiday.', '19.86996028673967%2C75.3431232668109', 'Approved'),
(21, 'Harshal Gajjar', 160010003, 4, 0, 6, 8879585099, 9920519933, '2018-10-17 20:30:00', '2018-10-22 07:30:00', 'Long Weekend', '19.03326043640169%2C73.01910480909075', 'Approved'),
(22, 'Ishan srivastava', 160010013, 4, 0, 1, 8277536737, 9005206115, '2018-10-16 17:19:00', '2018-10-22 06:00:00', 'Vacation', '24.613487596558983%2C74.01104947876829', 'Approved'),
(23, 'Saurav Dosi', 170030006, 3, 1, 2, 9819582916, 2512493461, '2018-10-18 18:30:00', '2018-10-22 07:30:00', 'Going home during holidays.', '19.222476327193505%2C73.08735663195704', 'Approval Pending'),
(24, 'Rupesh kalantre', 180010029, 0, 1, 218, 9370333926, 8983700108, '2018-10-18 15:00:00', '2018-10-21 19:00:00', 'on occasion of Dussehra', '16.706762225678744%2C74.24801083442057', 'Approved'),
(25, 'Gundla Srikar', 180010016, 0, 1, 202, 6303839031, 9440852614, '2018-10-17 17:10:00', '2018-10-22 10:00:00', 'Dussehra festival', '18.468211243225213%2C79.1166006747939', 'Approved'),
(26, 'KATUKAM SRIKAR PATEL ', 180020017, 0, 2, 306, 9483109949, 9848404030, '2018-10-17 17:10:00', '2018-10-22 10:00:00', 'Dusshera festival ', '18.49510146271865%2C79.12175595886337', 'Approved'),
(27, 'Niteesh Reddy', 160010029, 10, 1, 5, 8919792657, 9494209060, '2018-10-18 17:25:00', '2018-10-19 06:30:00', 'Dasara Holidays', '17.140238093739697%2C77.6866455078125', 'Approval Pending'),
(28, 'parisha pranay raj', 160010030, 8, 2, 4, 8309296568, 9293119011, '2018-10-18 17:25:00', '2018-10-22 07:30:00', 'Dusshera festival and long weekend', '17.30445038118995%2C78.52418608930573', 'Approved'),
(29, 'Arun Purohit', 170020001, 3, 2, 3, 8073265155, 8073265155, '2018-10-17 12:00:00', '2018-10-22 08:15:00', 'Going home because of 3 days holidays.', '15.45701045920201%2C75.00374033411181', 'Approval Pending'),
(30, 'Anudeep Tubati', 170010039, 1, 1, 5, 9182115058, 9182115058, '2018-10-17 17:30:00', '2018-10-22 10:30:00', 'Holidays', '17.774794896889517%2C78.6307561726113', 'Approved'),
(31, 'S V Praveen', 170010025, 1, 1, 2, 9632183719, 9632183719, '2018-10-17 18:00:00', '2018-10-22 08:00:00', 'Holiday', '12.929552067308208%2C77.5848286523951', 'Approved'),
(32, 'Jay Garchar', 170010001, 1, 2, 4, 9428060270, 7984611553, '2018-10-17 04:25:00', '2018-10-21 20:30:00', 'Dusshera Holiday', '23.025831297562974%2C72.59274435156253', 'Approved'),
(33, 'Shrinivas Hireraddi', 170010027, 1, 1, 2, 8310206163, 8310206163, '2018-10-17 12:05:00', '2018-10-22 07:30:00', '3 Days of Holiday. %3Cbr %2F%3E', '15.364536727764204%2C75.16063369696128', 'Approved'),
(34, 'Pavan V Boragunde', 160030036, 8, 1, 5, 9686423072, 9164317724, '2018-10-18 14:00:00', '2018-10-21 19:25:00', 'To celebrate Dusshera with family %3Cbr %2F%3E', '16.171159828065882%2C74.8396379689824', 'Approved'),
(35, 'Akhilesh Kesari', 170010028, 1, 0, 1, 9483030971, 9449436625, '2018-10-17 23:50:00', '2018-10-21 21:30:00', 'To celebrate festival', '15.450610431673766%2C75.00059767374775', 'Approved'),
(36, 'Deepak H R', 170010026, 2, 1, 2, 8197441399, 9448921890, '2018-10-17 11:10:00', '2018-10-21 22:50:00', 'Dasara Holidays', '12.895318576510576%2C75.2092350088881', 'Approved'),
(37, 'akshat karani', 170010003, 3, 0, 1, 8454864451, 8454864451, '2018-10-17 18:30:00', '2018-10-22 07:00:00', 'Want to get the hell out of here.', '19.42301019864196%2C72.39387287288574', 'Approval Pending'),
(38, 'someone', 170010012, 2, 3, 4, 8965478569, 8965478569, '2018-10-18 02:50:00', '2018-10-18 15:00:00', 'sda', '21.988569744725837%2C76.72000578134922', 'Declined'),
(39, 'Jetty venkataramana Ramya', 180030020, 0, 0, 108, 9845122942, 9492374693, '2018-10-17 17:30:00', '2018-10-22 09:15:00', 'On the occation of dushera ', '-44.25571213155777%2C56.77849828626603', 'Approved'),
(40, 'Kosaraju himaja', 180030023, 0, 0, 101, 9381317499, 9177858196, '2018-10-18 10:30:00', '2018-10-22 07:25:00', 'Occasion of dushera%3Cbr %2F%3E', '16.488415396527273%2C80.52783892366143', 'Approved'),
(41, 'Siddarth Adappa', 180030039, 0, 2, 301, 8861139765, 9845318487, '2018-10-17 19:30:00', '2018-10-22 07:30:00', 'Dussehra celebrations', '12.87229229192333%2C77.58906571498672', 'Approved'),
(42, 'Abhinay anubola', 180010006, 0, 1, 215, 9381167453, 9493019758, '2018-10-17 16:00:00', '2018-10-22 07:00:00', 'Dussehra%3Cbr %2F%3E', '14.70492127143072%2C77.5587197006322', 'Approved'),
(43, 'B.Sai yashwanth', 180010010, 0, 1, 217, 9849061230, 9490017634, '2018-10-17 18:50:00', '2018-10-21 10:25:00', 'Dasara holidays', '16.992252405022413%2C79.34040425341246', 'Approved'),
(44, 'Harini Dandu', 160020032, 6, 0, 1, 8277401949, 9441648208, '2018-10-18 16:30:00', '2018-10-22 08:30:00', 'Dusshera festival. ', '17.499821143923754%2C78.4138440215607', 'Approved'),
(45, 'Suneel', 160030032, 10, 2, 3, 8179824607, 8179824607, '2018-10-18 15:00:00', '2018-10-22 08:00:00', 'Dusherra Puja. Ticket already booked', '24.530251093078277%2C54.486008296347684', 'Approval Pending'),
(46, 'Kiran P', 183141001, 5, 0, 1, 9449367745, 8861318913, '2018-10-17 16:00:00', '2018-10-22 08:00:00', 'I am going to attend Dasara festival at my home.', '12.407550661954389%2C76.43491378515631', 'Approved'),
(47, 'Mahesh R Anigol', 183141002, 5, 0, 1, 7738706532, 9449367745, '2018-10-17 17:30:00', '2018-10-22 09:00:00', 'Visiting Mysore For Dussehra', '13.030975533216065%2C59.458290250000026', 'Approved'),
(48, 'monika bai m g', 183041001, 6, 2, 4, 8050346246, 8310640337, '2018-10-17 21:25:00', '2018-10-22 07:55:00', 'dusshera', '12.974084858418294%2C74.81421874272473', 'Approved'),
(49, 'Gourav Pravin Kumbhojkar', 180030018, 0, 2, 308, 9130072278, 9423858849, '2018-10-18 15:00:00', '2018-10-21 18:00:00', ' Have to bring some important material and food items from home.', '16.69381773617809%2C74.2509269659021', 'Approved'),
(50, 'Likhita Peddi', 160020029, 6, 1, 0, 9441972742, 9912919161, '2018-10-17 18:00:00', '2018-10-20 10:00:00', 'My parents are coming to college.I would like to stay with them in dharwad.', '15.371593222560023%2C75.11958517136176', 'Approved'),
(51, 'Swapnik Jagarlapudi', 170010033, 2, 2, 3, 9542670476, 9848448096, '2018-10-18 17:00:00', '2018-10-22 07:00:00', 'Dussehra Vacation', '18.938814076537923%2C72.82271429462159', 'Approved'),
(52, 'Abhinaya Athota', 180030009, 0, 0, 106, 9381648827, 9493121306, '2018-10-18 09:00:00', '2018-10-22 13:00:00', 'I\'m going to my home for  Dasara vacation..', '16.32750902860616%2C80.96737195119198', 'Approved'),
(53, 'Tephilla Prince', 183061002, 6, 2, 4, 8056702114, 9597270918, '2018-10-18 12:25:00', '2018-10-21 01:25:00', 'Vacation', '13.178859448308046%2C80.36224086995959', 'Approved'),
(54, 'Dhanushya Ruthwik Gangisetti', 160010018, 4, 1, 5, 8277552639, 9030888899, '2018-10-18 15:30:00', '2018-10-22 06:30:00', 'To meet my parents ', '17.688277774584833%2C74.00809578154129', 'Approved'),
(55, 'Hemanth Surya ', 180010018, 0, 1, 211, 9916599474, 9945725272, '2018-10-18 20:00:00', '2018-10-22 05:10:00', 'Dusshera', '12.93500557664619%2C77.49012632266499', 'Approved'),
(56, 'Ashish Kupsad', 180020003, 0, 1, 214, 8722931975, 9986171626, '2018-10-18 14:00:00', '2018-10-21 20:30:00', 'Dussehra festival', '16.813121666696773%2C75.72658291950312', 'Approved'),
(57, 'Shreyas sathe', 180010033, 0, 1, 201, 9167229258, 9167229259, '2018-10-18 20:25:00', '2018-10-22 07:25:00', 'Dusshehra holiday', '15.460614420756102%2C75.008795104928', 'Approved'),
(58, 'Raaj Tambe', 160010034, 8, 0, 6, 7019008851, 9448464697, '2018-10-18 19:25:00', '2018-10-22 07:20:00', 'Celebrate Dusshera at home', '15.347001816866381%2C75.09873292736354', 'Approved'),
(59, 'Durga Naga Sai Rahul M', 180020007, 0, 1, 204, 7995980880, 9849316219, '2018-10-18 13:30:00', '2018-10-22 09:30:00', 'For celebrating dussera festival. ', '17.472738460226978%2C78.32804730182362', 'Approved'),
(60, 'Gautam Jagdhish. M', 170010031, 2, 0, 6, 8903784784, 8903784784, '2018-10-18 19:00:00', '2018-10-22 08:30:00', 'Tour', '18.961351733461896%2C72.83194422960462', 'Approved'),
(61, 'Dhruv Jain', 180020006, 0, 2, 315, 9819001101, 7718050963, '2018-10-18 15:00:00', '2018-10-21 23:55:00', 'Holidays%2C no lectures in Friday to Sunday. ', '18.955094349107313%2C72.8327237480726', 'Approved'),
(62, 'Karthik V V', 170010016, 3, 0, 1, 7013270204, 7013270204, '2018-10-20 10:00:00', '2018-10-21 21:00:00', 'Wanna meet relatives. Hope it shouldn\'t bother.', '15.350126487988291%2C75.13301015495037', 'Approval Pending'),
(63, 'Gawas Amitkumar Satyawan', 173031003, 5, 0, 6, 8237123330, 8237123330, '2018-11-05 18:00:00', '2018-11-12 07:00:00', 'Diwali.', '18.636688233528332%2C73.84143904501927', 'Approved'),
(64, 'Mehul Bose', 170030019, 3, 1, 2, 9873719722, 9811209722, '2018-11-03 17:00:00', '2018-11-05 08:00:00', 'To watch a concert ', '12.957174168818682%2C77.57718062585946', 'Approval Pending'),
(65, 'Gagan GB ', 170020029, 2, 1, 5, 9019666172, 9900194600, '2018-11-03 12:00:00', '2018-11-08 06:00:00', 'To celebrate diwali.', '12.95969610521476%2C77.49341688472066', 'Approved'),
(66, 'Swapnik Jagarlapudi', 170010033, 2, 2, 3, 9542670476, 9848448096, '2018-11-02 19:00:00', '2018-11-05 07:30:00', 'Attending a concert', '13.014331278072206%2C77.56397898919933', 'Approved'),
(67, 'Swapnik Jagarlapudi', 170010033, 2, 2, 39, 9542670476, 9848448096, '2018-11-02 19:00:00', '2018-11-05 07:30:00', 'Attending a concert', '12.966160838980585%2C77.58768566289851', 'Declined'),
(68, 'Harshal Gajjar', 160010003, 4, 0, 6, 8879585099, 9920519933, '2018-11-02 22:30:00', '2018-11-12 07:30:00', 'Diwali', '19.035120619344994%2C73.00847346995832', 'Approved'),
(69, 'Kiran P', 183141001, 5, 0, 1, 9449367745, 8861318913, '2018-11-02 19:00:00', '2018-11-07 08:00:00', 'I\'m visiting my hometown Mysuru. ', '12.308719711787163%2C76.64681329081581', 'Approved'),
(70, 'PRANJAL KUMAR', 183021001, 5, 0, 1, 8770153729, 9404548424, '2018-11-01 13:00:00', '2018-11-11 16:00:00', 'For Diwali Celebration', '21.116603406008323%2C81.04354013233853', 'Approved'),
(71, 'Siddharth Singh Savner', 183081003, 5, 1, 5, 9926690703, 7049900584, '2018-11-02 10:30:00', '2018-11-12 08:30:00', 'Going to home for Diwali', '22.71474358559105%2C75.86964646015296', 'Approved'),
(72, 'Mahesh Anigol', 183141002, 5, 0, 1, 7738706532, 7083183113, '2018-11-03 15:00:00', '2018-11-07 09:00:00', 'Visiting Home For Deepavali.%3Cbr %2F%3E%3Cbr %2F%3EI want to apologize for the late leave-request. Henceforth will make sure to request a leave well in advance.%3Cbr %2F%3E%3Cbr %2F%3EThank You. ', '15.879383298311382%2C74.50428945607635', 'Approved'),
(73, 'Kunal Patil ', 170030004, 1, 1, 2, 7775922557, 9422034280, '2018-11-02 16:00:00', '2018-11-08 12:00:00', 'GOING HOME FOR DIWALI FESTIVAL ', '17.254376059327058%2C74.1710307090472', 'Approved'),
(74, 'ABHISHEK KALOKHE', 170030007, 1, 0, 1, 9834646408, 9822007695, '2018-11-02 18:00:00', '2018-11-08 07:30:00', 'Going home for Diwali', '19.762878327196844%2C74.47300881560996', 'Approved'),
(75, 'Ketan Vaidya', 170030003, 3, 2, 3, 9113972562, 9923371946, '2018-11-02 17:30:00', '2018-11-08 08:00:00', 'Going home for Diwali ', '19.898508391705434%2C75.34862575584259', 'Approval Pending'),
(76, 'Ojas Raundale', 170010004, 3, 0, 6, 8692854808, 9323039697, '2018-11-02 18:55:00', '2018-11-08 07:30:00', 'Diwali Vacation', '19.040412940238667%2C73.07103631696951', 'Approval Pending'),
(77, 'Ameya Vadnere', 170010002, 3, 1, 2, 9834509281, 9423452078, '2018-11-02 18:25:00', '2018-11-08 07:00:00', 'Diwali Vacation.', '19.864534089099266%2C75.36433050406312', 'Approval Pending'),
(78, 'Yogesh Subhash Thube', 173031001, 5, 0, 6, 7721917317, 9423250137, '2018-11-02 20:00:00', '2018-11-11 14:30:00', 'Diwali Celebration', '18.134603182936246%2C74.51230305440275', 'Approved'),
(79, 'Aman Singal', 180030004, 0, 1, 214, 9050540897, 9813012006, '2018-11-02 14:00:00', '2018-11-10 23:00:00', 'Diwali ', '28.88612444763684%2C76.58362192446684', 'Approved'),
(80, 'K. Sai Anuroop', 170030035, 2, 1, 2, 7036053327, 7036053327, '2018-11-02 15:30:00', '2018-11-05 08:20:00', 'Going home during weekend.', '15.474807087827514%2C74.97934662577603', 'Approved'),
(81, 'Ashrith Adepu', 160030031, 8, 2, 3, 8309387440, 8309387440, '2018-11-02 19:30:00', '2018-11-07 09:20:00', 'Going to home for festival', '17.478929195551444%2C78.36932950698932', 'Approved'),
(82, 'Ayush Bhandari', 160020010, 8, 1, 5, 8989504377, 9424565922, '2018-11-03 13:30:00', '2018-11-12 08:00:00', 'Festival', '22.680790990839157%2C75.83455678721258', 'Approved'),
(83, 'Saurav Dosi', 170030006, 3, 1, 2, 9819582916, 2512493461, '2018-11-02 18:30:00', '2018-11-05 08:00:00', 'Going Bangalore for a tour is', '13.028715282112032%2C77.62064364944574', 'Approval Pending'),
(84, 'B.Adithya Subramanyam', 180010007, 0, 1, 201, 9483110051, 9440470058, '2018-11-02 17:45:00', '2018-11-07 09:45:00', 'Diwali festival.', '17.443748935031934%2C78.4719848334127', 'Approved'),
(85, 'Shreays sathe', 180010033, 0, 2, 201, 9167229258, 9167229258, '2018-11-03 15:00:00', '2018-11-06 21:30:00', 'Diwali holidays', '16.696288620206943%2C74.23195644961899', 'Approved'),
(86, 'Akhilesh Tugaonkar', 180030041, 0, 2, 318, 8275350325, 9423745007, '2018-11-03 13:00:00', '2018-11-09 23:30:00', 'Festival%3Cbr %2F%3E', '19.865122193516783%2C75.33439173185583', 'Approved'),
(87, 'Gourav Pravin Kumbhojkar', 180030018, 0, 2, 308, 9130072278, 9423858849, '2018-11-03 15:00:00', '2018-11-06 21:05:00', 'Have to attend family function', '16.723205748064743%2C74.24588790625003', 'Approved'),
(88, 'AMOGH DASTURE', 180010014, 0, 2, 302, 9372926548, 9130072278, '2018-11-03 16:30:00', '2018-11-06 20:30:00', 'Diwali', '16.72070997754186%2C74.23846591418621', 'Approved'),
(89, 'Ritik Mahajan', 160020009, 8, 1, 2, 8085421222, 9469664642, '2018-11-03 13:45:00', '2018-11-11 05:55:00', 'Festival ( Diwali) ', '21.827489236971175%2C75.62204963373118', 'Approved'),
(90, 'Prashanth C Mannannavar', 160010001, 8, 0, 6, 7899217360, 7899217360, '2018-11-04 17:00:00', '2018-11-11 21:00:00', 'Diwali holidays. I', '14.585947842404067%2C75.5796800876899', 'Approved'),
(91, 'Ashish Raghav', 170030011, 3, 2, 3, 9818352225, 9818352265, '2018-11-06 14:00:00', '2018-11-09 08:30:00', 'Diwali Holoday', '28.668423175546835%2C77.21659223618215', 'Approval Pending'),
(92, 'Zahid', 180030025, 0, 2, 307, 9380170788, 9036928151, '2018-11-03 15:25:00', '2018-11-07 10:25:00', 'Diwali', '15.903101697240587%2C74.5384484759516', 'Approved'),
(93, 'Rupesh kalantre', 180010029, 0, 1, 218, 9370333926, 8983700108, '2018-11-03 16:00:00', '2018-11-06 00:00:00', 'Divali', '16.70292806872078%2C74.22801010286709', 'Approved'),
(94, 'Sohan Anisetty ', 180030040, 0, 2, 311, 9820687340, 9820687339, '2018-11-03 19:25:00', '2018-11-08 07:30:00', 'Diwali holidays', '19.098018069877426%2C73.01096697161974', 'Approved'),
(95, 'Akhil Manoj ', 180030003, 0, 2, 309, 9833467271, 9833467271, '2018-11-03 19:20:00', '2018-11-08 07:00:00', 'Diwali ', '18.939201856814506%2C72.83644977065367', 'Approved'),
(96, 'Rushikesh Dixit', 180030037, 0, 2, 302, 9109534276, 9202901030, '2018-11-04 21:25:00', '2018-11-07 09:25:00', 'Visiting relatives for diwali', '18.382591159324633%2C74.22265468294353', 'Approved'),
(97, 'Rushikesh Dixit', 180030037, 0, 2, 302, 9109534276, 9202901030, '2018-11-04 21:25:00', '2018-11-07 09:25:00', 'Visiting relatives for diwali', '18.382591159324633%2C74.22265468294353', 'Approval Pending'),
(98, 'Ashish Kupsad', 180020003, 0, 1, 214, 8722931975, 9986171626, '2018-11-08 14:30:00', '2018-11-13 07:00:00', 'A Family Function (Sister\'s Marriage)', '16.812934342629916%2C75.72645114279014', 'Approved'),
(99, 'K. Sai Anuroop', 170030035, 2, 1, 2, 7036053327, 7036053327, '2018-11-10 17:30:00', '2018-11-12 08:30:00', 'Going home for weekend.', '15.475369008405309%2C74.98013928913392', 'Approval Pending'),
(100, 'K. Sai Anuroop', 170030035, 2, 1, 2, 7036053327, 7036053327, '2018-11-20 17:10:00', '2018-11-23 08:45:00', 'Preparing for end-semester exams at home.', '15.4749762953264%2C74.97899377059932', 'Approval Pending'),
(101, 'Pragnya Parimita Chayani', 173041001, 6, 2, 4, 7416452051, 7416452051, '2018-11-20 18:00:00', '2018-11-21 10:00:00', 'Personal.', '15.34722652076212%2C74.79267703136186', 'Approved'),
(102, 'D.SoumyaSrividhya', 170010038, 6, 1, 0, 7095219969, 7032325443, '2018-12-05 12:00:00', '2019-01-01 08:30:00', 'Autumn Sem Holidays', '17.430109885986127%2C78.43643435200966', 'Approved'),
(103, 'Kusuma Pallavi Sakya', 160030030, 6, 0, 6, 9502701360, 9866387186, '2018-12-01 08:30:00', '2019-01-01 12:00:00', 'Winter Vacation.', '16.96376602930036%2C82.2352010389097', 'Approved'),
(104, 'Seema Khadirnaikar', 173021001, 6, 2, 0, 8762345048, 9448986877, '2018-11-28 16:00:00', '2018-11-30 08:00:00', 'Personal work.', '16.173949591942545%2C75.65488448828128', 'Approved'),
(105, 'Abhay Kr. Jaiswal', 160030021, 10, 2, 0, 8787075759, 9452083986, '2018-12-02 16:00:00', '2019-01-01 13:00:00', 'winter vocation', '25.33177808837364%2C82.92785289883614', 'Approval Pending'),
(106, 'Shreyas sathe', 180010033, 0, 2, 201, 9167229258, 9167229258, '2018-11-30 17:45:00', '2018-12-01 09:00:00', 'Parents in town', '15.330361992995392%2C75.13036717258576', 'Approval Pending'),
(107, 'Janhavikumari', 180010012, 0, 0, 103, 8980091029, 9979888090, '2018-12-02 05:20:00', '2018-12-31 08:00:00', 'Winter breaking', '21.170223449810635%2C73.00872838586238', 'Approved'),
(108, 'Anoohya Pinninti', 170020032, 6, 1, 5, 7661098648, 9010203514, '2018-12-05 13:15:00', '2019-01-02 05:00:00', 'vacation', '17.196088342885588%2C77.72489002436069', 'Approved'),
(109, 'Rupesh Kalantre', 180010029, 0, 1, 218, 9370333926, 8983700108, '2018-12-02 14:00:00', '2018-12-31 12:00:00', 'Vacations', '16.702874506212652%2C74.22685728313562', 'Approved'),
(110, 'Gawas Amitkumar Satyawan', 173031003, 5, 0, 6, 8237123330, 8237123330, '2018-12-05 07:25:00', '2018-12-10 07:00:00', 'Personal work.', '12.835400342888562%2C77.50892677992258', 'Approved'),
(111, 'Varshha', 160010027, 6, 0, 6, 8277494977, 8277494978, '2018-12-04 14:25:00', '2018-12-31 15:25:00', 'Semester break', '2.190746630363847%2C88.34129863580412', 'Approved'),
(112, 'Pragnya Chayani', 173041001, 6, 2, 4, 7416452051, 7416452051, '2018-12-02 16:41:00', '2018-12-03 10:40:00', 'Personal', '15.364339991191514%2C75.14382663310028', 'Approved'),
(113, 'Punyashlok Panda', 160030027, 10, 2, 3, 8895737633, 9439787879, '2018-12-03 14:25:00', '2018-12-12 14:25:00', 'Conference COMPFLU at IITRoorkee', '28.704637213490365%2C77.14104790934962', 'Approval Pending'),
(114, 'saurabh chauhan', 160030040, 10, 1, 2, 7022990117, 8130486790, '2018-12-03 14:30:00', '2018-12-20 09:30:00', 'home', '29.406311884806072%2C76.49742866067035', 'Approval Pending'),
(115, 'Sushma Biradar', 170010032, 6, 1, 0, 9108034501, 9448138180, '2018-12-04 14:00:00', '2019-01-01 09:30:00', 'Winter vacation', '16.76960590398106%2C75.85856614438809', 'Approved'),
(116, 'Srishti', 170020008, 6, 1, 2, 7022658903, 9013807727, '2018-12-06 15:00:00', '2018-12-31 22:25:00', 'Winter vacations', '28.576537169485498%2C76.84164932459262', 'Approved'),
(117, 'Nagsasavi Jeepalyam', 170020023, 6, 2, 3, 8919706016, 9490621047, '2018-12-05 16:45:00', '2019-01-01 10:55:00', 'Winter vacations ', '13.639222025918727%2C79.41865086608504', 'Approved'),
(118, 'Laxmi Aishwarya Thela', 160010026, 6, 0, 6, 8277624223, 9502694223, '2018-12-04 12:00:00', '2019-01-01 10:00:00', 'Winter vacation', '17.426132902758013%2C78.52737310236215', 'Approved'),
(119, 'Diya ilinani', 170010034, 6, 2, 3, 7989752627, 9866224972, '2018-12-05 14:15:00', '2019-01-01 14:05:00', 'Sem break', '17.292964864593017%2C77.31070782004774', 'Approved'),
(120, 'Charu Agarwal', 160010038, 6, 0, 0, 8433022578, 8433022578, '2018-12-06 06:00:00', '2018-12-31 09:00:00', 'End sems holidays', '-19.479507278905118%2C69.93453187905028', 'Approved'),
(121, 'ABHISHEK KALOKHE', 170030007, 1, 0, 1, 9834646408, 9822007695, '2018-12-04 12:30:00', '2018-12-11 07:30:00', 'Home', '19.799109306318016%2C74.4700579934073', 'Approved'),
(122, 'K. Sai Anuroop', 170030035, 2, 1, 2, 7036053327, 7036053327, '2018-12-04 15:00:00', '2019-01-01 08:30:00', 'Going home for vacation.', '15.475069012941034%2C74.97916616248608', 'Approved'),
(123, 'Thummala Divisha Lakshmi', 180020038, 0, 0, 101, 7995369478, 9989866736, '2018-12-05 09:00:00', '2018-12-31 12:50:00', 'Winter vacation', '17.745638648296236%2C83.33799327170232', 'Approved'),
(124, 'Vantakula Durga Anusha', 180030043, 0, 0, 104, 9381125178, 9885087141, '2018-12-05 09:00:00', '2018-12-31 12:50:00', 'Winter vacation', '17.666520315529212%2C82.61101077960521', 'Approved'),
(125, 'Joshitha', 180020009, 0, 0, 102, 9966084003, 9966084474, '2018-12-05 10:30:00', '2018-12-31 13:00:00', 'Winter vacation', '15.510773693498365%2C80.0355243717498', 'Approved'),
(126, 'Meghana', 180010034, 0, 0, 104, 9381256223, 9441996318, '2018-12-05 09:00:00', '2018-12-31 13:00:00', 'Winter vacation', '15.471157244622717%2C80.00865151628633', 'Approved'),
(127, 'Riya Toteja ', 160010007, 6, 0, 6, 8447169940, 9968300937, '2018-12-06 14:35:00', '2018-12-31 17:50:00', 'Winter vacations ', '28.58531563705405%2C77.180463729993', 'Approved'),
(128, 'vyshnavi', 170010021, 6, 2, 3, 9182443464, 9483743323, '2018-12-05 09:00:00', '2018-12-31 15:00:00', 'semester holidays', '16.497402819469713%2C80.62715423634512', 'Approved'),
(129, 'Sruthi Prathyusha', 170020027, 6, 1, 2, 7013093456, 9030785099, '2018-12-05 09:00:00', '2018-12-31 15:05:00', 'Sem breakfast', '16.295381653854378%2C80.44613573404456', 'Approved'),
(130, 'PRAGNYA PARIMITA CHAYANI', 173041001, 6, 2, 4, 7416452051, 7416452051, '2018-12-05 14:25:00', '2018-12-21 08:25:00', 'Personal%3Cbr %2F%3E%3Cbr %2F%3E%3Cbr %2F%3E%3Cbr %2F%3E%3Cbr %2F%3E%3Cbr %2F%3E%3Cbr %2F%3E%3Cbr %2F%3E%3Cbr %2F%3E', '20.502566803384866%2C87.54174386491458', 'Approved'),
(131, 'Jagabandhu Mishra', 183081002, 5, 1, 5, 9938230013, 9938230013, '2018-12-21 10:00:00', '2019-01-03 02:05:00', 'Going home', '21.1712788490335%2C86.26493087500003', 'Approved'),
(132, 'Gawas Amitkumar Satyawan', 173031003, 5, 0, 6, 8237123330, 8237123330, '2018-12-28 20:25:00', '2019-01-03 06:00:00', 'Going Home.', '18.63667731435143%2C73.84142934337243', 'Approved'),
(133, 'Swapnik Jagarlapudi', 170010033, 2, 2, 4, 9542670476, 9848448096, '2019-01-04 21:00:00', '2019-01-06 08:00:00', 'I had to leave some luggage and equipment (for my guitar) at home as I traveled to Delhi and then to Roorkee for the Inter-IIT cultural meet. As I had to took a flight back%2C I was traveling light and I couldn\'t get all my things to the hostel%2C so I need to go home to collect it from home. ', '17.437216497976564%2C78.49336780456052', 'Approval Pending'),
(134, 'Harshal Gajjar', 160010003, 4, 0, 6, 8879585099, 8879585099, '2019-01-11 11:30:00', '2019-01-14 07:30:00', 'Workshop', '12.906146684627473%2C80.22924760936655', 'Approved'),
(135, 'J Swapnik', 170010033, 2, 2, 3, 9542670476, 9848448096, '2019-01-14 19:00:00', '2019-01-16 06:00:00', 'I couldn\'t bring all my luggage to campus as I attended the Inter IIT Cultural Fest%2C so I will be going home and bringing back all the luggage which I couldn\'t bring ', '17.418452360565567%2C78.47562423437503', 'Approved'),
(136, 'Muhammadzahid Pathan', 180030025, 0, 2, 307, 9380170788, 9036928151, '2019-01-18 05:30:00', '2019-01-21 08:00:00', 'To Complete Documentation work.', '13.000975095489906%2C77.59544517460193', 'Approved'),
(137, 'Swapnik J', 170010033, 2, 2, 3, 9542670476, 9848448096, '2019-01-18 20:00:00', '2019-01-20 21:00:00', 'Brother leaving India', '17.401093611296346%2C78.47672341209943', 'Approved'),
(138, 'Pragnya Chayani', 173041001, 6, 2, 4, 7416452051, 7416452051, '2019-01-19 12:25:00', '2019-01-20 10:30:00', 'Personal', '15.44210433989565%2C74.52455071562599', 'Approved'),
(139, 'Siddarth', 180030039, 0, 2, 301, 9380250551, 8861139765, '2019-01-24 22:25:00', '2019-01-28 18:00:00', 'Family function', '12.953915382282673%2C77.57591976008311', 'Approved'),
(140, 'Tephilla Prince', 183061002, 6, 2, 0, 8056702114, 8056702114, '2019-01-25 09:49:00', '2019-01-26 13:55:00', 'CAALM workshop at CMI%2C Chennai. From Jan 21 to 25.', '13.238532753796576%2C80.28836837500003', 'Approved'),
(141, 'Gowri Y Subedar', 180030019, 0, 0, 103, 8277522336, 9449588838, '2019-02-08 12:30:00', '2019-02-10 09:00:00', 'Personal reason.', '14.465803922121225%2C75.9125178212424', 'Approved'),
(142, 'K. Sai Anuroop', 170030035, 2, 1, 2, 7036053327, 7036053327, '2019-02-12 13:30:00', '2019-02-15 11:00:00', 'Going to Tirupati with family for attending my cousin\'s \'Thread Ceremony\'.', '13.631730022948972%2C79.41719198262065', 'Approved'),
(143, 'BATHINA SIVA KUMAR', 173031002, 5, 0, 0, 8281618284, 6303285382, '2019-02-15 20:25:00', '2019-03-10 17:05:00', 'marriage', '13.680874953550088%2C54.844032437500026', 'Approved'),
(144, 'Sameer dohadwalla', 180020033, 0, 2, 306, 9930437554, 9167034145, '2019-03-01 20:00:00', '2019-03-04 07:00:00', 'Cousins engagement ceremony', '18.959925049244177%2C72.8273644879107', 'Approved'),
(145, 'Muhammadzahid Pathan', 180030025, 0, 2, 307, 9380170788, 9036928151, '2019-03-01 14:00:00', '2019-03-04 09:00:00', 'To attend a family function.', '16.422252556936343%2C74.3669683359331', 'Approved'),
(146, 'Karan Yogesh Anvekar', 180020015, 0, 2, 317, 9769719309, 9833265742, '2019-03-01 18:00:00', '2019-03-10 08:20:00', 'Father\'s Kidney Stone operation', '19.030802618429576%2C72.85726772377855', 'Approved'),
(147, 'Sohan Anisetty', 180030040, 0, 2, 311, 9820687340, 9820687339, '2019-03-01 21:25:00', '2019-03-06 07:25:00', 'Personal work. ', '19.103996200660376%2C73.0057814254273', 'Approved'),
(148, 'Akhil Manoj ', 180030003, 0, 2, 309, 9833467271, 9833467271, '2019-03-01 18:00:00', '2019-03-05 07:00:00', 'Cousins wedding', '12.485764608688896%2C74.98582639030123', 'Approved'),
(149, 'Kunal Patil', 170030004, 1, 1, 1, 7775922557, 9422034280, '2019-03-01 14:30:00', '2019-03-04 08:00:00', 'Family Function ', '17.246782784934325%2C74.17438533857936', 'Approved'),
(150, 'Vaishnavi Patil', 180020039, 0, 0, 102, 7038411894, 7038411894, '2019-03-01 13:00:00', '2019-03-07 08:00:00', 'Refreshment after Mid-Sem.', '18.609517867569537%2C73.77348444823909', 'Approved'),
(151, 'Siddarth', 180030039, 0, 2, 301, 9380250551, 8861139765, '2019-03-01 23:00:00', '2019-03-04 21:00:00', 'holiday', '15.529596455298616%2C73.76798584897071', 'Approved'),
(152, 'Ritwik', 180010028, 0, 2, 315, 8078620307, 8078620307, '2019-03-01 23:25:00', '2019-03-04 15:25:00', 'holiday', '15.535570178350923%2C73.7845654806475', 'Approved'),
(153, 'Rupesh Kalantre', 180010029, 0, 1, 218, 9370333926, 8983700108, '2019-03-01 14:00:00', '2019-03-03 18:00:00', 'Holiday%3Cbr %2F%3E%3Cbr %2F%3E', '16.703855287652715%2C74.23365627418123', 'Approved'),
(154, 'Abhishek Kalokhe', 170030007, 1, 0, 1, 9834646408, 9822007695, '2019-03-01 18:00:00', '2019-03-04 07:00:00', 'Home', '19.796068904411214%2C74.46981022734231', 'Approved'),
(155, 'Karan Anvekar', 180020015, 0, 2, 317, 9769719309, 9833265742, '2019-03-01 18:00:00', '2019-03-10 08:20:00', 'Father%E2%80%99s kidney stone operation', '19.03084107724655%2C72.85734511572001', 'Approved'),
(156, 'Shreyas sathe', 180010033, 0, 2, 201, 9167229258, 9167229258, '2019-03-01 18:20:00', '2019-03-04 22:00:00', 'Tourism', '15.457859879275858%2C73.80494538952856', 'Approved'),
(157, 'S U Swakath', 180020036, 0, 1, 209, 9629469172, 9629469172, '2019-03-02 06:30:00', '2019-03-03 18:30:00', 'A trip to Dandeli.', '15.261323904920346%2C74.62041317267972', 'Approval Pending'),
(158, 'Dadi Swamy Vinay', 180030015, 0, 1, 209, 9247100278, 9247100278, '2019-03-02 06:00:00', '2019-03-03 18:30:00', 'A trip to Dandeli', '15.253135485459183%2C74.61315650833365', 'Approval Pending'),
(159, 'Rishabh Tripathi ', 180030036, 0, 2, 318, 8429816003, 8429816003, '2019-03-01 19:00:00', '2019-03-05 01:00:00', 'Holiday ', '15.477908057747413%2C73.84422171753313', 'Approved'),
(160, 'Paritosh Gavali', 180020036, 0, 1, 209, 7490987410, 7490987410, '2019-03-02 06:00:00', '2019-03-03 18:00:00', 'A trip to Dandeli', '15.26820707138765%2C74.60537878756014', 'Approval Pending'),
(161, 'Dhruv jain', 180020006, 0, 2, 315, 9819001101, 9819001101, '2019-03-01 19:25:00', '2019-03-05 01:25:00', 'Holidays', '15.467076204450649%2C73.82324707284528', 'Approved'),
(162, 'Dadhaniya Rutik Rajeshbhai', 180010013, 0, 1, 210, 8469059713, 8469059713, '2019-03-01 16:38:00', '2019-03-04 23:55:00', 'Holiday', '15.178808924322297%2C74.14616473895809', 'Approved'),
(163, 'Sai priya', 180020008, 0, 0, 102, 6303548031, 9346862210, '2019-03-01 16:39:00', '2019-03-05 14:00:00', 'Personal issues', '17.462750088739483%2C78.78467648201799', 'Approved'),
(164, 'Vadithya udaykiran', 180010039, 0, 2, 307, 9381552210, 9440619770, '2019-03-01 16:42:00', '2019-03-05 14:00:00', 'Personal issue', '17.452662318005125%2C79.80439920725988', 'Approved'),
(165, 'Hawa singh', 180020012, 0, 1, 212, 9034513215, 9306425150, '2019-03-01 16:43:00', '2019-03-05 04:40:00', 'Trip', '31.999067168731884%2C87.74266044979896', 'Approved'),
(166, 'NITIN JHINTA', 180030031, 0, 1, 215, 9877516976, 7837292618, '2019-03-01 16:45:00', '2019-03-05 04:40:00', 'Trip. ', '12.972639623789235%2C76.89907663903051', 'Approved'),
(167, 'Biju Amruta Dathan', 180020004, 0, 1, 210, 9480270842, 9480270842, '2019-03-02 06:00:00', '2019-03-03 18:00:00', 'Trip to dandeli ', '15.224291185607882%2C74.61577052147439', 'Approved'),
(168, 'Chandan singh solanki', 180030014, 0, 1, 218, 9521601799, 6377300962, '2019-03-01 16:46:00', '2019-03-05 08:25:00', 'Trip', '10.302971691044476%2C76.83848004171996', 'Approved'),
(169, 'Kosaraju himaja', 180030023, 0, 0, 101, 9381317499, 9515803654, '2019-03-01 16:45:00', '2019-03-02 16:25:00', 'Holidays', '16.57804220660698%2C80.3585066861603', 'Approval Pending'),
(170, 'Rishit Saiya', 180010027, 0, 2, 305, 9619708003, 9820995512, '2019-03-01 16:50:00', '2019-03-05 08:00:00', 'Trip', '12.410099911306745%2C76.6127215945312', 'Approved'),
(171, 'Mohit Jorwal', 180020023, 0, 1, 210, 6377834671, 9887368370, '2019-03-01 16:47:00', '2019-03-05 08:25:00', 'Trip', '50.02699256330909%2C40.04761519004151', 'Approved'),
(172, 'Rajat', 180020029, 0, 1, 202, 9158880258, 9158882058, '2019-03-01 19:00:00', '2019-03-05 01:30:00', 'Holiday', '15.464350923514687%2C73.83853996319667', 'Approved'),
(173, 'Akhilesh Bharadwaj ', 180010009, 0, 2, 204, 6354808691, 6354808691, '2019-03-01 19:00:00', '2019-03-05 03:50:00', 'Trip to goa ', '15.348432784122451%2C74.17112711009194', 'Approved'),
(174, 'Akhilesh Bharadwaj ', 180010009, 0, 2, 204, 6354808691, 6354808691, '2019-03-01 19:00:00', '2019-03-05 03:50:00', 'Trip to goa ', '15.461845944192959%2C73.80204880453645', 'Approval Pending'),
(175, 'Akhilesh Bharadwaj ', 180010009, 0, 2, 204, 6354808691, 6354808691, '2019-03-01 19:00:00', '2019-03-05 03:50:00', 'Trip to goa ', '15.348432784122451%2C74.17112711009194', 'Approval Pending'),
(176, 'Balsher Singh', 180010008, 0, 1, 216, 7018181716, 7018181716, '2019-03-01 20:00:00', '2019-03-05 03:00:00', 'Holiday', '31.233220455939957%2C75.5986453850066', 'Approved'),
(177, 'Mrinal rana ', 180020024, 0, 1, 216, 9459538014, 9459538014, '2019-03-01 20:25:00', '2019-03-05 03:25:00', 'Holiday ', '28.846821960609077%2C77.3066376680513', 'Approved'),
(178, 'Mrinal rana ', 180020024, 0, 1, 216, 9459538014, 9459538014, '2019-03-01 20:25:00', '2019-03-05 03:25:00', 'Holiday ', '28.846821960609077%2C77.3066376680513', 'Approved'),
(179, 'Shivam Chaturvedi', 180010032, 0, 3, 313, 7557885422, 7557885422, '2019-03-01 19:00:00', '2019-03-05 04:00:00', 'Trip', '18.585646851470116%2C78.41497433565428', 'Approval Pending'),
(180, 'Karan Sharma', 180010019, 0, 2, 303, 6392457348, 6392457348, '2019-03-01 20:00:00', '2019-03-05 02:00:00', 'Yeah!!Its holiday', '28.571386644015853%2C77.15943924718704', 'Approval Pending'),
(181, 'Narayanan Namboothiri N P', 180030028, 0, 1, 203, 8078047688, 8078047688, '2019-03-02 07:45:00', '2019-03-03 12:00:00', 'Going for a trip', '15.255767604235757%2C74.62301500506956', 'Approval Pending'),
(182, 'Mahesh Anigol', 183141002, 5, 0, 1, 7738706532, 7083183113, '2019-03-11 09:00:00', '2019-03-18 09:00:00', 'Visiting few places', '15.866703250953393%2C74.50002056853637', 'Approved'),
(183, 'Srikar katukam', 180020017, 0, 2, 306, 6303545623, 9848404030, '2019-03-07 16:25:00', '2019-03-10 18:05:00', 'Function', '13.63492268303851%2C79.41540106122703', 'Approval Pending'),
(184, 'Gourav Kumbhojkar', 180030018, 0, 2, 308, 9130072278, 9423858849, '2019-03-12 18:00:00', '2019-03-14 11:00:00', 'Family function ', '16.688322094144652%2C74.23846373432603', 'Approval Pending'),
(185, 'Kiran P', 183141001, 5, 0, 1, 9449367745, 8861318913, '2019-03-14 19:00:00', '2019-03-18 07:00:00', 'Family function', '12.271121620466744%2C76.6677890834887', 'Approved'),
(186, 'Shivam Chaturvedi', 180010032, 0, 3, 313, 7557885422, 7557885422, '2019-03-20 13:55:00', '2019-03-25 05:00:00', 'Festival%2C going home', '33.137551192346145%2C177.99882899867194', 'Approval Pending'),
(187, 'Bhavya Joshi', 170020010, 6, 2, 3, 7089996110, 8959939231, '2019-03-20 16:00:00', '2019-03-23 19:00:00', 'Home visit', '22.748673306739775%2C75.85082383308182', 'Approved'),
(188, 'Akhil Manoj ', 180030003, 0, 2, 309, 9833467271, 9833467271, '2019-03-21 21:00:00', '2019-03-24 06:00:00', 'Home renovation gathering', '12.094661347191575%2C75.64388382446995', 'Approval Pending'),
(189, 'Rupesh Kalantre', 180010029, 0, 1, 218, 9370333926, 8983700108, '2019-03-22 18:00:00', '2019-03-24 11:00:00', 'Dental treatment ', '16.70468875630887%2C74.25327559688235', 'Approval Pending'),
(190, 'MONIKA BAI M G', 183041001, 6, 2, 4, 8050346246, 8310640337, '2019-03-24 20:25:00', '2019-04-01 21:50:00', 'HOME TOWN VISIT', '16.059201813152058%2C79.45340743750003', 'Approved'),
(191, 'Gandra Joshitha', 180020009, 0, 0, 102, 9966084003, 9966084474, '2019-03-29 10:15:00', '2019-04-01 11:30:00', 'Just wanted to visit home', '15.510846794396045%2C80.03560883420327', 'Approval Pending'),
(192, 'Kiran P', 183141001, 5, 0, 1, 9449367745, 8861318913, '2019-04-12 19:00:00', '2019-04-22 07:00:00', 'Visiting Hometown', '12.24915769011848%2C76.69803486432401', 'Approved'),
(193, 'pragnya chayani', 173041001, 6, 2, 4, 7416452051, 7416452051, '2019-04-29 13:39:00', '2019-04-30 10:40:00', 'personal', '15.527909182806255%2C74.9070432186127', 'Approved'),
(194, 'Abhishek Kalokhe', 170030007, 1, 0, 1, 9834646408, 9822007695, '2019-05-05 19:00:00', '2019-05-11 07:00:00', 'Home', '19.797034211929528%2C74.47070784534891', 'Approved'),
(195, 'S K LOHIT', 183121001, 5, 2, 3, 9482920656, 8310089842, '2019-05-11 07:00:00', '2019-05-26 21:00:00', 'Going to hometown', '14.20546332632425%2C74.93133288702131', 'Approved'),
(196, 'Tephilla Prince', 183061002, 6, 2, 2, 8056702114, 8056702114, '2019-05-24 11:30:00', '2019-06-18 18:30:00', 'Research Visit to CMI%2C Chennai', '12.88846428005364%2C80.3420257135632', 'Approval Pending'),
(197, 'Pragnya Parimita Chayani', 173041001, 6, 2, 4, 7416452051, 7416452051, '2019-05-24 12:20:00', '2019-06-03 10:20:00', 'Digital Humanities Workshop at IIT Guwahati and accessing the central library of University of Hyderabad.', '16.901990032788717%2C78.26688400000003', 'Approval Pending'),
(198, 'Tephilla Prince', 183061002, 6, 2, 0, 8056702114, 8056702114, '2019-07-10 12:00:00', '2019-07-12 18:25:00', 'I will be visiting IIT Hyderabad for the Formal Methods Update Meeting. Kindly approve my leave request. ', '14.482212852207468%2C79.80496993750003', 'Approved'),
(199, 'Tephilla Prince', 183061002, 6, 2, 0, 8056702114, 8056702114, '2019-07-10 12:00:00', '2019-07-12 18:25:00', 'I will be visiting IIT Hyderabad for the Formal Methods Update Meeting. Kindly approve my leave request. ', '14.482212852207468%2C79.80496993750003', 'Approved'),
(200, 'Tephilla Prince', 183061002, 6, 2, 0, 8056702114, 8056702114, '2019-07-10 12:00:00', '2019-07-12 18:25:00', 'I will be visiting IIT Hyderabad for the Formal Methods Update Meeting. Kindly approve my leave request. ', '14.482212852207468%2C79.80496993750003', 'Approved'),
(201, 'Tephilla Prince', 183061002, 6, 2, 0, 8056702114, 8056702114, '2019-07-10 12:00:00', '2019-07-12 18:25:00', 'I will be visiting IIT Hyderabad for the Formal Methods Update Meeting. Kindly approve my leave request. ', '14.482212852207468%2C79.80496993750003', 'Approved'),
(202, 'Tephilla Prince', 183061002, 6, 2, 0, 8056702114, 8056702114, '2019-07-15 09:03:00', '2019-07-26 18:25:00', 'Visiting home town', '11.840727775175992%2C79.05789962500003', 'Approved'),
(203, 'Pragnya parimita chayani', 173041001, 6, 2, 0, 7416452051, 7416452051, '2019-08-05 16:25:00', '2019-09-07 17:25:00', 'for research to Osmania university%2C Hyderabad On research grant ', '17.31149973352342%2C77.73954025000003', 'Approval Pending'),
(204, 'Likhita Peddi', 160020029, 6, 0, 0, 9441972742, 9912919161, '2019-08-15 09:30:00', '2019-08-19 14:00:00', 'Health check up.', '16.976920713306725%2C82.24028337465595', 'Approval Pending');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(11) NOT NULL,
  `level` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `hostel` int(11) DEFAULT NULL,
  `name` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `username` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `phone` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `rset_flag` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `level`, `hostel`, `name`, `email`, `username`, `password`, `phone`, `rset_flag`) VALUES
(1, 'gsha', NULL, 'Harshal Gajjar', 'harshalg98@gmail.com', 'harshal', '69d7c995b84020a3649e9ffb14e3d1d6970a3a66', '8879585099', 'd321d6f7ccf98b51540ec9d933f20898af3bd71e'),
(2, 'btech', NULL, 'Student', '', 'student', '204036a1ef6e7360e536300ea78c6aeb4a9333dd', '0000000000', '3c26dffc8a2e8804dfe2c8a1195cfaa5ef6d0014'),
(3, 'admin', NULL, 'Admin', '', 'administrator', 'c51d127a2d5dbe9f74ad6ced18bad40050e4551d', '', ''),
(4, 'admin', NULL, 'Omprakash Bhendigeri', 'omprakash@iitb.ac.in', 'omprakash', 'a64384cc920d51a56c834206aac441ade2ab43cf', '', ''),
(7, 'dean.sw', NULL, 'S. V. Prabhu', 'dean.sw@iitdh.ac.in', 'svprabhu', '680f1fb8456e254b1b6162525806c71bad98cad4', '', ''),
(43, 'warden', 3, 'Prof. Bharat', 'warden_abheri@iitdh.ac.in', 'bharatbn', '57df02731324d5114ac1407fe306d75e5219be0b', '', '95e815d1541bf6f358cfffbe66ab3af0d0c09d09'),
(42, 'warden', 6, 'Prof. Ridhima', 'warden_saveri@iitdh.ac.in', 'ridhima', '2a839537476cf8ec64791f294bea60a71651aa39', '', '9e071a3a594a8964cbefe784f8a6afaa94c0de17'),
(14, 'gsha', NULL, 'Ashrith Adepu', 'gsha@iitdh.ac.in', 'gsha', '8ad6b3112f0bcafb687e52ec40f9f98d2f0b04b4', '', 'a6f16ab483da9847d431a822e6c85e144dc54f30'),
(48, 'warden', 10, 'Prof. Tejas', 'warden_hindol@iitdh.ac.in', 'tejaspg', '39a1a553393c0e64379498080873d8778557c2a9', '', '8b7471f4ae0bf59f5f0a425068c05d96f4801b9e'),
(36, 'secy', 0, 'Tarun Goyal', '180010038@iitdh.ac.in', 'tarung', 'a20194b226d72923e5db3850489a730b3699071d', '', '04f1241ed2b1b531c2c853ce1eeff952cd0f40f3'),
(37, 'secy', 0, 'Sameer Dohadwalla', '180020033@iitdh.ac.in', 'sameerd', '3ef329c101828738e928d3e25b5ec1deeb7368c4', '', 'c28aca23f1ef3718a464383d925c66842078edaa'),
(31, 'secy', 3, 'Ojas Raundale', '170010004@iitdh.ac.in', 'ojasr', '4032d10ff0cd2aee9d1df6708a58b134579c7043', '', '14bb99f81147d2705f53a1d75337b2ec3e10d23a'),
(32, 'secy', 2, 'Soma Siddhartha', '170010037@iitdh.ac.in', 'somas', '38cdc9eae7467d9ef94c5d22e240d0e33421ae56', '', '9d8974baddfc0e53300829f37e5fc88b0f5ce61b'),
(33, 'secy', 1, 'Nischay Sri Niketh', '170020028@iitdh.ac.in', 'nischayn', '508da316235b283566cc3c76e2f175cd35ff7e28', '', 'd094700e379f0fb3b543e25c77f8e4b3e068f057'),
(34, 'secy', 6, 'Varshha Thandu', '160010027@iitdh.ac.in', 'varshhat', 'c95d61124647fa9af8bae0d4bbb26c27546c6264', '', 'dc685e2c3fd7a3a63944383a54aa249ea27f5fdd'),
(35, 'secy', 0, 'Purnima Priyadarshini', '180010026@iitdh.ac.in', 'purnimap', '3970b9f624e93499512decc28185394b25363081', '', 'c8306ae139ac98f432932286151dc0ec55580eca'),
(38, 'secy', 10, 'Nikshep Maknoor', '160010025@iitdh.ac.in', 'nikshepm', '8f4c0913b7156ae3e6b48958081ce526329e1b1c', '', '40f7c01f4189510031adccd9c604a128adaf9b00'),
(39, 'secy', 8, 'Abhishek Jyotishi', '160030026@iitdh.ac.in', 'abhishekj', 'c27cef4452f633079fc31c8f76b2f7f483b4817a', '', '2952aeca0fe15cf310ede96c437acb94b2b208f1'),
(40, 'secy', 4, 'Ashish Arora', '160010008@iitdh.ac.in', 'ashisha', '68082b784d371f528d6d8691cb6934130c6cded1', '', '708a77db476d737e54b8bf4663fc79b346d696d2'),
(44, 'warden', 2, 'Prof. Rajshekar ', 'warden_bhairavi@iitdh.ac.in', 'rajshekar', '64f1ca9bccb75251832b094a63584c4c8828aa05', '', '74cbd2c215c2c13c4b6110ada96de8891b355dda'),
(45, 'warden', 1, 'Prof. Sandeep', 'warden_asavari@iitdh.ac.in', 'sandeeprb', '756f6eb3fa3fa618900d6c5c37ccaa23ed495b06', '', '752ae7bdbb96bf25280b55990570beabf2048ce0'),
(46, 'warden', 8, 'Prof. Ameer', 'warden_kedar@iitdh.ac.in', 'ameer', 'b2c77b152c5615d709752675239dd669fbb09af5', '', '2fcc820fc1d95b1e8a3a219c7e3689bb8d65042c'),
(47, 'warden', 4, 'Prof. Sudheer', 'warden_behag@iitdh.ac.in', 'sudheer', 'b7000e74ecacd79695dfd64395e6fec613a5710b', '', 'd094700e379f0fb3b543e25c77f8e4b3e068f057'),
(54, 'warden', 15, 'Harshal Gajjar', '160010003@iitdh.ac.in', 'harshal', 'f8377c90fcfd699f0ddbdcb30c2c9183d2d933ea', '', 'c28aca23f1ef3718a464383d925c66842078edaa'),
(51, 'warden', 0, 'Prof. Rajeswara', 'warden_keeravani_boys@iitdh.ac.in', 'rajesh', 'c429e96e42f954933b8062e966d7de1a097cbfd6', '', 'cfa2ed2aac6d61f44ca9cba73e1e8946b7cd7d22'),
(52, 'warden', 0, 'Prof. Ruma', 'warden_keeravani_girls@iitdh.ac.in', 'rumaghosh', '7e3afadc17e08559377e2ae410c3610c08d9a6dd', '', '78a8efcbaaa1a9a30f9f327aa89d0b6acaaffb03'),
(53, 'warden', 5, 'Prof. Koushik', 'warden_chhayanat@iitdh.ac.in', 'koushik.saha', '15ec59dba72952cb49c560525e611992ff5fe1e9', '', 'f38cfe2e2facbcc742bad63f91ad55637300cb45'),
(55, 'secy', 5, 'Mahesh Anigol', '183141002@iitdh.ac.in', 'mahesha', 'dfe7a9195a08ce979ee53a6af7710848d6cbf531', '', '775bc5c30e27f0e562115d136e7f7edbd3cead89');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `all_complains`
--
ALTER TABLE `all_complains`
  ADD PRIMARY KEY (`complain_id`);

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `complains`
--
ALTER TABLE `complains`
  ADD PRIMARY KEY (`complain_id`);

--
-- Indexes for table `issue_type_table`
--
ALTER TABLE `issue_type_table`
  ADD PRIMARY KEY (`issue_type_option_no`);

--
-- Indexes for table `leave_requests`
--
ALTER TABLE `leave_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `all_complains`
--
ALTER TABLE `all_complains`
  MODIFY `complain_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=479;

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `complains`
--
ALTER TABLE `complains`
  MODIFY `complain_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=485;

--
-- AUTO_INCREMENT for table `issue_type_table`
--
ALTER TABLE `issue_type_table`
  MODIFY `issue_type_option_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `leave_requests`
--
ALTER TABLE `leave_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=205;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
