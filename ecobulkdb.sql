-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 12, 2025 at 11:27 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecobulkdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `home_address` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`id`, `email`, `home_address`, `zip`, `state`, `area`, `phone_number`) VALUES
(1, 'user@gmail.com', '28 nehru nagar User638', '638003', 'TamilNadu', 'Erode', '9965422090'),
(2, 'vishnu@gmail.com', '28 nehru nagar ', '638003', 'TamilNadu', 'Erode', '965422090'),
(3, 'loki@gmail.com', '28 nehru nagar ', '638003', 'TamilNadu', 'Erode', '9361070035'),
(4, 'loki@gmail.com', '28 nehru nagar ', '638003', 'TamilNadu', 'Erode', '965422090'),
(5, 'sketch@gmail.com', '28 nehru nagar  ', '638003', 'TamilNadu', 'Erode', '9361070035'),
(6, 'sketch@gmail.com', '28 nehru nagar', '638003', 'TamilNadu', 'Erode', '9361070035'),
(7, 'yuvan@gmail.com', '28 nehru nagar', '638003', 'TamilNadu', 'Erode', '9361070035'),
(8, 'sherif@gmail.com', '28 nehru nagar  ', '638003', 'TamilNadu', 'Erode', '9361070035'),
(9, 'arun@gmail.com', '28 nehru nagar ', '638003', 'TamilNadu', 'Erode', '9361070035'),
(10, 'arun@gmail.com', '28 nehru nagar ', '638003', 'Tamilnadu', 'Erode', '965422090'),
(11, 'nandha@engg.org', 'vaikalmedu', '638052', 'Tamilnadu', 'Erode', '0123456789'),
(12, 'ngo@gmail.com', 'ngo colony', '638001', 'TAMIL NADU', 'Ngo colony', '9361070035'),
(13, 'gov@gmail.com', 'gov college', '638000', 'TAMIL NADU', 'gov college', '1234567890');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
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
  `seller_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT 'All Product'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(6, 'Vehicles'),
(7, 'Book'),
(8, 'Television'),
(9, 'Bag'),
(10, 'Electronics'),
(11, 'Computer'),
(12, 'Furniture'),
(13, 'lab Equipment');

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

CREATE TABLE `chats` (
  `chat_id` int(11) NOT NULL,
  `from_id` varchar(255) NOT NULL,
  `to_id` varchar(255) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `chats`
--

INSERT INTO `chats` (`chat_id`, `from_id`, `to_id`, `message`, `created_at`) VALUES
(1, 'loki@gmail.com', 'user@gmail.com', 'hi', '2022-01-24 02:48:51'),
(2, 'sketch@gmail.com', 'user@gmail.com', 'hi', '2022-01-24 10:43:06'),
(3, 'user@gmail.com', 'sketch@gmail.com', 'hi', '2022-01-24 10:51:57'),
(4, 'yuvan@gmail.com', 'user@gmail.com', 'hi may i ask for the price', '2022-01-24 12:52:24'),
(5, 'arun@gmail.com', 'user@gmail.com', 'hi', '0000-00-00 00:00:00'),
(6, 'user@gmail.com', 'arun@gmail.com', 'hi', '0000-00-00 00:00:00'),
(7, 'user@gmail.com', 'yuvan@gmail.com', 'what price\r\n', '2025-01-12 09:32:49');

-- --------------------------------------------------------

--
-- Table structure for table `conversations`
--

CREATE TABLE `conversations` (
  `conversation_id` int(11) NOT NULL,
  `user_1` varchar(255) NOT NULL,
  `user_2` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `conversations`
--

INSERT INTO `conversations` (`conversation_id`, `user_1`, `user_2`) VALUES
(1, 'loki@gmail.com', 'user@gmail.com'),
(2, 'sketch@gmail.com', 'user@gmail.com'),
(3, 'yuvan@gmail.com', 'user@gmail.com'),
(4, 'arun@gmail.com', 'user@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `order_list`
--

CREATE TABLE `order_list` (
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
  `time` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `payment_method` varchar(255) DEFAULT NULL,
  `payment_status` varchar(255) DEFAULT NULL,
  `order_status` varchar(255) DEFAULT NULL,
  `delivery_address` varchar(255) DEFAULT NULL,
  `zip` int(10) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `seller_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `order_list`
--

