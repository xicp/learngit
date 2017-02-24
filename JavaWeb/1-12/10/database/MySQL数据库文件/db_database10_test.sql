-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.40-community


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema db_database10
--

CREATE DATABASE IF NOT EXISTS db_database10;
USE db_database10;

--
-- Definition of table `tb_article`
--

DROP TABLE IF EXISTS `tb_article`;
CREATE TABLE `tb_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `createtime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tb_article`
--

/*!40000 ALTER TABLE `tb_article` DISABLE KEYS */;
INSERT INTO `tb_article` (`id`,`title`,`content`,`createtime`) VALUES 
 (62,'你好','你好，','2010-05-26 15:20:40'),
 (63,'你好','你好，这里是明日科技','2010-05-26 15:20:50'),
 (64,'你好','你好，这里是明日科技有限公司！','2010-05-26 15:21:00'),
 (65,'??','???????????????','2010-05-26 15:53:12'),
 (66,'爱上地方','爱上地方','2010-05-26 15:53:43'),
 (67,'123','爱上地方爱上地方爱上地方','2010-05-26 15:54:13');
/*!40000 ALTER TABLE `tb_article` ENABLE KEYS */;


--
-- Definition of table `tb_bbs`
--

DROP TABLE IF EXISTS `tb_bbs`;
CREATE TABLE `tb_bbs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id号',
  `title` varchar(40) NOT NULL COMMENT '标题',
  `content` varchar(200) NOT NULL COMMENT '内容',
  `sendTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '发布时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tb_bbs`
--

/*!40000 ALTER TABLE `tb_bbs` DISABLE KEYS */;
INSERT INTO `tb_bbs` (`id`,`title`,`content`,`sendTime`) VALUES 
 (1,'苹果已开始研发二代iPad 改用OLED屏幕 ','苹果已开始研发二代iPad 改用OLED屏幕 ','2010-07-01 11:51:45'),
 (2,'加入绿书签，分享正版生活！ ','加入绿书签，分享正版生活！ ','2010-07-01 12:20:00'),
 (3,'我市开展“数字图书进机关”活动','今天是第15个世界图书日。在这样一个全世界都在倡导读书、共建阅读社会的日子，我市在市委机关会堂隆重举行了“建学习型党组织，筑书香长春”数字图书进机关活动启动仪式，并发放数字图书阅读卡2万张。','2010-07-01 12:29:52'),
 (4,'2010南非世界杯明日1/4决赛：巴西VS荷兰，巴拉圭VS加纳','2010南非世界杯明日1/4决赛：巴西VS荷兰，巴拉圭VS加纳','2010-07-01 13:10:00'),
 (5,'啊爱上对方','哀伤地发送到','2010-06-30 13:20:00'),
 (6,'asfd','asdf','2010-07-01 13:26:00');
/*!40000 ALTER TABLE `tb_bbs` ENABLE KEYS */;


--
-- Definition of table `tb_biddinglist`
--

DROP TABLE IF EXISTS `tb_biddinglist`;
CREATE TABLE `tb_biddinglist` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID号',
  `resId` int(10) unsigned NOT NULL COMMENT '拍品ID',
  `bid` float NOT NULL COMMENT '竞买价',
  `bidder` int(10) unsigned NOT NULL COMMENT '出价人',
  `bidTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '出价时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=gbk COMMENT='出价记录';

--
-- Dumping data for table `tb_biddinglist`
--

/*!40000 ALTER TABLE `tb_biddinglist` DISABLE KEYS */;
INSERT INTO `tb_biddinglist` (`id`,`resId`,`bid`,`bidder`,`bidTime`) VALUES 
 (1,1,550,1,'2010-03-04 10:53:06'),
 (2,1,600,2,'2010-03-04 14:14:52'),
 (3,2,110,2,'2010-03-05 10:35:47'),
 (8,2,120,1,'2010-03-05 11:21:28'),
 (9,3,600,1,'2010-06-29 10:32:46'),
 (10,3,800,1,'2010-06-29 13:26:30'),
 (11,3,1000,1,'2010-06-29 13:28:00');
/*!40000 ALTER TABLE `tb_biddinglist` ENABLE KEYS */;


--
-- Definition of table `tb_commodity`
--

DROP TABLE IF EXISTS `tb_commodity`;
CREATE TABLE `tb_commodity` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `price` float NOT NULL,
  `picture` varchar(45) NOT NULL,
  `introduce` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tb_commodity`
--

/*!40000 ALTER TABLE `tb_commodity` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_commodity` ENABLE KEYS */;


--
-- Definition of table `tb_goods`
--

