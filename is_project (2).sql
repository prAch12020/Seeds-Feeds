-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 16, 2022 at 09:26 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `is_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_farmers`
--

CREATE TABLE IF NOT EXISTS `tbl_farmers` (
  `farmer_id` int(10) NOT NULL,
  `farmer_name` varchar(100) NOT NULL,
  `farmer_email` varchar(100) NOT NULL,
  `farmer_phone` varchar(100) NOT NULL,
  `farmer_password` varchar(100) NOT NULL,
  `farmer_address` varchar(100) DEFAULT NULL,
  `farmer_city` varchar(100) DEFAULT NULL,
  `farmer_country` varchar(100) DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_farmers`
--

INSERT INTO `tbl_farmers` (`farmer_id`, `farmer_name`, `farmer_email`, `farmer_phone`, `farmer_password`, `farmer_address`, `farmer_city`, `farmer_country`, `latitude`, `longitude`) VALUES
(1, 'Prachi Jayeshkumar Patel', 'prachi.p@yahoo.com', '0723456798', '$2y$10$ovVSB9IZeewZjYN8w0IoqOfT4j/gF1kJJHTzYdc.fqyvaPi8spHi.', NULL, NULL, NULL, NULL, NULL),
(2, 'Chandler Bing', 'chan@yahoo.com', '0722867426', '$2y$10$5poTO/9Wy53DM6p9xHaXmO5LG1louVXsvObhc9mQzIloJvlU7j.ma', NULL, NULL, NULL, NULL, NULL),
(3, 'Monica Geller', 'monica@outlook.com', '0713967483', '$2y$10$xmEpnAfJOUCVpevz6/.jbeZrBhkOh1Txq4GZKBF7DtA6CqmcdKvYm', NULL, NULL, NULL, NULL, NULL),
(4, 'Prachi Patel', 'prachi.pjp@outlook.com', '0734590812', '$2y$10$BoyS5Kg/VurtJeCNFlhe.eDfoB0G3TJc5hxvWckQ9zPt8lSSdPVLu', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_farminput`
--

CREATE TABLE IF NOT EXISTS `tbl_farminput` (
  `farminput_id` int(10) NOT NULL,
  `farmer_id` int(10) NOT NULL,
  `input_id` int(10) NOT NULL,
  `quantity` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_farmproduce`
--

CREATE TABLE IF NOT EXISTS `tbl_farmproduce` (
  `produce_id` int(10) NOT NULL,
  `farmer_id` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `desc` varchar(500) NOT NULL,
  `produce_stock` varchar(100) NOT NULL,
  `unit` varchar(100) NOT NULL,
  `price` int(10) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_farmproduce`
--

INSERT INTO `tbl_farmproduce` (`produce_id`, `farmer_id`, `name`, `desc`, `produce_stock`, `unit`, `price`, `image`) VALUES
(1, 3, 'Tea ', 'Freshly harvested tea leaves', '50', 'Kg', 1000, 'tea.jpg'),
(2, 2, 'Milk', 'Full cream ', '50', 'litre', 70, 'milk.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_inputorderdetails`
--

CREATE TABLE IF NOT EXISTS `tbl_inputorderdetails` (
  `inputorderdetails_id` int(10) NOT NULL,
  `inputorder_id` int(10) NOT NULL,
  `input_id` int(10) NOT NULL,
  `quantity` varchar(100) NOT NULL,
  `total` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_inputorderdetails`
--

INSERT INTO `tbl_inputorderdetails` (`inputorderdetails_id`, `inputorder_id`, `input_id`, `quantity`, `total`) VALUES
(14, 6, 2, '2', '2000'),
(15, 6, 1, '1', '700000'),
(16, 6, 3, '10', '450');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_inputorders`
--

CREATE TABLE IF NOT EXISTS `tbl_inputorders` (
  `inputorder_id` int(10) NOT NULL,
  `farmer_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `amount` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `payment_detail` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_inputorders`
--

INSERT INTO `tbl_inputorders` (`inputorder_id`, `farmer_id`, `user_id`, `amount`, `status`, `payment_detail`) VALUES
(6, 2, 4, '702450', 'Processing', 14);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_inputs`
--

CREATE TABLE IF NOT EXISTS `tbl_inputs` (
  `input_id` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `user_id` int(10) NOT NULL,
  `desc` varchar(500) NOT NULL,
  `unit` varchar(500) NOT NULL,
  `price` varchar(100) NOT NULL,
  `image` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_inputs`
--

INSERT INTO `tbl_inputs` (`input_id`, `name`, `user_id`, `desc`, `unit`, `price`, `image`) VALUES
(1, 'Tractor', 1, 'Honda', 'Piece(s)', '700000', 'tractor.jpg'),
(2, 'Hay', 4, 'Premium Quality', 'Bale', '1000', 'hay.jpg'),
(3, 'Spinach Seeds', 5, 'Simlaw', 'Packet', '45', '5e9f56422457d.webp');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_orderdetails`
--

CREATE TABLE IF NOT EXISTS `tbl_orderdetails` (
  `orderdetail_id` int(10) NOT NULL,
  `order_id` int(10) NOT NULL,
  `produce_id` int(10) NOT NULL,
  `quantity` varchar(100) NOT NULL,
  `total` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_orderdetails`
--

INSERT INTO `tbl_orderdetails` (`orderdetail_id`, `order_id`, `produce_id`, `quantity`, `total`) VALUES
(3, 6, 2, '3', '210');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_orders`
--

CREATE TABLE IF NOT EXISTS `tbl_orders` (
  `order_id` int(10) NOT NULL,
  `farmer_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `amount` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `payment_detail` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_orders`
--

INSERT INTO `tbl_orders` (`order_id`, `farmer_id`, `user_id`, `amount`, `status`, `payment_detail`) VALUES
(3, 2, 2, '210', 'Processing', 15);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_paymentdetails`
--

CREATE TABLE IF NOT EXISTS `tbl_paymentdetails` (
  `paymentdetail_id` int(10) NOT NULL,
  `shippingdetail_id` int(10) NOT NULL,
  `inputorder_id` int(10) DEFAULT NULL,
  `order_id` int(10) DEFAULT NULL,
  `paymentdetails` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_paymentdetails`
--

INSERT INTO `tbl_paymentdetails` (`paymentdetail_id`, `shippingdetail_id`, `inputorder_id`, `order_id`, `paymentdetails`) VALUES
(14, 18, 18, NULL, 'PE234789'),
(15, 19, NULL, 3, 'PQ799467');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_requests`
--

CREATE TABLE IF NOT EXISTS `tbl_requests` (
  `request_id` int(10) NOT NULL,
  `farmer_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `message` varchar(100) NOT NULL,
  `visit` varchar(100) NOT NULL,
  `visit_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_requests`
--

INSERT INTO `tbl_requests` (`request_id`, `farmer_id`, `user_id`, `message`, `visit`, `visit_date`) VALUES
(1, 3, 3, 'My cow is pregnant', 'Visited', '2022-07-21'),
(2, 3, 3, 'My dog is sick', 'Pending', '2022-07-29');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_roles`
--

CREATE TABLE IF NOT EXISTS `tbl_roles` (
  `role_id` int(10) NOT NULL,
  `role_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_roles`
--

INSERT INTO `tbl_roles` (`role_id`, `role_name`) VALUES
(1, 'Inputs Seller'),
(2, 'Produce Buyer'),
(3, 'Veterinarian');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_shippingdetails`
--

CREATE TABLE IF NOT EXISTS `tbl_shippingdetails` (
  `shippingdetail_id` int(10) NOT NULL,
  `inputorder_id` int(10) DEFAULT NULL,
  `order_id` int(10) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `street` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_shippingdetails`
--

INSERT INTO `tbl_shippingdetails` (`shippingdetail_id`, `inputorder_id`, `order_id`, `name`, `phone`, `email`, `street`, `city`, `country`) VALUES
(18, 6, NULL, 'Chandler Bing', '0745689238', 'chan@yahoo.com', 'Kodi Rd Estate, Gandhi Avenue, Nairobi West', 'Nairobi', 'Kenya'),
(19, NULL, 3, 'Prachi Jayeshkumar Patel', '0797039969', 'prachi.p@yahoo.com', 'Apartment 20, Street 1', 'Washington DC', 'USA');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE IF NOT EXISTS `tbl_users` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `role_id` int(10) NOT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`user_id`, `first_name`, `last_name`, `email`, `phone`, `password`, `address`, `city`, `country`, `role_id`, `latitude`, `longitude`) VALUES
(1, 'Rachel', 'Greene', 'rach@gmail.com', '729475583', '$2y$10$1mAvkwWnb5LYC4Wa9BBq5.VeUKBzoxpCQYD9GoKKWo61CzR42n/Jy', NULL, NULL, NULL, 1, NULL, NULL),
(2, 'Ross ', 'Geller', 'ross@yahoo.com', '743567890', '$2y$10$y3B5ZG8kYR5j5sNS3MaHu.qj3Hyn3X0tvdt0bVmJ0LxDynC7a6/g.', NULL, NULL, NULL, 2, NULL, NULL),
(3, 'Phoebe', 'Buffay', 'pheebs@yahoo.com', '743291854', '$2y$10$vSJWYl0GD3lkrOJtP/5wyeGihPgDUtNDntcrgnTmiZTYssXr5Gav2', NULL, NULL, NULL, 3, NULL, NULL),
(4, 'Joey', 'Tribbian', 'joey@yahoo.com', '745389645', '$2y$10$Rab/bTFS9eAW10K8s.DZHusawQ1X2ZeUN6YGUGFpKN/8t2f/6zxKa', NULL, NULL, NULL, 1, NULL, NULL),
(5, 'Vruddhi', 'Prajapati', 'vruddh@yahoo.com', '732456789', '$2y$10$0K.0hZ9WApryppWTNGpJDuA8GvQzOBV/KbPV9X.CfPpHv3LTuCdX6', NULL, NULL, NULL, 1, NULL, NULL),
(6, 'Prachi', 'Patel', 'prachi.pjp@gmail.com', '100829680', '$2y$10$u42jmmX/IlaNXKZ1PCtzCOwZjBrp4EEopznJ69lReUYsZPaYz11FC', NULL, NULL, NULL, 1, NULL, NULL),
(7, 'hvfhgfv', 'hvgfhj', 'prachijpatel@outlook.com', '712378564', '$2y$10$4YCaLheWe.idje5o1CQH/OHQYmhoIJZ1h4UxJVQYMmZKtToHd1TpK', NULL, NULL, NULL, 3, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_farmers`
--
ALTER TABLE `tbl_farmers`
  ADD PRIMARY KEY (`farmer_id`);

--
-- Indexes for table `tbl_farminput`
--
ALTER TABLE `tbl_farminput`
  ADD PRIMARY KEY (`farminput_id`),
  ADD KEY `farmer_id` (`farmer_id`),
  ADD KEY `input_id` (`input_id`);

--
-- Indexes for table `tbl_farmproduce`
--
ALTER TABLE `tbl_farmproduce`
  ADD PRIMARY KEY (`produce_id`),
  ADD KEY `farmer_id` (`farmer_id`);

--
-- Indexes for table `tbl_inputorderdetails`
--
ALTER TABLE `tbl_inputorderdetails`
  ADD PRIMARY KEY (`inputorderdetails_id`),
  ADD KEY `input_id` (`input_id`),
  ADD KEY `inputorder_id` (`inputorder_id`);

--
-- Indexes for table `tbl_inputorders`
--
ALTER TABLE `tbl_inputorders`
  ADD PRIMARY KEY (`inputorder_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `farmer_id` (`farmer_id`),
  ADD KEY `payment_detail` (`payment_detail`);

--
-- Indexes for table `tbl_inputs`
--
ALTER TABLE `tbl_inputs`
  ADD PRIMARY KEY (`input_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tbl_orderdetails`
--
ALTER TABLE `tbl_orderdetails`
  ADD PRIMARY KEY (`orderdetail_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `produce_id` (`produce_id`);

--
-- Indexes for table `tbl_orders`
--
ALTER TABLE `tbl_orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `farmer_id` (`farmer_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `payment_detail` (`payment_detail`);

--
-- Indexes for table `tbl_paymentdetails`
--
ALTER TABLE `tbl_paymentdetails`
  ADD PRIMARY KEY (`paymentdetail_id`),
  ADD KEY `shippingdetail_id` (`shippingdetail_id`);

--
-- Indexes for table `tbl_requests`
--
ALTER TABLE `tbl_requests`
  ADD PRIMARY KEY (`request_id`),
  ADD KEY `farmer_id` (`farmer_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tbl_roles`
--
ALTER TABLE `tbl_roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `tbl_shippingdetails`
--
ALTER TABLE `tbl_shippingdetails`
  ADD PRIMARY KEY (`shippingdetail_id`),
  ADD KEY `inputorder_id` (`inputorder_id`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_farmers`
--
ALTER TABLE `tbl_farmers`
  MODIFY `farmer_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_farminput`
--
ALTER TABLE `tbl_farminput`
  MODIFY `farminput_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_farmproduce`
--
ALTER TABLE `tbl_farmproduce`
  MODIFY `produce_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_inputorderdetails`
--
ALTER TABLE `tbl_inputorderdetails`
  MODIFY `inputorderdetails_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tbl_inputorders`
--
ALTER TABLE `tbl_inputorders`
  MODIFY `inputorder_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_inputs`
--
ALTER TABLE `tbl_inputs`
  MODIFY `input_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_orderdetails`
--
ALTER TABLE `tbl_orderdetails`
  MODIFY `orderdetail_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_orders`
--
ALTER TABLE `tbl_orders`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_paymentdetails`
--
ALTER TABLE `tbl_paymentdetails`
  MODIFY `paymentdetail_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tbl_requests`
--
ALTER TABLE `tbl_requests`
  MODIFY `request_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_roles`
--
ALTER TABLE `tbl_roles`
  MODIFY `role_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_shippingdetails`
--
ALTER TABLE `tbl_shippingdetails`
  MODIFY `shippingdetail_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_farminput`
--
ALTER TABLE `tbl_farminput`
  ADD CONSTRAINT `tbl_farminput_ibfk_1` FOREIGN KEY (`farmer_id`) REFERENCES `tbl_farmers` (`farmer_id`),
  ADD CONSTRAINT `tbl_farminput_ibfk_2` FOREIGN KEY (`input_id`) REFERENCES `tbl_inputs` (`input_id`);

--
-- Constraints for table `tbl_farmproduce`
--
ALTER TABLE `tbl_farmproduce`
  ADD CONSTRAINT `tbl_farmproduce_ibfk_1` FOREIGN KEY (`farmer_id`) REFERENCES `tbl_farmers` (`farmer_id`);

--
-- Constraints for table `tbl_inputorderdetails`
--
ALTER TABLE `tbl_inputorderdetails`
  ADD CONSTRAINT `tbl_inputorderdetails_ibfk_1` FOREIGN KEY (`input_id`) REFERENCES `tbl_inputs` (`input_id`),
  ADD CONSTRAINT `tbl_inputorderdetails_ibfk_2` FOREIGN KEY (`inputorder_id`) REFERENCES `tbl_inputorders` (`inputorder_id`);

--
-- Constraints for table `tbl_inputorders`
--
ALTER TABLE `tbl_inputorders`
  ADD CONSTRAINT `tbl_inputorders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_users` (`user_id`),
  ADD CONSTRAINT `tbl_inputorders_ibfk_2` FOREIGN KEY (`farmer_id`) REFERENCES `tbl_farmers` (`farmer_id`);

--
-- Constraints for table `tbl_inputs`
--
ALTER TABLE `tbl_inputs`
  ADD CONSTRAINT `tbl_inputs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_users` (`user_id`);

--
-- Constraints for table `tbl_orderdetails`
--
ALTER TABLE `tbl_orderdetails`
  ADD CONSTRAINT `tbl_orderdetails_ibfk_2` FOREIGN KEY (`produce_id`) REFERENCES `tbl_farmproduce` (`produce_id`);

--
-- Constraints for table `tbl_orders`
--
ALTER TABLE `tbl_orders`
  ADD CONSTRAINT `tbl_orders_ibfk_1` FOREIGN KEY (`farmer_id`) REFERENCES `tbl_farmers` (`farmer_id`),
  ADD CONSTRAINT `tbl_orders_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `tbl_users` (`user_id`);

--
-- Constraints for table `tbl_paymentdetails`
--
ALTER TABLE `tbl_paymentdetails`
  ADD CONSTRAINT `tbl_paymentdetails_ibfk_1` FOREIGN KEY (`shippingdetail_id`) REFERENCES `tbl_shippingdetails` (`shippingdetail_id`),
  ADD CONSTRAINT `tbl_paymentdetails_ibfk_2` FOREIGN KEY (`inputorder_id`) REFERENCES `tbl_inputorders` (`inputorder_id`);

--
-- Constraints for table `tbl_requests`
--
ALTER TABLE `tbl_requests`
  ADD CONSTRAINT `tbl_requests_ibfk_1` FOREIGN KEY (`farmer_id`) REFERENCES `tbl_farmers` (`farmer_id`),
  ADD CONSTRAINT `tbl_requests_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `tbl_users` (`user_id`);

--
-- Constraints for table `tbl_shippingdetails`
--
ALTER TABLE `tbl_shippingdetails`
  ADD CONSTRAINT `tbl_shippingdetails_ibfk_1` FOREIGN KEY (`inputorder_id`) REFERENCES `tbl_inputorders` (`inputorder_id`);

--
-- Constraints for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD CONSTRAINT `tbl_users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `tbl_roles` (`role_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
