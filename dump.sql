-- MySQL dump 10.13  Distrib 5.7.18, for macos10.12 (x86_64)
--
-- Host: 127.0.0.1    Database: lemarket
-- ------------------------------------------------------
-- Server version	5.7.18

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
-- Table structure for table `Address`
--

DROP TABLE IF EXISTS `Address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Address` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '地址id',
  `user` int(11) NOT NULL COMMENT '用户id',
  `name` varchar(50) NOT NULL COMMENT '收货人姓名',
  `phoneNumber` varchar(11) NOT NULL COMMENT '手机号',
  `address` text NOT NULL COMMENT '收货地址',
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `user` (`user`),
  CONSTRAINT `address_ibfk_1` FOREIGN KEY (`user`) REFERENCES `Users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='收货地址表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Address`
--

LOCK TABLES `Address` WRITE;
INSERT INTO `Address` (`id`, `user`, `name`, `phoneNumber`, `address`, `status`) VALUES (1,7,'张昶','13026133586','湖北省武汉市华中师范大学',1),(2,6,'test','13026133586','湖北省武汉市华中师范大学',1),(3,7,'test','123456','test',1),(4,7,'test','123456','address',1),(5,7,'test','123456','123456',0),(6,10,'张昶','13026133586','华中师范大学',0),(7,10,'张昶','123456','test',1);
UNLOCK TABLES;

--
-- Table structure for table `Admin`
--

DROP TABLE IF EXISTS `Admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `username` varchar(20) NOT NULL COMMENT '用户名',
  `password` varchar(32) NOT NULL COMMENT '密码(md5+salt)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Admin`
--

LOCK TABLES `Admin` WRITE;
INSERT INTO `Admin` (`id`, `username`, `password`) VALUES (1,'admin','123456');
UNLOCK TABLES;

--
-- Table structure for table `Category`
--

DROP TABLE IF EXISTS `Category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `name` varchar(20) NOT NULL COMMENT '分类名称',
  `description` text NOT NULL COMMENT '分类描述',
  `picture` int(11) NOT NULL COMMENT '分类图片',
  `parent` int(11) DEFAULT NULL COMMENT '父分类',
  PRIMARY KEY (`id`),
  KEY `picture` (`picture`),
  KEY `parent` (`parent`),
  CONSTRAINT `Category_ibfk_1` FOREIGN KEY (`picture`) REFERENCES `Picture` (`id`),
  CONSTRAINT `Category_ibfk_2` FOREIGN KEY (`parent`) REFERENCES `Category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Category`
--

LOCK TABLES `Category` WRITE;
INSERT INTO `Category` (`id`, `name`, `description`, `picture`, `parent`) VALUES (1,'时尚女装','女装',1,NULL),(2,'潮流男装','男装',2,NULL),(3,'时尚女鞋','女鞋',3,NULL),(4,'潮流包包','包包',4,NULL),(5,'儿童世界','童装',5,NULL);
UNLOCK TABLES;

--
-- Table structure for table `Comment`
--

DROP TABLE IF EXISTS `Comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `commodity` int(11) NOT NULL COMMENT '商品id',
  `user` int(11) NOT NULL COMMENT '用户id',
  `time` datetime NOT NULL COMMENT '评论时间',
  `content` text NOT NULL COMMENT '评论内容',
  PRIMARY KEY (`id`),
  KEY `commodity` (`commodity`),
  CONSTRAINT `Comment_ibfk_1` FOREIGN KEY (`commodity`) REFERENCES `Commodity` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comment`
--

LOCK TABLES `Comment` WRITE;
INSERT INTO `Comment` (`id`, `commodity`, `user`, `time`, `content`) VALUES (1,3,2,'2017-07-04 14:27:10','很不错'),(2,3,4,'2017-07-04 14:27:29','精彩绝伦');
UNLOCK TABLES;

--
-- Table structure for table `Commodity`
--

DROP TABLE IF EXISTS `Commodity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Commodity` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `owner` int(11) NOT NULL COMMENT '店主id',
  `shop` int(11) NOT NULL COMMENT '店铺id',
  `name` varchar(100) NOT NULL COMMENT '商品名称',
  `details` text COMMENT '商品详情',
  `category` int(11) NOT NULL COMMENT '商品分类',
  `storage` int(11) NOT NULL COMMENT '商品库存',
  `saled` int(11) DEFAULT '0' COMMENT '商品销量',
  `price` float NOT NULL COMMENT '商品价格',
  `image` int(11) NOT NULL DEFAULT '1' COMMENT '商品图片地址',
  `visitCount` int(11) DEFAULT '0' COMMENT '商品浏览量',
  `status` int(11) DEFAULT '1' COMMENT '商品状态',
  `time` datetime NOT NULL COMMENT '上架时间',
  PRIMARY KEY (`id`),
  KEY `indexCommodityOrder` (`saled`),
  KEY `Commodity_ibfk_1` (`owner`),
  KEY `Commodity_ibfk_2` (`category`),
  KEY `Commodity_ibfk_3` (`shop`),
  KEY `Commodity_ibfk_4` (`image`),
  CONSTRAINT `Commodity_ibfk_1` FOREIGN KEY (`owner`) REFERENCES `Users` (`id`),
  CONSTRAINT `Commodity_ibfk_2` FOREIGN KEY (`category`) REFERENCES `Category` (`id`),
  CONSTRAINT `Commodity_ibfk_3` FOREIGN KEY (`shop`) REFERENCES `Shop` (`id`),
  CONSTRAINT `Commodity_ibfk_4` FOREIGN KEY (`image`) REFERENCES `Picture` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Commodity`
