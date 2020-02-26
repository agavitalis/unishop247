-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 26, 2020 at 08:03 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `unishop247`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `creationDate`, `updationDate`) VALUES
(1, 'admin', '8e548900034b37e049f824ef77fdeca6', '2017-01-24 16:21:18', '18-01-2019 05:32:19 PM');

-- --------------------------------------------------------

--
-- Table structure for table `bonus`
--

CREATE TABLE `bonus` (
  `id` int(11) NOT NULL,
  `percent` varchar(20) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `creationDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `updationDate` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bonus`
--

INSERT INTO `bonus` (`id`, `percent`, `active`, `creationDate`, `updationDate`) VALUES
(1, '60', 0, NULL, NULL),
(3, '70', 1, '2020-02-26 15:21:39', '2020-02-26 15:21:39');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `categoryName` varchar(255) DEFAULT NULL,
  `categoryDescription` longtext,
  `creationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `categoryName`, `categoryDescription`, `creationDate`, `updationDate`) VALUES
(7, 'ESUT_Enugu', 'Enugu State University of Science and Technology Enugu', '2019-01-18 12:05:36', '20-01-2019 02:28:59 PM'),
(8, 'UNIJOS_Jos', 'University of Jos, Jos', '2019-01-18 12:05:49', '20-01-2019 02:31:06 PM'),
(9, 'UNN_Nsukka', 'University of Nigeria Nsukka', '2019-01-18 12:06:17', '20-01-2019 02:31:53 PM'),
(10, 'Unizik_Awka', 'Nnamdi Azikiwe University Awka Anambra State', '2019-01-20 08:57:52', NULL),
(11, 'UNEC_Enugu', 'University of Nigeria Enugu Campus ', '2019-01-20 09:04:14', '20-01-2019 11:05:04 PM'),
(12, 'ESUT_Agbani', 'Enugu State University of Technology Agbani', '2019-01-20 09:05:15', NULL),
(13, 'IMT_Enugu', 'Institution of Management and Technology Enugu', '2019-01-20 09:06:41', NULL),
(14, 'ASUTECH_Awka', 'Anambra State University of Science and Technology Igbariam, Awka', '2019-01-20 09:08:13', NULL),
(15, 'ABSU_Ebonyi', 'Ebonyi State University Ebonyi', '2019-01-20 09:09:31', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `orderDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `paymentMethod` varchar(50) DEFAULT NULL,
  `orderStatus` varchar(55) DEFAULT NULL,
  `orderCode` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `userId`, `productId`, `quantity`, `orderDate`, `paymentMethod`, `orderStatus`, `orderCode`) VALUES
