CREATE DATABASE  IF NOT EXISTS `flower-angel` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `flower-angel`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: flower-angel
-- ------------------------------------------------------
-- Server version	5.7.19-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `total_cost` double NOT NULL,
  `discount` double DEFAULT '0',
  `shipping_address` varchar(500) CHARACTER SET utf8mb4 NOT NULL,
  `note` varchar(500) CHARACTER SET utf8mb4 DEFAULT NULL,
  `phone_number` varchar(11) NOT NULL,
  `day_create` bigint(20) DEFAULT NULL,
  `day_modify` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Cart_User` (`user_id`),
  KEY `FK_Cart_Status` (`status_id`),
  CONSTRAINT `FK_Cart_Status` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Cart_User` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,13,1,602000,0,'asdasda',NULL,'2342342',1520143857633,1520143857633),(2,1,1,602000,0,'Yên viên',NULL,'01657183643',1520144340513,1520144340513),(3,1,1,3129123,0,'Yên viên',NULL,'1231231231',1520184096024,1520184096024),(4,14,1,602000,0,'asdasd',NULL,'6545465464',1520273461964,1520273461964),(5,1,1,2512000,0,'Yên viên-Gia Lâm-HN',NULL,'01657183643',1520274541278,1520274541278),(6,1,1,3714000,0,'Yên viên-Gia Lâm-HN',NULL,'01657183643',1520275120180,1520275120180),(7,1,1,3112000,0,'Yên viên-Gia Lâm-HN',NULL,'01657183643',1520275731257,1520275731257),(8,1,1,602000,0,'Yên viên-Gia Lâm-HN',NULL,'01657183643',1520276403791,1520276403791),(9,1,1,602000,0,'Yên viên-Gia Lâm-HN',NULL,'01657183643',1520276911503,1520276911503),(10,1,1,4224000,0,'Yên viên-Gia Lâm-HN',NULL,'01657183643',1520277094040,1520277094040);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartdetail`
--

DROP TABLE IF EXISTS `cartdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cartdetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cart_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_CartDetail_Cart` (`cart_id`),
  KEY `FK_CartDetail_Product` (`product_id`),
  CONSTRAINT `FK_CartDetail_Cart` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_CartDetail_Product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartdetail`
--