--

LOCK TABLES `Commodity` WRITE;
INSERT INTO `Commodity` (`id`, `owner`, `shop`, `name`, `details`, `category`, `storage`, `saled`, `price`, `image`, `visitCount`, `status`, `time`) VALUES (2,1,1,'TestCommodity1','Test',1,200,0,30,6,0,1,'2017-07-04 16:09:03'),(3,1,1,'TestCommodity','Test',1,100,0,20,7,0,1,'2017-07-02 11:13:55'),(8,10,9,'test','test',2,100,NULL,100,1,NULL,1,'2017-07-07 17:11:09'),(9,10,9,'test','test',2,100,NULL,100,1,NULL,1,'2017-07-07 17:12:56'),(10,10,9,'test','test',2,100,NULL,100,1,NULL,1,'2017-07-07 17:13:49'),(11,10,9,'123','123',2,100,NULL,100,1,NULL,1,'2017-07-07 17:15:14'),(12,10,9,'123','124',2,100,NULL,100,1,NULL,1,'2017-07-07 17:20:00'),(13,10,9,'test','123',2,100,NULL,100,1,NULL,1,'2017-07-07 17:22:06'),(14,10,9,'test','test',2,100,NULL,100,1,NULL,1,'2017-07-07 17:23:57'),(15,10,9,'test','123456',2,100,NULL,100,1,NULL,1,'2017-07-07 17:27:24'),(16,10,9,'test','test',2,100,NULL,100,1,NULL,1,'2017-07-07 17:29:08'),(17,10,9,'test','test',2,100,NULL,100,1,NULL,1,'2017-07-07 17:34:48'),(18,10,9,'test','test',2,100,NULL,100,1,NULL,1,'2017-07-07 17:48:21'),(19,10,9,'test','test',2,100,NULL,100,1,NULL,1,'2017-07-07 17:57:46');
UNLOCK TABLES;

--
-- Table structure for table `CommodityType`
--

DROP TABLE IF EXISTS `CommodityType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CommodityType` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品型号id',
  `commodity` int(11) NOT NULL COMMENT '商品id',
  `name` varchar(30) NOT NULL COMMENT '商品型号名称',
  `storage` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `commodity` (`commodity`),
  CONSTRAINT `CommodityType_ibfk_1` FOREIGN KEY (`commodity`) REFERENCES `Commodity` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='商品型号表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CommodityType`
--

LOCK TABLES `CommodityType` WRITE;
INSERT INTO `CommodityType` (`id`, `commodity`, `name`, `storage`) VALUES (1,3,'S',5),(2,3,'M',5),(3,3,'L',5),(4,3,'XL',5),(5,10,'S',0),(6,19,'S',0),(7,19,'M',0),(8,19,'L',0);
UNLOCK TABLES;

--
-- Table structure for table `Information`
--

