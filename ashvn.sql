-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 22, 2025 at 05:26 PM
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
-- Database: `ashvn`
--

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `address` text NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('pending','approved','canceled') NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `address`, `total_price`, `created_at`, `status`) VALUES
(1, 1, 'Long biên', 690000.00, '2025-03-21 08:03:25', 'approved'),
(2, 2, '', 1400000.00, '2025-03-22 15:47:42', 'approved'),
(3, 2, 'Đức Giang', 150000.00, '2025-03-22 16:03:16', 'approved');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `quantity`, `price`) VALUES
(1, 1, 1, 1, 150000.00),
(5, 2, 1, 8, 0.00),
(6, 2, 6, 2, 0.00),
(7, 2, 7, 1, 0.00),
(8, 3, 1, 1, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `product_comments`
--

CREATE TABLE `product_comments` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `admin` varchar(255) NOT NULL,
  `comment` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sanpham`
--

CREATE TABLE `sanpham` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sanpham`
--

INSERT INTO `sanpham` (`id`, `name`, `category`, `price`, `image`, `created_at`, `description`) VALUES
(1, 'Nike', 'Sneaker', 150000.00, 'sg-11134201-22110-4nv6qkv2pljv9c.jpeg', '2025-03-21 07:59:36', NULL),
(6, 'Bittis', 'Nomal Shoes', 50000.00, '4018334d082e18257f71f4ea984e1a1d.jpeg', '2025-03-21 08:01:53', NULL),
(7, 'Thuong Dinh', 'Nomal Shoes', 100000.00, '41bbdd00236c3cc46ba8585ea436319b.jpeg', '2025-03-21 08:02:04', NULL),
(8, 'Vans ', 'Sneaker', 129000.00, 'Giay-Nike-Air-Jordan-1-Low-SE-Year-of-the-Dragon-FJ5735-100-10.png', '2025-03-22 03:13:36', NULL),
(10, 'Nike Air', 'Sneaker', 299000.00, 'hq8750.png_fe3f4f8ae0194d379e51223235629a11.png', '2025-03-22 14:42:23', NULL),
(11, 'Dior', 'Sneaker', 255000.00, 'sg-11134201-22110-cv8mz122pljv07.jpeg', '2025-03-22 14:59:03', 'Dior là một trong những thương hiệu thời trang cao cấp hàng đầu thế giới, nổi tiếng với các sản phẩm sang trọng và tinh tế, bao gồm cả giày dép. Giày đi của Dior thường mang đậm phong cách thiết kế hiện đại, thanh lịch và thể hiện sự sáng tạo độc đáo. Dưới đây là một số đặc điểm chung của giày đi Dior:\r\n\r\n1. **Chất liệu cao cấp**: Giày Dior thường được làm từ các chất liệu cao cấp như da thật, nhung, vải canvas hoặc các loại vật liệu đặc biệt khác, mang lại cảm giác sang trọng và bền bỉ.\r\n\r\n2. **Thiết kế tinh tế**: Mỗi đôi giày đều được chăm chút tỉ mỉ về thiết kế, với những đường nét thanh thoát và chi tiết tinh xảo. Dior thường kết hợp giữa phong cách cổ điển và hiện đại, tạo nên những mẫu giày độc đáo.\r\n\r\n3. **Đế giày**: Đế giày của Dior thường được thiết kế để đảm bảo sự thoải mái khi di chuyển, đồng thời vẫn giữ được vẻ đẹp thẩm mỹ. Một số mẫu có đế cao hoặc gót nhọn, trong khi những mẫu khác có đế phẳng hoặc thấp hơn.\r\n\r\n4. **Phong cách đa dạng**: Dior cung cấp nhiều kiểu dáng giày khác nhau, từ giày cao gót thanh lịch cho đến giày thể thao năng động hay giày bệt thoải mái. Điều này giúp người dùng dễ dàng lựa chọn phù hợp với phong cách cá nhân và dịp sử dụng.\r\n\r\n5. **Chi tiết trang trí**: Nhiều mẫu giày Dior có các chi tiết trang trí đặc trưng như logo thương hiệu, họa tiết độc quyền hoặc các yếu tố nghệ thuật khác, tạo nên sự nổi bật và khác biệt.\r\n\r\nGiày đi của Dior không chỉ đơn thuần là một món đồ phụ kiện mà còn là biểu tượng của sự sang trọng và phong cách thời trang đẳng cấp.'),
(12, 'Adidas', 'Sneaker', 599000.00, 'vn-11134207-7r98o-lstljcbp1121f8.jpg', '2025-03-22 14:59:38', 'Adidas là một trong những thương hiệu giày dép nổi tiếng trên toàn cầu, đặc biệt là trong lĩnh vực thể thao. Giày đi bộ của Adidas thường được thiết kế với nhiều tính năng nổi bật nhằm mang lại sự thoải mái và hiệu suất cao cho người sử dụng. Dưới đây là một số đặc điểm chung của giày đi bộ Adidas:\r\n\r\n1. **Chất liệu**: Giày thường được làm từ các chất liệu nhẹ, bền và thoáng khí như lưới (mesh), da tổng hợp hoặc cao su, giúp chân không bị bí bách khi di chuyển.\r\n\r\n2. **Đệm**: Hệ thống đệm thường được tích hợp để hấp thụ sốc và giảm áp lực lên bàn chân. Công nghệ như Boost hoặc Cloudfoam giúp mang lại cảm giác êm ái và đàn hồi.\r\n\r\n3. **Đế**: Đế giày thường được thiết kế với độ bám tốt, giúp tăng cường khả năng chống trượt và ổn định khi di chuyển trên nhiều bề mặt khác nhau.\r\n\r\n4. **Thiết kế**: Adidas có nhiều kiểu dáng đa dạng, từ những mẫu thể thao năng động đến những mẫu thời trang phù hợp cho việc đi dạo phố. Logo ba sọc đặc trưng của thương hiệu cũng thường xuất hiện trên sản phẩm.\r\n\r\n5. **Công nghệ tiên tiến**: Adidas luôn cập nhật công nghệ mới để cải thiện hiệu suất giày, chẳng hạn như công nghệ chống nước, khả năng thoát ẩm hay hỗ trợ điều chỉnh hình dáng bàn chân.\r\n\r\nGiày đi bộ của Adidas không chỉ phục vụ cho hoạt động thể thao mà còn trở thành một phần của phong cách sống hàng ngày, phù hợp với nhiều đối tượng người dùng khác nhau.'),
(14, 'Sandal', 'Nomal Shoes', 55000.00, 'vn-11134207-7r98o-lstljcbp3u6x0d.webp', '2025-03-22 16:03:56', 'Sandal là một loại giày dép nhẹ, thường được thiết kế mở ở phần trên và có thể có hoặc không có quai. Chúng thường được làm từ các chất liệu như da, vải, cao su hoặc nhựa, mang lại sự thoải mái và thông thoáng cho đôi chân. Sandal thường được sử dụng trong những ngày hè nóng bức hoặc khi đi biển, bởi vì chúng giúp chân không bị bí bách và dễ dàng di chuyển.\r\n\r\nCó nhiều kiểu dáng và mẫu mã sandal khác nhau, từ những đôi sandal đơn giản chỉ có quai ngang cho đến những mẫu thiết kế cầu kỳ với nhiều chi tiết trang trí. Sandal cũng rất phổ biến trong thời trang hàng ngày, phù hợp với nhiều phong cách khác nhau từ giản dị đến thanh lịch. \r\n\r\nNgoài ra, sandal còn được ưa chuộng vì tính tiện dụng và dễ dàng kết hợp với các trang phục như quần short, váy maxi hay đồ bơi.'),
(17, 'BTS', 'Sneaker', 100000.00, '203651807-1-corewhitecore_523cd7e312ec434289353af0f516642f_f5a49719275648fd9e8453a362f1735a.png', '2025-03-22 16:21:57', 'Dior là một trong những thương hiệu thời trang cao cấp hàng đầu thế giới, nổi tiếng với các sản phẩm sang trọng và tinh tế, bao gồm cả giày dép. Giày đi của Dior thường mang đậm phong cách thiết kế hiện đại, thanh lịch và thể hiện sự sáng tạo độc đáo. Dưới đây là một số đặc điểm chung của giày đi Dior:\r\n\r\n1. **Chất liệu cao cấp**: Giày Dior thường được làm từ các chất liệu cao cấp như da thật, nhung, vải canvas hoặc các loại vật liệu đặc biệt khác, mang lại cảm giác sang trọng và bền bỉ.\r\n\r\n2. **Thiết kế tinh tế**: Mỗi đôi giày đều được chăm chút tỉ mỉ về thiết kế, với những đường nét thanh thoát và chi tiết tinh xảo. Dior thường kết hợp giữa phong cách cổ điển và hiện đại, tạo nên những mẫu giày độc đáo.\r\n\r\n3. **Đế giày**: Đế giày của Dior thường được thiết kế để đảm bảo sự thoải mái khi di chuyển, đồng thời vẫn giữ được vẻ đẹp thẩm mỹ. Một số mẫu có đế cao hoặc gót nhọn, trong khi những mẫu khác có đế phẳng hoặc thấp hơn.\r\n\r\n4. **Phong cách đa dạng**: Dior cung cấp nhiều kiểu dáng giày khác nhau, từ giày cao gót thanh lịch cho đến giày thể thao năng động hay giày bệt thoải mái. Điều này giúp người dùng dễ dàng lựa chọn phù hợp với phong cách cá nhân và dịp sử dụng.\r\n\r\n5. **Chi tiết trang trí**: Nhiều mẫu giày Dior có các chi tiết trang trí đặc trưng như logo thương hiệu, họa tiết độc quyền hoặc các yếu tố nghệ thuật khác, tạo nên sự nổi bật và khác biệt.\r\n\r\nGiày đi của Dior không chỉ đơn thuần là một món đồ phụ kiện mà còn là biểu tượng của sự sang trọng và phong cách thời trang đẳng cấp.');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('customer','admin') DEFAULT 'customer',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullname`, `email`, `password`, `role`, `created_at`) VALUES
(1, 'nguyễn quang huy', 'h@gmail.com', '$2y$10$4SJ5sVqAZxe1A/W.nsxMUecY0udx2Jl5WXvASimONF56KXIEjUE6G', 'customer', '2025-03-21 07:44:53'),
(2, 'huy', 'huy@gmail.com', '$2y$10$.xJakEi1dk5Cd1KvGwo5UeU2NGTuEn67kjkU.PA88h1YboCppGegu', 'admin', '2025-03-21 07:58:25');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product_comments`
--
ALTER TABLE `product_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `product_comments`
--
ALTER TABLE `product_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `sanpham` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_comments`
--
ALTER TABLE `product_comments`
  ADD CONSTRAINT `product_comments_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `sanpham` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
