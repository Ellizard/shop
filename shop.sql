/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : shop

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2015-11-04 18:12:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for oc_address
-- ----------------------------
DROP TABLE IF EXISTS `oc_address`;
CREATE TABLE `oc_address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `company` varchar(40) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL DEFAULT '0',
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `custom_field` text NOT NULL,
  PRIMARY KEY (`address_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_address
-- ----------------------------

-- ----------------------------
-- Table structure for oc_affiliate
-- ----------------------------
DROP TABLE IF EXISTS `oc_affiliate`;
CREATE TABLE `oc_affiliate` (
  `affiliate_id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `company` varchar(40) NOT NULL,
  `website` varchar(255) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `commission` decimal(4,2) NOT NULL DEFAULT '0.00',
  `tax` varchar(64) NOT NULL,
  `payment` varchar(6) NOT NULL,
  `cheque` varchar(100) NOT NULL,
  `paypal` varchar(64) NOT NULL,
  `bank_name` varchar(64) NOT NULL,
  `bank_branch_number` varchar(64) NOT NULL,
  `bank_swift_code` varchar(64) NOT NULL,
  `bank_account_name` varchar(64) NOT NULL,
  `bank_account_number` varchar(64) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`affiliate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_affiliate
-- ----------------------------

-- ----------------------------
-- Table structure for oc_affiliate_activity
-- ----------------------------
DROP TABLE IF EXISTS `oc_affiliate_activity`;
CREATE TABLE `oc_affiliate_activity` (
  `activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `data` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`activity_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_affiliate_activity
-- ----------------------------

-- ----------------------------
-- Table structure for oc_affiliate_login
-- ----------------------------
DROP TABLE IF EXISTS `oc_affiliate_login`;
CREATE TABLE `oc_affiliate_login` (
  `affiliate_login_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(96) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `total` int(4) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`affiliate_login_id`),
  KEY `email` (`email`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_affiliate_login
-- ----------------------------

-- ----------------------------
-- Table structure for oc_affiliate_transaction
-- ----------------------------
DROP TABLE IF EXISTS `oc_affiliate_transaction`;
CREATE TABLE `oc_affiliate_transaction` (
  `affiliate_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`affiliate_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_affiliate_transaction
-- ----------------------------

-- ----------------------------
-- Table structure for oc_api
-- ----------------------------
DROP TABLE IF EXISTS `oc_api`;
CREATE TABLE `oc_api` (
  `api_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `key` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`api_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_api
-- ----------------------------
INSERT INTO `oc_api` VALUES ('1', 'Default', 'uqi54gOfU4ZnUVHvWZN0ncMsxyTL9H0YiEgdfuJvttN9oL7eZ8bWuBWj5usxo3rFj6oBVPLssZmhsohjaRUcNg1d1xkRbB6ML639ErlAi2Ukebr11Xu3fYpIULqjnDBBrKRHZU4x1Mr6bOk3sn1Uefs0XbxIYP59DX6Fa9PfbvxFLuxlLGjpI4vmEvVRTSEbaVLiA4Hsx76d8NZQxKcAATHcMjxCmw3ttZbHoNetwJfe6LFweTOwlt0sa1Sa7YkO', '1', '2015-11-03 16:22:07', '2015-11-03 16:22:07');

-- ----------------------------
-- Table structure for oc_api_ip
-- ----------------------------
DROP TABLE IF EXISTS `oc_api_ip`;
CREATE TABLE `oc_api_ip` (
  `api_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `api_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  PRIMARY KEY (`api_ip_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_api_ip
-- ----------------------------

-- ----------------------------
-- Table structure for oc_api_session
-- ----------------------------
DROP TABLE IF EXISTS `oc_api_session`;
CREATE TABLE `oc_api_session` (
  `api_session_id` int(11) NOT NULL AUTO_INCREMENT,
  `api_id` int(11) NOT NULL,
  `token` varchar(32) NOT NULL,
  `session_id` varchar(32) NOT NULL,
  `session_name` varchar(32) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`api_session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_api_session
-- ----------------------------

-- ----------------------------
-- Table structure for oc_attribute
-- ----------------------------
DROP TABLE IF EXISTS `oc_attribute`;
CREATE TABLE `oc_attribute` (
  `attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`attribute_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_attribute
-- ----------------------------

-- ----------------------------
-- Table structure for oc_attribute_description
-- ----------------------------
DROP TABLE IF EXISTS `oc_attribute_description`;
CREATE TABLE `oc_attribute_description` (
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`attribute_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_attribute_description
-- ----------------------------

-- ----------------------------
-- Table structure for oc_attribute_group
-- ----------------------------
DROP TABLE IF EXISTS `oc_attribute_group`;
CREATE TABLE `oc_attribute_group` (
  `attribute_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`attribute_group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_attribute_group
-- ----------------------------

-- ----------------------------
-- Table structure for oc_attribute_group_description
-- ----------------------------
DROP TABLE IF EXISTS `oc_attribute_group_description`;
CREATE TABLE `oc_attribute_group_description` (
  `attribute_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`attribute_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_attribute_group_description
-- ----------------------------

-- ----------------------------
-- Table structure for oc_banner
-- ----------------------------
DROP TABLE IF EXISTS `oc_banner`;
CREATE TABLE `oc_banner` (
  `banner_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`banner_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_banner
-- ----------------------------
INSERT INTO `oc_banner` VALUES ('6', 'HP Products', '1');
INSERT INTO `oc_banner` VALUES ('7', 'Home Page Slideshow', '1');
INSERT INTO `oc_banner` VALUES ('8', 'Manufacturers', '1');

-- ----------------------------
-- Table structure for oc_banner_image
-- ----------------------------
DROP TABLE IF EXISTS `oc_banner_image`;
CREATE TABLE `oc_banner_image` (
  `banner_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `banner_id` int(11) NOT NULL,
  `link` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`banner_image_id`)
) ENGINE=MyISAM AUTO_INCREMENT=105 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_banner_image
-- ----------------------------
INSERT INTO `oc_banner_image` VALUES ('104', '7', '', 'catalog/slider/slider_3.png', '0');
INSERT INTO `oc_banner_image` VALUES ('103', '7', '', 'catalog/slider/slider_2.png', '0');
INSERT INTO `oc_banner_image` VALUES ('87', '6', 'index.php?route=product/manufacturer/info&amp;manufacturer_id=7', 'catalog/demo/compaq_presario.jpg', '0');
INSERT INTO `oc_banner_image` VALUES ('94', '8', '', 'catalog/demo/manufacturer/nfl.png', '0');
INSERT INTO `oc_banner_image` VALUES ('95', '8', '', 'catalog/demo/manufacturer/redbull.png', '0');
INSERT INTO `oc_banner_image` VALUES ('96', '8', '', 'catalog/demo/manufacturer/sony.png', '0');
INSERT INTO `oc_banner_image` VALUES ('91', '8', '', 'catalog/demo/manufacturer/cocacola.png', '0');
INSERT INTO `oc_banner_image` VALUES ('92', '8', '', 'catalog/demo/manufacturer/burgerking.png', '0');
INSERT INTO `oc_banner_image` VALUES ('93', '8', '', 'catalog/demo/manufacturer/canon.png', '0');
INSERT INTO `oc_banner_image` VALUES ('88', '8', '', 'catalog/demo/manufacturer/harley.png', '0');
INSERT INTO `oc_banner_image` VALUES ('89', '8', '', 'catalog/demo/manufacturer/dell.png', '0');
INSERT INTO `oc_banner_image` VALUES ('90', '8', '', 'catalog/demo/manufacturer/disney.png', '0');
INSERT INTO `oc_banner_image` VALUES ('102', '7', '', 'catalog/slider/slider_1.png', '0');
INSERT INTO `oc_banner_image` VALUES ('97', '8', '', 'catalog/demo/manufacturer/starbucks.png', '0');
INSERT INTO `oc_banner_image` VALUES ('98', '8', '', 'catalog/demo/manufacturer/nintendo.png', '0');

-- ----------------------------
-- Table structure for oc_banner_image_description
-- ----------------------------
DROP TABLE IF EXISTS `oc_banner_image_description`;
CREATE TABLE `oc_banner_image_description` (
  `banner_image_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `banner_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  PRIMARY KEY (`banner_image_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_banner_image_description
-- ----------------------------
INSERT INTO `oc_banner_image_description` VALUES ('104', '1', '7', 'slide3');
INSERT INTO `oc_banner_image_description` VALUES ('87', '1', '6', 'HP Banner');
INSERT INTO `oc_banner_image_description` VALUES ('93', '1', '8', 'Canon');
INSERT INTO `oc_banner_image_description` VALUES ('92', '1', '8', 'Burger King');
INSERT INTO `oc_banner_image_description` VALUES ('91', '1', '8', 'Coca Cola');
INSERT INTO `oc_banner_image_description` VALUES ('90', '1', '8', 'Disney');
INSERT INTO `oc_banner_image_description` VALUES ('89', '1', '8', 'Dell');
INSERT INTO `oc_banner_image_description` VALUES ('103', '1', '7', 'slide2');
INSERT INTO `oc_banner_image_description` VALUES ('88', '1', '8', 'Harley Davidson');
INSERT INTO `oc_banner_image_description` VALUES ('94', '1', '8', 'NFL');
INSERT INTO `oc_banner_image_description` VALUES ('95', '1', '8', 'RedBull');
INSERT INTO `oc_banner_image_description` VALUES ('96', '1', '8', 'Sony');
INSERT INTO `oc_banner_image_description` VALUES ('97', '1', '8', 'Starbucks');
INSERT INTO `oc_banner_image_description` VALUES ('98', '1', '8', 'Nintendo');
INSERT INTO `oc_banner_image_description` VALUES ('102', '1', '7', 'slide1');

-- ----------------------------
-- Table structure for oc_cart
-- ----------------------------
DROP TABLE IF EXISTS `oc_cart`;
CREATE TABLE `oc_cart` (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `session_id` varchar(32) NOT NULL,
  `product_id` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `option` text NOT NULL,
  `quantity` int(5) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `cart_id` (`customer_id`,`session_id`,`product_id`,`recurring_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_cart
-- ----------------------------

-- ----------------------------
-- Table structure for oc_category
-- ----------------------------
DROP TABLE IF EXISTS `oc_category`;
CREATE TABLE `oc_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `top` tinyint(1) NOT NULL,
  `column` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`category_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=144 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_category
-- ----------------------------
INSERT INTO `oc_category` VALUES ('78', '', '61', '0', '1', '0', '1', '2015-11-03 17:11:03', '2015-11-03 17:11:03');
INSERT INTO `oc_category` VALUES ('77', '', '61', '0', '1', '0', '1', '2015-11-03 17:10:28', '2015-11-03 17:10:28');
INSERT INTO `oc_category` VALUES ('76', '', '61', '0', '1', '0', '1', '2015-11-03 17:09:38', '2015-11-03 17:09:38');
INSERT INTO `oc_category` VALUES ('59', '', '0', '1', '2', '0', '1', '2015-11-03 16:46:17', '2015-11-04 13:45:58');
INSERT INTO `oc_category` VALUES ('60', '', '0', '1', '3', '0', '1', '2015-11-03 16:47:32', '2015-11-03 16:59:08');
INSERT INTO `oc_category` VALUES ('61', '', '0', '1', '4', '0', '1', '2015-11-03 16:48:49', '2015-11-03 17:41:57');
INSERT INTO `oc_category` VALUES ('62', '', '61', '0', '1', '0', '1', '2015-11-03 17:03:03', '2015-11-03 17:03:03');
INSERT INTO `oc_category` VALUES ('63', '', '61', '0', '1', '0', '1', '2015-11-03 17:03:45', '2015-11-03 17:03:45');
INSERT INTO `oc_category` VALUES ('64', '', '61', '0', '1', '0', '1', '2015-11-03 17:04:26', '2015-11-03 17:04:26');
INSERT INTO `oc_category` VALUES ('65', '', '61', '0', '1', '0', '1', '2015-11-03 17:04:51', '2015-11-03 17:04:51');
INSERT INTO `oc_category` VALUES ('66', '', '61', '0', '1', '0', '1', '2015-11-03 17:05:22', '2015-11-03 17:05:22');
INSERT INTO `oc_category` VALUES ('67', '', '61', '0', '1', '0', '1', '2015-11-03 17:05:45', '2015-11-03 17:05:45');
INSERT INTO `oc_category` VALUES ('68', '', '61', '0', '1', '0', '1', '2015-11-03 17:06:12', '2015-11-03 17:06:12');
INSERT INTO `oc_category` VALUES ('69', '', '61', '0', '1', '0', '1', '2015-11-03 17:06:38', '2015-11-03 17:06:38');
INSERT INTO `oc_category` VALUES ('70', '', '61', '0', '1', '0', '1', '2015-11-03 17:07:07', '2015-11-03 17:07:07');
INSERT INTO `oc_category` VALUES ('71', '', '61', '0', '1', '0', '1', '2015-11-03 17:07:31', '2015-11-03 17:07:31');
INSERT INTO `oc_category` VALUES ('72', '', '61', '0', '1', '0', '1', '2015-11-03 17:07:50', '2015-11-03 17:07:50');
INSERT INTO `oc_category` VALUES ('73', '', '61', '0', '1', '0', '1', '2015-11-03 17:08:10', '2015-11-03 17:08:10');
INSERT INTO `oc_category` VALUES ('75', '', '61', '0', '1', '0', '1', '2015-11-03 17:09:15', '2015-11-03 17:09:15');
INSERT INTO `oc_category` VALUES ('74', '', '61', '0', '1', '0', '1', '2015-11-03 17:08:41', '2015-11-03 17:08:41');
INSERT INTO `oc_category` VALUES ('84', '', '61', '0', '1', '0', '1', '2015-11-03 17:30:14', '2015-11-03 17:30:14');
INSERT INTO `oc_category` VALUES ('83', '', '61', '0', '1', '0', '1', '2015-11-03 17:29:50', '2015-11-04 13:27:53');
INSERT INTO `oc_category` VALUES ('82', '', '61', '0', '1', '0', '1', '2015-11-03 17:20:01', '2015-11-03 17:20:01');
INSERT INTO `oc_category` VALUES ('81', '', '61', '0', '1', '0', '1', '2015-11-03 17:12:07', '2015-11-03 17:12:07');
INSERT INTO `oc_category` VALUES ('80', '', '61', '0', '1', '0', '1', '2015-11-03 17:11:49', '2015-11-03 17:11:49');
INSERT INTO `oc_category` VALUES ('79', '', '61', '0', '1', '0', '1', '2015-11-03 17:11:24', '2015-11-03 17:11:24');
INSERT INTO `oc_category` VALUES ('85', '', '61', '0', '1', '0', '1', '2015-11-03 17:30:40', '2015-11-03 17:30:40');
INSERT INTO `oc_category` VALUES ('86', '', '61', '0', '1', '0', '1', '2015-11-03 17:31:27', '2015-11-03 17:31:27');
INSERT INTO `oc_category` VALUES ('87', '', '61', '0', '1', '0', '1', '2015-11-03 17:32:18', '2015-11-03 17:32:18');
INSERT INTO `oc_category` VALUES ('88', '', '61', '0', '1', '0', '1', '2015-11-03 17:32:37', '2015-11-03 17:32:37');
INSERT INTO `oc_category` VALUES ('89', '', '61', '0', '1', '0', '1', '2015-11-03 17:33:20', '2015-11-03 17:33:20');
INSERT INTO `oc_category` VALUES ('90', '', '61', '0', '1', '0', '1', '2015-11-03 17:33:38', '2015-11-03 17:33:38');
INSERT INTO `oc_category` VALUES ('91', '', '61', '0', '1', '0', '1', '2015-11-03 17:33:57', '2015-11-03 17:33:57');
INSERT INTO `oc_category` VALUES ('92', '', '61', '0', '1', '0', '1', '2015-11-03 17:34:16', '2015-11-03 17:34:16');
INSERT INTO `oc_category` VALUES ('93', '', '61', '0', '1', '0', '1', '2015-11-03 17:34:36', '2015-11-03 17:34:36');
INSERT INTO `oc_category` VALUES ('94', '', '61', '0', '1', '0', '1', '2015-11-03 17:34:59', '2015-11-03 17:34:59');
INSERT INTO `oc_category` VALUES ('95', '', '59', '0', '1', '0', '1', '2015-11-04 13:29:35', '2015-11-04 13:29:35');
INSERT INTO `oc_category` VALUES ('96', '', '59', '0', '1', '0', '1', '2015-11-04 13:30:42', '2015-11-04 13:30:42');
INSERT INTO `oc_category` VALUES ('97', '', '59', '0', '1', '0', '1', '2015-11-04 13:30:58', '2015-11-04 13:30:58');
INSERT INTO `oc_category` VALUES ('98', '', '59', '0', '1', '0', '1', '2015-11-04 13:31:23', '2015-11-04 13:31:23');
INSERT INTO `oc_category` VALUES ('99', '', '59', '0', '1', '0', '1', '2015-11-04 13:31:38', '2015-11-04 13:31:38');
INSERT INTO `oc_category` VALUES ('100', '', '59', '0', '1', '0', '1', '2015-11-04 13:31:51', '2015-11-04 13:31:51');
INSERT INTO `oc_category` VALUES ('101', '', '59', '0', '1', '0', '1', '2015-11-04 13:32:04', '2015-11-04 13:32:04');
INSERT INTO `oc_category` VALUES ('102', '', '59', '0', '1', '0', '1', '2015-11-04 13:32:17', '2015-11-04 13:32:17');
INSERT INTO `oc_category` VALUES ('103', '', '59', '0', '1', '0', '1', '2015-11-04 13:32:40', '2015-11-04 13:32:40');
INSERT INTO `oc_category` VALUES ('104', '', '59', '0', '1', '0', '1', '2015-11-04 13:33:01', '2015-11-04 13:33:01');
INSERT INTO `oc_category` VALUES ('105', '', '59', '0', '1', '0', '1', '2015-11-04 13:33:15', '2015-11-04 13:33:15');
INSERT INTO `oc_category` VALUES ('106', '', '59', '0', '1', '0', '1', '2015-11-04 13:33:27', '2015-11-04 13:33:27');
INSERT INTO `oc_category` VALUES ('107', '', '59', '0', '1', '0', '1', '2015-11-04 13:33:45', '2015-11-04 13:33:45');
INSERT INTO `oc_category` VALUES ('108', '', '59', '0', '1', '0', '1', '2015-11-04 13:34:00', '2015-11-04 13:34:00');
INSERT INTO `oc_category` VALUES ('109', '', '59', '0', '1', '0', '1', '2015-11-04 13:34:29', '2015-11-04 13:34:29');
INSERT INTO `oc_category` VALUES ('110', '', '59', '0', '1', '0', '1', '2015-11-04 13:34:45', '2015-11-04 13:34:45');
INSERT INTO `oc_category` VALUES ('111', '', '59', '0', '1', '0', '1', '2015-11-04 13:34:59', '2015-11-04 13:34:59');
INSERT INTO `oc_category` VALUES ('112', '', '59', '0', '1', '0', '1', '2015-11-04 13:35:12', '2015-11-04 13:35:12');
INSERT INTO `oc_category` VALUES ('113', '', '59', '0', '1', '0', '1', '2015-11-04 13:35:24', '2015-11-04 13:35:24');
INSERT INTO `oc_category` VALUES ('114', '', '59', '0', '1', '0', '1', '2015-11-04 13:35:41', '2015-11-04 13:35:41');
INSERT INTO `oc_category` VALUES ('115', '', '60', '0', '1', '0', '1', '2015-11-04 13:57:54', '2015-11-04 13:57:54');
INSERT INTO `oc_category` VALUES ('116', '', '60', '0', '1', '0', '1', '2015-11-04 13:58:07', '2015-11-04 13:58:07');
INSERT INTO `oc_category` VALUES ('117', '', '60', '0', '1', '0', '1', '2015-11-04 13:58:22', '2015-11-04 13:58:22');
INSERT INTO `oc_category` VALUES ('118', '', '60', '0', '1', '0', '1', '2015-11-04 13:58:38', '2015-11-04 13:58:38');
INSERT INTO `oc_category` VALUES ('119', '', '60', '0', '1', '0', '1', '2015-11-04 13:58:58', '2015-11-04 13:58:58');
INSERT INTO `oc_category` VALUES ('120', '', '60', '0', '1', '0', '1', '2015-11-04 13:59:13', '2015-11-04 13:59:13');
INSERT INTO `oc_category` VALUES ('121', '', '60', '0', '1', '0', '1', '2015-11-04 13:59:30', '2015-11-04 13:59:30');
INSERT INTO `oc_category` VALUES ('122', '', '60', '0', '1', '0', '1', '2015-11-04 13:59:46', '2015-11-04 13:59:46');
INSERT INTO `oc_category` VALUES ('123', '', '60', '0', '1', '0', '1', '2015-11-04 14:00:00', '2015-11-04 14:00:00');
INSERT INTO `oc_category` VALUES ('124', '', '60', '0', '1', '0', '1', '2015-11-04 14:00:18', '2015-11-04 14:00:18');
INSERT INTO `oc_category` VALUES ('125', '', '60', '0', '1', '0', '1', '2015-11-04 14:00:40', '2015-11-04 14:00:40');
INSERT INTO `oc_category` VALUES ('126', '', '60', '0', '1', '0', '1', '2015-11-04 14:01:07', '2015-11-04 14:01:07');
INSERT INTO `oc_category` VALUES ('127', '', '60', '0', '1', '0', '1', '2015-11-04 14:01:23', '2015-11-04 14:01:23');
INSERT INTO `oc_category` VALUES ('128', '', '60', '0', '1', '0', '1', '2015-11-04 14:01:36', '2015-11-04 14:01:36');
INSERT INTO `oc_category` VALUES ('129', '', '60', '0', '1', '0', '1', '2015-11-04 14:01:53', '2015-11-04 14:01:53');
INSERT INTO `oc_category` VALUES ('130', '', '60', '0', '1', '0', '1', '2015-11-04 14:02:14', '2015-11-04 14:02:14');
INSERT INTO `oc_category` VALUES ('131', '', '60', '0', '1', '0', '1', '2015-11-04 14:02:33', '2015-11-04 14:02:33');
INSERT INTO `oc_category` VALUES ('132', '', '60', '0', '1', '0', '1', '2015-11-04 14:02:47', '2015-11-04 14:02:47');
INSERT INTO `oc_category` VALUES ('133', '', '60', '0', '1', '0', '1', '2015-11-04 14:03:05', '2015-11-04 14:03:05');
INSERT INTO `oc_category` VALUES ('134', '', '60', '0', '1', '0', '1', '2015-11-04 14:03:18', '2015-11-04 14:03:18');
INSERT INTO `oc_category` VALUES ('135', '', '60', '0', '1', '0', '1', '2015-11-04 14:03:32', '2015-11-04 14:03:32');
INSERT INTO `oc_category` VALUES ('136', '', '60', '0', '1', '0', '1', '2015-11-04 14:03:46', '2015-11-04 14:03:46');
INSERT INTO `oc_category` VALUES ('137', '', '60', '0', '1', '0', '1', '2015-11-04 14:04:01', '2015-11-04 14:04:01');
INSERT INTO `oc_category` VALUES ('138', '', '60', '0', '1', '0', '1', '2015-11-04 14:04:16', '2015-11-04 14:04:16');
INSERT INTO `oc_category` VALUES ('139', '', '60', '0', '1', '0', '1', '2015-11-04 14:04:31', '2015-11-04 14:04:31');
INSERT INTO `oc_category` VALUES ('140', '', '60', '0', '1', '0', '1', '2015-11-04 14:04:47', '2015-11-04 14:04:47');
INSERT INTO `oc_category` VALUES ('141', '', '60', '0', '1', '0', '1', '2015-11-04 14:05:01', '2015-11-04 14:05:01');
INSERT INTO `oc_category` VALUES ('142', '', '60', '0', '1', '0', '1', '2015-11-04 14:05:15', '2015-11-04 14:05:15');
INSERT INTO `oc_category` VALUES ('143', '', '60', '0', '1', '0', '1', '2015-11-04 14:05:36', '2015-11-04 14:05:36');

-- ----------------------------
-- Table structure for oc_category_description
-- ----------------------------
DROP TABLE IF EXISTS `oc_category_description`;
CREATE TABLE `oc_category_description` (
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`category_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_category_description
-- ----------------------------
INSERT INTO `oc_category_description` VALUES ('75', '1', 'GUERLAIN', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'GUERLAIN', '', '');
INSERT INTO `oc_category_description` VALUES ('74', '1', 'GUCCI ', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'GUCCI ', '', '');
INSERT INTO `oc_category_description` VALUES ('73', '1', 'GIVENCHY', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'GIVENCHY', '', '');
INSERT INTO `oc_category_description` VALUES ('61', '1', 'Brand', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Brand', '', '');
INSERT INTO `oc_category_description` VALUES ('59', '1', 'Мужской парфюм', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Мужской парфюм', '', '');
INSERT INTO `oc_category_description` VALUES ('60', '1', 'Женский парфюм', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Женский парфюм', '', '');
INSERT INTO `oc_category_description` VALUES ('62', '1', 'ARMANI', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'ARMANI-brand', 'ARMANI', '');
INSERT INTO `oc_category_description` VALUES ('84', '1', 'CHLOE', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'CHLOE', '', '');
INSERT INTO `oc_category_description` VALUES ('83', '1', 'CERRUTI', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'CERRUTI', '', '');
INSERT INTO `oc_category_description` VALUES ('76', '1', 'HUGO BOSS', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'HUGO BOSS', '', '');
INSERT INTO `oc_category_description` VALUES ('77', '1', 'Kenzo', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Kenzo', '', '');
INSERT INTO `oc_category_description` VALUES ('78', '1', 'LACOSTE', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'LACOSTE', '', '');
INSERT INTO `oc_category_description` VALUES ('79', '1', 'Paco Rabanne', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Paco Rabanne', '', '');
INSERT INTO `oc_category_description` VALUES ('80', '1', 'Shaik', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Shaik', '', '');
INSERT INTO `oc_category_description` VALUES ('81', '1', 'VERSACE', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'VERSACE', '', '');
INSERT INTO `oc_category_description` VALUES ('82', '1', 'Cacharel', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Cacharel', '', '');
INSERT INTO `oc_category_description` VALUES ('63', '1', 'Baldessarini', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Baldessarini', '', '');
INSERT INTO `oc_category_description` VALUES ('64', '1', 'BVLGARİ', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'BVLGARİ', '', '');
INSERT INTO `oc_category_description` VALUES ('65', '1', 'Burberry', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Burberry', '', '');
INSERT INTO `oc_category_description` VALUES ('66', '1', 'Calvin Klein', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Calvin Klein', '', '');
INSERT INTO `oc_category_description` VALUES ('67', '1', 'Carolina Herrera', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Carolina Herrera', '', '');
INSERT INTO `oc_category_description` VALUES ('68', '1', 'CHANEL', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'CHANEL', '', '');
INSERT INTO `oc_category_description` VALUES ('69', '1', 'D&amp;G', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'D&amp;G', '', '');
INSERT INTO `oc_category_description` VALUES ('70', '1', 'Davidoff', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Davidoff', '', '');
INSERT INTO `oc_category_description` VALUES ('71', '1', 'DIOR', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'DIOR', '', '');
INSERT INTO `oc_category_description` VALUES ('72', '1', 'DİESEL', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'DİESEL', '', '');
INSERT INTO `oc_category_description` VALUES ('95', '1', 'ARMANI', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'ARMANI-brand', '', '');
INSERT INTO `oc_category_description` VALUES ('85', '1', 'DKNY', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'DKNY', '', '');
INSERT INTO `oc_category_description` VALUES ('86', '1', 'LANCOME', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'LANCOME', '', '');
INSERT INTO `oc_category_description` VALUES ('87', '1', 'LANVIN', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'LANVIN', '', '');
INSERT INTO `oc_category_description` VALUES ('88', '1', 'MANCERA', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'MANCERA', '', '');
INSERT INTO `oc_category_description` VALUES ('89', '1', 'MOSCHİNO', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'MOSCHİNO', '', '');
INSERT INTO `oc_category_description` VALUES ('90', '1', 'NINA RICCI', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'NINA RICCI', '', '');
INSERT INTO `oc_category_description` VALUES ('91', '1', 'RIHANNA', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'RIHANNA', '', '');
INSERT INTO `oc_category_description` VALUES ('92', '1', 'PRADA', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'PRADA', '', '');
INSERT INTO `oc_category_description` VALUES ('93', '1', 'TRUSSARDI', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'TRUSSARDI', '', '');
INSERT INTO `oc_category_description` VALUES ('94', '1', 'Viktor  &amp; Rolf', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Viktor  &amp; Rolf', '', '');
INSERT INTO `oc_category_description` VALUES ('96', '1', 'Baldessarini', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Baldessarini', '', '');
INSERT INTO `oc_category_description` VALUES ('97', '1', 'BVLGARİ', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'BVLGARİ', '', '');
INSERT INTO `oc_category_description` VALUES ('98', '1', 'Burberry', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Burberry', '', '');
INSERT INTO `oc_category_description` VALUES ('99', '1', 'Calvin Klein', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Calvin Klein', '', '');
INSERT INTO `oc_category_description` VALUES ('100', '1', 'Carolina Herrera', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Carolina Herrera', '', '');
INSERT INTO `oc_category_description` VALUES ('101', '1', 'CHANEL', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'CHANEL', '', '');
INSERT INTO `oc_category_description` VALUES ('102', '1', 'D&amp;G', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'D&amp;G', '', '');
INSERT INTO `oc_category_description` VALUES ('103', '1', 'Davidoff', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Davidoff', '', '');
INSERT INTO `oc_category_description` VALUES ('104', '1', 'DIOR', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'DIOR', '', '');
INSERT INTO `oc_category_description` VALUES ('105', '1', 'DİESEL', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'DİESEL', '', '');
INSERT INTO `oc_category_description` VALUES ('106', '1', 'GIVENCHY ', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'GIVENCHY ', '', '');
INSERT INTO `oc_category_description` VALUES ('107', '1', 'GUCCI', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'GUCCI', '', '');
INSERT INTO `oc_category_description` VALUES ('108', '1', 'GUERLAIN', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'GUERLAIN', '', '');
INSERT INTO `oc_category_description` VALUES ('109', '1', 'HUGO BOSS', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'HUGO BOSS', '', '');
INSERT INTO `oc_category_description` VALUES ('110', '1', 'Kenzo', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Kenzo', '', '');
INSERT INTO `oc_category_description` VALUES ('111', '1', 'LACOSTE', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'LACOSTE', '', '');
INSERT INTO `oc_category_description` VALUES ('112', '1', 'Paco Rabanne', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Paco Rabanne', '', '');
INSERT INTO `oc_category_description` VALUES ('113', '1', 'Shaik', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Shaik', '', '');
INSERT INTO `oc_category_description` VALUES ('114', '1', 'VERSACE', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'VERSACE', '', '');
INSERT INTO `oc_category_description` VALUES ('115', '1', 'ARMANI', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'ARMANI', '', '');
INSERT INTO `oc_category_description` VALUES ('116', '1', 'Burberry', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Burberry', '', '');
INSERT INTO `oc_category_description` VALUES ('117', '1', 'BVLGARI', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'BVLGARI', '', '');
INSERT INTO `oc_category_description` VALUES ('118', '1', 'Cacharel', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Cacharel', '', '');
INSERT INTO `oc_category_description` VALUES ('119', '1', 'Carolina Herrera', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Carolina Herrera', '', '');
INSERT INTO `oc_category_description` VALUES ('120', '1', 'CHANEL', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'CHANEL', '', '');
INSERT INTO `oc_category_description` VALUES ('121', '1', 'CERRUTI', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'CERRUTI', '', '');
INSERT INTO `oc_category_description` VALUES ('122', '1', 'CHLOE', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'CHLOE', '', '');
INSERT INTO `oc_category_description` VALUES ('123', '1', 'D&amp;G', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'D&amp;G', '', '');
INSERT INTO `oc_category_description` VALUES ('124', '1', 'DİOR', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'DİOR', '', '');
INSERT INTO `oc_category_description` VALUES ('125', '1', 'DKNY', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'DKNY', '', '');
INSERT INTO `oc_category_description` VALUES ('126', '1', 'GIVENCHY', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'GIVENCHY', '', '');
INSERT INTO `oc_category_description` VALUES ('127', '1', 'GUCCI', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'GUCCI', '', '');
INSERT INTO `oc_category_description` VALUES ('128', '1', 'GUERLAIN', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'GUERLAIN', '', '');
INSERT INTO `oc_category_description` VALUES ('129', '1', 'HUGO BOSS', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'HUGO BOSS', '', '');
INSERT INTO `oc_category_description` VALUES ('130', '1', 'KENZO', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'KENZO', '', '');
INSERT INTO `oc_category_description` VALUES ('131', '1', 'LACOSTE', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'LACOSTE', '', '');
INSERT INTO `oc_category_description` VALUES ('132', '1', 'LANCOME', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'LANCOME', '', '');
INSERT INTO `oc_category_description` VALUES ('133', '1', 'LANVIN', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'LANVIN', '', '');
INSERT INTO `oc_category_description` VALUES ('134', '1', 'MANCERA', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'MANCERA', '', '');
INSERT INTO `oc_category_description` VALUES ('135', '1', 'MOSCHİNO', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'MOSCHİNO', '', '');
INSERT INTO `oc_category_description` VALUES ('136', '1', 'NINA RICCI', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'NINA RICCI', '', '');
INSERT INTO `oc_category_description` VALUES ('137', '1', 'RIHANNA', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'RIHANNA', '', '');
INSERT INTO `oc_category_description` VALUES ('138', '1', 'Paco Rabanne', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Paco Rabanne', '', '');
INSERT INTO `oc_category_description` VALUES ('139', '1', 'PRADA', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'PRADA', '', '');
INSERT INTO `oc_category_description` VALUES ('140', '1', 'TRUSSARDI', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'TRUSSARDI', '', '');
INSERT INTO `oc_category_description` VALUES ('141', '1', 'SHAIK', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'SHAIK', '', '');
INSERT INTO `oc_category_description` VALUES ('142', '1', 'VERSACE', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'VERSACE', '', '');
INSERT INTO `oc_category_description` VALUES ('143', '1', 'Viktor  &amp; Rolf', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Viktor  &amp; Rolf', '', '');

-- ----------------------------
-- Table structure for oc_category_filter
-- ----------------------------
DROP TABLE IF EXISTS `oc_category_filter`;
CREATE TABLE `oc_category_filter` (
  `category_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_category_filter
-- ----------------------------

-- ----------------------------
-- Table structure for oc_category_path
-- ----------------------------
DROP TABLE IF EXISTS `oc_category_path`;
CREATE TABLE `oc_category_path` (
  `category_id` int(11) NOT NULL,
  `path_id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`path_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_category_path
-- ----------------------------
INSERT INTO `oc_category_path` VALUES ('74', '74', '1');
INSERT INTO `oc_category_path` VALUES ('74', '61', '0');
INSERT INTO `oc_category_path` VALUES ('73', '73', '1');
INSERT INTO `oc_category_path` VALUES ('73', '61', '0');
INSERT INTO `oc_category_path` VALUES ('72', '72', '1');
INSERT INTO `oc_category_path` VALUES ('72', '61', '0');
INSERT INTO `oc_category_path` VALUES ('71', '71', '1');
INSERT INTO `oc_category_path` VALUES ('71', '61', '0');
INSERT INTO `oc_category_path` VALUES ('70', '70', '1');
INSERT INTO `oc_category_path` VALUES ('70', '61', '0');
INSERT INTO `oc_category_path` VALUES ('69', '69', '1');
INSERT INTO `oc_category_path` VALUES ('69', '61', '0');
INSERT INTO `oc_category_path` VALUES ('68', '68', '1');
INSERT INTO `oc_category_path` VALUES ('68', '61', '0');
INSERT INTO `oc_category_path` VALUES ('67', '67', '1');
INSERT INTO `oc_category_path` VALUES ('67', '61', '0');
INSERT INTO `oc_category_path` VALUES ('66', '66', '1');
INSERT INTO `oc_category_path` VALUES ('66', '61', '0');
INSERT INTO `oc_category_path` VALUES ('65', '65', '1');
INSERT INTO `oc_category_path` VALUES ('65', '61', '0');
INSERT INTO `oc_category_path` VALUES ('64', '64', '1');
INSERT INTO `oc_category_path` VALUES ('64', '61', '0');
INSERT INTO `oc_category_path` VALUES ('59', '59', '0');
INSERT INTO `oc_category_path` VALUES ('63', '63', '1');
INSERT INTO `oc_category_path` VALUES ('63', '61', '0');
INSERT INTO `oc_category_path` VALUES ('62', '62', '1');
INSERT INTO `oc_category_path` VALUES ('62', '61', '0');
INSERT INTO `oc_category_path` VALUES ('61', '61', '0');
INSERT INTO `oc_category_path` VALUES ('60', '60', '0');
INSERT INTO `oc_category_path` VALUES ('75', '61', '0');
INSERT INTO `oc_category_path` VALUES ('95', '95', '1');
INSERT INTO `oc_category_path` VALUES ('95', '59', '0');
INSERT INTO `oc_category_path` VALUES ('94', '94', '1');
INSERT INTO `oc_category_path` VALUES ('94', '61', '0');
INSERT INTO `oc_category_path` VALUES ('93', '93', '1');
INSERT INTO `oc_category_path` VALUES ('93', '61', '0');
INSERT INTO `oc_category_path` VALUES ('92', '92', '1');
INSERT INTO `oc_category_path` VALUES ('92', '61', '0');
INSERT INTO `oc_category_path` VALUES ('91', '91', '1');
INSERT INTO `oc_category_path` VALUES ('91', '61', '0');
INSERT INTO `oc_category_path` VALUES ('90', '90', '1');
INSERT INTO `oc_category_path` VALUES ('90', '61', '0');
INSERT INTO `oc_category_path` VALUES ('89', '89', '1');
INSERT INTO `oc_category_path` VALUES ('89', '61', '0');
INSERT INTO `oc_category_path` VALUES ('88', '88', '1');
INSERT INTO `oc_category_path` VALUES ('88', '61', '0');
INSERT INTO `oc_category_path` VALUES ('87', '87', '1');
INSERT INTO `oc_category_path` VALUES ('87', '61', '0');
INSERT INTO `oc_category_path` VALUES ('86', '86', '1');
INSERT INTO `oc_category_path` VALUES ('86', '61', '0');
INSERT INTO `oc_category_path` VALUES ('85', '85', '1');
INSERT INTO `oc_category_path` VALUES ('85', '61', '0');
INSERT INTO `oc_category_path` VALUES ('84', '84', '1');
INSERT INTO `oc_category_path` VALUES ('84', '61', '0');
INSERT INTO `oc_category_path` VALUES ('83', '83', '1');
INSERT INTO `oc_category_path` VALUES ('83', '61', '0');
INSERT INTO `oc_category_path` VALUES ('82', '82', '1');
INSERT INTO `oc_category_path` VALUES ('82', '61', '0');
INSERT INTO `oc_category_path` VALUES ('81', '81', '1');
INSERT INTO `oc_category_path` VALUES ('81', '61', '0');
INSERT INTO `oc_category_path` VALUES ('80', '80', '1');
INSERT INTO `oc_category_path` VALUES ('80', '61', '0');
INSERT INTO `oc_category_path` VALUES ('79', '79', '1');
INSERT INTO `oc_category_path` VALUES ('79', '61', '0');
INSERT INTO `oc_category_path` VALUES ('78', '78', '1');
INSERT INTO `oc_category_path` VALUES ('78', '61', '0');
INSERT INTO `oc_category_path` VALUES ('77', '77', '1');
INSERT INTO `oc_category_path` VALUES ('77', '61', '0');
INSERT INTO `oc_category_path` VALUES ('76', '76', '1');
INSERT INTO `oc_category_path` VALUES ('76', '61', '0');
INSERT INTO `oc_category_path` VALUES ('75', '75', '1');
INSERT INTO `oc_category_path` VALUES ('96', '59', '0');
INSERT INTO `oc_category_path` VALUES ('96', '96', '1');
INSERT INTO `oc_category_path` VALUES ('97', '59', '0');
INSERT INTO `oc_category_path` VALUES ('97', '97', '1');
INSERT INTO `oc_category_path` VALUES ('98', '59', '0');
INSERT INTO `oc_category_path` VALUES ('98', '98', '1');
INSERT INTO `oc_category_path` VALUES ('99', '59', '0');
INSERT INTO `oc_category_path` VALUES ('99', '99', '1');
INSERT INTO `oc_category_path` VALUES ('100', '59', '0');
INSERT INTO `oc_category_path` VALUES ('100', '100', '1');
INSERT INTO `oc_category_path` VALUES ('101', '59', '0');
INSERT INTO `oc_category_path` VALUES ('101', '101', '1');
INSERT INTO `oc_category_path` VALUES ('102', '59', '0');
INSERT INTO `oc_category_path` VALUES ('102', '102', '1');
INSERT INTO `oc_category_path` VALUES ('103', '59', '0');
INSERT INTO `oc_category_path` VALUES ('103', '103', '1');
INSERT INTO `oc_category_path` VALUES ('104', '59', '0');
INSERT INTO `oc_category_path` VALUES ('104', '104', '1');
INSERT INTO `oc_category_path` VALUES ('105', '59', '0');
INSERT INTO `oc_category_path` VALUES ('105', '105', '1');
INSERT INTO `oc_category_path` VALUES ('106', '59', '0');
INSERT INTO `oc_category_path` VALUES ('106', '106', '1');
INSERT INTO `oc_category_path` VALUES ('107', '59', '0');
INSERT INTO `oc_category_path` VALUES ('107', '107', '1');
INSERT INTO `oc_category_path` VALUES ('108', '59', '0');
INSERT INTO `oc_category_path` VALUES ('108', '108', '1');
INSERT INTO `oc_category_path` VALUES ('109', '59', '0');
INSERT INTO `oc_category_path` VALUES ('109', '109', '1');
INSERT INTO `oc_category_path` VALUES ('110', '59', '0');
INSERT INTO `oc_category_path` VALUES ('110', '110', '1');
INSERT INTO `oc_category_path` VALUES ('111', '59', '0');
INSERT INTO `oc_category_path` VALUES ('111', '111', '1');
INSERT INTO `oc_category_path` VALUES ('112', '59', '0');
INSERT INTO `oc_category_path` VALUES ('112', '112', '1');
INSERT INTO `oc_category_path` VALUES ('113', '59', '0');
INSERT INTO `oc_category_path` VALUES ('113', '113', '1');
INSERT INTO `oc_category_path` VALUES ('114', '59', '0');
INSERT INTO `oc_category_path` VALUES ('114', '114', '1');
INSERT INTO `oc_category_path` VALUES ('115', '60', '0');
INSERT INTO `oc_category_path` VALUES ('115', '115', '1');
INSERT INTO `oc_category_path` VALUES ('116', '60', '0');
INSERT INTO `oc_category_path` VALUES ('116', '116', '1');
INSERT INTO `oc_category_path` VALUES ('117', '60', '0');
INSERT INTO `oc_category_path` VALUES ('117', '117', '1');
INSERT INTO `oc_category_path` VALUES ('118', '60', '0');
INSERT INTO `oc_category_path` VALUES ('118', '118', '1');
INSERT INTO `oc_category_path` VALUES ('119', '60', '0');
INSERT INTO `oc_category_path` VALUES ('119', '119', '1');
INSERT INTO `oc_category_path` VALUES ('120', '60', '0');
INSERT INTO `oc_category_path` VALUES ('120', '120', '1');
INSERT INTO `oc_category_path` VALUES ('121', '60', '0');
INSERT INTO `oc_category_path` VALUES ('121', '121', '1');
INSERT INTO `oc_category_path` VALUES ('122', '60', '0');
INSERT INTO `oc_category_path` VALUES ('122', '122', '1');
INSERT INTO `oc_category_path` VALUES ('123', '60', '0');
INSERT INTO `oc_category_path` VALUES ('123', '123', '1');
INSERT INTO `oc_category_path` VALUES ('124', '60', '0');
INSERT INTO `oc_category_path` VALUES ('124', '124', '1');
INSERT INTO `oc_category_path` VALUES ('125', '60', '0');
INSERT INTO `oc_category_path` VALUES ('125', '125', '1');
INSERT INTO `oc_category_path` VALUES ('126', '60', '0');
INSERT INTO `oc_category_path` VALUES ('126', '126', '1');
INSERT INTO `oc_category_path` VALUES ('127', '60', '0');
INSERT INTO `oc_category_path` VALUES ('127', '127', '1');
INSERT INTO `oc_category_path` VALUES ('128', '60', '0');
INSERT INTO `oc_category_path` VALUES ('128', '128', '1');
INSERT INTO `oc_category_path` VALUES ('129', '60', '0');
INSERT INTO `oc_category_path` VALUES ('129', '129', '1');
INSERT INTO `oc_category_path` VALUES ('130', '60', '0');
INSERT INTO `oc_category_path` VALUES ('130', '130', '1');
INSERT INTO `oc_category_path` VALUES ('131', '60', '0');
INSERT INTO `oc_category_path` VALUES ('131', '131', '1');
INSERT INTO `oc_category_path` VALUES ('132', '60', '0');
INSERT INTO `oc_category_path` VALUES ('132', '132', '1');
INSERT INTO `oc_category_path` VALUES ('133', '60', '0');
INSERT INTO `oc_category_path` VALUES ('133', '133', '1');
INSERT INTO `oc_category_path` VALUES ('134', '60', '0');
INSERT INTO `oc_category_path` VALUES ('134', '134', '1');
INSERT INTO `oc_category_path` VALUES ('135', '60', '0');
INSERT INTO `oc_category_path` VALUES ('135', '135', '1');
INSERT INTO `oc_category_path` VALUES ('136', '60', '0');
INSERT INTO `oc_category_path` VALUES ('136', '136', '1');
INSERT INTO `oc_category_path` VALUES ('137', '60', '0');
INSERT INTO `oc_category_path` VALUES ('137', '137', '1');
INSERT INTO `oc_category_path` VALUES ('138', '60', '0');
INSERT INTO `oc_category_path` VALUES ('138', '138', '1');
INSERT INTO `oc_category_path` VALUES ('139', '60', '0');
INSERT INTO `oc_category_path` VALUES ('139', '139', '1');
INSERT INTO `oc_category_path` VALUES ('140', '60', '0');
INSERT INTO `oc_category_path` VALUES ('140', '140', '1');
INSERT INTO `oc_category_path` VALUES ('141', '60', '0');
INSERT INTO `oc_category_path` VALUES ('141', '141', '1');
INSERT INTO `oc_category_path` VALUES ('142', '60', '0');
INSERT INTO `oc_category_path` VALUES ('142', '142', '1');
INSERT INTO `oc_category_path` VALUES ('143', '60', '0');
INSERT INTO `oc_category_path` VALUES ('143', '143', '1');

-- ----------------------------
-- Table structure for oc_category_to_layout
-- ----------------------------
DROP TABLE IF EXISTS `oc_category_to_layout`;
CREATE TABLE `oc_category_to_layout` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_category_to_layout
-- ----------------------------
INSERT INTO `oc_category_to_layout` VALUES ('59', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('60', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('61', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('62', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('63', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('64', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('65', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('66', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('67', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('68', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('69', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('70', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('71', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('72', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('73', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('74', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('75', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('76', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('77', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('78', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('79', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('80', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('81', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('82', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('83', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('84', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('85', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('86', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('87', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('88', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('89', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('90', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('91', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('92', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('93', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('94', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('95', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('96', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('97', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('98', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('99', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('100', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('101', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('102', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('103', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('104', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('105', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('106', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('107', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('108', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('109', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('110', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('111', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('112', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('113', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('114', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('115', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('116', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('117', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('118', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('119', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('120', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('121', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('122', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('123', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('124', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('125', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('126', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('127', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('128', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('129', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('130', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('131', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('132', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('133', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('134', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('135', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('136', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('137', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('138', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('139', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('140', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('141', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('142', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('143', '0', '0');

-- ----------------------------
-- Table structure for oc_category_to_store
-- ----------------------------
DROP TABLE IF EXISTS `oc_category_to_store`;
CREATE TABLE `oc_category_to_store` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_category_to_store
-- ----------------------------
INSERT INTO `oc_category_to_store` VALUES ('59', '0');
INSERT INTO `oc_category_to_store` VALUES ('60', '0');
INSERT INTO `oc_category_to_store` VALUES ('61', '0');
INSERT INTO `oc_category_to_store` VALUES ('62', '0');
INSERT INTO `oc_category_to_store` VALUES ('63', '0');
INSERT INTO `oc_category_to_store` VALUES ('64', '0');
INSERT INTO `oc_category_to_store` VALUES ('65', '0');
INSERT INTO `oc_category_to_store` VALUES ('66', '0');
INSERT INTO `oc_category_to_store` VALUES ('67', '0');
INSERT INTO `oc_category_to_store` VALUES ('68', '0');
INSERT INTO `oc_category_to_store` VALUES ('69', '0');
INSERT INTO `oc_category_to_store` VALUES ('70', '0');
INSERT INTO `oc_category_to_store` VALUES ('71', '0');
INSERT INTO `oc_category_to_store` VALUES ('72', '0');
INSERT INTO `oc_category_to_store` VALUES ('73', '0');
INSERT INTO `oc_category_to_store` VALUES ('74', '0');
INSERT INTO `oc_category_to_store` VALUES ('75', '0');
INSERT INTO `oc_category_to_store` VALUES ('76', '0');
INSERT INTO `oc_category_to_store` VALUES ('77', '0');
INSERT INTO `oc_category_to_store` VALUES ('78', '0');
INSERT INTO `oc_category_to_store` VALUES ('79', '0');
INSERT INTO `oc_category_to_store` VALUES ('80', '0');
INSERT INTO `oc_category_to_store` VALUES ('81', '0');
INSERT INTO `oc_category_to_store` VALUES ('82', '0');
INSERT INTO `oc_category_to_store` VALUES ('83', '0');
INSERT INTO `oc_category_to_store` VALUES ('84', '0');
INSERT INTO `oc_category_to_store` VALUES ('85', '0');
INSERT INTO `oc_category_to_store` VALUES ('86', '0');
INSERT INTO `oc_category_to_store` VALUES ('87', '0');
INSERT INTO `oc_category_to_store` VALUES ('88', '0');
INSERT INTO `oc_category_to_store` VALUES ('89', '0');
INSERT INTO `oc_category_to_store` VALUES ('90', '0');
INSERT INTO `oc_category_to_store` VALUES ('91', '0');
INSERT INTO `oc_category_to_store` VALUES ('92', '0');
INSERT INTO `oc_category_to_store` VALUES ('93', '0');
INSERT INTO `oc_category_to_store` VALUES ('94', '0');
INSERT INTO `oc_category_to_store` VALUES ('95', '0');
INSERT INTO `oc_category_to_store` VALUES ('96', '0');
INSERT INTO `oc_category_to_store` VALUES ('97', '0');
INSERT INTO `oc_category_to_store` VALUES ('98', '0');
INSERT INTO `oc_category_to_store` VALUES ('99', '0');
INSERT INTO `oc_category_to_store` VALUES ('100', '0');
INSERT INTO `oc_category_to_store` VALUES ('101', '0');
INSERT INTO `oc_category_to_store` VALUES ('102', '0');
INSERT INTO `oc_category_to_store` VALUES ('103', '0');
INSERT INTO `oc_category_to_store` VALUES ('104', '0');
INSERT INTO `oc_category_to_store` VALUES ('105', '0');
INSERT INTO `oc_category_to_store` VALUES ('106', '0');
INSERT INTO `oc_category_to_store` VALUES ('107', '0');
INSERT INTO `oc_category_to_store` VALUES ('108', '0');
INSERT INTO `oc_category_to_store` VALUES ('109', '0');
INSERT INTO `oc_category_to_store` VALUES ('110', '0');
INSERT INTO `oc_category_to_store` VALUES ('111', '0');
INSERT INTO `oc_category_to_store` VALUES ('112', '0');
INSERT INTO `oc_category_to_store` VALUES ('113', '0');
INSERT INTO `oc_category_to_store` VALUES ('114', '0');
INSERT INTO `oc_category_to_store` VALUES ('115', '0');
INSERT INTO `oc_category_to_store` VALUES ('116', '0');
INSERT INTO `oc_category_to_store` VALUES ('117', '0');
INSERT INTO `oc_category_to_store` VALUES ('118', '0');
INSERT INTO `oc_category_to_store` VALUES ('119', '0');
INSERT INTO `oc_category_to_store` VALUES ('120', '0');
INSERT INTO `oc_category_to_store` VALUES ('121', '0');
INSERT INTO `oc_category_to_store` VALUES ('122', '0');
INSERT INTO `oc_category_to_store` VALUES ('123', '0');
INSERT INTO `oc_category_to_store` VALUES ('124', '0');
INSERT INTO `oc_category_to_store` VALUES ('125', '0');
INSERT INTO `oc_category_to_store` VALUES ('126', '0');
INSERT INTO `oc_category_to_store` VALUES ('127', '0');
INSERT INTO `oc_category_to_store` VALUES ('128', '0');
INSERT INTO `oc_category_to_store` VALUES ('129', '0');
INSERT INTO `oc_category_to_store` VALUES ('130', '0');
INSERT INTO `oc_category_to_store` VALUES ('131', '0');
INSERT INTO `oc_category_to_store` VALUES ('132', '0');
INSERT INTO `oc_category_to_store` VALUES ('133', '0');
INSERT INTO `oc_category_to_store` VALUES ('134', '0');
INSERT INTO `oc_category_to_store` VALUES ('135', '0');
INSERT INTO `oc_category_to_store` VALUES ('136', '0');
INSERT INTO `oc_category_to_store` VALUES ('137', '0');
INSERT INTO `oc_category_to_store` VALUES ('138', '0');
INSERT INTO `oc_category_to_store` VALUES ('139', '0');
INSERT INTO `oc_category_to_store` VALUES ('140', '0');
INSERT INTO `oc_category_to_store` VALUES ('141', '0');
INSERT INTO `oc_category_to_store` VALUES ('142', '0');
INSERT INTO `oc_category_to_store` VALUES ('143', '0');

-- ----------------------------
-- Table structure for oc_country
-- ----------------------------
DROP TABLE IF EXISTS `oc_country`;
CREATE TABLE `oc_country` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `iso_code_2` varchar(2) NOT NULL,
  `iso_code_3` varchar(3) NOT NULL,
  `address_format` text NOT NULL,
  `postcode_required` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`country_id`)
) ENGINE=MyISAM AUTO_INCREMENT=227 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_country
-- ----------------------------
INSERT INTO `oc_country` VALUES ('20', 'Белоруссия (Беларусь)', 'BY', 'BLR', '', '0', '1');
INSERT INTO `oc_country` VALUES ('80', 'Грузия', 'GE', 'GEO', '', '0', '1');
INSERT INTO `oc_country` VALUES ('109', 'Казахстан', 'KZ', 'KAZ', '', '0', '1');
INSERT INTO `oc_country` VALUES ('115', 'Киргизия (Кыргызстан)', 'KG', 'KGZ', '', '0', '1');
INSERT INTO `oc_country` VALUES ('176', 'Российская Федерация', 'RU', 'RUS', '', '0', '1');
INSERT INTO `oc_country` VALUES ('220', 'Украина', 'UA', 'UKR', '', '0', '1');
INSERT INTO `oc_country` VALUES ('226', 'Узбекистан', 'UZ', 'UZB', '', '0', '1');

-- ----------------------------
-- Table structure for oc_coupon
-- ----------------------------
DROP TABLE IF EXISTS `oc_coupon`;
CREATE TABLE `oc_coupon` (
  `coupon_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `code` varchar(10) NOT NULL,
  `type` char(1) NOT NULL,
  `discount` decimal(15,4) NOT NULL,
  `logged` tinyint(1) NOT NULL,
  `shipping` tinyint(1) NOT NULL,
  `total` decimal(15,4) NOT NULL,
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  `uses_total` int(11) NOT NULL,
  `uses_customer` varchar(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`coupon_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_coupon
-- ----------------------------
INSERT INTO `oc_coupon` VALUES ('4', '-10% Discount', '2222', 'P', '10.0000', '0', '0', '0.0000', '2014-01-01', '2020-01-01', '10', '10', '0', '2009-01-27 13:55:03');
INSERT INTO `oc_coupon` VALUES ('5', 'Free Shipping', '3333', 'P', '0.0000', '0', '1', '100.0000', '2014-01-01', '2014-02-01', '10', '10', '0', '2009-03-14 21:13:53');
INSERT INTO `oc_coupon` VALUES ('6', '-10.00 Discount', '1111', 'F', '10.0000', '0', '0', '10.0000', '2014-01-01', '2020-01-01', '100000', '10000', '0', '2009-03-14 21:15:18');

-- ----------------------------
-- Table structure for oc_coupon_category
-- ----------------------------
DROP TABLE IF EXISTS `oc_coupon_category`;
CREATE TABLE `oc_coupon_category` (
  `coupon_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_id`,`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_coupon_category
-- ----------------------------

-- ----------------------------
-- Table structure for oc_coupon_history
-- ----------------------------
DROP TABLE IF EXISTS `oc_coupon_history`;
CREATE TABLE `oc_coupon_history` (
  `coupon_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`coupon_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_coupon_history
-- ----------------------------

-- ----------------------------
-- Table structure for oc_coupon_product
-- ----------------------------
DROP TABLE IF EXISTS `oc_coupon_product`;
CREATE TABLE `oc_coupon_product` (
  `coupon_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_coupon_product
-- ----------------------------

-- ----------------------------
-- Table structure for oc_currency
-- ----------------------------
DROP TABLE IF EXISTS `oc_currency`;
CREATE TABLE `oc_currency` (
  `currency_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `code` varchar(3) NOT NULL,
  `symbol_left` varchar(12) NOT NULL,
  `symbol_right` varchar(12) NOT NULL,
  `decimal_place` char(1) NOT NULL,
  `value` float(15,8) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`currency_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_currency
-- ----------------------------
INSERT INTO `oc_currency` VALUES ('2', 'Гривна', 'UAH', '', 'грн', '', '1.00000000', '1', '2015-11-04 16:56:58');

-- ----------------------------
-- Table structure for oc_customer
-- ----------------------------
DROP TABLE IF EXISTS `oc_customer`;
CREATE TABLE `oc_customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_group_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `cart` text,
  `wishlist` text,
  `newsletter` tinyint(1) NOT NULL DEFAULT '0',
  `address_id` int(11) NOT NULL DEFAULT '0',
  `custom_field` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `safe` tinyint(1) NOT NULL,
  `token` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_customer
-- ----------------------------

-- ----------------------------
-- Table structure for oc_customer_activity
-- ----------------------------
DROP TABLE IF EXISTS `oc_customer_activity`;
CREATE TABLE `oc_customer_activity` (
  `activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `data` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`activity_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_customer_activity
-- ----------------------------
INSERT INTO `oc_customer_activity` VALUES ('1', '0', 'return_guest', '{\"name\":\"\\u0432\\u044b\\u0430\\u0432\\u044b\\u0430\\u0432\\u044b \\u0432\\u044b\\u0430\\u0432\\u044b\\u0430\\u0432\\u044b\\u0430\",\"return_id\":1}', '127.0.0.1', '2015-11-04 16:49:36');

-- ----------------------------
-- Table structure for oc_customer_group
-- ----------------------------
DROP TABLE IF EXISTS `oc_customer_group`;
CREATE TABLE `oc_customer_group` (
  `customer_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `approval` int(1) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`customer_group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_customer_group
-- ----------------------------
INSERT INTO `oc_customer_group` VALUES ('1', '0', '1');

-- ----------------------------
-- Table structure for oc_customer_group_description
-- ----------------------------
DROP TABLE IF EXISTS `oc_customer_group_description`;
CREATE TABLE `oc_customer_group_description` (
  `customer_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`customer_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_customer_group_description
-- ----------------------------
INSERT INTO `oc_customer_group_description` VALUES ('1', '1', 'Default', 'test');

-- ----------------------------
-- Table structure for oc_customer_history
-- ----------------------------
DROP TABLE IF EXISTS `oc_customer_history`;
CREATE TABLE `oc_customer_history` (
  `customer_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_customer_history
-- ----------------------------

-- ----------------------------
-- Table structure for oc_customer_ip
-- ----------------------------
DROP TABLE IF EXISTS `oc_customer_ip`;
CREATE TABLE `oc_customer_ip` (
  `customer_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_ip_id`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_customer_ip
-- ----------------------------

-- ----------------------------
-- Table structure for oc_customer_login
-- ----------------------------
DROP TABLE IF EXISTS `oc_customer_login`;
CREATE TABLE `oc_customer_login` (
  `customer_login_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(96) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `total` int(4) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`customer_login_id`),
  KEY `email` (`email`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_customer_login
-- ----------------------------

-- ----------------------------
-- Table structure for oc_customer_online
-- ----------------------------
DROP TABLE IF EXISTS `oc_customer_online`;
CREATE TABLE `oc_customer_online` (
  `ip` varchar(40) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `url` text NOT NULL,
  `referer` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_customer_online
-- ----------------------------

-- ----------------------------
-- Table structure for oc_customer_reward
-- ----------------------------
DROP TABLE IF EXISTS `oc_customer_reward`;
CREATE TABLE `oc_customer_reward` (
  `customer_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `points` int(8) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_reward_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_customer_reward
-- ----------------------------

-- ----------------------------
-- Table structure for oc_customer_transaction
-- ----------------------------
DROP TABLE IF EXISTS `oc_customer_transaction`;
CREATE TABLE `oc_customer_transaction` (
  `customer_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_customer_transaction
-- ----------------------------

-- ----------------------------
-- Table structure for oc_customer_wishlist
-- ----------------------------
DROP TABLE IF EXISTS `oc_customer_wishlist`;
CREATE TABLE `oc_customer_wishlist` (
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_id`,`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_customer_wishlist
-- ----------------------------

-- ----------------------------
-- Table structure for oc_custom_field
-- ----------------------------
DROP TABLE IF EXISTS `oc_custom_field`;
CREATE TABLE `oc_custom_field` (
  `custom_field_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `value` text NOT NULL,
  `location` varchar(7) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`custom_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_custom_field
-- ----------------------------

-- ----------------------------
-- Table structure for oc_custom_field_customer_group
-- ----------------------------
DROP TABLE IF EXISTS `oc_custom_field_customer_group`;
CREATE TABLE `oc_custom_field_customer_group` (
  `custom_field_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`custom_field_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_custom_field_customer_group
-- ----------------------------

-- ----------------------------
-- Table structure for oc_custom_field_description
-- ----------------------------
DROP TABLE IF EXISTS `oc_custom_field_description`;
CREATE TABLE `oc_custom_field_description` (
  `custom_field_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`custom_field_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_custom_field_description
-- ----------------------------

-- ----------------------------
-- Table structure for oc_custom_field_value
-- ----------------------------
DROP TABLE IF EXISTS `oc_custom_field_value`;
CREATE TABLE `oc_custom_field_value` (
  `custom_field_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `custom_field_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`custom_field_value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_custom_field_value
-- ----------------------------

-- ----------------------------
-- Table structure for oc_custom_field_value_description
-- ----------------------------
DROP TABLE IF EXISTS `oc_custom_field_value_description`;
CREATE TABLE `oc_custom_field_value_description` (
  `custom_field_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`custom_field_value_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_custom_field_value_description
-- ----------------------------

-- ----------------------------
-- Table structure for oc_download
-- ----------------------------
DROP TABLE IF EXISTS `oc_download`;
CREATE TABLE `oc_download` (
  `download_id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(128) NOT NULL,
  `mask` varchar(128) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_download
-- ----------------------------

-- ----------------------------
-- Table structure for oc_download_description
-- ----------------------------
DROP TABLE IF EXISTS `oc_download_description`;
CREATE TABLE `oc_download_description` (
  `download_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`download_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_download_description
-- ----------------------------

-- ----------------------------
-- Table structure for oc_event
-- ----------------------------
DROP TABLE IF EXISTS `oc_event`;
CREATE TABLE `oc_event` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL,
  `trigger` text NOT NULL,
  `action` text NOT NULL,
  PRIMARY KEY (`event_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_event
-- ----------------------------
INSERT INTO `oc_event` VALUES ('1', 'voucher', 'post.order.history.add', 'total/voucher/send');

-- ----------------------------
-- Table structure for oc_extension
-- ----------------------------
DROP TABLE IF EXISTS `oc_extension`;
CREATE TABLE `oc_extension` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `code` varchar(32) NOT NULL,
  PRIMARY KEY (`extension_id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_extension
-- ----------------------------
INSERT INTO `oc_extension` VALUES ('1', 'payment', 'cod');
INSERT INTO `oc_extension` VALUES ('2', 'total', 'shipping');
INSERT INTO `oc_extension` VALUES ('3', 'total', 'sub_total');
INSERT INTO `oc_extension` VALUES ('4', 'total', 'tax');
INSERT INTO `oc_extension` VALUES ('5', 'total', 'total');
INSERT INTO `oc_extension` VALUES ('6', 'module', 'banner');
INSERT INTO `oc_extension` VALUES ('7', 'module', 'carousel');
INSERT INTO `oc_extension` VALUES ('8', 'total', 'credit');
INSERT INTO `oc_extension` VALUES ('9', 'shipping', 'flat');
INSERT INTO `oc_extension` VALUES ('10', 'total', 'handling');
INSERT INTO `oc_extension` VALUES ('11', 'total', 'low_order_fee');
INSERT INTO `oc_extension` VALUES ('12', 'total', 'coupon');
INSERT INTO `oc_extension` VALUES ('13', 'module', 'category');
INSERT INTO `oc_extension` VALUES ('14', 'module', 'account');
INSERT INTO `oc_extension` VALUES ('15', 'total', 'reward');
INSERT INTO `oc_extension` VALUES ('16', 'total', 'voucher');
INSERT INTO `oc_extension` VALUES ('17', 'payment', 'free_checkout');
INSERT INTO `oc_extension` VALUES ('18', 'module', 'featured');
INSERT INTO `oc_extension` VALUES ('19', 'module', 'slideshow');
INSERT INTO `oc_extension` VALUES ('20', 'module', 'latest');

-- ----------------------------
-- Table structure for oc_filter
-- ----------------------------
DROP TABLE IF EXISTS `oc_filter`;
CREATE TABLE `oc_filter` (
  `filter_id` int(11) NOT NULL AUTO_INCREMENT,
  `filter_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_filter
-- ----------------------------

-- ----------------------------
-- Table structure for oc_filter_description
-- ----------------------------
DROP TABLE IF EXISTS `oc_filter_description`;
CREATE TABLE `oc_filter_description` (
  `filter_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`filter_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_filter_description
-- ----------------------------

-- ----------------------------
-- Table structure for oc_filter_group
-- ----------------------------
DROP TABLE IF EXISTS `oc_filter_group`;
CREATE TABLE `oc_filter_group` (
  `filter_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`filter_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_filter_group
-- ----------------------------

-- ----------------------------
-- Table structure for oc_filter_group_description
-- ----------------------------
DROP TABLE IF EXISTS `oc_filter_group_description`;
CREATE TABLE `oc_filter_group_description` (
  `filter_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`filter_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_filter_group_description
-- ----------------------------

-- ----------------------------
-- Table structure for oc_geo_zone
-- ----------------------------
DROP TABLE IF EXISTS `oc_geo_zone`;
CREATE TABLE `oc_geo_zone` (
  `geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_modified` datetime NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`geo_zone_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_geo_zone
-- ----------------------------
INSERT INTO `oc_geo_zone` VALUES ('3', 'Зона НДС', 'Облагаемые НДС', '2014-09-09 11:48:13', '2014-05-21 22:30:20');

-- ----------------------------
-- Table structure for oc_information
-- ----------------------------
DROP TABLE IF EXISTS `oc_information`;
CREATE TABLE `oc_information` (
  `information_id` int(11) NOT NULL AUTO_INCREMENT,
  `bottom` int(1) NOT NULL DEFAULT '0',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`information_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_information
-- ----------------------------
INSERT INTO `oc_information` VALUES ('3', '1', '3', '1');
INSERT INTO `oc_information` VALUES ('4', '1', '1', '1');
INSERT INTO `oc_information` VALUES ('5', '1', '4', '1');
INSERT INTO `oc_information` VALUES ('6', '1', '2', '1');

-- ----------------------------
-- Table structure for oc_information_description
-- ----------------------------
DROP TABLE IF EXISTS `oc_information_description`;
CREATE TABLE `oc_information_description` (
  `information_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`information_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_information_description
-- ----------------------------
INSERT INTO `oc_information_description` VALUES ('4', '1', 'О нас', '&lt;p&gt;\r\n	About Us&lt;/p&gt;', 'О нас', '', '');
INSERT INTO `oc_information_description` VALUES ('5', '1', 'Условия соглашения', '&lt;p&gt;\r\n	Terms &amp;amp; Conditions&lt;/p&gt;', 'Условия соглашения', '', '');
INSERT INTO `oc_information_description` VALUES ('3', '1', 'Политика Безопасности', '&lt;p&gt;\r\n	Privacy Policy&lt;/p&gt;', 'Политика Безопасности', '', '');
INSERT INTO `oc_information_description` VALUES ('6', '1', 'Доставка', '&lt;p&gt;\r\n	Доставка осуществляется Новой почтой по наложному платежу&lt;br&gt;&lt;/p&gt;', 'Доставка', '', '');

-- ----------------------------
-- Table structure for oc_information_to_layout
-- ----------------------------
DROP TABLE IF EXISTS `oc_information_to_layout`;
CREATE TABLE `oc_information_to_layout` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_information_to_layout
-- ----------------------------
INSERT INTO `oc_information_to_layout` VALUES ('6', '0', '0');
INSERT INTO `oc_information_to_layout` VALUES ('4', '0', '0');

-- ----------------------------
-- Table structure for oc_information_to_store
-- ----------------------------
DROP TABLE IF EXISTS `oc_information_to_store`;
CREATE TABLE `oc_information_to_store` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_information_to_store
-- ----------------------------
INSERT INTO `oc_information_to_store` VALUES ('3', '0');
INSERT INTO `oc_information_to_store` VALUES ('4', '0');
INSERT INTO `oc_information_to_store` VALUES ('5', '0');
INSERT INTO `oc_information_to_store` VALUES ('6', '0');

-- ----------------------------
-- Table structure for oc_language
-- ----------------------------
DROP TABLE IF EXISTS `oc_language`;
CREATE TABLE `oc_language` (
  `language_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `code` varchar(5) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `image` varchar(64) NOT NULL,
  `directory` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_language
-- ----------------------------
INSERT INTO `oc_language` VALUES ('1', 'Russian', 'ru', 'ru_RU.UTF-8,ru_RU,russian', 'ru.png', 'russian', '1', '1');

-- ----------------------------
-- Table structure for oc_layout
-- ----------------------------
DROP TABLE IF EXISTS `oc_layout`;
CREATE TABLE `oc_layout` (
  `layout_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`layout_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_layout
-- ----------------------------
INSERT INTO `oc_layout` VALUES ('1', 'Home');
INSERT INTO `oc_layout` VALUES ('2', 'Product');
INSERT INTO `oc_layout` VALUES ('3', 'Category');
INSERT INTO `oc_layout` VALUES ('4', 'Default');
INSERT INTO `oc_layout` VALUES ('5', 'Manufacturer');
INSERT INTO `oc_layout` VALUES ('6', 'Account');
INSERT INTO `oc_layout` VALUES ('7', 'Checkout');
INSERT INTO `oc_layout` VALUES ('8', 'Contact');
INSERT INTO `oc_layout` VALUES ('9', 'Sitemap');
INSERT INTO `oc_layout` VALUES ('10', 'Affiliate');
INSERT INTO `oc_layout` VALUES ('11', 'Information');
INSERT INTO `oc_layout` VALUES ('12', 'Compare');
INSERT INTO `oc_layout` VALUES ('13', 'Search');

-- ----------------------------
-- Table structure for oc_layout_module
-- ----------------------------
DROP TABLE IF EXISTS `oc_layout_module`;
CREATE TABLE `oc_layout_module` (
  `layout_module_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `position` varchar(14) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`layout_module_id`)
) ENGINE=MyISAM AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_layout_module
-- ----------------------------
INSERT INTO `oc_layout_module` VALUES ('2', '4', '0', 'content_top', '0');
INSERT INTO `oc_layout_module` VALUES ('3', '4', '0', 'content_top', '1');
INSERT INTO `oc_layout_module` VALUES ('20', '5', '0', 'column_left', '2');
INSERT INTO `oc_layout_module` VALUES ('69', '10', 'affiliate', 'column_right', '1');
INSERT INTO `oc_layout_module` VALUES ('68', '6', 'account', 'column_right', '1');
INSERT INTO `oc_layout_module` VALUES ('84', '1', 'featured.28', 'content_top', '3');
INSERT INTO `oc_layout_module` VALUES ('83', '1', 'slideshow.27', 'content_top', '1');
INSERT INTO `oc_layout_module` VALUES ('72', '3', 'category', 'column_left', '1');
INSERT INTO `oc_layout_module` VALUES ('73', '3', 'banner.30', 'column_left', '2');
INSERT INTO `oc_layout_module` VALUES ('82', '1', 'carousel.29', 'content_top', '4');
INSERT INTO `oc_layout_module` VALUES ('85', '1', 'latest.32', 'content_top', '2');

-- ----------------------------
-- Table structure for oc_layout_route
-- ----------------------------
DROP TABLE IF EXISTS `oc_layout_route`;
CREATE TABLE `oc_layout_route` (
  `layout_route_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `route` varchar(255) NOT NULL,
  PRIMARY KEY (`layout_route_id`)
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_layout_route
-- ----------------------------
INSERT INTO `oc_layout_route` VALUES ('38', '6', '0', 'account/%');
INSERT INTO `oc_layout_route` VALUES ('17', '10', '0', 'affiliate/%');
INSERT INTO `oc_layout_route` VALUES ('44', '3', '0', 'product/category');
INSERT INTO `oc_layout_route` VALUES ('56', '1', '0', 'common/home');
INSERT INTO `oc_layout_route` VALUES ('20', '2', '0', 'product/product');
INSERT INTO `oc_layout_route` VALUES ('24', '11', '0', 'information/information');
INSERT INTO `oc_layout_route` VALUES ('23', '7', '0', 'checkout/%');
INSERT INTO `oc_layout_route` VALUES ('31', '8', '0', 'information/contact');
INSERT INTO `oc_layout_route` VALUES ('32', '9', '0', 'information/sitemap');
INSERT INTO `oc_layout_route` VALUES ('34', '4', '0', '');
INSERT INTO `oc_layout_route` VALUES ('45', '5', '0', 'product/manufacturer');
INSERT INTO `oc_layout_route` VALUES ('52', '12', '0', 'product/compare');
INSERT INTO `oc_layout_route` VALUES ('53', '13', '0', 'product/search');

-- ----------------------------
-- Table structure for oc_length_class
-- ----------------------------
DROP TABLE IF EXISTS `oc_length_class`;
CREATE TABLE `oc_length_class` (
  `length_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL,
  PRIMARY KEY (`length_class_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_length_class
-- ----------------------------
INSERT INTO `oc_length_class` VALUES ('1', '1.00000000');
INSERT INTO `oc_length_class` VALUES ('2', '10.00000000');
INSERT INTO `oc_length_class` VALUES ('3', '0.39370000');

-- ----------------------------
-- Table structure for oc_length_class_description
-- ----------------------------
DROP TABLE IF EXISTS `oc_length_class_description`;
CREATE TABLE `oc_length_class_description` (
  `length_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  PRIMARY KEY (`length_class_id`,`language_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_length_class_description
-- ----------------------------
INSERT INTO `oc_length_class_description` VALUES ('1', '1', 'Сантиметр', 'см');
INSERT INTO `oc_length_class_description` VALUES ('2', '1', 'Миллиметр', 'мм');

-- ----------------------------
-- Table structure for oc_location
-- ----------------------------
DROP TABLE IF EXISTS `oc_location`;
CREATE TABLE `oc_location` (
  `location_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `address` text NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `geocode` varchar(32) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `open` text NOT NULL,
  `comment` text NOT NULL,
  PRIMARY KEY (`location_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_location
-- ----------------------------

-- ----------------------------
-- Table structure for oc_manufacturer
-- ----------------------------
DROP TABLE IF EXISTS `oc_manufacturer`;
CREATE TABLE `oc_manufacturer` (
  `manufacturer_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`manufacturer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_manufacturer
-- ----------------------------
INSERT INTO `oc_manufacturer` VALUES ('17', 'Chanel', '', '0');
INSERT INTO `oc_manufacturer` VALUES ('12', 'Baldessarini', '', '0');
INSERT INTO `oc_manufacturer` VALUES ('13', 'Bvlgari', '', '0');
INSERT INTO `oc_manufacturer` VALUES ('14', 'Burberry', '', '0');
INSERT INTO `oc_manufacturer` VALUES ('15', 'Calvin Klein', '', '0');
INSERT INTO `oc_manufacturer` VALUES ('16', 'Carolina Herrera', '', '0');
INSERT INTO `oc_manufacturer` VALUES ('11', 'Armani', '', '0');
INSERT INTO `oc_manufacturer` VALUES ('18', 'D&amp;G', '', '0');
INSERT INTO `oc_manufacturer` VALUES ('19', 'Davidoff', '', '0');
INSERT INTO `oc_manufacturer` VALUES ('20', 'Dior', '', '0');
INSERT INTO `oc_manufacturer` VALUES ('21', 'Diesel', '', '0');
INSERT INTO `oc_manufacturer` VALUES ('22', 'Givenchy', '', '0');
INSERT INTO `oc_manufacturer` VALUES ('23', 'Gucci', '', '0');
INSERT INTO `oc_manufacturer` VALUES ('24', 'Guerlain', '', '0');
INSERT INTO `oc_manufacturer` VALUES ('25', 'Hugo boss', '', '0');
INSERT INTO `oc_manufacturer` VALUES ('26', 'Kenzo', '', '0');
INSERT INTO `oc_manufacturer` VALUES ('27', 'Lacoste', '', '0');
INSERT INTO `oc_manufacturer` VALUES ('28', 'Paco Rabanne', '', '0');
INSERT INTO `oc_manufacturer` VALUES ('29', 'Shaik', '', '0');
INSERT INTO `oc_manufacturer` VALUES ('30', 'Versace', '', '0');
INSERT INTO `oc_manufacturer` VALUES ('31', 'Cacharel', '', '0');
INSERT INTO `oc_manufacturer` VALUES ('32', 'Carolina Herrera', '', '0');
INSERT INTO `oc_manufacturer` VALUES ('33', 'CERRUTI', '', '0');
INSERT INTO `oc_manufacturer` VALUES ('34', 'Chloe', '', '0');
INSERT INTO `oc_manufacturer` VALUES ('35', 'Dkny', '', '0');
INSERT INTO `oc_manufacturer` VALUES ('36', 'MANCERA', '', '0');
INSERT INTO `oc_manufacturer` VALUES ('37', 'NİNA RİCCİ', '', '0');
INSERT INTO `oc_manufacturer` VALUES ('38', 'PRADA', '', '0');
INSERT INTO `oc_manufacturer` VALUES ('39', 'TRUSSARDI', '', '0');
INSERT INTO `oc_manufacturer` VALUES ('40', 'Viktor  &amp; Rolf', '', '0');

-- ----------------------------
-- Table structure for oc_manufacturer_to_store
-- ----------------------------
DROP TABLE IF EXISTS `oc_manufacturer_to_store`;
CREATE TABLE `oc_manufacturer_to_store` (
  `manufacturer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`manufacturer_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_manufacturer_to_store
-- ----------------------------
INSERT INTO `oc_manufacturer_to_store` VALUES ('11', '0');
INSERT INTO `oc_manufacturer_to_store` VALUES ('12', '0');
INSERT INTO `oc_manufacturer_to_store` VALUES ('13', '0');
INSERT INTO `oc_manufacturer_to_store` VALUES ('14', '0');
INSERT INTO `oc_manufacturer_to_store` VALUES ('15', '0');
INSERT INTO `oc_manufacturer_to_store` VALUES ('16', '0');
INSERT INTO `oc_manufacturer_to_store` VALUES ('17', '0');
INSERT INTO `oc_manufacturer_to_store` VALUES ('18', '0');
INSERT INTO `oc_manufacturer_to_store` VALUES ('19', '0');
INSERT INTO `oc_manufacturer_to_store` VALUES ('20', '0');
INSERT INTO `oc_manufacturer_to_store` VALUES ('21', '0');
INSERT INTO `oc_manufacturer_to_store` VALUES ('22', '0');
INSERT INTO `oc_manufacturer_to_store` VALUES ('23', '0');
INSERT INTO `oc_manufacturer_to_store` VALUES ('24', '0');
INSERT INTO `oc_manufacturer_to_store` VALUES ('25', '0');
INSERT INTO `oc_manufacturer_to_store` VALUES ('26', '0');
INSERT INTO `oc_manufacturer_to_store` VALUES ('27', '0');
INSERT INTO `oc_manufacturer_to_store` VALUES ('28', '0');
INSERT INTO `oc_manufacturer_to_store` VALUES ('29', '0');
INSERT INTO `oc_manufacturer_to_store` VALUES ('30', '0');
INSERT INTO `oc_manufacturer_to_store` VALUES ('31', '0');
INSERT INTO `oc_manufacturer_to_store` VALUES ('32', '0');
INSERT INTO `oc_manufacturer_to_store` VALUES ('33', '0');
INSERT INTO `oc_manufacturer_to_store` VALUES ('34', '0');
INSERT INTO `oc_manufacturer_to_store` VALUES ('35', '0');
INSERT INTO `oc_manufacturer_to_store` VALUES ('36', '0');
INSERT INTO `oc_manufacturer_to_store` VALUES ('37', '0');
INSERT INTO `oc_manufacturer_to_store` VALUES ('38', '0');
INSERT INTO `oc_manufacturer_to_store` VALUES ('39', '0');
INSERT INTO `oc_manufacturer_to_store` VALUES ('40', '0');

-- ----------------------------
-- Table structure for oc_marketing
-- ----------------------------
DROP TABLE IF EXISTS `oc_marketing`;
CREATE TABLE `oc_marketing` (
  `marketing_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  `code` varchar(64) NOT NULL,
  `clicks` int(5) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`marketing_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_marketing
-- ----------------------------

-- ----------------------------
-- Table structure for oc_modification
-- ----------------------------
DROP TABLE IF EXISTS `oc_modification`;
CREATE TABLE `oc_modification` (
  `modification_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `code` varchar(64) NOT NULL,
  `author` varchar(64) NOT NULL,
  `version` varchar(32) NOT NULL,
  `link` varchar(255) NOT NULL,
  `xml` mediumtext NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`modification_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_modification
-- ----------------------------

-- ----------------------------
-- Table structure for oc_module
-- ----------------------------
DROP TABLE IF EXISTS `oc_module`;
CREATE TABLE `oc_module` (
  `module_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `code` varchar(32) NOT NULL,
  `setting` text NOT NULL,
  PRIMARY KEY (`module_id`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_module
-- ----------------------------
INSERT INTO `oc_module` VALUES ('30', 'Category', 'banner', '{\"name\":\"Category\",\"banner_id\":\"6\",\"width\":\"182\",\"height\":\"182\",\"status\":\"1\"}');
INSERT INTO `oc_module` VALUES ('29', 'Home Page', 'carousel', '{\"name\":\"Home Page\",\"banner_id\":\"8\",\"width\":\"130\",\"height\":\"100\",\"status\":\"1\"}');
INSERT INTO `oc_module` VALUES ('28', 'Home Page', 'featured', '{\"name\":\"Home Page\",\"product\":[\"43\",\"40\",\"42\",\"30\"],\"limit\":\"4\",\"width\":\"200\",\"height\":\"200\",\"status\":\"1\"}');
INSERT INTO `oc_module` VALUES ('27', 'Home Page', 'slideshow', '{\"name\":\"Home Page\",\"banner_id\":\"7\",\"width\":\"1140\",\"height\":\"380\",\"status\":\"1\"}');
INSERT INTO `oc_module` VALUES ('31', 'Banner 1', 'banner', '{\"name\":\"Banner 1\",\"banner_id\":\"6\",\"width\":\"182\",\"height\":\"182\",\"status\":\"1\"}');
INSERT INTO `oc_module` VALUES ('32', 'Новинки', 'latest', '{\"name\":\"\\u041d\\u043e\\u0432\\u0438\\u043d\\u043a\\u0438\",\"limit\":\"8\",\"width\":\"200\",\"height\":\"200\",\"status\":\"1\"}');

-- ----------------------------
-- Table structure for oc_option
-- ----------------------------
DROP TABLE IF EXISTS `oc_option`;
CREATE TABLE `oc_option` (
  `option_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`option_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_option
-- ----------------------------

-- ----------------------------
-- Table structure for oc_option_description
-- ----------------------------
DROP TABLE IF EXISTS `oc_option_description`;
CREATE TABLE `oc_option_description` (
  `option_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`option_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_option_description
-- ----------------------------

-- ----------------------------
-- Table structure for oc_option_value
-- ----------------------------
DROP TABLE IF EXISTS `oc_option_value`;
CREATE TABLE `oc_option_value` (
  `option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `option_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`option_value_id`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_option_value
-- ----------------------------

-- ----------------------------
-- Table structure for oc_option_value_description
-- ----------------------------
DROP TABLE IF EXISTS `oc_option_value_description`;
CREATE TABLE `oc_option_value_description` (
  `option_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`option_value_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_option_value_description
-- ----------------------------

-- ----------------------------
-- Table structure for oc_order
-- ----------------------------
DROP TABLE IF EXISTS `oc_order`;
CREATE TABLE `oc_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_no` int(11) NOT NULL DEFAULT '0',
  `invoice_prefix` varchar(26) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `store_name` varchar(64) NOT NULL,
  `store_url` varchar(255) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `custom_field` text NOT NULL,
  `payment_firstname` varchar(32) NOT NULL,
  `payment_lastname` varchar(32) NOT NULL,
  `payment_company` varchar(40) NOT NULL,
  `payment_address_1` varchar(128) NOT NULL,
  `payment_address_2` varchar(128) NOT NULL,
  `payment_city` varchar(128) NOT NULL,
  `payment_postcode` varchar(10) NOT NULL,
  `payment_country` varchar(128) NOT NULL,
  `payment_country_id` int(11) NOT NULL,
  `payment_zone` varchar(128) NOT NULL,
  `payment_zone_id` int(11) NOT NULL,
  `payment_address_format` text NOT NULL,
  `payment_custom_field` text NOT NULL,
  `payment_method` varchar(128) NOT NULL,
  `payment_code` varchar(128) NOT NULL,
  `shipping_firstname` varchar(32) NOT NULL,
  `shipping_lastname` varchar(32) NOT NULL,
  `shipping_company` varchar(40) NOT NULL,
  `shipping_address_1` varchar(128) NOT NULL,
  `shipping_address_2` varchar(128) NOT NULL,
  `shipping_city` varchar(128) NOT NULL,
  `shipping_postcode` varchar(10) NOT NULL,
  `shipping_country` varchar(128) NOT NULL,
  `shipping_country_id` int(11) NOT NULL,
  `shipping_zone` varchar(128) NOT NULL,
  `shipping_zone_id` int(11) NOT NULL,
  `shipping_address_format` text NOT NULL,
  `shipping_custom_field` text NOT NULL,
  `shipping_method` varchar(128) NOT NULL,
  `shipping_code` varchar(128) NOT NULL,
  `comment` text NOT NULL,
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `order_status_id` int(11) NOT NULL DEFAULT '0',
  `affiliate_id` int(11) NOT NULL,
  `commission` decimal(15,4) NOT NULL,
  `marketing_id` int(11) NOT NULL,
  `tracking` varchar(64) NOT NULL,
  `language_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `currency_value` decimal(15,8) NOT NULL DEFAULT '1.00000000',
  `ip` varchar(40) NOT NULL,
  `forwarded_ip` varchar(40) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `accept_language` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_order
-- ----------------------------

-- ----------------------------
-- Table structure for oc_order_custom_field
-- ----------------------------
DROP TABLE IF EXISTS `oc_order_custom_field`;
CREATE TABLE `oc_order_custom_field` (
  `order_custom_field_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `custom_field_value_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL,
  `location` varchar(16) NOT NULL,
  PRIMARY KEY (`order_custom_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_order_custom_field
-- ----------------------------

-- ----------------------------
-- Table structure for oc_order_history
-- ----------------------------
DROP TABLE IF EXISTS `oc_order_history`;
CREATE TABLE `oc_order_history` (
  `order_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`order_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_order_history
-- ----------------------------

-- ----------------------------
-- Table structure for oc_order_option
-- ----------------------------
DROP TABLE IF EXISTS `oc_order_option`;
CREATE TABLE `oc_order_option` (
  `order_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_option_value_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL,
  PRIMARY KEY (`order_option_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_order_option
-- ----------------------------

-- ----------------------------
-- Table structure for oc_order_product
-- ----------------------------
DROP TABLE IF EXISTS `oc_order_product`;
CREATE TABLE `oc_order_product` (
  `order_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `tax` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `reward` int(8) NOT NULL,
  PRIMARY KEY (`order_product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_order_product
-- ----------------------------

-- ----------------------------
-- Table structure for oc_order_recurring
-- ----------------------------
DROP TABLE IF EXISTS `oc_order_recurring`;
CREATE TABLE `oc_order_recurring` (
  `order_recurring_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `recurring_name` varchar(255) NOT NULL,
  `recurring_description` varchar(255) NOT NULL,
  `recurring_frequency` varchar(25) NOT NULL,
  `recurring_cycle` smallint(6) NOT NULL,
  `recurring_duration` smallint(6) NOT NULL,
  `recurring_price` decimal(10,4) NOT NULL,
  `trial` tinyint(1) NOT NULL,
  `trial_frequency` varchar(25) NOT NULL,
  `trial_cycle` smallint(6) NOT NULL,
  `trial_duration` smallint(6) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`order_recurring_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_order_recurring
-- ----------------------------

-- ----------------------------
-- Table structure for oc_order_recurring_transaction
-- ----------------------------
DROP TABLE IF EXISTS `oc_order_recurring_transaction`;
CREATE TABLE `oc_order_recurring_transaction` (
  `order_recurring_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_recurring_id` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `amount` decimal(10,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`order_recurring_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_order_recurring_transaction
-- ----------------------------

-- ----------------------------
-- Table structure for oc_order_status
-- ----------------------------
DROP TABLE IF EXISTS `oc_order_status`;
CREATE TABLE `oc_order_status` (
  `order_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`order_status_id`,`language_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_order_status
-- ----------------------------
INSERT INTO `oc_order_status` VALUES ('1', '1', 'Ожидание');
INSERT INTO `oc_order_status` VALUES ('2', '1', 'В обработке');
INSERT INTO `oc_order_status` VALUES ('3', '1', 'Доставлено');
INSERT INTO `oc_order_status` VALUES ('7', '1', 'Отменено');
INSERT INTO `oc_order_status` VALUES ('5', '1', 'Сделка завершена');
INSERT INTO `oc_order_status` VALUES ('8', '1', 'Возврат');
INSERT INTO `oc_order_status` VALUES ('9', '1', 'Отмена и аннулирование');
INSERT INTO `oc_order_status` VALUES ('10', '1', 'Неудавшийся');
INSERT INTO `oc_order_status` VALUES ('11', '1', 'Возмещенный');
INSERT INTO `oc_order_status` VALUES ('12', '1', 'Полностью измененный');
INSERT INTO `oc_order_status` VALUES ('13', '1', 'Полный возврат');

-- ----------------------------
-- Table structure for oc_order_total
-- ----------------------------
DROP TABLE IF EXISTS `oc_order_total`;
CREATE TABLE `oc_order_total` (
  `order_total_id` int(10) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`order_total_id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_order_total
-- ----------------------------

-- ----------------------------
-- Table structure for oc_order_voucher
-- ----------------------------
DROP TABLE IF EXISTS `oc_order_voucher`;
CREATE TABLE `oc_order_voucher` (
  `order_voucher_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  PRIMARY KEY (`order_voucher_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_order_voucher
-- ----------------------------

-- ----------------------------
-- Table structure for oc_product
-- ----------------------------
DROP TABLE IF EXISTS `oc_product`;
CREATE TABLE `oc_product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(64) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `upc` varchar(12) NOT NULL,
  `ean` varchar(14) NOT NULL,
  `jan` varchar(13) NOT NULL,
  `isbn` varchar(17) NOT NULL,
  `mpn` varchar(64) NOT NULL,
  `location` varchar(128) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `stock_status_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `shipping` tinyint(1) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `points` int(8) NOT NULL DEFAULT '0',
  `tax_class_id` int(11) NOT NULL,
  `date_available` date NOT NULL DEFAULT '0000-00-00',
  `weight` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `weight_class_id` int(11) NOT NULL DEFAULT '0',
  `length` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `width` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `height` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `length_class_id` int(11) NOT NULL DEFAULT '0',
  `subtract` tinyint(1) NOT NULL DEFAULT '1',
  `minimum` int(11) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `viewed` int(5) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=159 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_product
-- ----------------------------
INSERT INTO `oc_product` VALUES ('66', 'D&amp;G pour HOMME', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/dg_pour_home/1.png', '18', '1', '800.0000', '0', '0', '2015-11-03', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-03 20:05:06', '2015-11-04 13:40:20');
INSERT INTO `oc_product` VALUES ('63', 'ALLURE HOMME SPORT', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/chanel_alure_sport_home/1.jpg', '17', '1', '800.0000', '0', '0', '2015-11-03', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-03 19:56:06', '2015-11-04 13:39:23');
INSERT INTO `oc_product` VALUES ('64', 'Bleu de Chanel', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/Chanel_Bleu_de_Chanel/1.jpg', '17', '1', '800.0000', '0', '0', '2015-11-03', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-03 19:58:37', '2015-11-04 13:39:48');
INSERT INTO `oc_product` VALUES ('65', 'PLATINIUM EGOISTE', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/chanel_platinum_egoiste/1.jpg', '17', '1', '800.0000', '0', '0', '2015-11-03', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-03 20:01:10', '2015-11-04 13:39:58');
INSERT INTO `oc_product` VALUES ('54', 'AQVA MARINE pour Homme EDT', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/Bvlgari_acqua_marine/1.jpg', '13', '1', '800.0000', '0', '0', '2015-11-03', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-03 19:06:59', '2015-11-04 13:38:31');
INSERT INTO `oc_product` VALUES ('55', 'BVLGARİ AQVA  pour homme edt', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/Bvlgari_acqua_marine/2.jpg', '13', '1', '800.0000', '0', '0', '2015-11-03', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-03 19:09:27', '2015-11-04 13:38:22');
INSERT INTO `oc_product` VALUES ('56', 'Burberry Burberry for men', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/Burberry _Burberry_for_men/1.jpg', '14', '1', '800.0000', '0', '0', '2015-11-03', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-03 19:15:43', '2015-11-04 13:38:03');
INSERT INTO `oc_product` VALUES ('58', 'Calvin Klein EUPHARIA  men', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/Calvin_Klein_EUPHARIA _men/1.jpg', '15', '1', '800.0000', '0', '0', '2015-11-03', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-03 19:33:36', '2015-11-04 13:38:41');
INSERT INTO `oc_product` VALUES ('59', 'Carolina Herrera  212 MEN', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/Carolina_Herrera_212_MEN/1.jpg', '16', '1', '800.0000', '0', '0', '2015-11-03', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '1', '2015-11-03 19:41:12', '2015-11-04 13:38:50');
INSERT INTO `oc_product` VALUES ('60', 'Herrera 212 VIP men', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/Carolina_Herrera_212_VIP_men/1.png', '16', '1', '800.0000', '0', '0', '2015-11-03', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-03 19:44:46', '2015-11-04 13:38:59');
INSERT INTO `oc_product` VALUES ('61', 'Herrera 212 VIP SEXY man', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/Carolina_Herrera_212_VIP_sexy_man/1.jpg', '16', '1', '800.0000', '0', '0', '2015-11-03', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-03 19:47:14', '2015-11-04 13:39:14');
INSERT INTO `oc_product` VALUES ('62', 'CHANEL ALLURE men', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/chanel_allure_men/1.jpg', '17', '1', '800.0000', '0', '0', '2015-11-03', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-03 19:52:54', '2015-11-04 13:39:36');
INSERT INTO `oc_product` VALUES ('50', 'Acqua Di Gio  man', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/ARMANI _Acqua_Di_Gio _man/1.jpg', '11', '0', '800.0000', '0', '0', '2015-11-03', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '2', '2015-11-03 16:58:09', '2015-11-04 13:37:21');
INSERT INTO `oc_product` VALUES ('51', 'Code  pour  Homme  125ml', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/ARMANI _Code _pour _Homme/1.jpg', '0', '1', '800.0000', '0', '0', '2015-11-03', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '1', '2015-11-03 18:30:04', '2015-11-04 13:37:32');
INSERT INTO `oc_product` VALUES ('52', 'Ambre men', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/Baldessarini_Ambre_men/1.jpeg', '12', '1', '800.0000', '0', '0', '2015-11-03', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '1', '2015-11-03 18:37:24', '2015-11-04 13:37:44');
INSERT INTO `oc_product` VALUES ('53', 'Del Mar', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/Baldessarini_Del_Mar/1.gif', '12', '1', '800.0000', '0', '0', '2015-11-03', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-03 18:59:15', '2015-11-04 13:37:52');
INSERT INTO `oc_product` VALUES ('67', 'LIGHT BLUE  pour Homme', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/dg_lightblue_pour_homme/1.jpg', '18', '1', '800.0000', '0', '0', '2015-11-03', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-03 20:07:28', '2015-11-04 13:40:13');
INSERT INTO `oc_product` VALUES ('68', 'The ONE  for man', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/dg_The_ONE _for_man/1.jpeg', '18', '1', '800.0000', '0', '0', '2015-11-03', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-03 20:10:33', '2015-11-04 13:40:26');
INSERT INTO `oc_product` VALUES ('69', 'The ONE SPORT for men', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/dg_the_one_sport_for_men/1.jpg', '18', '1', '800.0000', '0', '0', '2015-11-03', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-03 20:12:40', '2015-11-04 13:40:35');
INSERT INTO `oc_product` VALUES ('70', 'Davidoff Champion  man  90ml ', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/Davidoff_Champion _man/1.jpg', '19', '1', '800.0000', '0', '0', '2015-11-03', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '1', '2015-11-03 20:14:31', '2015-11-04 13:40:43');
INSERT INTO `oc_product` VALUES ('71', 'Champion Energy  man', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/Davidoff_Champion_Energy_man/1.jpg', '19', '1', '800.0000', '0', '0', '2015-11-03', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-03 20:17:14', '2015-11-04 13:40:51');
INSERT INTO `oc_product` VALUES ('72', 'FAHRENHEIT men 100 ml	', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/dior_fahrenheit_men/1.jpg', '20', '1', '800.0000', '0', '0', '2015-11-03', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-03 20:20:00', '2015-11-04 13:41:15');
INSERT INTO `oc_product` VALUES ('73', 'Only  the Brave men', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/diesel_Only_the_Brave_men/1.jpg', '21', '1', '800.0000', '0', '0', '2015-11-03', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-03 20:21:59', '2015-11-04 13:41:02');
INSERT INTO `oc_product` VALUES ('74', 'GIVENCHY  Pour Homme', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/given_Pour_Homme/1.jpg', '22', '1', '800.0000', '0', '0', '2015-11-03', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-03 20:24:00', '2015-11-04 13:41:24');
INSERT INTO `oc_product` VALUES ('75', 'Pour Homme Blue Label man', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/given_Pour_Homme_Blue_Label_man/1.jpg', '22', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 11:50:23', '2015-11-04 13:41:36');
INSERT INTO `oc_product` VALUES ('76', 'Gucci by Gucci Made to Measure  man ', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/Gucci_by_Gucci_Made_to_Measure_man/1.jpg', '23', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 11:53:33', '2015-11-04 13:42:04');
INSERT INTO `oc_product` VALUES ('77', ' Gucci by Gucci Pour Homme', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/Gucci_by_Gucci_Pour_Homme/1.jpg', '23', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 11:56:43', '2015-11-04 13:42:11');
INSERT INTO `oc_product` VALUES ('78', 'Gucci by Gucci SPORT  man', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/Gucci_by_Gucci_SPORT_man/1.jpg', '23', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 11:58:28', '2015-11-04 13:41:47');
INSERT INTO `oc_product` VALUES ('79', 'GUILTY  Homme', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/gucci_GUILTY_Homme/1.jpeg', '23', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 12:00:35', '2015-11-04 13:41:56');
INSERT INTO `oc_product` VALUES ('80', 'GUERLAIN  HOMME', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/guerlian_guerlian_homme/1.jpg', '24', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 12:29:00', '2015-11-04 13:42:21');
INSERT INTO `oc_product` VALUES ('81', 'HUGO BOSS BOTTLED man', '', '', '', '', '', '', '', '501', '7', 'catalog/aromaaura/hugo_boss_botled_man/1.jpg', '25', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 12:31:10', '2015-11-04 13:42:30');
INSERT INTO `oc_product` VALUES ('82', 'HUGO BOSS GREEN man', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/hugo_boss_green_man/1.JPG', '25', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 12:32:46', '2015-11-04 13:42:45');
INSERT INTO `oc_product` VALUES ('83', 'HUGO BOSS in Motion', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/hugo_boss_in_Motion/1.jpg', '25', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 12:34:40', '2015-11-04 13:43:03');
INSERT INTO `oc_product` VALUES ('84', 'HUGO BOSS in  Motion Black man', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/hugo_BOSS_in_Motion_Black_man/1.jpg', '25', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 12:46:03', '2015-11-04 13:42:55');
INSERT INTO `oc_product` VALUES ('85', 'HUGO BOSS №6   MEN', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/hugo_boss_n6_homme/1.jpg', '25', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 12:48:13', '2015-11-04 13:43:21');
INSERT INTO `oc_product` VALUES ('86', 'Hugo Boss Soul men', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/hugo_boss_soul_men/1.jpg', '25', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 12:50:46', '2015-11-04 13:43:12');
INSERT INTO `oc_product` VALUES ('87', 'Kenzo l\'eau par Kenzo pour homme', '', '', '', '', '', '', '', '500', '7', 'catalog/aromaaura/kenzo_l\'eau_par_Kenzo_pour_homme/1.jpg', '26', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 12:53:20', '2015-11-04 13:43:37');
INSERT INTO `oc_product` VALUES ('88', 'LACOSTE L12.12 BLANC man', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/lacoste_l12.12_man/1.jpg', '27', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 13:00:45', '2015-11-04 13:44:03');
INSERT INTO `oc_product` VALUES ('89', 'LACOSTE  ESSENTIAL  man ', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/lacoste_essential_man/1.jpg', '27', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 13:03:16', '2015-11-04 13:43:51');
INSERT INTO `oc_product` VALUES ('90', 'Lacoste L.12.12 Noir man', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/lacoste_L.12.12_Noir_man/1.jpg', '27', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 13:06:58', '2015-11-04 13:43:57');
INSERT INTO `oc_product` VALUES ('91', 'LACOSTE pour Homme', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/lacoste_pour_Homme/1.jpg', '27', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 13:09:47', '2015-11-04 13:44:12');
INSERT INTO `oc_product` VALUES ('92', 'Paco Rabanne BLACK XS  man  100ml ', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/paco_Rabanne_blackxs _man/1.jpg', '28', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 13:11:43', '2015-11-04 13:44:45');
INSERT INTO `oc_product` VALUES ('93', 'Paco Rabanne INVICTUS  man  100ml ', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/paco_rabanne_invuctus_man/1.jpg', '28', '1', '500.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 13:13:19', '2015-11-04 13:44:53');
INSERT INTO `oc_product` VALUES ('94', 'Paco Rabanne Ultraviolet man 100ml', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/paco_rabanne_ultraviolet_man/1.jpg', '28', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 13:14:53', '2015-11-04 13:45:02');
INSERT INTO `oc_product` VALUES ('95', 'Pacco rabbanne 1 million men', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/pacco_rabbanne_1_million_men/1.jpg', '28', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 13:17:18', '2015-11-04 13:44:31');
INSERT INTO `oc_product` VALUES ('96', 'Shaik Opulent Shaik Parfum N 77', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/shaik_opulent_shaik_parfum_n_77_men/1.jpg', '29', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 13:20:06', '2015-11-04 13:45:14');
INSERT INTO `oc_product` VALUES ('97', 'VERSACE  EROS  man', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/vercace_eros_man/1.jpg', '30', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 13:21:34', '2015-11-04 13:45:23');
INSERT INTO `oc_product` VALUES ('98', 'VERSACE  MAN EAU FRAICHE man', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/vercace_man-eau_fraince/1.png', '30', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 13:23:15', '2015-11-04 13:45:29');
INSERT INTO `oc_product` VALUES ('99', 'ARMANI  Acqua Di Gio woman', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/woman/armani_qcqua_di_gia/1.jpg', '11', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 14:21:53', '0000-00-00 00:00:00');
INSERT INTO `oc_product` VALUES ('100', 'Acqua Di Gioia  woman 100ml', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/woman/armani_acqua_di_gioia_woman/1.jpg', '0', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 14:24:04', '0000-00-00 00:00:00');
INSERT INTO `oc_product` VALUES ('101', 'Code pour Femme  75ml ', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/woman/3/1.jpg', '11', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 14:26:13', '0000-00-00 00:00:00');
INSERT INTO `oc_product` VALUES ('102', 'Burberry Weekend  for  Woman ', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/woman/4/1.jpg', '14', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 14:27:49', '0000-00-00 00:00:00');
INSERT INTO `oc_product` VALUES ('103', 'Burberry   My Burberry women EDP', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/woman/5/1.jpg', '14', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 14:29:45', '0000-00-00 00:00:00');
INSERT INTO `oc_product` VALUES ('104', 'Omnia crystalline  woman', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/woman/6/1.jpg', '13', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 14:31:44', '0000-00-00 00:00:00');
INSERT INTO `oc_product` VALUES ('105', 'Omnia Green Jade woman', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/woman/7/1.jpg', '13', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 14:34:20', '0000-00-00 00:00:00');
INSERT INTO `oc_product` VALUES ('106', 'BVLGARİ OMNIA CORAL', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/woman/8/1.jpg', '13', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 14:36:48', '0000-00-00 00:00:00');
INSERT INTO `oc_product` VALUES ('107', 'Cacharel  Amor Amor  woman', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/woman/9/1.png', '31', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 14:39:03', '0000-00-00 00:00:00');
INSERT INTO `oc_product` VALUES ('108', 'Carolina Herrera 212 VIP   woman', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/woman/10/1.jpeg', '16', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 14:40:51', '0000-00-00 00:00:00');
INSERT INTO `oc_product` VALUES ('109', 'Carolina Herrera 212 VIP ROSE women', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/woman/11/1.jpg', '16', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 14:49:15', '0000-00-00 00:00:00');
INSERT INTO `oc_product` VALUES ('110', 'CHANEL  ALLURE  woman  100ml', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/woman/12/1.jpg', '17', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 14:51:34', '0000-00-00 00:00:00');
INSERT INTO `oc_product` VALUES ('111', 'Chanel Allure Sensuelle woman 100 ml', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/woman/13/1.jpg', '17', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 14:52:54', '0000-00-00 00:00:00');
INSERT INTO `oc_product` VALUES ('112', 'Chanel Chance Eau Fraiche woman 100 ml', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/woman/13/1.jpg', '17', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 14:54:32', '0000-00-00 00:00:00');
INSERT INTO `oc_product` VALUES ('113', 'Chanel Chance Eau de Parfume  woman 100 ml', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/woman/15/1.jpg', '17', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 14:56:15', '0000-00-00 00:00:00');
INSERT INTO `oc_product` VALUES ('114', 'Chanel  Chance Eau de Toilette woman 100 ml', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/woman/16/1.jpg', '17', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 14:57:58', '0000-00-00 00:00:00');
INSERT INTO `oc_product` VALUES ('115', 'CHANEL NOIR women 100 ml', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/woman/17/1.jpg', '17', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 14:59:11', '0000-00-00 00:00:00');
INSERT INTO `oc_product` VALUES ('116', 'Chanel №5 woman  100 ml', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/woman/18/1.jpg', '17', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 15:00:40', '0000-00-00 00:00:00');
INSERT INTO `oc_product` VALUES ('117', 'Cerruti1881 women 100 ml', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/woman/20/1.jpg', '0', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 15:02:00', '0000-00-00 00:00:00');
INSERT INTO `oc_product` VALUES ('118', 'CHLOE Eau de Parfume 100 ml', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/woman/21/1.jpg', '34', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 15:04:43', '0000-00-00 00:00:00');
INSERT INTO `oc_product` VALUES ('119', 'D&amp;G 3 L’IMPERTRICE  woman 100ml', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/woman/19/1.jpg', '18', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 15:06:48', '0000-00-00 00:00:00');
INSERT INTO `oc_product` VALUES ('120', 'D&amp;G  Light  Blue for  woman  100 ml', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/woman/22/1.jpg', '18', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 15:09:35', '0000-00-00 00:00:00');
INSERT INTO `oc_product` VALUES ('121', 'D&amp;G  the One Desire  woman 75ml', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/woman/23/1.jpg', '18', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 15:11:30', '0000-00-00 00:00:00');
INSERT INTO `oc_product` VALUES ('122', 'D&amp;G  the ONE  woman  75ml', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/woman/24/1.jpeg', '18', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 15:15:22', '0000-00-00 00:00:00');
INSERT INTO `oc_product` VALUES ('123', 'DİOR ADDİCT parfum women 100 ml', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/woman/25/1.jpg', '20', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 15:17:03', '0000-00-00 00:00:00');
INSERT INTO `oc_product` VALUES ('124', 'DİOR Miss DİOR Cherie Blooming Bouquet 100 ml', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/woman/26/1.jpg', '20', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 15:18:31', '0000-00-00 00:00:00');
INSERT INTO `oc_product` VALUES ('125', 'DIOR  Hypnotic Poison   woman 100ml ', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/woman/27/1.jpg', '20', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 15:20:12', '0000-00-00 00:00:00');
INSERT INTO `oc_product` VALUES ('126', 'DIOR J\' ADOR de parfum 100ml', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/woman/28/1.jpg', '20', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 15:21:59', '0000-00-00 00:00:00');
INSERT INTO `oc_product` VALUES ('127', 'DKNY Be Delicious   woman 100ml ', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/woman/29/1.jpg', '35', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 15:23:23', '0000-00-00 00:00:00');
INSERT INTO `oc_product` VALUES ('128', 'GIVENCHY  Absolutely Esistible  woman 75ml ', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/woman/30/1.jpg', '22', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 15:24:38', '0000-00-00 00:00:00');
INSERT INTO `oc_product` VALUES ('129', 'Givenchy Ange Ou Demon Le Secret Eau deToilette 100 ml', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/woman/31/1.jpg', '22', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 15:27:54', '0000-00-00 00:00:00');
INSERT INTO `oc_product` VALUES ('130', 'Givenchy Play Intense woman 75 ml	   ', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/woman/32/1.jpg', '22', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 15:29:19', '0000-00-00 00:00:00');
INSERT INTO `oc_product` VALUES ('131', 'Givenchy Very Irresistible pour women 75 ml       ', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/woman/33/1.jpg', '22', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 15:30:57', '0000-00-00 00:00:00');
INSERT INTO `oc_product` VALUES ('132', 'Givenchy Very Irresistible Sensual women 75 ml ', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/woman/34/1.jpg', '22', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 15:32:08', '0000-00-00 00:00:00');
INSERT INTO `oc_product` VALUES ('133', 'Gucci ENVY Me 100 ml', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/woman/35/1.jpg', '23', '1', '500.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 15:34:20', '0000-00-00 00:00:00');
INSERT INTO `oc_product` VALUES ('134', 'GUCCİ Flora by  GUCCİ EDP 75 ml	', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/woman/36/1.jpg', '23', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 15:35:39', '0000-00-00 00:00:00');
INSERT INTO `oc_product` VALUES ('135', 'GUCCI  Guilty woman 75ml', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/woman/37/1.png', '23', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 15:45:52', '0000-00-00 00:00:00');
INSERT INTO `oc_product` VALUES ('136', 'GUCCI  Guilty black woman 75ml', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/woman/38/1.jpg', '23', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 15:47:15', '0000-00-00 00:00:00');
INSERT INTO `oc_product` VALUES ('137', 'Guerlain La Petite Robe Noire parfum 100 ml', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/woman/39/1.jpg', '24', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 15:48:56', '0000-00-00 00:00:00');
INSERT INTO `oc_product` VALUES ('138', 'HUGO BOSS JOUR woman 100ml', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/woman/40/1.jpg', '25', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 15:50:50', '0000-00-00 00:00:00');
INSERT INTO `oc_product` VALUES ('139', 'HUGO BOSS Ma Vie pour Femme 75 ml', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/woman/41/1.jpg', '25', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 15:52:11', '0000-00-00 00:00:00');
INSERT INTO `oc_product` VALUES ('140', 'HUGO BOSS Nuit pour Femme 75 ml	 ', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/woman/42/1.jpg', '25', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 15:53:20', '0000-00-00 00:00:00');
INSERT INTO `oc_product` VALUES ('141', 'Kenzo  L\'eau par Kenzo Colors pour Femme 100ml', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/woman/43/1.jpg', '26', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 15:55:18', '0000-00-00 00:00:00');
INSERT INTO `oc_product` VALUES ('142', 'Kenzo L\'Eau Par Kenzo pour Femme 100ml', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/woman/44/1.jpg', '0', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 15:56:56', '0000-00-00 00:00:00');
INSERT INTO `oc_product` VALUES ('143', 'Lacoste  pour Femme  100ml', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/woman/45/1.jpg', '27', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 15:58:14', '0000-00-00 00:00:00');
INSERT INTO `oc_product` VALUES ('144', 'Lancome Hypnose  woman  100ml', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/woman/46/1.jpg', '0', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 16:00:42', '0000-00-00 00:00:00');
INSERT INTO `oc_product` VALUES ('145', 'LANCOME Tresor  edp  femme 100 ml    ', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/woman/47/1.jpg', '0', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 16:02:17', '0000-00-00 00:00:00');
INSERT INTO `oc_product` VALUES ('146', ' LANVIN ECLAT D\'ARPEGE 100 ml', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/woman/48/LANVIN ECLAT D\'ARPEGE 100 ml.jpg', '0', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 16:04:49', '2015-11-04 16:51:31');
INSERT INTO `oc_product` VALUES ('147', 'Mancera Gold  Intensitive  Aoud  woman 100ml	', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/woman/49/1.jpg', '36', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 16:06:13', '0000-00-00 00:00:00');
INSERT INTO `oc_product` VALUES ('148', 'MOSCHİNO FUNNY 100 ml', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/woman/50/1.jpg', '0', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 16:10:07', '0000-00-00 00:00:00');
INSERT INTO `oc_product` VALUES ('149', 'Nina Ricci  Premier Jour  woman  100ml', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/woman/51/1.jpg', '37', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 16:12:38', '0000-00-00 00:00:00');
INSERT INTO `oc_product` VALUES ('150', 'Nina Ricci NINA 100 ml', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/woman/52/1.jpg', '37', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 16:14:22', '0000-00-00 00:00:00');
INSERT INTO `oc_product` VALUES ('151', 'Rihanna Reb\'l Fleur   woman 100ml', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/woman/53/1.jpg', '0', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 16:15:49', '0000-00-00 00:00:00');
INSERT INTO `oc_product` VALUES ('152', 'PACO RABANNE Lady  one  Million   80ml', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/woman/54/1.jpg', '28', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 16:17:21', '0000-00-00 00:00:00');
INSERT INTO `oc_product` VALUES ('153', 'Prada Candy 80 ml', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/woman/55/1.jpg', '38', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 16:18:44', '0000-00-00 00:00:00');
INSERT INTO `oc_product` VALUES ('154', 'TRUSSARDI DONNA women 100 ml', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/woman/56/1.jpg', '39', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 16:20:08', '0000-00-00 00:00:00');
INSERT INTO `oc_product` VALUES ('155', 'SHAIK №30  woman  100ml', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/woman/57/1.jpg', '29', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 16:21:31', '0000-00-00 00:00:00');
INSERT INTO `oc_product` VALUES ('156', 'Versace Bright Crystal 90 ml', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/woman/58/1.png', '30', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 16:22:50', '0000-00-00 00:00:00');
INSERT INTO `oc_product` VALUES ('157', 'VERSACE Crystal Noir women 90 ml', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/woman/59/1.jpg', '30', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-11-04 16:24:11', '0000-00-00 00:00:00');
INSERT INTO `oc_product` VALUES ('158', 'Viktor &amp; Rolf  Flower  Bomb edp  100 ml', '', '', '', '', '', '', '', '50', '7', 'catalog/aromaaura/woman/60/1.jpg', '40', '1', '800.0000', '0', '0', '2015-11-04', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '1', '2015-11-04 16:30:38', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for oc_product_attribute
-- ----------------------------
DROP TABLE IF EXISTS `oc_product_attribute`;
CREATE TABLE `oc_product_attribute` (
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`product_id`,`attribute_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_product_attribute
-- ----------------------------

-- ----------------------------
-- Table structure for oc_product_description
-- ----------------------------
DROP TABLE IF EXISTS `oc_product_description`;
CREATE TABLE `oc_product_description` (
  `product_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `tag` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`product_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_product_description
-- ----------------------------
INSERT INTO `oc_product_description` VALUES ('67', '1', 'D&amp;G LIGHT BLUE pour Homme 125ml ', '&lt;p&gt;Туалетная вода Dolce&amp;amp;Gabbana Light Blue pour Homme напоминает прозрачные воды океанов и морей, насыщенный соленой влагой свежий и порывистый&amp;nbsp; ветер, цветущие фруктовые сады и драгоценные капли древесных смол. В этом запахе парфюмерам удалось соединить энергию и спокойствие, заключить в один флакон силу, уверенность и мальчишеский задор.&lt;br&gt;Классификация аромата: цитрусовые фужерные. Начальная нота: сицилийский мандарин, можжевельник, грейпфрут, бергамот.&amp;nbsp; Нота &quot;сердца&quot;: розмарин, бразильское розовое дерево, перец.&amp;nbsp; Конечная нота: мускус, дубовый мох , ладан.&lt;br&gt;&lt;/p&gt;', '', 'D&amp;G LIGHT BLUE  pour Homme', '', '');
INSERT INTO `oc_product_description` VALUES ('68', '1', 'D&amp;G The ONE  for man 100ml ', '&lt;p&gt;Восточный древесно-пряный аромат с тонкой душой и теплыми оттенками, легкой цветочной мягкостью и табачной нотой. Парфюм отражает характер современного мужчины, каким его видит Dolce &amp;amp; Gabbana: харизматичного и соблазнительного, изящного и утонченного, он привык уделять внимание себе и своему телу. У него врожденный вкус и обаяние, и он настолько уверен в себе, что не боится проявлять свою индивидуальность в аромате, который носит. &lt;br&gt;Элегантность аромата Дольче Габана Зе Он фо Мен выражена нотами грейпфрута, кориандра и базилика. Кардамон, имбирь и флердоранж добавляют теплоты и чувственности. Истинно мужской характер подчеркивается гармонией табачных и кедровых оттенков. Верхние ноты: грейпфрут, кориандр, базилик. Ноты сердца: семена кардамона, имбирь, флердоранж. Базовые ноты: кедр, амбра, табак.&lt;br&gt;&lt;br&gt;&lt;/p&gt;', '', 'D&amp;G The ONE for man', '', '');
INSERT INTO `oc_product_description` VALUES ('69', '1', 'D&amp;G The ONE SPORT for men 100ml ', '&lt;p&gt;«У нас есть много друзей, которые постоянно ходят в тренажерный зал. Каждый из них отличается друг от друга, но все они занимаются спортом для себя, чтобы хорошо себя чувствовать и отлично выглядеть», – говорит дизайнер, цитируя, как главный слоган аромата, известную латинскую пословицу «В здоровом теле – здоровый дух».&lt;br&gt;Парфюмерная композиция открывается энергичным созвучием из ярких, навевающих вкус средиземноморья, оттенков розмарина, укрытых богатой свежестью водного аккорда с легкой примесью соленого моря. Сердце D&amp;amp;G The One Sport заполнено нотами пряного кардамона и древесиной американской секвойи. В финальном аккорде звучат пачули и мускус.&lt;br&gt;&lt;/p&gt;', '', 'D&amp;G The ONE SPORT for men', '', '');
INSERT INTO `oc_product_description` VALUES ('70', '1', 'Davidoff Champion  man  90ml ', 'Быть уверенным в себе и целенаправленно идти к выбранной цели – главные задачи тех, кто настроился стать истинным чемпионами! Champion, новый аромат от Davidoff, воплощает для таких людей приток сил и энергии, который они получают во время тренировки в спортзале или утреннего кросса. Символ истинной твердости характера и мужественности, Champion дарит своему владельцу веру в себя и позитивный настрой, прибавляя ему сил и стимулируя к полному раскрытию своего потенциала.&lt;br&gt;характеристика: освежающий. Начальная нота: бергамот, лимон. Нота &quot;сердца&quot;: гальбанум, мускатный шалфей. Конечная нота: дубовый мох, кедр.&lt;br&gt;', '', 'Davidoff Champion  man  90ml ', '', '');
INSERT INTO `oc_product_description` VALUES ('71', '1', 'Davidoff Champion Energy  man  90ml ', '&lt;p&gt;Davidoff «Champion Energy» - это парфюм, адресованный мужчинам, которые всегда и во всем побеждают, которые не привыкли сдаваться и отступать. Это аромат настоящих чемпионов, которые знают, что залог победы – это уверенность и решительность. Они крепко держат в руках ключ к успеху, не желая отдавать свое место под солнцем никому. Мужчина «Champion Energy» всегда стремится к совершенству, покоряя все новые вершины и открывая новые горизонты, чтобы достичь гармонии с самим собой.&lt;br&gt;Верхние ноты композиции раскрываются цитрусовым дуэтом душистого бергамота и сочного грейпфрута. В сердце аромата властвует вихрь свежести из гальбанума и специй. Шлейф парфюма формируют ноты благородного вирджинийского кедра и лесная магия дубового мха.&lt;br&gt;&lt;br&gt;&lt;/p&gt;', '', 'Davidoff Champion Energy  man', '', '');
INSERT INTO `oc_product_description` VALUES ('72', '1', 'DIOR FAHRENHEIT men 100 ml	', '&lt;p&gt;Давно ищете туалетную воду, обладающую неповторимым ароматом? Такой парфюм, над которым не будет властно время? Bаши поиски увенчались успехом. Туалетная вода Fahrenheit от Christian Dior- вот лучший пример нестареющей классики.&amp;nbsp;&amp;nbsp; Данная туалетная вода, словно хорошее вино, со временем становится лишь лучше. Стрелки часов бегут, листы календарей переворачиваются, но ничто неспособно сделать Fahrenheit устаревшим. &lt;br&gt;Ароматная пьеса состоит из зеленых, древесных аккордов, освежающих, бодрящих и наталкивающих на философские раздумья. Верхняя нота произведения представлена благородной кедровой древесиной. Средняя нотка – неподражаемой жимолостью. А основой композиции является изысканный боярышник.&lt;br&gt;&lt;/p&gt;', '', 'DIOR FAHRENHEIT men', '', '');
INSERT INTO `oc_product_description` VALUES ('73', '1', 'DİESEL Only  the Brave men', '&lt;p&gt;Истинно мужской аромат, сильный, смелый, уверенный, вызывающий. Diesel Only The Brave – парфюм для харизматичного парня, который всегда уверен в себе и четко знает, чего он хочет. Он живет одним днем и никогда не сдерживает своих порывов. Бывает немного резким, дерзким и это его конек. Ни одна девушка не останется равнодушной к мужчине Diesel Only The Brave. Обладатель этого аромата всегда окружен женским вниманием, купается в нем, упивается собственной неотразимостью. Сожми всю волю в кулак и заяви о себе громко, ярко, феерично, уверенно!&lt;br&gt;Верхние ноты: лимон и мандарин; ноты сердца: Кедр из Вирджинии, Кориандр и Фиалка; ноты базы: французский лабданум, Амбра, Стиракс, Бензоин и кожа.&lt;br&gt;&lt;/p&gt;', '', 'DİESEL Only  the Brave men', '', '');
INSERT INTO `oc_product_description` VALUES ('65', '1', 'CHANEL PLATINIUM EGOISTE 100 ml', '&lt;p&gt;Дорогой, элитный&amp;nbsp; люксовый парфюм &quot;Egoiste Platinum&quot; идеально подойдёт&amp;nbsp; честолюбивым, огненно-темпераментным, свободолюбивым, независимым, упорным&amp;nbsp; и непоколебимым&amp;nbsp; мужчинам, которые достойны быть&amp;nbsp; королями. Его выбирают настоящие&amp;nbsp; любители&amp;nbsp; активного и энергичного образа жизни, захватывающих приключений и путешествий, полной свободы и ярких, красочных впечатлений, его покупают настоящие сильные и мужественные мужчины, обладающие изысканным вкусом, пылкостью и романтикой.&lt;br&gt;В верхних нотах восхитительного парфюма освежающая лаванда, бодрящий розмарин, чувственные цветы нероли и тонизирующий петитгрейн.Сердечные ноты звучат аккордами&amp;nbsp; изысканного гальбанума,тёрпкого шалфея, нежного жасмина и соблазнительной герани. Благоухающий шлейф обволакивают нотами бархатной амбры, притягательного сандала,зелёного дубового мха, ветивера и тёплого кедра.&lt;br&gt;&lt;/p&gt;', '', 'CHANEL PLATINIUM EGOISTE', '', '');
INSERT INTO `oc_product_description` VALUES ('66', '1', 'D&amp;G pour HOMME 125ml ', '&lt;p&gt;&amp;nbsp;Dolce and Gabbana pour Homme - воплощение мужественности, индивидуальности, стильности. Смесь искренней иронии и непосредственности с твердой решительностью и целеустремленностью. Сочетания цитрусовых нот с легкими и свежими цветочными оттенками и древесиной дарят вам бодрость и свежесть. Этот парфюм предназначен для мужчины который хочет не создать впечатление, а просто быть собой.&lt;br&gt;&amp;nbsp;Аромат: шипровый/древесный/пряный.&lt;br&gt;&lt;/p&gt;', '', 'D&amp;G pour HOMME', '', '');
INSERT INTO `oc_product_description` VALUES ('50', '1', 'ARMANI  Acqua Di Gio  man 100ml', 'Эта туалетная вода представляет собой подлинный эталон стиля в мире парфюмерии для мужчин. Элегантный и свежий, удивительно чистый и нежно-чувственный парфюм наделен потрясающей силой очарования и притягательности, отличаясь яркими и сочными цветочно-фруктовыми нотами. Прелюдия парфюмерного букета цитрусовая, в нем присутствует также бергамот и розмарин, которые стремительно перебивает сладость тропических фруктов, соленые морские волны, яркая цветочная феерия жасмина, фрезии и цикламена. Завершающие аккорды теплые и мягкие благодаря кедру, мху, мускусу, амбре и пачули. Такой аромат придает своему обладателю аристократическую изысканность и утонченную элегантность, что свойственно духам от Армани. Позвольте себе маленькую роскошь! Воплощать мечты в реальность! &lt;br&gt;', '', 'ARMANI  Acqua Di Gio  man', '', '');
INSERT INTO `oc_product_description` VALUES ('51', '1', 'ARMANI  Code  pour  Homme  125ml', '&lt;p&gt;Выразительный и благородный,&amp;nbsp; Armani Code станет завершающим штрихом в идеальном образе современного мужчины, который следует последним модным тенденциям. Этот мужчина – по-настоящему шикарен, элегантен, немножко брутален, утончен и уверен в себе.&amp;nbsp; Благодаря мужскому шарму, идеально подчеркнутому ароматом&amp;nbsp; Armani Code, перед ним не сможет устоять ни одна женщина.&lt;br&gt;Профессионалы модного итальянского дома Giorgio Armani создали завораживающую композицию благодаря соединению аккордов бергамота и лимона с нежными нотками звездчатого аниса и цветков оливкового дерева, окутанными смесью масел дерева Гваяк. Нижние, табачно-кожные и древесные ноты, делают ультра-мужской аромат феноменально стойким и интригующим.&lt;br&gt;&lt;/p&gt;', '', 'ARMANI  Code  pour  Homme ', '', '');
INSERT INTO `oc_product_description` VALUES ('52', '1', 'Baldessarini Ambre men 100ml', '&lt;p&gt;Он предназначен для состоявшихся мужчин, которым не надо никому ничего доказывать. Теплая, древесно-ориентальная композиция с ключевыми нотами древесины дуба и виски, с фруктово-цветочным аккордом и лаконичной древесно-амбровой базой. Отличительная черта носителя аромата Baldessarini Ambre - расслабленная уверенность в себе. Его непринужденность, шарм и абсолютная уверенность в себе берут свое начало во внутренней свободе. Его образ продуман до мелочей, а потому безупречен. Характеристика: благородный, сильный, соблазнительный, элегантный. начальная нота: виски, мандарин, красное яблоко, нота &quot;сердца&quot;: фиалка, кожаный аккорд ,&amp;nbsp; конечная нота: амбра, дуб, ваниль, лабданум.&lt;br&gt;&lt;/p&gt;', '', 'Baldessarini Ambre men', '', '');
INSERT INTO `oc_product_description` VALUES ('53', '1', 'Baldessarini Del Mar 100ml', '&lt;p&gt;Этот аромат ассоциируется с роскошным и дорогим мужчиной,у которого есть собственный изысканный вкус и превосходное чувство прекрасного. Парфюм похож на отдых, наполненный&amp;nbsp; романтическими приключениями на далёком экзотическом острове с лазурным берегом, песчаными пляжами и&amp;nbsp; брызгами прохладительной морской солёной воды. Балдесарини Дел Мар - аромат настоящего и сильного мужчины, любителя приключений, гармоничного, самодостаточного и интеллектуального человека. Верхние ноты начинаются всплеском морской стихии, которая превосходно сочетается с тёплым летним солнцем и&amp;nbsp; плавно переходит в&amp;nbsp; ноты тёрпкого перца и сочного спелого мандарина.&lt;br&gt;&lt;br&gt;&lt;/p&gt;', '', 'Baldessarini Del Mar 100ml', '', '');
INSERT INTO `oc_product_description` VALUES ('54', '1', 'BVLGARİ AQVA MARINE pour Homme EDT 100ml', '&lt;p&gt;Парфюм Bvlgari Aqva pour Homme Marine, словно частичка моря, заключенная в круглый красивый флакон, напоминающий камень, поднятый со дна моря. Bvlgari Aqva pour Homme Marine, словно драгоценный аквамарин станет достойным Вам украшением, добавив в Ваш образ некой таинственности и сексуальности. Содержит ноты: посидония, грейпфрут, розмарин, нероли, кедр, амбра.&lt;br&gt;&lt;/p&gt;', '', 'BVLGARİ AQVA MARINE pour Homme EDT', '', '');
INSERT INTO `oc_product_description` VALUES ('55', '1', 'BVLGARİ AQVA  pour homme edt 100ml', '&lt;p&gt;Вдыхая аромат Bvlgari Aqva pour home, вас охватывает прохлада газированной воды с кубиками льда, которые звенят в фужере и будоражат воображение. Он водно-фужерный, чистый, прозрачный, свежий и оригинальный, делает мечты реальностью. Это чёрная жемчужина, таящая в себе всю силу океана. Сочный лимон и дикая голубая мята поднимают настроение открывая аромат, завораживают ноты воды и морских водорослей, а шлейф из ветивера и амбры придаёт уверенность и успокаивает.&lt;br&gt;&lt;/p&gt;', '', 'BVLGARİ AQVA  pour homme edt', '', '');
INSERT INTO `oc_product_description` VALUES ('56', '1', 'Burberry Burberry for men 100ml', '&lt;p&gt;Аромат является удивительным сочетанием спокойствия и страстности, элегантности и естественности.. Он является настоящим примером английского вкуса и утонченной элегантности. Парфюмерная композиция подойдет уверенному в своих силах жителю города, который ценит дорогие вещи. Шикарный древесный аромат окутает своего обладателя ароматным облаком сильных и очень чувственных оттенков, которые обязательно привлекут к нему повышенное внимание особ прекрасного пола, а также обеспечат уважение друзей и коллег по работе. Больше всего подходит для дневного времени.&amp;nbsp; Семейство ароматов: ароматические, древесные. Начальные ноты: мята, лаванда.&lt;br&gt;&lt;/p&gt;', '', 'Burberry Burberry for men', '', '');
INSERT INTO `oc_product_description` VALUES ('58', '1', 'Calvin Klein EUPHARIA  men  100ml ', '&lt;p&gt;Calvin Klein Euphoria Men – это невероятно стильный аромат для современных мужчин, у которых страстность и чувственность сочетаются с нежностью и благородством. Этот роскошный запах станет лучшим украшением стильного делового образа. В неповторимых переливах Calvin Klein Euphoria Men дикая энергия экзотических лесов соединилась с чувственностью цветочных переливов и мистичностью пряных нот. Этот аромат можно использовать не только днем, но и как дополнение к изысканному вечернему образу. &lt;br&gt;Классификация аромата: древесные фужерные. Начальная нота: перец, имбирь. Нота &quot;сердца&quot;: базилик, листья кедра, шалфей. Конечная нота: пачули, секвойя, замша, амбра. &lt;br&gt;&lt;/p&gt;', '', 'Calvin Klein EUPHARIA  men', '', '');
INSERT INTO `oc_product_description` VALUES ('59', '1', 'Carolina Herrera  212 MEN 100 ML', '&lt;p&gt;«212 Men» — свежий аромат с нетрадиционными для мужской парфюмерии цветочными нотами, что, тем не менее, не делает его менее мужественным. Благородный, инновационный, элегантный и нежный, этот теплый аромат несет в себе стойкую чувственность. Вдохновленный ритмом Нью-Йорка, «212 Men» является воплощением современного стиля.&lt;br&gt;Ноты аромата: лаванда, гваяковое дерево, сандал, мускус, имбирь, мандарин, бергамот, древесина, грейпфрут, зелень, гардения, ветивер, цитрусовые, перец, ладан, трава свежескошенная, пряности, водные ноты.&lt;br&gt;&lt;/p&gt;', '', 'Carolina Herrera  212 MEN', '', '');
INSERT INTO `oc_product_description` VALUES ('60', '1', 'Carolina Herrera 212 VIP men 100ml ', '&lt;p&gt;212 Vip Men от Carolina Herrera - парфюм для мужчин, предпочитающих экспрессивность, нестандартные решения и динамизм. Этот аромат способен стать стильным аксессуаром на вечеринках или свидании - манящий, соблазнительный, он действует на представительниц прекрасного пола как огонь свечи на мотылька. Аромат отразит характер своего обладателя молодого, стильного тусовщика, обожающего жизнь ночных городов, искателя приключений и новых эмоций.&lt;br&gt;Семейство: восточные, древесные. Тип: для вечернего выхода в свет. Начальные ноты: лайм, черная икра, перец, имбирь и маракуйя. Ноты сердца: специи, водка, джин и голубая мята. Базовые ноты: амбра, кожа и древесные ноты.&lt;br&gt;&lt;/p&gt;', '', 'Carolina Herrera 212 VIP men', '', '');
INSERT INTO `oc_product_description` VALUES ('61', '1', 'Carolina Herrera 212 VIP SEXY man 100ml ', '&lt;p&gt;Освежающий, восточный аромат, полный удивительных оттенков, неповторим и своеобразен. Свежие ноты итальянского бергамота и мандарина говорят о его динамичности и энергии, «сердечные» ноты ванили и гваякового дерева рассказывают о его благородстве, а кардамон убеждает в том, что перед вами – яркая личность, которой легко удается сочетать индивидуальность и простоту, создавая всегда актуальный, классический стиль.&lt;br&gt;Характеристика: восточные пряные.&amp;nbsp;&amp;nbsp; Начальная нота: итальянский бергамот, мандарин. Нота сердца; ваниль, гваяковое дерево. Конечная нота: кардамон.&lt;br&gt;&lt;/p&gt;', '', 'Carolina Herrera 212 VIP SEXY man', '', '');
INSERT INTO `oc_product_description` VALUES ('62', '1', 'CHANEL ALLURE men 100ml ', '&lt;p&gt;«Стиль создает мужчину!» - таков девиз Allure Pour Homme. Он не гонется за модой и не прибегает к ее уловкам и ухищрениям, относясь ко многим вещам со свойственным ему легкомыслием и беспечностью. Он знает, что для того, чтобы затмить других и быть привлекательным, не нужно кричать и надеяться, что тебя услышать. Можно произвести эффект, если предложить миру что-то необычное, как например, смешение четырех разных оттенков сразу – чувственных, свежих, древесных и пряных. Чтобы вместе они составили гармоничный союз и зазвучали как единое целое – как Allure Pour Homme. Композиция: мандарин, лимон, персик, бергамот, фрезия, герань, роза, жасмин, бензоин, бобы тонка, сандал, ваниль, кедр, ветивер.&lt;br&gt;&lt;/p&gt;', '', 'CHANEL ALLURE men', '', '');
INSERT INTO `oc_product_description` VALUES ('63', '1', 'CHANEL ALLURE HOMME SPORT man 100ml ', '&lt;p&gt;Allure Homme Sport является самым прекрасным доказательством тому факту, что для сильных ощущений не всегда необходима резкость. В этой парфюмерной интерпретации уверенно и интенсивно главенствует бодрящая свежесть. Обладатель аромата молодой и энергичный, предпочитает спортивный стиль, привык побеждать и не любит идти на компромиссы. Восхитительное звучание начинается за счет свежих верхних цитрусовых оттенков, образованных апельсином и мандарином, которые впоследствии дополняются морским аккордом и альдегидами, придающими свежесть, словно волна океана. В сердечных нотках чувствуется мужественность - перец с кедром и нероли дают о себе знать. В завершении открывается прекрасное сочетание ноток бобов тонка, амбры, мускуса, ветивера, дарующее комфорт и тепло после активного дня.&lt;br&gt;&lt;br&gt;&lt;/p&gt;', '', 'CHANEL ALLURE HOMME SPORT man', '', '');
INSERT INTO `oc_product_description` VALUES ('64', '1', 'Chanel Bleu de Chanel 100ml	                                ', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', 'Chanel Bleu de Chanel', '', '');
INSERT INTO `oc_product_description` VALUES ('74', '1', 'GIVENCHY  Pour Homme 100ml ', '&lt;p&gt;Givenchy Pour Homme – это древесная чувственность&amp;nbsp; в сочетании с пряной пикантностью, бодрящие цитрусовые ноты и океанская свежеть, легкий бриз и дуновение летнего ветра в лесу. Это элитный коктейль из бергамота с грейпфрутом. Искрящийся, ярий, насыщенный и одновременно комфортный, пряный из-за сочетания перца и кардамона и необычный благодаря горьковатой полыни. Древесные ноты ладана, кедра и ветивера его только еще больше облагораживают и придают благородную законченность.&lt;br&gt;Парфюм создает идеальный мужественный образ, в котором женщины узнают обворожительного и чувственного мужчину, а приятели и партнеры по бизнесу ценят прекрасные манеры и необыкновенную эрудицию джентльмена. Приобретая эту удивительную туалетную воду, вы получаете возможность чувствовать себя на высоте каждый день. &lt;br&gt;&lt;/p&gt;', '', 'GIVENCHY  Pour Homme', '', '');
INSERT INTO `oc_product_description` VALUES ('75', '1', 'GIVENCHY Pour Homme Blue Label man 100ml ', '&lt;p&gt;Givеnсhy Pоur Hоmme Вlue Lаbel - это незабываемая лавина свежести и водопад эмоций. Яркие, бодрящие, сочные цитрусы&amp;nbsp; в сочетании с пряными и древесными аккордами создают насыщенный и интенсивный мужской аромат, наполненый энергией и мужеством. Вlue Lаbel позволит Вам всегда быть в центре внимания и всё ваше окружение будет очаровано этим многогранным ароматом.&lt;br&gt;Свежий и бодрящий, Вlue Lаbel ложится на кожу яркими и динамичными всплесками ароматного ветивера и пряного ладана. Благодаря своим лёгким, леденящим и свежим нотам парфюм идеально освежит и подарит Вам прохладу в разгар палящей летней жары.&lt;br&gt;&lt;/p&gt;', '', 'GIVENCHY  Pour Homme Blue Label  man', '', '');
INSERT INTO `oc_product_description` VALUES ('76', '1', 'GUCCI Gucci by Gucci Made to Measure man 90ml ', '&lt;p&gt;&lt;br&gt;Made to Measure&amp;nbsp; создан&amp;nbsp; для &quot;искушенных и изысканных&quot; мужчин, которые &quot;привыкли ко всему самому лучшему&quot;. Композиция заявлена как восточно-пряная, &quot;идеально сидящая&quot;, вдохновленная внешним видом сшитого на заказ, вручную, дорого костюма. Начальные аккорды представлены калабрийским бергамотом, тунисским флердоранжем, французской лавандой и семенами аниса. Яркое, пряное и \'текстурированное\' сердце включает ноты мускатного ореха из Шри-Ланки, водяной лилии, ягод можжевельника, сливы и корицы. Наконец, база представляет собой роскошную и изысканную комбинацию лабданума, пачули, кожи и амбры.&lt;br&gt;&lt;br&gt;&lt;/p&gt;', '', 'GUCCI  Gucci by Gucci Made to Measure  man ', '', '');
INSERT INTO `oc_product_description` VALUES ('77', '1', 'GUCCI Gucci by Gucci Pour Homme 90ml ', '&lt;p&gt;Парфюм для стильных мужчин Gucci by Gucci Pour Homme будто создан для покорителя&amp;nbsp; женских сердец. Чтобы подчеркнуть в мужчине силу и абсолютную уверенность в своих возможностях, создатели Gucci by Gucci Pour Homme сделали звучание парфюма очень четким и насыщенным.&lt;br&gt;Его неповторимая дымка открывается бодрящим сиянием бергамота, грациозными нотками кипариса и нежными аккордами фиалки. В центральных аккордах этого неповторимого запаха соединились в удивительном узоре акценты терпкого табака и бархатного жасмина. Завершающие аккорды парфюма наполнены мягкостью амбры и лаконичными нотами пачулей.&lt;br&gt;&lt;/p&gt;', '', 'GUCCI  Gucci by Gucci Pour Homme 90ml ', '', '');
INSERT INTO `oc_product_description` VALUES ('78', '1', 'GUCCI  Gucci by Gucci SPORT  man  90ml ', '&lt;p&gt;Настроение беспечности, радости, отдыха от пыльной городской суеты подарит новый чистый аромат от дизайнерского дома Gucci – Gucci by Gucci Sport pour Homme. Навеянный образом средиземноморского острова Корсика, тонкий, бархатистый и немного терпкий древесно-фужерный парфюм для мужчин ассоциируется с запахом молодой зеленой листвы после бурного весеннего ливня, передает дух безграничной свободы и всепоглощающей яркой страсти.&lt;br&gt;Начальная нота: грейпфрут, мандарин, кипарис. Нота сердца: кардамон, инжир, можжевельник. Конечная нота: пачули, ветивер, амбретта.&lt;br&gt;&lt;/p&gt;', '', 'GUCCI Gucci by Gucci SPORT man', '', '');
INSERT INTO `oc_product_description` VALUES ('79', '1', 'GUCCI  GUILTY  Homme  100ml ', '&lt;p&gt;Oпасный, провокационный и неотразимый аромат, ориентированный на мужчин, «знающих силу игры и готовых пойти на все ради победы». Gucci Guilty Pour Homme - харизматический лидер, соблазнитель…&lt;br&gt;Применяются как: вечерние, дневные, романтические, сексуальные, современные, для деловых встреч &lt;br&gt;Характеристика: ароматные, фужерные.&amp;nbsp; Основные ноты: лайм, лаванда, розовый перец, нероль, апельсиновое дерево, кедр, пачули.&lt;br&gt;&lt;/p&gt;', '', 'GUCCI  GUILTY  Homme', '', '');
INSERT INTO `oc_product_description` VALUES ('80', '1', 'GUERLAIN   GUERLAIN  HOMME 100ml ', '&lt;p&gt;Guerlain Homme (Герлен Ом) - аромат посвящается зверю, живущему в каждом из нас. Двойственность мужской натуры, животные инстинкты, которые спят в глубинах его души и которые он умеет подавлять. До тех пор, пока не встретит Ее... Guerlain Homme – его союзник, он поможет утолить жажду чистой водой из ручья, с ароматами пикантных трав, освежающего лайма и пряной мяты. Он по-прежнему уверен в себе, настойчив и готов к решительным действиям.&lt;br&gt;Начальные ноты: мохито, мята, ром, лайм. Ноты сердца: бергамот, зеленый чай, герань. Ноты шлейфа: кедр, ветивер, зеленый ревень&lt;br&gt;&lt;br&gt;&lt;/p&gt;', '', 'GUERLAIN GUERLAIN HOMME ', '', '');
INSERT INTO `oc_product_description` VALUES ('81', '1', 'HUGO BOSS BOTTLED man 100ml', '&lt;p&gt;По своей популярности парфюм стал шедевральной классикой. Изумительные нотки горьковатых древесных, свежих цветочных и&amp;nbsp; цитрусовых аккордов прекрасно дополнят образ делового мужчины, немного загадочного, смелого, уверенного и упорного во всех своих начинаниях. Данному аромату необходимо соответствовать. Но если вы попадете с ним в резонанс, то станете победителем!&lt;br&gt;Классификация аромата: древесные, пряные.&amp;nbsp; Начальная нота: cлива, дубовый мох, зеленое яблоко, цитрусы, герань и лимон.&amp;nbsp; Нота &quot;сердца&quot;: махагони, гвоздика и корица. Конечная нота: сандаловое дерево, дерево маслины, ваниль, ветивер, белый кедр.&lt;br&gt;&lt;/p&gt;', '', 'HUGO BOSS  BOTTLED   man  100ml', '', '');
INSERT INTO `oc_product_description` VALUES ('82', '1', 'HUGO BOSS GREEN man 100ml', '&lt;p&gt;Инновационный, модный аромат. Разносторонний, бодрящий, похожий на северный воздух, это запах густых лесов, высоких волн и бескрайних равнин. С 1995 года Hugo Boss, запах нового поколения, является любимым ароматом многих мужчин. Для мужчин, которые умело сочетают новые модные тенденции и собственный стиль, предпочитающих элегантность, и не скрывающих свободу. &lt;br&gt;Характеристика: свежие, зеленые, стильные. Начальная нота: грейпфрут, зеленое яблоко, тимьян, бергамот, мята. Нота &quot;сердца&quot;: жасмин, герань, лаванда, пачули. Конечная нота: мускус, хвоя, cандал.&lt;br&gt;&lt;/p&gt;', '', 'HUGO BOSS  GREEN   man  100ml', '', '');
INSERT INTO `oc_product_description` VALUES ('83', '1', 'HUGO BOSS in Motion 90 ml', '&lt;p&gt;Мужской аромат Boss in Motion (Босс «в Движении») – воплощение освежающей силы,&amp;nbsp; чувственной страсти и активной жизненной энергии, переданное в стремительном движении насыщенной композиции парфюма. Boss in Motion – это современный восточно-фужерный аромат, с яркими цитрусовыми и древесно-пряными нотами.&lt;br&gt;Семейство ароматов: восточные, фужерные. Начальные ноты: листья фиалки, бергамот, базилик. Ноты сердца: розовый перец, корица, кардамон, мускатный орех. Базовые ноты: мускус, сандаловое дерево, древесные ноты и ветивер.&lt;br&gt;&lt;/p&gt;', '', 'HUGO BOSS in Motion', '', '');
INSERT INTO `oc_product_description` VALUES ('84', '1', 'HUGO BOSS in  Motion Black man 90 ml', '&lt;p&gt;Мужчина Boss in Motion Black от Hugo Boss – это человек с деятельной, сильной и свободной натурой, с очаровательной властной харизмой и бескомпромиссным стремлением к победе. Композиция In Motion Black Edition напоминает энергию свободы и власти, переданную элегантной свежестью черного цвета. Вершина аромата выделяется насыщенным цитрусовым потоком бодрящей прохлады нот бергамота, грейпфрута и кумквата. Сладкий фруктовый сок украшен пряной глубиной кардамона. «Сердце» Black Edition придает освежающему старту стремительную динамику. Имбирь, шалфей, табак, голубой лотос и ваниль создают теплый, пряно-ароматический с пикантной остротой, энергетический заряд. Роскошная древесная «База» вариации Black аромата Boss In Motion из нот сандалового дерева, пачули, ветивера с украшением из роскошного благоухания мирра наделяет композицию таинственными чертами притягательной мужской чувственности.&lt;br&gt;&lt;/p&gt;', '', 'HUGO BOSS in  Motion Black man', '', '');
INSERT INTO `oc_product_description` VALUES ('85', '1', 'HUGO BOSS №6   MEN 100 ML', '&lt;p&gt;В верхней ноте - фруктовое согласие лимона, яблока и сливы, дополненное пряно-древесным &quot;сердцем&quot; из гвоздики, корицы и красного дерева. Классический шлейф кедрового и сандалового дерева, с примесью теплой нотки ванили придает аромату естественность и мужественность. Нежный и соблазнительный древесный аромат для современного энергичного мужчины 21-го века, покорителя &quot;каменных джунглей&quot; и женских сердец.Популярный классический мужской аромат. Флакон: Классический прозрачный флакон с выпуклой надписью Boss на боку упакован в стильную серую коробочку. Начальные ноты: Бергамот, лимон, яблоко, слива.&lt;br&gt;&lt;/p&gt;', '', 'HUGO BOSS №6   MEN', '', '');
INSERT INTO `oc_product_description` VALUES ('86', '1', 'Hugo Boss Soul men 90 ml', '&lt;p&gt;Композиция контрастов, композиция постоянной борьбы, композиция Boss Soul - яркое «олицетворение души соблазнителя». Богатый, роскошный, теплый аромат Soul от Хьюго Босс, отличающийся сильным&amp;nbsp; мужским характером с тонкими чувственными струнами. Boss Soul Man вобрал в себя свежесть бергамота, аниса и мандарина, теплоту черного перца и кардамона, глубину древесных нот мускуса, амбры и дерева Tamboti; сочетает в себе пряные пьянящие ноты лаванды, кориандра, корицы и ветивера.&lt;br&gt;Яркий и притягательный этот парфюм мгновенно выделяет своего обладателя из толпы.&lt;br&gt;&lt;/p&gt;', '', 'Hugo Boss Soul men', '', '');
INSERT INTO `oc_product_description` VALUES ('87', '1', 'Kenzo l\'eau par Kenzo pour homme 100ml ', '&lt;p&gt;Аромат L\'Eau par Kenzo pour Homme – это торжество чистоты и мужественности. Элегантный, утонченный и невинный запах маленького японского дерева юзу искрится в верхних нотах свежими и прозрачными нотками лимона, переливаясь и играя в лучах гармонии розового дерева и лотоса. Слегка пряный хоу лиф наделяет композицию естественной простотой и смыслом. &lt;br&gt;L\'Eau par Kenzo – акватический, прозрачный, легкий, чистый и неподдельно свежий, современный мужской аромат незаменим в коллекции истинного самурая подчеркивая исключительный вкус и элегантность обладателя.&lt;br&gt;&lt;br&gt;&lt;/p&gt;', '', 'Kenzo l\'eau par Kenzo pour homme', '', '');
INSERT INTO `oc_product_description` VALUES ('88', '1', 'LACOSTE L12.12 BLANC man  100ml', '&lt;p&gt;Мужская туалетная вода Lacoste L.12.12 Blanc 100 ml – популярный аромат. Такой парфюм является идеальным вариантом для себя, а не на подарок. Аромат наделён отличным вариантом для настроения, с которым стоит начинать свой активный день или же, также можно использовать, освежившись после тренировки, чтобы с новыми силами вступить в бой на арене нашей жизни. Стойкость аромата, предоставляемая по столь умеренной цене, Вас приятно удивит!&lt;br&gt;Классификация аромата: фужерные. Начальная нота: розмарин, зеленый кардамон, грейпфрут. Нота &quot;сердца&quot;: иланг-иланг, мексиканская тубероза. Конечная нота: кедр, кожа&lt;br&gt;&lt;/p&gt;', '', 'LACOSTE L12.12 BLANC man', '', '');
INSERT INTO `oc_product_description` VALUES ('89', '1', 'LACOSTE  ESSENTIAL  man  100ml ', 'Lacoste Essential — свежий, релаксирующий, свободный, веселый аромат для молодых романтиков. Обладатель этого аромата не боится идти на встречу неизведанному, новому. Он все-время в движении. Он ценит жизнь. Начальные ноты: лимон, виноград, бергамот, листья томата, разные фрукты, мандарин и водные ноты. Ноты сердца: роза, пряности, черный перец и цветочные ноты. Конечные ноты: древесина, сандал и пачули. Этот аромат уникален тем, что в нем используется новая технология Time-Release Technology. Она заключается в том, что свежесть аромата сохраняется весь день. Теперь можно просто потереть кожу в том месте, куда вы нанесли этот парфюм.&lt;br&gt;', '', 'LACOSTE  ESSENTIAL  man', '', '');
INSERT INTO `oc_product_description` VALUES ('90', '1', 'Lacoste L.12.12 Noir man 100 ml', '&lt;p&gt;Строгий и сдержанный аромат туалетной воды Lacoste «L.12.12 Noir» подходит элегантным и деловым мужчинам, которые привыкли ни от кого не зависеть и решать все своими силами. На любой бизнес встрече этот парфюм представит своего владельца, как надежного и честного человека с которым можно без опасения заключать выгодные сделки и обсуждать важные вопросы. Свежий арбуз в сочетании с темным шоколадом делает аромат пикантным и особенным, тем самым подчеркивая состоятельность своего хозяина.&lt;br&gt;Верхние ноты: арбуз. Ноты сердца: лаванда, базилик, вербена. Базовые ноты: кашмеран, кумарин, темный шоколад, пачули.&lt;br&gt;&lt;br&gt;&lt;/p&gt;', '', 'Lacoste L.12.12 Noir man ', '', '');
INSERT INTO `oc_product_description` VALUES ('91', '1', 'LACOSTE pour Homme 100 ml', '&lt;p&gt;Aромат для зрелого мужчины, искушенного, умудренного опытом, знающего, что время бесценно.&amp;nbsp; Мужчина Lacoste понял, что лишь простые удовольствия имеют цену, что дорого каждое отдельное мгновение, а не их бесконечная смена.&amp;nbsp; Каждый его поступок, каждое движение пронизаны безупречным стилем.&amp;nbsp; Стиль и элегантность для него не самоцель, а средство выражения жизненной позиции, которая одновременно и проста, и провокационна.&lt;br&gt;Ноты: кардамон, кедр, сандал, ваниль, мускус, бергамот, грейпфрут, яблоко, корица, перец, ладан, папоротник, слива, ром, можжевельник, агар.&lt;br&gt;&lt;/p&gt;', '', 'LACOSTE pour Homme', '', '');
INSERT INTO `oc_product_description` VALUES ('92', '1', 'Paco Rabanne BLACK XS  man  100ml ', '&lt;p&gt;Это аромат для мужчины сегодняшнего дня, он настоящий bad boy, но не лишенный чувств и эмоций. Яркий и эксцентричный аромат отлично пойдет страстным, увлекающимся натурам, способным на отчаянные и дерзкие поступки. Black XS опьяняет игрой запахов: бодрящих — калабрийского лимона и плодов каламанзи, сладких — пралине и бальзама толу и терпких — палисандра и черного дерева. Дизайн аромата также выполнен в необычном стиле: черный флакон – любимый цвет плохого мальчика, надпись в готическом стиле и узор, напоминающий о чувственности его обладателя.&lt;br&gt;&lt;/p&gt;', '', 'Paco Rabanne BLACK XS  man', '', '');
INSERT INTO `oc_product_description` VALUES ('93', '1', 'Paco Rabanne INVICTUS  man  100ml ', '&lt;p&gt;Это новая туалетная вода для активных мужчин характеризуется, как спортивный аромат. Ее название латинского происхождения,&amp;nbsp; переводится как «непобедимый», что подчеркивает мужественность и стойкость обладателя парфюма. &lt;br&gt;Аромат Invictus от Paco Rabanne — это встреча с новой мечтой о победе, с новым героем, чемпионом, спортсменом и новой парфюмерной историей чувственной свежести. &lt;br&gt;Классификация аромата: водный, древесный. Начальная нота: грейпфрут, мандарин, морские ноты. Нота &quot;сердца&quot;: лавр, жасмин. Конечная нота: дерево Гуаяк, дубовый мох, пачули, серая амбра.&lt;br&gt;&lt;/p&gt;', '', 'Paco Rabanne INVICTUS  man  100ml ', '', '');
INSERT INTO `oc_product_description` VALUES ('94', '1', 'Paco Rabanne Ultraviolet man 100ml', '&lt;p&gt;Мужчина Ultraviolet ищет новые ощущения, одновременно реальные, и виртуальные, опасные и завораживающие. Он рискует, флиртует с опасностью, но только для того, чтобы подчеркнуть свою индивидуальность. Он больше не оценивает себя по своей силе и власти, но по уровню интеллекта и реальным результатам. &lt;br&gt;Начинается композиция звучанием переливов изысканной амбры, а также прохладной мяты, которая и дает эффект приятного волнения. «Сердце» окутывает аккордами египетского ветивера, словно передающего оттенки жары и солнечного света. В шлейфе радуют ноты зеленого дубового мха.&lt;br&gt;&lt;br&gt;&lt;/p&gt;', '', 'Paco Rabanne Ultraviolet   man', '', '');
INSERT INTO `oc_product_description` VALUES ('95', '1', 'Pacco rabbanne 1 million men  100 ml', '&lt;p&gt;Эта восхитительная туалетная вода является символом роскоши и мужественности, предназначается для сильных духом джентльменов, которые должны править миром. Элегантный и дерзкий, лаконичный и роскошный парфюм выбирают активные представители сильного пола, которые привыкли смело шагать вперед и всегда добиваться успеха. Он подчеркивает романтичность или сексуальность своего обладателя, акцентирует внимание на его внутренней силе. &lt;br&gt;Открывается шикарная композиция чарующим запахом&amp;nbsp; грейпфрута и красного мандарина которые смешиваются с мятой. Кожаные и древесные оттенки придают образу утонченность и солидность, достойно завершая динамичное звучание ароматной мелодии. &lt;br&gt;&lt;/p&gt;', '', 'Pacco rabbanne 1 million men ', '', '');
INSERT INTO `oc_product_description` VALUES ('96', '1', 'Shaik Opulent Shaik Parfum N 77 men', '&lt;p&gt;Shaik, принц пустыни, великолепный и могущественный, невидимый и вездесущий, раздает сокровища щедрой рукой, за что его благословляют благодарные люди. Селективная арабская парфюмерная линия из Бахрейна создает духи без оглядки на стоимость и количество ингредиентов. В результате получаются безграничные ароматные сказки. &lt;br&gt;Ноты: Бергамот, лаванда, лимон, базилик, герань, зеленое яблоко, корица, бутоны гвоздичного дерева, белый кедр, пачули, дубовый мох, лабданум, ваниль, мускус.&lt;br&gt;&lt;br&gt;&lt;/p&gt;', '', 'Shaik Opulent Shaik Parfum N 77', '', '');
INSERT INTO `oc_product_description` VALUES ('97', '1', 'VERSACE  EROS  man  100ml ', 'Туалетная вода Versace Eros – это новый мужской аромат, выпущенный домом Versace в 2012 году. Его создатель Орельен Гишар был настолько вдохновлен греческой мифологии, что по образу и подобию бога любви Эроса решил создать страстный и чувственный аромат Versace Eros. Начальные нотки придуманного им запаха способны открыться цитрусовыми нотками, а также источать оттенок мяты и яблока. Сердечные нотки аромата наполнены геранью и бобами тонка. В завершении композиции можно прочувствовать аромат благородной древесины, которая раздается благоухающим шлейфом.&lt;br&gt;', '', 'VERSACE  EROS  man  100ml ', '', '');
INSERT INTO `oc_product_description` VALUES ('98', '1', 'VERSACE  MAN EAU FRAICHE man 100ml ', '&lt;p&gt;Искренний и свежий аромат Versace Man Eau Fraiche отображает классического мужчину Versace, активного и жизнерадостного, любвеобильного и доброго. Он - обладатель знаменитого итальянского темперамента. В нем огромное количество энергии и жизненного потенциала.&lt;br&gt;Базовые мотивы композиции основаны на сочетании амбры, мускуса и древесного привкуса. Пикантности «сердцу» аромата придают кедр, мускатный орех и эстрагон. Начальные ноты – белый лимон, розовое дерево и карамболь, способны подарить ощущение безграничной раскрепощенности и свободы.&lt;br&gt;&lt;/p&gt;', '', 'VERSACE  MAN EAU FRAICHE   man  100ml ', '', '');
INSERT INTO `oc_product_description` VALUES ('99', '1', 'ARMANI  Acqua Di Gio woman 100ml', '&lt;p&gt;Это освежающая цветочная туалетная вода, обладающая букетом запахов чистого океанского воздуха, прохладного моря и свежесрезанных цветов. Обладательница волнующего и притягивающего, таинственного и страстного аромата привлекает внимание чистотой и элегантностью, манит к себе и завораживает. Она любит себя, выбирает самое лучшее, умеет постоять за принципы и добиваться желаемого, потому что сама вершит свою судьбу. Невесомый и непринужденный парфюм, который в то же время очень многогранный и интересный, переносит ее на сказочный лазурный берег, где царит радость и тепло. &lt;br&gt;Классификация аромата: цветочные, свежие. Начальная нота: лилия, бергамот, пион. Нота &quot;сердца&quot;: жасмин, гиацинт.&amp;nbsp;&amp;nbsp; Конечная нота: мандарин, мускус, древесина.&lt;br&gt;&lt;/p&gt;', '', 'ARMANI  Acqua Di Gio woman ', '', '');
INSERT INTO `oc_product_description` VALUES ('100', '1', 'ARMANI  Acqua Di Gioia  woman 100ml', '&lt;p&gt;Мягкий и чистый аромат, создан для современной, свободой, яркой женщины, которая получает удовольствие от жизни. Acqua di Gioia – запах свободы и свежести.&lt;br&gt;С первых же секунд знакомства с этим ароматом вас охватывает неистовое возбуждение: пьянящие нотки перечной мяты в обжигающем коктейле с кисловатым итальянским лимоном. Столь яркое первое впечатление плавно переходит в умиротворяющее чувство спокойствия, беззаботности и естественности, которое дарят кристально чистые нотки водного жасмина. И в качестве парфюмерного апофеоза – коричневый сахар, чувственный, сладострастный, обрамленный нотами кедра и ладана.&lt;br&gt;&lt;/p&gt;', '', 'ARMANI  Acqua Di Gioia  woman', '', '');
INSERT INTO `oc_product_description` VALUES ('101', '1', 'ARMANI  Code pour Femme  75ml ', '&lt;p&gt;Женственность, очарование, миловидность – это черты женщины, вдохновившей создателя парфюма. Женщина, для которой красота невозможна без эмоций и ее аромат отражает жизнь ее чувств, легких и постоянных одновременно. Интригующий аромат апельсиновых цветов переплетается со свежими имбирными штрихами и нежными медовыми и сандаловыми нотами. В результате получается загадочный и неуловимо притягательный букет. Что сулит этот запах своей хозяйке? Новую случайную встречу с загадочным незнакомцем... Волшебное авантюрное приключение... Попробуйте сами!&lt;br&gt;Аромат:цветочный, цитрусовый. Характеристика: роскошный, зрелый&amp;nbsp; Начальная нота: горький апельсин, итальянский апельсин, жасмин,&amp;nbsp; нота &quot;сердца&quot;:&amp;nbsp; флердоранж, жасмин,&amp;nbsp; конечная нота:&amp;nbsp; ваниль, мед&lt;br&gt;&lt;/p&gt;', '', 'ARMANI  Code pour Femme', '', '');
INSERT INTO `oc_product_description` VALUES ('102', '1', 'Burberry Weekend  for  Woman 100ml', '&lt;p&gt;Если бы приятный солнечный день имел собственный аромат, то это был бы Weekend for Women – такой же чистый, легкий, парящий, радостный, наполненный молодостью и нежностью. Парфюмированная вода предназначена для жизнерадостной и волнительной красавицы, настроение которой похоже на легкий и нежный полет райской птицы, которая одним своим присутствием способна озарить пространство, наполнить день положительной энергией и яркими красками.&lt;br&gt;Начальная нота парфюма мягкая, сочетает в себе резеду, мандарин и шалфей. В сердечных нотках чувствуется голубой гиацинт, красный цикламен, дикая роза, фиалковый корень, цветы персика, нектарин. В конечных нотах звучит кедр, сантал, мускус, оставляя манящий весельем и приключениями шлейф.&lt;br&gt;&lt;/p&gt;', '', 'Burberry Weekend  for  Woman', '', '');
INSERT INTO `oc_product_description` VALUES ('103', '1', 'Burberry   My Burberry women EDP 90 ml', '&lt;p&gt;My Burberry – это современный цветочный аромат, передающий запах лондонского сада после дождя. Композиция My Burberry открывается нотами душистого горошка и бергамота, за которыми следует сердце из листьев герани, цветов фрезии и золотистой айвы. Округлая база из пачули и двух видов розы, дамасской и столепестковой, завершает формирование образа.&lt;br&gt;&lt;/p&gt;', '', 'Burberry   My Burberry women EDP 90 ml', '', '');
INSERT INTO `oc_product_description` VALUES ('104', '1', 'BVLGARI  Omnia crystalline  woman  65ml ', '&lt;p&gt;Кристальная чистота, кристальная прозрачность, кристальный аромат… Если бы кристаллы пахли, то их запахом наверняка был бы Omnia Crystalline от Bvlgari, нежный и стойкий аромат, деликатный и несравненный, в своей цветочно-фруктовой композиции.&amp;nbsp; Свежий и игривый, он раскрывает Вашу женственность, как весной солнце распускает цветы. Спокойный, с легкой свежестью аромат, дает возможность помечтать, перенестись в мир фантазий и насладиться этими минутами. Мечты обязательно сбываются, главное – не переставать верить в свою мечту.&lt;br&gt;Тип: дневные, вечерние Семейство ароматов: цветочные, фруктовые Начальные ноты: японская груша Ноты сердца: древесина дерева балса, амбра Базовые ноты: лотос, бамбук.&lt;br&gt;&lt;/p&gt;', '', 'BVLGARI  Omnia crystalline  woman', '', '');
INSERT INTO `oc_product_description` VALUES ('105', '1', 'BVLGARI  Omnia Green Jade woman 65ml', '&lt;p&gt;Аромат воплотил в себе всю элегантность и безупречность зелёного нефрита. Открываясь пикантными&amp;nbsp; нотами зеленого мандарина и ключевой воды, Omnia Green Jade источает спонтанную чувственность, подобную дуновению ветра. В сердце аромата искрятся насыщенные ноты белого пиона, жасмина и цветов грушевого дерева. А мягкие ноты шлейфа, сливаясь воедино, образуют соблазнительный аккорд оттенков свежих фисташек, мускуса и ели.&lt;br&gt;Характеристика: современный, молодежный, интригующий, тонизирующий Семейства ароматов: цветочные, водные Начальная нота: мандарин, родниковая вода Нота &quot;сердца&quot;: белый пион, груша, жасмин Конечная нота: фисташки, древесные ноты, мускус &lt;br&gt;&lt;br&gt;&lt;/p&gt;', '', 'BVLGARI  Omnia Green Jade woman 65ml', '', '');
INSERT INTO `oc_product_description` VALUES ('106', '1', 'BVLGARİ OMNIA CORAL 65 ml', '&lt;p&gt;Аромат Bvlgari Omnia Coral был создан под вдохновением естественной красоты и изящества красного коралла. Bvlgаri Оmniа Сorаl фруктово-цветочный аромат для прекрасных женщин. Влюбитесь в его романтичные ноты цветов в сочетании с сочными фруктами и оттенками тёплой редкой древесины. &lt;br&gt;Чувственные ноты бергамота оставят нежный шлейф привлекательности. К ним позже присоединяются лёгкие аккорды цветов, притягательного гибискуса и сочного красного граната.Завершается гармоничное благоухание нотами сексуального мускуса и бархатистого, тёплого кедра.&lt;br&gt;&lt;/p&gt;', '', 'BVLGARİ OMNIA CORAL 65 ml', '', '');
INSERT INTO `oc_product_description` VALUES ('107', '1', 'Cacharel  Amor Amor  woman  100ml', '&lt;p&gt;Ароматный гимн самой любви сочинили мастера модной империи Cacharel в новой туалетной воде Amor Amor. Все восхищение, преклонение перед этим великолепным чувством реализовалось в цветочно-фруктовом соблазнительном, мечтательном, романтическом и фантазийном запахе. Поддавшись его очарованию, вы погрузитесь в атмосферу непередаваемых ощущений – чувство влюбленности, полета среди облаков и безграничного счастья еще долго не отпустит вас, если с вами аромат Amor Amor от Cacharel. Верхние ноты: Бергамот, грейпфрут, Тангерин, апельсин, черная смородина и Лист черной смородины; ноты сердца: Белая лилия, Ландыш, Жимолость, роза и Абрикос; ноты базы: Ваниль, Тонка бобы, Белый кедр, Амбра и Мускус.&lt;br&gt;&lt;/p&gt;', '', 'Cacharel  Amor Amor  woman', '', '');
INSERT INTO `oc_product_description` VALUES ('108', '1', 'Carolina Herrera 212 VIP   woman 80ml ', '&lt;p&gt;Женский восточный гурманский парфюм 212 VIP -. это чуть освежающий, теплый, мягкий, соблазнительный, элегантный, дорогой аромат с красивым терпковато-сладким шлейфом от Carolina Herrera. Он&amp;nbsp; был вдохновлен энергичной жизнью молодежи Нью-Йорка и отражает эксклюзивный, гламурный и современный стиль.&lt;br&gt;Основными нотами букета композиции 212 VIP выступают ром и ваниль, дополняющиеся ароматами маракуи и бобов тонка, которые звучат на более тонком фоне аккордов гардении и мускуса. Парфюм больше подходит для использования в качестве вечерних духов, но можно носить его и днем, лучше всего раскрывается в холодную осенне-зимнюю погоду.&lt;br&gt;&lt;/p&gt;', '', 'Carolina Herrera 212 VIP   woman 80ml ', '', '');
INSERT INTO `oc_product_description` VALUES ('109', '1', 'Carolina Herrera 212 VIP ROSE women 80 ml', '&lt;p&gt;Его яркий цветочный аромат расскажет вам о беззаботности&amp;nbsp; вечеринок Нью-Йорка. Незабываемые и волнующие, непредсказуемые и желанные они послужили вдохновением для создателей аромата. На них царит вечная атмосфера праздника и бокалы искрят шампанским, всюду порхают юные и бесконечно прекрасные девушки, легкие как феи и недоступные как нимфы. 212 VIP Rose, невероятно соблазнительный и изысканный, подойдет уверенной девушке, осознающей свою женственность и чувственность. Брызги шампанского и ароматный персик, вот что составляют композицию Carolina Herrera 212 VIP Rose. &lt;br&gt;Начальная нота: шампанское, фруктовые ноты. Нота &quot;сердца&quot;: цветы персика. Конечная нота: древесные ноты, белый мускус, амбра.&lt;br&gt;&lt;/p&gt;', '', 'Carolina Herrera 212 VIP ROSE women 80 ml', '', '');
INSERT INTO `oc_product_description` VALUES ('110', '1', 'CHANEL  ALLURE  woman  100ml', '&lt;p&gt;Аромат, возвещающий 21-ое столетие. &lt;br&gt;Allure – это шесть букв, шесть нот, которые очень органично гармонируют друг с другом. Этот баланс уникален, ведь каждая женщина сможет найти в нём что-нибудь индивидуальное для себя: бергамот и лимон освежают, мандарин и персик придают аромату легкие фруктовые нотки, майская роза и жасмин для неповторимой нежности, аромат водяной лилии будит воображение, сандал и ветивер оттеняют композицию своими древесными нотками, ваниль усиливает восточное звучание аромата. На каждой женщине Allure ощущается по-разному и никогда не повторяется, предлагая каждой неповторимый аромат, постепенно раскрывающийся в течение дня.&lt;br&gt;&lt;/p&gt;', '', 'CHANEL  ALLURE  woman  100ml', '', '');
INSERT INTO `oc_product_description` VALUES ('111', '1', 'Chanel Allure Sensuelle woman 100 ml', '&lt;p&gt;Теплый, роскошный и загадочный, но в то же время светящийся и воздушный аромат. Он дарит нежные обещания и&amp;nbsp; намеки, до конца храня тайну своего очарования. Парфюм несет с собой естественную чувственность и притягательную интригующую атмосферу недосказанности. По словам создателей, новинка должна понравиться молодой аудитории, ведь это «сладкий» сексуальный аромат.&lt;br&gt;Начальная нота: бергамот, мандарин, персик, пачули. Нота сердца: роза, жасмин, водяная лилия, розовый перец. Конечная нота: сандал, ветивер, ваниль, ладан.&lt;br&gt;&lt;/p&gt;', '', 'Chanel Allure Sensuelle woman 100 ml', '', '');
INSERT INTO `oc_product_description` VALUES ('112', '1', 'Chanel Chance Eau Fraiche woman 100 ml', '&lt;p&gt;Chance Eau Fraiche наполнен романтичной свежестью и парящей лёгкостью тёплого летнего утра,&amp;nbsp; когда с зеленой сочной травы еще не сошли капельки росы. Этот парфюм отличается соблазнительной жизнерадостностью, утончённой женственностью, искрящейся молодостью и внутренней гармонией.&lt;br&gt;Chance Eau Fraiche — Женщина нимфа! Женщина мечта! Женщина сказочная прелестница!Женщина преисполненная живой энергией для свершения великих дел — и неважно, будь-то обычный шопинг или борьба за «мир во всем мире».&amp;nbsp; Семейства ароматов: Древесные, Цветочные, Шипровые Верхние ноты: цитрусы, белый кедр. Ноты «сердца»: розовый перец, водяной гиацинт, жасмин. Базовые ноты: тиковое дерево, ирис, амбра, пачули, ветивер, белый мускус.&lt;br&gt;&lt;/p&gt;', '', 'Chanel Chance Eau Fraiche woman 100 ml', '', '');
INSERT INTO `oc_product_description` VALUES ('113', '1', 'Chanel Chance Eau de Parfume  woman 100 ml', '&lt;p&gt;Композиция относится к семейству ароматов&amp;nbsp; цветочные, шипровые. CHANEL Chance parfum tester&amp;nbsp; очень легко воспринимается, приятный и не душит. Он с легкостью сможет подарить вам праздничное настроение. Начальная нота аромата пачули, гиацинт, ирис, ананас и перец. Вторая нота состоит из цитрусов и жасмина. Ноты базы – ветивер, пачули, мускус и ваниль.&lt;br&gt;&lt;br&gt;&lt;/p&gt;', '', 'Chanel Chance Eau de Parfume  woman 100 ', '', '');
INSERT INTO `oc_product_description` VALUES ('114', '1', 'Chanel  Chance Eau de Toilette woman 100 ml', '&lt;p&gt;Найти баланс, откинуть предрассудки и воспарить над миром – это твой шанс – аромат Chance&amp;nbsp; Eau De Toilette! Меняй правила! Будь собой, используй все возможности и радуйся жизни вместе с Chance Eau De Toilette! Аромат Chance Eau De Toilette собрал в себе все самые лучшие и высококачественные ингредиенты парфюмерного сырья, тем самым воплотив идею лучшего аромата для женщины, на все времена.&lt;br&gt;Тип аромата: Шипровый, цветочный.&amp;nbsp; Начальные ноты: ананас,ирис, пачули, розовый перец, гиацинт.&amp;nbsp; Ноты &quot;сердца&quot;: жасмин, цитрусы.&amp;nbsp; Конечные ноты: мускус, пачули, ваниль, ветивер.&lt;br&gt;&lt;br&gt;&lt;/p&gt;', '', 'Chanel  Chance Eau de Toilette woman 100 ml', '', '');
INSERT INTO `oc_product_description` VALUES ('115', '1', 'CHANEL NOIR women 100 ml', '&lt;p&gt;Chanel Coco Noir - дань любви Мадемуазель Шанель не только к черному цвету,но и к Венеции. В свое время, посетив этот город и влюбившись в его атмосферу и архитектуру, великая Коко прониклась византийской культурой, элементы которой она блестяще вплела в свой стиль. Запах по-хорошему классический, при этом дерзкий и опьяняюще чувственный. Свежесть грейпфрута и бергамота, благоухание розы, жасмина и нарцисса в нем уравновешены пряными нотами базы. Бразильские и венесуэльские бобы тонка,индонезийские пачули, новокаледонский сандал, белый мускус, бурбонская ваниль... Их обволакивающая теплота, сладость и острота гарантируют,что такой шлейф не останется без внимания&lt;br&gt;&lt;/p&gt;', '', 'CHANEL NOIR women 100 ml', '', '');
INSERT INTO `oc_product_description` VALUES ('116', '1', 'Chanel №5 woman  100 ml', '&lt;p&gt;Шанель № 5 - первые духи, которые не были монологом существующих цветов или традиционных компонентов духов. Новаторский&amp;nbsp; подход Габриэллы Шанель&amp;nbsp; и ее нелюбовь к буржуазному образу «женщины-цветка» стал движущей силой в создании революционного аромата, который мог бы дать женщинам желание наслаждаться необычным благоуханием своих духов, а не использовать их в большей степени в качестве необходимого «ароматизатора» немытого тела. «Духи не должны пахнуть как роза, или как ландыш, а как состав»… они должны «пахнуть как женщина», - настаивала Великая Мадмуазель. Духи Chanel № 5 в своем абстрактном смешении сравнимы с гениальными шедеврами авангардизма кисти Кандинского и Малевича, как нельзя лучше подошел по фасону новой эпохе.&lt;br&gt;&lt;/p&gt;', '', 'Chanel №5 woman  100 ml', '', '');
INSERT INTO `oc_product_description` VALUES ('117', '1', 'Cerruti1881 women 100 ml	', '&lt;p&gt;Это ода любви к женщине, воспевание ее красоты, душевной гибкости и очарования. Многосложную цветочную композицию создала Клер Кейн в 1995 году, соединившая в капле парфюма букет, собранный из загадочно-изысканной флоры пяти континентов.Ароматом восхищаются не только женщины и покоренные ими мужчины, но и могли бы возвеличивать олимпийские боги. &lt;br&gt;Верхние ноты мягко подкрадываются оттенками белоснежной фрезии и ландыша, душистой мимозы и бергамота, бархатных лепестков розы и жасмина, соцветий ириса и фиалки. Божественность сердечных нот возносит на вершину подобно пению райских птиц среди герани и жасмина, апельсинового цвета и гальбанума, скромных ирисов и ромашки, благосклонного нарцисса и царственной туберозы. Искушающий кориандр и палисандровые акценты разбавляют эту цветочную симфонию. Ванильно-мускусный шлейф сопровождает сандаловое благоухание, кедр и амбра.&lt;br&gt;&lt;/p&gt;', '', 'Cerruti1881 women 100 ml	', '', '');
INSERT INTO `oc_product_description` VALUES ('118', '1', 'CHLOE Eau de Parfume 100 ml', '&lt;p&gt;Возвращение легенды в новом молодом облике и винтажном флаконе. Новый аромат Cloe&amp;nbsp; воплощается&amp;nbsp; классическим стилем, шиком и молодостью современной женщины. Легкое дуновение благоухающей розы и зеленой цветочной свежести фрезии, личи и пиона доносит скрытый в сердце бархатный аромат лепестков магнолии и ландыша. Красивый медовый шлейф соткан мягкой пудрой и древесными аккордами.&lt;br&gt;&lt;/p&gt;', '', 'CHLOE Eau de Parfume 100 ml', '', '');
INSERT INTO `oc_product_description` VALUES ('119', '1', 'D&amp;G 3  L’IMPERTRICE  woman 100ml', '&lt;p&gt;Туалетная вода D&amp;amp;G Anthology L`Imperatrice 3 – яркое, весеннее сочетание искристых брызг экзотических цветов и драгоценных капель спелых, сочных фруктов. Верхний аккорд завораживает и&amp;nbsp; околдовывает гармоничным коктейлем из тонких и изящных розовых лепестков и насыщенной «бодрости» экзотических фруктов. Сочный, глубокий и богатый аромат, который уместен и в летний сезон, и в зимние холода. С туалетной водой D&amp;amp;G Anthology L`Imperatrice 3 женщина всегда загадка, свежа и неотразима, ослепительна и очаровательна. Волшебное сочетание натуральных и естественных компонентов делает каждую леди настоящей императрицей.&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; Начальная нота: экзотические фрукты, розовые цветы. Нота &quot;сердца&quot;: арбуз, киви. Конечная нота: розовый цикламен, мускус.&lt;br&gt;&lt;/p&gt;', '', 'D&amp;G 3 L’IMPERTRICE  woman 100ml', '', '');
INSERT INTO `oc_product_description` VALUES ('120', '1', 'D&amp;G  Light  Blue for  woman  100 ml', '&lt;p&gt;Волнующий, трепетный, восхитительный и ошеломляющий аромат, мгновенно овладевающий всем существом, неотразимый и прекрасный, как сама жизнь. Сочные ноты лайма и шелест прибрежных кипарисов нежно ласкают и наполняют упоительной свободой и тишиной. Потрясающий цветочно-фруктовый аромат, жизнерадостный и очаровательный. &lt;br&gt;Прохладный, свежий и тонизирующий аромат идеально подходит для использования в летнюю жару. Для энергичных, импульсивных и ярких женщин.&lt;br&gt;Характеристика: поразительные, красочные.&amp;nbsp; Начальная нота: сицилианский лимон, яблоки гренни смит, колокольчик. Нота &quot;сердца&quot;: жасмин, бамбук, белая роза. Конечная нота: кедр, амбра, мускус.&lt;br&gt;&lt;br&gt;&lt;/p&gt;', '', 'D&amp;G  Light  Blue for  woman  100 ml', '', '');
INSERT INTO `oc_product_description` VALUES ('121', '1', 'D&amp;G  the One Desire  woman 75ml', '&lt;p&gt;Сладкий, томный, изысканный и теплый аромат Dolce&amp;amp;Gabbana The One Desire был разработан парфюмерным гигантом, в котором работают лучшие «носы» мира, – Givaudan. Этот парфюм по достоинству оценят женщины, любящие получать внимание, притягивать взгляды, быть заметными, только перестая порог комнаты. Не вульгарная, но сексуальная, неистовая и элегантная его обладательница ослепит всех вспышкой чувственности и соблазна. Данный аромат отлично дополнит вечерний образ, следуя за своей хозяйкой сладким и притягательным шлейфом.&lt;br&gt;Классификация аромата: восточные цветочные. Начальная нота: бергамот, ландыш, личи, мандарин. Нота &quot;сердца&quot;: тубероза.&amp;nbsp; Конечная нота: карамель, ваниль, сандал, мускус.&lt;br&gt;&lt;/p&gt;', '', 'D&amp;G  the One Desire  woman 75ml', '', '');
INSERT INTO `oc_product_description` VALUES ('122', '1', 'D&amp;G  the ONE  woman  75ml', 'The One создает безмятежное, светлое, немного задумчивое настроение, настраивает на неторопливые прогулки и долгие свидания. Его владелица спокойна и уверена в своей женской привлекательности и сексуальности. А пряные провокационные нотки аромата заставляют оборачиваться и еще долго смотреть ей вслед очарованных мужчин.&lt;br&gt;Этот цветочно-ориентальный соблазнительный аромат станет эффектным дополнением к вечернему женскому туалету. &lt;br&gt;Начинается аромат с нот бергамота и персика, мандарина и личи. Ноты сердца – жасмин, ландыш, лилия и груша. Конечные ноты: мускус, ветивер, ваниль и амбра.', '', 'D&amp;G  the ONE  woman  75ml', '', '');
INSERT INTO `oc_product_description` VALUES ('123', '1', 'DİOR ADDİCT parfum women 100 ml', '&lt;p&gt;Aромат порывистой и страстной женщины, которая следует своей интуиции и игнорирует законы. Она не приемлет давления и обязательств, она независима и самодостаточна. Именно для нее создана эта сладкая, чувственная и немного эгоистичная композиция. Сочный, нежный и роскошный аромат духов Dior Addict (Диор Эддикт, Аддикт), который создан специально для вас, наполнит бодростью днем и чувственностью ночью. Начинается аромат свежим взрывом мандаринового и шелковичного дерева, затем согревает нотами розы, в шлейфе завораживают ноты бурбонской ванили и сандалового дерева. Ощутите весну и свободу в сердце, купив духи Dior Addict (Диор Эддикт, Аддикт).&lt;br&gt;&lt;/p&gt;', '', 'DİOR ADDİCT parfum women 100 ml', '', '');
INSERT INTO `oc_product_description` VALUES ('124', '1', 'DİOR Miss DİOR Cherie Blooming Bouquet 100 ml', '&lt;p&gt;Милые дамы, примите скромный дар от Christian Dior – благоухающий букет изысканных цветов, заточенный в каждой капле туалетной воды Blooming Bouquet. Парфюмерная картина написана цветочными мазками и дополнена еле слышными фруктовыми очерками. Нежный и женственный аромат придает изысканность и естественный шарм своей обладательнице, которая очаровывает всех своей красотой, грацией и привлекательностью.&lt;br&gt;Верхняя нота: мандарин; нота сердца: Пион; базовая нота: Мускус&lt;br&gt;&lt;/p&gt;', '', 'DİOR Miss DİOR Cherie Blooming Bouquet 100 ml', '', '');
INSERT INTO `oc_product_description` VALUES ('125', '1', 'DIOR  Hypnotic Poison   woman 100ml ', '&lt;p&gt;Hypnotic Poison – провокационный, загадочный аромат, построенный на четырех интенсивных и волнующих нотах. Это чувственная алхимия соблазна. &lt;br&gt;Hypnotic Poison от Christian Dior – аромат для женственной соблазнительницы, перед чьей магией не может устоять ни один мужчина. Одним только взглядом или жестом она может свести с ума.Аромат принадлежит к группе ароматов восточные гурманские. Верхние ноты: Абрикос, слива и Кокос; ноты сердца: Тубероза, Жасмин, Ландыш, роза, Палисандр и Тмин; ноты базы: Сандаловое дерево, Миндаль, Ваниль и Мускус.&lt;br&gt;&lt;/p&gt;', '', 'DIOR  Hypnotic Poison   woman 100ml ', '', '');
INSERT INTO `oc_product_description` VALUES ('126', '1', 'DIOR J\' ADOR de parfum 100ml', '&lt;p&gt;Cладость опьяняющего нектара - сочетание самых невообразимых и завораживающих&amp;nbsp; ароматов. Бодрящий фруктовый микс, дарящий тепло минувшего лета. Волшебство ароматной палитры, подобранной лучшими мастерами парфюмерного дела, нарушат обонятельный покой. Какими словами описать аромат Christian Dior J’adore. Цветочные аккорды в дуэте с фруктовой сладостью – это непревзойденное сочетание, удивит и одарит невероятным ароматом ее обладательницу. &lt;br&gt;Первыми до вас донесутся ароматный бергамот и сладость спелой дыни, персиковых нот и приторность груши. В середине душистой симфонии вы ощутите фиалковые проблески дополненные шармом розы и невинностью ландыша.&lt;br&gt;&lt;/p&gt;', '', 'DIOR J\' ADOR de parfum 100ml', '', '');
INSERT INTO `oc_product_description` VALUES ('127', '1', 'DKNY Be Delicious   woman 100ml ', '&lt;p&gt;Сочный, свежий и чарующий аромат Donna Karan Be Delicious появляется из самого сердца неугомонного Нью-Йорка. Этот парфюм противоречивый и универсальный, он яркий и в то же время нежный, сексуальный и одновременно с этим невинный – он в один момент очаровывает любого мужчину.&amp;nbsp; DKNY Be Delicious это гармоничное сочетание чувственных древесных и сладких цветочно-фруктовых аккордов.&lt;br&gt;Верхние ноты: магнолия, грейпфрут и свежий огурчик; средние ноты: цветочная симфония нежного ландыша, сладкой розы, фиалки и сочного яблока; базовые ноты: белая амбра, дополненная древесными нотами.&lt;br&gt;&lt;/p&gt;', '', 'DKNY Be Delicious   woman 100ml ', '', '');
INSERT INTO `oc_product_description` VALUES ('128', '1', 'GIVENCHY  Absolutely Esistible  woman 75ml ', '&lt;p&gt;В этой необычной парфюмированной воде заключены живительная сила, свежесть и очарование.&lt;br&gt;Шикарный и соблазнительный, трепетный и завораживающий парфюм адресован привлекательным, сексуальным, неотразимым красавицам, которые любят искушать, подчеркивать свое совершенство, провоцировать магнетической чувственностью.&lt;br&gt;Обладательница аромата – женщина-загадка, на разгадку которой настоящие мужчины готовы потратить всю жизнь. Ее окружает облако из переливов сладкого апельсина, освежающего зеленого мандарина, чарующего гелиотропа, египетского жасмина. К ним чудным образом добавляются&amp;nbsp; маслянистый кедр, пачули и душистая амбра.&lt;br&gt;&lt;/p&gt;', '', 'GIVENCHY  Absolutely Esistible  woman 75ml ', '', '');
INSERT INTO `oc_product_description` VALUES ('129', '1', 'Givenchy Ange Ou Demon Le Secret Eau deToilette 100 ml', '&lt;p&gt;Яркий и чувственный аромат Ange Ou Demon Le Secret Eau de Toilette отражает двойственность натуры молодой женщины: загадочность и очарование. Для Нее соблазнение — это игра. Она мечтает о том, чтобы любить и быть любимой, но при этом остается недопустимой и уверенной в себе. Нежная, чувственная и одновременно смелая и свободная, она существует между светом и тьмой.&lt;br&gt;Ее окутывает завораживающий аромат — воплощение ее желаний!&lt;br&gt;Пирамида аромата: Верхние ноты: яблоко в карамели, бергамот. Ноты «сердца»: жасмин, чайная роза.&amp;nbsp; Базовые ноты: пачули, мускус, амбра.&lt;br&gt;&lt;/p&gt;', '', 'Givenchy Ange Ou Demon Le Secret Eau deToilette 100 ml', '', '');
INSERT INTO `oc_product_description` VALUES ('130', '1', 'Givenchy Play Intense woman 75 ml	               ', '&lt;p&gt;&amp;nbsp;Парфюмерия Givenchy Play Intense это страсть, чувственность и яркость заключенная в одном аромате. Блестящий и превосходный аромат для модной девушки, которая живет в большом городе. Владелица Givenchy Play Intense самостоятельна и активная, она играет с жизнью за своим установленными правилами. Она все время добивается своих поставленных целей, но в строгом жизненном ритме не теряет своего истинного женского очарования, нежности и сексуальности. В состав композиции парфюма входит розовый перец, цветы апельсина, амирис, цветы тиары, орхидея, сандал, пачули, бобы тонка.&lt;br&gt;&lt;/p&gt;', '', 'Givenchy Play Intense woman 75 ml	               ', '', '');
INSERT INTO `oc_product_description` VALUES ('131', '1', 'Givenchy Very Irresistible pour women 75 ml       ', '&lt;p&gt;Сочетание французской элегантности и американской непосредственности превратилось в чувственный и обольстительный Very Irresistible, перед обаянием которого невозможно устроять! Чтобы звучание аромата получилось очень женственным и нежным, соблазнительным и невинным одновременно, парфюмеры отобрали пять сортов самых прекрасных роз и создали само воплощение беззаботного и жизнерадостного стиля. Стиля, который делает тебя неотразимой! Который делает тебя Very Irresistible! Композиция: листья и почки черной смородины, лимонная вербена, звездчатый анис, розовый пион, магнолия, розы.&lt;br&gt;&lt;/p&gt;', '', 'Givenchy Very Irresistible pour women 75 ml       ', '', '');
INSERT INTO `oc_product_description` VALUES ('132', '1', 'Givenchy Very Irresistible Sensual women 75 ml ', '&lt;p&gt;Givenchy Very Irresistible Sensual вызывает восхищение утонченной женственностью и современным выражением гламурности.&amp;nbsp; По сравнению с оригинальной версией Very Irresistible данный аромат более насыщен нотами розы.&amp;nbsp;&amp;nbsp; Необычайно нежный и женственный этот волшебный аромат призван подарить своей обладательнице теплоту, счастье и любовь.&lt;br&gt;Аромат создан для женщины, желающей любить и быть любимой. Она очаровательна и нежна, но в ее глазах таится дикий огонек роковой соблазнительницы и хищницы. &lt;br&gt;Цветочная композиция основана на нотах нескольких сортов роз, которым «подпевают» листья вербены, звездчатый анис, ваниль и пачули.&lt;br&gt;&lt;/p&gt;', '', 'Givenchy Very Irresistible Sensual women 75 ml ', '', '');
INSERT INTO `oc_product_description` VALUES ('133', '1', 'Gucci ENVY Me 100 ml', '&lt;p&gt;Сила и энергия молодости струятся в каждой ноте изысканного французского парфюма Gucci Envy Me. Его&amp;nbsp; насыщенные переливы станут неотъемлемой частью яркого образа активной девушки, благодаря ему она сможет полностью реализовать свой потенциал и сделать каждый день незабываемым. В пассажах этого парфюма будто воплотилась сама идея молодости, не знающей преград и не признающей запретов.&amp;nbsp; Изысканная композиция Gucci Envy Me – это пленительный узор цветочных, фруктовых и благородных древесных нот, сплетенных в единую мелодию. &lt;br&gt;Классификация аромата: цветочные. Начальная нота: розовый пион, водный жасмин, розовый перец, личи, гранат, ананас.&amp;nbsp; Нота &quot;сердца&quot;: розовый мускус, дикий жасмин, белый чай.&amp;nbsp; Конечная нота: санталовое дерево, тиковое дерево, белый мускус&lt;br&gt;&lt;/p&gt;', '', 'Gucci ENVY Me 100 ml', '', '');
INSERT INTO `oc_product_description` VALUES ('134', '1', 'GUCCİ Flora by  GUCCİ EDP 75 ml	', '&lt;p&gt;Аромат характеризует молодую романтичную девушку с некой искоркой в глазах. Прелюдия аромата встречает нас цитрусовыми аккордами, которые плавно перетекают с сладострастные оттенки&amp;nbsp; пиона и розы, а те ,в свою очередь, в упоительную мягкость сандала и пачули.&lt;br&gt;Основное звучание аромата искрится молодостью и беззаботностью, однако присутствует тональность чувственности и роскоши. Героиня Flora by Gucci&amp;nbsp; яркая и независимая, местами даже дерзкая и смелая в своих повзрослевших желаниях. &lt;br&gt;&lt;/p&gt;', '', 'GUCCİ Flora by  GUCCİ EDP 75 ml	', '', '');
INSERT INTO `oc_product_description` VALUES ('135', '1', 'GUCCI  Guilty woman 75ml', '&lt;p&gt;Аромат ориентирован в первую очередь на сильных и смелых женщин, умеющим ценить каждую секунду жизни! Gucci Guilty нетривиальный аромат из когорты цветочно-восточных запахов и будет по достоинству оценен уверенным в себе, по-хорошему дерзким и немного отчаянными&amp;nbsp; женщинам, предпочитающими самостоятельно вершить собственную судьбу. В нем сверхудачно сплелись три будоражащих свойства - смелость, сексуальная привлекательность,&amp;nbsp; обаяние. &lt;br&gt;Основные компоненты: мандарин, персик, сирень, герань, пачули, амбра, красный перец.&lt;br&gt;&lt;/p&gt;', '', 'GUCCI  Guilty woman 75ml', '', '');
INSERT INTO `oc_product_description` VALUES ('136', '1', 'GUCCI  Guilty black woman 75ml', '&lt;p&gt;Этот аромат для женщин, вдохновленных, глубокой тайной страстью. Эта композиция&amp;nbsp; заявлена как пленительная, провокационная, дерзкая и&amp;nbsp; сексуальная. Она открывается яркими нотами красных ягод и розового перца.&lt;br&gt;Семейство ароматов: восточные, цветочные. Начальная нота: розовый перец, красные ягоды. Нота &amp;lt;сердца&amp;gt;: малина, персик, белая лилия, фиалка.&amp;nbsp; Конечная нота: пачули, амбра&lt;br&gt;&lt;/p&gt;', '', 'GUCCI  Guilty black woman 75ml', '', '');
INSERT INTO `oc_product_description` VALUES ('137', '1', 'Guerlain La Petite Robe Noire parfum 100 ml', '&lt;p&gt;Элегантнее маленького черного платья со времен Коко Шанель пока ничего не придумано. С его универсальностью и стилем может поспорить разве что одноименный парфюм для женщин в линейке Guerlain.&lt;br&gt;Создавая этот аромат, мастера стремились выделить ноту лаконичности, стиля и привлекательности. В итоге свет увидела романтичная, простая и легкая композиция La Petite Robe Noir, не лишенная, однако и некоторой глубины. &lt;br&gt;Верхние ноты: Бергамот, Миндаль, вишня и Красные ягоды; ноты сердца: роза, Чай, таифская роза и Лакричник; ноты базы: Анис, Тонка бобы, Ваниль, пачули и Ирис.&lt;br&gt;&lt;br&gt;&lt;/p&gt;', '', 'Guerlain La Petite Robe Noire parfum 100 ml', '', '');
INSERT INTO `oc_product_description` VALUES ('138', '1', 'HUGO BOSS JOUR woman 100ml', '&lt;p&gt;Boss Jour Pour Femme был создан, чтобы показать три лица женщины: вдохновение, самообладание и легкость. Аромат описывается как красивое сочетание белых цветов с игристыми и прохладными цитрусовыми аккордами. Свежие верхние ноты представлены комбинацией лайма и цветов грейпфрута. Они отражают легкость и подобны первым лучам утреннего солнца, которые ассоциируются с ожиданием чего-то хорошего. Вдохновение дарит богатый букет женственных белых цветов - фрезии, ландыша и жимолости - в сердце композиции. Самообладание передано с помощью более сильной и мужественной базы, включающей аккорды белой березы и сливочной амбры&lt;br&gt;&lt;/p&gt;', '', 'HUGO BOSS JOUR woman 100ml', '', '');
INSERT INTO `oc_product_description` VALUES ('139', '1', 'HUGO BOSS Ma Vie pour Femme 75 ml', '&lt;p&gt;Hugo Boss Ma Vie был вдохновлен независимой женщиной, которая делает паузу, чтобы просто насладиться простыми моментами жизни; пройтись до дома пешком, ощутить солнце на своей коже, прикоснуться к цветку. Именно в такие моменты, которыми она по-настоящему дорожит, женщина Boss Ma Vie Pour Femme особенно пленительна, светится женственностью и уверенностью.&quot;&lt;br&gt;Композиция новинки описывается как свежая, доставляющая удовольствие и уникальная. Она состоит из трех частей - &quot;современность&quot;, &quot;женственность&quot; и &quot;уверенность&quot;. За &quot;современность&quot; отвечают верхние ноты, представленные цветами кактуса с их зеленой свежестью. &quot;Женственность&quot; отражена в сердце из розовой фрезии, жасмина и нежных бутонов розы. &quot;Уверенность&quot; представлена базой из теплых древесных аккордов и кедра.&lt;br&gt;&lt;/p&gt;', '', 'HUGO BOSS Ma Vie pour Femme 75 ml', '', '');
INSERT INTO `oc_product_description` VALUES ('140', '1', 'HUGO BOSS Nuit pour Femme 75 ml	                              ', '&lt;p&gt;Aромат, вдохновленный вечной элегантностью маленького черного платья. Boss Nuit Pour Femme Intense разработан для особых случаев, которые требуют элегантности. Состав не сильно отличается от оригинала, только ноты приобрели интенсивность. Верхние ноты белого персика в этом выпуске увеличены, чтобы далее выдвинуть на первый план женственность и чувственность аромата. Цветочное сердце включает ноты фиалки, жасмина и других белых цветов. Основа состоит из кристаллического мха, теплой древесины и сливочного сандалового дерева. &lt;br&gt;&lt;/p&gt;', '', 'HUGO BOSS Nuit pour Femme 75 ml	                              ', '', '');
INSERT INTO `oc_product_description` VALUES ('141', '1', 'Kenzo  L\'eau par Kenzo Colors pour Femme 100ml', '&lt;p&gt;Океанический аромат всегда дарит ощущение свободы и независимости. L`Eau par Kenzo вобрал в себя всю свежеть, которую можно почувствовать на берегу океана.&amp;nbsp; &lt;br&gt;Он создан на основе цветочных ароматов, которые символизируют женственность&amp;nbsp; вашей натуры, подчеркивают вашу красоту не только внешнюю, но и внутреннюю. Он прекрасно подходит для современной бизнес-леди:&amp;nbsp; активной, общительной, смело идущей к своим целям, обходя все преграды на своем пути. &lt;br&gt;Классификация аромата: цветочные, водные. Начальная нота: зеленая сирень, мандарин, тростник, мята. Нота &quot;сердца&quot;: фиалка, перец, водяная лилия, белый персик, амариллис, роза. Конечная нота: ваниль, кедр.&lt;br&gt;&lt;/p&gt;', '', 'Kenzo  L\'eau par Kenzo Colors pour Femme 100ml', '', '');
INSERT INTO `oc_product_description` VALUES ('142', '1', 'Kenzo L\'Eau Par Kenzo pour Femme 100ml', '&lt;p&gt;Женщина в окружении L’Eau par Kenzo женственная и энергичная, пленительная и волнующая горожанка, которая не потеряла взаимосвязь с природой. Она веселая, общительная, привлекательная, заражает всех своим оптимизмом, умеет быть в гармонии с миром и управлять своей жизнью.&lt;br&gt;Время аромата – лето. Его нужно иметь в своей коллекции, особенно для знойных дней, когда не хватает прохлады и свежести. Однако можно носить и осенью под дождем. В прохладе он раскрывается еще больше, а стойкий манящий шлейф оставляет приятное послевкусие уходящего лета. Верхние ноты: сирень, розовый перец, мята, мандарин, бамбук. Средние ноты: фиалка, лотос, амариллис, персик, перец черный, роза.&lt;br&gt;&lt;/p&gt;', '', 'Kenzo L\'Eau Par Kenzo pour Femme 100ml', '', '');
INSERT INTO `oc_product_description` VALUES ('143', '1', 'Lacoste  pour Femme  100ml', '&lt;p&gt;Новый аромат Lacoste Pour Femme стал квинтэссенцией нежности, чувственности, романтичности женской натуры. Чтобы представительница прекрасного пола смогла воспользоваться таким козырем на пути своей самореализации, предлагаем одновременно приобрести крем для тела и флакон парфюма с идентичным запахом.&lt;br&gt;Классификация аромата: цветочные, древесные. Начальная нота: перец, фрезия, зеленое яблоко, бергамот, масло мускатного ореха. Нота &quot;сердца&quot;: фиалка, гибискус, жасмин, гелиотроп, роза. Конечная нота: лабданум, сандаловое дерево, ладан, кедр, кожа, мускус.&lt;br&gt;&lt;/p&gt;', '', 'Lacoste  pour Femme  100ml', '', '');
INSERT INTO `oc_product_description` VALUES ('144', '1', 'Lancome Hypnose  woman  100ml', '&lt;p&gt;Hypnose от Lancome - солнечный, древесный, восточный аромат. Загадка этого уникального парфюма в особенности цветка, который создает нежную и страстную ауру у женщины - в волшебной орхидее. Ваниль в шлейфе, прекрасно адаптируясь на коже, веет теплом и сливочным ароматом. Ветивер, окруженный белыми цветами, и жасмин самбак дают чувственное и глубокое ощущение.&lt;br&gt;Женщина Hypnose околдовывает, гипнотизирует, искушает и провоцирует. Она полна сексуальности и очарования. &lt;br&gt;&lt;/p&gt;', '', 'Lancome Hypnose  woman  100ml', '', '');
INSERT INTO `oc_product_description` VALUES ('145', '1', 'LANCOME Tresor  edp  femme 100 ml    ', '&lt;p&gt;&amp;nbsp;&quot;Любовь - это сокровище!&quot; - лозунг, отражающий внутреннюю суть аромата, который имеет успех во всем мире благодаря своему тонкому сочетанию нот и оттенков. Женщина Tresor - утонченная, элегантная и нежная, находится в состоянии гармоничного спокойствия. Верхние ноты персика, абрикоса, ананаса и бергамота переплетаются с &quot;сердцем&quot; из царственной розы, гелиотропа и белого жасмина. В базовой ноте - сочетание оттенков сандалового дерева, мускуса и ванили создает ощущение спокойствия и умиротворенности.&lt;br&gt;&lt;br&gt;&lt;/p&gt;', '', 'LANCOME Tresor  edp  femme 100 ml', '', '');
INSERT INTO `oc_product_description` VALUES ('146', '1', ' LANVIN ECLAT D\'ARPEGE 100 ml', '&lt;p&gt;Роман между женщиной и Eclat D\'Arpege - это не мимолетный флирт, а нежное и чистое чувство, которое останется с Вами на долгое время. Аромат никогда не покинет Вас, пока Вы остаетесь самой собой, он будет сопровождать Вас повсюду, подчеркивая все грани Вашего обаяния.&lt;br&gt;Листья сицилианского лимона и зеленая сирень составляют искрящиеся верхние ноты, за которыми идет сердце из цветков сладкого персика и листьев зеленого чая. Шлейф из белого ливанского кедра, мускуса и амбры подчеркнет Вашу женственность и элегантность.&lt;br&gt;&lt;br&gt;&lt;/p&gt;', '', ' LANVIN ECLAT D\'ARPEGE 100 ml', '', '');
INSERT INTO `oc_product_description` VALUES ('147', '1', 'Mancera Gold  Intensitive  Aoud  woman 100ml	', '&lt;p&gt;Эмоциональные унисекс духи Mancera Intensitive Aoud Gold наполнены богатым, мелодичным и божественным благоуханием дерева Уд. Составленный для романтичных, духовных и многогранных личностей, которые всегда выделяются в обществе неординарным мышлением и несокрушимой стойкостью убеждений, древесный аромат парфюма Mancera Intensitive Aoud Gold ( Мансера Интенсив Уд Голд) окружит своего владельца или владелицу аурой роскоши, элитарности и благородства, которые присущи высоко статусным личностям. Волшебная, восточная композиция аромата духов Mancera Intensitive Aoud Gold накроет вас волной мощного звучания нот королевской болгарской розы, проникновенной амбры, магического дерева уд, драгоценного абсолю розы, притягательного мускуса и роскошного красного дерева.&lt;br&gt;&lt;br&gt;&lt;/p&gt;', '', 'Mancera Gold  Intensitive  Aoud  woman 100ml	', '', '');
INSERT INTO `oc_product_description` VALUES ('148', '1', 'MOSCHİNO FUNNY 100 ml', '&lt;p&gt;Этот аромат идеален для тех девушек, которые хотят постоянно пребывать в хорошем настроении. Жизнь — хорошая штука, особенно, если вы вышли из дома, брызнув на себя туалетную воду Moschino Funny. Запах больше всего понравится именно оптимисткам, хотя, если вы хотите развеяться, прогнать депрессию, то, пожалуй, использование этих духов станет простым и действенным методом для этого.&lt;br&gt;Описание аромата:&amp;nbsp; верхние составлены из стручков розового перца, кистей красной смородины, долек горького апельсина;&amp;nbsp; средние головокружительно пахнут нежностью таких цветов как пион, фиалка, жасмин и зеленый чай;&amp;nbsp;&amp;nbsp; в основе используются неподражаемые амбра, дубовый мох и кедр. &lt;br&gt;&lt;/p&gt;', '', 'MOSCHİNO FUNNY 100 ml', '', '');
INSERT INTO `oc_product_description` VALUES ('149', '1', 'Nina Ricci  Premier Jour  woman  100ml', '&lt;p&gt;Аромат Premier Jour от Nina Ricci ознаменовал собой пересмотр брендом своего понимания женственности. Недаром он носит название «Первый день», что подразумевает начало с чистого листа, новые горизонты, новую жизнь. Аромат новой концепции получился ярким, светлым, соблазнительным и чувственным.. &lt;br&gt;День первый... Момент зарождения этого лучистого, цветочного аромата похож на начало начал. Premiere Jour сопровождает женщину, наслаждающуюся открытым миром чувственности.&amp;nbsp; Основа: желтый мандарин, гардения &quot;Утренняя роса&quot;, нота &quot;сердца&quot;: душистый горошек, орхидея, ваниль, белое драже. Шлейф: кучина, индийский сандал, мускус.&lt;br&gt;&lt;/p&gt;', '', 'Nina Ricci  Premier Jour  woman  100ml', '', '');
INSERT INTO `oc_product_description` VALUES ('150', '1', 'Nina Ricci NINA 100 ml', '&lt;p&gt;&quot;Nina&quot; - волшебный аромат, современная сказка, полная магии и волшебных эмоций. Сказочный и романтичный аромат, наделенный силой соблазнения, обещания чуда! Для молодой женщины, любящей неожиданные сюрпризы и волшебство.Начальные ноты открываются калабрийским лимоном и лаймом. Нотами &quot;сердца&quot; являются засахаренное яблоко, ваниль, пралине, лунный цветок и пион. Завершают композицию яблочное дерево, хлопковый мускус, белый кедр и бальзам.Свежий, фруктово-цветочный аромат сочетает в себе соблазн, женственность и современность. &lt;br&gt;&lt;/p&gt;', '', 'Nina Ricci NINA 100 ml', '', '');
INSERT INTO `oc_product_description` VALUES ('151', '1', 'Rihanna Reb\'l Fleur   woman 100ml', '&lt;p&gt;Rihanna Reb\'l Fleur переводится как «Непокорный цветок» и аромат вполне соответствует названию. Это стильный, чувственный и откровенный парфюм. Дебютный аромат певицы сразу приобрел тысячи поклонников по всему миру, благодаря своей элегантности и страстности. Rihanna Reb\'l Fleur создан для юных модниц, стильных и элегантных барышень, любящих провокации, завистливые взгляды, не желающих оставаться в тени или выходить на второй план. Это лидеры, любимицы публики и окружающих, талантливые и независимые, страстные и непокорные.&lt;br&gt;Верхние ноты: Персик, слива и Красные ягоды; ноты сердца: Тубероза, Фиалка, Кокос и Гибискус; ноты базы: Мускус, пачули, Амбра и ваниль&lt;br&gt;&lt;/p&gt;', '', 'Rihanna Reb\'l Fleur   woman 100ml', '', '');
INSERT INTO `oc_product_description` VALUES ('152', '1', 'PACO RABANNE Lady  one  Million   80ml', '&lt;p&gt;Околдовывающая молодая женщина, которая хрупкая на вид, однако имеет просто огненный темперамент и невероятную чувственность – все это Lady Million от Paco Rabanne. Девушка, которая пользуется такими духами, очень убедительная, светящаяся и ограниченная. Она как бриллиант, ведь новый аромат призван завершать образ сильной, роскошной и уверенной в собственном очаровании женщины.&lt;br&gt;Пако Рабан однажды сказал: «Женщины завтрашнего дня будут очень эффективными и соблазнительными. И, несомненно, они будут лучше… мужчин!»&lt;br&gt;Верхние ноты: апельсин, малина, нероли. Ноты «сердца»: флердоранж, арабский жасмин, гардения. Базовые ноты: мед, пачули. &lt;br&gt;&lt;/p&gt;', '', 'PACO RABANNE Lady  one  Million   80ml', '', '');
INSERT INTO `oc_product_description` VALUES ('153', '1', 'Prada Candy 80 ml', '&lt;p&gt;Революционно-правокационные, невероятно женственные, вызывающе игривые и соблазнительные женские духи Prada Candy (&quot;Candy&quot; - конфета, леденец).&amp;nbsp; В Prada Candy кроме сахарной ваты, малиновых леденцов, сырой и варёной сгущёнки обнаружился темперамент, озорство и … чувство меры, что бесценно. Prada Candy не груба как большинство ароматов для сладкоежек. Она рассчитана на людей с нормальным порогом чувствительности к сладкому.&lt;br&gt;Нота «сердца» – сиамский бензоин, основа – карамель; верхние ноты: мускус; средние ноты: сиамский бензоин; базовые ноты: карамель.&lt;br&gt;&lt;/p&gt;', '', 'Prada Candy 80 ml', '', '');
INSERT INTO `oc_product_description` VALUES ('154', '1', 'TRUSSARDI DONNA women 100 ml', '&lt;p&gt;Новый аромат Donna Trussardi - в элегантном&amp;nbsp; белоснежном&amp;nbsp; обрамлении. Деликатный, прозрачный аромат абсолютной женственности. Он олицетворяет стиль, индивидуальность и особенности характера преуспевающей и уверенной в себе женщины большого города. Аромат – это сложная сюжетная картина. Свежесть лимона и арбуза&amp;nbsp; переливается в солнечных лучах, нежность жасмина, ласковое прикосновение пачули, приятная мягкая обволакивающая ваниль. Неторопливо аромат&amp;nbsp; раскрывается на коже, сливается с ней, становясь сексуальным и возбуждающим! В нем есть и интрига, и любовь, и просто радость.&lt;br&gt;&lt;/p&gt;', '', 'TRUSSARDI DONNA women 100 ml', '', '');
INSERT INTO `oc_product_description` VALUES ('155', '1', 'SHAIK №30  woman  100ml', 'Shaik, принц пустыни, великолепный и могущественный, невидимый и вездесущий, раздает сокровища щедрой рукой, за что его благословляют благодарные люди. Селективная арабская парфюмерная линия из Бахрейна создает духи без оглядки на стоимость и количество ингредиентов. В результате получаются безграничные ароматные сказки. &lt;br&gt;Ноты: Бергамот, лаванда, лимон, базилик, герань, зеленое яблоко, корица, бутоны гвоздичного дерева, белый кедр, пачули, дубовый мох, лабданум, ваниль, мускус.&lt;br&gt;', '', 'SHAIK №30  woman  100ml', '', '');
INSERT INTO `oc_product_description` VALUES ('156', '1', 'Versace Bright Crystal 90 ml', '&lt;p&gt;Парфюм Versace Bright Crystal подчеркивает&amp;nbsp; уникальность и красоту каждой женщины, он пьянит своим манящим и увлекательным ароматом. Versace Bright Crystal имеет способность отразить все эмоции и нотки настроения своей обладательницы: подчеркнет спокойствие, предаст большей нежности, выразит яркий темперамент. &lt;br&gt;Букет Bright Crystal легок, свеж, с гармонично смешанными чувственными, красочными аккордами семян граната, ледянящего своей свежестью сверкающего юзу, прелестного пиона, лепестков магнолии и цветков лотоса. А при тесном соседстве нот нежной и манящей амбры, красного дерева и мускуса духов Versace Bright Crystal, женщина всегда будет очаровательна, сочетая и олицетворяя в себе силу, чувственность и женственность. &lt;br&gt;&lt;/p&gt;', '', 'Versace Bright Crystal 90 ml', '', '');
INSERT INTO `oc_product_description` VALUES ('157', '1', 'VERSACE Crystal Noir women 90 ml', '&lt;p&gt;Погрузитесь в интригующий мир женственности и утонченности вместе с ароматом «Crystal Noir» от Versace. Манящий, пьянящий и очень страстный, предназначенный для обворожительной женщины, притягательной и загадочной, он откроет целый мир Ваших желаний. Такой женщине мужчина готов навсегда отдать свое сердце и душу, ничего не требуя взамен. Дразнящий и непредсказуемый, он заиграет тысячью граней на Вашей коже, ослепив окружающих обновленным сиянием Вашей индивидуальности.&lt;br&gt;Верхние ноты представлены смесью имбиря, зеленого кардамона и перца. Ноты сердца состоят из апельсинового цвета, гардении и пиона. Ноты базы включают сочетание мускуса, сандалового дерева и амбры.&lt;br&gt;&lt;/p&gt;', '', 'VERSACE Crystal Noir women 90 ml', '', '');
INSERT INTO `oc_product_description` VALUES ('158', '1', 'Viktor &amp; Rolf  Flower  Bomb edp  100 ml', '&lt;p&gt;Flowerbomb - настоящий цветочный взрыв, &quot;это не противоядие от реальности, с которой мы можем бороться лишь одним оружием - мечтой&quot;, - утверждают создатели аромата.&lt;br&gt;Flowerbomb от Victor &amp;amp; Rolf – это цветочный взрыв, изобилие цветочных оттенков, которые имеют удивительную способность поднимать настроение, внушать оптимизм и делать лучше окружающий нас мир. Магические обволакивающие ноты этого аромата разбудят ваши чувства и заставят поверить, что вы живете в прекрасном саду, далеком от жестокой реальности. &lt;br&gt;Начальная нота: чай, бергамот. Нота &quot;сердца&quot;: самбакский жасмин, орхидея, фрезия, роза сентифолия. Конечная нота: пачули, индийский османтус.&lt;br&gt;&lt;/p&gt;', '', 'Viktor &amp; Rolf  Flower  Bomb edp  100 ml', '', '');

-- ----------------------------
-- Table structure for oc_product_discount
-- ----------------------------
DROP TABLE IF EXISTS `oc_product_discount`;
CREATE TABLE `oc_product_discount` (
  `product_discount_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`product_discount_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=441 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_product_discount
-- ----------------------------

-- ----------------------------
-- Table structure for oc_product_filter
-- ----------------------------
DROP TABLE IF EXISTS `oc_product_filter`;
CREATE TABLE `oc_product_filter` (
  `product_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_product_filter
-- ----------------------------

-- ----------------------------
-- Table structure for oc_product_image
-- ----------------------------
DROP TABLE IF EXISTS `oc_product_image`;
CREATE TABLE `oc_product_image` (
  `product_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_image_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2393 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_product_image
-- ----------------------------
INSERT INTO `oc_product_image` VALUES ('2392', '67', '', '0');
INSERT INTO `oc_product_image` VALUES ('2390', '64', 'catalog/aromaaura/Chanel_Bleu_de_Chanel/2.jpg', '0');
INSERT INTO `oc_product_image` VALUES ('2388', '63', 'catalog/aromaaura/chanel_alure_sport_home/2.jpg', '0');
INSERT INTO `oc_product_image` VALUES ('2387', '61', 'catalog/aromaaura/Carolina_Herrera_212_VIP_sexy_man/2.jpg', '0');
INSERT INTO `oc_product_image` VALUES ('2385', '59', 'catalog/aromaaura/Carolina_Herrera_212_MEN/2.jpg', '0');
INSERT INTO `oc_product_image` VALUES ('2379', '51', 'catalog/aromaaura/ARMANI _Code _pour _Homme/3.jpg', '0');
INSERT INTO `oc_product_image` VALUES ('2378', '51', 'catalog/aromaaura/ARMANI _Code _pour _Homme/2.jpg', '0');
INSERT INTO `oc_product_image` VALUES ('2381', '52', 'catalog/aromaaura/Baldessarini_Ambre_men/3.jpg', '0');
INSERT INTO `oc_product_image` VALUES ('2380', '52', 'catalog/aromaaura/Baldessarini_Ambre_men/2.jpg', '0');
INSERT INTO `oc_product_image` VALUES ('2382', '53', 'catalog/aromaaura/Baldessarini_Del_Mar/3.jpg', '0');
INSERT INTO `oc_product_image` VALUES ('2383', '53', 'catalog/aromaaura/Baldessarini_Del_Mar/2.jpg', '0');
INSERT INTO `oc_product_image` VALUES ('2391', '65', 'catalog/aromaaura/chanel_platinum_egoiste/2.jpg', '0');
INSERT INTO `oc_product_image` VALUES ('2389', '62', 'catalog/aromaaura/chanel_allure_men/2.jpg', '0');
INSERT INTO `oc_product_image` VALUES ('2384', '58', 'catalog/aromaaura/Calvin_Klein_EUPHARIA _men/2.jpg', '0');
INSERT INTO `oc_product_image` VALUES ('2377', '50', 'catalog/aromaaura/ARMANI _Acqua_Di_Gio _man/2.jpg', '0');
INSERT INTO `oc_product_image` VALUES ('2376', '50', 'catalog/aromaaura/ARMANI _Acqua_Di_Gio _man/3.jpg', '0');
INSERT INTO `oc_product_image` VALUES ('2386', '60', 'catalog/aromaaura/Carolina_Herrera_212_VIP_men/2.png', '0');

-- ----------------------------
-- Table structure for oc_product_option
-- ----------------------------
DROP TABLE IF EXISTS `oc_product_option`;
CREATE TABLE `oc_product_option` (
  `product_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `value` text NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`product_option_id`)
) ENGINE=MyISAM AUTO_INCREMENT=227 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_product_option
-- ----------------------------

-- ----------------------------
-- Table structure for oc_product_option_value
-- ----------------------------
DROP TABLE IF EXISTS `oc_product_option_value`;
CREATE TABLE `oc_product_option_value` (
  `product_option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value_id` int(11) NOT NULL,
  `quantity` int(3) NOT NULL,
  `subtract` tinyint(1) NOT NULL,
  `price` decimal(15,4) NOT NULL,
  `price_prefix` varchar(1) NOT NULL,
  `points` int(8) NOT NULL,
  `points_prefix` varchar(1) NOT NULL,
  `weight` decimal(15,8) NOT NULL,
  `weight_prefix` varchar(1) NOT NULL,
  PRIMARY KEY (`product_option_value_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_product_option_value
-- ----------------------------

-- ----------------------------
-- Table structure for oc_product_recurring
-- ----------------------------
DROP TABLE IF EXISTS `oc_product_recurring`;
CREATE TABLE `oc_product_recurring` (
  `product_id` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`recurring_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_product_recurring
-- ----------------------------

-- ----------------------------
-- Table structure for oc_product_related
-- ----------------------------
DROP TABLE IF EXISTS `oc_product_related`;
CREATE TABLE `oc_product_related` (
  `product_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`related_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_product_related
-- ----------------------------

-- ----------------------------
-- Table structure for oc_product_reward
-- ----------------------------
DROP TABLE IF EXISTS `oc_product_reward`;
CREATE TABLE `oc_product_reward` (
  `product_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `points` int(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_reward_id`)
) ENGINE=MyISAM AUTO_INCREMENT=546 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_product_reward
-- ----------------------------

-- ----------------------------
-- Table structure for oc_product_special
-- ----------------------------
DROP TABLE IF EXISTS `oc_product_special`;
CREATE TABLE `oc_product_special` (
  `product_special_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`product_special_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=441 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_product_special
-- ----------------------------
INSERT INTO `oc_product_special` VALUES ('440', '146', '1', '1', '250.0000', '2015-11-08', '2015-11-27');

-- ----------------------------
-- Table structure for oc_product_to_category
-- ----------------------------
DROP TABLE IF EXISTS `oc_product_to_category`;
CREATE TABLE `oc_product_to_category` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`category_id`),
  KEY `category_id` (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_product_to_category
-- ----------------------------
INSERT INTO `oc_product_to_category` VALUES ('50', '62');
INSERT INTO `oc_product_to_category` VALUES ('50', '95');
INSERT INTO `oc_product_to_category` VALUES ('51', '62');
INSERT INTO `oc_product_to_category` VALUES ('51', '95');
INSERT INTO `oc_product_to_category` VALUES ('52', '63');
INSERT INTO `oc_product_to_category` VALUES ('52', '96');
INSERT INTO `oc_product_to_category` VALUES ('53', '63');
INSERT INTO `oc_product_to_category` VALUES ('53', '96');
INSERT INTO `oc_product_to_category` VALUES ('54', '64');
INSERT INTO `oc_product_to_category` VALUES ('54', '97');
INSERT INTO `oc_product_to_category` VALUES ('55', '64');
INSERT INTO `oc_product_to_category` VALUES ('55', '97');
INSERT INTO `oc_product_to_category` VALUES ('56', '65');
INSERT INTO `oc_product_to_category` VALUES ('56', '98');
INSERT INTO `oc_product_to_category` VALUES ('58', '66');
INSERT INTO `oc_product_to_category` VALUES ('58', '99');
INSERT INTO `oc_product_to_category` VALUES ('59', '67');
INSERT INTO `oc_product_to_category` VALUES ('59', '100');
INSERT INTO `oc_product_to_category` VALUES ('60', '67');
INSERT INTO `oc_product_to_category` VALUES ('60', '100');
INSERT INTO `oc_product_to_category` VALUES ('61', '67');
INSERT INTO `oc_product_to_category` VALUES ('61', '100');
INSERT INTO `oc_product_to_category` VALUES ('62', '68');
INSERT INTO `oc_product_to_category` VALUES ('62', '101');
INSERT INTO `oc_product_to_category` VALUES ('63', '68');
INSERT INTO `oc_product_to_category` VALUES ('63', '101');
INSERT INTO `oc_product_to_category` VALUES ('64', '68');
INSERT INTO `oc_product_to_category` VALUES ('64', '101');
INSERT INTO `oc_product_to_category` VALUES ('65', '68');
INSERT INTO `oc_product_to_category` VALUES ('65', '101');
INSERT INTO `oc_product_to_category` VALUES ('66', '69');
INSERT INTO `oc_product_to_category` VALUES ('66', '102');
INSERT INTO `oc_product_to_category` VALUES ('67', '69');
INSERT INTO `oc_product_to_category` VALUES ('67', '102');
INSERT INTO `oc_product_to_category` VALUES ('68', '69');
INSERT INTO `oc_product_to_category` VALUES ('68', '102');
INSERT INTO `oc_product_to_category` VALUES ('69', '69');
INSERT INTO `oc_product_to_category` VALUES ('69', '102');
INSERT INTO `oc_product_to_category` VALUES ('70', '70');
INSERT INTO `oc_product_to_category` VALUES ('70', '103');
INSERT INTO `oc_product_to_category` VALUES ('71', '70');
INSERT INTO `oc_product_to_category` VALUES ('71', '103');
INSERT INTO `oc_product_to_category` VALUES ('72', '71');
INSERT INTO `oc_product_to_category` VALUES ('72', '104');
INSERT INTO `oc_product_to_category` VALUES ('73', '72');
INSERT INTO `oc_product_to_category` VALUES ('73', '105');
INSERT INTO `oc_product_to_category` VALUES ('74', '73');
INSERT INTO `oc_product_to_category` VALUES ('74', '106');
INSERT INTO `oc_product_to_category` VALUES ('75', '73');
INSERT INTO `oc_product_to_category` VALUES ('75', '106');
INSERT INTO `oc_product_to_category` VALUES ('76', '74');
INSERT INTO `oc_product_to_category` VALUES ('76', '107');
INSERT INTO `oc_product_to_category` VALUES ('77', '74');
INSERT INTO `oc_product_to_category` VALUES ('77', '107');
INSERT INTO `oc_product_to_category` VALUES ('78', '74');
INSERT INTO `oc_product_to_category` VALUES ('78', '107');
INSERT INTO `oc_product_to_category` VALUES ('79', '74');
INSERT INTO `oc_product_to_category` VALUES ('79', '107');
INSERT INTO `oc_product_to_category` VALUES ('80', '75');
INSERT INTO `oc_product_to_category` VALUES ('80', '108');
INSERT INTO `oc_product_to_category` VALUES ('81', '76');
INSERT INTO `oc_product_to_category` VALUES ('81', '109');
INSERT INTO `oc_product_to_category` VALUES ('82', '76');
INSERT INTO `oc_product_to_category` VALUES ('82', '109');
INSERT INTO `oc_product_to_category` VALUES ('83', '76');
INSERT INTO `oc_product_to_category` VALUES ('83', '109');
INSERT INTO `oc_product_to_category` VALUES ('84', '76');
INSERT INTO `oc_product_to_category` VALUES ('84', '109');
INSERT INTO `oc_product_to_category` VALUES ('85', '76');
INSERT INTO `oc_product_to_category` VALUES ('85', '109');
INSERT INTO `oc_product_to_category` VALUES ('86', '76');
INSERT INTO `oc_product_to_category` VALUES ('86', '109');
INSERT INTO `oc_product_to_category` VALUES ('87', '77');
INSERT INTO `oc_product_to_category` VALUES ('87', '110');
INSERT INTO `oc_product_to_category` VALUES ('88', '78');
INSERT INTO `oc_product_to_category` VALUES ('88', '111');
INSERT INTO `oc_product_to_category` VALUES ('89', '78');
INSERT INTO `oc_product_to_category` VALUES ('89', '111');
INSERT INTO `oc_product_to_category` VALUES ('90', '78');
INSERT INTO `oc_product_to_category` VALUES ('90', '111');
INSERT INTO `oc_product_to_category` VALUES ('91', '78');
INSERT INTO `oc_product_to_category` VALUES ('91', '111');
INSERT INTO `oc_product_to_category` VALUES ('92', '79');
INSERT INTO `oc_product_to_category` VALUES ('92', '112');
INSERT INTO `oc_product_to_category` VALUES ('93', '79');
INSERT INTO `oc_product_to_category` VALUES ('93', '112');
INSERT INTO `oc_product_to_category` VALUES ('94', '79');
INSERT INTO `oc_product_to_category` VALUES ('94', '112');
INSERT INTO `oc_product_to_category` VALUES ('95', '79');
INSERT INTO `oc_product_to_category` VALUES ('95', '112');
INSERT INTO `oc_product_to_category` VALUES ('96', '80');
INSERT INTO `oc_product_to_category` VALUES ('96', '113');
INSERT INTO `oc_product_to_category` VALUES ('97', '81');
INSERT INTO `oc_product_to_category` VALUES ('97', '114');
INSERT INTO `oc_product_to_category` VALUES ('98', '81');
INSERT INTO `oc_product_to_category` VALUES ('98', '114');
INSERT INTO `oc_product_to_category` VALUES ('99', '62');
INSERT INTO `oc_product_to_category` VALUES ('99', '115');
INSERT INTO `oc_product_to_category` VALUES ('100', '62');
INSERT INTO `oc_product_to_category` VALUES ('100', '115');
INSERT INTO `oc_product_to_category` VALUES ('101', '62');
INSERT INTO `oc_product_to_category` VALUES ('101', '115');
INSERT INTO `oc_product_to_category` VALUES ('102', '65');
INSERT INTO `oc_product_to_category` VALUES ('102', '116');
INSERT INTO `oc_product_to_category` VALUES ('103', '65');
INSERT INTO `oc_product_to_category` VALUES ('103', '116');
INSERT INTO `oc_product_to_category` VALUES ('104', '64');
INSERT INTO `oc_product_to_category` VALUES ('104', '117');
INSERT INTO `oc_product_to_category` VALUES ('105', '64');
INSERT INTO `oc_product_to_category` VALUES ('105', '117');
INSERT INTO `oc_product_to_category` VALUES ('106', '64');
INSERT INTO `oc_product_to_category` VALUES ('106', '117');
INSERT INTO `oc_product_to_category` VALUES ('107', '82');
INSERT INTO `oc_product_to_category` VALUES ('107', '118');
INSERT INTO `oc_product_to_category` VALUES ('108', '67');
INSERT INTO `oc_product_to_category` VALUES ('108', '119');
INSERT INTO `oc_product_to_category` VALUES ('109', '67');
INSERT INTO `oc_product_to_category` VALUES ('109', '119');
INSERT INTO `oc_product_to_category` VALUES ('110', '68');
INSERT INTO `oc_product_to_category` VALUES ('110', '120');
INSERT INTO `oc_product_to_category` VALUES ('111', '68');
INSERT INTO `oc_product_to_category` VALUES ('111', '120');
INSERT INTO `oc_product_to_category` VALUES ('112', '68');
INSERT INTO `oc_product_to_category` VALUES ('112', '120');
INSERT INTO `oc_product_to_category` VALUES ('113', '68');
INSERT INTO `oc_product_to_category` VALUES ('113', '120');
INSERT INTO `oc_product_to_category` VALUES ('114', '68');
INSERT INTO `oc_product_to_category` VALUES ('114', '120');
INSERT INTO `oc_product_to_category` VALUES ('115', '68');
INSERT INTO `oc_product_to_category` VALUES ('115', '120');
INSERT INTO `oc_product_to_category` VALUES ('116', '68');
INSERT INTO `oc_product_to_category` VALUES ('116', '120');
INSERT INTO `oc_product_to_category` VALUES ('117', '83');
INSERT INTO `oc_product_to_category` VALUES ('117', '121');
INSERT INTO `oc_product_to_category` VALUES ('118', '84');
INSERT INTO `oc_product_to_category` VALUES ('118', '122');
INSERT INTO `oc_product_to_category` VALUES ('119', '69');
INSERT INTO `oc_product_to_category` VALUES ('119', '123');
INSERT INTO `oc_product_to_category` VALUES ('120', '69');
INSERT INTO `oc_product_to_category` VALUES ('120', '123');
INSERT INTO `oc_product_to_category` VALUES ('121', '69');
INSERT INTO `oc_product_to_category` VALUES ('121', '123');
INSERT INTO `oc_product_to_category` VALUES ('122', '69');
INSERT INTO `oc_product_to_category` VALUES ('122', '123');
INSERT INTO `oc_product_to_category` VALUES ('123', '71');
INSERT INTO `oc_product_to_category` VALUES ('123', '124');
INSERT INTO `oc_product_to_category` VALUES ('124', '71');
INSERT INTO `oc_product_to_category` VALUES ('124', '124');
INSERT INTO `oc_product_to_category` VALUES ('125', '71');
INSERT INTO `oc_product_to_category` VALUES ('125', '124');
INSERT INTO `oc_product_to_category` VALUES ('126', '71');
INSERT INTO `oc_product_to_category` VALUES ('126', '124');
INSERT INTO `oc_product_to_category` VALUES ('127', '85');
INSERT INTO `oc_product_to_category` VALUES ('127', '125');
INSERT INTO `oc_product_to_category` VALUES ('128', '73');
INSERT INTO `oc_product_to_category` VALUES ('128', '126');
INSERT INTO `oc_product_to_category` VALUES ('129', '73');
INSERT INTO `oc_product_to_category` VALUES ('129', '126');
INSERT INTO `oc_product_to_category` VALUES ('130', '73');
INSERT INTO `oc_product_to_category` VALUES ('130', '126');
INSERT INTO `oc_product_to_category` VALUES ('131', '73');
INSERT INTO `oc_product_to_category` VALUES ('131', '126');
INSERT INTO `oc_product_to_category` VALUES ('132', '73');
INSERT INTO `oc_product_to_category` VALUES ('132', '126');
INSERT INTO `oc_product_to_category` VALUES ('133', '74');
INSERT INTO `oc_product_to_category` VALUES ('133', '127');
INSERT INTO `oc_product_to_category` VALUES ('134', '74');
INSERT INTO `oc_product_to_category` VALUES ('134', '127');
INSERT INTO `oc_product_to_category` VALUES ('135', '74');
INSERT INTO `oc_product_to_category` VALUES ('135', '127');
INSERT INTO `oc_product_to_category` VALUES ('136', '74');
INSERT INTO `oc_product_to_category` VALUES ('136', '127');
INSERT INTO `oc_product_to_category` VALUES ('137', '75');
INSERT INTO `oc_product_to_category` VALUES ('137', '128');
INSERT INTO `oc_product_to_category` VALUES ('138', '76');
INSERT INTO `oc_product_to_category` VALUES ('138', '129');
INSERT INTO `oc_product_to_category` VALUES ('139', '76');
INSERT INTO `oc_product_to_category` VALUES ('139', '129');
INSERT INTO `oc_product_to_category` VALUES ('140', '76');
INSERT INTO `oc_product_to_category` VALUES ('140', '129');
INSERT INTO `oc_product_to_category` VALUES ('141', '77');
INSERT INTO `oc_product_to_category` VALUES ('141', '130');
INSERT INTO `oc_product_to_category` VALUES ('142', '77');
INSERT INTO `oc_product_to_category` VALUES ('142', '130');
INSERT INTO `oc_product_to_category` VALUES ('143', '78');
INSERT INTO `oc_product_to_category` VALUES ('143', '131');
INSERT INTO `oc_product_to_category` VALUES ('144', '86');
INSERT INTO `oc_product_to_category` VALUES ('144', '132');
INSERT INTO `oc_product_to_category` VALUES ('145', '86');
INSERT INTO `oc_product_to_category` VALUES ('145', '132');
INSERT INTO `oc_product_to_category` VALUES ('146', '87');
INSERT INTO `oc_product_to_category` VALUES ('146', '133');
INSERT INTO `oc_product_to_category` VALUES ('147', '88');
INSERT INTO `oc_product_to_category` VALUES ('147', '134');
INSERT INTO `oc_product_to_category` VALUES ('148', '89');
INSERT INTO `oc_product_to_category` VALUES ('148', '135');
INSERT INTO `oc_product_to_category` VALUES ('149', '90');
INSERT INTO `oc_product_to_category` VALUES ('149', '136');
INSERT INTO `oc_product_to_category` VALUES ('150', '90');
INSERT INTO `oc_product_to_category` VALUES ('150', '136');
INSERT INTO `oc_product_to_category` VALUES ('151', '91');
INSERT INTO `oc_product_to_category` VALUES ('151', '137');
INSERT INTO `oc_product_to_category` VALUES ('152', '79');
INSERT INTO `oc_product_to_category` VALUES ('152', '138');
INSERT INTO `oc_product_to_category` VALUES ('153', '92');
INSERT INTO `oc_product_to_category` VALUES ('153', '139');
INSERT INTO `oc_product_to_category` VALUES ('154', '93');
INSERT INTO `oc_product_to_category` VALUES ('154', '140');
INSERT INTO `oc_product_to_category` VALUES ('155', '80');
INSERT INTO `oc_product_to_category` VALUES ('155', '141');
INSERT INTO `oc_product_to_category` VALUES ('156', '81');
INSERT INTO `oc_product_to_category` VALUES ('156', '142');
INSERT INTO `oc_product_to_category` VALUES ('157', '81');
INSERT INTO `oc_product_to_category` VALUES ('157', '142');
INSERT INTO `oc_product_to_category` VALUES ('158', '94');
INSERT INTO `oc_product_to_category` VALUES ('158', '143');

-- ----------------------------
-- Table structure for oc_product_to_download
-- ----------------------------
DROP TABLE IF EXISTS `oc_product_to_download`;
CREATE TABLE `oc_product_to_download` (
  `product_id` int(11) NOT NULL,
  `download_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_product_to_download
-- ----------------------------

-- ----------------------------
-- Table structure for oc_product_to_layout
-- ----------------------------
DROP TABLE IF EXISTS `oc_product_to_layout`;
CREATE TABLE `oc_product_to_layout` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_product_to_layout
-- ----------------------------
INSERT INTO `oc_product_to_layout` VALUES ('50', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('51', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('52', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('53', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('54', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('55', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('56', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('58', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('59', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('60', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('61', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('62', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('63', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('64', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('65', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('66', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('67', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('68', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('69', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('70', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('71', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('72', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('73', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('74', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('75', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('76', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('77', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('78', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('79', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('80', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('81', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('82', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('83', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('84', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('85', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('86', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('87', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('88', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('89', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('90', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('91', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('92', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('93', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('94', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('95', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('96', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('97', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('98', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('99', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('100', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('101', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('102', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('103', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('104', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('105', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('106', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('107', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('108', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('109', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('110', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('111', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('112', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('113', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('114', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('115', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('116', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('117', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('118', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('119', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('120', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('121', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('122', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('123', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('124', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('125', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('126', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('127', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('128', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('129', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('130', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('131', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('132', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('133', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('134', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('135', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('136', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('137', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('138', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('139', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('140', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('141', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('142', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('143', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('144', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('145', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('146', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('147', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('148', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('149', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('150', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('151', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('152', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('153', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('154', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('155', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('156', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('157', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('158', '0', '0');

-- ----------------------------
-- Table structure for oc_product_to_store
-- ----------------------------
DROP TABLE IF EXISTS `oc_product_to_store`;
CREATE TABLE `oc_product_to_store` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_product_to_store
-- ----------------------------
INSERT INTO `oc_product_to_store` VALUES ('50', '0');
INSERT INTO `oc_product_to_store` VALUES ('51', '0');
INSERT INTO `oc_product_to_store` VALUES ('52', '0');
INSERT INTO `oc_product_to_store` VALUES ('53', '0');
INSERT INTO `oc_product_to_store` VALUES ('54', '0');
INSERT INTO `oc_product_to_store` VALUES ('55', '0');
INSERT INTO `oc_product_to_store` VALUES ('56', '0');
INSERT INTO `oc_product_to_store` VALUES ('58', '0');
INSERT INTO `oc_product_to_store` VALUES ('59', '0');
INSERT INTO `oc_product_to_store` VALUES ('60', '0');
INSERT INTO `oc_product_to_store` VALUES ('61', '0');
INSERT INTO `oc_product_to_store` VALUES ('62', '0');
INSERT INTO `oc_product_to_store` VALUES ('63', '0');
INSERT INTO `oc_product_to_store` VALUES ('64', '0');
INSERT INTO `oc_product_to_store` VALUES ('65', '0');
INSERT INTO `oc_product_to_store` VALUES ('66', '0');
INSERT INTO `oc_product_to_store` VALUES ('67', '0');
INSERT INTO `oc_product_to_store` VALUES ('68', '0');
INSERT INTO `oc_product_to_store` VALUES ('69', '0');
INSERT INTO `oc_product_to_store` VALUES ('70', '0');
INSERT INTO `oc_product_to_store` VALUES ('71', '0');
INSERT INTO `oc_product_to_store` VALUES ('72', '0');
INSERT INTO `oc_product_to_store` VALUES ('73', '0');
INSERT INTO `oc_product_to_store` VALUES ('74', '0');
INSERT INTO `oc_product_to_store` VALUES ('75', '0');
INSERT INTO `oc_product_to_store` VALUES ('76', '0');
INSERT INTO `oc_product_to_store` VALUES ('77', '0');
INSERT INTO `oc_product_to_store` VALUES ('78', '0');
INSERT INTO `oc_product_to_store` VALUES ('79', '0');
INSERT INTO `oc_product_to_store` VALUES ('80', '0');
INSERT INTO `oc_product_to_store` VALUES ('81', '0');
INSERT INTO `oc_product_to_store` VALUES ('82', '0');
INSERT INTO `oc_product_to_store` VALUES ('83', '0');
INSERT INTO `oc_product_to_store` VALUES ('84', '0');
INSERT INTO `oc_product_to_store` VALUES ('85', '0');
INSERT INTO `oc_product_to_store` VALUES ('86', '0');
INSERT INTO `oc_product_to_store` VALUES ('87', '0');
INSERT INTO `oc_product_to_store` VALUES ('88', '0');
INSERT INTO `oc_product_to_store` VALUES ('89', '0');
INSERT INTO `oc_product_to_store` VALUES ('90', '0');
INSERT INTO `oc_product_to_store` VALUES ('91', '0');
INSERT INTO `oc_product_to_store` VALUES ('92', '0');
INSERT INTO `oc_product_to_store` VALUES ('93', '0');
INSERT INTO `oc_product_to_store` VALUES ('94', '0');
INSERT INTO `oc_product_to_store` VALUES ('95', '0');
INSERT INTO `oc_product_to_store` VALUES ('96', '0');
INSERT INTO `oc_product_to_store` VALUES ('97', '0');
INSERT INTO `oc_product_to_store` VALUES ('98', '0');
INSERT INTO `oc_product_to_store` VALUES ('99', '0');
INSERT INTO `oc_product_to_store` VALUES ('100', '0');
INSERT INTO `oc_product_to_store` VALUES ('101', '0');
INSERT INTO `oc_product_to_store` VALUES ('102', '0');
INSERT INTO `oc_product_to_store` VALUES ('103', '0');
INSERT INTO `oc_product_to_store` VALUES ('104', '0');
INSERT INTO `oc_product_to_store` VALUES ('105', '0');
INSERT INTO `oc_product_to_store` VALUES ('106', '0');
INSERT INTO `oc_product_to_store` VALUES ('107', '0');
INSERT INTO `oc_product_to_store` VALUES ('108', '0');
INSERT INTO `oc_product_to_store` VALUES ('109', '0');
INSERT INTO `oc_product_to_store` VALUES ('110', '0');
INSERT INTO `oc_product_to_store` VALUES ('111', '0');
INSERT INTO `oc_product_to_store` VALUES ('112', '0');
INSERT INTO `oc_product_to_store` VALUES ('113', '0');
INSERT INTO `oc_product_to_store` VALUES ('114', '0');
INSERT INTO `oc_product_to_store` VALUES ('115', '0');
INSERT INTO `oc_product_to_store` VALUES ('116', '0');
INSERT INTO `oc_product_to_store` VALUES ('117', '0');
INSERT INTO `oc_product_to_store` VALUES ('118', '0');
INSERT INTO `oc_product_to_store` VALUES ('119', '0');
INSERT INTO `oc_product_to_store` VALUES ('120', '0');
INSERT INTO `oc_product_to_store` VALUES ('121', '0');
INSERT INTO `oc_product_to_store` VALUES ('122', '0');
INSERT INTO `oc_product_to_store` VALUES ('123', '0');
INSERT INTO `oc_product_to_store` VALUES ('124', '0');
INSERT INTO `oc_product_to_store` VALUES ('125', '0');
INSERT INTO `oc_product_to_store` VALUES ('126', '0');
INSERT INTO `oc_product_to_store` VALUES ('127', '0');
INSERT INTO `oc_product_to_store` VALUES ('128', '0');
INSERT INTO `oc_product_to_store` VALUES ('129', '0');
INSERT INTO `oc_product_to_store` VALUES ('130', '0');
INSERT INTO `oc_product_to_store` VALUES ('131', '0');
INSERT INTO `oc_product_to_store` VALUES ('132', '0');
INSERT INTO `oc_product_to_store` VALUES ('133', '0');
INSERT INTO `oc_product_to_store` VALUES ('134', '0');
INSERT INTO `oc_product_to_store` VALUES ('135', '0');
INSERT INTO `oc_product_to_store` VALUES ('136', '0');
INSERT INTO `oc_product_to_store` VALUES ('137', '0');
INSERT INTO `oc_product_to_store` VALUES ('138', '0');
INSERT INTO `oc_product_to_store` VALUES ('139', '0');
INSERT INTO `oc_product_to_store` VALUES ('140', '0');
INSERT INTO `oc_product_to_store` VALUES ('141', '0');
INSERT INTO `oc_product_to_store` VALUES ('142', '0');
INSERT INTO `oc_product_to_store` VALUES ('143', '0');
INSERT INTO `oc_product_to_store` VALUES ('144', '0');
INSERT INTO `oc_product_to_store` VALUES ('145', '0');
INSERT INTO `oc_product_to_store` VALUES ('146', '0');
INSERT INTO `oc_product_to_store` VALUES ('147', '0');
INSERT INTO `oc_product_to_store` VALUES ('148', '0');
INSERT INTO `oc_product_to_store` VALUES ('149', '0');
INSERT INTO `oc_product_to_store` VALUES ('150', '0');
INSERT INTO `oc_product_to_store` VALUES ('151', '0');
INSERT INTO `oc_product_to_store` VALUES ('152', '0');
INSERT INTO `oc_product_to_store` VALUES ('153', '0');
INSERT INTO `oc_product_to_store` VALUES ('154', '0');
INSERT INTO `oc_product_to_store` VALUES ('155', '0');
INSERT INTO `oc_product_to_store` VALUES ('156', '0');
INSERT INTO `oc_product_to_store` VALUES ('157', '0');
INSERT INTO `oc_product_to_store` VALUES ('158', '0');

-- ----------------------------
-- Table structure for oc_recurring
-- ----------------------------
DROP TABLE IF EXISTS `oc_recurring`;
CREATE TABLE `oc_recurring` (
  `recurring_id` int(11) NOT NULL AUTO_INCREMENT,
  `price` decimal(10,4) NOT NULL,
  `frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `duration` int(10) unsigned NOT NULL,
  `cycle` int(10) unsigned NOT NULL,
  `trial_status` tinyint(4) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `trial_frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `trial_duration` int(10) unsigned NOT NULL,
  `trial_cycle` int(10) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL,
  `sort_order` int(11) NOT NULL,
  PRIMARY KEY (`recurring_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_recurring
-- ----------------------------

-- ----------------------------
-- Table structure for oc_recurring_description
-- ----------------------------
DROP TABLE IF EXISTS `oc_recurring_description`;
CREATE TABLE `oc_recurring_description` (
  `recurring_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`recurring_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_recurring_description
-- ----------------------------

-- ----------------------------
-- Table structure for oc_return
-- ----------------------------
DROP TABLE IF EXISTS `oc_return`;
CREATE TABLE `oc_return` (
  `return_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `product` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `opened` tinyint(1) NOT NULL,
  `return_reason_id` int(11) NOT NULL,
  `return_action_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `comment` text,
  `date_ordered` date NOT NULL DEFAULT '0000-00-00',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`return_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_return
-- ----------------------------
INSERT INTO `oc_return` VALUES ('1', '3', '0', '0', 'выавыавы', 'выавыавыа', 'aostavnenko.ao@gmail.com', '213424', 'ывавыа', 'вывыа', '0', '1', '5', '0', '2', 'ывавыа', '2015-11-03', '2015-11-04 16:49:36', '2015-11-04 16:49:36');

-- ----------------------------
-- Table structure for oc_return_action
-- ----------------------------
DROP TABLE IF EXISTS `oc_return_action`;
CREATE TABLE `oc_return_action` (
  `return_action_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`return_action_id`,`language_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_return_action
-- ----------------------------
INSERT INTO `oc_return_action` VALUES ('1', '1', 'Возвращены средства');
INSERT INTO `oc_return_action` VALUES ('2', '1', 'Выдан в кредит');
INSERT INTO `oc_return_action` VALUES ('3', '1', 'Отправлен другой товар для замены');

-- ----------------------------
-- Table structure for oc_return_history
-- ----------------------------
DROP TABLE IF EXISTS `oc_return_history`;
CREATE TABLE `oc_return_history` (
  `return_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `return_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`return_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_return_history
-- ----------------------------

-- ----------------------------
-- Table structure for oc_return_reason
-- ----------------------------
DROP TABLE IF EXISTS `oc_return_reason`;
CREATE TABLE `oc_return_reason` (
  `return_reason_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`return_reason_id`,`language_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_return_reason
-- ----------------------------
INSERT INTO `oc_return_reason` VALUES ('1', '1', 'Получен/доставлен неисправным (сломан)');
INSERT INTO `oc_return_reason` VALUES ('2', '1', 'Получен не тот (ошибочный) товар');
INSERT INTO `oc_return_reason` VALUES ('4', '1', 'Ошибка, пожалуйста укажите/приложите подробности');
INSERT INTO `oc_return_reason` VALUES ('5', '1', 'Другое (другая причина), пожалуйста укажите/приложите подробности');

-- ----------------------------
-- Table structure for oc_return_status
-- ----------------------------
DROP TABLE IF EXISTS `oc_return_status`;
CREATE TABLE `oc_return_status` (
  `return_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`return_status_id`,`language_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_return_status
-- ----------------------------
INSERT INTO `oc_return_status` VALUES ('1', '1', 'Рассматриваемый');
INSERT INTO `oc_return_status` VALUES ('3', '1', 'Готов (к отправке)');
INSERT INTO `oc_return_status` VALUES ('2', '1', 'Заказ в ожидании');

-- ----------------------------
-- Table structure for oc_review
-- ----------------------------
DROP TABLE IF EXISTS `oc_review`;
CREATE TABLE `oc_review` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `author` varchar(64) NOT NULL,
  `text` text NOT NULL,
  `rating` int(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`review_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_review
-- ----------------------------

-- ----------------------------
-- Table structure for oc_setting
-- ----------------------------
DROP TABLE IF EXISTS `oc_setting`;
CREATE TABLE `oc_setting` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `code` varchar(32) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  `serialized` tinyint(1) NOT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=MyISAM AUTO_INCREMENT=522 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_setting
-- ----------------------------
INSERT INTO `oc_setting` VALUES ('1', '0', 'shipping', 'shipping_sort_order', '3', '0');
INSERT INTO `oc_setting` VALUES ('2', '0', 'sub_total', 'sub_total_sort_order', '1', '0');
INSERT INTO `oc_setting` VALUES ('3', '0', 'sub_total', 'sub_total_status', '1', '0');
INSERT INTO `oc_setting` VALUES ('5', '0', 'total', 'total_sort_order', '9', '0');
INSERT INTO `oc_setting` VALUES ('6', '0', 'total', 'total_status', '1', '0');
INSERT INTO `oc_setting` VALUES ('8', '0', 'free_checkout', 'free_checkout_sort_order', '1', '0');
INSERT INTO `oc_setting` VALUES ('9', '0', 'cod', 'cod_sort_order', '5', '0');
INSERT INTO `oc_setting` VALUES ('10', '0', 'cod', 'cod_total', '0.01', '0');
INSERT INTO `oc_setting` VALUES ('11', '0', 'cod', 'cod_order_status_id', '1', '0');
INSERT INTO `oc_setting` VALUES ('12', '0', 'cod', 'cod_geo_zone_id', '0', '0');
INSERT INTO `oc_setting` VALUES ('13', '0', 'cod', 'cod_status', '1', '0');
INSERT INTO `oc_setting` VALUES ('14', '0', 'shipping', 'shipping_status', '1', '0');
INSERT INTO `oc_setting` VALUES ('15', '0', 'shipping', 'shipping_estimator', '1', '0');
INSERT INTO `oc_setting` VALUES ('27', '0', 'coupon', 'coupon_sort_order', '4', '0');
INSERT INTO `oc_setting` VALUES ('28', '0', 'coupon', 'coupon_status', '1', '0');
INSERT INTO `oc_setting` VALUES ('34', '0', 'flat', 'flat_sort_order', '1', '0');
INSERT INTO `oc_setting` VALUES ('35', '0', 'flat', 'flat_status', '1', '0');
INSERT INTO `oc_setting` VALUES ('36', '0', 'flat', 'flat_geo_zone_id', '0', '0');
INSERT INTO `oc_setting` VALUES ('37', '0', 'flat', 'flat_tax_class_id', '0', '0');
INSERT INTO `oc_setting` VALUES ('41', '0', 'flat', 'flat_cost', '5.00', '0');
INSERT INTO `oc_setting` VALUES ('42', '0', 'credit', 'credit_sort_order', '7', '0');
INSERT INTO `oc_setting` VALUES ('43', '0', 'credit', 'credit_status', '1', '0');
INSERT INTO `oc_setting` VALUES ('53', '0', 'reward', 'reward_sort_order', '2', '0');
INSERT INTO `oc_setting` VALUES ('54', '0', 'reward', 'reward_status', '1', '0');
INSERT INTO `oc_setting` VALUES ('146', '0', 'category', 'category_status', '1', '0');
INSERT INTO `oc_setting` VALUES ('158', '0', 'account', 'account_status', '1', '0');
INSERT INTO `oc_setting` VALUES ('159', '0', 'affiliate', 'affiliate_status', '1', '0');
INSERT INTO `oc_setting` VALUES ('511', '0', 'config', 'config_compression', '0', '0');
INSERT INTO `oc_setting` VALUES ('512', '0', 'config', 'config_secure', '0', '0');
INSERT INTO `oc_setting` VALUES ('513', '0', 'config', 'config_password', '1', '0');
INSERT INTO `oc_setting` VALUES ('514', '0', 'config', 'config_shared', '0', '0');
INSERT INTO `oc_setting` VALUES ('515', '0', 'config', 'config_encryption', 'qDW7LfHsGG1zSIJprzxks58OsjtJrqWzDcRYMXGycvQjmJi51OWkwpEf1Ugcd90uGz4OmJ47NkvlecOdPlXo80aXIzQTLgLrH3748pq33RtTDdsQKcKGOXxNeHF4TNTOS0a8ncYhUGS4llXlpQNQKgcYnJ2Vo5OTF4mvT24nbvzr9Z6dxscGdONHKpYjHudIwmFTNN1iaO10LKdsyaeipht16mcLEymQzG17Pnc5RRpUzf9mRTi5UF64tVbUnzq0kPPw6tIQlgpfngHTlfUOi3GKgmtVOR26TyNCnZnEAb4XbxZ9XYlCUPcIaWnS1wxJzXWMtPrIprWFtp8J2T1I26JeVHhNZkzHkINUNcSBBgbippnz73L34VoP0DX3KRHJXnsvTrBLPczR51NoEQZuoDCfg2k9scOO4dInxEa5w8NHmzNZwR0WQhyLywbBBz2pOfnRALljkKK8eXtJXRoIEPKuD8y9x5VmGgzkmnKhSwwTYYeND24PKeIztrukv5mgzCYfTPpuuWCRtlE9IFbC27LyWNeS0o6DyEvXLYwWrQ2RtuC2VTiQjQbk5DJ9BLrqZr7eg4pSmHef58pJ8M4vsyaBd0aXRn20waPMZJYcanGXDsELDWIn5jYVw5exIuAGKB8pEwg5azhUyppLrZmwEigurFGyCseYzh280gxgo78H7KG99w9ZYoBQ4Ydc2D4o89mpTl86fThhYp3rD8CjkD3eHBqeoD0LW536zG9R2i1YxAmM84ej2ljX9yFbaDsgRNLhjYENz3kAHqijpk1usiznwBctocanehQEbaBBubDOYKZwXUKvMeNYP1YZcQRKxPVeuS8MtUYhdmzwpWmmIjhjoK9f5R47mYcLhUN5pmPj0p6p9WqxVCuKJ5p3BwTXqBzbYHipTsQIjNKtrZcKKC9vVxt2w8a1UnCqgDq08TDdmAbVzEKgy9cOcWkQ7yGC5RMEHkYjuhWnR1fxjgqcOzrDsvtJtxmrYqQoQGFe3vt6J4BkvtxtXWVBSjdrWHW8', '0');
INSERT INTO `oc_setting` VALUES ('516', '0', 'config', 'config_file_max_size', '300000', '0');
INSERT INTO `oc_setting` VALUES ('517', '0', 'config', 'config_file_ext_allowed', 'zip\r\ntxt\r\npng\r\njpe\r\njpeg\r\njpg\r\ngif\r\nbmp\r\nico\r\ntiff\r\ntif\r\nsvg\r\nsvgz\r\nzip\r\nrar\r\nmsi\r\ncab\r\nmp3\r\nqt\r\nmov\r\npdf\r\npsd\r\nai\r\neps\r\nps\r\ndoc', '0');
INSERT INTO `oc_setting` VALUES ('94', '0', 'voucher', 'voucher_sort_order', '8', '0');
INSERT INTO `oc_setting` VALUES ('95', '0', 'voucher', 'voucher_status', '1', '0');
INSERT INTO `oc_setting` VALUES ('103', '0', 'free_checkout', 'free_checkout_status', '1', '0');
INSERT INTO `oc_setting` VALUES ('104', '0', 'free_checkout', 'free_checkout_order_status_id', '1', '0');
INSERT INTO `oc_setting` VALUES ('518', '0', 'config', 'config_file_mime_allowed', 'text/plain\r\nimage/png\r\nimage/jpeg\r\nimage/gif\r\nimage/bmp\r\nimage/tiff\r\nimage/svg+xml\r\napplication/zip\r\n&quot;application/zip&quot;\r\napplication/x-zip\r\n&quot;application/x-zip&quot;\r\napplication/x-zip-compressed\r\n&quot;application/x-zip-compressed&quot;\r\napplication/rar\r\n&quot;application/rar&quot;\r\napplication/x-rar\r\n&quot;application/x-rar&quot;\r\napplication/x-rar-compressed\r\n&quot;application/x-rar-compressed&quot;\r\napplication/octet-stream\r\n&quot;application/octet-stream&quot;\r\naudio/mpeg\r\nvideo/quicktime\r\napplication/pdf', '0');
INSERT INTO `oc_setting` VALUES ('510', '0', 'config', 'config_robots', 'abot\r\ndbot\r\nebot\r\nhbot\r\nkbot\r\nlbot\r\nmbot\r\nnbot\r\nobot\r\npbot\r\nrbot\r\nsbot\r\ntbot\r\nvbot\r\nybot\r\nzbot\r\nbot.\r\nbot/\r\n_bot\r\n.bot\r\n/bot\r\n-bot\r\n:bot\r\n(bot\r\ncrawl\r\nslurp\r\nspider\r\nseek\r\naccoona\r\nacoon\r\nadressendeutschland\r\nah-ha.com\r\nahoy\r\naltavista\r\nananzi\r\nanthill\r\nappie\r\narachnophilia\r\narale\r\naraneo\r\naranha\r\narchitext\r\naretha\r\narks\r\nasterias\r\natlocal\r\natn\r\natomz\r\naugurfind\r\nbackrub\r\nbannana_bot\r\nbaypup\r\nbdfetch\r\nbig brother\r\nbiglotron\r\nbjaaland\r\nblackwidow\r\nblaiz\r\nblog\r\nblo.\r\nbloodhound\r\nboitho\r\nbooch\r\nbradley\r\nbutterfly\r\ncalif\r\ncassandra\r\nccubee\r\ncfetch\r\ncharlotte\r\nchurl\r\ncienciaficcion\r\ncmc\r\ncollective\r\ncomagent\r\ncombine\r\ncomputingsite\r\ncsci\r\ncurl\r\ncusco\r\ndaumoa\r\ndeepindex\r\ndelorie\r\ndepspid\r\ndeweb\r\ndie blinde kuh\r\ndigger\r\nditto\r\ndmoz\r\ndocomo\r\ndownload express\r\ndtaagent\r\ndwcp\r\nebiness\r\nebingbong\r\ne-collector\r\nejupiter\r\nemacs-w3 search engine\r\nesther\r\nevliya celebi\r\nezresult\r\nfalcon\r\nfelix ide\r\nferret\r\nfetchrover\r\nfido\r\nfindlinks\r\nfireball\r\nfish search\r\nfouineur\r\nfunnelweb\r\ngazz\r\ngcreep\r\ngenieknows\r\ngetterroboplus\r\ngeturl\r\nglx\r\ngoforit\r\ngolem\r\ngrabber\r\ngrapnel\r\ngralon\r\ngriffon\r\ngromit\r\ngrub\r\ngulliver\r\nhamahakki\r\nharvest\r\nhavindex\r\nhelix\r\nheritrix\r\nhku www octopus\r\nhomerweb\r\nhtdig\r\nhtml index\r\nhtml_analyzer\r\nhtmlgobble\r\nhubater\r\nhyper-decontextualizer\r\nia_archiver\r\nibm_planetwide\r\nichiro\r\niconsurf\r\niltrovatore\r\nimage.kapsi.net\r\nimagelock\r\nincywincy\r\nindexer\r\ninfobee\r\ninformant\r\ningrid\r\ninktomisearch.com\r\ninspector web\r\nintelliagent\r\ninternet shinchakubin\r\nip3000\r\niron33\r\nisraeli-search\r\nivia\r\njack\r\njakarta\r\njavabee\r\njetbot\r\njumpstation\r\nkatipo\r\nkdd-explorer\r\nkilroy\r\nknowledge\r\nkototoi\r\nkretrieve\r\nlabelgrabber\r\nlachesis\r\nlarbin\r\nlegs\r\nlibwww\r\nlinkalarm\r\nlink validator\r\nlinkscan\r\nlockon\r\nlwp\r\nlycos\r\nmagpie\r\nmantraagent\r\nmapoftheinternet\r\nmarvin/\r\nmattie\r\nmediafox\r\nmediapartners\r\nmercator\r\nmerzscope\r\nmicrosoft url control\r\nminirank\r\nmiva\r\nmj12\r\nmnogosearch\r\nmoget\r\nmonster\r\nmoose\r\nmotor\r\nmultitext\r\nmuncher\r\nmuscatferret\r\nmwd.search\r\nmyweb\r\nnajdi\r\nnameprotect\r\nnationaldirectory\r\nnazilla\r\nncsa beta\r\nnec-meshexplorer\r\nnederland.zoek\r\nnetcarta webmap engine\r\nnetmechanic\r\nnetresearchserver\r\nnetscoop\r\nnewscan-online\r\nnhse\r\nnokia6682/\r\nnomad\r\nnoyona\r\nnutch\r\nnzexplorer\r\nobjectssearch\r\noccam\r\nomni\r\nopen text\r\nopenfind\r\nopenintelligencedata\r\norb search\r\nosis-project\r\npack rat\r\npageboy\r\npagebull\r\npage_verifier\r\npanscient\r\nparasite\r\npartnersite\r\npatric\r\npear.\r\npegasus\r\nperegrinator\r\npgp key agent\r\nphantom\r\nphpdig\r\npicosearch\r\npiltdownman\r\npimptrain\r\npinpoint\r\npioneer\r\npiranha\r\nplumtreewebaccessor\r\npogodak\r\npoirot\r\npompos\r\npoppelsdorf\r\npoppi\r\npopular iconoclast\r\npsycheclone\r\npublisher\r\npython\r\nrambler\r\nraven search\r\nroach\r\nroad runner\r\nroadhouse\r\nrobbie\r\nrobofox\r\nrobozilla\r\nrules\r\nsalty\r\nsbider\r\nscooter\r\nscoutjet\r\nscrubby\r\nsearch.\r\nsearchprocess\r\nsemanticdiscovery\r\nsenrigan\r\nsg-scout\r\nshai\'hulud\r\nshark\r\nshopwiki\r\nsidewinder\r\nsift\r\nsilk\r\nsimmany\r\nsite searcher\r\nsite valet\r\nsitetech-rover\r\nskymob.com\r\nsleek\r\nsmartwit\r\nsna-\r\nsnappy\r\nsnooper\r\nsohu\r\nspeedfind\r\nsphere\r\nsphider\r\nspinner\r\nspyder\r\nsteeler/\r\nsuke\r\nsuntek\r\nsupersnooper\r\nsurfnomore\r\nsven\r\nsygol\r\nszukacz\r\ntach black widow\r\ntarantula\r\ntempleton\r\n/teoma\r\nt-h-u-n-d-e-r-s-t-o-n-e\r\ntheophrastus\r\ntitan\r\ntitin\r\ntkwww\r\ntoutatis\r\nt-rex\r\ntutorgig\r\ntwiceler\r\ntwisted\r\nucsd\r\nudmsearch\r\nurl check\r\nupdated\r\nvagabondo\r\nvalkyrie\r\nverticrawl\r\nvictoria\r\nvision-search\r\nvolcano\r\nvoyager/\r\nvoyager-hc\r\nw3c_validator\r\nw3m2\r\nw3mir\r\nwalker\r\nwallpaper\r\nwanderer\r\nwauuu\r\nwavefire\r\nweb core\r\nweb hopper\r\nweb wombat\r\nwebbandit\r\nwebcatcher\r\nwebcopy\r\nwebfoot\r\nweblayers\r\nweblinker\r\nweblog monitor\r\nwebmirror\r\nwebmonkey\r\nwebquest\r\nwebreaper\r\nwebsitepulse\r\nwebsnarf\r\nwebstolperer\r\nwebvac\r\nwebwalk\r\nwebwatch\r\nwebwombat\r\nwebzinger\r\nwhizbang\r\nwhowhere\r\nwild ferret\r\nworldlight\r\nwwwc\r\nwwwster\r\nxenu\r\nxget\r\nxift\r\nxirq\r\nyandex\r\nyanga\r\nyeti\r\nyodao\r\nzao\r\nzippp\r\nzyborg', '0');
INSERT INTO `oc_setting` VALUES ('509', '0', 'config', 'config_seo_url', '0', '0');
INSERT INTO `oc_setting` VALUES ('507', '0', 'config', 'config_mail_alert', '', '0');
INSERT INTO `oc_setting` VALUES ('508', '0', 'config', 'config_maintenance', '0', '0');
INSERT INTO `oc_setting` VALUES ('506', '0', 'config', 'config_mail_smtp_timeout', '5', '0');
INSERT INTO `oc_setting` VALUES ('505', '0', 'config', 'config_mail_smtp_port', '25', '0');
INSERT INTO `oc_setting` VALUES ('504', '0', 'config', 'config_mail_smtp_password', '', '0');
INSERT INTO `oc_setting` VALUES ('503', '0', 'config', 'config_mail_smtp_username', '', '0');
INSERT INTO `oc_setting` VALUES ('502', '0', 'config', 'config_mail_smtp_hostname', '', '0');
INSERT INTO `oc_setting` VALUES ('501', '0', 'config', 'config_mail_parameter', '', '0');
INSERT INTO `oc_setting` VALUES ('500', '0', 'config', 'config_mail_protocol', 'mail', '0');
INSERT INTO `oc_setting` VALUES ('499', '0', 'config', 'config_ftp_status', '0', '0');
INSERT INTO `oc_setting` VALUES ('498', '0', 'config', 'config_ftp_root', '', '0');
INSERT INTO `oc_setting` VALUES ('496', '0', 'config', 'config_ftp_username', '', '0');
INSERT INTO `oc_setting` VALUES ('497', '0', 'config', 'config_ftp_password', '', '0');
INSERT INTO `oc_setting` VALUES ('495', '0', 'config', 'config_ftp_port', '21', '0');
INSERT INTO `oc_setting` VALUES ('494', '0', 'config', 'config_ftp_hostname', 'shop', '0');
INSERT INTO `oc_setting` VALUES ('493', '0', 'config', 'config_image_location_height', '50', '0');
INSERT INTO `oc_setting` VALUES ('492', '0', 'config', 'config_image_location_width', '268', '0');
INSERT INTO `oc_setting` VALUES ('491', '0', 'config', 'config_image_cart_height', '47', '0');
INSERT INTO `oc_setting` VALUES ('490', '0', 'config', 'config_image_cart_width', '47', '0');
INSERT INTO `oc_setting` VALUES ('489', '0', 'config', 'config_image_wishlist_height', '47', '0');
INSERT INTO `oc_setting` VALUES ('488', '0', 'config', 'config_image_wishlist_width', '47', '0');
INSERT INTO `oc_setting` VALUES ('487', '0', 'config', 'config_image_compare_height', '90', '0');
INSERT INTO `oc_setting` VALUES ('486', '0', 'config', 'config_image_compare_width', '90', '0');
INSERT INTO `oc_setting` VALUES ('485', '0', 'config', 'config_image_related_height', '80', '0');
INSERT INTO `oc_setting` VALUES ('484', '0', 'config', 'config_image_related_width', '80', '0');
INSERT INTO `oc_setting` VALUES ('483', '0', 'config', 'config_image_additional_height', '74', '0');
INSERT INTO `oc_setting` VALUES ('482', '0', 'config', 'config_image_additional_width', '74', '0');
INSERT INTO `oc_setting` VALUES ('480', '0', 'config', 'config_image_product_width', '228', '0');
INSERT INTO `oc_setting` VALUES ('481', '0', 'config', 'config_image_product_height', '228', '0');
INSERT INTO `oc_setting` VALUES ('479', '0', 'config', 'config_image_popup_height', '500', '0');
INSERT INTO `oc_setting` VALUES ('478', '0', 'config', 'config_image_popup_width', '500', '0');
INSERT INTO `oc_setting` VALUES ('477', '0', 'config', 'config_image_thumb_height', '228', '0');
INSERT INTO `oc_setting` VALUES ('476', '0', 'config', 'config_image_thumb_width', '228', '0');
INSERT INTO `oc_setting` VALUES ('475', '0', 'config', 'config_image_category_height', '80', '0');
INSERT INTO `oc_setting` VALUES ('474', '0', 'config', 'config_image_category_width', '80', '0');
INSERT INTO `oc_setting` VALUES ('473', '0', 'config', 'config_icon', 'catalog/cart.png', '0');
INSERT INTO `oc_setting` VALUES ('472', '0', 'config', 'config_logo', 'catalog/aroma.png', '0');
INSERT INTO `oc_setting` VALUES ('471', '0', 'config', 'config_captcha_page', '[\"review\",\"return\",\"contact\"]', '1');
INSERT INTO `oc_setting` VALUES ('470', '0', 'config', 'config_captcha', '', '0');
INSERT INTO `oc_setting` VALUES ('469', '0', 'config', 'config_return_status_id', '2', '0');
INSERT INTO `oc_setting` VALUES ('468', '0', 'config', 'config_return_id', '0', '0');
INSERT INTO `oc_setting` VALUES ('467', '0', 'config', 'config_affiliate_mail', '0', '0');
INSERT INTO `oc_setting` VALUES ('466', '0', 'config', 'config_affiliate_id', '4', '0');
INSERT INTO `oc_setting` VALUES ('465', '0', 'config', 'config_affiliate_commission', '5', '0');
INSERT INTO `oc_setting` VALUES ('464', '0', 'config', 'config_affiliate_auto', '0', '0');
INSERT INTO `oc_setting` VALUES ('463', '0', 'config', 'config_affiliate_approval', '0', '0');
INSERT INTO `oc_setting` VALUES ('462', '0', 'config', 'config_stock_checkout', '0', '0');
INSERT INTO `oc_setting` VALUES ('461', '0', 'config', 'config_stock_warning', '0', '0');
INSERT INTO `oc_setting` VALUES ('460', '0', 'config', 'config_stock_display', '0', '0');
INSERT INTO `oc_setting` VALUES ('459', '0', 'config', 'config_api_id', '1', '0');
INSERT INTO `oc_setting` VALUES ('458', '0', 'config', 'config_order_mail', '1', '0');
INSERT INTO `oc_setting` VALUES ('457', '0', 'config', 'config_fraud_status_id', '2', '0');
INSERT INTO `oc_setting` VALUES ('456', '0', 'config', 'config_complete_status', '[\"3\",\"5\"]', '1');
INSERT INTO `oc_setting` VALUES ('455', '0', 'config', 'config_processing_status', '[\"2\",\"3\",\"1\",\"12\",\"5\"]', '1');
INSERT INTO `oc_setting` VALUES ('454', '0', 'config', 'config_order_status_id', '1', '0');
INSERT INTO `oc_setting` VALUES ('452', '0', 'config', 'config_checkout_guest', '1', '0');
INSERT INTO `oc_setting` VALUES ('453', '0', 'config', 'config_checkout_id', '0', '0');
INSERT INTO `oc_setting` VALUES ('450', '0', 'config', 'config_invoice_prefix', 'INV-2015-00', '0');
INSERT INTO `oc_setting` VALUES ('451', '0', 'config', 'config_cart_weight', '0', '0');
INSERT INTO `oc_setting` VALUES ('449', '0', 'config', 'config_account_mail', '0', '0');
INSERT INTO `oc_setting` VALUES ('448', '0', 'config', 'config_account_id', '3', '0');
INSERT INTO `oc_setting` VALUES ('447', '0', 'config', 'config_login_attempts', '5', '0');
INSERT INTO `oc_setting` VALUES ('446', '0', 'config', 'config_customer_price', '0', '0');
INSERT INTO `oc_setting` VALUES ('445', '0', 'config', 'config_customer_group_display', '[\"1\"]', '1');
INSERT INTO `oc_setting` VALUES ('444', '0', 'config', 'config_customer_group_id', '1', '0');
INSERT INTO `oc_setting` VALUES ('443', '0', 'config', 'config_customer_online', '0', '0');
INSERT INTO `oc_setting` VALUES ('442', '0', 'config', 'config_tax_customer', 'shipping', '0');
INSERT INTO `oc_setting` VALUES ('441', '0', 'config', 'config_tax_default', 'shipping', '0');
INSERT INTO `oc_setting` VALUES ('440', '0', 'config', 'config_tax', '0', '0');
INSERT INTO `oc_setting` VALUES ('439', '0', 'config', 'config_voucher_max', '1000', '0');
INSERT INTO `oc_setting` VALUES ('438', '0', 'config', 'config_voucher_min', '1', '0');
INSERT INTO `oc_setting` VALUES ('437', '0', 'config', 'config_review_mail', '1', '0');
INSERT INTO `oc_setting` VALUES ('422', '0', 'config', 'config_comment', '', '0');
INSERT INTO `oc_setting` VALUES ('423', '0', 'config', 'config_country_id', '220', '0');
INSERT INTO `oc_setting` VALUES ('424', '0', 'config', 'config_zone_id', '142', '0');
INSERT INTO `oc_setting` VALUES ('425', '0', 'config', 'config_language', 'ru', '0');
INSERT INTO `oc_setting` VALUES ('426', '0', 'config', 'config_admin_language', 'ru', '0');
INSERT INTO `oc_setting` VALUES ('427', '0', 'config', 'config_currency', 'UAH', '0');
INSERT INTO `oc_setting` VALUES ('428', '0', 'config', 'config_currency_auto', '1', '0');
INSERT INTO `oc_setting` VALUES ('429', '0', 'config', 'config_length_class_id', '1', '0');
INSERT INTO `oc_setting` VALUES ('430', '0', 'config', 'config_weight_class_id', '1', '0');
INSERT INTO `oc_setting` VALUES ('431', '0', 'config', 'config_product_count', '1', '0');
INSERT INTO `oc_setting` VALUES ('432', '0', 'config', 'config_product_limit', '20', '0');
INSERT INTO `oc_setting` VALUES ('433', '0', 'config', 'config_product_description_length', '100', '0');
INSERT INTO `oc_setting` VALUES ('434', '0', 'config', 'config_limit_admin', '20', '0');
INSERT INTO `oc_setting` VALUES ('435', '0', 'config', 'config_review_status', '1', '0');
INSERT INTO `oc_setting` VALUES ('436', '0', 'config', 'config_review_guest', '1', '0');
INSERT INTO `oc_setting` VALUES ('421', '0', 'config', 'config_open', '24/7', '0');
INSERT INTO `oc_setting` VALUES ('418', '0', 'config', 'config_telephone', '495 999-99-99', '0');
INSERT INTO `oc_setting` VALUES ('419', '0', 'config', 'config_fax', '495 888-88-88', '0');
INSERT INTO `oc_setting` VALUES ('420', '0', 'config', 'config_image', '', '0');
INSERT INTO `oc_setting` VALUES ('410', '0', 'config', 'config_meta_keyword', 'духи, парфюм, аромааура, aromaaura', '0');
INSERT INTO `oc_setting` VALUES ('411', '0', 'config', 'config_template', 'default', '0');
INSERT INTO `oc_setting` VALUES ('412', '0', 'config', 'config_layout_id', '4', '0');
INSERT INTO `oc_setting` VALUES ('413', '0', 'config', 'config_name', 'AromaAura', '0');
INSERT INTO `oc_setting` VALUES ('414', '0', 'config', 'config_owner', 'ellizard', '0');
INSERT INTO `oc_setting` VALUES ('415', '0', 'config', 'config_address', 'Internet', '0');
INSERT INTO `oc_setting` VALUES ('416', '0', 'config', 'config_geocode', '', '0');
INSERT INTO `oc_setting` VALUES ('417', '0', 'config', 'config_email', 'aostavnenko.ao@gmail.com', '0');
INSERT INTO `oc_setting` VALUES ('409', '0', 'config', 'config_meta_description', 'AromaAura \'Интернет магазин духов и парфюма\'', '0');
INSERT INTO `oc_setting` VALUES ('408', '0', 'config', 'config_meta_title', 'AromaAura', '0');
INSERT INTO `oc_setting` VALUES ('519', '0', 'config', 'config_error_display', '1', '0');
INSERT INTO `oc_setting` VALUES ('520', '0', 'config', 'config_error_log', '1', '0');
INSERT INTO `oc_setting` VALUES ('521', '0', 'config', 'config_error_filename', 'error.log', '0');

-- ----------------------------
-- Table structure for oc_stock_status
-- ----------------------------
DROP TABLE IF EXISTS `oc_stock_status`;
CREATE TABLE `oc_stock_status` (
  `stock_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`stock_status_id`,`language_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_stock_status
-- ----------------------------
INSERT INTO `oc_stock_status` VALUES ('7', '1', 'В наличии');
INSERT INTO `oc_stock_status` VALUES ('8', '1', 'Предзаказ');
INSERT INTO `oc_stock_status` VALUES ('5', '1', 'Нет в наличии');
INSERT INTO `oc_stock_status` VALUES ('6', '1', 'Ожидание 2-3 дня');

-- ----------------------------
-- Table structure for oc_store
-- ----------------------------
DROP TABLE IF EXISTS `oc_store`;
CREATE TABLE `oc_store` (
  `store_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `url` varchar(255) NOT NULL,
  `ssl` varchar(255) NOT NULL,
  PRIMARY KEY (`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_store
-- ----------------------------

-- ----------------------------
-- Table structure for oc_tax_class
-- ----------------------------
DROP TABLE IF EXISTS `oc_tax_class`;
CREATE TABLE `oc_tax_class` (
  `tax_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`tax_class_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_tax_class
-- ----------------------------
INSERT INTO `oc_tax_class` VALUES ('9', 'Налоги', 'Облагаемые налогом', '2014-06-06 23:00:00', '2014-09-09 11:50:31');

-- ----------------------------
-- Table structure for oc_tax_rate
-- ----------------------------
DROP TABLE IF EXISTS `oc_tax_rate`;
CREATE TABLE `oc_tax_rate` (
  `tax_rate_id` int(11) NOT NULL AUTO_INCREMENT,
  `geo_zone_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  `rate` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `type` char(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`tax_rate_id`)
) ENGINE=MyISAM AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_tax_rate
-- ----------------------------
INSERT INTO `oc_tax_rate` VALUES ('87', '3', 'НДС', '18.0000', 'F', '2011-09-21 21:49:23', '2014-09-09 11:49:32');

-- ----------------------------
-- Table structure for oc_tax_rate_to_customer_group
-- ----------------------------
DROP TABLE IF EXISTS `oc_tax_rate_to_customer_group`;
CREATE TABLE `oc_tax_rate_to_customer_group` (
  `tax_rate_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`tax_rate_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_tax_rate_to_customer_group
-- ----------------------------
INSERT INTO `oc_tax_rate_to_customer_group` VALUES ('86', '1');
INSERT INTO `oc_tax_rate_to_customer_group` VALUES ('87', '1');

-- ----------------------------
-- Table structure for oc_tax_rule
-- ----------------------------
DROP TABLE IF EXISTS `oc_tax_rule`;
CREATE TABLE `oc_tax_rule` (
  `tax_rule_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_class_id` int(11) NOT NULL,
  `tax_rate_id` int(11) NOT NULL,
  `based` varchar(10) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  PRIMARY KEY (`tax_rule_id`)
) ENGINE=MyISAM AUTO_INCREMENT=129 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_tax_rule
-- ----------------------------
INSERT INTO `oc_tax_rule` VALUES ('121', '10', '86', 'payment', '1');
INSERT INTO `oc_tax_rule` VALUES ('120', '10', '87', 'store', '0');
INSERT INTO `oc_tax_rule` VALUES ('128', '9', '86', 'shipping', '1');
INSERT INTO `oc_tax_rule` VALUES ('127', '9', '87', 'shipping', '2');

-- ----------------------------
-- Table structure for oc_upload
-- ----------------------------
DROP TABLE IF EXISTS `oc_upload`;
CREATE TABLE `oc_upload` (
  `upload_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`upload_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_upload
-- ----------------------------

-- ----------------------------
-- Table structure for oc_url_alias
-- ----------------------------
DROP TABLE IF EXISTS `oc_url_alias`;
CREATE TABLE `oc_url_alias` (
  `url_alias_id` int(11) NOT NULL AUTO_INCREMENT,
  `query` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`url_alias_id`),
  KEY `query` (`query`),
  KEY `keyword` (`keyword`)
) ENGINE=MyISAM AUTO_INCREMENT=1125 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_url_alias
-- ----------------------------
INSERT INTO `oc_url_alias` VALUES ('901', 'manufacturer_id=24', 'guerlain');
INSERT INTO `oc_url_alias` VALUES ('902', 'manufacturer_id=25', 'hugo-boss');
INSERT INTO `oc_url_alias` VALUES ('894', 'manufacturer_id=13', 'bvlgari');
INSERT INTO `oc_url_alias` VALUES ('1123', 'information_id=4', 'about_us');
INSERT INTO `oc_url_alias` VALUES ('905', 'manufacturer_id=28', 'paco-rabanne');
INSERT INTO `oc_url_alias` VALUES ('917', 'manufacturer_id=40', 'viktor-and-rolf');
INSERT INTO `oc_url_alias` VALUES ('910', 'manufacturer_id=33', 'cerruti');
INSERT INTO `oc_url_alias` VALUES ('911', 'manufacturer_id=34', 'chloe');
INSERT INTO `oc_url_alias` VALUES ('912', 'manufacturer_id=35', 'dkny');
INSERT INTO `oc_url_alias` VALUES ('913', 'manufacturer_id=36', 'mancera');
INSERT INTO `oc_url_alias` VALUES ('914', 'manufacturer_id=37', 'nina-ricci');
INSERT INTO `oc_url_alias` VALUES ('915', 'manufacturer_id=38', 'prada');
INSERT INTO `oc_url_alias` VALUES ('916', 'manufacturer_id=39', 'trussardi');
INSERT INTO `oc_url_alias` VALUES ('909', 'manufacturer_id=32', '');
INSERT INTO `oc_url_alias` VALUES ('906', 'manufacturer_id=29', 'shaik');
INSERT INTO `oc_url_alias` VALUES ('907', 'manufacturer_id=30', 'versace');
INSERT INTO `oc_url_alias` VALUES ('908', 'manufacturer_id=31', 'cacharel');
INSERT INTO `oc_url_alias` VALUES ('927', 'category_id=65', 'burberry-brand');
INSERT INTO `oc_url_alias` VALUES ('926', 'category_id=64', 'bvlgari-brand');
INSERT INTO `oc_url_alias` VALUES ('925', 'category_id=63', 'baldessarini-brand');
INSERT INTO `oc_url_alias` VALUES ('1012', 'product_id=50', 'armani-acqua-di-gio-man');
INSERT INTO `oc_url_alias` VALUES ('957', 'category_id=61', 'brand');
INSERT INTO `oc_url_alias` VALUES ('1061', 'category_id=59', 'muzhskoj-parfjum');
INSERT INTO `oc_url_alias` VALUES ('922', 'category_id=60', 'zhenskij-parfjum');
INSERT INTO `oc_url_alias` VALUES ('924', 'category_id=62', 'armani-brand');
INSERT INTO `oc_url_alias` VALUES ('904', 'manufacturer_id=27', 'lacoste');
INSERT INTO `oc_url_alias` VALUES ('898', 'manufacturer_id=21', 'diesel');
INSERT INTO `oc_url_alias` VALUES ('897', 'manufacturer_id=20', 'dior');
INSERT INTO `oc_url_alias` VALUES ('896', 'manufacturer_id=19', 'davidoff');
INSERT INTO `oc_url_alias` VALUES ('895', 'manufacturer_id=18', 'd-and-g');
INSERT INTO `oc_url_alias` VALUES ('893', 'manufacturer_id=17', 'chanel');
INSERT INTO `oc_url_alias` VALUES ('892', 'manufacturer_id=16', 'carolina-herrera');
INSERT INTO `oc_url_alias` VALUES ('891', 'manufacturer_id=15', 'calvin-klein');
INSERT INTO `oc_url_alias` VALUES ('890', 'manufacturer_id=14', 'burberry');
INSERT INTO `oc_url_alias` VALUES ('903', 'manufacturer_id=26', 'kenzo');
INSERT INTO `oc_url_alias` VALUES ('900', 'manufacturer_id=23', 'gucci');
INSERT INTO `oc_url_alias` VALUES ('899', 'manufacturer_id=22', 'givenchy');
INSERT INTO `oc_url_alias` VALUES ('888', 'manufacturer_id=12', 'baldessarini');
INSERT INTO `oc_url_alias` VALUES ('887', 'manufacturer_id=11', 'armani');
INSERT INTO `oc_url_alias` VALUES ('1122', 'information_id=6', 'delivery');
INSERT INTO `oc_url_alias` VALUES ('842', 'information_id=3', 'privacy');
INSERT INTO `oc_url_alias` VALUES ('843', 'information_id=5', 'terms');
INSERT INTO `oc_url_alias` VALUES ('845', 'common/home', '');
INSERT INTO `oc_url_alias` VALUES ('846', 'information/contact', 'contact-us');
INSERT INTO `oc_url_alias` VALUES ('847', 'information/sitemap', 'sitemap');
INSERT INTO `oc_url_alias` VALUES ('848', 'product/special', 'specials');
INSERT INTO `oc_url_alias` VALUES ('849', 'product/manufacturer', 'brands');
INSERT INTO `oc_url_alias` VALUES ('850', 'product/compare', 'compare-products');
INSERT INTO `oc_url_alias` VALUES ('851', 'product/search', 'search');
INSERT INTO `oc_url_alias` VALUES ('852', 'checkout/cart', 'cart');
INSERT INTO `oc_url_alias` VALUES ('853', 'checkout/checkout', 'checkout');
INSERT INTO `oc_url_alias` VALUES ('854', 'account/login', 'login');
INSERT INTO `oc_url_alias` VALUES ('855', 'account/logout', 'logout');
INSERT INTO `oc_url_alias` VALUES ('856', 'account/voucher', 'vouchers');
INSERT INTO `oc_url_alias` VALUES ('857', 'account/wishlist', 'wishlist');
INSERT INTO `oc_url_alias` VALUES ('858', 'account/account', 'my-account');
INSERT INTO `oc_url_alias` VALUES ('859', 'account/order', 'order-history');
INSERT INTO `oc_url_alias` VALUES ('860', 'account/newsletter', 'newsletter');
INSERT INTO `oc_url_alias` VALUES ('861', 'account/return/add', 'return-add');
INSERT INTO `oc_url_alias` VALUES ('862', 'account/forgotten', 'forgot-password');
INSERT INTO `oc_url_alias` VALUES ('863', 'account/download', 'downloads');
INSERT INTO `oc_url_alias` VALUES ('864', 'account/return', 'returns');
INSERT INTO `oc_url_alias` VALUES ('865', 'account/transaction', 'transactions');
INSERT INTO `oc_url_alias` VALUES ('866', 'account/register', 'create-account');
INSERT INTO `oc_url_alias` VALUES ('867', 'account/recurring', 'recurring');
INSERT INTO `oc_url_alias` VALUES ('868', 'account/address', 'address-book');
INSERT INTO `oc_url_alias` VALUES ('869', 'account/reward', 'reward-points');
INSERT INTO `oc_url_alias` VALUES ('870', 'account/edit', 'edit-account');
INSERT INTO `oc_url_alias` VALUES ('871', 'account/password', 'change-password');
INSERT INTO `oc_url_alias` VALUES ('880', 'affiliate/forgotten', 'affiliate-forgot-password');
INSERT INTO `oc_url_alias` VALUES ('881', 'affiliate/register', 'create-affiliate-account');
INSERT INTO `oc_url_alias` VALUES ('882', 'affiliate/login', 'affiliate-login');
INSERT INTO `oc_url_alias` VALUES ('883', 'affiliate/payment', 'affiliate-payment');
INSERT INTO `oc_url_alias` VALUES ('884', 'affiliate/tracking', 'affiliate-tracking');
INSERT INTO `oc_url_alias` VALUES ('885', 'affiliate/transaction', 'affiliate-transaction');
INSERT INTO `oc_url_alias` VALUES ('886', 'affiliate/account', 'affiliates');
INSERT INTO `oc_url_alias` VALUES ('928', 'category_id=66', 'calvin-klein-brand');
INSERT INTO `oc_url_alias` VALUES ('929', 'category_id=67', 'carolina-herrera-brand');
INSERT INTO `oc_url_alias` VALUES ('930', 'category_id=68', 'chanel-brand');
INSERT INTO `oc_url_alias` VALUES ('931', 'category_id=69', 'd-and-g-brand');
INSERT INTO `oc_url_alias` VALUES ('932', 'category_id=70', 'davidoff-brand');
INSERT INTO `oc_url_alias` VALUES ('933', 'category_id=71', 'dior-brand');
INSERT INTO `oc_url_alias` VALUES ('934', 'category_id=72', 'diesel-brand');
INSERT INTO `oc_url_alias` VALUES ('935', 'category_id=73', 'givenchy-brand');
INSERT INTO `oc_url_alias` VALUES ('936', 'category_id=74', 'gucci-brand');
INSERT INTO `oc_url_alias` VALUES ('937', 'category_id=75', 'guerlain-brand');
INSERT INTO `oc_url_alias` VALUES ('938', 'category_id=76', 'hugo-boss-brand');
INSERT INTO `oc_url_alias` VALUES ('939', 'category_id=77', 'kenzo-brand');
INSERT INTO `oc_url_alias` VALUES ('940', 'category_id=78', 'lacoste-brand');
INSERT INTO `oc_url_alias` VALUES ('941', 'category_id=79', 'paco-rabanne-brand');
INSERT INTO `oc_url_alias` VALUES ('942', 'category_id=80', 'shaik-brand');
INSERT INTO `oc_url_alias` VALUES ('943', 'category_id=81', 'versace-brand');
INSERT INTO `oc_url_alias` VALUES ('944', 'category_id=82', 'cacharel-brand');
INSERT INTO `oc_url_alias` VALUES ('1011', 'category_id=83', 'cerruti-brand');
INSERT INTO `oc_url_alias` VALUES ('946', 'category_id=84', 'chloe-brand');
INSERT INTO `oc_url_alias` VALUES ('947', 'category_id=85', 'dkny-brand');
INSERT INTO `oc_url_alias` VALUES ('948', 'category_id=86', 'lancome-brand');
INSERT INTO `oc_url_alias` VALUES ('949', 'category_id=87', 'lanvin-brand');
INSERT INTO `oc_url_alias` VALUES ('950', 'category_id=88', 'mancera-brand');
INSERT INTO `oc_url_alias` VALUES ('951', 'category_id=89', 'moschino-brand');
INSERT INTO `oc_url_alias` VALUES ('952', 'category_id=90', 'nina-ricci-brand');
INSERT INTO `oc_url_alias` VALUES ('953', 'category_id=91', 'rihanna-brand');
INSERT INTO `oc_url_alias` VALUES ('954', 'category_id=92', 'prada-brand');
INSERT INTO `oc_url_alias` VALUES ('955', 'category_id=93', 'trussardi-brand');
INSERT INTO `oc_url_alias` VALUES ('956', 'category_id=94', 'viktor-and-rolf-brand');
INSERT INTO `oc_url_alias` VALUES ('1013', 'product_id=51', 'armani-code-pour-homme-125ml');
INSERT INTO `oc_url_alias` VALUES ('1014', 'product_id=52', 'baldessarini-ambre-men-100ml');
INSERT INTO `oc_url_alias` VALUES ('1015', 'product_id=53', 'baldessarini-del-mar-100ml');
INSERT INTO `oc_url_alias` VALUES ('1018', 'product_id=54', 'bvlgari-aqva-marine-pour-homme-edt-100ml');
INSERT INTO `oc_url_alias` VALUES ('1017', 'product_id=55', 'bvlgari-aqva-pour-homme-edt-100ml');
INSERT INTO `oc_url_alias` VALUES ('1016', 'product_id=56', 'burberry-burberry-for-men-100ml');
INSERT INTO `oc_url_alias` VALUES ('1019', 'product_id=58', 'calvin-klein-eupharia-men-100ml');
INSERT INTO `oc_url_alias` VALUES ('1020', 'product_id=59', 'carolina-herrera-212-men-100-ml');
INSERT INTO `oc_url_alias` VALUES ('1021', 'product_id=60', 'carolina-herrera-212-vip-men-100ml');
INSERT INTO `oc_url_alias` VALUES ('1022', 'product_id=61', 'carolina-herrera-212-vip-sexy-man-100ml');
INSERT INTO `oc_url_alias` VALUES ('1024', 'product_id=62', 'chanel-allure-men-100ml');
INSERT INTO `oc_url_alias` VALUES ('1023', 'product_id=63', 'chanel-allure-homme-sport-man-100ml');
INSERT INTO `oc_url_alias` VALUES ('1025', 'product_id=64', 'chanel-bleu-de-chanel-100ml');
INSERT INTO `oc_url_alias` VALUES ('1026', 'product_id=65', 'chanel-platinium-egoiste-100-ml');
INSERT INTO `oc_url_alias` VALUES ('1028', 'product_id=66', 'd-and-g-pour-homme-125ml');
INSERT INTO `oc_url_alias` VALUES ('1027', 'product_id=67', 'd-and-g-light-blue-pour-homme-125ml');
INSERT INTO `oc_url_alias` VALUES ('1029', 'product_id=68', 'd-and-g-the-one-for-man-100ml');
INSERT INTO `oc_url_alias` VALUES ('1030', 'product_id=69', 'd-and-g-the-one-sport-for-men-100ml');
INSERT INTO `oc_url_alias` VALUES ('1031', 'product_id=70', 'davidoff-champion-man-90ml');
INSERT INTO `oc_url_alias` VALUES ('1032', 'product_id=71', 'davidoff-champion-energy-man-90ml');
INSERT INTO `oc_url_alias` VALUES ('1034', 'product_id=72', 'dior-fahrenheit-men-100-ml');
INSERT INTO `oc_url_alias` VALUES ('1033', 'product_id=73', 'diesel-only-the-brave-men');
INSERT INTO `oc_url_alias` VALUES ('1035', 'product_id=74', 'givenchy-pour-homme-100ml');
INSERT INTO `oc_url_alias` VALUES ('1036', 'product_id=75', 'givenchy-pour-homme-blue-label-man-100ml');
INSERT INTO `oc_url_alias` VALUES ('1039', 'product_id=76', 'gucci-gucci-by-gucci-made-to-measure-man-90ml');
INSERT INTO `oc_url_alias` VALUES ('1040', 'product_id=77', 'gucci-gucci-by-gucci-pour-homme-90ml');
INSERT INTO `oc_url_alias` VALUES ('1037', 'product_id=78', 'gucci-gucci-by-gucci-sport-man-90ml');
INSERT INTO `oc_url_alias` VALUES ('1038', 'product_id=79', 'gucci-guilty-homme-100ml');
INSERT INTO `oc_url_alias` VALUES ('1041', 'product_id=80', 'guerlain-guerlain-homme-100ml');
INSERT INTO `oc_url_alias` VALUES ('1042', 'product_id=81', 'hugo-boss-bottled-man-100ml');
INSERT INTO `oc_url_alias` VALUES ('1044', 'product_id=82', 'hugo-boss-green-man-100ml');
INSERT INTO `oc_url_alias` VALUES ('1046', 'product_id=83', 'hugo-boss-in-motion-90-ml');
INSERT INTO `oc_url_alias` VALUES ('1045', 'product_id=84', 'hugo-boss-in-motion-black-man-90-ml');
INSERT INTO `oc_url_alias` VALUES ('1048', 'product_id=85', 'hugo-boss-6-men-100-ml');
INSERT INTO `oc_url_alias` VALUES ('1047', 'product_id=86', 'hugo-boss-soul-men-90-ml');
INSERT INTO `oc_url_alias` VALUES ('1049', 'product_id=87', 'kenzo-l-eau-par-kenzo-pour-homme-100ml');
INSERT INTO `oc_url_alias` VALUES ('1052', 'product_id=88', 'lacoste-l12-12-blanc-man-100ml');
INSERT INTO `oc_url_alias` VALUES ('1050', 'product_id=89', 'lacoste-essential-man-100ml');
INSERT INTO `oc_url_alias` VALUES ('1051', 'product_id=90', 'lacoste-l-12-12-noir-man-100-ml');
INSERT INTO `oc_url_alias` VALUES ('1053', 'product_id=91', 'lacoste-pour-homme-100-ml');
INSERT INTO `oc_url_alias` VALUES ('1055', 'product_id=92', 'paco-rabanne-black-xs-man-100ml');
INSERT INTO `oc_url_alias` VALUES ('1056', 'product_id=93', 'paco-rabanne-invictus-man-100ml');
INSERT INTO `oc_url_alias` VALUES ('1057', 'product_id=94', 'paco-rabanne-ultraviolet-man-100ml');
INSERT INTO `oc_url_alias` VALUES ('1054', 'product_id=95', 'pacco-rabbanne-1-million-men-100-ml');
INSERT INTO `oc_url_alias` VALUES ('1058', 'product_id=96', 'shaik-opulent-shaik-parfum-n-77-men');
INSERT INTO `oc_url_alias` VALUES ('1059', 'product_id=97', 'versace-eros-man-100ml');
INSERT INTO `oc_url_alias` VALUES ('1060', 'product_id=98', 'versace-man-eau-fraiche-man-100ml');
INSERT INTO `oc_url_alias` VALUES ('1062', 'product_id=99', 'armani-acqua-di-gio-woman-100ml');
INSERT INTO `oc_url_alias` VALUES ('1063', 'product_id=100', 'armani-acqua-di-gioia-woman-100ml');
INSERT INTO `oc_url_alias` VALUES ('1064', 'product_id=101', 'armani-code-pour-femme-75ml');
INSERT INTO `oc_url_alias` VALUES ('1065', 'product_id=102', 'burberry-weekend-for-woman-100ml');
INSERT INTO `oc_url_alias` VALUES ('1066', 'product_id=103', 'burberry-my-burberry-women-edp-90-ml');
INSERT INTO `oc_url_alias` VALUES ('1067', 'product_id=104', 'bvlgari-omnia-crystalline-woman-65ml');
INSERT INTO `oc_url_alias` VALUES ('1068', 'product_id=105', 'bvlgari-omnia-green-jade-woman-65ml');
INSERT INTO `oc_url_alias` VALUES ('1069', 'product_id=106', 'bvlgari-omnia-coral-65-ml');
INSERT INTO `oc_url_alias` VALUES ('1070', 'product_id=107', 'cacharel-amor-amor-woman-100ml');
INSERT INTO `oc_url_alias` VALUES ('1071', 'product_id=108', 'carolina-herrera-212-vip-woman-80ml');
INSERT INTO `oc_url_alias` VALUES ('1072', 'product_id=109', 'carolina-herrera-212-vip-rose-women-80-ml');
INSERT INTO `oc_url_alias` VALUES ('1073', 'product_id=110', 'chanel-allure-woman-100ml');
INSERT INTO `oc_url_alias` VALUES ('1074', 'product_id=111', 'chanel-allure-sensuelle-woman-100-ml');
INSERT INTO `oc_url_alias` VALUES ('1075', 'product_id=112', 'chanel-chance-eau-fraiche-woman-100-ml');
INSERT INTO `oc_url_alias` VALUES ('1076', 'product_id=113', 'chanel-chance-eau-de-parfume-woman-100-ml');
INSERT INTO `oc_url_alias` VALUES ('1077', 'product_id=114', 'chanel-chance-eau-de-toilette-woman-100-ml');
INSERT INTO `oc_url_alias` VALUES ('1078', 'product_id=115', 'chanel-noir-women-100-ml');
INSERT INTO `oc_url_alias` VALUES ('1079', 'product_id=116', 'chanel-5-woman-100-ml');
INSERT INTO `oc_url_alias` VALUES ('1080', 'product_id=117', 'cerruti1881-women-100-ml');
INSERT INTO `oc_url_alias` VALUES ('1081', 'product_id=118', 'chloe-eau-de-parfume-100-ml');
INSERT INTO `oc_url_alias` VALUES ('1082', 'product_id=119', 'd-and-g-limpertrice-woman-100ml');
INSERT INTO `oc_url_alias` VALUES ('1083', 'product_id=120', 'd-and-g-light-blue-for-woman-100-ml');
INSERT INTO `oc_url_alias` VALUES ('1084', 'product_id=121', 'd-and-g-the-one-desire-woman-75ml');
INSERT INTO `oc_url_alias` VALUES ('1085', 'product_id=122', 'd-and-g-the-one-woman-75ml');
INSERT INTO `oc_url_alias` VALUES ('1086', 'product_id=123', 'dior-addict-parfum-women-100-ml');
INSERT INTO `oc_url_alias` VALUES ('1087', 'product_id=124', 'dior-miss-dior-cherie-blooming-bouquet-100-ml');
INSERT INTO `oc_url_alias` VALUES ('1088', 'product_id=125', 'dior-hypnotic-poison-woman-100ml');
INSERT INTO `oc_url_alias` VALUES ('1089', 'product_id=126', 'dior-j-ador-de-parfum-100ml');
INSERT INTO `oc_url_alias` VALUES ('1090', 'product_id=127', 'dkny-be-delicious-woman-100ml');
INSERT INTO `oc_url_alias` VALUES ('1091', 'product_id=128', 'givenchy-absolutely-esistible-woman-75ml');
INSERT INTO `oc_url_alias` VALUES ('1092', 'product_id=129', 'givenchy-ange-ou-demon-le-secret-eau-detoilette-100-ml');
INSERT INTO `oc_url_alias` VALUES ('1093', 'product_id=130', 'givenchy-play-intense-woman-75-ml');
INSERT INTO `oc_url_alias` VALUES ('1094', 'product_id=131', 'givenchy-very-irresistible-pour-women-75-ml');
INSERT INTO `oc_url_alias` VALUES ('1095', 'product_id=132', 'givenchy-very-irresistible-sensual-women-75-ml');
INSERT INTO `oc_url_alias` VALUES ('1096', 'product_id=133', 'gucci-envy-me-100-ml');
INSERT INTO `oc_url_alias` VALUES ('1097', 'product_id=134', 'gucci-flora-by-gucci-edp-75-ml');
INSERT INTO `oc_url_alias` VALUES ('1098', 'product_id=135', 'gucci-guilty-woman-75ml');
INSERT INTO `oc_url_alias` VALUES ('1099', 'product_id=136', 'gucci-guilty-black-woman-75ml');
INSERT INTO `oc_url_alias` VALUES ('1100', 'product_id=137', 'guerlain-la-petite-robe-noire-parfum-100-ml');
INSERT INTO `oc_url_alias` VALUES ('1101', 'product_id=138', 'hugo-boss-jour-woman-100ml');
INSERT INTO `oc_url_alias` VALUES ('1102', 'product_id=139', 'hugo-boss-ma-vie-pour-femme-75-ml');
INSERT INTO `oc_url_alias` VALUES ('1103', 'product_id=140', 'hugo-boss-nuit-pour-femme-75-ml');
INSERT INTO `oc_url_alias` VALUES ('1104', 'product_id=141', 'kenzo-l-eau-par-kenzo-colors-pour-femme-100ml');
INSERT INTO `oc_url_alias` VALUES ('1105', 'product_id=142', 'kenzo-l-eau-par-kenzo-pour-femme-100ml');
INSERT INTO `oc_url_alias` VALUES ('1106', 'product_id=143', 'lacoste-pour-femme-100ml');
INSERT INTO `oc_url_alias` VALUES ('1107', 'product_id=144', 'lancome-hypnose-woman-100ml');
INSERT INTO `oc_url_alias` VALUES ('1108', 'product_id=145', 'lancome-tresor-edp-femme-100-ml');
INSERT INTO `oc_url_alias` VALUES ('1124', 'product_id=146', 'lanvin-eclat-d-arpege-100-ml');
INSERT INTO `oc_url_alias` VALUES ('1110', 'product_id=147', 'mancera-gold-intensitive-aoud-woman-100ml');
INSERT INTO `oc_url_alias` VALUES ('1111', 'product_id=148', 'moschino-funny-100-ml');
INSERT INTO `oc_url_alias` VALUES ('1112', 'product_id=149', 'nina-ricci-premier-jour-woman-100ml');
INSERT INTO `oc_url_alias` VALUES ('1113', 'product_id=150', 'nina-ricci-nina-100-ml');
INSERT INTO `oc_url_alias` VALUES ('1114', 'product_id=151', 'rihanna-reb-l-fleur-woman-100ml');
INSERT INTO `oc_url_alias` VALUES ('1115', 'product_id=152', 'paco-rabanne-lady-one-million-80ml');
INSERT INTO `oc_url_alias` VALUES ('1116', 'product_id=153', 'prada-candy-80-ml');
INSERT INTO `oc_url_alias` VALUES ('1117', 'product_id=154', 'trussardi-donna-women-100-ml');
INSERT INTO `oc_url_alias` VALUES ('1118', 'product_id=155', 'shaik-30-woman-100ml');
INSERT INTO `oc_url_alias` VALUES ('1119', 'product_id=156', 'versace-bright-crystal-90-ml');
INSERT INTO `oc_url_alias` VALUES ('1120', 'product_id=157', 'versace-crystal-noir-women-90-ml');
INSERT INTO `oc_url_alias` VALUES ('1121', 'product_id=158', 'viktor-and-rolf-flower-bomb-edp-100-ml');

-- ----------------------------
-- Table structure for oc_user
-- ----------------------------
DROP TABLE IF EXISTS `oc_user`;
CREATE TABLE `oc_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_group_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `image` varchar(255) NOT NULL,
  `code` varchar(40) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_user
-- ----------------------------
INSERT INTO `oc_user` VALUES ('1', '1', 'admin', '68df4df0bdba0dec6e8a59622ab96bd9f93606b8', 'q45fKsUPk', 'John', 'Doe', 'aostavnenko.ao@gmail.com', '', '', '127.0.0.1', '1', '2015-11-03 16:22:07');

-- ----------------------------
-- Table structure for oc_user_group
-- ----------------------------
DROP TABLE IF EXISTS `oc_user_group`;
CREATE TABLE `oc_user_group` (
  `user_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `permission` text NOT NULL,
  PRIMARY KEY (`user_group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_user_group
-- ----------------------------
INSERT INTO `oc_user_group` VALUES ('1', 'Administrator', '{\"access\":[\"analytics\\/google_analytics\",\"captcha\\/basic_captcha\",\"captcha\\/google_captcha\",\"catalog\\/attribute\",\"catalog\\/attribute_group\",\"catalog\\/category\",\"catalog\\/download\",\"catalog\\/filter\",\"catalog\\/information\",\"catalog\\/manufacturer\",\"catalog\\/option\",\"catalog\\/product\",\"catalog\\/recurring\",\"catalog\\/review\",\"common\\/column_left\",\"common\\/filemanager\",\"common\\/menu\",\"common\\/profile\",\"common\\/stats\",\"customer\\/custom_field\",\"customer\\/customer\",\"customer\\/customer_group\",\"design\\/banner\",\"design\\/layout\",\"extension\\/analytics\",\"extension\\/captcha\",\"extension\\/feed\",\"extension\\/fraud\",\"extension\\/installer\",\"extension\\/modification\",\"extension\\/module\",\"extension\\/openbay\",\"extension\\/payment\",\"extension\\/shipping\",\"extension\\/total\",\"feed\\/google_base\",\"feed\\/google_sitemap\",\"feed\\/openbaypro\",\"fraud\\/fraudlabspro\",\"fraud\\/ip\",\"fraud\\/maxmind\",\"localisation\\/country\",\"localisation\\/currency\",\"localisation\\/geo_zone\",\"localisation\\/language\",\"localisation\\/length_class\",\"localisation\\/location\",\"localisation\\/order_status\",\"localisation\\/return_action\",\"localisation\\/return_reason\",\"localisation\\/return_status\",\"localisation\\/stock_status\",\"localisation\\/tax_class\",\"localisation\\/tax_rate\",\"localisation\\/weight_class\",\"localisation\\/zone\",\"marketing\\/affiliate\",\"marketing\\/contact\",\"marketing\\/coupon\",\"marketing\\/marketing\",\"module\\/account\",\"module\\/affiliate\",\"module\\/amazon_login\",\"module\\/amazon_pay\",\"module\\/banner\",\"module\\/bestseller\",\"module\\/carousel\",\"module\\/category\",\"module\\/ebay_listing\",\"module\\/featured\",\"module\\/filter\",\"module\\/google_hangouts\",\"module\\/html\",\"module\\/information\",\"module\\/latest\",\"module\\/pp_button\",\"module\\/pp_login\",\"module\\/slideshow\",\"module\\/special\",\"module\\/store\",\"openbay\\/amazon\",\"openbay\\/amazon_listing\",\"openbay\\/amazon_product\",\"openbay\\/amazonus\",\"openbay\\/amazonus_listing\",\"openbay\\/amazonus_product\",\"openbay\\/ebay\",\"openbay\\/ebay_profile\",\"openbay\\/ebay_template\",\"openbay\\/etsy\",\"openbay\\/etsy_product\",\"openbay\\/etsy_shipping\",\"openbay\\/etsy_shop\",\"payment\\/amazon_login_pay\",\"payment\\/authorizenet_aim\",\"payment\\/authorizenet_sim\",\"payment\\/bank_transfer\",\"payment\\/bluepay_hosted\",\"payment\\/bluepay_redirect\",\"payment\\/cheque\",\"payment\\/cod\",\"payment\\/firstdata\",\"payment\\/firstdata_remote\",\"payment\\/free_checkout\",\"payment\\/g2apay\",\"payment\\/globalpay\",\"payment\\/globalpay_remote\",\"payment\\/klarna_account\",\"payment\\/klarna_invoice\",\"payment\\/liqpay\",\"payment\\/nochex\",\"payment\\/paymate\",\"payment\\/paypoint\",\"payment\\/payza\",\"payment\\/perpetual_payments\",\"payment\\/pp_express\",\"payment\\/pp_payflow\",\"payment\\/pp_payflow_iframe\",\"payment\\/pp_pro\",\"payment\\/pp_pro_iframe\",\"payment\\/pp_standard\",\"payment\\/realex\",\"payment\\/realex_remote\",\"payment\\/sagepay_direct\",\"payment\\/sagepay_server\",\"payment\\/sagepay_us\",\"payment\\/securetrading_pp\",\"payment\\/securetrading_ws\",\"payment\\/skrill\",\"payment\\/twocheckout\",\"payment\\/web_payment_software\",\"payment\\/worldpay\",\"report\\/affiliate\",\"report\\/affiliate_activity\",\"report\\/affiliate_login\",\"report\\/customer_activity\",\"report\\/customer_credit\",\"report\\/customer_login\",\"report\\/customer_online\",\"report\\/customer_order\",\"report\\/customer_reward\",\"report\\/marketing\",\"report\\/product_purchased\",\"report\\/product_viewed\",\"report\\/sale_coupon\",\"report\\/sale_order\",\"report\\/sale_return\",\"report\\/sale_shipping\",\"report\\/sale_tax\",\"sale\\/order\",\"sale\\/recurring\",\"sale\\/return\",\"sale\\/voucher\",\"sale\\/voucher_theme\",\"setting\\/setting\",\"setting\\/store\",\"shipping\\/auspost\",\"shipping\\/citylink\",\"shipping\\/fedex\",\"shipping\\/flat\",\"shipping\\/free\",\"shipping\\/item\",\"shipping\\/parcelforce_48\",\"shipping\\/pickup\",\"shipping\\/royal_mail\",\"shipping\\/ups\",\"shipping\\/usps\",\"shipping\\/weight\",\"tool\\/backup\",\"tool\\/error_log\",\"tool\\/upload\",\"total\\/coupon\",\"total\\/credit\",\"total\\/handling\",\"total\\/klarna_fee\",\"total\\/low_order_fee\",\"total\\/reward\",\"total\\/shipping\",\"total\\/sub_total\",\"total\\/tax\",\"total\\/total\",\"total\\/voucher\",\"user\\/api\",\"user\\/user\",\"user\\/user_permission\",\"module\\/latest\"],\"modify\":[\"analytics\\/google_analytics\",\"captcha\\/basic_captcha\",\"captcha\\/google_captcha\",\"catalog\\/attribute\",\"catalog\\/attribute_group\",\"catalog\\/category\",\"catalog\\/download\",\"catalog\\/filter\",\"catalog\\/information\",\"catalog\\/manufacturer\",\"catalog\\/option\",\"catalog\\/product\",\"catalog\\/recurring\",\"catalog\\/review\",\"common\\/column_left\",\"common\\/filemanager\",\"common\\/menu\",\"common\\/profile\",\"common\\/stats\",\"customer\\/custom_field\",\"customer\\/customer\",\"customer\\/customer_group\",\"design\\/banner\",\"design\\/layout\",\"extension\\/analytics\",\"extension\\/captcha\",\"extension\\/feed\",\"extension\\/fraud\",\"extension\\/installer\",\"extension\\/modification\",\"extension\\/module\",\"extension\\/openbay\",\"extension\\/payment\",\"extension\\/shipping\",\"extension\\/total\",\"feed\\/google_base\",\"feed\\/google_sitemap\",\"feed\\/openbaypro\",\"fraud\\/fraudlabspro\",\"fraud\\/ip\",\"fraud\\/maxmind\",\"localisation\\/country\",\"localisation\\/currency\",\"localisation\\/geo_zone\",\"localisation\\/language\",\"localisation\\/length_class\",\"localisation\\/location\",\"localisation\\/order_status\",\"localisation\\/return_action\",\"localisation\\/return_reason\",\"localisation\\/return_status\",\"localisation\\/stock_status\",\"localisation\\/tax_class\",\"localisation\\/tax_rate\",\"localisation\\/weight_class\",\"localisation\\/zone\",\"marketing\\/affiliate\",\"marketing\\/contact\",\"marketing\\/coupon\",\"marketing\\/marketing\",\"module\\/account\",\"module\\/affiliate\",\"module\\/amazon_login\",\"module\\/amazon_pay\",\"module\\/banner\",\"module\\/bestseller\",\"module\\/carousel\",\"module\\/category\",\"module\\/ebay_listing\",\"module\\/featured\",\"module\\/filter\",\"module\\/google_hangouts\",\"module\\/html\",\"module\\/information\",\"module\\/latest\",\"module\\/pp_button\",\"module\\/pp_login\",\"module\\/slideshow\",\"module\\/special\",\"module\\/store\",\"openbay\\/amazon\",\"openbay\\/amazon_listing\",\"openbay\\/amazon_product\",\"openbay\\/amazonus\",\"openbay\\/amazonus_listing\",\"openbay\\/amazonus_product\",\"openbay\\/ebay\",\"openbay\\/ebay_profile\",\"openbay\\/ebay_template\",\"openbay\\/etsy\",\"openbay\\/etsy_product\",\"openbay\\/etsy_shipping\",\"openbay\\/etsy_shop\",\"payment\\/amazon_login_pay\",\"payment\\/authorizenet_aim\",\"payment\\/authorizenet_sim\",\"payment\\/bank_transfer\",\"payment\\/bluepay_hosted\",\"payment\\/bluepay_redirect\",\"payment\\/cheque\",\"payment\\/cod\",\"payment\\/firstdata\",\"payment\\/firstdata_remote\",\"payment\\/free_checkout\",\"payment\\/g2apay\",\"payment\\/globalpay\",\"payment\\/globalpay_remote\",\"payment\\/klarna_account\",\"payment\\/klarna_invoice\",\"payment\\/liqpay\",\"payment\\/nochex\",\"payment\\/paymate\",\"payment\\/paypoint\",\"payment\\/payza\",\"payment\\/perpetual_payments\",\"payment\\/pp_express\",\"payment\\/pp_payflow\",\"payment\\/pp_payflow_iframe\",\"payment\\/pp_pro\",\"payment\\/pp_pro_iframe\",\"payment\\/pp_standard\",\"payment\\/realex\",\"payment\\/realex_remote\",\"payment\\/sagepay_direct\",\"payment\\/sagepay_server\",\"payment\\/sagepay_us\",\"payment\\/securetrading_pp\",\"payment\\/securetrading_ws\",\"payment\\/skrill\",\"payment\\/twocheckout\",\"payment\\/web_payment_software\",\"payment\\/worldpay\",\"report\\/affiliate\",\"report\\/affiliate_activity\",\"report\\/affiliate_login\",\"report\\/customer_activity\",\"report\\/customer_credit\",\"report\\/customer_login\",\"report\\/customer_online\",\"report\\/customer_order\",\"report\\/customer_reward\",\"report\\/marketing\",\"report\\/product_purchased\",\"report\\/product_viewed\",\"report\\/sale_coupon\",\"report\\/sale_order\",\"report\\/sale_return\",\"report\\/sale_shipping\",\"report\\/sale_tax\",\"sale\\/order\",\"sale\\/recurring\",\"sale\\/return\",\"sale\\/voucher\",\"sale\\/voucher_theme\",\"setting\\/setting\",\"setting\\/store\",\"shipping\\/auspost\",\"shipping\\/citylink\",\"shipping\\/fedex\",\"shipping\\/flat\",\"shipping\\/free\",\"shipping\\/item\",\"shipping\\/parcelforce_48\",\"shipping\\/pickup\",\"shipping\\/royal_mail\",\"shipping\\/ups\",\"shipping\\/usps\",\"shipping\\/weight\",\"tool\\/backup\",\"tool\\/error_log\",\"tool\\/upload\",\"total\\/coupon\",\"total\\/credit\",\"total\\/handling\",\"total\\/klarna_fee\",\"total\\/low_order_fee\",\"total\\/reward\",\"total\\/shipping\",\"total\\/sub_total\",\"total\\/tax\",\"total\\/total\",\"total\\/voucher\",\"user\\/api\",\"user\\/user\",\"user\\/user_permission\",\"module\\/latest\"]}');
INSERT INTO `oc_user_group` VALUES ('10', 'Demonstration', '');

-- ----------------------------
-- Table structure for oc_voucher
-- ----------------------------
DROP TABLE IF EXISTS `oc_voucher`;
CREATE TABLE `oc_voucher` (
  `voucher_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`voucher_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_voucher
-- ----------------------------

-- ----------------------------
-- Table structure for oc_voucher_history
-- ----------------------------
DROP TABLE IF EXISTS `oc_voucher_history`;
CREATE TABLE `oc_voucher_history` (
  `voucher_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`voucher_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_voucher_history
-- ----------------------------

-- ----------------------------
-- Table structure for oc_voucher_theme
-- ----------------------------
DROP TABLE IF EXISTS `oc_voucher_theme`;
CREATE TABLE `oc_voucher_theme` (
  `voucher_theme_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`voucher_theme_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_voucher_theme
-- ----------------------------
INSERT INTO `oc_voucher_theme` VALUES ('8', 'catalog/demo/canon_eos_5d_2.jpg');
INSERT INTO `oc_voucher_theme` VALUES ('7', 'catalog/demo/gift-voucher-birthday.jpg');
INSERT INTO `oc_voucher_theme` VALUES ('6', 'catalog/demo/apple_logo.jpg');

-- ----------------------------
-- Table structure for oc_voucher_theme_description
-- ----------------------------
DROP TABLE IF EXISTS `oc_voucher_theme_description`;
CREATE TABLE `oc_voucher_theme_description` (
  `voucher_theme_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`voucher_theme_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_voucher_theme_description
-- ----------------------------
INSERT INTO `oc_voucher_theme_description` VALUES ('6', '1', 'Новый год');
INSERT INTO `oc_voucher_theme_description` VALUES ('7', '1', 'День рождения');
INSERT INTO `oc_voucher_theme_description` VALUES ('8', '1', 'Другое');

-- ----------------------------
-- Table structure for oc_weight_class
-- ----------------------------
DROP TABLE IF EXISTS `oc_weight_class`;
CREATE TABLE `oc_weight_class` (
  `weight_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  PRIMARY KEY (`weight_class_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_weight_class
-- ----------------------------
INSERT INTO `oc_weight_class` VALUES ('1', '1.00000000');
INSERT INTO `oc_weight_class` VALUES ('2', '1000.00000000');
INSERT INTO `oc_weight_class` VALUES ('5', '2.20460000');
INSERT INTO `oc_weight_class` VALUES ('6', '35.27400000');

-- ----------------------------
-- Table structure for oc_weight_class_description
-- ----------------------------
DROP TABLE IF EXISTS `oc_weight_class_description`;
CREATE TABLE `oc_weight_class_description` (
  `weight_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  PRIMARY KEY (`weight_class_id`,`language_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_weight_class_description
-- ----------------------------
INSERT INTO `oc_weight_class_description` VALUES ('1', '1', 'Килограмм', 'кг');
INSERT INTO `oc_weight_class_description` VALUES ('2', '1', 'Грамм', 'г');

-- ----------------------------
-- Table structure for oc_zone
-- ----------------------------
DROP TABLE IF EXISTS `oc_zone`;
CREATE TABLE `oc_zone` (
  `zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(32) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`zone_id`)
) ENGINE=MyISAM AUTO_INCREMENT=169 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_zone
-- ----------------------------
INSERT INTO `oc_zone` VALUES ('1', '20', 'Брест', 'BR', '1');
INSERT INTO `oc_zone` VALUES ('2', '20', 'Гомель', 'HO', '1');
INSERT INTO `oc_zone` VALUES ('3', '20', 'Минск', 'HM', '1');
INSERT INTO `oc_zone` VALUES ('4', '20', 'Гродно', 'HR', '1');
INSERT INTO `oc_zone` VALUES ('5', '20', 'Могилев', 'MA', '1');
INSERT INTO `oc_zone` VALUES ('6', '20', 'Минская область', 'MI', '1');
INSERT INTO `oc_zone` VALUES ('7', '20', 'Витебск', 'VI', '1');
INSERT INTO `oc_zone` VALUES ('8', '80', 'Abkhazia', 'AB', '1');
INSERT INTO `oc_zone` VALUES ('9', '80', 'Ajaria', 'AJ', '1');
INSERT INTO `oc_zone` VALUES ('10', '80', 'Tbilisi', 'TB', '1');
INSERT INTO `oc_zone` VALUES ('11', '80', 'Guria', 'GU', '1');
INSERT INTO `oc_zone` VALUES ('12', '80', 'Imereti', 'IM', '1');
INSERT INTO `oc_zone` VALUES ('13', '80', 'Kakheti', 'KA', '1');
INSERT INTO `oc_zone` VALUES ('14', '80', 'Kvemo Kartli', 'KK', '1');
INSERT INTO `oc_zone` VALUES ('15', '80', 'Mtskheta-Mtianeti', 'MM', '1');
INSERT INTO `oc_zone` VALUES ('16', '80', 'Racha Lechkhumi and Kvemo Svanet', 'RL', '1');
INSERT INTO `oc_zone` VALUES ('17', '80', 'Samegrelo-Zemo Svaneti', 'SZ', '1');
INSERT INTO `oc_zone` VALUES ('18', '80', 'Samtskhe-Javakheti', 'SJ', '1');
INSERT INTO `oc_zone` VALUES ('19', '80', 'Shida Kartli', 'SK', '1');
INSERT INTO `oc_zone` VALUES ('20', '109', 'Алматинская область', 'AL', '1');
INSERT INTO `oc_zone` VALUES ('21', '109', 'Алматы - город республ-го значения', 'AC', '1');
INSERT INTO `oc_zone` VALUES ('22', '109', 'Акмолинская область', 'AM', '1');
INSERT INTO `oc_zone` VALUES ('23', '109', 'Актюбинская область', 'AQ', '1');
INSERT INTO `oc_zone` VALUES ('24', '109', 'Астана - город республ-го значения', 'AS', '1');
INSERT INTO `oc_zone` VALUES ('25', '109', 'Атырауская область', 'AT', '1');
INSERT INTO `oc_zone` VALUES ('26', '109', 'Западно-Казахстанская область', 'BA', '1');
INSERT INTO `oc_zone` VALUES ('27', '109', 'Байконур - город республ-го значения', 'BY', '1');
INSERT INTO `oc_zone` VALUES ('28', '109', 'Мангистауская область', 'MA', '1');
INSERT INTO `oc_zone` VALUES ('29', '109', 'Южно-Казахстанская область', 'ON', '1');
INSERT INTO `oc_zone` VALUES ('30', '109', 'Павлодарская область', 'PA', '1');
INSERT INTO `oc_zone` VALUES ('31', '109', 'Карагандинская область', 'QA', '1');
INSERT INTO `oc_zone` VALUES ('32', '109', 'Костанайская область', 'QO', '1');
INSERT INTO `oc_zone` VALUES ('33', '109', 'Кызылординская область', 'QY', '1');
INSERT INTO `oc_zone` VALUES ('34', '109', 'Восточно-Казахстанская область', 'SH', '1');
INSERT INTO `oc_zone` VALUES ('35', '109', 'Северо-Казахстанская область', 'SO', '1');
INSERT INTO `oc_zone` VALUES ('36', '109', 'Жамбылская область', 'ZH', '1');
INSERT INTO `oc_zone` VALUES ('37', '115', 'Bishkek', 'GB', '1');
INSERT INTO `oc_zone` VALUES ('38', '115', 'Batken', 'B', '1');
INSERT INTO `oc_zone` VALUES ('39', '115', 'Chu', 'C', '1');
INSERT INTO `oc_zone` VALUES ('40', '115', 'Jalal-Abad', 'J', '1');
INSERT INTO `oc_zone` VALUES ('41', '115', 'Naryn', 'N', '1');
INSERT INTO `oc_zone` VALUES ('42', '115', 'Osh', 'O', '1');
INSERT INTO `oc_zone` VALUES ('43', '115', 'Talas', 'T', '1');
INSERT INTO `oc_zone` VALUES ('44', '115', 'Ysyk-Kol', 'Y', '1');
INSERT INTO `oc_zone` VALUES ('45', '176', 'Республика Хакасия', 'KK', '1');
INSERT INTO `oc_zone` VALUES ('46', '176', 'Московская область', 'MOS', '1');
INSERT INTO `oc_zone` VALUES ('47', '176', 'Чукотский АО', 'CHU', '1');
INSERT INTO `oc_zone` VALUES ('48', '176', 'Архангельская область', 'ARK', '1');
INSERT INTO `oc_zone` VALUES ('49', '176', 'Астраханская область', 'AST', '1');
INSERT INTO `oc_zone` VALUES ('50', '176', 'Алтайский край', 'ALT', '1');
INSERT INTO `oc_zone` VALUES ('51', '176', 'Белгородская область', 'BEL', '1');
INSERT INTO `oc_zone` VALUES ('52', '176', 'Еврейская АО', 'YEV', '1');
INSERT INTO `oc_zone` VALUES ('53', '176', 'Амурская область', 'AMU', '1');
INSERT INTO `oc_zone` VALUES ('54', '176', 'Брянская область', 'BRY', '1');
INSERT INTO `oc_zone` VALUES ('55', '176', 'Чувашская Республика', 'CU', '1');
INSERT INTO `oc_zone` VALUES ('56', '176', 'Челябинская область', 'CHE', '1');
INSERT INTO `oc_zone` VALUES ('57', '176', 'Карачаево-Черкеcсия', 'KC', '1');
INSERT INTO `oc_zone` VALUES ('58', '176', 'Забайкальский край', 'ZAB', '1');
INSERT INTO `oc_zone` VALUES ('59', '176', 'Ленинградская область', 'LEN', '1');
INSERT INTO `oc_zone` VALUES ('60', '176', 'Республика Калмыкия', 'KL', '1');
INSERT INTO `oc_zone` VALUES ('61', '176', 'Сахалинская область', 'SAK', '1');
INSERT INTO `oc_zone` VALUES ('62', '176', 'Республика Алтай', 'AL', '1');
INSERT INTO `oc_zone` VALUES ('63', '176', 'Чеченская Республика', 'CE', '1');
INSERT INTO `oc_zone` VALUES ('64', '176', 'Иркутская область', 'IRK', '1');
INSERT INTO `oc_zone` VALUES ('65', '176', 'Ивановская область', 'IVA', '1');
INSERT INTO `oc_zone` VALUES ('66', '176', 'Удмуртская Республика', 'UD', '1');
INSERT INTO `oc_zone` VALUES ('67', '176', 'Калининградская область', 'KGD', '1');
INSERT INTO `oc_zone` VALUES ('68', '176', 'Калужская область', 'KLU', '1');
INSERT INTO `oc_zone` VALUES ('69', '176', 'Республика Татарстан', 'TA', '1');
INSERT INTO `oc_zone` VALUES ('70', '176', 'Кемеровская область', 'KEM', '1');
INSERT INTO `oc_zone` VALUES ('71', '176', 'Хабаровский край', 'KHA', '1');
INSERT INTO `oc_zone` VALUES ('72', '176', 'Ханты-Мансийский АО - Югра', 'KHM', '1');
INSERT INTO `oc_zone` VALUES ('73', '176', 'Костромская область', 'KOS', '1');
INSERT INTO `oc_zone` VALUES ('74', '176', 'Краснодарский край', 'KDA', '1');
INSERT INTO `oc_zone` VALUES ('75', '176', 'Красноярский край', 'KYA', '1');
INSERT INTO `oc_zone` VALUES ('76', '176', 'Курганская область', 'KGN', '1');
INSERT INTO `oc_zone` VALUES ('77', '176', 'Курская область', 'KRS', '1');
INSERT INTO `oc_zone` VALUES ('78', '176', 'Республика Тыва', 'TY', '1');
INSERT INTO `oc_zone` VALUES ('79', '176', 'Липецкая область', 'LIP', '1');
INSERT INTO `oc_zone` VALUES ('80', '176', 'Магаданская область', 'MAG', '1');
INSERT INTO `oc_zone` VALUES ('81', '176', 'Республика Дагестан', 'DA', '1');
INSERT INTO `oc_zone` VALUES ('82', '176', 'Республика Адыгея', 'AD', '1');
INSERT INTO `oc_zone` VALUES ('83', '176', 'Москва', 'MOW', '1');
INSERT INTO `oc_zone` VALUES ('84', '176', 'Мурманская область', 'MUR', '1');
INSERT INTO `oc_zone` VALUES ('85', '176', 'Республика Кабардино-Балкария', 'KB', '1');
INSERT INTO `oc_zone` VALUES ('86', '176', 'Ненецкий АО', 'NEN', '1');
INSERT INTO `oc_zone` VALUES ('87', '176', 'Республика Ингушетия', 'IN', '1');
INSERT INTO `oc_zone` VALUES ('88', '176', 'Нижегородская область', 'NIZ', '1');
INSERT INTO `oc_zone` VALUES ('89', '176', 'Новгородская область', 'NGR', '1');
INSERT INTO `oc_zone` VALUES ('90', '176', 'Новосибирская область', 'NVS', '1');
INSERT INTO `oc_zone` VALUES ('91', '176', 'Омская область', 'OMS', '1');
INSERT INTO `oc_zone` VALUES ('92', '176', 'Орловская область', 'ORL', '1');
INSERT INTO `oc_zone` VALUES ('93', '176', 'Оренбургская область', 'ORE', '1');
INSERT INTO `oc_zone` VALUES ('94', '176', 'Пензенская область', 'PNZ', '1');
INSERT INTO `oc_zone` VALUES ('95', '176', 'Пермский край', 'PER', '1');
INSERT INTO `oc_zone` VALUES ('96', '176', 'Камчатский край', 'KAM', '1');
INSERT INTO `oc_zone` VALUES ('97', '176', 'Республика Карелия', 'KR', '1');
INSERT INTO `oc_zone` VALUES ('98', '176', 'Псковская область', 'PSK', '1');
INSERT INTO `oc_zone` VALUES ('99', '176', 'Ростовская область', 'ROS', '1');
INSERT INTO `oc_zone` VALUES ('100', '176', 'Рязанская область', 'RYA', '1');
INSERT INTO `oc_zone` VALUES ('101', '176', 'Ямало-Ненецкий АО', 'YAN', '1');
INSERT INTO `oc_zone` VALUES ('102', '176', 'Самарская область', 'SAM', '1');
INSERT INTO `oc_zone` VALUES ('103', '176', 'Республика Мордовия', 'MO', '1');
INSERT INTO `oc_zone` VALUES ('104', '176', 'Саратовская область', 'SAR', '1');
INSERT INTO `oc_zone` VALUES ('105', '176', 'Смоленская область', 'SMO', '1');
INSERT INTO `oc_zone` VALUES ('106', '176', 'Санкт-Петербург', 'SPE', '1');
INSERT INTO `oc_zone` VALUES ('107', '176', 'Ставропольский край', 'STA', '1');
INSERT INTO `oc_zone` VALUES ('108', '176', 'Республика Коми', 'KO', '1');
INSERT INTO `oc_zone` VALUES ('109', '176', 'Тамбовская область', 'TAM', '1');
INSERT INTO `oc_zone` VALUES ('110', '176', 'Томская область', 'TOM', '1');
INSERT INTO `oc_zone` VALUES ('111', '176', 'Тульская область', 'TUL', '1');
INSERT INTO `oc_zone` VALUES ('112', '176', 'Тверская область', 'TVE', '1');
INSERT INTO `oc_zone` VALUES ('113', '176', 'Тюменская область', 'TYU', '1');
INSERT INTO `oc_zone` VALUES ('114', '176', 'Республика Башкортостан', 'BA', '1');
INSERT INTO `oc_zone` VALUES ('115', '176', 'Ульяновская область', 'ULY', '1');
INSERT INTO `oc_zone` VALUES ('116', '176', 'Республика Бурятия', 'BU', '1');
INSERT INTO `oc_zone` VALUES ('117', '176', 'Республика Северная Осетия', 'SE', '1');
INSERT INTO `oc_zone` VALUES ('118', '176', 'Владимирская область', 'VLA', '1');
INSERT INTO `oc_zone` VALUES ('119', '176', 'Приморский край', 'PRI', '1');
INSERT INTO `oc_zone` VALUES ('120', '176', 'Волгоградская область', 'VGG', '1');
INSERT INTO `oc_zone` VALUES ('121', '176', 'Вологодская область', 'VLG', '1');
INSERT INTO `oc_zone` VALUES ('122', '176', 'Воронежская область', 'VOR', '1');
INSERT INTO `oc_zone` VALUES ('123', '176', 'Кировская область', 'KIR', '1');
INSERT INTO `oc_zone` VALUES ('124', '176', 'Республика Саха', 'SA', '1');
INSERT INTO `oc_zone` VALUES ('125', '176', 'Ярославская область', 'YAR', '1');
INSERT INTO `oc_zone` VALUES ('126', '176', 'Свердловская область', 'SVE', '1');
INSERT INTO `oc_zone` VALUES ('127', '176', 'Республика Марий Эл', 'ME', '1');
INSERT INTO `oc_zone` VALUES ('128', '176', 'Республика Крым', 'CR', '1');
INSERT INTO `oc_zone` VALUES ('129', '220', 'Черкассы', 'CK', '1');
INSERT INTO `oc_zone` VALUES ('130', '220', 'Чернигов', 'CH', '1');
INSERT INTO `oc_zone` VALUES ('131', '220', 'Черновцы', 'CV', '1');
INSERT INTO `oc_zone` VALUES ('132', '220', 'Днепропетровск', 'DN', '1');
INSERT INTO `oc_zone` VALUES ('133', '220', 'Донецк', 'DO', '1');
INSERT INTO `oc_zone` VALUES ('134', '220', 'Ивано-Франковск', 'IV', '1');
INSERT INTO `oc_zone` VALUES ('135', '220', 'Харьков', 'KH', '1');
INSERT INTO `oc_zone` VALUES ('136', '220', 'Хмельницкий', 'KM', '1');
INSERT INTO `oc_zone` VALUES ('137', '220', 'Кировоград', 'KR', '1');
INSERT INTO `oc_zone` VALUES ('138', '220', 'Киевская область', 'KV', '1');
INSERT INTO `oc_zone` VALUES ('139', '220', 'Киев', 'KY', '1');
INSERT INTO `oc_zone` VALUES ('140', '220', 'Луганск', 'LU', '1');
INSERT INTO `oc_zone` VALUES ('141', '220', 'Львов', 'LV', '1');
INSERT INTO `oc_zone` VALUES ('142', '220', 'Николаев', 'MY', '1');
INSERT INTO `oc_zone` VALUES ('143', '220', 'Одесса', 'OD', '1');
INSERT INTO `oc_zone` VALUES ('144', '220', 'Полтава', 'PO', '1');
INSERT INTO `oc_zone` VALUES ('145', '220', 'Ровно', 'RI', '1');
INSERT INTO `oc_zone` VALUES ('146', '176', 'Севастополь', 'SE', '1');
INSERT INTO `oc_zone` VALUES ('147', '220', 'Сумы', 'SU', '1');
INSERT INTO `oc_zone` VALUES ('148', '220', 'Тернополь', 'TE', '1');
INSERT INTO `oc_zone` VALUES ('149', '220', 'Винница', 'VI', '1');
INSERT INTO `oc_zone` VALUES ('150', '220', 'Луцк', 'VO', '1');
INSERT INTO `oc_zone` VALUES ('151', '220', 'Ужгород', 'ZK', '1');
INSERT INTO `oc_zone` VALUES ('152', '220', 'Запорожье', 'ZA', '1');
INSERT INTO `oc_zone` VALUES ('153', '220', 'Житомир', 'ZH', '1');
INSERT INTO `oc_zone` VALUES ('154', '220', 'Херсон', 'KE', '1');
INSERT INTO `oc_zone` VALUES ('155', '226', 'Andijon', 'AN', '1');
INSERT INTO `oc_zone` VALUES ('156', '226', 'Buxoro', 'BU', '1');
INSERT INTO `oc_zone` VALUES ('157', '226', 'Farg\'ona', 'FA', '1');
INSERT INTO `oc_zone` VALUES ('158', '226', 'Jizzax', 'JI', '1');
INSERT INTO `oc_zone` VALUES ('159', '226', 'Namangan', 'NG', '1');
INSERT INTO `oc_zone` VALUES ('160', '226', 'Navoiy', 'NW', '1');
INSERT INTO `oc_zone` VALUES ('161', '226', 'Qashqadaryo', 'QA', '1');
INSERT INTO `oc_zone` VALUES ('162', '226', 'Qoraqalpog\'iston Republikasi', 'QR', '1');
INSERT INTO `oc_zone` VALUES ('163', '226', 'Samarqand', 'SA', '1');
INSERT INTO `oc_zone` VALUES ('164', '226', 'Sirdaryo', 'SI', '1');
INSERT INTO `oc_zone` VALUES ('165', '226', 'Surxondaryo', 'SU', '1');
INSERT INTO `oc_zone` VALUES ('166', '226', 'Toshkent City', 'TK', '1');
INSERT INTO `oc_zone` VALUES ('167', '226', 'Toshkent Region', 'TO', '1');
INSERT INTO `oc_zone` VALUES ('168', '226', 'Xorazm', 'XO', '1');

-- ----------------------------
-- Table structure for oc_zone_to_geo_zone
-- ----------------------------
DROP TABLE IF EXISTS `oc_zone_to_geo_zone`;
CREATE TABLE `oc_zone_to_geo_zone` (
  `zone_to_geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `geo_zone_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`zone_to_geo_zone_id`)
) ENGINE=MyISAM AUTO_INCREMENT=111 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_zone_to_geo_zone
-- ----------------------------
INSERT INTO `oc_zone_to_geo_zone` VALUES ('1', '222', '0', '4', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `oc_zone_to_geo_zone` VALUES ('110', '176', '0', '3', '2014-09-09 11:48:13', '0000-00-00 00:00:00');