DROP TABLE IF EXISTS `Information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Information` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '资讯id',
  `admin` int(11) NOT NULL COMMENT '管理员id',
  `beginTime` datetime NOT NULL COMMENT '开始时间',
  `endTime` datetime NOT NULL COMMENT '结束时间',
  `title` varchar(50) NOT NULL COMMENT '资讯标题',
  `content` text NOT NULL COMMENT '资讯内容',
  `time` datetime NOT NULL COMMENT '资讯发布时间',
  PRIMARY KEY (`id`),
  KEY `admin` (`admin`),
  CONSTRAINT `Information_ibfk_1` FOREIGN KEY (`admin`) REFERENCES `Admin` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资讯表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Information`
--

LOCK TABLES `Information` WRITE;
UNLOCK TABLES;

--
-- Table structure for table `Message`
--

DROP TABLE IF EXISTS `Message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Message` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '消息id',
  `sender` int(11) NOT NULL COMMENT '发送者id',
  `reciver` int(11) NOT NULL COMMENT '接收者id',
  `content` text NOT NULL COMMENT '消息内容',
  `time` datetime NOT NULL COMMENT '消息发送时间',
  PRIMARY KEY (`id`),
  KEY `sender` (`sender`),
  KEY `reciver` (`reciver`),
  CONSTRAINT `Message_ibfk_1` FOREIGN KEY (`sender`) REFERENCES `Users` (`id`),
  CONSTRAINT `Message_ibfk_2` FOREIGN KEY (`reciver`) REFERENCES `Users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Message`
--

LOCK TABLES `Message` WRITE;
UNLOCK TABLES;

--
-- Table structure for table `OrderDetails`
--

DROP TABLE IF EXISTS `OrderDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OrderDetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单详情id',
  `orderInfo` int(11) NOT NULL COMMENT '订单id',
  `commodity` int(11) NOT NULL COMMENT '商品id',
  `receive` int(11) DEFAULT NULL COMMENT '收货信息id',
  `commodityType` int(11) NOT NULL COMMENT '商品型号id',
  `count` int(11) NOT NULL COMMENT '订购数量',
  `time` datetime NOT NULL COMMENT '订购时间',
  PRIMARY KEY (`id`),
  KEY `orderInfo` (`orderInfo`),
  KEY `commodity` (`commodity`),
  CONSTRAINT `OrderDetails_ibfk_1` FOREIGN KEY (`orderInfo`) REFERENCES `OrderInfo` (`id`),
  CONSTRAINT `OrderDetails_ibfk_2` FOREIGN KEY (`commodity`) REFERENCES `Commodity` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='订单详情表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderDetails`
--

LOCK TABLES `OrderDetails` WRITE;
INSERT INTO `OrderDetails` (`id`, `orderInfo`, `commodity`, `receive`, `commodityType`, `count`, `time`) VALUES (1,1,3,7,3,1,'2017-07-06 08:45:48'),(2,2,3,7,2,1,'2017-07-07 11:27:47'),(3,3,3,7,1,1,'2017-07-07 12:04:13'),(4,4,3,7,2,1,'2017-07-07 14:34:43');
UNLOCK TABLES;

--
-- Table structure for table `OrderInfo`
--

DROP TABLE IF EXISTS `OrderInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OrderInfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单信息id',
  `user` int(11) NOT NULL COMMENT '用户id',
  `price` float NOT NULL COMMENT '价格',
  `time` datetime NOT NULL COMMENT '订单提交时间',
  `status` varchar(10) NOT NULL COMMENT '订单状态',
  PRIMARY KEY (`id`),
  KEY `user` (`user`),
  CONSTRAINT `OrderInfo_ibfk_1` FOREIGN KEY (`user`) REFERENCES `Users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='订单信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderInfo`
--

LOCK TABLES `OrderInfo` WRITE;
INSERT INTO `OrderInfo` (`id`, `user`, `price`, `time`, `status`) VALUES (1,7,30,'2017-07-05 21:12:21','待付款'),(2,7,30,'2017-07-07 11:24:59','待收货'),(3,7,30,'2017-07-07 12:03:45','待评价'),(4,7,30,'2017-07-07 14:34:18','已完成');
UNLOCK TABLES;

--
-- Table structure for table `Picture`
--