INSERT INTO `order_list` (`transaction_id`, `id`, `title`, `category`, `quantity`, `price`, `image`, `description`, `totalPrice`, `custemail`, `time`, `payment_method`, `payment_status`, `order_status`, `delivery_address`, `zip`, `state`, `area`, `seller_id`) VALUES
('6TSZOQP7NI6XP', 'BRW_62523', 'Luka Doncic 77 Jersey', 'Clothes', 2, 259.00, 'luka-doncic-mavericks-icon-edition-2020-nba-swingman-jersey-ldJB9b.png', 'Dallas Mavericks Jersey', 518.00, 'vishnu@gmail.com', '0000-00-00 00:00:00', 'COD', 'Paid', 'Completed', '28 nehru nagar , 638003, TamilNadu, Erode, 0127183963', NULL, NULL, NULL, 'user@gmail.com'),
('O4FXHMPN5GOHK', 'FSI_24419', 'Mamba Mentality How I Play', 'Book', 8, 129.00, '40230101._SX318_.jpg', 'Kobe Bryantâ€™s personal perspective of his life', 1032.00, 'loki@gmail.com', '2022-01-23 21:21:19', 'COD', 'Paid', 'Completed', 'nodasddas, 32445, sad, 12, 965422090', NULL, NULL, NULL, 'user@gmail.com'),
('RVDVDMHEH6ZEV', 'EKO_50675', 'Russell Westbrook 0 Jersey', 'Clothes', 2, 123.00, '128-1284263_russell-westbrook-nba-adidas-youth-replica-alternate-okc.jpg', 'OKC Thunder Jersey', 246.00, 'vishnu@gmail.com', '2022-01-23 20:53:00', 'COD', 'Paid', 'Completed', '28 nehru nagar , 638003, TamilNadu, Erode, 0127183963', NULL, NULL, NULL, 'user@gmail.com'),
('VDSHT0XIFQ2BL', 'EKO_50675', 'Russell Westbrook 0 Jersey', 'Clothes', 7, 123.00, '128-1284263_russell-westbrook-nba-adidas-youth-replica-alternate-okc.jpg', 'OKC Thunder Jersey', 861.00, 'yuvan@gmail.com', '2022-01-24 07:25:17', 'COD', 'Paid', 'Completed', '4, Jalan 638, 3638003, TamilNadu, Erode, 9361070035', NULL, NULL, NULL, 'user@gmail.com'),
('WOLQGSD2IS3ZV', 'EKO_50675', 'Russell Westbrook 0 Jersey', 'Clothes', 1, 123.00, '128-1284263_russell-westbrook-nba-adidas-youth-replica-alternate-okc.jpg', 'OKC Thunder Jersey', 123.00, 'arun@gmail.com', '0000-00-00 00:00:00', 'COD', 'Paid', 'Completed', '28 nehru nagar , 638003, KL, 12, 965422090', NULL, NULL, NULL, 'user@gmail.com'),
('ZZCIIS402JXQ4', 'PQS_85780', 'Nike Air Force 1', 'Shoes', 2, 239.00, 'photo-1606107557195-0e29a4b5b4aa.jpg', 'The Nike Air Force 1 Low By You became an inst icon after its debut in 1982.', 478.00, 'vishnu@gmail.com', '2022-01-23 20:55:11', 'COD', 'Paid', 'Completed', '28 nehru nagar , 638003, TamilNadu, Erode, 0127183963', NULL, NULL, NULL, 'user@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
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
  `seller_username` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `title`, `category`, `quantity`, `price`, `image`, `description`, `status`, `seller_id`, `reason`, `shelf`, `seller_username`) VALUES