DROP TABLE IF EXISTS `tb_goods`;
CREATE TABLE `tb_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品ID号',
  `name` varchar(45) CHARACTER SET utf8 NOT NULL COMMENT '商品名称',
  `price` float NOT NULL DEFAULT '0' COMMENT '当前价格',
  `picture` varchar(45) CHARACTER SET utf8 NOT NULL COMMENT '图片',
  `refreshTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `introduce` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tb_goods`
--

/*!40000 ALTER TABLE `tb_goods` DISABLE KEYS */;
INSERT INTO `tb_goods` (`id`,`name`,`price`,`picture`,`refreshTime`,`introduce`) VALUES 
 (1,'滚筒洗衣机',2608,'xyj1.jpg','2010-02-27 17:11:29','滚动洗衣机，价格优惠'),
 (2,'便携式自行车',999,'bike.jpg','2010-02-27 17:12:55','最新推出时尚山地自行车，价格超值'),
 (3,'时尚液晶显示器',880,'yjxsq1.jpg','2010-03-01 13:05:52','最新推出新品37寸液晶显示器，价格便宜'),
 (4,'新新人类家庭影院',3600,'xxrljtyy.jpg','2010-03-02 09:24:18','新新人类家庭影院'),
 (5,'银灰色17‘液晶显示器',680,'yjxsq2.jpg','2010-03-10 11:13:24','银灰色17‘液晶显示器'),
 (6,'咖啡杯',36,'cfb.jpg','2010-03-10 11:14:36','时尚咖啡杯，价格实惠');
/*!40000 ALTER TABLE `tb_goods` ENABLE KEYS */;


--
-- Definition of table `tb_key`
--

DROP TABLE IF EXISTS `tb_key`;
CREATE TABLE `tb_key` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `keyWord` varchar(30) CHARACTER SET utf8 NOT NULL COMMENT '关键字',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tb_key`
--

/*!40000 ALTER TABLE `tb_key` DISABLE KEYS */;
INSERT INTO `tb_key` (`id`,`keyWord`) VALUES 
 (1,'明日'),
 (2,'明日科技'),
 (3,'明日科技编程词典'),
 (7,'明日软件'),
 (8,'明'),
 (9,'明星'),
 (10,'javaEE'),
 (11,'javaScript'),
 (12,'java 语言');
/*!40000 ALTER TABLE `tb_key` ENABLE KEYS */;


--
-- Definition of table `tb_news`
--

DROP TABLE IF EXISTS `tb_news`;
CREATE TABLE `tb_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID号',
  `title` varchar(50) NOT NULL COMMENT '新闻标题',
  `content` varchar(200) NOT NULL COMMENT '新闻内容',
  `addTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发布时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=gbk COMMENT='商城新闻表';

--
-- Dumping data for table `tb_news`
--

/*!40000 ALTER TABLE `tb_news` DISABLE KEYS */;
INSERT INTO `tb_news` (`id`,`title`,`content`,`addTime`) VALUES 
 (1,'新品上市有惊喜了！','新品上市有惊喜了！','2010-03-13 10:24:44'),
 (2,'现在购买洗衣机可获得精美礼品！','现在购买洗衣机可获得精美礼品！','2010-03-13 10:25:47'),
 (3,'参与爱心购物帮助失学儿童重返校园。','参与爱心购物帮助失学儿童重返校园。','2010-03-13 10:26:44'),
 (4,'为庆元旦我商场特举办购物抽奖活动！','为庆元旦我商场特举办购物抽奖活动！','2010-03-13 10:27:28');
/*!40000 ALTER TABLE `tb_news` ENABLE KEYS */;


--
-- Definition of table `tb_res`
--

DROP TABLE IF EXISTS `tb_res`;
CREATE TABLE `tb_res` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID号',
  `name` varchar(45) CHARACTER SET utf8 NOT NULL COMMENT '拍品名称',
  `startPrice` float NOT NULL DEFAULT '0' COMMENT '起拍价',
  `breadth` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '加价幅度',
  `startTime` datetime NOT NULL COMMENT '起始时间',
  `endTime` datetime NOT NULL COMMENT '结束时间',
  `hit` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `isEnd` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否结束',
  `picture` varchar(45) CHARACTER SET utf8 NOT NULL COMMENT '拍品图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tb_res`
--

/*!40000 ALTER TABLE `tb_res` DISABLE KEYS */;
INSERT INTO `tb_res` (`id`,`name`,`startPrice`,`breadth`,`startTime`,`endTime`,`hit`,`isEnd`,`picture`) VALUES 
 (1,'滚筒洗衣机',500,50,'2010-03-03 09:00:00','2010-03-04 16:20:00',19,1,'xyj1.jpg'),
 (2,'便携式自行车',100,10,'2010-03-03 09:30:00','2011-03-31 09:30:00',200,0,'bike.jpg'),
 (3,'时尚液晶显示器',500,10,'2010-03-05 11:30:00','2011-03-31 11:30:00',48,0,'yjxsq1.jpg');
/*!40000 ALTER TABLE `tb_res` ENABLE KEYS */;


--
-- Definition of table `tb_user`
--

DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userName` varchar(30) NOT NULL COMMENT '用户名',
  `pwd` varchar(45) NOT NULL COMMENT '密码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=gbk;

--
-- Dumping data for table `tb_user`
--

/*!40000 ALTER TABLE `tb_user` DISABLE KEYS */;
INSERT INTO `tb_user` (`id`,`userName`,`pwd`) VALUES 
 (1,'remember','111'),
 (2,'张三','111');
/*!40000 ALTER TABLE `tb_user` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