DROP TABLE IF EXISTS `Picture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Picture` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '图片id',
  `path` text NOT NULL COMMENT '图片路径',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='图片表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Picture`
--

LOCK TABLES `Picture` WRITE;
INSERT INTO `Picture` (`id`, `path`) VALUES (1,'/static/images/banner/1.jpg'),(2,'/static/images/banner/2.jpg'),(3,'/static/images/banner/3.jpg'),(4,'/static/images/banner/4.jpg'),(5,'/static/images/banner/5.jpg'),(6,'/static/images/product/arrival/1.jpg'),(7,'/static/images/product/arrival/3.jpg');
UNLOCK TABLES;

--
-- Table structure for table `ReceiveInfo`
--

DROP TABLE IF EXISTS `ReceiveInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReceiveInfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '收货信息id',
  `user` int(11) NOT NULL COMMENT '收货人id',
  `address` text NOT NULL COMMENT '收货地址',
  `postcode` varchar(10) DEFAULT NULL COMMENT '邮编',
  `name` varchar(20) NOT NULL COMMENT '收货人姓名',
  `phoneNumber` varchar(11) NOT NULL COMMENT '收货人手机号',
  PRIMARY KEY (`id`),
  KEY `user` (`user`),
  CONSTRAINT `ReceiveInfo_ibfk_1` FOREIGN KEY (`user`) REFERENCES `Users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收货信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ReceiveInfo`
--

LOCK TABLES `ReceiveInfo` WRITE;
UNLOCK TABLES;

--
-- Table structure for table `Shop`
--

DROP TABLE IF EXISTS `Shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '店铺id',
  `owner` int(11) NOT NULL COMMENT '店主id',
  `name` varchar(20) NOT NULL COMMENT '店铺名',
  `icon` int(11) DEFAULT NULL COMMENT '店铺图标id',
  `description` text COMMENT '店铺描述',
  `phoneNumber` varchar(11) DEFAULT NULL COMMENT '店主手机',
  `customerService` int(11) DEFAULT NULL COMMENT '客服id',
  `servicePhoneNumber` varchar(11) DEFAULT NULL COMMENT '客服电话',
  PRIMARY KEY (`id`),
  KEY `owner` (`owner`),
  KEY `icon` (`icon`),
  CONSTRAINT `Shop_ibfk_1` FOREIGN KEY (`owner`) REFERENCES `Users` (`id`),
  CONSTRAINT `Shop_ibfk_2` FOREIGN KEY (`icon`) REFERENCES `Picture` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='店铺表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Shop`
--

LOCK TABLES `Shop` WRITE;
INSERT INTO `Shop` (`id`, `owner`, `name`, `icon`, `description`, `phoneNumber`, `customerService`, `servicePhoneNumber`) VALUES (1,7,'TestShop',NULL,NULL,NULL,NULL,NULL),(5,6,'testShop',NULL,'test','13026133586',NULL,NULL),(9,10,'shop',NULL,'test','13026133586',NULL,NULL);
UNLOCK TABLES;

--
-- Table structure for table `Token`
--