('APG_74726', 'iPhone 12 64GB', 'Mobile & Gadget', 10, 3339.00, '8801-Product-Images-3000x2000-Violet-FrontL30-1024x683.jpg', 'The Apple iPhone 12 features a 6.1\" display, 12 + 12MP back camera', 'approve', 'user@gmail.com', NULL, 'off', 'user'),
('BRW_62523', 'Luka Doncic 77 Jersey', 'Clothes', 32, 259.00, 'luka-doncic-mavericks-icon-edition-2020-nba-swingman-jersey-ldJB9b.png', 'Dallas Mavericks Jersey', 'approve', 'user@gmail.com', NULL, 'off', 'user'),
('BXE_25057', 'ds', 'Book', 12, 12.00, '58adf54ae612507e27bd3c38.png', 'dsfdfs', 'approve', 'sketch@gmail.com', NULL, 'off', 'sketch'),
('DBM_17700', 'Computers', 'Computer', 125, 8000.00, 'computers.jpeg', 'Lab Used computers *Light Used*', 'approve', 'nandha@engg.org', NULL, 'on', 'Nandha Engineering college'),
('EKO_50675', 'Russell Westbrook 0 Jersey', 'Clothes', 2, 123.00, '128-1284263_russell-westbrook-nba-adidas-youth-replica-alternate-okc.jpg', 'OKC Thunder Jersey', 'approve', 'user@gmail.com', NULL, 'off', 'user'),
('EMI_26697', 'Desk', 'Furniture', 400, 6000.00, 'collegedesk.jpeg', 'Writing and sitting desk for sale', 'approve', 'gov@gmail.com', NULL, 'on', 'Government college'),
('EPF_36492', 'Lab Equipment', 'lab Equipment', 350, 800.00, 'labeq.jpeg', 'Basic chemistry lab equipment', 'approve', 'nandha@engg.org', NULL, 'on', 'Nandha Engineering college'),
('EQJ_91046', 'Razer Phone 2017', 'Mobile & Gadget', 4, 3553.00, 'csm_4_zu_3_razer_phone_5efda88493.jpg', 'The Gaming Phone', 'approve', 'user@gmail.com', NULL, 'off', 'user'),
('FCU_44610', 'Books', 'Book', 30, 250.00, 'ngobook.jpeg', 'Ngo used books at good condition', 'approve', 'ngo@gmail.com', NULL, 'on', 'Ngo'),
('FSI_24419', 'Mamba Mentality How I Play', 'Book', 10, 129.00, '40230101._SX318_.jpg', 'Kobe Bryantâ€™s personal perspective of his life', 'approve', 'user@gmail.com', NULL, 'off', 'user'),
('GWL_57180', 'office Table', 'Furniture', 40, 950.00, 'Metal Rectangular Used Office Tables.jpg', 'college used office table *Good As New*', 'approve', 'nandha@engg.org', NULL, 'on', 'Nandha Engineering college'),
('JQV_10725', 'Lab Equipment', 'lab Equipment', 500, 950.00, 'lab.jpeg', 'Chemical Lab Equipment', 'approve', 'nandha@engg.org', NULL, 'on', 'Nandha Engineering college'),
('JTK_87355', 'Office chair', 'Furniture', 50, 450.00, 'OfficeChairs.jpg', 'Office Chair', 'approve', 'nandha@engg.org', NULL, 'on', 'Nandha Engineering college'),
('LQM_49638', 'Kobe Bryant Jersey', 'Clothes', 24, 248.00, '29-290705_kobe-bryant-kobe-bryant-jersey.jpg', 'Los Angeles Lakers 24 Jersey', 'approve', 'user@gmail.com', NULL, 'off', 'user'),
('OIN_36391', 'Furnitures', 'Furniture', 10, 2500.00, 'Ngofur.jpeg', 'Ngo used furnitures', 'approve', 'ngo@gmail.com', NULL, 'on', 'Ngo'),
('PQS_85780', 'Nike Air Force 1', 'Shoes', 3, 239.00, 'photo-1606107557195-0e29a4b5b4aa.jpg', 'The Nike Air Force 1 Low By You became an inst icon after its debut in 1982.', 'approve', 'user@gmail.com', NULL, 'off', 'user'),
('PYG_29403', 'Bags', 'Bag', 35, 300.00, 'Ngop1.jpeg', 'Ngo made handbags', 'approve', 'ngo@gmail.com', NULL, 'on', 'Ngo'),
('QPZ_64685', 'Furniture', 'Cup', 50, 400.00, 'chair.jpg', 'Drinkware Type : Mugs', 'approve', 'user@gmail.com', NULL, 'off', 'user'),
('QYL_84759', 'College bus', 'Vehicles', 5, 20000.00, 'College Bus.jpg', 'College used bus at good condition', 'approve', 'gov@gmail.com', NULL, 'on', 'Government college'),
('RDF_87364', 'Kyrie Mamba Mentality', 'Shoes', 3, 719.00, 'nike-kyrie-5-mamba-mentality-aq2456-102-2.jpg', 'Nikeâ€™s Mamba Day', 'approve', 'user@gmail.com', NULL, 'off', 'user'),
('ROJ_81070', 'Nike Kobe 6 ', 'Shoes', 2, 1259.00, '1.jpg', 'The updated Kobe 6 Grinch arrives with a more responsive Zoom Air', 'approve', 'user@gmail.com', NULL, 'off', 'user'),
('RPS_57363', 'watch', 'Cup', 12, 56.00, 'ML833_VW_34FR+watch-40-alum-spacegray-nc-nikese_VW_34FR_WF_CO.jpg', 'Pre used watch', 'approve', 'user@gmail.com', '', 'off', 'user'),
('TBG_68202', 'earphone', 'water', 12, 12.00, '476-4762210_mi-anc-type-c-in-ear-earphones-mi.png', 'earphone1', 'approve', 'user@gmail.com', '', 'off', 'user'),
('UEK_69117', 'Library Shelf', 'Furniture', 20, 1600.00, 'Mild Steel Used Library Furniture.jpg', 'Book self for sale \r\nlight Used', 'approve', 'nandha@engg.org', NULL, 'on', 'Nandha Engineering college'),
('WUM_28405', 'Printers', 'Electronics', 45, 4000.00, 'Canon MAXIFY GX6070 AIO Multi Function Ink Tank Color Printer (Refurbished).jpg', 'Office used printers All are refurbished products', 'approve', 'nandha@engg.org', NULL, 'on', 'Nandha Engineering college'),
('ZMO_28504', 'Television(tv)', 'Television', 25, 5000.00, 'ngoTv.jpeg', 'Used and refurbished Tv in affordable price', 'approve', 'ngo@gmail.com', NULL, 'on', 'Ngo'),
('ZVL_27611', 'Computer Desk', 'Furniture', 80, 4000.00, 'Used Office Workstation.jpg', 'Computer Desk light used', 'approve', 'nandha@engg.org', NULL, 'on', 'Nandha Engineering college');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `Type` varchar(255) DEFAULT 'Customer',
  `address` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `Type`, `address`, `zip`, `state`, `area`, `phone_number`) VALUES
