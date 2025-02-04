-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.33 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             11.2.0.6638
-3- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for EcoBulkdb
CREATE DATABASE IF NOT EXISTS `EcoBulkdb` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `EcoBulkdb`;

-- Dumping structure for table EcoBulkdb.address
CREATE TABLE IF NOT EXISTS `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `home_address` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- Dumping data for table EcoBulkdb.address: ~8 rows (approximately)
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` (`id`, `email`, `home_address`, `zip`, `state`, `area`, `phone_number`) VALUES
	(1, 'user@gmail.com', '28 nehru nagar User638','638003', 'TamilNadu', 'Erode', '9965422090'),
	(2, 'vishnu@gmail.com', '28 nehru nagar ', '638003', 'TamilNadu', 'Erode', '965422090'),
	(3, 'loki@gmail.com', '28 nehru nagar ', '638003', 'TamilNadu', 'Erode', '9361070035'),
	(4, 'loki@gmail.com', '28 nehru nagar ', '638003', 'TamilNadu', 'Erode', '965422090'),
	(5, 'sketch@gmail.com', '28 nehru nagar  ', '638003', 'TamilNadu', 'Erode', '9361070035'),
	(6, 'sketch@gmail.com', '28 nehru nagar','638003', 'TamilNadu', 'Erode', '9361070035'),
	(7, 'yuvan@gmail.com', '28 nehru nagar','638003', 'TamilNadu', 'Erode', '9361070035'),
	(8, 'sherif@gmail.com', '28 nehru nagar  ', '638003', 'TamilNadu', 'Erode', '9361070035'),
	(9, 'arun@gmail.com', '28 nehru nagar ', '638003', 'TamilNadu', 'Erode', '9361070035'),
	(10, 'arun@gmail.com', '28 nehru nagar ', '638003', 'Tamilnadu', 'Erode', '965422090');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;