(27, 6, '24', 1, '2019-01-18 18:20:00', 'Pay on Delivery', NULL, 't'),
(28, 6, '28', 1, '2019-01-18 18:20:00', 'Pay on Delivery', 'Delivered', NULL),
(37, 23, '23', 1, '2020-02-26 14:43:43', 'Pay on Delivery', NULL, NULL),
(38, 23, '24', 1, '2020-02-26 14:43:43', 'Pay on Delivery', NULL, NULL),
(39, 23, '27', 1, '2020-02-26 14:43:43', 'Pay on Delivery', NULL, NULL),
(40, 23, '23', 1, '2020-02-26 14:43:59', 'Pay on Delivery', NULL, NULL),
(41, 23, '24', 1, '2020-02-26 14:43:59', 'Pay on Delivery', NULL, NULL),
(42, 23, '27', 1, '2020-02-26 14:43:59', 'Pay on Delivery', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ordertrackhistory`
--

CREATE TABLE `ordertrackhistory` (
  `id` int(11) NOT NULL,
  `orderId` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `remark` mediumtext,
  `postingDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ordertrackhistory`
--

INSERT INTO `ordertrackhistory` (`id`, `orderId`, `status`, `remark`, `postingDate`) VALUES
(1, 28, 'Delivered', 'Delivered', '2020-02-26 14:24:08'),
(2, 29, 'in Process', 'jjjj', '2020-02-26 14:27:38');

-- --------------------------------------------------------

--
-- Table structure for table `productreviews`
--

CREATE TABLE `productreviews` (
  `id` int(11) NOT NULL,
  `productId` int(11) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `review` longtext,
  `reviewDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `productreviews`
--

INSERT INTO `productreviews` (`id`, `productId`, `quality`, `price`, `value`, `name`, `summary`, `review`, `reviewDate`) VALUES
(1, 24, 1, 3, 0, 'hgh', 'hhh', 'hjjjjj', '2020-02-26 14:34:03');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `subCategory` int(11) DEFAULT NULL,
  `productName` varchar(255) DEFAULT NULL,
  `productCompany` varchar(255) DEFAULT NULL,
  `productPrice` int(11) DEFAULT NULL,
  `productPriceBeforeDiscount` int(11) DEFAULT NULL,
  `productDescription` longtext,
  `productImage1` varchar(255) DEFAULT NULL,
  `productImage2` varchar(255) DEFAULT NULL,
  `productImage3` varchar(255) DEFAULT NULL,
  `shippingCharge` int(11) DEFAULT NULL,
  `productAvailability` varchar(255) DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category`, `subCategory`, `productName`, `productCompany`, `productPrice`, `productPriceBeforeDiscount`, `productDescription`, `productImage1`, `productImage2`, `productImage3`, `shippingCharge`, `productAvailability`, `postingDate`, `updationDate`) VALUES
(22, 8, 23, 'Vans Shoe', 'Vans', 10000, 139900, 'Yellow big shoes.', 'as7.jpg', 'ass5.jpg', 'as7.jpg', 0, 'In Stock', '2019-01-18 12:29:39', NULL),
(23, 9, 27, 'Black Sneakers', 'Dior', 10000, 139900, 'Black and cool sneakers', 'as2.jpg', 'as3.jpg', 'as1.jpg', 0, 'In Stock', '2019-01-18 12:38:48', NULL),
(24, 7, 13, 'A Big gown for big women', 'Gucci', 3000, 50000, 'big cloth', 'ass1.jpg', 'ass4.jpg', 'ass6.jpg', 0, 'In Stock', '2019-01-18 12:42:47', NULL),
(25, 9, 25, 'Another Cloth', 'Versace', 10000, 139900, 'Very nice cloth', 'as4.jpg', 'as5.jpg', 'ass6.jpg', 0, 'In Stock', '2019-01-18 12:47:50', NULL),
(26, 8, 23, 'Serious Shoe', 'Italian Shoe', 45000, 50000, 'A brown senior man shoe', 'ass2.jpg', 'ass3.jpg', 'ass2.jpg', 0, 'In Stock', '2019-01-18 13:02:11', NULL),
(27, 7, 14, 'Balenciaga', 'Balenciaga', 3000, 50000, 'Soft Ash color Balenciaga', 'ass5.jpg', 'ass2.jpg', 'ass5.jpg', 0, 'In Stock', '2019-01-18 13:07:16', NULL),
(28, 9, 26, 'Bootu', 'Dior', 80987, 159070, 'boot', 'ass7.jpg', 'ass6.jpg', 'ass7.jpg', 0, 'In Stock', '2019-01-18 13:11:34', NULL),
(29, 8, 21, 'Hand bag', 'Gucci', 32457, 89765, 'black bag', 'ass10.jpg', 'ass9.jpg', 'ass9.jpg', 0, 'In Stock', '2019-01-18 13:16:21', NULL),
(30, 9, 29, 'Balenciaga', 'Versace', 3456, 76543, 'correct shoe', 'as8.jpg', 'as1.jpg', 'as9.jpg', 0, 'In Stock', '2019-01-18 13:19:05', NULL),
(31, 7, 13, 'Another Cloth', 'Versace', 45000, 159070, 'good cloth', 'ass6.jpg', 'as6.jpg', 'as4.jpg', 0, 'In Stock', '2019-01-18 13:36:50', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

CREATE TABLE `subcategory` (
  `id` int(11) NOT NULL,
  `categoryid` int(11) DEFAULT NULL,
  `subcategory` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subcategory`
--

INSERT INTO `subcategory` (`id`, `categoryid`, `subcategory`, `creationDate`, `updationDate`) VALUES
(13, 7, 'Women Clothing', '2019-01-18 12:16:49', NULL),
(14, 7, 'Women Shoes', '2019-01-18 12:17:09', NULL),
(15, 7, 'Women Accessories', '2019-01-18 12:17:33', NULL),
(16, 7, 'Men Clothing', '2019-01-18 12:17:57', NULL),
(17, 7, 'Men Shoes', '2019-01-18 12:18:12', NULL),
(18, 7, 'Men Accessories', '2019-01-18 12:18:26', NULL),
(19, 8, 'Women Clothing', '2019-01-18 12:18:47', NULL),
(20, 8, 'Women Shoes', '2019-01-18 12:18:55', NULL),
(21, 8, 'Women Accessories', '2019-01-18 12:19:02', NULL),
(22, 8, 'Men Clothing', '2019-01-18 12:19:09', NULL),
(23, 8, 'Men Shoes', '2019-01-18 12:19:29', NULL),
(24, 8, 'Men Accessories', '2019-01-18 12:19:39', NULL),
(25, 9, 'Women Clothing', '2019-01-18 12:19:49', NULL),
(26, 9, 'Women Shoes', '2019-01-18 12:19:58', NULL),
(27, 9, 'Women Accessories', '2019-01-18 12:20:07', NULL),
(28, 9, 'Men Clothing', '2019-01-18 12:20:14', NULL),
(29, 9, 'Men Shoes', '2019-01-18 12:20:43', NULL),
(30, 9, 'Men Accessories', '2019-01-18 12:20:57', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `userEmail` varchar(255) DEFAULT NULL,
  `userip` binary(16) DEFAULT NULL,
  `loginTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `logout` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `userEmail`, `userip`, `loginTime`, `logout`, `status`) VALUES
(28, 'malif@gmail.com', 0x3a3a3100000000000000000000000000, '2019-01-18 18:19:12', NULL, 1),
(29, 'malifox@gmail.com', 0x3139372e3231302e3232362e34370000, '2019-01-18 22:15:00', NULL, 1),
(30, 'johncrossozioko@gmail.com', 0x3139372e3231302e34362e3332000000, '2019-01-18 23:32:05', '19-01-2019 05:09:18 AM', 1),
(31, 'roseeze567@gmail.com', 0x3130352e3131322e39362e3132330000, '2019-02-04 13:50:06', NULL, 1),
(32, 'Adminxddg@c', 0x3130352e3131322e39362e3132330000, '2019-02-04 14:33:49', NULL, 0),
(33, 'malifox@gmail.com', 0x3130352e3131322e39362e3132330000, '2019-02-04 14:34:06', '04-02-2019 08:04:14 PM', 1),
(34, 'malifoex@gmail.com', 0x3130352e3131322e39362e3132330000, '2019-02-04 14:34:31', NULL, 0),
(35, 'malifox@gmail.com', 0x3130352e3131322e39392e3531000000, '2019-02-04 15:11:56', '04-02-2019 08:43:26 PM', 1),
(36, 'malifox@gmail.com', 0x3130352e3131322e39392e3531000000, '2019-02-04 15:13:39', NULL, 0),
(37, 'malifox@gmail.com', 0x3130352e3131322e39392e3531000000, '2019-02-04 15:27:42', NULL, 0),
(38, 'madfclifox@gmail.com', 0x3130352e3131322e39392e3531000000, '2019-02-04 15:28:05', NULL, 0),
(39, 'malifgvvox@gmail.com', 0x3130352e3131322e39392e3531000000, '2019-02-04 15:28:42', NULL, 0),
(40, 'malifox@gmail.com', 0x3130352e3131322e33322e3500000000, '2019-06-03 12:10:05', NULL, 0),
(41, 'aze@gmail.com', 0x37372e3233342e34342e313431000000, '2019-06-20 19:20:59', NULL, 1),
(42, 'arofex707@gmail.com', 0x3130352e3131322e3131342e31363600, '2019-11-10 21:39:18', NULL, 1),
(43, 'unishop247@gmail.com', 0x3139372e3231302e38352e3131310000, '2020-02-14 15:30:06', NULL, 0),
(44, 'unishop247@gmail.com', 0x3139372e3231302e38352e3131310000, '2020-02-14 15:30:30', NULL, 0),
(45, 'unishop247@gmail.com', 0x3139372e3231302e38342e3532000000, '2020-02-16 21:34:18', NULL, 0),
(46, 'unishop247.@gmail.com', 0x3139372e3231302e332e313731000000, '2020-02-17 11:13:45', NULL, 0),
(47, 'johncrossozioko@gmail.com', 0x3139372e3231302e332e313731000000, '2020-02-17 11:15:08', '17-02-2020 04:45:17 PM', 1),
(48, 'kingsleyozioko@gmail.com', 0x3139372e3231302e332e313731000000, '2020-02-17 11:16:43', '17-02-2020 04:47:40 PM', 1),
(49, 'agavitalisogbonna@gmail.com', 0x3a3a3100000000000000000000000000, '2020-02-19 16:55:10', NULL, 0),
(50, 'agavitalisogbonna@gmail.com', 0x3a3a3100000000000000000000000000, '2020-02-19 16:56:36', NULL, 1),
(51, '', 0x3a3a3100000000000000000000000000, '2020-02-22 13:09:35', NULL, 1),
(52, '', 0x3a3a3100000000000000000000000000, '2020-02-22 13:10:42', NULL, 1),
(53, '', 0x3a3a3100000000000000000000000000, '2020-02-22 13:13:03', NULL, 1),
(54, 'agavita@gmail.com', 0x3a3a3100000000000000000000000000, '2020-02-22 13:13:26', NULL, 0),
(55, '', 0x3a3a3100000000000000000000000000, '2020-02-22 13:15:24', NULL, 1),
(56, 'vitalis@gmail.com', 0x3a3a3100000000000000000000000000, '2020-02-22 13:15:51', '22-02-2020 06:47:43 PM', 1),
(57, 'kkhk@gmail.com', 0x3a3a3100000000000000000000000000, '2020-02-22 13:18:08', '22-02-2020 06:53:26 PM', 1),
(58, 'djbdb@gg.kk', 0x3a3a3100000000000000000000000000, '2020-02-22 13:24:14', '22-02-2020 08:13:35 PM', 1),
(59, 'vitalis@gmail.com', 0x3a3a3100000000000000000000000000, '2020-02-22 14:44:57', NULL, 0),
(60, 'fjjfk@gmail.com', 0x3a3a3100000000000000000000000000, '2020-02-22 14:45:19', '26-02-2020 07:16:00 PM', 1),
(61, 'vivvaa.vivvaa@gmail.com', 0x3a3a3100000000000000000000000000, '2020-02-26 13:47:12', '26-02-2020 08:09:27 PM', 1),
(62, 'ccc@gmail.com', 0x3a3a3100000000000000000000000000, '2020-02-26 14:40:10', '26-02-2020 09:25:38 PM', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contactno` bigint(11) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `shippingAddress` longtext,
  `shippingState` varchar(255) DEFAULT NULL,
  `shippingCity` varchar(255) DEFAULT NULL,
  `shippingPincode` int(11) DEFAULT NULL,
  `billingAddress` longtext,
  `billingState` varchar(255) DEFAULT NULL,
  `billingCity` varchar(255) DEFAULT NULL,
  `billingPincode` varchar(100) DEFAULT NULL,
  `regDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` varchar(255) DEFAULT NULL,
  `referral` varchar(100) DEFAULT NULL,
  `referralBonus` varchar(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `contactno`, `password`, `shippingAddress`, `shippingState`, `shippingCity`, `shippingPincode`, `billingAddress`, `billingState`, `billingCity`, `billingPincode`, `regDate`, `updationDate`, `referral`, `referralBonus`) VALUES
(6, 'Sandra Zima', 'malif@gmail.com', 8036761487, 'd8578edf8458ce06fbc5bb76a58c5ca4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-18 18:18:45', NULL, NULL, '0'),
(7, 'Malif Mezie', 'malifox@gmail.com', 8036761487, '9982b2a7fceaaee2c8444b5086aee008', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-18 22:14:21', NULL, NULL, '0'),
(8, 'Ozioko Kingsley', 'johncrossozioko@gmail.com', 8066384305, 'b29452c1e97f820eb3cbbcca23a7a5ad', NULL, NULL, NULL, NULL, 'Holy redeemer Nru', 'Enugu', 'Nsukka', 'Nru parish', '2019-01-18 23:31:13', NULL, NULL, '0'),
(9, 'Rosemary  Eze', 'roseeze567@gmail.com', 7035984458, 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-02-04 13:49:01', NULL, NULL, '0'),
(10, 'aze', 'aze@gmail.com', 12, 'd24fd3ec8518e6e43edab9f07dbb7182', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-06-20 19:20:51', NULL, NULL, '0'),
(11, 'Ariogba Arinze Felix', 'arofex707@gmail.com', 9075126414, '622e7ed521fef9bb730dbbc223bf0385', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-10 21:38:53', NULL, NULL, '0'),
(12, 'kingsley ozioko', 'kingsleyozioko@gmail.com', 8032000302, 'b29452c1e97f820eb3cbbcca23a7a5ad', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-02-17 11:16:14', NULL, NULL, '0'),
(13, 'Ogbonna Vitalis', 'agavitalisogbonna@gmail.com', 8163922749, 'a1d3b86cf1a498d80a8e9154922511bc', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-02-19 16:55:59', NULL, NULL, '0'),
(14, 'Ogbonna', 'agavitalis@gmail.com', 8124568938, 'e807f1fcf82d132f9bb018ca6738a19f', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-02-22 13:03:27', NULL, 'Vitalis', '0'),
(15, 'Another One', 'another@rmail.com', 5555, 'e807f1fcf82d132f9bb018ca6738a19f', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-02-22 13:09:35', NULL, 'Vitalis', '0'),
(16, 'jjgjjg', 'jkjhjd@gmail.com', 0, 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-02-22 13:10:42', NULL, 'jcjbc', '0'),
(17, 'Vitalis', 'vita@gmail.com', 8053563, '827ccb0eea8a706c4c34a16891f84e7b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-02-22 13:13:03', NULL, 'agavita', '0'),
(18, 'Ogbonna', 'vitalis@gmail.com', 8032647672, '5a52869e84e403ba1cd4ec3eeb64653c', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-02-22 13:15:24', NULL, '', '0'),
(19, 'jhjhck', 'kkhk@gmail.com', 33, '310dcbbf4cce62f762a2aaa148d556bd', NULL, NULL, NULL, NULL, 'No 20B Aria Road Enugu', 'Enugu State', 'Nsukka', 'Aria Road', '2020-02-22 13:18:08', NULL, '', '0'),
(20, 'jhbj', 'djbdb@gg.kk', 0, '827ccb0eea8a706c4c34a16891f84e7b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-02-22 13:24:14', NULL, '', '0'),
(21, 'nmnmf', 'fjjfk@gmail.com', 454, '79b7cdcd14db14e9cb498f1793817d69', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-02-22 14:45:19', NULL, '', '0'),
(22, 'Ogbonna Vitalis', 'vivvaa.vivvaa@gmail.com', 8163922749, '8e548900034b37e049f824ef77fdeca6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-02-26 13:47:12', NULL, '', '0'),
(23, 'Ogbo', 'ccc@gmail.com', 234, '827ccb0eea8a706c4c34a16891f84e7b', NULL, NULL, NULL, NULL, 'Enugu State Nigeria', 'Enugu', 'Enugu', 'Enugu', '2020-02-26 14:40:10', NULL, 'agavitalisogbonna@gmail.com', '0');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `userId`, `productId`, `postingDate`) VALUES
(5, 6, 24, '2019-01-18 18:26:38'),
(6, 6, 28, '2019-01-18 18:27:02'),
(7, 6, 29, '2019-01-18 18:27:17'),
(8, 6, 28, '2019-01-18 18:27:28');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bonus`
--
ALTER TABLE `bonus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `productreviews`
--
ALTER TABLE `productreviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bonus`
--
ALTER TABLE `bonus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `productreviews`
--
ALTER TABLE `productreviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