(1, 'owner', 'owner@owner.com', '72122ce96bfec66e2396d2e25225d70a', 'Owner', '-', '-', '-', '-', '-'),
(2, 'admin', 'admin@admin.com', '21232f297a57a5a743894a0e4a801fc3', 'Admin', '-', '-', '-', '-', '-'),
(65, 'user', 'user@gmail.com', '6ad14ba9986e3615423dfca256d04e3f', 'Customer', '28 nehru nagar ', '638003', 'TamilNadu', 'Erode', '0116578943'),
(66, 'vishnu', 'vishnu@gmail.com', 'd366e775160087870cdc4e87dbc30804', 'Customer', '28 nehru nagar ', '638003', 'TamilNadu', 'Erode', '0127183963'),
(67, 'loki', 'loki@gmail.com', '872059ee9abf7170f74f41b33e41830d', 'Customer', '28 nehru nagar ', '638003', 'TamilNadu', 'Erode', '9361070035'),
(68, 'sketch', 'sketch@gmail.com', '6676e7d0995ebd8db63868369a9358d14', 'Customer', '28 nehru nagar  ', '638003', 'TamilNadu', 'Erode', '9361070035'),
(69, 'yuvan', 'yuvan@gmail.com', 'cf595a12573d068cf18f45c52234dc99', 'Customer', '4, Jalan 638', '638003', 'TamilNadu', 'Erode', '9361070035'),
(70, 'sherif', 'sherif@gmail.com', '6057638c4396ecf7fd777ceb9e79ae285', 'Customer', '28 nehru nagar  ', '638003', 'TamilNadu', 'Erode', '9361070035'),
(71, 'arun', 'arun@gmail.com', '91de0dbf8d643f808a087344c6f50c4b', 'Customer', '28 nehru nagar', '638003', 'TamilNadu', 'Erode', '9361070035'),
(72, 'Nandha Engineering college', 'nandha@engg.org', 'f06e56288d406684d2c3f166628d4076', 'Customer', 'vaikalmedu', '638052', 'Tamilnadu', 'Erode', '0123456789'),
(73, 'Ngo', 'ngo@gmail.com', 'b15650b33e9d04c83a81d80d37e0a72b', 'Customer', 'ngo colony', '638001', 'TAMIL NADU', 'Ngo colony', '9361070035'),
(74, 'Government college', 'gov@gmail.com', '4677521d8d8abf314126901597a54599', 'Customer', 'gov college', '638000', 'TAMIL NADU', 'gov college', '1234567890');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`ikey`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`chat_id`);

--
-- Indexes for table `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`conversation_id`);

--
-- Indexes for table `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`transaction_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
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
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `chat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `conversations`
--
ALTER TABLE `conversations`
  MODIFY `conversation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
