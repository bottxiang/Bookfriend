/*
Navicat MySQL Data Transfer

Source Server         : 一个连接
Source Server Version : 50728
Source Host           : localhost:3306
Source Database       : bookfriend

Target Server Type    : MYSQL
Target Server Version : 50728
File Encoding         : 65001

Date: 2019-12-03 15:07:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', 'admin');

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `bkid` int(11) NOT NULL AUTO_INCREMENT,
  `bkname` varchar(50) DEFAULT NULL,
  `bkprice` double DEFAULT NULL,
  `bkpress` varchar(50) DEFAULT NULL,
  `bkdescription` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `bkimg` varchar(50) DEFAULT NULL,
  `onsell` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`bkid`),
  KEY `uid` (`uid`),
  CONSTRAINT `book_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('34', '经济学原理', '79', '北京大学出版社', '9成新', '1', '105', '97d3dad6-6694-4472-bb22-404c46d9cc29.png', '1');
INSERT INTO `book` VALUES ('35', '论语', '14.8', '浙江教育出版社', '全新', '0', '105', 'c1fe85be-7c66-4447-8701-2ee489acba07.png', '1');
INSERT INTO `book` VALUES ('36', '没有教不好的孩子', '25', '人民教育出版社', '9成新', '0', '104', 'b1465d82-219c-4de8-bbd0-2d1e515467c2.png', '1');
INSERT INTO `book` VALUES ('40', '三国演义', '15', '人民教育出版', '9成新', '0', '104', '7b91bbf7-7d1f-4f21-8868-6d0adb083a02.png', '1');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `from` int(11) NOT NULL,
  `to` int(11) NOT NULL,
  `content` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`mid`),
  KEY `from` (`from`),
  KEY `to` (`to`),
  CONSTRAINT `message_ibfk_1` FOREIGN KEY (`from`) REFERENCES `user` (`uid`),
  CONSTRAINT `message_ibfk_2` FOREIGN KEY (`to`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('1', '105', '104', '你好');
INSERT INTO `message` VALUES ('2', '104', '105', '请问需要什么？');
INSERT INTO `message` VALUES ('3', '105', '104', '我需要经济学原理这本书');

-- ----------------------------
-- Table structure for notify
-- ----------------------------
DROP TABLE IF EXISTS `notify`;
CREATE TABLE `notify` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `from` int(11) DEFAULT NULL,
  `to` int(11) DEFAULT NULL,
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notify
-- ----------------------------
INSERT INTO `notify` VALUES ('1', '105', '104');
INSERT INTO `notify` VALUES ('2', '104', '105');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `oid` int(11) NOT NULL AUTO_INCREMENT,
  `bkid` int(11) DEFAULT NULL,
  `buid` int(11) DEFAULT NULL,
  `suid` int(11) DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `bkid` (`bkid`),
  KEY `buid` (`buid`),
  KEY `suid` (`suid`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`bkid`) REFERENCES `book` (`bkid`),
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`buid`) REFERENCES `user` (`uid`),
  CONSTRAINT `order_ibfk_3` FOREIGN KEY (`suid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('1', '34', '104', '105');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `pwd` varchar(50) NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  `img` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('104', '1623387115@qq.com', '111', null, null);
INSERT INTO `user` VALUES ('105', '906093348@qq.com', '111', null, null);
