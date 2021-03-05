-- MySQL dump 10.13  Distrib 8.0.22, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: phimhdplus
-- ------------------------------------------------------
-- Server version	5.7.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `disable` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Phim Bộ',2,0,0,NULL,NULL),(2,'Phim Lẻ',1,0,0,NULL,NULL),(3,'Phim Chiếu Rạp',1,0,0,NULL,NULL),(4,'Phim Truyền Hình',2,0,0,NULL,NULL),(5,'Hài Hước',2,1,0,NULL,NULL),(9,'Tình Cảm - Lãng Mạn',2,1,0,'2018-04-13 09:42:38','2018-04-13 09:42:38'),(10,'Hành Động',2,1,0,'2018-04-13 09:42:54','2018-04-13 09:42:54'),(11,'Hành Động',1,2,0,'2018-04-17 11:23:50','2018-04-17 11:23:50'),(12,'Tình Cảm - Lãng Mạn',1,2,0,'2018-04-17 11:24:04','2018-04-17 11:24:04'),(13,'Hài Hước',1,2,0,'2018-04-17 11:24:17','2018-04-17 11:24:17'),(14,'Kinh Dị',2,1,0,'2018-04-17 11:24:49','2018-04-17 11:24:49'),(15,'Thần Thoại',2,1,0,'2018-04-17 11:24:56','2018-04-17 11:24:56'),(16,'Viễn Tưởng',2,1,0,'2018-04-17 11:25:22','2018-04-17 11:25:22'),(17,'Cổ Trang',2,1,0,'2018-04-17 11:25:33','2018-04-17 11:25:33'),(18,'Chiến Tranh',2,1,0,'2018-04-17 11:25:58','2018-04-17 11:25:58'),(19,'Âm Nhạc',2,1,0,'2018-04-17 11:26:25','2018-04-17 11:26:25'),(20,'Võ Thuật',2,1,0,'2018-04-17 11:26:40','2018-04-17 11:26:40'),(21,'Cổ Trang',1,2,0,'2018-04-17 11:26:50','2018-04-17 11:26:50'),(22,'Võ Thuật',1,2,0,'2018-04-17 11:26:55','2018-04-17 11:26:55'),(23,'Kinh Dị',1,2,0,'2018-04-17 11:27:01','2018-04-17 11:27:01'),(24,'Hoạt Hình',2,1,0,'2018-04-17 11:27:13','2018-04-17 11:27:13'),(25,'Hoạt Hình',1,2,0,'2018-04-17 11:27:21','2018-04-17 11:27:21');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film_details`
--

DROP TABLE IF EXISTS `film_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `film_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `film_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `source1` text COLLATE utf8mb4_unicode_ci,
  `source2` text COLLATE utf8mb4_unicode_ci,
  `source3` text COLLATE utf8mb4_unicode_ci,
  `source_vip1` text COLLATE utf8mb4_unicode_ci,
  `source_vip2` text COLLATE utf8mb4_unicode_ci,
  `source_vip3` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film_details`
--

