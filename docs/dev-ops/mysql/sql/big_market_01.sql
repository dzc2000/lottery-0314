# ************************************************************
# Sequel Ace SQL dump
# 版本号： 20050
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# 主机: 127.0.0.1 (MySQL 5.6.39)
# 数据库: big_market_01
# 生成时间: 2024-04-13 07:28:17 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE database if NOT EXISTS `big_market_01` default character set utf8mb4;
use `big_market_01`;

# 转储表 raffle_activity_account
# ------------------------------------------------------------

DROP TABLE IF EXISTS `raffle_activity_account`;

CREATE TABLE `raffle_activity_account` (
                                           `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                           `user_id` varchar(32) NOT NULL COMMENT '用户ID',
                                           `activity_id` bigint(12) NOT NULL COMMENT '活动ID',
                                           `total_count` int(8) NOT NULL COMMENT '总次数',
                                           `total_count_surplus` int(8) NOT NULL COMMENT '总次数-剩余',
                                           `day_count` int(8) NOT NULL COMMENT '日次数',
                                           `day_count_surplus` int(8) NOT NULL COMMENT '日次数-剩余',
                                           `month_count` int(8) NOT NULL COMMENT '月次数',
                                           `month_count_surplus` int(8) NOT NULL COMMENT '月次数-剩余',
                                           `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                           `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                           PRIMARY KEY (`id`),
                                           UNIQUE KEY `uq_user_id_activity_id` (`user_id`,`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='抽奖活动账户表';

LOCK TABLES `raffle_activity_account` WRITE;
/*!40000 ALTER TABLE `raffle_activity_account` DISABLE KEYS */;

INSERT INTO `raffle_activity_account` (`id`, `user_id`, `activity_id`, `total_count`, `total_count_surplus`, `day_count`, `day_count_surplus`, `month_count`, `month_count_surplus`, `create_time`, `update_time`)
VALUES
    (3,'dzc',100301,45,17,45,18,45,18,'2024-03-23 16:38:57','2024-04-13 15:25:13');

/*!40000 ALTER TABLE `raffle_activity_account` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 raffle_activity_account_day
# ------------------------------------------------------------

DROP TABLE IF EXISTS `raffle_activity_account_day`;

CREATE TABLE `raffle_activity_account_day` (
                                               `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                               `user_id` varchar(32) NOT NULL COMMENT '用户ID',
                                               `activity_id` bigint(12) NOT NULL COMMENT '活动ID',
                                               `day` varchar(10) NOT NULL COMMENT '日期（yyyy-mm-dd）',
                                               `day_count` int(8) NOT NULL COMMENT '日次数',
                                               `day_count_surplus` int(8) NOT NULL COMMENT '日次数-剩余',
                                               `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                               `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                               PRIMARY KEY (`id`),
                                               UNIQUE KEY `uq_user_id_activity_id_day` (`user_id`,`activity_id`,`day`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='抽奖活动账户表-日次数';

LOCK TABLES `raffle_activity_account_day` WRITE;
/*!40000 ALTER TABLE `raffle_activity_account_day` DISABLE KEYS */;

INSERT INTO `raffle_activity_account_day` (`id`, `user_id`, `activity_id`, `day`, `day_count`, `day_count_surplus`, `create_time`, `update_time`)
VALUES
    (2,'dzc',100301,'2024-04-05',45,44,'2024-04-05 17:10:31','2024-04-05 17:10:31'),
    (3,'dzc',100301,'2024-04-08',45,44,'2024-04-08 22:52:47','2024-04-08 22:52:47'),
    (4,'dzc',100301,'2024-04-13',45,23,'2024-04-13 11:44:10','2024-04-13 15:25:13');

/*!40000 ALTER TABLE `raffle_activity_account_day` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 raffle_activity_account_month
# ------------------------------------------------------------

DROP TABLE IF EXISTS `raffle_activity_account_month`;

CREATE TABLE `raffle_activity_account_month` (
                                                 `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                                 `user_id` varchar(32) NOT NULL COMMENT '用户ID',
                                                 `activity_id` bigint(12) NOT NULL COMMENT '活动ID',
                                                 `month` varchar(7) NOT NULL COMMENT '月（yyyy-mm）',
                                                 `month_count` int(8) NOT NULL COMMENT '月次数',
                                                 `month_count_surplus` int(8) NOT NULL COMMENT '月次数-剩余',
                                                 `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                                 `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                                 PRIMARY KEY (`id`),
                                                 UNIQUE KEY `uq_user_id_activity_id_month` (`user_id`,`activity_id`,`month`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='抽奖活动账户表-月次数';

LOCK TABLES `raffle_activity_account_month` WRITE;
/*!40000 ALTER TABLE `raffle_activity_account_month` DISABLE KEYS */;

INSERT INTO `raffle_activity_account_month` (`id`, `user_id`, `activity_id`, `month`, `month_count`, `month_count_surplus`, `create_time`, `update_time`)
VALUES
    (5,'dzc',100301,'2024-04',45,17,'2024-04-05 17:10:31','2024-04-13 15:25:13');

/*!40000 ALTER TABLE `raffle_activity_account_month` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 raffle_activity_order_000
# ------------------------------------------------------------

DROP TABLE IF EXISTS `raffle_activity_order_000`;

CREATE TABLE `raffle_activity_order_000` (
                                             `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                             `user_id` varchar(32) NOT NULL COMMENT '用户ID',
                                             `sku` bigint(12) NOT NULL COMMENT '商品sku',
                                             `activity_id` bigint(12) NOT NULL COMMENT '活动ID',
                                             `activity_name` varchar(64) NOT NULL COMMENT '活动名称',
                                             `strategy_id` bigint(8) NOT NULL COMMENT '抽奖策略ID',
                                             `order_id` varchar(12) NOT NULL COMMENT '订单ID',
                                             `order_time` datetime NOT NULL COMMENT '下单时间',
                                             `total_count` int(8) NOT NULL COMMENT '总次数',
                                             `day_count` int(8) NOT NULL COMMENT '日次数',
                                             `month_count` int(8) NOT NULL COMMENT '月次数',
                                             `state` varchar(16) NOT NULL DEFAULT 'complete' COMMENT '订单状态（complete）',
                                             `out_business_no` varchar(64) NOT NULL COMMENT '业务仿重ID - 外部透传的，确保幂等',
                                             `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                             `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
                                             PRIMARY KEY (`id`),
                                             UNIQUE KEY `uq_order_id` (`order_id`),
                                             UNIQUE KEY `uq_out_business_no` (`out_business_no`),
                                             KEY `idx_user_id_activity_id` (`user_id`,`activity_id`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='抽奖活动单';



# 转储表 raffle_activity_order_001
# ------------------------------------------------------------

DROP TABLE IF EXISTS `raffle_activity_order_001`;

CREATE TABLE `raffle_activity_order_001` (
                                             `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                             `user_id` varchar(32) NOT NULL COMMENT '用户ID',
                                             `sku` bigint(12) NOT NULL COMMENT '商品sku',
                                             `activity_id` bigint(12) NOT NULL COMMENT '活动ID',
                                             `activity_name` varchar(64) NOT NULL COMMENT '活动名称',
                                             `strategy_id` bigint(8) NOT NULL COMMENT '抽奖策略ID',
                                             `order_id` varchar(12) NOT NULL COMMENT '订单ID',
                                             `order_time` datetime NOT NULL COMMENT '下单时间',
                                             `total_count` int(8) NOT NULL COMMENT '总次数',
                                             `day_count` int(8) NOT NULL COMMENT '日次数',
                                             `month_count` int(8) NOT NULL COMMENT '月次数',
                                             `state` varchar(16) NOT NULL DEFAULT 'complete' COMMENT '订单状态（complete）',
                                             `out_business_no` varchar(64) NOT NULL COMMENT '业务仿重ID - 外部透传的，确保幂等',
                                             `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                             `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
                                             PRIMARY KEY (`id`),
                                             UNIQUE KEY `uq_order_id` (`order_id`),
                                             UNIQUE KEY `uq_out_business_no` (`out_business_no`),
                                             KEY `idx_user_id_activity_id` (`user_id`,`activity_id`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='抽奖活动单';

LOCK TABLES `raffle_activity_order_001` WRITE;
/*!40000 ALTER TABLE `raffle_activity_order_001` DISABLE KEYS */;

INSERT INTO `raffle_activity_order_001` (`id`, `user_id`, `sku`, `activity_id`, `activity_name`, `strategy_id`, `order_id`, `order_time`, `total_count`, `day_count`, `month_count`, `state`, `out_business_no`, `create_time`, `update_time`)
VALUES
    (10,'dzc',9011,100301,'测试活动',100006,'973296627434','2024-03-23 08:38:58',1,1,1,'completed','700091009111','2024-03-23 16:38:57','2024-03-23 16:38:57'),
    (11,'dzc',9011,100301,'测试活动',100006,'659722993182','2024-03-23 09:38:54',1,1,1,'completed','700091009112','2024-03-23 17:38:54','2024-03-23 17:38:54'),
    (13,'dzc',9011,100301,'测试活动',100006,'773767968094','2024-03-23 09:40:11',1,1,1,'completed','700091009113','2024-03-23 17:40:10','2024-03-23 17:40:10'),
    (14,'dzc',9011,100301,'测试活动',100006,'977898032977','2024-03-30 04:13:20',1,1,1,'completed','562827683573','2024-03-30 12:13:20','2024-03-30 12:13:20'),
    (15,'dzc',9011,100301,'测试活动',100006,'981492025457','2024-03-30 05:17:51',1,1,1,'completed','827130794336','2024-03-30 13:17:51','2024-03-30 13:17:51'),
    (16,'dzc',9011,100301,'测试活动',100006,'119662227336','2024-03-30 05:17:51',1,1,1,'completed','150844059982','2024-03-30 13:17:51','2024-03-30 13:17:51'),
    (17,'dzc',9011,100301,'测试活动',100006,'690133201288','2024-03-30 05:33:39',1,1,1,'completed','953370122326','2024-03-30 13:33:39','2024-03-30 13:33:39'),
    (18,'dzc',9011,100301,'测试活动',100006,'593200667289','2024-03-30 05:33:39',1,1,1,'completed','111390727659','2024-03-30 13:33:39','2024-03-30 13:33:39'),
    (19,'dzc',9011,100301,'测试活动',100006,'980711076393','2024-03-30 05:33:39',1,1,1,'completed','039423474452','2024-03-30 13:33:39','2024-03-30 13:33:39'),
    (20,'dzc',9011,100301,'测试活动',100006,'551375935033','2024-03-30 05:33:39',1,1,1,'completed','280668320055','2024-03-30 13:33:39','2024-03-30 13:33:39'),
    (21,'dzc',9011,100301,'测试活动',100006,'716528762190','2024-03-30 05:33:39',1,1,1,'completed','330472003431','2024-03-30 13:33:39','2024-03-30 13:33:39'),
    (22,'dzc',9011,100301,'测试活动',100006,'644880195681','2024-03-30 05:33:39',1,1,1,'completed','896655771302','2024-03-30 13:33:39','2024-03-30 13:33:39'),
    (23,'dzc',9011,100301,'测试活动',100006,'918009421723','2024-03-30 05:33:39',1,1,1,'completed','223114193931','2024-03-30 13:33:39','2024-03-30 13:33:39'),
    (24,'dzc',9011,100301,'测试活动',100006,'414038400484','2024-03-30 05:33:39',1,1,1,'completed','669801912616','2024-03-30 13:33:39','2024-03-30 13:33:39'),
    (25,'dzc',9011,100301,'测试活动',100006,'819052152409','2024-03-30 05:33:40',1,1,1,'completed','968823148813','2024-03-30 13:33:39','2024-03-30 13:33:39'),
    (26,'dzc',9011,100301,'测试活动',100006,'013685589273','2024-03-30 05:33:40',1,1,1,'completed','281985691959','2024-03-30 13:33:39','2024-03-30 13:33:39'),
    (27,'dzc',9011,100301,'测试活动',100006,'694790983278','2024-03-30 05:33:40',1,1,1,'completed','812013952722','2024-03-30 13:33:39','2024-03-30 13:33:39'),
    (28,'dzc',9011,100301,'测试活动',100006,'601285862715','2024-03-30 05:33:40',1,1,1,'completed','102122841078','2024-03-30 13:33:39','2024-03-30 13:33:39'),
    (29,'dzc',9011,100301,'测试活动',100006,'278549779124','2024-03-30 05:33:40',1,1,1,'completed','795697718772','2024-03-30 13:33:39','2024-03-30 13:33:39'),
    (30,'dzc',9011,100301,'测试活动',100006,'867889977246','2024-03-30 05:33:40',1,1,1,'completed','419196278242','2024-03-30 13:33:39','2024-03-30 13:33:39'),
    (31,'dzc',9011,100301,'测试活动',100006,'270946272407','2024-03-30 05:33:40',1,1,1,'completed','297043861965','2024-03-30 13:33:39','2024-03-30 13:33:39'),
    (32,'dzc',9011,100301,'测试活动',100006,'798392711746','2024-03-30 05:33:40',1,1,1,'completed','721157339512','2024-03-30 13:33:39','2024-03-30 13:33:39'),
    (33,'dzc',9011,100301,'测试活动',100006,'037305996439','2024-03-30 05:33:40',1,1,1,'completed','088008719855','2024-03-30 13:33:39','2024-03-30 13:33:39'),
    (34,'dzc',9011,100301,'测试活动',100006,'015056893123','2024-03-30 05:33:40',1,1,1,'completed','885793880817','2024-03-30 13:33:39','2024-03-30 13:33:39'),
    (35,'dzc',9011,100301,'测试活动',100006,'422734098553','2024-03-30 05:33:40',1,1,1,'completed','048066377262','2024-03-30 13:33:39','2024-03-30 13:33:39'),
    (36,'dzc',9011,100301,'测试活动',100006,'125534021547','2024-03-30 09:10:06',1,1,1,'completed','237913144976','2024-03-30 17:10:05','2024-03-30 17:10:05'),
    (37,'dzc',9011,100301,'测试活动',100006,'906577205018','2024-03-30 09:10:06',1,1,1,'completed','257763123780','2024-03-30 17:10:05','2024-03-30 17:10:05'),
    (38,'dzc',9011,100301,'测试活动',100006,'577878467308','2024-03-30 09:10:06',1,1,1,'completed','690370155629','2024-03-30 17:10:06','2024-03-30 17:10:06'),
    (39,'dzc',9011,100301,'测试活动',100006,'130934158588','2024-03-30 09:10:06',1,1,1,'completed','864303749107','2024-03-30 17:10:06','2024-03-30 17:10:06'),
    (40,'dzc',9011,100301,'测试活动',100006,'484575318240','2024-03-30 09:10:06',1,1,1,'completed','355946107906','2024-03-30 17:10:06','2024-03-30 17:10:06'),
    (41,'dzc',9011,100301,'测试活动',100006,'334219563572','2024-03-30 09:10:06',1,1,1,'completed','629679608889','2024-03-30 17:10:06','2024-03-30 17:10:06'),
    (42,'dzc',9011,100301,'测试活动',100006,'905424061364','2024-03-30 09:10:06',1,1,1,'completed','766840362369','2024-03-30 17:10:06','2024-03-30 17:10:06'),
    (43,'dzc',9011,100301,'测试活动',100006,'081184848765','2024-03-30 09:10:06',1,1,1,'completed','805402859227','2024-03-30 17:10:06','2024-03-30 17:10:06'),
    (44,'dzc',9011,100301,'测试活动',100006,'245273095853','2024-03-30 09:10:06',1,1,1,'completed','333924242550','2024-03-30 17:10:06','2024-03-30 17:10:06'),
    (45,'dzc',9011,100301,'测试活动',100006,'645786614176','2024-03-30 09:10:06',1,1,1,'completed','709012965465','2024-03-30 17:10:06','2024-03-30 17:10:06'),
    (46,'dzc',9011,100301,'测试活动',100006,'976098448519','2024-03-30 09:10:06',1,1,1,'completed','076464685314','2024-03-30 17:10:06','2024-03-30 17:10:06'),
    (47,'dzc',9011,100301,'测试活动',100006,'359533807959','2024-03-30 09:10:06',1,1,1,'completed','501769140520','2024-03-30 17:10:06','2024-03-30 17:10:06'),
    (48,'dzc',9011,100301,'测试活动',100006,'069825222776','2024-03-30 09:10:06',1,1,1,'completed','362857642896','2024-03-30 17:10:06','2024-03-30 17:10:06'),
    (49,'dzc',9011,100301,'测试活动',100006,'793595913277','2024-03-30 09:10:06',1,1,1,'completed','886499146967','2024-03-30 17:10:06','2024-03-30 17:10:06'),
    (50,'dzc',9011,100301,'测试活动',100006,'591290337369','2024-03-30 09:10:06',1,1,1,'completed','756466322485','2024-03-30 17:10:06','2024-03-30 17:10:06'),
    (51,'dzc',9011,100301,'测试活动',100006,'216203170946','2024-03-30 09:10:06',1,1,1,'completed','616831586240','2024-03-30 17:10:06','2024-03-30 17:10:06'),
    (52,'dzc',9011,100301,'测试活动',100006,'331973376483','2024-03-30 09:10:06',1,1,1,'completed','809200206672','2024-03-30 17:10:06','2024-03-30 17:10:06'),
    (53,'dzc',9011,100301,'测试活动',100006,'358968919391','2024-03-30 09:10:06',1,1,1,'completed','619112026689','2024-03-30 17:10:06','2024-03-30 17:10:06'),
    (54,'dzc',9011,100301,'测试活动',100006,'094263379883','2024-03-30 09:10:06',1,1,1,'completed','746237303851','2024-03-30 17:10:06','2024-03-30 17:10:06'),
    (56,'dzc',9011,100301,'测试活动',100006,'381900087970','2024-04-05 06:19:30',1,1,1,'completed','700091009119','2024-04-05 14:19:30','2024-04-05 14:19:30');

/*!40000 ALTER TABLE `raffle_activity_order_001` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 raffle_activity_order_002
# ------------------------------------------------------------

DROP TABLE IF EXISTS `raffle_activity_order_002`;

CREATE TABLE `raffle_activity_order_002` (
                                             `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                             `user_id` varchar(32) NOT NULL COMMENT '用户ID',
                                             `sku` bigint(12) NOT NULL COMMENT '商品sku',
                                             `activity_id` bigint(12) NOT NULL COMMENT '活动ID',
                                             `activity_name` varchar(64) NOT NULL COMMENT '活动名称',
                                             `strategy_id` bigint(8) NOT NULL COMMENT '抽奖策略ID',
                                             `order_id` varchar(12) NOT NULL COMMENT '订单ID',
                                             `order_time` datetime NOT NULL COMMENT '下单时间',
                                             `total_count` int(8) NOT NULL COMMENT '总次数',
                                             `day_count` int(8) NOT NULL COMMENT '日次数',
                                             `month_count` int(8) NOT NULL COMMENT '月次数',
                                             `state` varchar(16) NOT NULL DEFAULT 'complete' COMMENT '订单状态（complete）',
                                             `out_business_no` varchar(64) NOT NULL COMMENT '业务仿重ID - 外部透传的，确保幂等',
                                             `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                             `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
                                             PRIMARY KEY (`id`),
                                             UNIQUE KEY `uq_order_id` (`order_id`),
                                             UNIQUE KEY `uq_out_business_no` (`out_business_no`),
                                             KEY `idx_user_id_activity_id` (`user_id`,`activity_id`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='抽奖活动单';



# 转储表 raffle_activity_order_003
# ------------------------------------------------------------

DROP TABLE IF EXISTS `raffle_activity_order_003`;

CREATE TABLE `raffle_activity_order_003` (
                                             `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                             `user_id` varchar(32) NOT NULL COMMENT '用户ID',
                                             `sku` bigint(12) NOT NULL COMMENT '商品sku',
                                             `activity_id` bigint(12) NOT NULL COMMENT '活动ID',
                                             `activity_name` varchar(64) NOT NULL COMMENT '活动名称',
                                             `strategy_id` bigint(8) NOT NULL COMMENT '抽奖策略ID',
                                             `order_id` varchar(12) NOT NULL COMMENT '订单ID',
                                             `order_time` datetime NOT NULL COMMENT '下单时间',
                                             `total_count` int(8) NOT NULL COMMENT '总次数',
                                             `day_count` int(8) NOT NULL COMMENT '日次数',
                                             `month_count` int(8) NOT NULL COMMENT '月次数',
                                             `state` varchar(16) NOT NULL DEFAULT 'complete' COMMENT '订单状态（complete）',
                                             `out_business_no` varchar(64) NOT NULL COMMENT '业务仿重ID - 外部透传的，确保幂等',
                                             `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                             `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
                                             PRIMARY KEY (`id`),
                                             UNIQUE KEY `uq_order_id` (`order_id`),
                                             UNIQUE KEY `uq_out_business_no` (`out_business_no`),
                                             KEY `idx_user_id_activity_id` (`user_id`,`activity_id`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='抽奖活动单';



# 转储表 task
# ------------------------------------------------------------

DROP TABLE IF EXISTS `task`;

CREATE TABLE `task` (
                        `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                        `user_id` varchar(32) NOT NULL COMMENT '用户ID',
                        `topic` varchar(32) NOT NULL COMMENT '消息主题',
                        `message_id` varchar(11) DEFAULT NULL COMMENT '消息编号',
                        `message` varchar(512) NOT NULL COMMENT '消息主体',
                        `state` varchar(16) NOT NULL DEFAULT 'create' COMMENT '任务状态；create-创建、completed-完成、fail-失败',
                        `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                        `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                        PRIMARY KEY (`id`),
                        UNIQUE KEY `uq_message_id` (`message_id`),
                        KEY `idx_state` (`state`),
                        KEY `idx_create_time` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='任务表，发送MQ';

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;

INSERT INTO `task` (`id`, `user_id`, `topic`, `message_id`, `message`, `state`, `create_time`, `update_time`)
VALUES
    (1,'dzc','send_award','23913710462','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"dzc\"},\"id\":\"23913710462\",\"timestamp\":1712374909975}','completed','2024-04-06 11:41:50','2024-04-06 12:14:50'),
    (2,'dzc','send_award','33004806135','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"dzc\"},\"id\":\"33004806135\",\"timestamp\":1712375273609}','completed','2024-04-06 11:47:54','2024-04-06 12:14:50'),
    (3,'dzc','send_award','61315401992','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"dzc\"},\"id\":\"61315401992\",\"timestamp\":1712377009778}','completed','2024-04-06 12:16:50','2024-04-06 12:16:50'),
    (4,'dzc','send_award','74920280321','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"dzc\"},\"id\":\"74920280321\",\"timestamp\":1712377010878}','completed','2024-04-06 12:16:50','2024-04-06 12:16:50'),
    (5,'dzc','send_award','71692388884','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"dzc\"},\"id\":\"71692388884\",\"timestamp\":1712377011390}','completed','2024-04-06 12:16:51','2024-04-06 12:16:51'),
    (6,'dzc','send_award','11524874230','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"dzc\"},\"id\":\"11524874230\",\"timestamp\":1712377011913}','completed','2024-04-06 12:16:51','2024-04-06 12:16:51'),
    (7,'dzc','send_award','39972412889','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"dzc\"},\"id\":\"39972412889\",\"timestamp\":1712377012434}','completed','2024-04-06 12:16:52','2024-04-06 12:16:52'),
    (8,'dzc','send_award','79019640497','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"dzc\"},\"id\":\"79019640497\",\"timestamp\":1712377012955}','completed','2024-04-06 12:16:52','2024-04-06 12:16:52'),
    (9,'dzc','send_award','97077031398','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"dzc\"},\"id\":\"97077031398\",\"timestamp\":1712377013498}','completed','2024-04-06 12:16:53','2024-04-06 12:16:53'),
    (10,'dzc','send_award','08720582836','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"dzc\"},\"id\":\"08720582836\",\"timestamp\":1712377014017}','completed','2024-04-06 12:16:54','2024-04-06 12:16:54'),
    (11,'dzc','send_award','60787815183','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"dzc\"},\"id\":\"60787815183\",\"timestamp\":1712377014529}','completed','2024-04-06 12:16:54','2024-04-06 12:16:54'),
    (12,'dzc','send_award','97145040946','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"dzc\"},\"id\":\"97145040946\",\"timestamp\":1712377015040}','completed','2024-04-06 12:16:55','2024-04-06 12:16:55'),
    (13,'dzc','send_award','40165031868','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"dzc\"},\"id\":\"40165031868\",\"timestamp\":1712377015553}','completed','2024-04-06 12:16:55','2024-04-06 12:16:55'),
    (14,'dzc','send_award','31142176572','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"dzc\"},\"id\":\"31142176572\",\"timestamp\":1712377016066}','completed','2024-04-06 12:16:56','2024-04-06 12:16:56'),
    (15,'dzc','send_award','54723488249','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"dzc\"},\"id\":\"54723488249\",\"timestamp\":1712377016577}','completed','2024-04-06 12:16:56','2024-04-06 12:16:56'),
    (16,'dzc','send_award','94553316274','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"dzc\"},\"id\":\"94553316274\",\"timestamp\":1712377017090}','completed','2024-04-06 12:16:57','2024-04-06 16:07:00'),
    (17,'dzc','send_award','47638237311','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"dzc\"},\"id\":\"47638237311\",\"timestamp\":1712377017601}','completed','2024-04-06 12:16:57','2024-04-06 16:07:00'),
    (18,'dzc','send_award','08472548108','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"dzc\"},\"id\":\"08472548108\",\"timestamp\":1712377018112}','completed','2024-04-06 12:16:58','2024-04-06 16:07:00'),
    (19,'dzc','send_award','01704262897','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"dzc\"},\"id\":\"01704262897\",\"timestamp\":1712391038041}','completed','2024-04-06 16:10:38','2024-04-06 16:10:38'),
    (20,'dzc','send_award','96818112357','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"dzc\"},\"id\":\"96818112357\",\"timestamp\":1712391039234}','completed','2024-04-06 16:10:39','2024-04-06 16:10:39'),
    (21,'dzc','send_award','39815817631','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"dzc\"},\"id\":\"39815817631\",\"timestamp\":1712391039751}','completed','2024-04-06 16:10:39','2024-04-06 16:10:39'),
    (22,'dzc','send_award','44228382875','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"dzc\"},\"id\":\"44228382875\",\"timestamp\":1712391040268}','completed','2024-04-06 16:10:40','2024-04-06 16:10:40'),
    (23,'dzc','send_award','61240314870','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"dzc\"},\"id\":\"61240314870\",\"timestamp\":1712391040784}','completed','2024-04-06 16:10:40','2024-04-06 16:10:40'),
    (24,'dzc','send_award','30911821347','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"dzc\"},\"id\":\"30911821347\",\"timestamp\":1712391041333}','completed','2024-04-06 16:10:41','2024-04-06 16:10:41'),
    (25,'dzc','send_award','41575602711','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"dzc\"},\"id\":\"41575602711\",\"timestamp\":1712391041849}','completed','2024-04-06 16:10:41','2024-04-06 16:10:41'),
    (26,'dzc','send_award','72379603310','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"dzc\"},\"id\":\"72379603310\",\"timestamp\":1712391042361}','completed','2024-04-06 16:10:42','2024-04-06 16:10:42'),
    (27,'dzc','send_award','51671684313','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"dzc\"},\"id\":\"51671684313\",\"timestamp\":1712391042875}','completed','2024-04-06 16:10:42','2024-04-06 16:10:42'),
    (28,'dzc','send_award','11840468669','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"dzc\"},\"id\":\"11840468669\",\"timestamp\":1712391043390}','completed','2024-04-06 16:10:43','2024-04-06 16:10:43'),
    (29,'dzc','send_award','18467905170','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"dzc\"},\"id\":\"18467905170\",\"timestamp\":1712391043908}','completed','2024-04-06 16:10:43','2024-04-06 16:10:43'),
    (30,'dzc','send_award','33233781451','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"dzc\"},\"id\":\"33233781451\",\"timestamp\":1712391044424}','completed','2024-04-06 16:10:44','2024-04-06 16:10:44'),
    (31,'dzc','send_award','09679212052','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"dzc\"},\"id\":\"09679212052\",\"timestamp\":1712391044938}','completed','2024-04-06 16:10:44','2024-04-06 16:10:44'),
    (32,'dzc','send_award','96862889309','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"dzc\"},\"id\":\"96862889309\",\"timestamp\":1712391045450}','completed','2024-04-06 16:10:45','2024-04-06 16:10:45'),
    (33,'dzc','send_award','69912628282','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"dzc\"},\"id\":\"69912628282\",\"timestamp\":1712391045962}','completed','2024-04-06 16:10:45','2024-04-06 16:10:45'),
    (34,'dzc','send_award','26021447219','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"dzc\"},\"id\":\"26021447219\",\"timestamp\":1712391046477}','completed','2024-04-06 16:10:46','2024-04-13 10:48:45'),
    (35,'dzc','send_award','29510804265','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"dzc\"},\"id\":\"29510804265\",\"timestamp\":1712391047005}','completed','2024-04-06 16:10:47','2024-04-13 10:48:45'),
    (36,'dzc','send_award','99669876677','{\"data\":{\"awardId\":107,\"awardTitle\":\"2等奖\",\"userId\":\"dzc\"},\"id\":\"99669876677\",\"timestamp\":1712979841591}','completed','2024-04-13 11:44:01','2024-04-13 11:44:01'),
    (37,'dzc','send_award','13183725005','{\"data\":{\"awardId\":103,\"awardTitle\":\"6等奖\",\"userId\":\"dzc\"},\"id\":\"13183725005\",\"timestamp\":1712979850853}','completed','2024-04-13 11:44:10','2024-04-13 11:44:10'),
    (38,'dzc','send_award','13436201468','{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"dzc\"},\"id\":\"13436201468\",\"timestamp\":1712979854073}','completed','2024-04-13 11:44:14','2024-04-13 11:44:14'),
    (39,'dzc','send_award','89567645271','{\"data\":{\"awardId\":106,\"awardTitle\":\"3等奖\",\"userId\":\"dzc\"},\"id\":\"89567645271\",\"timestamp\":1712979855601}','completed','2024-04-13 11:44:15','2024-04-13 11:44:15'),
    (40,'dzc','send_award','00308200403','{\"data\":{\"awardId\":106,\"awardTitle\":\"3等奖\",\"userId\":\"dzc\"},\"id\":\"00308200403\",\"timestamp\":1712979856602}','completed','2024-04-13 11:44:16','2024-04-13 11:44:16'),
    (41,'dzc','send_award','70460061560','{\"data\":{\"awardId\":104,\"awardTitle\":\"5等奖\",\"userId\":\"dzc\"},\"id\":\"70460061560\",\"timestamp\":1712979857586}','completed','2024-04-13 11:44:17','2024-04-13 11:44:17'),
    (42,'dzc','send_award','03493035635','{\"data\":{\"awardId\":102,\"awardTitle\":\"7等奖\",\"userId\":\"dzc\"},\"id\":\"03493035635\",\"timestamp\":1712979858714}','completed','2024-04-13 11:44:18','2024-04-13 11:44:18'),
    (43,'dzc','send_award','22062172114','{\"data\":{\"awardId\":103,\"awardTitle\":\"6等奖\",\"userId\":\"dzc\"},\"id\":\"22062172114\",\"timestamp\":1712979929672}','completed','2024-04-13 11:45:29','2024-04-13 11:45:29'),
    (44,'dzc','send_award','75973092346','{\"data\":{\"awardId\":102,\"awardTitle\":\"7等奖\",\"userId\":\"dzc\"},\"id\":\"75973092346\",\"timestamp\":1712979930723}','completed','2024-04-13 11:45:30','2024-04-13 11:45:30'),
    (45,'dzc','send_award','32769685487','{\"data\":{\"awardId\":102,\"awardTitle\":\"7等奖\",\"userId\":\"dzc\"},\"id\":\"32769685487\",\"timestamp\":1712981693149}','completed','2024-04-13 12:14:53','2024-04-13 12:14:53'),
    (46,'dzc','send_award','85144595338','{\"data\":{\"awardId\":104,\"awardTitle\":\"5等奖\",\"userId\":\"dzc\"},\"id\":\"85144595338\",\"timestamp\":1712981853669}','completed','2024-04-13 12:17:33','2024-04-13 12:17:33'),
    (47,'dzc','send_award','44874364790','{\"data\":{\"awardId\":103,\"awardTitle\":\"6等奖\",\"userId\":\"dzc\"},\"id\":\"44874364790\",\"timestamp\":1712981896942}','completed','2024-04-13 12:18:16','2024-04-13 12:18:16'),
    (48,'dzc','send_award','85399883630','{\"data\":{\"awardId\":103,\"awardTitle\":\"6等奖\",\"userId\":\"dzc\"},\"id\":\"85399883630\",\"timestamp\":1712981903339}','completed','2024-04-13 12:18:23','2024-04-13 12:18:23'),
    (49,'dzc','send_award','29729581514','{\"data\":{\"awardId\":104,\"awardTitle\":\"5等奖\",\"userId\":\"dzc\"},\"id\":\"29729581514\",\"timestamp\":1712981904841}','completed','2024-04-13 12:18:24','2024-04-13 12:18:24'),
    (50,'dzc','send_award','74718298956','{\"data\":{\"awardId\":105,\"awardTitle\":\"4等奖\",\"userId\":\"dzc\"},\"id\":\"74718298956\",\"timestamp\":1712981905797}','completed','2024-04-13 12:18:25','2024-04-13 12:18:25'),
    (51,'dzc','send_award','50114477022','{\"data\":{\"awardId\":107,\"awardTitle\":\"2等奖\",\"userId\":\"dzc\"},\"id\":\"50114477022\",\"timestamp\":1712981916880}','completed','2024-04-13 12:18:36','2024-04-13 12:18:36'),
    (52,'dzc','send_award','28956245329','{\"data\":{\"awardId\":102,\"awardTitle\":\"7等奖\",\"userId\":\"dzc\"},\"id\":\"28956245329\",\"timestamp\":1712982007542}','completed','2024-04-13 12:20:07','2024-04-13 12:20:07'),
    (53,'dzc','send_award','99592907656','{\"data\":{\"awardId\":104,\"awardTitle\":\"5等奖\",\"userId\":\"dzc\"},\"id\":\"99592907656\",\"timestamp\":1712982009729}','completed','2024-04-13 12:20:09','2024-04-13 12:20:09'),
    (54,'dzc','send_award','19525539782','{\"data\":{\"awardId\":104,\"awardTitle\":\"5等奖\",\"userId\":\"dzc\"},\"id\":\"19525539782\",\"timestamp\":1712982013711}','completed','2024-04-13 12:20:13','2024-04-13 12:20:13'),
    (55,'dzc','send_award','47878047199','{\"data\":{\"awardId\":105,\"awardTitle\":\"4等奖\",\"userId\":\"dzc\"},\"id\":\"47878047199\",\"timestamp\":1712982014913}','completed','2024-04-13 12:20:14','2024-04-13 12:20:14'),
    (56,'dzc','send_award','27264311844','{\"data\":{\"awardId\":102,\"awardTitle\":\"7等奖\",\"userId\":\"dzc\"},\"id\":\"27264311844\",\"timestamp\":1712982016134}','completed','2024-04-13 12:20:16','2024-04-13 12:20:16'),
    (57,'dzc','send_award','77749836320','{\"data\":{\"awardId\":106,\"awardTitle\":\"3等奖\",\"userId\":\"dzc\"},\"id\":\"77749836320\",\"timestamp\":1712982020673}','completed','2024-04-13 12:20:20','2024-04-13 12:20:20'),
    (58,'dzc','send_award','47587820823','{\"data\":{\"awardId\":102,\"awardTitle\":\"7等奖\",\"userId\":\"dzc\"},\"id\":\"47587820823\",\"timestamp\":1712988239372}','completed','2024-04-13 14:03:59','2024-04-13 14:03:59'),
    (59,'dzc','send_award','58931754976','{\"data\":{\"awardId\":104,\"awardTitle\":\"5等奖\",\"userId\":\"dzc\"},\"id\":\"58931754976\",\"timestamp\":1712993105696}','completed','2024-04-13 15:25:06','2024-04-13 15:25:06'),
    (60,'dzc','send_award','67608143436','{\"data\":{\"awardId\":102,\"awardTitle\":\"7等奖\",\"userId\":\"dzc\"},\"id\":\"67608143436\",\"timestamp\":1712993111209}','completed','2024-04-13 15:25:11','2024-04-13 15:25:11'),
    (61,'dzc','send_award','22711974997','{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"dzc\"},\"id\":\"22711974997\",\"timestamp\":1712993112288}','completed','2024-04-13 15:25:12','2024-04-13 15:25:12'),
    (62,'dzc','send_award','39728508373','{\"data\":{\"awardId\":107,\"awardTitle\":\"2等奖\",\"userId\":\"dzc\"},\"id\":\"39728508373\",\"timestamp\":1712993121051}','completed','2024-04-13 15:25:21','2024-04-13 15:25:21');

/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 user_award_record_000
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_award_record_000`;

CREATE TABLE `user_award_record_000` (
                                         `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                         `user_id` varchar(32) NOT NULL COMMENT '用户ID',
                                         `activity_id` bigint(12) NOT NULL COMMENT '活动ID',
                                         `strategy_id` bigint(8) NOT NULL COMMENT '抽奖策略ID',
                                         `order_id` varchar(12) NOT NULL COMMENT '抽奖订单ID【作为幂等使用】',
                                         `award_id` int(11) NOT NULL COMMENT '奖品ID',
                                         `award_title` varchar(128) NOT NULL COMMENT '奖品标题（名称）',
                                         `award_time` datetime NOT NULL COMMENT '中奖时间',
                                         `award_state` varchar(16) NOT NULL DEFAULT 'create' COMMENT '奖品状态；create-创建、completed-发奖完成',
                                         `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                         `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                         PRIMARY KEY (`id`),
                                         UNIQUE KEY `uq_order_id` (`order_id`),
                                         KEY `idx_user_id` (`user_id`),
                                         KEY `idx_activity_id` (`activity_id`),
                                         KEY `idx_award_id` (`strategy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户中奖记录表';



# 转储表 user_award_record_001
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_award_record_001`;

CREATE TABLE `user_award_record_001` (
                                         `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                         `user_id` varchar(32) NOT NULL COMMENT '用户ID',
                                         `activity_id` bigint(12) NOT NULL COMMENT '活动ID',
                                         `strategy_id` bigint(8) NOT NULL COMMENT '抽奖策略ID',
                                         `order_id` varchar(12) NOT NULL COMMENT '抽奖订单ID【作为幂等使用】',
                                         `award_id` int(11) NOT NULL COMMENT '奖品ID',
                                         `award_title` varchar(128) NOT NULL COMMENT '奖品标题（名称）',
                                         `award_time` datetime NOT NULL COMMENT '中奖时间',
                                         `award_state` varchar(16) NOT NULL DEFAULT 'create' COMMENT '奖品状态；create-创建、completed-发奖完成',
                                         `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                         `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                         PRIMARY KEY (`id`),
                                         UNIQUE KEY `uq_order_id` (`order_id`),
                                         KEY `idx_user_id` (`user_id`),
                                         KEY `idx_activity_id` (`activity_id`),
                                         KEY `idx_award_id` (`strategy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户中奖记录表';

LOCK TABLES `user_award_record_001` WRITE;
/*!40000 ALTER TABLE `user_award_record_001` DISABLE KEYS */;

INSERT INTO `user_award_record_001` (`id`, `user_id`, `activity_id`, `strategy_id`, `order_id`, `award_id`, `award_title`, `award_time`, `award_state`, `create_time`, `update_time`)
VALUES
    (1,'dzc',100301,100006,'313091076458',101,'OpenAI 增加使用次数','2024-04-06 03:41:50','create','2024-04-06 11:41:50','2024-04-06 11:41:50'),
    (3,'dzc',100301,100006,'313091076459',101,'OpenAI 增加使用次数','2024-04-06 03:47:54','create','2024-04-06 11:47:54','2024-04-06 11:47:54'),
    (6,'dzc',100301,100006,'658772889112',101,'OpenAI 增加使用次数','2024-04-06 04:16:50','create','2024-04-06 12:16:50','2024-04-06 12:16:50'),
    (7,'dzc',100301,100006,'623291703218',101,'OpenAI 增加使用次数','2024-04-06 04:16:51','create','2024-04-06 12:16:50','2024-04-06 12:16:50'),
    (8,'dzc',100301,100006,'619841045154',101,'OpenAI 增加使用次数','2024-04-06 04:16:51','create','2024-04-06 12:16:51','2024-04-06 12:16:51'),
    (9,'dzc',100301,100006,'696947604604',101,'OpenAI 增加使用次数','2024-04-06 04:16:52','create','2024-04-06 12:16:51','2024-04-06 12:16:51'),
    (10,'dzc',100301,100006,'239997053403',101,'OpenAI 增加使用次数','2024-04-06 04:16:52','create','2024-04-06 12:16:52','2024-04-06 12:16:52'),
    (11,'dzc',100301,100006,'837228766840',101,'OpenAI 增加使用次数','2024-04-06 04:16:53','create','2024-04-06 12:16:52','2024-04-06 12:16:52'),
    (12,'dzc',100301,100006,'012609968231',101,'OpenAI 增加使用次数','2024-04-06 04:16:53','create','2024-04-06 12:16:53','2024-04-06 12:16:53'),
    (13,'dzc',100301,100006,'540056227059',101,'OpenAI 增加使用次数','2024-04-06 04:16:54','create','2024-04-06 12:16:54','2024-04-06 12:16:54'),
    (14,'dzc',100301,100006,'757384073568',101,'OpenAI 增加使用次数','2024-04-06 04:16:55','create','2024-04-06 12:16:54','2024-04-06 12:16:54'),
    (15,'dzc',100301,100006,'270533634609',101,'OpenAI 增加使用次数','2024-04-06 04:16:55','create','2024-04-06 12:16:55','2024-04-06 12:16:55'),
    (16,'dzc',100301,100006,'143517041178',101,'OpenAI 增加使用次数','2024-04-06 04:16:56','create','2024-04-06 12:16:55','2024-04-06 12:16:55'),
    (17,'dzc',100301,100006,'880610933571',101,'OpenAI 增加使用次数','2024-04-06 04:16:56','create','2024-04-06 12:16:56','2024-04-06 12:16:56'),
    (18,'dzc',100301,100006,'288939138548',101,'OpenAI 增加使用次数','2024-04-06 04:16:57','create','2024-04-06 12:16:56','2024-04-06 12:16:56'),
    (19,'dzc',100301,100006,'401825045013',101,'OpenAI 增加使用次数','2024-04-06 04:16:57','create','2024-04-06 12:16:57','2024-04-06 12:16:57'),
    (20,'dzc',100301,100006,'644483213191',101,'OpenAI 增加使用次数','2024-04-06 04:16:58','create','2024-04-06 12:16:57','2024-04-06 12:16:57'),
    (21,'dzc',100301,100006,'126942948062',101,'OpenAI 增加使用次数','2024-04-06 04:16:58','create','2024-04-06 12:16:58','2024-04-06 12:16:58'),
    (22,'dzc',100301,100006,'388415276639',101,'OpenAI 增加使用次数','2024-04-06 08:10:38','create','2024-04-06 16:10:38','2024-04-06 16:10:38'),
    (23,'dzc',100301,100006,'295404830039',101,'OpenAI 增加使用次数','2024-04-06 08:10:39','create','2024-04-06 16:10:39','2024-04-06 16:10:39'),
    (24,'dzc',100301,100006,'396378174546',101,'OpenAI 增加使用次数','2024-04-06 08:10:40','create','2024-04-06 16:10:39','2024-04-06 16:10:39'),
    (25,'dzc',100301,100006,'216034880115',101,'OpenAI 增加使用次数','2024-04-06 08:10:40','create','2024-04-06 16:10:40','2024-04-06 16:10:40'),
    (26,'dzc',100301,100006,'587083012812',101,'OpenAI 增加使用次数','2024-04-06 08:10:41','create','2024-04-06 16:10:40','2024-04-06 16:10:40'),
    (27,'dzc',100301,100006,'179931564604',101,'OpenAI 增加使用次数','2024-04-06 08:10:41','create','2024-04-06 16:10:41','2024-04-06 16:10:41'),
    (28,'dzc',100301,100006,'266603270575',101,'OpenAI 增加使用次数','2024-04-06 08:10:42','create','2024-04-06 16:10:41','2024-04-06 16:10:41'),
    (29,'dzc',100301,100006,'708306230375',101,'OpenAI 增加使用次数','2024-04-06 08:10:42','create','2024-04-06 16:10:42','2024-04-06 16:10:42'),
    (30,'dzc',100301,100006,'099363576226',101,'OpenAI 增加使用次数','2024-04-06 08:10:43','create','2024-04-06 16:10:42','2024-04-06 16:10:42'),
    (31,'dzc',100301,100006,'330354920093',101,'OpenAI 增加使用次数','2024-04-06 08:10:43','create','2024-04-06 16:10:43','2024-04-06 16:10:43'),
    (32,'dzc',100301,100006,'824752758415',101,'OpenAI 增加使用次数','2024-04-06 08:10:44','create','2024-04-06 16:10:43','2024-04-06 16:10:43'),
    (33,'dzc',100301,100006,'064058506146',101,'OpenAI 增加使用次数','2024-04-06 08:10:44','create','2024-04-06 16:10:44','2024-04-06 16:10:44'),
    (34,'dzc',100301,100006,'923475474250',101,'OpenAI 增加使用次数','2024-04-06 08:10:45','create','2024-04-06 16:10:44','2024-04-06 16:10:44'),
    (35,'dzc',100301,100006,'565064446034',101,'OpenAI 增加使用次数','2024-04-06 08:10:45','create','2024-04-06 16:10:45','2024-04-06 16:10:45'),
    (36,'dzc',100301,100006,'665449773785',101,'OpenAI 增加使用次数','2024-04-06 08:10:46','create','2024-04-06 16:10:45','2024-04-06 16:10:45'),
    (37,'dzc',100301,100006,'099294776536',101,'OpenAI 增加使用次数','2024-04-06 08:10:46','create','2024-04-06 16:10:46','2024-04-06 16:10:46'),
    (38,'dzc',100301,100006,'166766849249',101,'OpenAI 增加使用次数','2024-04-06 08:10:47','create','2024-04-06 16:10:47','2024-04-06 16:10:47'),
    (39,'dzc',100301,100006,'569856975978',107,'2等奖','2024-04-13 03:44:02','create','2024-04-13 11:44:01','2024-04-13 11:44:01'),
    (40,'dzc',100301,100006,'867136698684',103,'6等奖','2024-04-13 03:44:11','create','2024-04-13 11:44:10','2024-04-13 11:44:10'),
    (41,'dzc',100301,100006,'250425115608',101,'随机积分','2024-04-13 03:44:14','create','2024-04-13 11:44:14','2024-04-13 11:44:14'),
    (42,'dzc',100301,100006,'663910993767',106,'3等奖','2024-04-13 03:44:16','create','2024-04-13 11:44:15','2024-04-13 11:44:15'),
    (43,'dzc',100301,100006,'218374542905',106,'3等奖','2024-04-13 03:44:17','create','2024-04-13 11:44:16','2024-04-13 11:44:16'),
    (44,'dzc',100301,100006,'225714694474',104,'5等奖','2024-04-13 03:44:18','create','2024-04-13 11:44:17','2024-04-13 11:44:17'),
    (45,'dzc',100301,100006,'431167372778',102,'7等奖','2024-04-13 03:44:19','create','2024-04-13 11:44:18','2024-04-13 11:44:18'),
    (46,'dzc',100301,100006,'434079846497',103,'6等奖','2024-04-13 03:45:30','create','2024-04-13 11:45:29','2024-04-13 11:45:29'),
    (47,'dzc',100301,100006,'965685676429',102,'7等奖','2024-04-13 03:45:31','create','2024-04-13 11:45:30','2024-04-13 11:45:30'),
    (48,'dzc',100301,100006,'940273728363',102,'7等奖','2024-04-13 04:14:53','create','2024-04-13 12:14:53','2024-04-13 12:14:53'),
    (49,'dzc',100301,100006,'240699246294',104,'5等奖','2024-04-13 04:17:34','create','2024-04-13 12:17:33','2024-04-13 12:17:33'),
    (50,'dzc',100301,100006,'298101180210',103,'6等奖','2024-04-13 04:18:17','create','2024-04-13 12:18:16','2024-04-13 12:18:16'),
    (51,'dzc',100301,100006,'565655944488',103,'6等奖','2024-04-13 04:18:23','create','2024-04-13 12:18:23','2024-04-13 12:18:23'),
    (52,'dzc',100301,100006,'090289257534',104,'5等奖','2024-04-13 04:18:25','create','2024-04-13 12:18:24','2024-04-13 12:18:24'),
    (53,'dzc',100301,100006,'668356046426',105,'4等奖','2024-04-13 04:18:26','create','2024-04-13 12:18:25','2024-04-13 12:18:25'),
    (54,'dzc',100301,100006,'745680068300',107,'2等奖','2024-04-13 04:18:37','create','2024-04-13 12:18:36','2024-04-13 12:18:36'),
    (55,'dzc',100301,100006,'285300597983',102,'7等奖','2024-04-13 04:20:08','create','2024-04-13 12:20:07','2024-04-13 12:20:07'),
    (56,'dzc',100301,100006,'999361306023',104,'5等奖','2024-04-13 04:20:10','create','2024-04-13 12:20:09','2024-04-13 12:20:09'),
    (57,'dzc',100301,100006,'063682699381',104,'5等奖','2024-04-13 04:20:14','create','2024-04-13 12:20:13','2024-04-13 12:20:13'),
    (58,'dzc',100301,100006,'680488311338',105,'4等奖','2024-04-13 04:20:15','create','2024-04-13 12:20:14','2024-04-13 12:20:14'),
    (59,'dzc',100301,100006,'399058527457',102,'7等奖','2024-04-13 04:20:16','create','2024-04-13 12:20:16','2024-04-13 12:20:16'),
    (60,'dzc',100301,100006,'579122416749',106,'3等奖','2024-04-13 04:20:21','create','2024-04-13 12:20:20','2024-04-13 12:20:20'),
    (61,'dzc',100301,100006,'854484054432',102,'7等奖','2024-04-13 06:03:59','create','2024-04-13 14:03:59','2024-04-13 14:03:59'),
    (62,'dzc',100301,100006,'066823147917',104,'5等奖','2024-04-13 07:25:06','create','2024-04-13 15:25:06','2024-04-13 15:25:06'),
    (63,'dzc',100301,100006,'022620846137',102,'7等奖','2024-04-13 07:25:11','create','2024-04-13 15:25:11','2024-04-13 15:25:11'),
    (64,'dzc',100301,100006,'605666354632',101,'随机积分','2024-04-13 07:25:12','create','2024-04-13 15:25:12','2024-04-13 15:25:12'),
    (65,'dzc',100301,100006,'604661560037',107,'2等奖','2024-04-13 07:25:21','create','2024-04-13 15:25:21','2024-04-13 15:25:21');

/*!40000 ALTER TABLE `user_award_record_001` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 user_award_record_002
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_award_record_002`;

CREATE TABLE `user_award_record_002` (
                                         `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                         `user_id` varchar(32) NOT NULL COMMENT '用户ID',
                                         `activity_id` bigint(12) NOT NULL COMMENT '活动ID',
                                         `strategy_id` bigint(8) NOT NULL COMMENT '抽奖策略ID',
                                         `order_id` varchar(12) NOT NULL COMMENT '抽奖订单ID【作为幂等使用】',
                                         `award_id` int(11) NOT NULL COMMENT '奖品ID',
                                         `award_title` varchar(128) NOT NULL COMMENT '奖品标题（名称）',
                                         `award_time` datetime NOT NULL COMMENT '中奖时间',
                                         `award_state` varchar(16) NOT NULL DEFAULT 'create' COMMENT '奖品状态；create-创建、completed-发奖完成',
                                         `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                         `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                         PRIMARY KEY (`id`),
                                         UNIQUE KEY `uq_order_id` (`order_id`),
                                         KEY `idx_user_id` (`user_id`),
                                         KEY `idx_activity_id` (`activity_id`),
                                         KEY `idx_award_id` (`strategy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户中奖记录表';



# 转储表 user_award_record_003
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_award_record_003`;

CREATE TABLE `user_award_record_003` (
                                         `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                         `user_id` varchar(32) NOT NULL COMMENT '用户ID',
                                         `activity_id` bigint(12) NOT NULL COMMENT '活动ID',
                                         `strategy_id` bigint(8) NOT NULL COMMENT '抽奖策略ID',
                                         `order_id` varchar(12) NOT NULL COMMENT '抽奖订单ID【作为幂等使用】',
                                         `award_id` int(11) NOT NULL COMMENT '奖品ID',
                                         `award_title` varchar(128) NOT NULL COMMENT '奖品标题（名称）',
                                         `award_time` datetime NOT NULL COMMENT '中奖时间',
                                         `award_state` varchar(16) NOT NULL DEFAULT 'create' COMMENT '奖品状态；create-创建、completed-发奖完成',
                                         `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                         `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                         PRIMARY KEY (`id`),
                                         UNIQUE KEY `uq_order_id` (`order_id`),
                                         KEY `idx_user_id` (`user_id`),
                                         KEY `idx_activity_id` (`activity_id`),
                                         KEY `idx_award_id` (`strategy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户中奖记录表';



# 转储表 user_raffle_order_000
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_raffle_order_000`;

CREATE TABLE `user_raffle_order_000` (
                                         `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
                                         `user_id` varchar(32) NOT NULL COMMENT '用户ID',
                                         `activity_id` bigint(12) NOT NULL COMMENT '活动ID',
                                         `activity_name` varchar(64) NOT NULL COMMENT '活动名称',
                                         `strategy_id` bigint(8) NOT NULL COMMENT '抽奖策略ID',
                                         `order_id` varchar(12) NOT NULL COMMENT '订单ID',
                                         `order_time` datetime NOT NULL COMMENT '下单时间',
                                         `order_state` varchar(16) NOT NULL DEFAULT 'create' COMMENT '订单状态；create-创建、used-已使用、cancel-已作废',
                                         `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                         `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                         PRIMARY KEY (`id`),
                                         UNIQUE KEY `uq_order_id` (`order_id`),
                                         KEY `idx_user_id_activity_id` (`user_id`,`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户抽奖订单表';



# 转储表 user_raffle_order_001
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_raffle_order_001`;

CREATE TABLE `user_raffle_order_001` (
                                         `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
                                         `user_id` varchar(32) NOT NULL COMMENT '用户ID',
                                         `activity_id` bigint(12) NOT NULL COMMENT '活动ID',
                                         `activity_name` varchar(64) NOT NULL COMMENT '活动名称',
                                         `strategy_id` bigint(8) NOT NULL COMMENT '抽奖策略ID',
                                         `order_id` varchar(12) NOT NULL COMMENT '订单ID',
                                         `order_time` datetime NOT NULL COMMENT '下单时间',
                                         `order_state` varchar(16) NOT NULL DEFAULT 'create' COMMENT '订单状态；create-创建、used-已使用、cancel-已作废',
                                         `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                         `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                         PRIMARY KEY (`id`),
                                         UNIQUE KEY `uq_order_id` (`order_id`),
                                         KEY `idx_user_id_activity_id` (`user_id`,`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户抽奖订单表';

LOCK TABLES `user_raffle_order_001` WRITE;
/*!40000 ALTER TABLE `user_raffle_order_001` DISABLE KEYS */;

INSERT INTO `user_raffle_order_001` (`id`, `user_id`, `activity_id`, `activity_name`, `strategy_id`, `order_id`, `order_time`, `order_state`, `create_time`, `update_time`)
VALUES
    (5,'dzc',100301,'测试活动',100006,'569856975978','2024-04-08 14:52:47','used','2024-04-08 22:52:47','2024-04-13 11:44:01'),
    (6,'dzc',100301,'测试活动',100006,'867136698684','2024-04-13 03:44:07','used','2024-04-13 11:44:10','2024-04-13 11:44:10'),
    (7,'dzc',100301,'测试活动',100006,'250425115608','2024-04-13 03:44:14','used','2024-04-13 11:44:14','2024-04-13 11:44:14'),
    (8,'dzc',100301,'测试活动',100006,'663910993767','2024-04-13 03:44:16','used','2024-04-13 11:44:15','2024-04-13 11:44:15'),
    (9,'dzc',100301,'测试活动',100006,'218374542905','2024-04-13 03:44:17','used','2024-04-13 11:44:16','2024-04-13 11:44:16'),
    (10,'dzc',100301,'测试活动',100006,'225714694474','2024-04-13 03:44:18','used','2024-04-13 11:44:17','2024-04-13 11:44:17'),
    (11,'dzc',100301,'测试活动',100006,'431167372778','2024-04-13 03:44:19','used','2024-04-13 11:44:18','2024-04-13 11:44:18'),
    (12,'dzc',100301,'测试活动',100006,'434079846497','2024-04-13 03:45:30','used','2024-04-13 11:45:29','2024-04-13 11:45:29'),
    (13,'dzc',100301,'测试活动',100006,'965685676429','2024-04-13 03:45:31','used','2024-04-13 11:45:30','2024-04-13 11:45:30'),
    (14,'dzc',100301,'测试活动',100006,'940273728363','2024-04-13 04:14:53','used','2024-04-13 12:14:53','2024-04-13 12:14:53'),
    (15,'dzc',100301,'测试活动',100006,'240699246294','2024-04-13 04:16:20','used','2024-04-13 12:16:19','2024-04-13 12:17:33'),
    (16,'dzc',100301,'测试活动',100006,'298101180210','2024-04-13 04:18:05','used','2024-04-13 12:18:05','2024-04-13 12:18:16'),
    (17,'dzc',100301,'测试活动',100006,'565655944488','2024-04-13 04:18:23','used','2024-04-13 12:18:23','2024-04-13 12:18:23'),
    (18,'dzc',100301,'测试活动',100006,'090289257534','2024-04-13 04:18:25','used','2024-04-13 12:18:24','2024-04-13 12:18:24'),
    (19,'dzc',100301,'测试活动',100006,'668356046426','2024-04-13 04:18:26','used','2024-04-13 12:18:25','2024-04-13 12:18:25'),
    (20,'dzc',100301,'测试活动',100006,'745680068300','2024-04-13 04:18:27','used','2024-04-13 12:18:26','2024-04-13 12:18:36'),
    (21,'dzc',100301,'测试活动',100006,'285300597983','2024-04-13 04:20:07','used','2024-04-13 12:20:07','2024-04-13 12:20:07'),
    (22,'dzc',100301,'测试活动',100006,'999361306023','2024-04-13 04:20:10','used','2024-04-13 12:20:09','2024-04-13 12:20:09'),
    (23,'dzc',100301,'测试活动',100006,'063682699381','2024-04-13 04:20:14','used','2024-04-13 12:20:13','2024-04-13 12:20:13'),
    (24,'dzc',100301,'测试活动',100006,'680488311338','2024-04-13 04:20:15','used','2024-04-13 12:20:14','2024-04-13 12:20:14'),
    (25,'dzc',100301,'测试活动',100006,'399058527457','2024-04-13 04:20:16','used','2024-04-13 12:20:16','2024-04-13 12:20:16'),
    (26,'dzc',100301,'测试活动',100006,'579122416749','2024-04-13 04:20:17','used','2024-04-13 12:20:17','2024-04-13 12:20:20'),
    (27,'dzc',100301,'测试活动',100006,'854484054432','2024-04-13 06:03:59','used','2024-04-13 14:03:59','2024-04-13 14:03:59'),
    (28,'dzc',100301,'测试活动',100006,'066823147917','2024-04-13 07:24:59','used','2024-04-13 15:25:05','2024-04-13 15:25:06'),
    (29,'dzc',100301,'测试活动',100006,'022620846137','2024-04-13 07:25:11','used','2024-04-13 15:25:11','2024-04-13 15:25:11'),
    (30,'dzc',100301,'测试活动',100006,'605666354632','2024-04-13 07:25:12','used','2024-04-13 15:25:12','2024-04-13 15:25:12'),
    (31,'dzc',100301,'测试活动',100006,'604661560037','2024-04-13 07:25:13','used','2024-04-13 15:25:13','2024-04-13 15:25:21');

/*!40000 ALTER TABLE `user_raffle_order_001` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 user_raffle_order_002
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_raffle_order_002`;

CREATE TABLE `user_raffle_order_002` (
                                         `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
                                         `user_id` varchar(32) NOT NULL COMMENT '用户ID',
                                         `activity_id` bigint(12) NOT NULL COMMENT '活动ID',
                                         `activity_name` varchar(64) NOT NULL COMMENT '活动名称',
                                         `strategy_id` bigint(8) NOT NULL COMMENT '抽奖策略ID',
                                         `order_id` varchar(12) NOT NULL COMMENT '订单ID',
                                         `order_time` datetime NOT NULL COMMENT '下单时间',
                                         `order_state` varchar(16) NOT NULL DEFAULT 'create' COMMENT '订单状态；create-创建、used-已使用、cancel-已作废',
                                         `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                         `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                         PRIMARY KEY (`id`),
                                         UNIQUE KEY `uq_order_id` (`order_id`),
                                         KEY `idx_user_id_activity_id` (`user_id`,`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户抽奖订单表';



# 转储表 user_raffle_order_003
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_raffle_order_003`;

CREATE TABLE `user_raffle_order_003` (
                                         `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
                                         `user_id` varchar(32) NOT NULL COMMENT '用户ID',
                                         `activity_id` bigint(12) NOT NULL COMMENT '活动ID',
                                         `activity_name` varchar(64) NOT NULL COMMENT '活动名称',
                                         `strategy_id` bigint(8) NOT NULL COMMENT '抽奖策略ID',
                                         `order_id` varchar(12) NOT NULL COMMENT '订单ID',
                                         `order_time` datetime NOT NULL COMMENT '下单时间',
                                         `order_state` varchar(16) NOT NULL DEFAULT 'create' COMMENT '订单状态；create-创建、used-已使用、cancel-已作废',
                                         `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                         `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                         PRIMARY KEY (`id`),
                                         UNIQUE KEY `uq_order_id` (`order_id`),
                                         KEY `idx_user_id_activity_id` (`user_id`,`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户抽奖订单表';




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
