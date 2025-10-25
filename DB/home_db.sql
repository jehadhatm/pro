SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

-- Database: `home_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `about`
--

DROP TABLE IF EXISTS `about`;
CREATE TABLE IF NOT EXISTS `about` (
  `id` int NOT NULL,
  `title` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `image` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
CREATE TABLE IF NOT EXISTS `admins` (
  `id` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `password`) VALUES
('BcjKNX58e4x7bIqIvxG7', 'admin', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2');

-- --------------------------------------------------------

--
-- Table structure for table `explore`
--

DROP TABLE IF EXISTS `explore`;
CREATE TABLE IF NOT EXISTS `explore` (
  `id` varchar(20) NOT NULL,
  `admin_id` varchar(20) NOT NULL,
  `property_name` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `city` varchar(1000) NOT NULL,
  `price` varchar(10) NOT NULL,
  `currency` varchar(1000) NOT NULL,
  `type` varchar(10) NOT NULL,
  `offer` varchar(10) NOT NULL,
  `contract` varchar(1000) NOT NULL,
  `status` varchar(50) NOT NULL,
  `furnished` varchar(50) NOT NULL,
  `halls` varchar(1000) NOT NULL,
  `bhk` varchar(10) NOT NULL,
  `deposite` varchar(10) NOT NULL,
  `bedroom` varchar(10) NOT NULL,
  `bathroom` varchar(10) NOT NULL,
  `balcony` varchar(10) NOT NULL,
  `carpet` varchar(10) NOT NULL,
  `age` varchar(2) NOT NULL,
  `finishing` varchar(1000) NOT NULL,
  `total_floors` varchar(2) NOT NULL,
  `room_floor` varchar(2) NOT NULL,
  `loan` varchar(50) NOT NULL,
  `lift` varchar(3) NOT NULL DEFAULT 'no',
  `security_guard` varchar(3) NOT NULL DEFAULT 'no',
  `play_ground` varchar(3) NOT NULL DEFAULT 'no',
  `garden` varchar(3) NOT NULL DEFAULT 'no',
  `water_supply` varchar(3) NOT NULL DEFAULT 'no',
  `power_backup` varchar(3) NOT NULL DEFAULT 'no',
  `parking_area` varchar(3) NOT NULL DEFAULT 'no',
  `gym` varchar(3) NOT NULL DEFAULT 'no',
  `shopping_mall` varchar(3) NOT NULL DEFAULT 'no',
  `hospital` varchar(3) NOT NULL DEFAULT 'no',
  `school` varchar(3) NOT NULL DEFAULT 'no',
  `market_area` varchar(3) NOT NULL DEFAULT 'no',
  `image_01` varchar(50) NOT NULL,
  `image_02` varchar(50) NOT NULL,
  `image_03` varchar(50) NOT NULL,
  `image_04` varchar(50) NOT NULL,
  `image_05` varchar(50) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `explore`
--

INSERT INTO `explore` (`id`, `admin_id`, `property_name`, `address`, `city`, `price`, `currency`, `type`, `offer`, `contract`, `status`, `furnished`, `halls`, `bhk`, `deposite`, `bedroom`, `bathroom`, `balcony`, `carpet`, `age`, `finishing`, `total_floors`, `room_floor`, `loan`, `lift`, `security_guard`, `play_ground`, `garden`, `water_supply`, `power_backup`, `parking_area`, `gym`, `shopping_mall`, `hospital`, `school`, `market_area`, `image_01`, `image_02`, `image_03`, `image_04`, `image_05`, `description`, `date`) VALUES
('lnrNbM9KQzOJ03NInb9W', '', 'Ø§Ù„Ù‚ØµØ± Ø§Ù„Ø¬Ù…Ù‡ÙˆØ±ÙŠ', 'Ø§Ù„Ø²Ø±Ø§Ø¹Ù‡', '', '300', '', 'house', 'sale', '', 'ready to move', 'furnished', '', '1', '100', '1', '1', '0', '5', '25', '', '2', '0', 'available', 'yes', 'yes', 'yes', 'no', 'yes', 'yes', 'yes', 'no', 'no', 'no', 'no', 'no', 'Gh1Kihl5uiFw0hdqB4XU.jpeg', '', '', '', '', 'Ø¨ÙŠØª ÙƒØ¨ÙŠÙŠÙŠÙŠÙŠØ± Ù‚ÙˆÙŠ Ø¹Ø¨ÙˆØ¯ÙŠ ÙÙŠÙ‡', '2023-12-26 02:26:21'),
('nQj1hSv2S7ZAMzibn3ea', 'BcjKNX58e4x7bIqIvxG7', 'Ø®Ø§Ù„Ø¯', 'Ø§Ù„Ø²Ø±Ø§Ø¹Ù‡', '', '100', '', 'flat', 'sale', '', 'ready to move', 'furnished', '', '1', '0', '1', '1', '0', '100', '1', '', '0', '0', 'available', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'AOH9YyA6xzUHdIoxMvEa.jpeg', '', '', '', '', '1', '2023-12-26 18:48:29'),
('GJoqET2soxKiGupcsvY1', 'BcjKNX58e4x7bIqIvxG7', 'kh', 'Ø§Ù„Ø²Ø±Ø§Ø¹Ù‡', 'aden', '1000', 'USD', 'house', 'rent', 'annual-rental', 'sana&#39;a', 'Installments', '0', '1', '1000', '1', '1', '3', '1000', '20', 'none', '0', '0', 'Old building', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'smaBOBYFgwKOmZXQHqhg.jpeg', '', '', '', '', '111', '2023-12-27 00:48:54');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
CREATE TABLE IF NOT EXISTS `messages` (
  `id` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `number` varchar(10) NOT NULL,
  `message` varchar(1000) NOT NULL,
  `reply_message` varchar(1000) DEFAULT NULL,
  `reply_id` varchar(20) DEFAULT NULL,
  `user_id` varchar(20) DEFAULT NULL,
  KEY `fk_messages_users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `name`, `email`, `number`, `message`, `reply_message`, `reply_id`, `user_id`) VALUES