LOCK TABLES `film_details` WRITE;
/*!40000 ALTER TABLE `film_details` DISABLE KEYS */;
INSERT INTO `film_details` VALUES (12,5,'Lời Nguyền Bí Ẩn','loi-nguyen-bi-an.mp4','loi-nguyen-bi-an.mp4','loi-nguyen-bi-an.mp4','loi-nguyen-bi-an.mp4','loi-nguyen-bi-an.mp4','loi-nguyen-bi-an.mp4','2018-04-17 10:07:41','2018-04-17 10:07:41'),(14,8,'Phượng Tu Hoàng - Tập 1','phuong-tu-hoang.mp4','phuong-tu-hoang.mp4','phuong-tu-hoang.mp4','phuong-tu-hoang','phuong-tu-hoang.mp4','phuong-tu-hoang.mp4','2018-04-17 10:43:44','2018-04-17 10:43:44'),(15,8,'Phượng Tu Hoàng - Tập 2','phuong-tu-hoang.mp4','phuong-tu-hoang.mp4','phuong-tu-hoang.mp4','phuong-tu-hoang.mp4','phuong-tu-hoang.mp4','phuong-tu-hoang.mp4','2018-04-17 10:44:27','2018-04-17 10:44:27'),(16,8,'Phượng Tu Hoàng - Tập 3','phuong-tu-hoang.mp4','phuong-tu-hoang.mp4','phuong-tu-hoang.mp4','phuong-tu-hoang.mp4','phuong-tu-hoang.mp4','phuong-tu-hoang.mp4','2018-04-17 10:44:55','2018-04-17 10:44:55'),(17,8,'Phượng Tu Hoàng - Tập 4','phuong-tu-hoang.mp4','phuong-tu-hoang.mp4','phuong-tu-hoang.mp4','phuong-tu-hoang.mp4','phuong-tu-hoang.mp4','phuong-tu-hoang.mp4','2018-04-17 10:45:27','2018-04-17 10:45:27'),(19,12,'Thiên Tài Lừa Đảo - Tập 1','thien-tai-lua-dao.mp4','thien-tai-lua-dao.mp4','thien-tai-lua-dao.mp4','thien-tai-lua-dao.mp4','thien-tai-lua-dao.mp4','thien-tai-lua-dao.mp4','2018-04-17 11:18:28','2018-04-17 11:18:28'),(20,12,'Thiên Tài Lừa Đảo - Tập 2','thien-tai-lua-dao.mp4','thien-tai-lua-dao.mp4','thien-tai-lua-dao.mp4','thien-tai-lua-dao.mp4','thien-tai-lua-dao.mp4','thien-tai-lua-dao.mp4','2018-04-17 11:18:51','2018-04-17 11:18:51'),(21,12,'Thiên Tài Lừa Đảo - Tập 3','thien-tai-lua-dao.mp4','thien-tai-lua-dao.mp4','thien-tai-lua-dao.mp4','thien-tai-lua-dao.mp4','thien-tai-lua-dao.mp4','thien-tai-lua-dao.mp4','2018-04-17 11:19:26','2018-04-17 11:19:26'),(22,13,'Phong Vân Thượng Hải - Tập 1','phong-van-thuong-hai.mp4','phong-van-thuong-hai.mp4','phong-van-thuong-hai.mp4','phong-van-thuong-hai.mp4','phong-van-thuong-hai.mp4','phong-van-thuong-hai.mp4','2018-04-17 11:22:21','2018-04-17 11:22:21'),(23,13,'Phong Vân Thượng Hải - Tập 2','phong-van-thuong-hai.mp4','phong-van-thuong-hai.mp4','phong-van-thuong-hai.mp4','phong-van-thuong-hai.mp4','phong-van-thuong-hai.mp4','phong-van-thuong-hai.mp4','2018-04-17 11:22:56','2018-04-17 11:22:56'),(24,14,'Quý Ông Của Tôi - Tập 1','quy-ong-cua-toi.mp4','quy-ong-cua-toi.mp4','quy-ong-cua-toi.mp4','quy-ong-cua-toi.mp4','quy-ong-cua-toi.mp4','quy-ong-cua-toi.mp4','2018-04-17 11:35:36','2018-04-17 11:35:36'),(25,15,'Nghịch Duyên - Tập 1','nghich-duyen.mp4','nghich-duyen.mp4','nghich-duyen.mp4','nghich-duyen.mp4','nghich-duyen.mp4','nghich-duyen.mp4','2018-04-17 11:37:39','2018-04-17 11:37:39'),(26,15,'Nghịch Duyên - Tập 2','nghich-duyen.mp4','nghich-duyen.mp4','nghich-duyen.mp4','nghich-duyen.mp4','nghich-duyen.mp4','nghich-duyen.mp4','2018-04-17 11:38:00','2018-04-17 11:38:00'),(27,19,'Em Là Thanh Xuân Của Anh - Tập 1','em-la-thanh-xuan-cua-anh.mp4','em-la-thanh-xuan-cua-anh.mp4','em-la-thanh-xuan-cua-anh.mp4','em-la-thanh-xuan-cua-anh.mp4','em-la-thanh-xuan-cua-anh.mp4','em-la-thanh-xuan-cua-anh.mp4','2018-04-18 08:21:40','2018-04-18 08:21:40'),(28,19,'Em Là Thanh Xuân Của Anh - Tập 2','em-la-thanh-xuan-cua-anh.mp4','em-la-thanh-xuan-cua-anh.mp4','em-la-thanh-xuan-cua-anh.mp4','em-la-thanh-xuan-cua-anh.mp4','em-la-thanh-xuan-cua-anh.mp4','em-la-thanh-xuan-cua-anh.mp4','2018-04-18 08:23:01','2018-04-18 08:23:01'),(29,20,'Tân Tiếu Ngạo Giang Hồ - Tập 1','tan-tieu-ngao-giang-ho-720.mp4','tan-tieu-ngao-giang-ho-720.mp4','tan-tieu-ngao-giang-ho-720.mp4','tan-tieu-ngao-giang-ho-720.mp4','tan-tieu-ngao-giang-ho-720.mp4','tan-tieu-ngao-giang-ho-720.mp4','2018-04-18 08:27:09','2018-04-18 08:27:09'),(30,20,'Tân Tiếu Ngạo Giang Hồ - Tập 2','tan-tieu-ngao-giang-ho-720.mp4','tan-tieu-ngao-giang-ho-720.mp4','tan-tieu-ngao-giang-ho-720.mp4','tan-tieu-ngao-giang-ho-720.mp4','tan-tieu-ngao-giang-ho-720.mp4','tan-tieu-ngao-giang-ho-720.mp4','2018-04-18 08:28:26','2018-04-18 08:28:26'),(31,21,'Khu Phố Giang Hồ','khu-pho-giang-ho.mp4','khu-pho-giang-ho.mp4','khu-pho-giang-ho.mp4','khu-pho-giang-ho.mp4','khu-pho-giang-ho.mp4','khu-pho-giang-ho.mp4','2018-04-18 08:38:19','2018-04-18 08:38:19'),(32,16,'30 Vẫn Còn Xuân','30-van-con-xuan.mp4','30-van-con-xuan.mp4','30-van-con-xuan.mp4','30-van-con-xuan.mp4','30-van-con-xuan.mp4','30-van-con-xuan.mp4','2018-04-18 08:38:19','2018-04-18 08:38:19'),(33,17,'Công Chúa Tóc Dài','cong-chua-toc-dai.mp4','cong-chua-toc-dai.mp4','cong-chua-toc-dai.mp4','cong-chua-toc-dai.mp4','cong-chua-toc-dai.mp4','cong-chua-toc-dai.mp4','2018-04-18 08:38:19','2018-04-18 08:38:19'),(34,18,'Thiên Tài Bất Hảo','thien-tai-bat-hao.mp4','thien-tai-bat-hao.mp4','thien-tai-bat-hao.mp4','thien-tai-bat-hao.mp4','thien-tai-bat-hao.mp4','thien-tai-bat-hao.mp4','2018-04-18 08:38:19','2018-04-18 08:38:19');
/*!40000 ALTER TABLE `film_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `films`
--

DROP TABLE IF EXISTS `films`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `films` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `poster` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `about` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `actor` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `director` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags` text COLLATE utf8mb4_unicode_ci,
  `is_slide` int(11) NOT NULL DEFAULT '0',
  `disable` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL,
  `view` int(11) NOT NULL DEFAULT '0',
  `total_vote` int(11) NOT NULL DEFAULT '5',
  `episode` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `films`
--

LOCK TABLES `films` WRITE;
/*!40000 ALTER TABLE `films` DISABLE KEYS */;
INSERT INTO `films` VALUES (5,'Lời Nguyền Bí Ẩn','loi-nguyen-bi-an.png','Năm 1953, giữa lúc Chiến tranh Đại Tây Dương ở châu Á xảy ra thì tại Bangkok, Thái Lan, xuất hiện những trường hợp giết người kinh hoàng. Trên các xác chết luôn có những hình xăm bí ẩn ở cổ tay, trán và mắt cá chân. Đây chính là sự mở đầu cho vụ thảm sát hàng loạt kỳ lạ ở Bangkok.Một ngày nọ, thanh tra Pol.lt Col Waytag Phiromruj (Pong Nawat) báo cáo tìm thấy một cô gái chết tại ngôi đền Rakung Dusitraram. Cơ thể cô giống như bị đầu độc còn đầu thì bị bắn từ đằng sau cho tới khi bị vỡ.\r\n\r\nHọ nhìn thấy 5 từ xăm lần lượt là Yao, Jao, Pae, Ting, Pong. Chưa dừng lại ở đó, những cái chết vẫn tiếp tục diễn ra trong thời gian ngắn. Mỗi sự kiện đều có những móc nối kì lạ với những hình xăm khác nhau. Khi cảnh sát cố gắng kết nối các bằng chứng có được lại với nhau, cuộc điều tra lại bị cản trở bởi những tình huống bí ẩn. Vậy kẻ sát nhân là ai? Mục đích và ý nghĩa các hình xăm là gì?','N/A','Anuchit, Thongwattana Dilok','[2,\"23\"]',NULL,1,0,1,4,5,1,'2018-04-17 10:07:21','2021-03-05 09:38:22'),(8,'Phượng Tu Hoàng','phuong-tu-hoang.png','Trong phim Phượng Tù Hoàng, Sơn Âm công chúa là một nàng công chúa nổi tiếng hoang dâm, ham mê nam sắc, nuôi dưỡng vô số sủng nam trong phủ. Sở Ngọc một mặt giả vờ dâm loạn, một mặt tính kế để bồi dưỡng tâm phúc. Thế nhưng, lại có một Dung Chỉ xuất chúng hơn người, luôn luôn lạnh lùng âm hiểm và đầy mưu mô mà Sở Ngọc thì lại dần dần lại nảy sinh tình cảm với chàng trai ấy.','Trương Hinh Dư, Quan Hiểu Đồng, Tống Uy Long, Trương','Vu Chính','[1,\"9\",\"17\",\"20\"]',NULL,1,0,2,16,4,53,'2018-04-17 10:43:17','2021-03-05 08:18:00'),(12,'Thiên Tài Lừa Đảo','thien-tai-lua-dao.png','Phim Switch: Change the World Một người đàn ông là một kẻ lừa đảo. Anh ta đủ thông minh để tham dự kỳ thi thanh tra, nhưng anh ta không thể trở thành công tố viên. Không tính đến sự thiên vị và thiên vị của các công tố viên, người đàn ông làm cho bọn tội phạm trả tiền cho những tội ác mà các công tố viên đã không làm.','Jung Woong In, Jang Keun Suk, Shin Do-Hyun, Jang Keun-Suk','Baek Woon-Chul','[1,\"5\",\"9\"]',NULL,1,0,2,2,5,12,'2018-04-17 11:17:59','2021-03-05 09:38:51'),(13,'Phong Vân Thượng Hải','phong-van-thuong-hai.png','Trong những năm 1930, cha của Diệp Phi sau khi chiến thắng thử thách với nhà ảo thuật người Đức đã bị hãm hại, khủng bố, tra tấn và cuối cùng đã qua đời. Diệp Phi (Kinh Siêu) đã quay trở lại Thượng Hải để tìm cách trả thù cho cha mình. Anh được Tiêu Dao (Châu Đông Vũ), con gái của ông chủ băng đảng Thượng Hải ngưỡng mộ. Chiến tranh với quân Nhật Bản xảy ra, cả hai cùng bước đi chung trên con đường kháng Nhật đầy nguy hiểm sinh tử.','Nhậm Đạt Hoa, Châu Đông Vũ, Kinh Siêu','N/A','[1,\"10\",\"20\"]',NULL,1,0,2,4,5,10,'2018-04-17 11:21:44','2021-03-05 09:00:07'),(14,'Quý Ông Của Tôi','quy-ong-cua-toi.png','Phim Quý Ông Của Tôi xoay quanh ba anh em ruột với những cách sống khác nhau và một người phụ nữ lạnh nhạt, xa cách phải chịu nhiều đau khổ trong cuộc đời. Cả 4 người đang học cách tận hưởng cuộc sống và hàn gắn vết thương trong quá khứ.','n/a','n/a','[1,\"5\",\"9\"]',NULL,1,0,2,4,5,10,'2018-04-17 11:35:08','2021-03-05 08:53:15'),(15,'Nghịch Duyên','nghich-duyen.png','Sau trận chiến tranh khốc liệt, Chung Định Quốc (do Trần Gia Lạc đóng) vô tình bị đông lạnh trong phòng thí nghiệm bỏ hoang hơn 70 năm. Nhờ cơn mưa giông lớn, Quốc mới được thoát ra ngoài mà vẫn mang hình hài của thời trai trẻ. Quốc tìm lại người con thất lạc – Hạ Hòa Bình (do Khương Đại Vệ đóng). Bình nay vào tuổi trung niên, có một đứa con trai đã lập gia đình, tên là Hạ Vĩnh Niên (do Lê Diệu Tường đóng). Tiếc thay, cả Bình và Niên đều cực kỳ tham lam và ích kỷ. Bình thường xuyên kiếm chuyện để lấy hết tiền của Niên, khiến Niên luôn rơi vào cảnh túng quẫn. Còn Niên hành nghề bói toán, lợi dụng sự cả tin của người khác để trục lợi, trong đó có nữ đại gia Ông Chỉ Kiều (do Hạ Văn Tịch đóng). Nhìn thấy con và cháu trai của mình bị xã hội tha hóa, Quốc rất đau lòng, quyết tâm dạy dỗ lại Bình và Niên. Chính phủ muốn che giấu lai lịch của Quốc nên cho Quốc làm nhân viên văn phòng tại sở phúc lợi. Nhờ đó, Quốc làm quen với Trang Tư Thần (do Lâm Hạ Vy đóng) – cô cảnh sát nhiệt thành, coi trọng gia đình. Sự can trường, tài trí của Quốc trong các phi vụ điều tra làm cho Thần ngày một ngưỡng mộ và đem lòng yêu Quốc. Nhưng Quốc không thể tiến tới vì mặc cảm tuổi tác. Trong khi đó, cảnh sát điều tra Giả Trác Bân (do Trần Sơn Thông đóng) cũng có ý với Thần. Bân có vẻ ngoài liêm chính, đàng hoàng, nhưng thực tế lại rất gian manh, không từ mọi thủ đoạn. Bân nắm giữ tất cả bí mật của Quốc, Bình, Niên, Kiều và Thần. Nhưng, khi bí mật sắp được hé lộ, Bân đột nhiên bị sát hại một cách kỳ lạ..','Khương Đại Vệ, Lê Diệu Tường, Trần Gia Lạc, Hạ Văn Tịch, Hàn Mã Lợi','n/a','[1,\"5\",\"9\"]',NULL,0,0,2,3,4,10,'2018-04-17 11:37:05','2021-03-05 09:38:56'),(16,'30 Vẫn Còn Xuân','30-van-con-xuan.jpg','Phim được chuyển thể từ movie nổi tiếng ăn khách cùng tên \"Fabulous 30\" do Aum P và Ken P đóng chính hứa hẹn sẽ là một series vui nhộn hài hước không kém gì bản gốc','Aum Patcharapa Chaichue, Ken Phupoom Phongpanu, Ice Preechaya Pongthananikorn','n/a','[1,\"5\",\"9\"]',NULL,1,0,2,36,5,8,'2018-04-17 11:39:49','2021-03-05 09:28:58'),(17,'Công Chúa Tóc Dài','cong-chua-toc-dai.png','(Công chúa tóc mây) là câu chuyện về Rapunzel - nàng công chúa có mái tóc dài thần kì bị nhốt suốt 18 năm trời trên ngọn tháp cao chót vót bởi một mụ phù thủy. Mọi chuyện trở nên kịch tính khi tên trộm tinh quái và quyến rũ nhất vương quốc - Flynn Rider - trong cuộc chạy trốn khỏi binh lính triều đình, tình cờ rơi vào ngọn tháp của Rapunzel. Từ đây cô công chúa thơ dại đã bắt đầu chuyến phiêu lưu trốn chạy khỏi ngọn tháp u tối để tìm lại cuộc sống đích thực của chính mình. Dựa trên một câu chuyện cổ tích của anh em nhà Grimm có tiêu đề Rapunzel, bộ phim Tangled được thực hiện dưới dạng 3-D và do diễn viên kiêm ca sỹ Mandy Moore lồng tiếng vai Rapunzel, cùng với sự tham gia của các diễn viên lồng tiếng nổi tiếng khác như Zachary Levi, Donna Murphy, Ewan McGregor và Steve Martin.','Zachary Levi, Donna Murphy, Ron Perlman, Jeffrey Tambor, Brad Garrett, Bob Bergen, Mandy Moore, M.c. Gainey, Paul F. Tompkins, Richard Kiel, Delaney Rose Stein, Nathan Greno, Byron Howard, Tim Mertens, Michael Bell','Nathan Greno Byron Howard 1','[2,\"12\",\"13\",\"25\"]',NULL,0,0,1,0,5,1,'2018-04-17 11:41:06','2018-04-17 11:41:06'),(18,'Thiên Tài Bất Hảo','thien-tai-bat-hao.png','Bad Genius không chỉ là gian lận thi cử mà là cả một “phi vụ” kiếm tiền của một nhóm học sinh cấp 3. Kẻ cầm đầu là thiên tài toán học Lynn (Chutimon Chuengcharoensukying) bắt đầu “hành nghề” chỉ bài cho bạn cùng trường gian lận để kiếm tiền. Câu chuyện bắt đầu khi Lynn “giúp đỡ” cho 5 cô cậu con nhà giàu trong trường với mức giá 3000 baht một môn. Nhưng thật không may, phi vụ thất bại, thiên tài quay cóp bị tố và bị bắt tại trận.\r\n\r\nChuyện gì sẽ xảy ra với thiên tài một khi kế hoạch bị lật tẩy, đồng bọn của cô sẽ xử trí thế nào để cứu cô? Và những mánh khoé gian lận phòng thi sẽ được bóc trần, chưa bao giờ chuyện thi cử lại trở lên ly kỳ và hồi hộp đến như vậy\".','Thaneth Warakulnukroh, Ego Mikitas, Sahajak Boonthanakit, Chutimon Chuengcharoensukying, Eisaya Hosuwan, Teeradon Supapunpinyo, Chanon Santinatornkul, Sarinrat Thomas, Pasin Kuansataporn, Kanjana Vinaipanid, Yuthapong Varanukrohchoke, Nopawat Likitwong, Vittawin','N/A','[2,\"11\",\"12\",\"13\"]',NULL,1,0,1,1,5,1,'2018-04-17 11:43:08','2021-03-05 09:38:43'),(19,'Em Là Thanh Xuân Của Anh','em-la-thanh-xuan-cua-anh.png','Phim Em Là Thanh Xuân Của Anh: bắt đầu khi Từ Vĩnh Tâm gặp lại bạn học cấp ba Trịnh Đại Uy, gợi lên những kỷ niệm ngọt bùi đắng cay thời học sinh. Mười mấy năm trước, Vĩnh Tâm là một học sinh giỏi, vô cùng nghiêm túc, một sự cố về máy tính xách tay bất ngờ làm cuộc sống của cô va chạm với người bạn cùng lớp Đỗ Á Tu. Càng hiểu về Á Tu, cô càng phát hiện ra trái ngược với vẻ ngoài của một học sinh cá biệt, Á Tu là một chàng trai lương thiện và nhiệt tình. Nhờ có Á Tu, cô nàng một sách Vĩnh Tâm cũng dần mở lòng và kết giao với nhiều bạn bè mới: Anh chàng thể thao Trịnh Đại Uy, người đẹp băng giá Cao Vũ Tuyên và chàng trai ấm áp nho nhã Trịnh Đại Văn. Cùng nhau họ đối mặt với sự bất an và hoài nghi của tuổi mới lớn, cùng chia sẻ những ước mơ và cảm xúc trong trẻo, cùng cười cùng khóc, cùng nhau vấp ngã, nhưng không hề sợ hãi, bởi vì họ biết, luôn có ai đó bên cạnh ủng hộ động viên mình đứng dậy và hướng tới tương lai.','n/a','n/a','[1,\"9\"]',NULL,0,0,2,1,5,24,'2018-04-18 08:21:19','2021-03-05 09:39:02'),(20,'Tân Tiếu Ngạo Giang Hồ','tan-tieu-ngao-giang-ho.png','Tân Tiếu Ngạo Giang Hồ 2018 có độ dài 30 tập và sẽ phát sóng vào 26/2. Danh sách diễn viên tham gia trong phim. Một số nhân vật chú ý trong phim bao gồm: Đinh Quán Sâm vào vai Lệnh Hồ Xung, Trần Tấn vai Lâm Bình Chi, Tiết Hạo Tịnh vai Nhậm Doanh Doanh, Lý Hạo Hàn (Nhạc Bất Quần), Vương Giai Trữ (Nhậm Ngã Hành), Kim Giai Kiệt (Hướng Vấn Thiên), Lưu Gia Đồng (Lam Phượng Hoàng), Quý Đông Nhiên (Điền Bá Quang), Khương Trác Quân (Nghi Lâm)','n/a','n/a','[1,\"9\",\"10\",\"17\",\"20\"]',NULL,0,0,2,60,5,37,'2018-04-18 08:26:53','2021-03-05 09:28:49'),(21,'Khu Phố Giang Hồ','khu-pho-giang-ho.png','Phim Khu Phố Giang Hồ Trước việc phải giải tán băng nhóm của mình, Cương Chính- một đại ca hết thời- luôn tìm cách kết liễu theo nghi thức Samurai. Thế nhưng, nhiều lần đều thất bại vì vô tính vướng vào một cuộc giao dịch ma túy kỳ quặc của kẻ khác, để rồi trời xui đất xụi góp phần làm sụp đổ băng nhóm khét tiếng của Nhật Bản.','Lưu Dương, Hoàng Khải Tường, Trương Bổn Dục','n/a','[2,\"11\",\"12\",\"22\"]',NULL,0,0,1,0,5,1,'2018-04-18 08:37:52','2018-04-18 08:37:52');
/*!40000 ALTER TABLE `films` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `film_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (1,20,3,'2021-03-05 07:10:26','2021-03-05 07:10:26');
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2018_03_15_072357_create_film_table',1),(4,'2018_03_15_074516_create_film_detail_table',1),(5,'2018_03_15_075627_create_category_table',1),(6,'2018_03_15_080226_create_like_table',1),(7,'2018_03_15_080302_create_vote_table',1),(8,'2018_03_15_081002_create_report_table',1),(9,'2018_03_31_050820_create_settings_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports`
--

DROP TABLE IF EXISTS `reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `film_id` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `messages` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports`
--

LOCK TABLES `reports` WRITE;
/*!40000 ALTER TABLE `reports` DISABLE KEYS */;
INSERT INTO `reports` VALUES (1,1,'huyletien@outlook.com','Lỗi to, fix đi admin','2018-04-12 10:33:38','2018-04-12 10:33:38'),(2,20,'nguyentranhiep96@gmail.com','adsdas','2021-03-05 07:03:34','2021-03-05 07:03:34');
/*!40000 ALTER TABLE `reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8mb4_unicode_ci,
  `keywords` text COLLATE utf8mb4_unicode_ci,
  `descriptions` text COLLATE utf8mb4_unicode_ci,
  `maintenance` int(11) NOT NULL DEFAULT '0',
  `vip` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'PhimHD+ - PhimHD Online','phimhd online, phimhd moi nhat, phimhd+, phimhd mien phi','PhimHD online cập nhật mới nhất',0,99,NULL,NULL);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'uploads/images/user_default.png',
  `api_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `right` int(11) NOT NULL DEFAULT '0',
  `credit` int(11) NOT NULL DEFAULT '0',
  `vip` int(11) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'huyletien@outlook.com','$2y$10$eC.hE6fPrn7RzzpNKm6ene8c5nbNn.WAitUoSvHD470H2CY01fw7W','http://localhost/phimhdplus/public/upload/users/avatar/f7715074d110fe1129914270c1cbd1f1jpg',NULL,0,999999802,1,'6ADuudFhYPL0owa1fwQGaYeAh6jknXoc33FIX0fHGnfFt4x17Q8ijb3VVFqF','2018-04-09 12:36:15','2021-03-05 08:38:33'),(2,'letienhuy.dev@gmail.com','$2y$10$XYPBNipXXTySJRwvgX7AJOTkZm9sOt2h8PBvDdQ5mXwEYaskBkJrS','http://localhost/phimhdplus/public/upload/users/avatar/f123729e3383186631e194299e8d9e20jpg',NULL,0,100000000,0,'CF7LG2Y4sX6mm79MkutXcRFZ1K5ypx22qsyYgeWatMWnwcVQJorJUZu7MwRm','2018-04-10 02:19:52','2021-03-05 08:38:40'),(3,'nguyentranhiep96@gmail.com','$2y$10$NxThzusuqDO7PnbBfPKREujK950LT/UJMOSKjXHVdbwNWE0S9DZZi','http://localhost/css/icons/default.png',NULL,1,0,0,'OV41vBzd0H2rEb277lZlMuzNwCiB4MWsdyOeArpfNJbMrtF7t2XBuDFglvQi','2021-03-05 04:36:49','2021-03-05 04:36:49');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `votes`
--

DROP TABLE IF EXISTS `votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `votes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `film_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `point` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `votes`
--

LOCK TABLES `votes` WRITE;
/*!40000 ALTER TABLE `votes` DISABLE KEYS */;
INSERT INTO `votes` VALUES (1,8,1,4,'2018-04-17 11:03:53','2018-04-17 11:03:53'),(2,20,3,5,'2021-03-05 06:50:26','2021-03-05 06:50:26'),(3,15,3,4,'2021-03-05 08:52:53','2021-03-05 08:52:53');
/*!40000 ALTER TABLE `votes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-05 16:51:41