LOCK TABLES `cartdetail` WRITE;
/*!40000 ALTER TABLE `cartdetail` DISABLE KEYS */;
INSERT INTO `cartdetail` VALUES (4,1,3,1),(5,2,3,1),(6,3,1,2),(7,3,3,1),(8,3,2,1),(9,3,67,1),(10,4,3,1),(11,5,2,3),(12,5,4,5),(13,6,3,5),(14,6,2,1),(15,7,3,4),(16,7,2,1),(17,8,3,1),(18,9,3,1),(19,10,2,6);
/*!40000 ALTER TABLE `cartdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `category_path` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Hoa tươi','hoa-tuoi'),(2,'Hoa đám cưới','hoa-dam-cuoi'),(3,'Hoa sinh nhật','hoa-sinh-nhat'),(4,'Hoa đặc biệt','hoa-dac-biet'),(5,'Chủ đề khác','chu-de-khac'),(6,'Hoa cưới','hoa-cuoi');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `price` double NOT NULL,
  `discount` double DEFAULT '0',
  `sort_description` varchar(200) DEFAULT NULL,
  `full_description` varchar(500) DEFAULT NULL,
  `day_create` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'B0001',1000000,15,NULL,'Là sự kết hợp tinh tế giữ Hoa Chuông trắng và các phụ liệu, tạo nên sự nhẹ nhàng nhưng không kém phần tinh tế cho sản phẩm! * Kích thước: đường kính miệng bình là 12 cm x cao 25 cm. * Tùy vào các size khác nhau thì loại hoa và số lượng hoa sẽ thay đổi phù hợp.',1519907888635),(2,'Love 4',800000,12,'Thành phần: hoa hồng đỏ, Hoa lan tường, Hoa baby, Hoa lá phụ, Hộp gỗ cao cấp','Là sự kết hợp tinh tế giữ Hoa Chuông trắng và các phụ liệu, tạo nên sự nhẹ nhàng nhưng không kém phần tinh tế cho sản phẩm! * Kích thước: đường kính miệng bình là 12 cm x cao 25 cm. * Tùy vào các size khác nhau thì loại hoa và số lượng hoa sẽ thay đổi phù hợp.',1519907888635),(3,'Love 6',700000,14,'Thành phần: Hoa hồng đà lạt, Hoa hồng nhập, Baby, Hoa lá phụ, Giấy gói cao cấp','Là sự kết hợp tinh tế giữ Hoa Chuông trắng và các phụ liệu, tạo nên sự nhẹ nhàng nhưng không kém phần tinh tế cho sản phẩm! * Kích thước: đường kính miệng bình là 12 cm x cao 25 cm. * Tùy vào các size khác nhau thì loại hoa và số lượng hoa sẽ thay đổi phù hợp.',1519907888635),(4,'Love 7',100000,20,'Thành phần: Hoa hồng đỏ, Baby, Hoa lá phụ, Khay đỡ','Là sự kết hợp tinh tế giữ Hoa Chuông trắng và các phụ liệu, tạo nên sự nhẹ nhàng nhưng không kém phần tinh tế cho sản phẩm! * Kích thước: đường kính miệng bình là 12 cm x cao 25 cm. * Tùy vào các size khác nhau thì loại hoa và số lượng hoa sẽ thay đổi phù hợp.',1519907888635),(5,'Love 8',600000,12,'Hoa hồng tím, Hoa hồng trắng, Cẩm tú cầu, Hoa lá phụ, Lọ thủy tinh (không bao gòm phụ kiện)','Là sự kết hợp tinh tế giữ Hoa Chuông trắng và các phụ liệu, tạo nên sự nhẹ nhàng nhưng không kém phần tinh tế cho sản phẩm! * Kích thước: đường kính miệng bình là 12 cm x cao 25 cm. * Tùy vào các size khác nhau thì loại hoa và số lượng hoa sẽ thay đổi phù hợp.',1519907888635),(6,'Love 9',800000,13,'Hoa hồng tím, Hoa hồng vàng, Hoa lan tường, Baby, Hoa lá phụ, Hộp gỗ cao cấp (socola order)','Là sự kết hợp tinh tế giữ Hoa Chuông trắng và các phụ liệu, tạo nên sự nhẹ nhàng nhưng không kém phần tinh tế cho sản phẩm! * Kích thước: đường kính miệng bình là 12 cm x cao 25 cm. * Tùy vào các size khác nhau thì loại hoa và số lượng hoa sẽ thay đổi phù hợp.',1519907888635),(7,'Love 10',800000,0,NULL,'Là sự kết hợp tinh tế giữ Hoa Chuông trắng và các phụ liệu, tạo nên sự nhẹ nhàng nhưng không kém phần tinh tế cho sản phẩm! * Kích thước: đường kính miệng bình là 12 cm x cao 25 cm. * Tùy vào các size khác nhau thì loại hoa và số lượng hoa sẽ thay đổi phù hợp.',1519907888635),(8,'B0002',1000000,0,NULL,'Là sự kết hợp tinh tế giữ Hoa Chuông trắng và các phụ liệu, tạo nên sự nhẹ nhàng nhưng không kém phần tinh tế cho sản phẩm! * Kích thước: đường kính miệng bình là 12 cm x cao 25 cm. * Tùy vào các size khác nhau thì loại hoa và số lượng hoa sẽ thay đổi phù hợp.',1519907888635),(9,'B0003',2000000,0,NULL,'Là sự kết hợp tinh tế giữ Hoa Chuông trắng và các phụ liệu, tạo nên sự nhẹ nhàng nhưng không kém phần tinh tế cho sản phẩm! * Kích thước: đường kính miệng bình là 12 cm x cao 25 cm. * Tùy vào các size khác nhau thì loại hoa và số lượng hoa sẽ thay đổi phù hợp.',1519907888635),(10,'B0004',1000000,0,NULL,'Là sự kết hợp tinh tế giữ Hoa Chuông trắng và các phụ liệu, tạo nên sự nhẹ nhàng nhưng không kém phần tinh tế cho sản phẩm! * Kích thước: đường kính miệng bình là 12 cm x cao 25 cm. * Tùy vào các size khác nhau thì loại hoa và số lượng hoa sẽ thay đổi phù hợp.',1519907888635),(11,'B0005',1000000,0,NULL,'Là sự kết hợp tinh tế giữ Hoa Chuông trắng và các phụ liệu, tạo nên sự nhẹ nhàng nhưng không kém phần tinh tế cho sản phẩm! * Kích thước: đường kính miệng bình là 12 cm x cao 25 cm. * Tùy vào các size khác nhau thì loại hoa và số lượng hoa sẽ thay đổi phù hợp.',1519907888635),(12,'B0006',1000000,0,NULL,'Là sự kết hợp tinh tế giữ Hoa Chuông trắng và các phụ liệu, tạo nên sự nhẹ nhàng nhưng không kém phần tinh tế cho sản phẩm! * Kích thước: đường kính miệng bình là 12 cm x cao 25 cm. * Tùy vào các size khác nhau thì loại hoa và số lượng hoa sẽ thay đổi phù hợp.',1519907888635),(13,'B0007',1000000,0,NULL,'Là sự kết hợp tinh tế giữ Hoa Chuông trắng và các phụ liệu, tạo nên sự nhẹ nhàng nhưng không kém phần tinh tế cho sản phẩm! * Kích thước: đường kính miệng bình là 12 cm x cao 25 cm. * Tùy vào các size khác nhau thì loại hoa và số lượng hoa sẽ thay đổi phù hợp.',1519907888635),(14,'B0008',1000000,0,NULL,'Là sự kết hợp tinh tế giữ Hoa Chuông trắng và các phụ liệu, tạo nên sự nhẹ nhàng nhưng không kém phần tinh tế cho sản phẩm! * Kích thước: đường kính miệng bình là 12 cm x cao 25 cm. * Tùy vào các size khác nhau thì loại hoa và số lượng hoa sẽ thay đổi phù hợp.',1519907888635),(15,'B0009',1000000,0,NULL,'Là sự kết hợp tinh tế giữ Hoa Chuông trắng và các phụ liệu, tạo nên sự nhẹ nhàng nhưng không kém phần tinh tế cho sản phẩm! * Kích thước: đường kính miệng bình là 12 cm x cao 25 cm. * Tùy vào các size khác nhau thì loại hoa và số lượng hoa sẽ thay đổi phù hợp.',1519907888635),(16,'B0010',1000000,0,NULL,'Là sự kết hợp tinh tế giữ Hoa Chuông trắng và các phụ liệu, tạo nên sự nhẹ nhàng nhưng không kém phần tinh tế cho sản phẩm! * Kích thước: đường kính miệng bình là 12 cm x cao 25 cm. * Tùy vào các size khác nhau thì loại hoa và số lượng hoa sẽ thay đổi phù hợp.',1519907888635),(17,'C0001',1000000,0,NULL,'Là sự kết hợp tinh tế giữ Hoa Chuông trắng và các phụ liệu, tạo nên sự nhẹ nhàng nhưng không kém phần tinh tế cho sản phẩm! * Kích thước: đường kính miệng bình là 12 cm x cao 25 cm. * Tùy vào các size khác nhau thì loại hoa và số lượng hoa sẽ thay đổi phù hợp.',1519907888635),(18,'C0002',1000000,0,NULL,'Là sự kết hợp tinh tế giữ Hoa Chuông trắng và các phụ liệu, tạo nên sự nhẹ nhàng nhưng không kém phần tinh tế cho sản phẩm! * Kích thước: đường kính miệng bình là 12 cm x cao 25 cm. * Tùy vào các size khác nhau thì loại hoa và số lượng hoa sẽ thay đổi phù hợp.',1519907888635),(19,'C0003',1000000,0,NULL,'Là sự kết hợp tinh tế giữ Hoa Chuông trắng và các phụ liệu, tạo nên sự nhẹ nhàng nhưng không kém phần tinh tế cho sản phẩm! * Kích thước: đường kính miệng bình là 12 cm x cao 25 cm. * Tùy vào các size khác nhau thì loại hoa và số lượng hoa sẽ thay đổi phù hợp.',1519907888635),(20,'C0004',1000000,0,NULL,'Là sự kết hợp tinh tế giữ Hoa Chuông trắng và các phụ liệu, tạo nên sự nhẹ nhàng nhưng không kém phần tinh tế cho sản phẩm! * Kích thước: đường kính miệng bình là 12 cm x cao 25 cm. * Tùy vào các size khác nhau thì loại hoa và số lượng hoa sẽ thay đổi phù hợp.',1519907888635),(21,'C0005',1000000,0,NULL,'Là sự kết hợp tinh tế giữ Hoa Chuông trắng và các phụ liệu, tạo nên sự nhẹ nhàng nhưng không kém phần tinh tế cho sản phẩm! * Kích thước: đường kính miệng bình là 12 cm x cao 25 cm. * Tùy vào các size khác nhau thì loại hoa và số lượng hoa sẽ thay đổi phù hợp.',1519907888635),(22,'C0006',1000000,0,NULL,'Là sự kết hợp tinh tế giữ Hoa Chuông trắng và các phụ liệu, tạo nên sự nhẹ nhàng nhưng không kém phần tinh tế cho sản phẩm! * Kích thước: đường kính miệng bình là 12 cm x cao 25 cm. * Tùy vào các size khác nhau thì loại hoa và số lượng hoa sẽ thay đổi phù hợp.',1519907888635),(23,'C0007',1000000,0,NULL,'Là sự kết hợp tinh tế giữ Hoa Chuông trắng và các phụ liệu, tạo nên sự nhẹ nhàng nhưng không kém phần tinh tế cho sản phẩm! * Kích thước: đường kính miệng bình là 12 cm x cao 25 cm. * Tùy vào các size khác nhau thì loại hoa và số lượng hoa sẽ thay đổi phù hợp.',1519907888635),(24,'C0008',1000000,0,NULL,'Là sự kết hợp tinh tế giữ Hoa Chuông trắng và các phụ liệu, tạo nên sự nhẹ nhàng nhưng không kém phần tinh tế cho sản phẩm! * Kích thước: đường kính miệng bình là 12 cm x cao 25 cm. * Tùy vào các size khác nhau thì loại hoa và số lượng hoa sẽ thay đổi phù hợp.',1519907888635),(25,'C0009',1000000,0,NULL,'Là sự kết hợp tinh tế giữ Hoa Chuông trắng và các phụ liệu, tạo nên sự nhẹ nhàng nhưng không kém phần tinh tế cho sản phẩm! * Kích thước: đường kính miệng bình là 12 cm x cao 25 cm. * Tùy vào các size khác nhau thì loại hoa và số lượng hoa sẽ thay đổi phù hợp.',1519907888635),(26,'C0010',1000000,0,NULL,'Là sự kết hợp tinh tế giữ Hoa Chuông trắng và các phụ liệu, tạo nên sự nhẹ nhàng nhưng không kém phần tinh tế cho sản phẩm! * Kích thước: đường kính miệng bình là 12 cm x cao 25 cm. * Tùy vào các size khác nhau thì loại hoa và số lượng hoa sẽ thay đổi phù hợp.',1519907888635),(27,'X0001',1500000,0,NULL,'Là sự kết hợp tinh tế giữ Hoa Chuông trắng và các phụ liệu, tạo nên sự nhẹ nhàng nhưng không kém phần tinh tế cho sản phẩm! * Kích thước: đường kính miệng bình là 12 cm x cao 25 cm. * Tùy vào các size khác nhau thì loại hoa và số lượng hoa sẽ thay đổi phù hợp.',1519907888635),(28,'X0002',1500000,0,NULL,'Là sự kết hợp tinh tế giữ Hoa Chuông trắng và các phụ liệu, tạo nên sự nhẹ nhàng nhưng không kém phần tinh tế cho sản phẩm! * Kích thước: đường kính miệng bình là 12 cm x cao 25 cm. * Tùy vào các size khác nhau thì loại hoa và số lượng hoa sẽ thay đổi phù hợp.',1519907888635),(29,'X0003',1500000,0,NULL,'Là sự kết hợp tinh tế giữ Hoa Chuông trắng và các phụ liệu, tạo nên sự nhẹ nhàng nhưng không kém phần tinh tế cho sản phẩm! * Kích thước: đường kính miệng bình là 12 cm x cao 25 cm. * Tùy vào các size khác nhau thì loại hoa và số lượng hoa sẽ thay đổi phù hợp.',1519907888635),(30,'X0004',1500000,0,NULL,'Là sự kết hợp tinh tế giữ Hoa Chuông trắng và các phụ liệu, tạo nên sự nhẹ nhàng nhưng không kém phần tinh tế cho sản phẩm! * Kích thước: đường kính miệng bình là 12 cm x cao 25 cm. * Tùy vào các size khác nhau thì loại hoa và số lượng hoa sẽ thay đổi phù hợp.',1519907888635),(31,'X0005',1500000,0,NULL,'Là sự kết hợp tinh tế giữ Hoa Chuông trắng và các phụ liệu, tạo nên sự nhẹ nhàng nhưng không kém phần tinh tế cho sản phẩm! * Kích thước: đường kính miệng bình là 12 cm x cao 25 cm. * Tùy vào các size khác nhau thì loại hoa và số lượng hoa sẽ thay đổi phù hợp.',1519907888635),(32,'X0006',1500000,0,NULL,'Là sự kết hợp tinh tế giữ Hoa Chuông trắng và các phụ liệu, tạo nên sự nhẹ nhàng nhưng không kém phần tinh tế cho sản phẩm! * Kích thước: đường kính miệng bình là 12 cm x cao 25 cm. * Tùy vào các size khác nhau thì loại hoa và số lượng hoa sẽ thay đổi phù hợp.',1519907888635),(33,'X0007',1500000,0,NULL,'Là sự kết hợp tinh tế giữ Hoa Chuông trắng và các phụ liệu, tạo nên sự nhẹ nhàng nhưng không kém phần tinh tế cho sản phẩm! * Kích thước: đường kính miệng bình là 12 cm x cao 25 cm. * Tùy vào các size khác nhau thì loại hoa và số lượng hoa sẽ thay đổi phù hợp.',1519907888635),(34,'X0008',1500000,0,NULL,'Là sự kết hợp tinh tế giữ Hoa Chuông trắng và các phụ liệu, tạo nên sự nhẹ nhàng nhưng không kém phần tinh tế cho sản phẩm! * Kích thước: đường kính miệng bình là 12 cm x cao 25 cm. * Tùy vào các size khác nhau thì loại hoa và số lượng hoa sẽ thay đổi phù hợp.',1519907888635),(35,'Love 1',600000,0,NULL,'Là sự kết hợp tinh tế giữ Hoa Chuông trắng và các phụ liệu, tạo nên sự nhẹ nhàng nhưng không kém phần tinh tế cho sản phẩm! * Kích thước: đường kính miệng bình là 12 cm x cao 25 cm. * Tùy vào các size khác nhau thì loại hoa và số lượng hoa sẽ thay đổi phù hợp.',1519907888635),(36,'Love 2',600000,0,NULL,'Là sự kết hợp tinh tế giữ Hoa Chuông trắng và các phụ liệu, tạo nên sự nhẹ nhàng nhưng không kém phần tinh tế cho sản phẩm! * Kích thước: đường kính miệng bình là 12 cm x cao 25 cm. * Tùy vào các size khác nhau thì loại hoa và số lượng hoa sẽ thay đổi phù hợp.',1519907888635),(37,'Love 3',600000,0,NULL,'Là sự kết hợp tinh tế giữ Hoa Chuông trắng và các phụ liệu, tạo nên sự nhẹ nhàng nhưng không kém phần tinh tế cho sản phẩm! * Kích thước: đường kính miệng bình là 12 cm x cao 25 cm. * Tùy vào các size khác nhau thì loại hoa và số lượng hoa sẽ thay đổi phù hợp.',1519907888635),(38,'Love 5',600000,0,NULL,'Là sự kết hợp tinh tế giữ Hoa Chuông trắng và các phụ liệu, tạo nên sự nhẹ nhàng nhưng không kém phần tinh tế cho sản phẩm! * Kích thước: đường kính miệng bình là 12 cm x cao 25 cm. * Tùy vào các size khác nhau thì loại hoa và số lượng hoa sẽ thay đổi phù hợp.',1519907888635),(39,'HH0001',800000,0,NULL,'Là sự kết hợp tinh tế giữ Hoa Chuông trắng và các phụ liệu, tạo nên sự nhẹ nhàng nhưng không kém phần tinh tế cho sản phẩm! * Kích thước: đường kính miệng bình là 12 cm x cao 25 cm. * Tùy vào các size khác nhau thì loại hoa và số lượng hoa sẽ thay đổi phù hợp.',1519907888635),(40,'HH0002',600000,0,NULL,'Là sự kết hợp tinh tế giữ Hoa Chuông trắng và các phụ liệu, tạo nên sự nhẹ nhàng nhưng không kém phần tinh tế cho sản phẩm! * Kích thước: đường kính miệng bình là 12 cm x cao 25 cm. * Tùy vào các size khác nhau thì loại hoa và số lượng hoa sẽ thay đổi phù hợp.',1519907888635),(41,'HH0003',500000,0,NULL,'Là sự kết hợp tinh tế giữ Hoa Chuông trắng và các phụ liệu, tạo nên sự nhẹ nhàng nhưng không kém phần tinh tế cho sản phẩm! * Kích thước: đường kính miệng bình là 12 cm x cao 25 cm. * Tùy vào các size khác nhau thì loại hoa và số lượng hoa sẽ thay đổi phù hợp.',1519907888635),(42,'HH0004',400000,0,NULL,'Là sự kết hợp tinh tế giữ Hoa Chuông trắng và các phụ liệu, tạo nên sự nhẹ nhàng nhưng không kém phần tinh tế cho sản phẩm! * Kích thước: đường kính miệng bình là 12 cm x cao 25 cm. * Tùy vào các size khác nhau thì loại hoa và số lượng hoa sẽ thay đổi phù hợp.',1519907888635),(43,'HH0005',500000,0,NULL,'Là sự kết hợp tinh tế giữ Hoa Chuông trắng và các phụ liệu, tạo nên sự nhẹ nhàng nhưng không kém phần tinh tế cho sản phẩm! * Kích thước: đường kính miệng bình là 12 cm x cao 25 cm. * Tùy vào các size khác nhau thì loại hoa và số lượng hoa sẽ thay đổi phù hợp.',1519907888635),(44,'HH0006',700000,0,NULL,'Là sự kết hợp tinh tế giữ Hoa Chuông trắng và các phụ liệu, tạo nên sự nhẹ nhàng nhưng không kém phần tinh tế cho sản phẩm! * Kích thước: đường kính miệng bình là 12 cm x cao 25 cm. * Tùy vào các size khác nhau thì loại hoa và số lượng hoa sẽ thay đổi phù hợp.',1519907888635),(45,'HH0007',800000,0,NULL,'Là sự kết hợp tinh tế giữ Hoa Chuông trắng và các phụ liệu, tạo nên sự nhẹ nhàng nhưng không kém phần tinh tế cho sản phẩm! * Kích thước: đường kính miệng bình là 12 cm x cao 25 cm. * Tùy vào các size khác nhau thì loại hoa và số lượng hoa sẽ thay đổi phù hợp.',1519907888635),(46,'HH0008',600000,0,NULL,'Là sự kết hợp tinh tế giữ Hoa Chuông trắng và các phụ liệu, tạo nên sự nhẹ nhàng nhưng không kém phần tinh tế cho sản phẩm! * Kích thước: đường kính miệng bình là 12 cm x cao 25 cm. * Tùy vào các size khác nhau thì loại hoa và số lượng hoa sẽ thay đổi phù hợp.',1519907888635),(47,'HH0009',600000,0,NULL,'Là sự kết hợp tinh tế giữ Hoa Chuông trắng và các phụ liệu, tạo nên sự nhẹ nhàng nhưng không kém phần tinh tế cho sản phẩm! * Kích thước: đường kính miệng bình là 12 cm x cao 25 cm. * Tùy vào các size khác nhau thì loại hoa và số lượng hoa sẽ thay đổi phù hợp.',1519907888635),(48,'LH0001',1000000,0,NULL,'Là sự kết hợp tinh tế giữ Hoa Chuông trắng và các phụ liệu, tạo nên sự nhẹ nhàng nhưng không kém phần tinh tế cho sản phẩm! * Kích thước: đường kính miệng bình là 12 cm x cao 25 cm. * Tùy vào các size khác nhau thì loại hoa và số lượng hoa sẽ thay đổi phù hợp.',1519907888635),(49,'LH0002',700000,0,NULL,'Là sự kết hợp tinh tế giữ Hoa Chuông trắng và các phụ liệu, tạo nên sự nhẹ nhàng nhưng không kém phần tinh tế cho sản phẩm! * Kích thước: đường kính miệng bình là 12 cm x cao 25 cm. * Tùy vào các size khác nhau thì loại hoa và số lượng hoa sẽ thay đổi phù hợp.',1519907888635),(50,'LH0003',100000,0,NULL,'Là sự kết hợp tinh tế giữ Hoa Chuông trắng và các phụ liệu, tạo nên sự nhẹ nhàng nhưng không kém phần tinh tế cho sản phẩm! * Kích thước: đường kính miệng bình là 12 cm x cao 25 cm. * Tùy vào các size khác nhau thì loại hoa và số lượng hoa sẽ thay đổi phù hợp.',1519907888635),(51,'LH0004',1000000,0,NULL,'Là sự kết hợp tinh tế giữ Hoa Chuông trắng và các phụ liệu, tạo nên sự nhẹ nhàng nhưng không kém phần tinh tế cho sản phẩm! * Kích thước: đường kính miệng bình là 12 cm x cao 25 cm. * Tùy vào các size khác nhau thì loại hoa và số lượng hoa sẽ thay đổi phù hợp.',1519907888635),(52,'LH0005',600000,0,NULL,'Là sự kết hợp tinh tế giữ Hoa Chuông trắng và các phụ liệu, tạo nên sự nhẹ nhàng nhưng không kém phần tinh tế cho sản phẩm! * Kích thước: đường kính miệng bình là 12 cm x cao 25 cm. * Tùy vào các size khác nhau thì loại hoa và số lượng hoa sẽ thay đổi phù hợp.',1519907888635),(53,'LH0007',800000,0,NULL,'Là sự kết hợp tinh tế giữ Hoa Chuông trắng và các phụ liệu, tạo nên sự nhẹ nhàng nhưng không kém phần tinh tế cho sản phẩm! * Kích thước: đường kính miệng bình là 12 cm x cao 25 cm. * Tùy vào các size khác nhau thì loại hoa và số lượng hoa sẽ thay đổi phù hợp.',1519907888635),(54,'LH0008',800000,0,NULL,'Là sự kết hợp tinh tế giữ Hoa Chuông trắng và các phụ liệu, tạo nên sự nhẹ nhàng nhưng không kém phần tinh tế cho sản phẩm! * Kích thước: đường kính miệng bình là 12 cm x cao 25 cm. * Tùy vào các size khác nhau thì loại hoa và số lượng hoa sẽ thay đổi phù hợp.',1519907888635),(55,'LH0009',1500000,0,NULL,'Là sự kết hợp tinh tế giữ Hoa Chuông trắng và các phụ liệu, tạo nên sự nhẹ nhàng nhưng không kém phần tinh tế cho sản phẩm! * Kích thước: đường kính miệng bình là 12 cm x cao 25 cm. * Tùy vào các size khác nhau thì loại hoa và số lượng hoa sẽ thay đổi phù hợp.',1519907888635),(56,'LH0010',1500000,0,NULL,'Là sự kết hợp tinh tế giữ Hoa Chuông trắng và các phụ liệu, tạo nên sự nhẹ nhàng nhưng không kém phần tinh tế cho sản phẩm! * Kích thước: đường kính miệng bình là 12 cm x cao 25 cm. * Tùy vào các size khác nhau thì loại hoa và số lượng hoa sẽ thay đổi phù hợp.',1519907888635),(57,'LH0011',600000,0,NULL,'Là sự kết hợp tinh tế giữ Hoa Chuông trắng và các phụ liệu, tạo nên sự nhẹ nhàng nhưng không kém phần tinh tế cho sản phẩm! * Kích thước: đường kính miệng bình là 12 cm x cao 25 cm. * Tùy vào các size khác nhau thì loại hoa và số lượng hoa sẽ thay đổi phù hợp.',1519907888635),(58,'L0001',1000000,0,NULL,'Là sự kết hợp tinh tế giữ Hoa Chuông trắng và các phụ liệu, tạo nên sự nhẹ nhàng nhưng không kém phần tinh tế cho sản phẩm! * Kích thước: đường kính miệng bình là 12 cm x cao 25 cm. * Tùy vào các size khác nhau thì loại hoa và số lượng hoa sẽ thay đổi phù hợp.',1519907888635),(59,'L0002',1500000,0,NULL,'Là sự kết hợp tinh tế giữ Hoa Chuông trắng và các phụ liệu, tạo nên sự nhẹ nhàng nhưng không kém phần tinh tế cho sản phẩm! * Kích thước: đường kính miệng bình là 12 cm x cao 25 cm. * Tùy vào các size khác nhau thì loại hoa và số lượng hoa sẽ thay đổi phù hợp.',1519907888635),(60,'L0003',1000000,0,NULL,'Là sự kết hợp tinh tế giữ Hoa Chuông trắng và các phụ liệu, tạo nên sự nhẹ nhàng nhưng không kém phần tinh tế cho sản phẩm! * Kích thước: đường kính miệng bình là 12 cm x cao 25 cm. * Tùy vào các size khác nhau thì loại hoa và số lượng hoa sẽ thay đổi phù hợp.',1519907888635),(61,'L0004',2000000,0,NULL,'Là sự kết hợp tinh tế giữ Hoa Chuông trắng và các phụ liệu, tạo nên sự nhẹ nhàng nhưng không kém phần tinh tế cho sản phẩm! * Kích thước: đường kính miệng bình là 12 cm x cao 25 cm. * Tùy vào các size khác nhau thì loại hoa và số lượng hoa sẽ thay đổi phù hợp.',1519907888635),(62,'L0005',7000000,0,NULL,'Là sự kết hợp tinh tế giữ Hoa Chuông trắng và các phụ liệu, tạo nên sự nhẹ nhàng nhưng không kém phần tinh tế cho sản phẩm! * Kích thước: đường kính miệng bình là 12 cm x cao 25 cm. * Tùy vào các size khác nhau thì loại hoa và số lượng hoa sẽ thay đổi phù hợp.',1519907888635),(63,'L0006',1500000,0,NULL,'Là sự kết hợp tinh tế giữ Hoa Chuông trắng và các phụ liệu, tạo nên sự nhẹ nhàng nhưng không kém phần tinh tế cho sản phẩm! * Kích thước: đường kính miệng bình là 12 cm x cao 25 cm. * Tùy vào các size khác nhau thì loại hoa và số lượng hoa sẽ thay đổi phù hợp.',1519907888635),(64,'L0007',800000,0,NULL,'Là sự kết hợp tinh tế giữ Hoa Chuông trắng và các phụ liệu, tạo nên sự nhẹ nhàng nhưng không kém phần tinh tế cho sản phẩm! * Kích thước: đường kính miệng bình là 12 cm x cao 25 cm. * Tùy vào các size khác nhau thì loại hoa và số lượng hoa sẽ thay đổi phù hợp.',1519907888635),(65,'L0008',1800000,0,NULL,'Là sự kết hợp tinh tế giữ Hoa Chuông trắng và các phụ liệu, tạo nên sự nhẹ nhàng nhưng không kém phần tinh tế cho sản phẩm! * Kích thước: đường kính miệng bình là 12 cm x cao 25 cm. * Tùy vào các size khác nhau thì loại hoa và số lượng hoa sẽ thay đổi phù hợp.',1519907888635),(66,'HH0010',600000,0,NULL,'Là sự kết hợp tinh tế giữ Hoa Chuông trắng và các phụ liệu, tạo nên sự nhẹ nhàng nhưng không kém phần tinh tế cho sản phẩm! * Kích thước: đường kính miệng bình là 12 cm x cao 25 cm. * Tùy vào các size khác nhau thì loại hoa và số lượng hoa sẽ thay đổi phù hợp.',1519907888635),(67,'asdasd',123123,0,'123123','123123',1520172969070);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Product_Category_Product` (`product_id`),
  KEY `FK_Product_Category_Category` (`category_id`),
  CONSTRAINT `FK_Product_Category_Category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Product_Category_Product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category`
--

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
INSERT INTO `product_category` VALUES (7,5,2),(8,5,3),(9,5,4),(10,5,5),(11,5,6),(12,5,7),(13,1,8),(14,1,9),(15,1,10),(16,1,11),(17,1,12),(18,1,13),(19,1,14),(20,1,15),(21,1,16),(22,6,17),(23,6,18),(24,6,19),(25,6,20),(26,6,21),(27,6,22),(28,6,23),(29,6,24),(30,6,25),(31,6,26),(32,6,27),(33,6,28),(34,6,29),(35,6,30),(36,6,31),(37,6,32),(38,6,33),(39,6,34),(40,5,35),(41,5,36),(42,5,37),(43,5,38),(44,2,39),(45,2,40),(46,2,41),(47,2,42),(48,2,43),(49,2,44),(50,2,45),(51,2,46),(52,2,47),(53,3,48),(54,3,49),(55,3,50),(56,3,51),(57,3,52),(58,3,53),(59,3,54),(60,3,55),(61,3,56),(62,3,1),(63,4,58),(64,4,59),(65,4,60),(66,4,61),(67,4,62),(68,4,63),(69,4,64),(70,4,1);
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productdetail`
--

DROP TABLE IF EXISTS `productdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productdetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `link_image` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ProductDetail_Product` (`product_id`),
  CONSTRAINT `FK_ProductDetail_Product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productdetail`
--

LOCK TABLES `productdetail` WRITE;
/*!40000 ALTER TABLE `productdetail` DISABLE KEYS */;
INSERT INTO `productdetail` VALUES (1,1,'images/bo-hoa/B0001.jpg'),(2,2,'images/hoa-tinh-yeu/Love-4.jpg'),(3,3,'images/hoa-tinh-yeu/Love-6.jpg'),(4,4,'images/hoa-tinh-yeu/Love-7.jpg'),(5,5,'images/hoa-tinh-yeu/Love-8.jpg'),(6,6,'images/hoa-tinh-yeu/Love-9.jpg'),(7,7,'images/hoa-tinh-yeu/Love-10.jpg'),(8,8,'images/bo-hoa/B0002.jpg'),(9,9,'images/bo-hoa/B0003.jpg'),(10,10,'images/bo-hoa/B0004.jpg'),(11,11,'images/bo-hoa/B0005.jpg'),(12,12,'images/bo-hoa/B0006.jpg'),(13,13,'images/bo-hoa/B0007.jpg'),(14,14,'images/bo-hoa/B0008.jpg'),(15,15,'images/bo-hoa/B0009.jpg'),(16,16,'images/bo-hoa/B0010.jpg'),(17,17,'images/hoa-cuoi/C0001.jpg'),(18,18,'images/hoa-cuoi/C0002.jpg'),(19,19,'images/hoa-cuoi/C0003.jpg'),(20,20,'images/hoa-cuoi/C0004.jpg'),(21,21,'images/hoa-cuoi/C0005.jpg'),(22,22,'images/hoa-cuoi/C0006.jpg'),(23,23,'images/hoa-cuoi/C0007.jpg'),(24,24,'images/hoa-cuoi/C0008.jpg'),(25,25,'images/hoa-cuoi/C0009.jpg'),(26,26,'images/hoa-cuoi/C010.jpg'),(27,27,'images/hoa-cuoi/X0001.jpg'),(28,28,'images/hoa-cuoi/X0002.jpg'),(29,29,'images/hoa-cuoi/X0003.jpg'),(30,30,'images/hoa-cuoi/X0004.jpg'),(31,31,'images/hoa-cuoi/X0005.jpg'),(32,32,'images/hoa-cuoi/X0006.jpg'),(33,33,'images/hoa-cuoi/X0007.jpg'),(34,34,'images/hoa-cuoi/X0008.jpg'),(35,35,'images/hoa-tinh-yeu/Love-1.jpg'),(36,36,'images/hoa-tinh-yeu/Love-2.jpg'),(37,37,'images/hoa-tinh-yeu/Love-3.jpg'),(38,38,'images/hoa-tinh-yeu/Love-5.jpg'),(39,39,'images/hop-hoa/HH0001.jpg'),(40,40,'images/hop-hoa/HH0002.jpg'),(41,41,'images/hop-hoa/HH0003.jpg'),(42,42,'images/hop-hoa/HH0004.jpg'),(43,43,'images/hop-hoa/HH0005.jpg'),(44,44,'images/hop-hoa/HH0006.jpg'),(45,45,'images/hop-hoa/HH0007.jpg'),(46,46,'images/hop-hoa/HH0008.jpg'),(47,47,'images/hop-hoa/HH0009.jpg'),(48,48,'images/lang-hoa-chuc-mung/LH0001.jpg'),(49,49,'images/lang-hoa-chuc-mung/LH0002.jpg'),(50,50,'images/lang-hoa-chuc-mung/LH0003.jpg'),(51,51,'images/lang-hoa-chuc-mung/LH0004.jpg'),(52,52,'images/lang-hoa-chuc-mung/LH0005.jpg'),(53,53,'images/lang-hoa-chuc-mung/LH0006.jpg'),(54,54,'images/lang-hoa-chuc-mung/LH0007.jpg'),(55,55,'images/lang-hoa-chuc-mung/LH0008.jpg'),(56,56,'images/lang-hoa-chuc-mung/LH0009.jpg'),(57,57,'images/lang-hoa-chuc-mung/LH0010.jpg'),(58,58,'images/lo-hoa-chuc-mung/L0001.jpg'),(59,59,'images/lo-hoa-chuc-mung/L0002.jpg'),(60,60,'images/lo-hoa-chuc-mung/L0003.jpg'),(61,61,'images/lo-hoa-chuc-mung/L0004.jpg'),(62,62,'images/lo-hoa-chuc-mung/L0005.jpg'),(63,63,'images/lo-hoa-chuc-mung/L0006.jpg'),(64,64,'images/lo-hoa-chuc-mung/L0007.jpg'),(65,65,'images/lo-hoa-chuc-mung/L0008.jpg'),(66,66,'images/hop-hoa/HH0010.jpg'),(67,5,'images/de-ban/db1.jpg'),(68,2,'images/de-ban/db1.jpg'),(69,3,'images/de-ban/db1.jpg'),(70,4,'images/de-ban/db1.jpg'),(71,5,'images/de-ban/db2.jpg'),(72,2,'images/de-ban/db2.jpg'),(73,3,'images/de-ban/db2.jpg'),(74,4,'images/de-ban/db2.jpg'),(75,5,'images/de-ban/db3.jpg'),(76,2,'images/de-ban/db3.jpg'),(77,3,'images/de-ban/db3.jpg'),(78,4,'images/de-ban/db3.jpg'),(79,5,'images/de-ban/db4.jpg'),(80,2,'images/de-ban/db4.jpg'),(81,3,'images/de-ban/db4.jpg'),(82,4,'images/de-ban/db4.jpg');
/*!40000 ALTER TABLE `productdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'Chưa giao hàng'),(2,'Đang giao hàng'),(3,'Đã giao hàng'),(4,'Đơn hàng bị hủy');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(1000) DEFAULT NULL,
  `email` varchar(1000) DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `dob` varchar(50) DEFAULT NULL,
  `gender` varchar(10) CHARACTER SET utf8mb4 DEFAULT NULL,
  `address` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `role` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'tudv','123456','dovantu1996@gmail.com','Đỗ Văn Tú','05-08-1996',NULL,'Yên viên-Gia Lâm-HN','01657183643',0),(2,'admin','admin',NULL,NULL,NULL,NULL,NULL,NULL,1),(13,NULL,NULL,'asdasd','asdasd',NULL,NULL,'asdasda','2342342',0),(14,NULL,NULL,'asdads@gmail.com','Nguyễn văn A',NULL,NULL,'asdasd','6545465464',0),(15,NULL,NULL,'luuhoaianh.tb@gmail.com','asdkashd',NULL,NULL,'236 Hoàng quốc việt','726348762384',0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-11 17:29:20