('bn9nhR55OtTqEhPf0jFV', 'Khalid ', 'kh@gmail.com', '770711772', 'hi jehad', 'hi khalid', NULL, 'lit5Ki2FAOEYYKkepLY6'),
('UHKDl4F2IC0P38QXMzgq', 'Khalid ', 'kh@gmail.com', '770805575', 'qqqqqqqqqqqqqqq', 'dddddddddddddddddddddddddddddddddddddddddddd', NULL, 'lit5Ki2FAOEYYKkepLY6');

-- --------------------------------------------------------

--
-- Table structure for table `property`
--

DROP TABLE IF EXISTS `property`;
CREATE TABLE IF NOT EXISTS `property` (
  `id` varchar(20) NOT NULL,
  `user_id` varchar(20) NOT NULL,
  `property_name` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `city` varchar(1000) NOT NULL,
  `price` varchar(10) NOT NULL,
  `currency` varchar(1000) NOT NULL,
  `type` varchar(10) NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `offer` varchar(10) NOT NULL,
  `contract` varchar(1000) NOT NULL,
  `status` varchar(50) NOT NULL,
  `furnished` varchar(50) NOT NULL,
  `halls` varchar(1000) NOT NULL,
  `bhk` varchar(10) NOT NULL,
  `deposite` varchar(10) NOT NULL,
  `bedroom` varchar(10) NOT NULL,
  `bathroom` varchar(10) NOT NULL,
  `balcony` varchar(10) NOT NULL,
  `carpet` varchar(10) NOT NULL,
  `age` varchar(2) NOT NULL,
  `finishing` varchar(1000) NOT NULL,
  `total_floors` varchar(2) NOT NULL,
  `room_floor` varchar(2) NOT NULL,
  `loan` varchar(50) NOT NULL,
  `lift` varchar(3) NOT NULL DEFAULT 'no',
  `security_guard` varchar(3) NOT NULL DEFAULT 'no',
  `play_ground` varchar(3) NOT NULL DEFAULT 'no',
  `garden` varchar(3) NOT NULL DEFAULT 'no',
  `water_supply` varchar(3) NOT NULL DEFAULT 'no',
  `power_backup` varchar(3) NOT NULL DEFAULT 'no',
  `parking_area` varchar(3) NOT NULL DEFAULT 'no',
  `gym` varchar(3) NOT NULL DEFAULT 'no',
  `shopping_mall` varchar(3) NOT NULL DEFAULT 'no',
  `hospital` varchar(3) NOT NULL DEFAULT 'no',
  `school` varchar(3) NOT NULL DEFAULT 'no',
  `market_area` varchar(3) NOT NULL DEFAULT 'no',
  `image_01` varchar(50) NOT NULL,
  `image_02` varchar(50) NOT NULL,
  `image_03` varchar(50) NOT NULL,
  `image_04` varchar(50) NOT NULL,
  `image_05` varchar(50) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `property`
--

INSERT INTO `property` (`id`, `user_id`, `property_name`, `address`, `city`, `price`, `currency`, `type`, `category`, `title`, `offer`, `contract`, `status`, `furnished`, `halls`, `bhk`, `deposite`, `bedroom`, `bathroom`, `balcony`, `carpet`, `age`, `finishing`, `total_floors`, `room_floor`, `loan`, `lift`, `security_guard`, `play_ground`, `garden`, `water_supply`, `power_backup`, `parking_area`, `gym`, `shopping_mall`, `hospital`, `school`, `market_area`, `image_01`, `image_02`, `image_03`, `image_04`, `image_05`, `description`, `date`) VALUES
('5ML8sP132CXU4dEAju6a', 'lit5Ki2FAOEYYKkepLY6', 'villa test', 'sana&#39;a ring ', '', '500000', '', 'villa', NULL, NULL, 'sale', '', 'ready to move', 'furnished', '', '1', '0', '1', '1', '4', '350', '2', '', '3', '0', 'not available', 'no', 'no', 'yes', 'yes', 'no', 'no', 'yes', 'no', 'no', 'no', 'no', 'no', 'P80boNewqa7gQzoROMPQ.webp', '5zFa71zCCkumFOOe0YNs.webp', 'cjN6o3uZhRzmnR6oQ8TI.webp', 'x6OzZkubT1gbmpH151WW.webp', 'IC1Dr89MyJdQJr0BZWpa.webp', 'villa', '2023-12-20 22:56:38'),
('6dhjXK1EPHjWLfzOsmQ0', 'suaRmod79n37mixhBiJl', 'apartment test 1', 'Ø§Ù„Ø²Ø±Ø§Ø¹Ù‡', 'sana&#39;a', '1000', 'YEMENI REAL', 'flat', NULL, NULL, 'sale', 'daily-rental', 'sana&#39;a', 'Cash', '0', '1', '1000', '1', '1', '0', '10', '1', 'lux', '1', '1', 'Old building', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', '23PO64isYOhZwwiO7rQ1.webp', '', '', '', '', '1', '2023-12-27 00:12:33'),
('aeSLV1TAprvVvUhT2lBu', 'suaRmod79n37mixhBiJl', 'house test 1', 'ring ', 'sana&#39;a', '1000', 'YEMENI REAL', 'house', NULL, NULL, 'sale', 'ownership-document', 'sana&#39;a', 'furnished', '0', '1', '100', '1', '1', '0', '10', '20', 'super-lux', '10', '1', 'available', 'yes', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'LajkNM8cgr54o6SklknG.webp', '', '', '', '', 'house', '2023-12-26 22:31:30'),
('D4LgV0o06lCuWCZnIaHr', 'suaRmod79n37mixhBiJl', 'flat test 3', 'sana&#39;a ring ', 'sana&#39;a', '1000', '', 'flat', NULL, NULL, 'sale', '', 'ready to move', 'furnished', '', '1', '100', '1', '1', '0', '10', '10', '', '1', '1', 'available', 'yes', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'BHOjNnQ8BihGFj92Tfmy.webp', '', '', '', '', 'TEST 3', '2023-12-26 21:40:18'),
('dQh5YS8zAWVTzXLvHKxS', 'lit5Ki2FAOEYYKkepLY6', 'flat test', 'sana&#39;a ring ', '', '10000', '', 'flat', NULL, NULL, 'sale', '', 'ready to move', 'furnished', '', '1', '0', '1', '1', '2', '200', '10', '', '1', '3', 'not available', 'yes', 'yes', 'no', 'no', 'yes', 'yes', 'yes', 'no', 'no', 'yes', 'yes', 'no', 'aCUxK7kNNCBm6OJpDQC8.webp', 'wSFtv8ZKyNgx7HGqhU0r.webp', 'McKUsUuhiTVdzCbizDbX.webp', '7l2NZJMcSHyfRUUunV1A.webp', '0ivdPx4r4VgGLCvbxG0Z.webp', 'flat', '2023-12-20 22:45:48'),
('FxroE08cycYBXwTl9Spx', 'lit5Ki2FAOEYYKkepLY6', 'land test', 'sana&#39;a ring ', '', '700000', '', 'land', NULL, NULL, 'sale', '', 'ready to move', 'furnished', '', '1', '0', '1', '1', '0', '1000', '0', '', '0', '0', 'not available', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'dAca5WRH2mtYmHAwoFoh.webp', '4vJptKZiF728HeOwGgC8.webp', 'QR8d5czFmSQaDMaOQHTe.webp', 'tLpO2mpYCXTYlFSPOxr4.webp', 'Qm3geSvFytLrPrpVSBxA.webp', 'land', '2023-12-20 22:54:44'),
('gxKq9FqWQxwifFeFb688', 'lit5Ki2FAOEYYKkepLY6', 'shop test', 'sana&#39;a ring ', '', '1200', '', 'shop', NULL, NULL, 'rent', '', 'ready to move', 'unfurnished', '', '1', '0', '0', '1', '0', '75', '13', '', '1', '0', 'not available', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'BvcqVqapgVID2yokhdx6.webp', 'WljsKWctQ45hInuq9kGd.webp', '9YsRRBuqkHWGwHIVe3mz.webp', 'Qn4l2XopUcQO1oA7ciwB.webp', 'QCq3w5glY6f49CNa2ijz.webp', 'shop', '2023-12-20 22:58:24'),
('H7DHN44um4MFTZNVqm3f', 'lit5Ki2FAOEYYKkepLY6', 'house test', 'sana&#39;a ring ', '', '1000', '', 'house', NULL, NULL, 'sale', '', 'ready to move', 'furnished', '', '1', '0', '1', '1', '0', '300', '25', '', '2', '1', 'not available', 'no', 'no', 'yes', 'yes', 'yes', 'yes', 'yes', 'no', 'no', 'no', 'no', 'no', '289DomRAtLWpInfLo4Ib.webp', 'wTKOiNR0AakNfoljrirk.webp', 'c5vS5uWtSroW1mGcAMPF.webp', 'Qyue1PYP37IheW9gXuTW.webp', 'QUwjLQPMEZY2KqhZ97Cl.webp', 'house', '2023-12-20 22:48:41'),
('J8sxl6wyngJkCE3Xr6f1', 'lit5Ki2FAOEYYKkepLY6', 'apartment test', 'sana&#39;a ring ', '', '50000', '', 'apartment', NULL, NULL, 'sale', '', 'ready to move', 'furnished', '', '1', '0', '1', '1', '0', '500', '1', '', '4', '0', 'not available', 'yes', 'yes', 'no', 'no', 'yes', 'yes', 'yes', 'no', 'no', 'no', 'no', 'no', 'wOFwuA7BOwjWfJCxha2r.webp', 'kLq86wfAf7oQZXCKjH9C.webp', 'A2ffWY9Qw6Ud2APEEhU8.webp', 'rf90vmlovjGDU0DddIoq.webp', 'sySyVYYTKDG3zTgvUegU.webp', 'apa', '2023-12-20 22:50:53'),
('lKaqMz9krIkDcoJPMfgr', 'suaRmod79n37mixhBiJl', 'flat test 2', 'sana&#39;a ring ', 'sana&#39;a', '1000', '', 'flat', NULL, NULL, 'sale', '', 'ready to move', 'furnished', '', '1', '1000', '1', '1', '1', '1', '1', '', '1', '1', 'available', 'yes', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'rqMxtFmFgH7pR1iVp0LF.webp', 'yhcfY3y3XMQAxHggPW76.webp', 'IpFId9p6k3Qx13WAuaWw.webp', 'Ndo11dsoYwbo3Vrauboy.webp', 'rFVKq34v2wYod3PqnGYk.webp', 'test 2', '2023-12-26 21:27:44'),
('qfvwpziK0cXIEDQQybBU', 'lit5Ki2FAOEYYKkepLY6', 'test 10', 'r', 'sana&#39;a', '1000', 'YEMENI REAL', 'flat', NULL, NULL, 'sale', 'daily-rental', 'sana&#39;a', 'Cash', '0', '1', '120', '1', '1', '0', '100', '1', 'none', '1', '0', 'Concrete', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', '6S4mVpqgvFu5hYxnAMCq.jpeg', '', '', '', '', '1', '2023-12-27 03:39:18'),
('YsHHU6BjTxE8ZRovm4sF', 'suaRmod79n37mixhBiJl', 'flat test 3', 'sana&#39;a ring ', 'sana&#39;a', '1000', 'USD', 'flat', NULL, NULL, 'sale', '', 'ready to move', 'furnished', '', '1', '10', '1', '1', '0', '1', '1', '', '1', '1', 'available', 'yes', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'LPvCBJpgrT7hS8V7pAN9.webp', '', '', '', '', 'TEST 3', '2023-12-26 21:41:47');

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

DROP TABLE IF EXISTS `reports`;
CREATE TABLE IF NOT EXISTS `reports` (
  `id` int NOT NULL AUTO_INCREMENT,
  `property_id` varchar(20) NOT NULL,
  `user_id` varchar(20) NOT NULL,
  `report_type` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`id`, `property_id`, `user_id`, `report_type`) VALUES
(23, 'qfvwpziK0cXIEDQQybBU', 'lit5Ki2FAOEYYKkepLY6', 'scam'),
(22, '6dhjXK1EPHjWLfzOsmQ0', 'lit5Ki2FAOEYYKkepLY6', 'scam');

-- --------------------------------------------------------

--
-- Table structure for table `requests`
--

DROP TABLE IF EXISTS `requests`;
CREATE TABLE IF NOT EXISTS `requests` (
  `id` varchar(20) NOT NULL,
  `property_id` varchar(20) NOT NULL,
  `sender` varchar(20) NOT NULL,
  `receiver` varchar(20) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `requests`
--

INSERT INTO `requests` (`id`, `property_id`, `sender`, `receiver`, `date`) VALUES
('jA6pgEz5i7FjSeS9DnoF', 'R9fzMo7tr5HGCURpajpe', 'PXxS0120WwkDkuLfE4Kd', 'PXxS0120WwkDkuLfE4Kd', '2023-11-28 05:07:13'),
('zifqXgczSxnJ4wQpEtIK', 'R9fzMo7tr5HGCURpajpe', 'y4SD7ElJMShSfdhXqo5Y', 'PXxS0120WwkDkuLfE4Kd', '2023-11-28 06:28:50'),
('hX9RubsSPc4vsvDfufKg', 'R9fzMo7tr5HGCURpajpe', 'lit5Ki2FAOEYYKkepLY6', 'PXxS0120WwkDkuLfE4Kd', '2023-12-18 05:09:46'),
('V3pVfJAsI3N8g5u6pTzf', 'gxKq9FqWQxwifFeFb688', 'suaRmod79n37mixhBiJl', 'lit5Ki2FAOEYYKkepLY6', '2023-12-21 00:05:51'),
('jdogUoJoApTwIE9hyeMV', 'J8sxl6wyngJkCE3Xr6f1', 'suaRmod79n37mixhBiJl', 'lit5Ki2FAOEYYKkepLY6', '2023-12-27 03:00:04'),
('sX1oGIGx9IzsiKTV1BFq', '6dhjXK1EPHjWLfzOsmQ0', 'lit5Ki2FAOEYYKkepLY6', 'suaRmod79n37mixhBiJl', '2023-12-27 06:07:36'),
('mr0U4DvdvWUazehcpRz4', 'qfvwpziK0cXIEDQQybBU', 'lit5Ki2FAOEYYKkepLY6', 'lit5Ki2FAOEYYKkepLY6', '2023-12-27 06:30:12');

-- --------------------------------------------------------

--
-- Table structure for table `saved`
--

DROP TABLE IF EXISTS `saved`;
CREATE TABLE IF NOT EXISTS `saved` (
  `id` varchar(20) NOT NULL,
  `property_id` varchar(20) NOT NULL,
  `user_id` varchar(20) NOT NULL,
  `admin_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `saved`
--

INSERT INTO `saved` (`id`, `property_id`, `user_id`, `admin_id`) VALUES
('vVG3T7DXqQC24tZsHmgV', 'R9fzMo7tr5HGCURpajpe', 'PXxS0120WwkDkuLfE4Kd', ''),
('5inr8SreWs7rLj3SZcnB', 'R9fzMo7tr5HGCURpajpe', 'y4SD7ElJMShSfdhXqo5Y', '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `number` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `uimage` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `number`, `email`, `password`, `uimage`) VALUES
('7JvWgdz2zZymFsq1WFPl', 'ali', '770711772', 'ali@gmail.com', '4d6ec2ad6f71664528bf108b055ac7fdd14cd6ad', 'MInimal_1126.jpeg'),
('lit5Ki2FAOEYYKkepLY6', 'Khalid ', '770711772', 'kh@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', '557A9303.JPG'),
('suaRmod79n37mixhBiJl', 'Ø¶ÙŠÙ', '7888', 'test@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 'Gaming_2150.jpeg'),
('wvtMKdfcNB53mxCwaiaA', 'jemal', '775542421', 'jamal@gmail.com', 'ba14d2ed38438bca0bf68bf5d1112abf8354b4c7', '4563.jpg');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `fk_messages_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