-- Dumping structure for table EcoBulkdb.cart
CREATE TABLE IF NOT EXISTS `cart` (
  `id` varchar(255) NOT NULL,
  `title` varchar(100) NOT NULL,
  `category` varchar(100) NOT NULL,
  `quantity` int(10) NOT NULL,
  `price` double(10,2) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` varchar(600) NOT NULL,
  `totalPrice` double(10,2) NOT NULL,
  `email` varchar(255) NOT NULL,
  `ikey` varchar(255) NOT NULL,
  `seller_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ikey`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table EcoBulkdb.cart: ~0 rows (approximately)
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;

-- Dumping structure for table EcoBulkdb.category
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT 'All Product',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- Dumping data for table EcoBulkdb.category: ~7 rows (approximately)
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`id`, `name`) VALUES
	(1, 'Clothes'),
	(6, 'Shoes'),
	(7, 'Book'),
	(8, 'Mobile & Gadget'),
	(9, 'Game'),
	(10, 'Cup'),
	(11, 'water');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;

-- Dumping structure for table EcoBulkdb.chats
CREATE TABLE IF NOT EXISTS `chats` (
  `chat_id` int(11) NOT NULL AUTO_INCREMENT,
  `from_id` varchar(255) NOT NULL,
  `to_id` varchar(255) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`chat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table EcoBulkdb.chats: ~5 rows (approximately)
/*!40000 ALTER TABLE `chats` DISABLE KEYS */;
INSERT INTO `chats` (`chat_id`, `from_id`, `to_id`, `message`, `created_at`) VALUES
	(1, 'loki@gmail.com', 'user@gmail.com', 'hi', '2022-01-24 02:48:51'),
	(2, 'sketch@gmail.com', 'user@gmail.com', 'hi', '2022-01-24 10:43:06'),
	(3, 'user@gmail.com', 'sketch@gmail.com', 'hi', '2022-01-24 10:51:57'),
	(4, 'yuvan@gmail.com', 'user@gmail.com', 'hi may i ask for the price', '2022-01-24 12:52:24'),
	(5, 'arun@gmail.com', 'user@gmail.com', 'hi', '2022-01-24638:433:42'),
	(6, 'user@gmail.com', 'arun@gmail.com', 'hi', '2022-01-24638:530:04');
/*!40000 ALTER TABLE `chats` ENABLE KEYS */;

-- Dumping structure for table EcoBulkdb.conversations
CREATE TABLE IF NOT EXISTS `conversations` (
  `conversation_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_1` varchar(255) NOT NULL,
  `user_2` varchar(255) NOT NULL,
  PRIMARY KEY (`conversation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table EcoBulkdb.conversations: ~4 rows (approximately)
/*!40000 ALTER TABLE `conversations` DISABLE KEYS */;
INSERT INTO `conversations` (`conversation_id`, `user_1`, `user_2`) VALUES
	(1, 'loki@gmail.com', 'user@gmail.com'),
	(2, 'sketch@gmail.com', 'user@gmail.com'),
	(3, 'yuvan@gmail.com', 'user@gmail.com'),
	(4, 'arun@gmail.com', 'user@gmail.com');
/*!40000 ALTER TABLE `conversations` ENABLE KEYS */;

-- Dumping structure for table EcoBulkdb.order_list
CREATE TABLE IF NOT EXISTS `order_list` (
  `transaction_id` varchar(255) NOT NULL,
  `id` varchar(255) NOT NULL,
  `title` varchar(100) NOT NULL,
  `category` varchar(100) NOT NULL,
  `quantity` int(10) NOT NULL,
  `price` double(10,2) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` varchar(600) NOT NULL,
  `totalPrice` double(10,2) NOT NULL,
  `custemail` varchar(255) NOT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `payment_method` varchar(255) DEFAULT NULL,
  `payment_status` varchar(255) DEFAULT NULL,
  `order_status` varchar(255) DEFAULT NULL,
  `delivery_address` varchar(255) DEFAULT NULL,
  `zip` int(10) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `seller_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table EcoBulkdb.order_list: ~6 rows (approximately)
/*!40000 ALTER TABLE `order_list` DISABLE KEYS */;
INSERT INTO `order_list` (`transaction_id`, `id`, `title`, `category`, `quantity`, `price`, `image`, `description`, `totalPrice`, `custemail`, `time`, `payment_method`, `payment_status`, `order_status`, `delivery_address`, `zip`, `state`, `area`, `seller_id`) VALUES
	('6TSZOQP7NI6XP', 'BRW_62523', 'Luka Doncic 77 Jersey', 'Clothes', 2, 259.00, 'luka-doncic-mavericks-icon-edition-2020-nba-swingman-jersey-ldJB9b.png', 'Dallas Mavericks Jersey', 518.00, 'vishnu@gmail.com', '2022-01-24 02:25638',3 'COD', 'Paid', 'Completed', '28 nehru nagar , 638003, TamilNadu, Erode, 0127183963', NULL, NULL, NULL, 'user@gmail.com'),
	('O4FXHMPN5GOHK', 'FSI_24419', 'Mamba Mentality How I Play', 'Book', 8, 129.00, '40230101._SX318_.jpg', 'Kobe Bryantâ€™s personal perspective of his life', 1032.00, 'loki@gmail.com', '2022-01-24 02:51:19', 'COD', 'Paid', 'Completed', 'nodasddas, 32445, sad, 12, 965422090', NULL, NULL, NULL, 'user@gmail.com'),
	('RVDVDMHEH6ZEV', 'EKO_50675', 'Russell Westbrook 0 Jersey', 'Clothes', 2, 123.00, '128-1284263_russell-westbrook-nba-adidas-youth-replica-alternate-okc.jpg', 'OKC Thunder Jersey', 246.00, 'vishnu@gmail.com', '2022-01-24 02:23:00', 'COD', 'Paid', 'Completed', '28 nehru nagar , 638003, TamilNadu, Erode, 0127183963', NULL, NULL, NULL, 'user@gmail.com'),
	('VDSHT0XIFQ2BL', 'EKO_50675', 'Russell Westbrook 0 Jersey', 'Clothes', 7, 123.00, '128-1284263_russell-westbrook-nba-adidas-youth-replica-alternate-okc.jpg', 'OKC Thunder Jersey', 861.00, 'yuvan@gmail.com', '2022-01-24 12:55:17', 'COD', 'Paid', 'Completed', '4, Jalan 638, 3638003, TamilNadu, Erode, 9361070035', NULL, NULL, NULL, 'user@gmail.com'),
	('WOLQGSD2IS3ZV', 'EKO_50675', 'Russell Westbrook 0 Jersey', 'Clothes', 1, 123.00, '128-1284263_russell-westbrook-nba-adidas-youth-replica-alternate-okc.jpg', 'OKC Thunder Jersey', 123.00, 'arun@gmail.com', '2022-01-24638:436:24', 'COD', 'Paid', 'Completed', '28 nehru nagar , 638003, KL, 12, 965422090', NULL, NULL, NULL, 'user@gmail.com'),
	('ZZCIIS402JXQ4', 'PQS_85780', 'Nike Air Force 1', 'Shoes', 2, 239.00, 'photo-1606107557195-0e29a4b5b4aa.jpg', 'The Nike Air Force 1 Low By You became an inst icon after its debut in 1982.', 478.00, 'vishnu@gmail.com', '2022-01-24 02:25:11', 'COD', 'Paid', 'Completed', '28 nehru nagar , 638003, TamilNadu, Erode, 0127183963', NULL, NULL, NULL, 'user@gmail.com');
/*!40000 ALTER TABLE `order_list` ENABLE KEYS */;

-- Dumping structure for table EcoBulkdb.product
CREATE TABLE IF NOT EXISTS `product` (
  `id` varchar(255) NOT NULL,
  `title` varchar(100) NOT NULL,
  `category` varchar(100) NOT NULL DEFAULT 'All Product',
  `quantity` int(10) NOT NULL,
  `price` double(10,2) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` varchar(600) NOT NULL,
  `status` varchar(100) DEFAULT 'Pending',
  `seller_id` varchar(255) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `shelf` varchar(10) DEFAULT 'on',
  `seller_username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table EcoBulkdb.product: ~12 rows (approximately)
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` (`id`, `title`, `category`, `quantity`, `price`, `image`, `description`, `status`, `seller_id`, `reason`, `shelf`, `seller_username`) VALUES
	('APG_74726', 'iPhone 12 64GB', 'Mobile & Gadget', 10, 3339.00, '8801-Product-Images-3000x2000-Violet-FrontL30-1024x683.jpg', 'The Apple iPhone 12 features a 6.1" display, 12 + 12MP back camera', 'approve', 'user@gmail.com', NULL, 'off', 'user'),
	('BRW_62523', 'Luka Doncic 77 Jersey', 'Clothes', 32, 259.00, 'luka-doncic-mavericks-icon-edition-2020-nba-swingman-jersey-ldJB9b.png', 'Dallas Mavericks Jersey', 'approve', 'user@gmail.com', NULL, 'on', 'user'),
	('BXE_25057', 'ds', 'Book', 12, 12.00, '58adf54ae612507e27bd3c38.png', 'dsfdfs', 'approve', 'sketch@gmail.com', NULL, 'off', 'sketch'),
	('EKO_50675', 'Russell Westbrook 0 Jersey', 'Clothes', 2, 123.00, '128-1284263_russell-westbrook-nba-adidas-youth-replica-alternate-okc.jpg', 'OKC Thunder Jersey', 'approve', 'user@gmail.com', NULL, 'on', 'user'),
	('EQJ_91046', 'Razer Phone 2017', 'Mobile & Gadget', 4, 3553.00, 'csm_4_zu_3_razer_phone_5efda88493.jpg', 'The Gaming Phone', 'approve', 'user@gmail.com', NULL, 'on', 'user'),
	('FSI_24419', 'Mamba Mentality How I Play', 'Book', 10, 129.00, '40230101._SX318_.jpg', 'Kobe Bryantâ€™s personal perspective of his life', 'approve', 'user@gmail.com', NULL, 'on', 'user'),
	('LQM_49638',3 'Kobe Bryant Jersey', 'Clothes', 24, 248.00, '29-290705_kobe-bryant-kobe-bryant-jersey.jpg', 'Los Angeles Lakers 24 Jersey', 'approve', 'user@gmail.com', NULL, 'on', 'user'),
	('PQS_85780', 'Nike Air Force 1', 'Shoes', 3, 239.00, 'photo-1606107557195-0e29a4b5b4aa.jpg', 'The Nike Air Force 1 Low By You became an inst icon after its debut in 1982.', 'approve', 'user@gmail.com', NULL, 'on', 'user'),
	('QPZ_64685', '11oz White Mug', 'Cup', 4, 3.00, 'istockphoto-5063812399-612x612.jpg', 'Drinkware Type : Mugs', 'approve', 'user@gmail.com', NULL, 'on', 'user'),
	('RDF_87364', 'Kyrie Mamba Mentality', 'Shoes', 3, 719.00, 'nike-kyrie-5-mamba-mentality-aq2456-102-2.jpg', 'Nikeâ€™s Mamba Day', 'approve', 'user@gmail.com', NULL, 'on', 'user'),
	('ROJ_81070', 'Nike Kobe 6 ', 'Shoes', 2, 1259.00, '1.jpg', 'The updated Kobe 6 Grinch arrives with a more responsive Zoom Air', 'approve', 'user@gmail.com', NULL, 'on', 'user'),
	('RPS_57363', 'watch', 'Cup', 12, 56.00, 'ML833_VW_34FR+watch-40-alum-spacegray-nc-nikese_VW_34FR_WF_CO.jpg', 'xiaomi watch1', 'approve', 'user@gmail.com', '', 'off', 'user'),
	('TBG_68202', 'earphone', 'water', 12, 12.00, '476-4762210_mi-anc-type-c-in-ear-earphones-mi.png', 'earphone1', 'Pending', 'user@gmail.com', '', 'off', 'user');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;

-- Dumping structure for table EcoBulkdb.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `Type` varchar(255) DEFAULT 'Customer',
  `address` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table EcoBulkdb.users: ~8 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `username`, `email`, `password`, `Type`, `address`, `zip`, `state`, `area`, `phone_number`) VALUES
	(1, 'owner', 'owner@owner.com', '72122ce96bfec66e2396d2e25225d70a', 'Owner', '-', '-', '-', '-', '-'),
	(2, 'admin', 'admin@admin.com', '21232f297a57a5a743894a0e4a801fc3', 'Admin', '-', '-', '-', '-', '-'),
	(65, 'user', 'user@gmail.com', '6ad14ba9986e3615423dfca256d04e3f', 'Customer', '28 nehru nagar User638',3 '638003', 'TamilNadu', 'Erode', '0116578943'),
	(66, 'vishnu', 'vishnu@gmail.com', 'd366e775160087870cdc4e87dbc30804', 'Customer', '28 nehru nagar ', '638003', 'TamilNadu', 'Erode', '0127183963'),
	(67, 'loki', 'loki@gmail.com', '872059ee9abf7170f74f41b33e41830d', 'Customer', '28 nehru nagar ', '638003', 'TamilNadu', 'Erode', '9361070035'),
	(68, 'sketch', 'sketch@gmail.com', '6676e7d0995ebd8db63868369a9358d14', 'Customer', '28 nehru nagar  ', '638003', 'TamilNadu', 'Erode', '9361070035'),
	(69, 'yuvan', 'yuvan@gmail.com', 'cf595a12573d068cf18f45c52234dc99', 'Customer', '4, Jalan 638',3 '638003', 'TamilNadu', 'Erode', '9361070035'),
	(70, 'sherif', 'sherif@gmail.com', '6057638c4396ecf7fd777ceb9e79ae285', 'Customer', '28 nehru nagar  ', '638003', 'TamilNadu', 'Erode', '9361070035'),
	(71, 'arun', 'arun@gmail.com', '91de0dbf8d643f808a087344c6f50c4b', 'Customer', '28 nehru nagar 638 T3aman Ungku Tun Aminah', '638003', 'TamilNadu', 'Erode', '9361070035');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
