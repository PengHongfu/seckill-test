/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50712
Source Host           : localhost:3306
Source Database       : db_miaosha

Target Server Type    : MYSQL
Target Server Version : 50712
File Encoding         : 65001

Date: 2017-06-01 19:39:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_admin`
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `adminId` char(32) NOT NULL COMMENT '管理员主键',
  `adminname` varchar(50) DEFAULT NULL COMMENT '管理员名称',
  `adminpwd` varchar(50) DEFAULT NULL COMMENT '管理员密码',
  PRIMARY KEY (`adminId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of t_admin
-- ----------------------------

-- ----------------------------
-- Table structure for `t_category`
-- ----------------------------
DROP TABLE IF EXISTS `t_category`;
CREATE TABLE `t_category` (
  `cid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `cname` varchar(50) DEFAULT NULL COMMENT '分类名称',
  `cdesc` varchar(100) DEFAULT NULL COMMENT '分类描述',
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=1006 DEFAULT CHARSET=utf8 COMMENT='商品分类表';

-- ----------------------------
-- Records of t_category
-- ----------------------------
INSERT INTO `t_category` VALUES ('1001', '电脑办公', '电脑办公电脑办公电脑办公电脑办公');
INSERT INTO `t_category` VALUES ('1002', '生活电器', '生活电器生活电器生活电器生活电器');
INSERT INTO `t_category` VALUES ('1003', '手机通讯', '手机通讯手机通讯手机通讯手机通讯');
INSERT INTO `t_category` VALUES ('1004', '家居家装', '家居家装家居家装家居家装家居家装');
INSERT INTO `t_category` VALUES ('1005', '经典名著', '经典名著经典名著经典名著经典名著');

-- ----------------------------
-- Table structure for `t_seckill`
-- ----------------------------
DROP TABLE IF EXISTS `t_seckill`;
CREATE TABLE `t_seckill` (
  `seckill_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '商品库存id',
  `sname` varchar(120) DEFAULT NULL COMMENT '商品名称',
  `numbers` int(11) DEFAULT NULL COMMENT '库存数量',
  `start_time` datetime DEFAULT NULL COMMENT '秒杀开启时间',
  `end_time` datetime DEFAULT NULL COMMENT '秒杀结束时间',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `seckill_desc` varchar(120) DEFAULT NULL COMMENT '商品描述',
  `price` decimal(8,2) DEFAULT NULL COMMENT '定价',
  `cid` bigint(20) NOT NULL COMMENT '所属分类id',
  `image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`seckill_id`),
  KEY `cid` (`cid`),
  CONSTRAINT `cid` FOREIGN KEY (`cid`) REFERENCES `t_category` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='秒杀库存表';

-- ----------------------------
-- Records of t_seckill
-- ----------------------------
INSERT INTO `t_seckill` VALUES ('1', '小米(MI)Air 13.3英寸全金属超轻薄笔记本电脑(i5-6200U 8G 256G PCIE固态硬盘 940MX独显 FHD WIN10)银 ', '97', '2017-04-26 11:23:56', '2017-05-28 11:24:15', '2017-04-19 11:28:21', '4.19 10点-4.21 直降100元【i5 独立显卡】全高清窄边框 8G内存 256G固态硬盘 支持SSD硬盘扩容 薄至14.8mm 轻至1.28kg！', '4899.00', '1001', '57e3b072N661cd00d.jpg');
INSERT INTO `t_seckill` VALUES ('2', '【黑色键盘套装】微软（Microsoft）Surface Pro 4（Intel i5 4G内存 128G存储 预装Win10 Office）', '99', '2017-04-30 11:23:56', '2017-05-28 11:24:15', '2017-04-19 23:27:03', '平板新风尚 办公新选择 Surface Pro4 i5 4G+128G 不带笔 黑色键盘套装（键盘以赠品形式发送）', '5899.00', '1001', '58df173eN65d0617a.jpg');
INSERT INTO `t_seckill` VALUES ('3', '精邦 餐桌椅组合一桌四椅餐桌饭桌餐椅圣保罗LS05W01 ', '200', '2017-05-28 12:08:11', '2017-06-03 12:08:15', '2017-04-20 12:08:32', 'A家超级品牌日，自营爆款沙发999元开抢！限量600套，先到先得！', '699.00', '1004', '58dc6762Nd07c3834.jpg');
INSERT INTO `t_seckill` VALUES ('4', '美国西屋（Westinghouse）HS0454 破壁料理机榨汁机料理机家用破壁机原汁机 加热玫瑰金 ', '200', '2017-04-30 12:09:55', '2017-05-28 12:10:00', '2017-04-20 12:10:06', '【掌上秒杀：2080元限量抢，手快有，手慢无】秒完恢复日常价【优惠300元】', '2080.00', '1002', '57511c8eN43552cc3.jpg');
INSERT INTO `t_seckill` VALUES ('5', '博朗（Braun）欧乐B 4000 3D声波智能电动牙刷（4大模式，2刷头，1旅行盒）', '200', '2017-04-29 12:11:52', '2017-06-03 11:11:57', '2017-04-20 12:11:33', '【限量800支，疯抢24小时，抢完即止！】4大清洁模式，欧乐B性价比机皇！', '499.00', '1002', '582e70adN90202cf1.jpg');
INSERT INTO `t_seckill` VALUES ('6', '先锋（Pioneer）SEC-CL52S 入耳式手机耳机 金属腔体 黑色 ', '200', '2017-04-23 12:13:15', '2017-04-30 12:13:22', '2017-04-20 12:13:37', '金属腔体 三键线控 多重工艺打造金属外壳 质感十足 双导气管平衡腔体压力 减少声音失真 8.6mm强磁发声单元 造就强劲低频 ', '169.00', '1003', '58325cd8N3021e2eb.jpg');
INSERT INTO `t_seckill` VALUES ('7', '荣耀 畅玩5X 暗夜灰 电信4G手机 双卡双待 ', '299', '2017-04-23 12:14:31', '2017-05-26 12:14:38', '2017-04-20 12:14:44', '炫酷指纹，3卡槽设计，5.5英寸全高清屏！', '799.00', '1003', '569c7c26N5d48e9b5.jpg');
INSERT INTO `t_seckill` VALUES ('8', '小米（MI）小米电视3S 48英寸 全高清超薄金属机身智能网络液晶平板电视（L48M3-AF）', '200', '2017-05-27 12:15:51', '2017-06-04 12:15:55', '2017-04-20 12:16:01', '尺寸大一点，配置高许多的小米电视4A 49英寸标准版，价格还要便宜一些，你选不选？ ', '2698.00', '1002', '58c260c4Ne3864353.jpg');
INSERT INTO `t_seckill` VALUES ('9', '联想(Lenovo)拯救者R720 15.6英寸游戏笔记本电脑(i7-7700HQ 8G 1T+256G SSD GTX1050Ti 2G IPS 黑) ', '200', '2017-05-28 12:16:40', '2017-06-03 11:16:43', '2017-04-20 12:16:57', '【小新潮7000超窄边框双硬盘轻薄本火热预约中！】【我们的SSD比大多数产品更快一些】GTX1050Ti游戏本就选拯救者！', '7499.00', '1001', '589aec09Nf2f01977.jpg');
INSERT INTO `t_seckill` VALUES ('10', '戴尔DELL灵越游匣15PR-4848B 15.6英寸游戏笔记本电脑(i7-6700HQ 8G 128G+1T GTX960M 4G独显 FHD Win10)黑 ', '199', '2017-05-05 12:17:53', '2017-05-27 12:17:59', '2017-04-20 12:18:08', '8G大内存】 960 4G独显 预装128SSD 双硬盘游戏更劲爽 我们比大多数产品 散热好一些', '6199.00', '1001', '57b2d0fbN410bde9f.jpg');
INSERT INTO `t_seckill` VALUES ('12', '华为手机', '300', '2017-07-19 22:50:43', '2017-09-07 17:20:43', '2017-05-03 22:03:28', '华为手机', '1300.00', '1003', 'F92C91D9536D41488D9036250009AEC1.jpg');

-- ----------------------------
-- Table structure for `t_seckillorder`
-- ----------------------------
DROP TABLE IF EXISTS `t_seckillorder`;
CREATE TABLE `t_seckillorder` (
  `orderId` char(32) NOT NULL COMMENT '秒杀订单主键',
  `seckillId` bigint(20) NOT NULL COMMENT '秒杀商品Id(外键)',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '秒杀订单创建时间',
  `userId` char(32) NOT NULL COMMENT '秒杀的用户id',
  `state` int(11) NOT NULL DEFAULT '0' COMMENT '订单的状态,默认0等待付款，1准备发货，2等待确认，3交易成功，4已取消',
  PRIMARY KEY (`orderId`),
  KEY `seckillId` (`seckillId`),
  KEY `userId` (`userId`),
  CONSTRAINT `seckillId` FOREIGN KEY (`seckillId`) REFERENCES `t_seckill` (`seckill_id`),
  CONSTRAINT `userId` FOREIGN KEY (`userId`) REFERENCES `t_user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_seckillorder
-- ----------------------------
INSERT INTO `t_seckillorder` VALUES ('1D1150E03BE64D30B319FBD9838F8FD8', '1', '2017-05-06 08:29:44', '01', '0');
INSERT INTO `t_seckillorder` VALUES ('283F94FAB663499CBF773215DAE61EF7', '2', '2017-04-22 23:11:36', '50E6525FCF0148ECA611C6400586237A', '4');
INSERT INTO `t_seckillorder` VALUES ('3ED6E3E1A8164472A21BB7968CA1598D', '2', '2017-05-17 18:03:32', 'keke', '0');
INSERT INTO `t_seckillorder` VALUES ('8A3DB79A30DE41A3BB3A1EECE4507591', '7', '2017-04-25 11:49:29', 'keke', '1');
INSERT INTO `t_seckillorder` VALUES ('EC17DF5938074A25A95AFBEAEC7C8B06', '10', '2017-05-24 21:37:39', 'keke', '0');
INSERT INTO `t_seckillorder` VALUES ('ewerwerwerfsf', '4', '2017-04-25 11:49:26', 'keke', '0');
INSERT INTO `t_seckillorder` VALUES ('F3D1DB8D21B640D295D7FF2952BA5B6B', '1', '2017-05-17 18:43:43', 'F5B7C9B8CF06433698A45664063E413D', '0');
INSERT INTO `t_seckillorder` VALUES ('fsdafsadfsdf', '1', '2017-04-24 17:29:39', 'keke', '1');
INSERT INTO `t_seckillorder` VALUES ('ttytytytytutu', '5', '2017-04-21 13:25:06', 'keke', '3');
INSERT INTO `t_seckillorder` VALUES ('uukuykyuk', '9', '2017-04-25 13:24:53', 'keke', '2');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `uid` char(32) NOT NULL COMMENT '用户id',
  `loginname` varchar(50) NOT NULL COMMENT '登录名',
  `loginpass` varchar(50) NOT NULL COMMENT '登录密码',
  `email` varchar(50) NOT NULL COMMENT 'email',
  `phone` varchar(15) DEFAULT NULL COMMENT '电话',
  `address` varchar(50) DEFAULT NULL COMMENT '收货地址',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `loginname` (`loginname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='秒杀用户表';

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('01', 'zhangSan', '123456', '1101451156@qq.com', null, null);
INSERT INTO `t_user` VALUES ('50E6525FCF0148ECA611C6400586237A', '六分司', '345678', '11017722@qq.com', null, null);
INSERT INTO `t_user` VALUES ('F5B7C9B8CF06433698A45664063E413D', 'testuser1', 'ffffff', '1100901909@163.com', '18779167444', '江西省南昌市红谷滩');
INSERT INTO `t_user` VALUES ('keke', 'peng', 'ffffff', '11018777@qq.com', '18778899898', '江西理工大学南昌校区  SSSA');

-- ----------------------------
-- Procedure structure for `excute_test`
-- ----------------------------
DROP PROCEDURE IF EXISTS `excute_test`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `excute_test`(IN `v_seckill_id` bigint,IN `v_kill_time` datetime,OUT `r_result` int)
BEGIN
    DECLARE insert_count INT DEFAULT 0;
    START TRANSACTION;
      UPDATE t_seckill
        SET numbers = numbers - 1
      WHERE seckill_id = v_seckill_id
      AND end_time > v_kill_time
      AND start_time < v_kill_time
      AND numbers > 0;

      SELECT row_count() INTO insert_count;
      IF (insert_count = 0) THEN
        ROLLBACK ;
        SET r_result = -1;
      ELSEIF(insert_count<0) THEN
        ROLLBACK ;
        SET r_result = -2;
      ELSE
        COMMIT ;
        set r_result = 1;
		end if;
  END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `execute_seckill`
-- ----------------------------
DROP PROCEDURE IF EXISTS `execute_seckill`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `execute_seckill`(IN v_seckill_id BIGINT,IN v_phone BIGINT,IN v_kill_time TIMESTAMP,OUT r_result INT)
BEGIN
    DECLARE insert_count INT DEFAULT 0;
    START TRANSACTION;

    INSERT IGNORE INTO success_killed
      (seckill_id,user_phone,create_time)
      VALUES (v_seckill_id,v_phone,v_kill_time);

    SELECT row_count() INTO insert_count;
    IF (insert_count = 0) THEN
      ROLLBACK ;
      SET r_result = -1;
    ELSEIF(insert_count<0) THEN
      ROLLBACK ;
      SET r_result = -2;
    ELSE
      UPDATE seckill
        SET number = number - 1
      WHERE seckill_id = v_seckill_id
      AND end_time > v_kill_time
      AND start_time < v_kill_time
      AND number > 0;
      SELECT row_count() INTO insert_count;
      IF (insert_count = 0) THEN
        ROLLBACK ;
        SET r_result = -1;
      ELSEIF(insert_count<0) THEN
        ROLLBACK ;
        SET r_result = -2;
      ELSE
        COMMIT ;
        set r_result = 1;
      END IF ;
    END IF ;
  END
;;
DELIMITER ;