DROP TABLE IF EXISTS `Token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Token` (
  `id` int(11) DEFAULT NULL COMMENT 'token id',
  `token` varchar(256) DEFAULT NULL COMMENT 'token',
  `date_create` datetime DEFAULT NULL COMMENT '创建时间',
  `validity` int(11) DEFAULT NULL COMMENT '有效天数',
  KEY `id` (`id`),
  KEY `indexToken` (`token`),
  CONSTRAINT `Token_ibfk_1` FOREIGN KEY (`id`) REFERENCES `Users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Token`
--

LOCK TABLES `Token` WRITE;
INSERT INTO `Token` (`id`, `token`, `date_create`, `validity`) VALUES (1,'eyJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE0OTg5NjQ3MzQsInN1YiI6InRlc3QiLCJleHAiOjE1MDAxNzQzMzR9.mFGT8vj7eXZslExMGHm2MXQq4fxGakfvOKu8V6hvgG4','2017-07-01 22:05:35',14),(3,'eyJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE0OTg5OTE3MTcsInN1YiI6ImEiLCJleHAiOjE1MDAyMDEzMTd9.KYdfJdlBV5VD9gt2VFOrt_bfAn3ijtqTWu6zrm9bjyg','2017-07-02 05:35:17',14),(4,'eyJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE0OTkwNDU0NjgsInN1YiI6Inp5aCIsImV4cCI6MTUwMDI1NTA2OH0.kbrW7Llmv0Og8_8PXd3VaW08zHqOVLCbORHSxEEuu_g','2017-07-02 20:31:08',14),(6,'eyJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE0OTkyMzkyNzYsInN1YiI6Im1hbmEtY3lhbiIsImV4cCI6MTUwMDQ0ODg3Nn0.mUs5ZqaGBLmVtxd0CIgA5C3y_HPKCdOfr9DFesrF_fU','2017-07-05 07:21:17',14),(2,'eyJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE0OTkyNDA3MDIsInN1YiI6Imd4dyIsImV4cCI6MTUwMDQ1MDMwMn0.FURJp_tPTYILOwoT0ERFLKc7JxavXq8MZKAfKOF3GJc','2017-07-05 07:45:03',14),(8,'eyJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE0OTkzOTE2OTcsInN1YiI6InRlc3RVc2VyIiwiZXhwIjoxNTAwNjAxMjk3fQ.rGajKJ-QZeMekrxYNqDaZKC8L5KsgtFV_XD_Bh0bk_Y','2017-07-07 01:41:37',14),(9,'eyJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE0OTk0MDkxMDcsInN1YiI6InF3ZXJ0eSIsImV4cCI6MTUwMDYxODcwN30.0j7Zn2FStaV7jYYEHdX1mDnYkEDwAZNBFMquhgywUPE','2017-07-07 06:31:48',14),(7,'eyJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE0OTk0MDkxNjMsInN1YiI6Im1hbmEtY3lhbiIsImV4cCI6MTUwMDYxODc2M30.5Gx3O3pK3R9_xRD4fmAK-AKVC5Cd5YzH0zGztVm6kkE','2017-07-07 06:32:44',14),(10,'eyJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE0OTk0NDAzMDIsInN1YiI6Im5ld3VzZXIiLCJleHAiOjE1MDA2NDk5MDJ9.KfFNTEATquY3Xu82FNl0BDhtiwE_gN0cu7JWzCtsM-M','2017-07-07 15:11:43',14);
UNLOCK TABLES;

--
-- Table structure for table `UserType`
--

DROP TABLE IF EXISTS `UserType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserType` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户类别id',
  `name` varchar(10) NOT NULL COMMENT '类别名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户类别表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserType`
--

LOCK TABLES `UserType` WRITE;
INSERT INTO `UserType` (`id`, `name`) VALUES (1,'买家'),(2,'卖家');
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Users` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(20) NOT NULL COMMENT '用户名',
  `password` varchar(32) NOT NULL COMMENT '密码(md5+salt)',
  `email` varchar(30) NOT NULL COMMENT '邮箱',
  `salt` varchar(32) NOT NULL COMMENT '盐值',
  `role` int(11) NOT NULL COMMENT '用户角色：卖家/买家',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `gender` varchar(2) DEFAULT NULL COMMENT '性别：男/女',
  `description` text COMMENT '个人信息',
  `viewCount` int(11) DEFAULT NULL COMMENT '系统访问次数',
  `phoneNumber` varchar(11) DEFAULT NULL COMMENT '手机号',
  `identityNumber` varchar(18) DEFAULT NULL COMMENT '身份证号',
  `address` text COMMENT '地址',
  `status` int(11) DEFAULT NULL COMMENT '状态：0-离线，1-在线',
  `name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `role` (`role`),
  CONSTRAINT `Users_ibfk_1` FOREIGN KEY (`role`) REFERENCES `UserType` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
INSERT INTO `Users` (`id`, `username`, `password`, `email`, `salt`, `role`, `birthday`, `gender`, `description`, `viewCount`, `phoneNumber`, `identityNumber`, `address`, `status`, `name`) VALUES (1,'test','12345678901234567890123456789012','test@mail.com','test',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'mana-cya','$2a$10$tX4TNQrYnss9yQbV4.kgs.yu0','649752038@qq.com','$2a$10$tX4TNQrYnss9yQbV4.kgs.',1,'1996-10-14','男',NULL,NULL,'13026133586','420984199609140000','湖北省武汉市华中师范大学',NULL,'张昶'),(3,'a','$2a$10$vPHTYHI982BSZ8Qjp1bx1eezt','1@qq.com','$2a$10$vPHTYHI982BSZ8Qjp1bx1e',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'zyh','$2a$10$UKRxQDjmkj0mfpPf/6wPd.Ic8','735479203@qq.com','$2a$10$UKRxQDjmkj0mfpPf/6wPd.',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,'mana','$2a$10$.83JHh7VoJm4jjMO4FV.V.EV3','test@126.com','$2a$10$.83JHh7VoJm4jjMO4FV.V.',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,'mana-cyan','$2a$10$gHtrVusqK0KrBrhPkSUz3.n8L','takamiyamana@126.com','$2a$10$gHtrVusqK0KrBrhPkSUz3.',2,'1996-10-14','男',NULL,NULL,'13026133586','420984199609140000','湖北省武汉市华中师范大学',NULL,'张昶'),(8,'testUser','$2a$10$PTrySYksr2YzBeL6ynlPDuFoJ','testemail@mail.com','$2a$10$PTrySYksr2YzBeL6ynlPDu',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,'qwerty','$2a$10$6O0TfNvfJWix/a5HbaGT3.ZWP','qwerty@mail.com','$2a$10$6O0TfNvfJWix/a5HbaGT3.',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,'newuser','$2a$10$8jkbJP8hRo08q2UVP6trsefse','newuser@mail.com','$2a$10$8jkbJP8hRo08q2UVP6trse',2,'1996-10-14','男',NULL,NULL,'13026133586','420984199609140000','湖北省武汉市华中师范大学',NULL,'newuser');
UNLOCK TABLES;

--
-- Temporary table structure for view `orderwithallcommoditydetail`
--

DROP TABLE IF EXISTS `orderwithallcommoditydetail`;
/*!50001 DROP VIEW IF EXISTS `orderwithallcommoditydetail`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `orderwithallcommoditydetail` AS SELECT 
 1 AS `vid`,
 1 AS `vstatus`,
 1 AS `vuser`,
 1 AS `vphoneNumber`,
 1 AS `vcommodityId`,
 1 AS `vname`,
 1 AS `vcommodityType`,
 1 AS `vprice`,
 1 AS `vaddress`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `shopwithuser`
--

DROP TABLE IF EXISTS `shopwithuser`;
/*!50001 DROP VIEW IF EXISTS `shopwithuser`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `shopwithuser` AS SELECT 
 1 AS `tid`,
 1 AS `tname`,
 1 AS `tdescription`,
 1 AS `taddress`,
 1 AS `tphoneNumber`,
 1 AS `temail`,
 1 AS `towner`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `orderwithallcommoditydetail`
--

/*!50001 DROP VIEW IF EXISTS `orderwithallcommoditydetail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`op`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `orderwithallcommoditydetail` AS select `t1`.`id` AS `vid`,`t1`.`status` AS `vstatus`,`t1`.`user` AS `vuser`,`t5`.`phoneNumber` AS `vphoneNumber`,`t2`.`commodity` AS `vcommodityId`,`t3`.`name` AS `vname`,`t4`.`name` AS `vcommodityType`,`t3`.`price` AS `vprice`,`t5`.`address` AS `vaddress` from ((((`orderinfo` `t1` left join `orderdetails` `t2` on((`t1`.`id` = `t2`.`orderInfo`))) left join `commodity` `t3` on((`t2`.`commodity` = `t3`.`id`))) left join `commoditytype` `t4` on((`t2`.`commodityType` = `t4`.`id`))) left join `users` `t5` on((`t1`.`user` = `t5`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `shopwithuser`
--

/*!50001 DROP VIEW IF EXISTS `shopwithuser`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`op`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `shopwithuser` AS select `t1`.`id` AS `tid`,`t1`.`name` AS `tname`,`t1`.`description` AS `tdescription`,`t2`.`address` AS `taddress`,`t2`.`phoneNumber` AS `tphoneNumber`,`t2`.`email` AS `temail`,`t2`.`id` AS `towner` from (`shop` `t1` left join `users` `t2` on((`t1`.`owner` = `t2`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-07-08  9:19:47
