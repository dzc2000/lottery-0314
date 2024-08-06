# ************************************************************
# Sequel Ace SQL dump
# 版本号： 20050
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# 主机: 127.0.0.1 (MySQL 5.6.39)
# 数据库: big_market_01
# 生成时间: 2024-05-03 08:37:02 +0000
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
    (3,'dzc',100301,8890,28,90,66,90,66,'2024-03-23 16:38:57','2024-05-03 13:28:42'),
    (4,'12345',100301,10,10,10,10,10,10,'2024-05-01 15:28:50','2024-05-01 15:28:50');

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
    (4,'dzc',100301,'2024-04-13',45,23,'2024-04-13 11:44:10','2024-04-20 10:51:09'),
    (7,'dzc',100301,'2024-04-20',45,13,'2024-04-20 16:50:38','2024-04-20 16:50:38'),
    (11,'dzc',100301,'2024-05-01',60,40,'2024-05-01 14:51:45','2024-05-01 17:45:10'),
    (12,'dzc',100301,'2024-05-03',90,86,'2024-05-03 09:00:28','2024-05-03 13:28:42');

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
    (7,'dzc',100301,'2024-05',70,46,'2024-05-01 14:51:45','2024-05-03 13:28:42');

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
    (71,'dzc',9011,100301,'测试活动',100006,'761345538871','2024-04-21 10:40:25',1,1,1,'completed','073735003829','2024-04-21 18:40:25','2024-04-21 18:40:25'),
    (72,'dzc',9011,100301,'测试活动',100006,'837744050164','2024-04-21 10:40:25',1,1,1,'completed','613036507854','2024-04-21 18:40:25','2024-04-21 18:40:25'),
    (73,'dzc',9011,100301,'测试活动',100006,'766742523760','2024-04-21 10:40:25',1,1,1,'completed','649099837249','2024-04-21 18:40:25','2024-04-21 18:40:25'),
    (74,'dzc',9011,100301,'测试活动',100006,'856474163547','2024-04-21 10:40:25',1,1,1,'completed','652903372986','2024-04-21 18:40:25','2024-04-21 18:40:25'),
    (75,'dzc',9011,100301,'测试活动',100006,'668775949799','2024-04-21 10:40:25',1,1,1,'completed','097066347980','2024-04-21 18:40:25','2024-04-21 18:40:25'),
    (76,'dzc',9011,100301,'测试活动',100006,'164452591012','2024-05-01 06:44:26',10,10,10,'completed','dzc_sku_2024042903','2024-05-01 14:44:26','2024-05-01 14:44:26'),
    (77,'dzc',9011,100301,'测试活动',100006,'492597085813','2024-05-01 06:51:45',10,10,10,'completed','dzc_sku_2024042904','2024-05-01 14:51:45','2024-05-01 14:51:45'),
    (78,'dzc',9011,100301,'测试活动',100006,'031706643902','2024-05-01 06:54:36',10,10,10,'completed','dzc_sku_2024042905','2024-05-01 14:54:36','2024-05-01 14:54:36'),
    (79,'dzc',9011,100301,'测试活动',100006,'460855930969','2024-05-01 07:00:12',10,10,10,'completed','dzc_sku_2024042906','2024-05-01 15:00:12','2024-05-01 15:00:12'),
    (1096,'dzc',9011,100301,'测试活动',100006,'364757830401','2024-05-01 09:14:43',10,10,10,'completed','dzc_sku_20240501','2024-05-01 17:14:43','2024-05-01 17:14:43'),
    (1097,'dzc',9011,100301,'测试活动',100006,'157026402583','2024-05-01 09:39:40',10,10,10,'completed','dzc_sku_20240420','2024-05-01 17:39:40','2024-05-01 17:39:40'),
    (1098,'dzc',9011,100301,'测试活动',100006,'481116019750','2024-05-01 09:41:53',10,10,10,'completed','dzc_sku_20240401','2024-05-01 17:41:53','2024-05-01 17:41:53'),
    (1099,'dzc',9011,100301,'测试活动',100006,'639151059221','2024-05-01 09:45:10',10,10,10,'completed','dzc_sku_20240402','2024-05-01 17:45:10','2024-05-01 17:45:10'),
    (4234,'dzc',9011,100301,'测试活动',100006,'129360973197','2024-05-03 05:28:43',10,10,10,'completed','dzc_sku_20240503','2024-05-03 13:28:42','2024-05-03 13:28:42');

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
    (62,'dzc','send_award','39728508373','{\"data\":{\"awardId\":107,\"awardTitle\":\"2等奖\",\"userId\":\"dzc\"},\"id\":\"39728508373\",\"timestamp\":1712993121051}','completed','2024-04-13 15:25:21','2024-04-13 15:25:21'),
    (63,'dzc','send_award','29346013696','{\"data\":{\"awardId\":105,\"awardTitle\":\"4等奖\",\"userId\":\"dzc\"},\"id\":\"29346013696\",\"timestamp\":1713586170567}','completed','2024-04-20 12:09:30','2024-04-20 12:09:30'),
    (64,'dzc','send_award','26345538109','{\"data\":{\"awardId\":106,\"awardTitle\":\"3等奖\",\"userId\":\"dzc\"},\"id\":\"26345538109\",\"timestamp\":1713586284216}','completed','2024-04-20 12:11:24','2024-04-20 12:11:24'),
    (65,'dzc','send_award','08631161692','{\"data\":{\"awardId\":105,\"awardTitle\":\"4等奖\",\"userId\":\"dzc\"},\"id\":\"08631161692\",\"timestamp\":1713597058001}','completed','2024-04-20 15:10:58','2024-04-20 15:10:58'),
    (66,'dzc','send_award','39622786502','{\"data\":{\"awardId\":107,\"awardTitle\":\"2等奖\",\"userId\":\"dzc\"},\"id\":\"39622786502\",\"timestamp\":1713598992837}','completed','2024-04-20 15:43:13','2024-04-20 15:43:13'),
    (67,'dzc','send_award','66657753896','{\"data\":{\"awardId\":106,\"awardTitle\":\"3等奖\",\"userId\":\"dzc\"},\"id\":\"66657753896\",\"timestamp\":1713603038553}','completed','2024-04-20 16:50:39','2024-04-20 16:50:39'),
    (68,'dzc','send_award','87700384224','{\"data\":{\"awardId\":108,\"awardTitle\":\"暴走玩偶\",\"userId\":\"dzc\"},\"id\":\"87700384224\",\"timestamp\":1714195178827}','completed','2024-04-27 13:19:38','2024-04-27 13:19:38'),
    (69,'dzc','send_award','34246976218','{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"dzc\"},\"id\":\"34246976218\",\"timestamp\":1714195637200}','completed','2024-04-27 13:27:17','2024-04-27 13:27:17'),
    (70,'dzc','send_award','67418825974','{\"data\":{\"awardId\":104,\"awardTitle\":\"小米台灯\",\"userId\":\"dzc\"},\"id\":\"67418825974\",\"timestamp\":1714195665080}','completed','2024-04-27 13:27:45','2024-04-27 13:27:45'),
    (71,'dzc','send_award','28182567445','{\"data\":{\"awardId\":102,\"awardTitle\":\"OpenAI会员卡\",\"userId\":\"dzc\"},\"id\":\"28182567445\",\"timestamp\":1714195681839}','completed','2024-04-27 13:28:01','2024-04-27 13:28:01'),
    (72,'dzc','send_award','43921644960','{\"data\":{\"awardId\":106,\"awardTitle\":\"轻奢办公椅\",\"userId\":\"dzc\"},\"id\":\"43921644960\",\"timestamp\":1714195745254}','completed','2024-04-27 13:29:05','2024-04-27 13:29:05'),
    (73,'dzc','send_award','83192193690','{\"data\":{\"awardId\":103,\"awardTitle\":\"支付优惠券\",\"userId\":\"dzc\"},\"id\":\"83192193690\",\"timestamp\":1714195771714}','completed','2024-04-27 13:29:31','2024-04-27 13:29:31'),
    (74,'dzc','send_award','71879339129','{\"data\":{\"awardId\":106,\"awardTitle\":\"轻奢办公椅\",\"userId\":\"dzc\"},\"id\":\"71879339129\",\"timestamp\":1714195797449}','completed','2024-04-27 13:29:57','2024-04-27 13:29:57'),
    (75,'dzc','send_award','82583508840','{\"data\":{\"awardId\":107,\"awardTitle\":\"小霸王游戏机\",\"userId\":\"dzc\"},\"id\":\"82583508840\",\"timestamp\":1714195811069}','completed','2024-04-27 13:30:11','2024-04-27 13:30:11'),
    (76,'dzc','send_award','21336975617','{\"data\":{\"awardId\":107,\"awardTitle\":\"小霸王游戏机\",\"userId\":\"dzc\"},\"id\":\"21336975617\",\"timestamp\":1714196187285}','completed','2024-04-27 13:36:27','2024-04-27 13:36:27'),
    (77,'dzc','send_award','54277155930','{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"dzc\"},\"id\":\"54277155930\",\"timestamp\":1714196280178}','completed','2024-04-27 13:38:00','2024-04-27 13:38:00'),
    (78,'dzc','send_award','90789466751','{\"data\":{\"awardId\":104,\"awardTitle\":\"小米台灯\",\"userId\":\"dzc\"},\"id\":\"90789466751\",\"timestamp\":1714196335804}','completed','2024-04-27 13:38:55','2024-04-27 13:38:55'),
    (79,'dzc','send_award','62146713103','{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"dzc\"},\"id\":\"62146713103\",\"timestamp\":1714196358336}','completed','2024-04-27 13:39:18','2024-04-27 13:39:18'),
    (80,'dzc','send_award','69804673669','{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"dzc\"},\"id\":\"69804673669\",\"timestamp\":1714201196264}','completed','2024-04-27 14:59:56','2024-04-27 14:59:56'),
    (81,'dzc','send_award','56789986275','{\"data\":{\"awardId\":102,\"awardTitle\":\"OpenAI会员卡\",\"userId\":\"dzc\"},\"id\":\"56789986275\",\"timestamp\":1714201214179}','completed','2024-04-27 15:00:14','2024-04-27 15:00:14'),
    (82,'dzc','send_award','05612212348','{\"data\":{\"awardId\":104,\"awardTitle\":\"小米台灯\",\"userId\":\"dzc\"},\"id\":\"05612212348\",\"timestamp\":1714201222825}','completed','2024-04-27 15:00:22','2024-04-27 15:00:22'),
    (83,'dzc','send_rebate','35170430024','{\"data\":{\"bizId\":\"dzc_sku_20240430\",\"rebateConfig\":\"9011\",\"rebateType\":\"sign\",\"userId\":\"dzc\"},\"id\":\"35170430024\",\"timestamp\":1714471292871}','completed','2024-04-30 18:01:33','2024-04-30 18:01:33'),
    (84,'dzc','send_rebate','33541289034','{\"data\":{\"bizId\":\"dzc_sku_20240430\",\"rebateConfig\":\"9011\",\"rebateType\":\"sign\",\"userId\":\"dzc\"},\"id\":\"33541289034\",\"timestamp\":1714471544134}','completed','2024-04-30 18:05:44','2024-04-30 18:05:44'),
    (85,'dzc','send_rebate','42019106000','{\"data\":{\"bizId\":\"dzc_integral_20240430\",\"rebateConfig\":\"10\",\"rebateType\":\"sign\",\"userId\":\"dzc\"},\"id\":\"42019106000\",\"timestamp\":1714471544137}','completed','2024-04-30 18:05:44','2024-04-30 18:05:44'),
    (86,'dzc','send_rebate','19381004535','{\"data\":{\"bizId\":\"dzc_sku_20240429\",\"rebateConfig\":\"9011\",\"rebateType\":\"sign\",\"userId\":\"dzc\"},\"id\":\"19381004535\",\"timestamp\":1714472470563}','completed','2024-04-30 18:21:10','2024-04-30 18:21:10'),
    (87,'dzc','send_rebate','64076325441','{\"data\":{\"bizId\":\"dzc_integral_20240429\",\"rebateConfig\":\"10\",\"rebateType\":\"sign\",\"userId\":\"dzc\"},\"id\":\"64076325441\",\"timestamp\":1714472470567}','completed','2024-04-30 18:21:10','2024-04-30 18:21:10'),
    (88,'dzc','send_rebate','68231201640','{\"data\":{\"bizId\":\"dzc_sku_20240501\",\"rebateConfig\":\"9011\",\"rebateType\":\"sign\",\"userId\":\"dzc\"},\"id\":\"68231201640\",\"timestamp\":1714528145559}','completed','2024-05-01 09:49:06','2024-05-01 09:50:45'),
    (89,'dzc','send_rebate','50111005352','{\"data\":{\"bizId\":\"dzc_integral_20240501\",\"rebateConfig\":\"10\",\"rebateType\":\"sign\",\"userId\":\"dzc\"},\"id\":\"50111005352\",\"timestamp\":1714528145563}','completed','2024-05-01 09:49:06','2024-05-01 09:50:45'),
    (90,'dzc','send_rebate','75682316589','{\"data\":{\"bizId\":\"dzc_sku_20240502\",\"rebateConfig\":\"9011\",\"rebateType\":\"sign\",\"userId\":\"dzc\"},\"id\":\"75682316589\",\"timestamp\":1714528244315}','completed','2024-05-01 09:50:44','2024-05-01 09:50:44'),
    (91,'dzc','send_rebate','15910602537','{\"data\":{\"bizId\":\"dzc_integral_20240502\",\"rebateConfig\":\"10\",\"rebateType\":\"sign\",\"userId\":\"dzc\"},\"id\":\"15910602537\",\"timestamp\":1714528244322}','completed','2024-05-01 09:50:44','2024-05-01 09:50:44'),
    (92,'dzc','send_rebate','84186056749','{\"data\":{\"bizId\":\"dzc_sku_2024042901\",\"rebateConfig\":\"9011\",\"rebateType\":\"sign\",\"userId\":\"dzc\"},\"id\":\"84186056749\",\"timestamp\":1714543316732}','completed','2024-05-01 14:01:57','2024-05-01 14:01:57'),
    (93,'dzc','send_rebate','96465813570','{\"data\":{\"bizId\":\"dzc_integral_2024042901\",\"rebateConfig\":\"10\",\"rebateType\":\"sign\",\"userId\":\"dzc\"},\"id\":\"96465813570\",\"timestamp\":1714543316735}','completed','2024-05-01 14:01:57','2024-05-01 14:01:57'),
    (94,'dzc','send_rebate','52282173291','{\"data\":{\"bizId\":\"dzc_sku_2024042902\",\"rebateConfig\":\"9011\",\"rebateType\":\"sign\",\"userId\":\"dzc\"},\"id\":\"52282173291\",\"timestamp\":1714545280296}','completed','2024-05-01 14:34:40','2024-05-01 14:34:40'),
    (95,'dzc','send_rebate','57252028754','{\"data\":{\"bizId\":\"dzc_integral_2024042902\",\"rebateConfig\":\"10\",\"rebateType\":\"sign\",\"userId\":\"dzc\"},\"id\":\"57252028754\",\"timestamp\":1714545280298}','completed','2024-05-01 14:34:40','2024-05-01 14:34:40'),
    (96,'dzc','send_rebate','49677315112','{\"data\":{\"bizId\":\"dzc_sku_2024042903\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"dzc\"},\"id\":\"49677315112\",\"timestamp\":1714545434013}','completed','2024-05-01 14:37:14','2024-05-01 14:37:14'),
    (97,'dzc','send_rebate','29687183027','{\"data\":{\"bizId\":\"dzc_integral_2024042903\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"dzc\"},\"id\":\"29687183027\",\"timestamp\":1714545434017}','completed','2024-05-01 14:37:14','2024-05-01 14:37:14'),
    (98,'dzc','send_rebate','55494780983','{\"data\":{\"bizId\":\"dzc_sku_2024042904\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"dzc\"},\"id\":\"55494780983\",\"timestamp\":1714546304733}','completed','2024-05-01 14:51:45','2024-05-01 14:51:45'),
    (99,'dzc','send_rebate','63676464061','{\"data\":{\"bizId\":\"dzc_integral_2024042904\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"dzc\"},\"id\":\"63676464061\",\"timestamp\":1714546304736}','completed','2024-05-01 14:51:45','2024-05-01 14:51:45'),
    (100,'dzc','send_rebate','97069945042','{\"data\":{\"bizId\":\"dzc_sku_2024042905\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"dzc\"},\"id\":\"97069945042\",\"timestamp\":1714546475883}','completed','2024-05-01 14:54:36','2024-05-01 14:54:36'),
    (101,'dzc','send_rebate','25711583274','{\"data\":{\"bizId\":\"dzc_integral_2024042905\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"dzc\"},\"id\":\"25711583274\",\"timestamp\":1714546475885}','completed','2024-05-01 14:54:36','2024-05-01 14:54:36'),
    (102,'dzc','send_award','42156280709','{\"data\":{\"awardId\":108,\"awardTitle\":\"暴走玩偶\",\"userId\":\"dzc\"},\"id\":\"42156280709\",\"timestamp\":1714546659050}','completed','2024-05-01 14:57:39','2024-05-01 14:57:39'),
    (103,'dzc','send_award','78085050648','{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"dzc\"},\"id\":\"78085050648\",\"timestamp\":1714546688551}','completed','2024-05-01 14:58:08','2024-05-01 14:58:08'),
    (104,'dzc','send_award','55842869580','{\"data\":{\"awardId\":107,\"awardTitle\":\"小霸王游戏机\",\"userId\":\"dzc\"},\"id\":\"55842869580\",\"timestamp\":1714546773027}','completed','2024-05-01 14:59:33','2024-05-01 14:59:33'),
    (105,'dzc','send_award','86587566543','{\"data\":{\"awardId\":103,\"awardTitle\":\"支付优惠券\",\"userId\":\"dzc\"},\"id\":\"86587566543\",\"timestamp\":1714546773422}','completed','2024-05-01 14:59:33','2024-05-01 14:59:33'),
    (106,'dzc','send_award','88267642020','{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"dzc\"},\"id\":\"88267642020\",\"timestamp\":1714546773490}','completed','2024-05-01 14:59:33','2024-05-01 14:59:33'),
    (107,'dzc','send_award','03348496593','{\"data\":{\"awardId\":106,\"awardTitle\":\"轻奢办公椅\",\"userId\":\"dzc\"},\"id\":\"03348496593\",\"timestamp\":1714546773570}','completed','2024-05-01 14:59:33','2024-05-01 14:59:33'),
    (108,'dzc','send_award','20140993483','{\"data\":{\"awardId\":104,\"awardTitle\":\"小米台灯\",\"userId\":\"dzc\"},\"id\":\"20140993483\",\"timestamp\":1714546773661}','completed','2024-05-01 14:59:33','2024-05-01 14:59:33'),
    (109,'dzc','send_award','95682596295','{\"data\":{\"awardId\":107,\"awardTitle\":\"小霸王游戏机\",\"userId\":\"dzc\"},\"id\":\"95682596295\",\"timestamp\":1714546773713}','completed','2024-05-01 14:59:33','2024-05-01 14:59:33'),
    (110,'dzc','send_award','95939034377','{\"data\":{\"awardId\":107,\"awardTitle\":\"小霸王游戏机\",\"userId\":\"dzc\"},\"id\":\"95939034377\",\"timestamp\":1714546773772}','completed','2024-05-01 14:59:33','2024-05-01 14:59:33'),
    (111,'dzc','send_award','28569395651','{\"data\":{\"awardId\":103,\"awardTitle\":\"支付优惠券\",\"userId\":\"dzc\"},\"id\":\"28569395651\",\"timestamp\":1714546773829}','completed','2024-05-01 14:59:33','2024-05-01 14:59:33'),
    (112,'dzc','send_award','37713199996','{\"data\":{\"awardId\":108,\"awardTitle\":\"暴走玩偶\",\"userId\":\"dzc\"},\"id\":\"37713199996\",\"timestamp\":1714546773889}','completed','2024-05-01 14:59:33','2024-05-01 14:59:33'),
    (113,'dzc','send_award','39729736863','{\"data\":{\"awardId\":108,\"awardTitle\":\"暴走玩偶\",\"userId\":\"dzc\"},\"id\":\"39729736863\",\"timestamp\":1714546773937}','completed','2024-05-01 14:59:33','2024-05-01 14:59:33'),
    (114,'dzc','send_award','63571397739','{\"data\":{\"awardId\":108,\"awardTitle\":\"暴走玩偶\",\"userId\":\"dzc\"},\"id\":\"63571397739\",\"timestamp\":1714546774008}','completed','2024-05-01 14:59:34','2024-05-01 14:59:34'),
    (115,'dzc','send_award','41779666583','{\"data\":{\"awardId\":107,\"awardTitle\":\"小霸王游戏机\",\"userId\":\"dzc\"},\"id\":\"41779666583\",\"timestamp\":1714546774083}','completed','2024-05-01 14:59:34','2024-05-01 14:59:34'),
    (116,'dzc','send_award','35122333142','{\"data\":{\"awardId\":107,\"awardTitle\":\"小霸王游戏机\",\"userId\":\"dzc\"},\"id\":\"35122333142\",\"timestamp\":1714546774144}','completed','2024-05-01 14:59:34','2024-05-01 14:59:34'),
    (117,'dzc','send_award','07007092150','{\"data\":{\"awardId\":102,\"awardTitle\":\"OpenAI会员卡\",\"userId\":\"dzc\"},\"id\":\"07007092150\",\"timestamp\":1714546774211}','completed','2024-05-01 14:59:34','2024-05-01 14:59:34'),
    (118,'dzc','send_award','08460963032','{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"dzc\"},\"id\":\"08460963032\",\"timestamp\":1714546774278}','completed','2024-05-01 14:59:34','2024-05-01 14:59:34'),
    (119,'dzc','send_award','06210115971','{\"data\":{\"awardId\":108,\"awardTitle\":\"暴走玩偶\",\"userId\":\"dzc\"},\"id\":\"06210115971\",\"timestamp\":1714546774344}','completed','2024-05-01 14:59:34','2024-05-01 14:59:34'),
    (120,'dzc','send_award','78110342017','{\"data\":{\"awardId\":104,\"awardTitle\":\"小米台灯\",\"userId\":\"dzc\"},\"id\":\"78110342017\",\"timestamp\":1714546774404}','completed','2024-05-01 14:59:34','2024-05-01 14:59:34'),
    (121,'dzc','send_award','34349719655','{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"dzc\"},\"id\":\"34349719655\",\"timestamp\":1714546774481}','completed','2024-05-01 14:59:34','2024-05-01 14:59:34'),
    (122,'dzc','send_award','16795012327','{\"data\":{\"awardId\":108,\"awardTitle\":\"暴走玩偶\",\"userId\":\"dzc\"},\"id\":\"16795012327\",\"timestamp\":1714546774537}','completed','2024-05-01 14:59:34','2024-05-01 14:59:34'),
    (123,'dzc','send_rebate','01343683507','{\"data\":{\"bizId\":\"dzc_sku_2024042906\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"dzc\"},\"id\":\"01343683507\",\"timestamp\":1714546811980}','completed','2024-05-01 15:00:12','2024-05-01 15:00:12'),
    (124,'dzc','send_rebate','22675851113','{\"data\":{\"bizId\":\"dzc_integral_2024042906\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"dzc\"},\"id\":\"22675851113\",\"timestamp\":1714546811983}','completed','2024-05-01 15:00:12','2024-05-01 15:00:12'),
    (125,'dzc','send_rebate','72790041499','{\"data\":{\"bizId\":\"dzc_sku_20240501\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"dzc\"},\"id\":\"72790041499\",\"timestamp\":1714547646310}','completed','2024-05-01 15:14:06','2024-05-01 15:14:06'),
    (126,'dzc','send_rebate','07532513295','{\"data\":{\"bizId\":\"dzc_integral_20240501\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"dzc\"},\"id\":\"07532513295\",\"timestamp\":1714547646312}','completed','2024-05-01 15:14:06','2024-05-01 15:14:06'),
    (127,'12345','send_rebate','44168301206','{\"data\":{\"bizId\":\"12345_sku_20240501\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"12345\"},\"id\":\"44168301206\",\"timestamp\":1714548524834}','completed','2024-05-01 15:28:45','2024-05-01 15:28:45'),
    (128,'12345','send_rebate','77696087444','{\"data\":{\"bizId\":\"12345_integral_20240501\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"12345\"},\"id\":\"77696087444\",\"timestamp\":1714548524845}','completed','2024-05-01 15:28:45','2024-05-01 15:28:45'),
    (129,'dzc','send_rebate','53358221321','{\"data\":{\"bizId\":\"dzc_sku_20240501\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"dzc\"},\"id\":\"53358221321\",\"timestamp\":1714554815882}','completed','2024-05-01 17:13:36','2024-05-01 17:13:36'),
    (130,'dzc','send_rebate','29895043546','{\"data\":{\"bizId\":\"dzc_integral_20240501\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"dzc\"},\"id\":\"29895043546\",\"timestamp\":1714554815884}','completed','2024-05-01 17:13:36','2024-05-01 17:13:36'),
    (131,'dzc','send_rebate','97779206565','{\"data\":{\"bizId\":\"dzc_sku_20240420\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"dzc\"},\"id\":\"97779206565\",\"timestamp\":1714556371985}','completed','2024-05-01 17:39:32','2024-05-01 17:39:35'),
    (132,'dzc','send_rebate','63122692373','{\"data\":{\"bizId\":\"dzc_integral_20240420\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"dzc\"},\"id\":\"63122692373\",\"timestamp\":1714556371994}','completed','2024-05-01 17:39:32','2024-05-01 17:39:35'),
    (133,'dzc','send_rebate','64655129366','{\"data\":{\"bizId\":\"dzc_sku_20240401\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"dzc\"},\"id\":\"64655129366\",\"timestamp\":1714556504378}','completed','2024-05-01 17:41:45','2024-05-01 17:41:45'),
    (134,'dzc','send_rebate','38396244073','{\"data\":{\"bizId\":\"dzc_integral_20240401\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"dzc\"},\"id\":\"38396244073\",\"timestamp\":1714556504389}','completed','2024-05-01 17:41:45','2024-05-01 17:41:45'),
    (135,'dzc','send_rebate','08184105296','{\"data\":{\"bizId\":\"dzc_sku_20240402\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"dzc\"},\"id\":\"08184105296\",\"timestamp\":1714556709389}','completed','2024-05-01 17:45:09','2024-05-01 17:45:09'),
    (136,'dzc','send_rebate','16417473546','{\"data\":{\"bizId\":\"dzc_integral_20240402\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"dzc\"},\"id\":\"16417473546\",\"timestamp\":1714556709391}','completed','2024-05-01 17:45:09','2024-05-01 17:45:09'),
    (137,'dzc','send_rebate','04164162705','{\"data\":{\"bizId\":\"dzc_sku_20240501\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"dzc\"},\"id\":\"04164162705\",\"timestamp\":1714557266867}','completed','2024-05-01 17:54:27','2024-05-01 17:54:27'),
    (138,'dzc','send_rebate','79924892493','{\"data\":{\"bizId\":\"dzc_integral_20240501\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"dzc\"},\"id\":\"79924892493\",\"timestamp\":1714557266870}','completed','2024-05-01 17:54:27','2024-05-01 17:54:27'),
    (139,'dzc','send_award','90576859616','{\"data\":{\"awardId\":104,\"awardTitle\":\"小米台灯\",\"userId\":\"dzc\"},\"id\":\"90576859616\",\"timestamp\":1714698137578}','completed','2024-05-03 09:02:17','2024-05-03 09:02:17'),
    (140,'dzc','send_award','65620335186','{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"dzc\"},\"id\":\"65620335186\",\"timestamp\":1714698596791}','completed','2024-05-03 09:09:57','2024-05-03 09:09:57'),
    (141,'dzc','send_award','37556739286','{\"data\":{\"awardId\":102,\"awardTitle\":\"OpenAI会员卡\",\"userId\":\"dzc\"},\"id\":\"37556739286\",\"timestamp\":1714698634894}','completed','2024-05-03 09:10:35','2024-05-03 09:10:35'),
    (142,'dzc','send_award','55348135802','{\"data\":{\"awardId\":102,\"awardTitle\":\"OpenAI会员卡\",\"userId\":\"dzc\"},\"id\":\"55348135802\",\"timestamp\":1714698697948}','completed','2024-05-03 09:11:38','2024-05-03 09:11:38'),
    (143,'dzc','send_rebate','72638302928','{\"data\":{\"bizId\":\"dzc_sku_20240503\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"dzc\"},\"id\":\"72638302928\",\"timestamp\":1714714122098}','completed','2024-05-03 13:28:42','2024-05-03 13:28:42'),
    (144,'dzc','send_rebate','72714070579','{\"data\":{\"bizId\":\"dzc_integral_20240503\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"dzc\"},\"id\":\"72714070579\",\"timestamp\":1714714122101}','completed','2024-05-03 13:28:42','2024-05-03 13:28:42');

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
    (65,'dzc',100301,100006,'604661560037',107,'2等奖','2024-04-13 07:25:21','create','2024-04-13 15:25:21','2024-04-13 15:25:21'),
    (66,'dzc',100301,100006,'212448652580',105,'4等奖','2024-04-20 04:09:31','create','2024-04-20 12:09:30','2024-04-20 12:09:30'),
    (67,'dzc',100301,100006,'356729331179',106,'3等奖','2024-04-20 04:11:24','create','2024-04-20 12:11:24','2024-04-20 12:11:24'),
    (68,'dzc',100301,100006,'102669494145',105,'4等奖','2024-04-20 07:10:58','create','2024-04-20 15:10:58','2024-04-20 15:10:58'),
    (69,'dzc',100301,100006,'730186113832',107,'2等奖','2024-04-20 07:43:13','create','2024-04-20 15:43:13','2024-04-20 15:43:13'),
    (70,'dzc',100301,100006,'472281891603',106,'3等奖','2024-04-20 08:50:39','create','2024-04-20 16:50:39','2024-04-20 16:50:39'),
    (71,'dzc',100301,100006,'931181504757',108,'暴走玩偶','2024-04-27 05:19:39','create','2024-04-27 13:19:38','2024-04-27 13:19:38'),
    (72,'dzc',100301,100006,'664993621684',101,'随机积分','2024-04-27 05:27:17','create','2024-04-27 13:27:17','2024-04-27 13:27:17'),
    (73,'dzc',100301,100006,'757674779249',104,'小米台灯','2024-04-27 05:27:45','create','2024-04-27 13:27:45','2024-04-27 13:27:45'),
    (74,'dzc',100301,100006,'623885952534',102,'OpenAI会员卡','2024-04-27 05:28:02','create','2024-04-27 13:28:01','2024-04-27 13:28:01'),
    (75,'dzc',100301,100006,'351875766756',106,'轻奢办公椅','2024-04-27 05:29:05','create','2024-04-27 13:29:05','2024-04-27 13:29:05'),
    (76,'dzc',100301,100006,'803227763198',103,'支付优惠券','2024-04-27 05:29:32','create','2024-04-27 13:29:31','2024-04-27 13:29:31'),
    (77,'dzc',100301,100006,'587527322073',106,'轻奢办公椅','2024-04-27 05:29:57','create','2024-04-27 13:29:57','2024-04-27 13:29:57'),
    (78,'dzc',100301,100006,'552928609772',107,'小霸王游戏机','2024-04-27 05:30:11','create','2024-04-27 13:30:11','2024-04-27 13:30:11'),
    (79,'dzc',100301,100006,'407462568156',107,'小霸王游戏机','2024-04-27 05:36:27','create','2024-04-27 13:36:27','2024-04-27 13:36:27'),
    (80,'dzc',100301,100006,'688519386935',101,'随机积分','2024-04-27 05:38:00','create','2024-04-27 13:38:00','2024-04-27 13:38:00'),
    (81,'dzc',100301,100006,'148984382545',104,'小米台灯','2024-04-27 05:38:56','create','2024-04-27 13:38:55','2024-04-27 13:38:55'),
    (82,'dzc',100301,100006,'410701479648',101,'随机积分','2024-04-27 05:39:18','create','2024-04-27 13:39:18','2024-04-27 13:39:18'),
    (83,'dzc',100301,100006,'521226371540',101,'随机积分','2024-04-27 06:59:56','create','2024-04-27 14:59:56','2024-04-27 14:59:56'),
    (84,'dzc',100301,100006,'167000751553',102,'OpenAI会员卡','2024-04-27 07:00:14','create','2024-04-27 15:00:14','2024-04-27 15:00:14'),
    (85,'dzc',100301,100006,'685179511666',104,'小米台灯','2024-04-27 07:00:23','create','2024-04-27 15:00:22','2024-04-27 15:00:22'),
    (86,'dzc',100301,100006,'308424817839',108,'暴走玩偶','2024-05-01 06:57:39','create','2024-05-01 14:57:39','2024-05-01 14:57:39'),
    (87,'dzc',100301,100006,'116865823300',101,'随机积分','2024-05-01 06:58:09','create','2024-05-01 14:58:08','2024-05-01 14:58:08'),
    (88,'dzc',100301,100006,'272157347851',107,'小霸王游戏机','2024-05-01 06:59:33','create','2024-05-01 14:59:33','2024-05-01 14:59:33'),
    (89,'dzc',100301,100006,'400772556300',103,'支付优惠券','2024-05-01 06:59:33','create','2024-05-01 14:59:33','2024-05-01 14:59:33'),
    (90,'dzc',100301,100006,'494705137752',101,'随机积分','2024-05-01 06:59:33','create','2024-05-01 14:59:33','2024-05-01 14:59:33'),
    (91,'dzc',100301,100006,'728609897262',106,'轻奢办公椅','2024-05-01 06:59:34','create','2024-05-01 14:59:33','2024-05-01 14:59:33'),
    (92,'dzc',100301,100006,'085750418120',104,'小米台灯','2024-05-01 06:59:34','create','2024-05-01 14:59:33','2024-05-01 14:59:33'),
    (93,'dzc',100301,100006,'884615410376',107,'小霸王游戏机','2024-05-01 06:59:34','create','2024-05-01 14:59:33','2024-05-01 14:59:33'),
    (94,'dzc',100301,100006,'380693771158',107,'小霸王游戏机','2024-05-01 06:59:34','create','2024-05-01 14:59:33','2024-05-01 14:59:33'),
    (95,'dzc',100301,100006,'801793933954',103,'支付优惠券','2024-05-01 06:59:34','create','2024-05-01 14:59:33','2024-05-01 14:59:33'),
    (96,'dzc',100301,100006,'153569048026',108,'暴走玩偶','2024-05-01 06:59:34','create','2024-05-01 14:59:33','2024-05-01 14:59:33'),
    (97,'dzc',100301,100006,'239541957386',108,'暴走玩偶','2024-05-01 06:59:34','create','2024-05-01 14:59:33','2024-05-01 14:59:33'),
    (98,'dzc',100301,100006,'417247136950',108,'暴走玩偶','2024-05-01 06:59:34','create','2024-05-01 14:59:34','2024-05-01 14:59:34'),
    (99,'dzc',100301,100006,'556248667355',107,'小霸王游戏机','2024-05-01 06:59:34','create','2024-05-01 14:59:34','2024-05-01 14:59:34'),
    (100,'dzc',100301,100006,'828955445464',107,'小霸王游戏机','2024-05-01 06:59:34','create','2024-05-01 14:59:34','2024-05-01 14:59:34'),
    (101,'dzc',100301,100006,'756110942449',102,'OpenAI会员卡','2024-05-01 06:59:34','create','2024-05-01 14:59:34','2024-05-01 14:59:34'),
    (102,'dzc',100301,100006,'440069371435',101,'随机积分','2024-05-01 06:59:34','create','2024-05-01 14:59:34','2024-05-01 14:59:34'),
    (103,'dzc',100301,100006,'421594084633',108,'暴走玩偶','2024-05-01 06:59:34','create','2024-05-01 14:59:34','2024-05-01 14:59:34'),
    (104,'dzc',100301,100006,'500905040429',104,'小米台灯','2024-05-01 06:59:34','create','2024-05-01 14:59:34','2024-05-01 14:59:34'),
    (105,'dzc',100301,100006,'712386571628',101,'随机积分','2024-05-01 06:59:34','create','2024-05-01 14:59:34','2024-05-01 14:59:34'),
    (106,'dzc',100301,100006,'095923542021',108,'暴走玩偶','2024-05-01 06:59:35','create','2024-05-01 14:59:34','2024-05-01 14:59:34'),
    (107,'dzc',100301,100006,'306233708878',104,'小米台灯','2024-05-03 01:02:18','create','2024-05-03 09:02:17','2024-05-03 09:02:17'),
    (108,'dzc',100301,100006,'690124733440',101,'随机积分','2024-05-03 01:09:57','create','2024-05-03 09:09:57','2024-05-03 09:09:57'),
    (109,'dzc',100301,100006,'190487161872',102,'OpenAI会员卡','2024-05-03 01:10:35','create','2024-05-03 09:10:35','2024-05-03 09:10:35'),
    (110,'dzc',100301,100006,'693117324295',102,'OpenAI会员卡','2024-05-03 01:11:38','create','2024-05-03 09:11:38','2024-05-03 09:11:38');

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



# 转储表 user_behavior_rebate_order_000
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_behavior_rebate_order_000`;

CREATE TABLE `user_behavior_rebate_order_000` (
                                                  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                                  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
                                                  `order_id` varchar(12) NOT NULL COMMENT '订单ID',
                                                  `behavior_type` varchar(16) NOT NULL COMMENT '行为类型（sign 签到、openai_pay 支付）',
                                                  `rebate_desc` varchar(128) NOT NULL COMMENT '返利描述',
                                                  `rebate_type` varchar(16) NOT NULL COMMENT '返利类型（sku 活动库存充值商品、integral 用户活动积分）',
                                                  `rebate_config` varchar(32) NOT NULL COMMENT '返利配置【sku值，积分值】',
                                                  `out_business_no` varchar(64) NOT NULL COMMENT '业务仿重ID - 外部透传，方便查询使用',
                                                  `biz_id` varchar(128) NOT NULL COMMENT '业务ID - 拼接的唯一值。拼接 out_business_no + 自身枚举',
                                                  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                                  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                                  PRIMARY KEY (`id`),
                                                  UNIQUE KEY `uq_order_id` (`order_id`),
                                                  UNIQUE KEY `uq_biz_id` (`biz_id`),
                                                  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户行为返利流水订单表';



# 转储表 user_behavior_rebate_order_001
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_behavior_rebate_order_001`;

CREATE TABLE `user_behavior_rebate_order_001` (
                                                  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                                  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
                                                  `order_id` varchar(12) NOT NULL COMMENT '订单ID',
                                                  `behavior_type` varchar(16) NOT NULL COMMENT '行为类型（sign 签到、openai_pay 支付）',
                                                  `rebate_desc` varchar(128) NOT NULL COMMENT '返利描述',
                                                  `rebate_type` varchar(16) NOT NULL COMMENT '返利类型（sku 活动库存充值商品、integral 用户活动积分）',
                                                  `rebate_config` varchar(32) NOT NULL COMMENT '返利配置【sku值，积分值】',
                                                  `out_business_no` varchar(64) NOT NULL COMMENT '业务仿重ID - 外部透传，方便查询使用',
                                                  `biz_id` varchar(128) NOT NULL COMMENT '业务ID - 拼接的唯一值。拼接 out_business_no + 自身枚举',
                                                  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                                  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                                  PRIMARY KEY (`id`),
                                                  UNIQUE KEY `uq_order_id` (`order_id`),
                                                  UNIQUE KEY `uq_biz_id` (`biz_id`),
                                                  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户行为返利流水订单表';

LOCK TABLES `user_behavior_rebate_order_001` WRITE;
/*!40000 ALTER TABLE `user_behavior_rebate_order_001` DISABLE KEYS */;

INSERT INTO `user_behavior_rebate_order_001` (`id`, `user_id`, `order_id`, `behavior_type`, `rebate_desc`, `rebate_type`, `rebate_config`, `out_business_no`, `biz_id`, `create_time`, `update_time`)
VALUES
    (5,'dzc','630841674684','sign','签到返利-sku额度','sku','9011','20240503','dzc_sku_20240503','2024-05-03 13:28:42','2024-05-03 13:28:42'),
    (6,'dzc','552413408368','sign','签到返利-积分','integral','10','20240503','dzc_integral_20240503','2024-05-03 13:28:42','2024-05-03 13:28:42');

/*!40000 ALTER TABLE `user_behavior_rebate_order_001` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 user_behavior_rebate_order_002
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_behavior_rebate_order_002`;

CREATE TABLE `user_behavior_rebate_order_002` (
                                                  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                                  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
                                                  `order_id` varchar(12) NOT NULL COMMENT '订单ID',
                                                  `behavior_type` varchar(16) NOT NULL COMMENT '行为类型（sign 签到、openai_pay 支付）',
                                                  `rebate_desc` varchar(128) NOT NULL COMMENT '返利描述',
                                                  `rebate_type` varchar(16) NOT NULL COMMENT '返利类型（sku 活动库存充值商品、integral 用户活动积分）',
                                                  `rebate_config` varchar(32) NOT NULL COMMENT '返利配置【sku值，积分值】',
                                                  `out_business_no` varchar(64) NOT NULL COMMENT '业务仿重ID - 外部透传，方便查询使用',
                                                  `biz_id` varchar(128) NOT NULL COMMENT '业务ID - 拼接的唯一值。拼接 out_business_no + 自身枚举',
                                                  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                                  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                                  PRIMARY KEY (`id`),
                                                  UNIQUE KEY `uq_order_id` (`order_id`),
                                                  UNIQUE KEY `uq_biz_id` (`biz_id`),
                                                  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户行为返利流水订单表';



# 转储表 user_behavior_rebate_order_003
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_behavior_rebate_order_003`;

CREATE TABLE `user_behavior_rebate_order_003` (
                                                  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                                  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
                                                  `order_id` varchar(12) NOT NULL COMMENT '订单ID',
                                                  `behavior_type` varchar(16) NOT NULL COMMENT '行为类型（sign 签到、openai_pay 支付）',
                                                  `rebate_desc` varchar(128) NOT NULL COMMENT '返利描述',
                                                  `rebate_type` varchar(16) NOT NULL COMMENT '返利类型（sku 活动库存充值商品、integral 用户活动积分）',
                                                  `rebate_config` varchar(32) NOT NULL COMMENT '返利配置【sku值，积分值】',
                                                  `out_business_no` varchar(64) NOT NULL COMMENT '业务仿重ID - 外部透传，方便查询使用',
                                                  `biz_id` varchar(128) NOT NULL COMMENT '业务ID - 拼接的唯一值。拼接 out_business_no + 自身枚举',
                                                  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                                  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                                  PRIMARY KEY (`id`),
                                                  UNIQUE KEY `uq_order_id` (`order_id`),
                                                  UNIQUE KEY `uq_biz_id` (`biz_id`),
                                                  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户行为返利流水订单表';



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
    (31,'dzc',100301,'测试活动',100006,'604661560037','2024-04-13 07:25:13','used','2024-04-13 15:25:13','2024-04-13 15:25:21'),
    (32,'dzc',100301,'测试活动',100006,'212448652580','2024-04-20 04:09:30','used','2024-04-20 12:09:30','2024-04-20 12:09:30'),
    (33,'dzc',100301,'测试活动',100006,'356729331179','2024-04-20 04:11:24','used','2024-04-20 12:11:24','2024-04-20 12:11:24'),
    (34,'dzc',100301,'测试活动',100006,'102669494145','2024-04-20 07:10:44','used','2024-04-20 15:10:44','2024-04-20 15:10:58'),
    (35,'dzc',100301,'测试活动',100006,'730186113832','2024-04-20 07:43:12','used','2024-04-20 15:43:12','2024-04-20 15:43:13'),
    (36,'dzc',100301,'测试活动',100006,'472281891603','2024-04-20 08:50:37','used','2024-04-20 16:50:38','2024-04-20 16:50:39'),
    (37,'dzc',100301,'测试活动',100006,'931181504757','2024-04-27 05:19:26','used','2024-04-27 13:19:26','2024-04-27 13:19:38'),
    (38,'dzc',100301,'测试活动',100006,'664993621684','2024-04-27 05:26:49','used','2024-04-27 13:26:49','2024-04-27 13:27:17'),
    (39,'dzc',100301,'测试活动',100006,'757674779249','2024-04-27 05:27:45','used','2024-04-27 13:27:45','2024-04-27 13:27:45'),
    (40,'dzc',100301,'测试活动',100006,'623885952534','2024-04-27 05:28:02','used','2024-04-27 13:28:01','2024-04-27 13:28:01'),
    (41,'dzc',100301,'测试活动',100006,'351875766756','2024-04-27 05:29:05','used','2024-04-27 13:29:05','2024-04-27 13:29:05'),
    (42,'dzc',100301,'测试活动',100006,'803227763198','2024-04-27 05:29:32','used','2024-04-27 13:29:31','2024-04-27 13:29:31'),
    (43,'dzc',100301,'测试活动',100006,'587527322073','2024-04-27 05:29:57','used','2024-04-27 13:29:57','2024-04-27 13:29:57'),
    (44,'dzc',100301,'测试活动',100006,'552928609772','2024-04-27 05:30:11','used','2024-04-27 13:30:11','2024-04-27 13:30:11'),
    (45,'dzc',100301,'测试活动',100006,'407462568156','2024-04-27 05:36:27','used','2024-04-27 13:36:27','2024-04-27 13:36:27'),
    (46,'dzc',100301,'测试活动',100006,'688519386935','2024-04-27 05:38:00','used','2024-04-27 13:38:00','2024-04-27 13:38:00'),
    (47,'dzc',100301,'测试活动',100006,'148984382545','2024-04-27 05:38:56','used','2024-04-27 13:38:55','2024-04-27 13:38:55'),
    (48,'dzc',100301,'测试活动',100006,'410701479648','2024-04-27 05:39:18','used','2024-04-27 13:39:18','2024-04-27 13:39:18'),
    (49,'dzc',100301,'测试活动',100006,'521226371540','2024-04-27 06:59:56','used','2024-04-27 14:59:56','2024-04-27 14:59:56'),
    (50,'dzc',100301,'测试活动',100006,'167000751553','2024-04-27 07:00:14','used','2024-04-27 15:00:14','2024-04-27 15:00:14'),
    (51,'dzc',100301,'测试活动',100006,'685179511666','2024-04-27 07:00:23','used','2024-04-27 15:00:22','2024-04-27 15:00:22'),
    (52,'dzc',100301,'测试活动',100006,'308424817839','2024-05-01 06:33:42','used','2024-05-01 14:33:43','2024-05-01 14:57:39'),
    (53,'dzc',100301,'测试活动',100006,'116865823300','2024-05-01 06:58:08','used','2024-05-01 14:58:08','2024-05-01 14:58:08'),
    (54,'dzc',100301,'测试活动',100006,'272157347851','2024-05-01 06:59:32','used','2024-05-01 14:59:32','2024-05-01 14:59:33'),
    (55,'dzc',100301,'测试活动',100006,'400772556300','2024-05-01 06:59:33','used','2024-05-01 14:59:33','2024-05-01 14:59:33'),
    (56,'dzc',100301,'测试活动',100006,'494705137752','2024-05-01 06:59:33','used','2024-05-01 14:59:33','2024-05-01 14:59:33'),
    (57,'dzc',100301,'测试活动',100006,'728609897262','2024-05-01 06:59:34','used','2024-05-01 14:59:33','2024-05-01 14:59:33'),
    (58,'dzc',100301,'测试活动',100006,'085750418120','2024-05-01 06:59:34','used','2024-05-01 14:59:33','2024-05-01 14:59:33'),
    (59,'dzc',100301,'测试活动',100006,'884615410376','2024-05-01 06:59:34','used','2024-05-01 14:59:33','2024-05-01 14:59:33'),
    (60,'dzc',100301,'测试活动',100006,'380693771158','2024-05-01 06:59:34','used','2024-05-01 14:59:33','2024-05-01 14:59:33'),
    (61,'dzc',100301,'测试活动',100006,'801793933954','2024-05-01 06:59:34','used','2024-05-01 14:59:33','2024-05-01 14:59:33'),
    (62,'dzc',100301,'测试活动',100006,'153569048026','2024-05-01 06:59:34','used','2024-05-01 14:59:33','2024-05-01 14:59:33'),
    (63,'dzc',100301,'测试活动',100006,'239541957386','2024-05-01 06:59:34','used','2024-05-01 14:59:33','2024-05-01 14:59:33'),
    (64,'dzc',100301,'测试活动',100006,'417247136950','2024-05-01 06:59:34','used','2024-05-01 14:59:33','2024-05-01 14:59:34'),
    (65,'dzc',100301,'测试活动',100006,'556248667355','2024-05-01 06:59:34','used','2024-05-01 14:59:34','2024-05-01 14:59:34'),
    (66,'dzc',100301,'测试活动',100006,'828955445464','2024-05-01 06:59:34','used','2024-05-01 14:59:34','2024-05-01 14:59:34'),
    (67,'dzc',100301,'测试活动',100006,'756110942449','2024-05-01 06:59:34','used','2024-05-01 14:59:34','2024-05-01 14:59:34'),
    (68,'dzc',100301,'测试活动',100006,'440069371435','2024-05-01 06:59:34','used','2024-05-01 14:59:34','2024-05-01 14:59:34'),
    (69,'dzc',100301,'测试活动',100006,'421594084633','2024-05-01 06:59:34','used','2024-05-01 14:59:34','2024-05-01 14:59:34'),
    (70,'dzc',100301,'测试活动',100006,'500905040429','2024-05-01 06:59:34','used','2024-05-01 14:59:34','2024-05-01 14:59:34'),
    (71,'dzc',100301,'测试活动',100006,'712386571628','2024-05-01 06:59:34','used','2024-05-01 14:59:34','2024-05-01 14:59:34'),
    (72,'dzc',100301,'测试活动',100006,'095923542021','2024-05-01 06:59:34','used','2024-05-01 14:59:34','2024-05-01 14:59:34'),
    (73,'dzc',100301,'测试活动',100006,'306233708878','2024-05-03 01:00:27','used','2024-05-03 09:00:28','2024-05-03 09:02:17'),
    (74,'dzc',100301,'测试活动',100006,'690124733440','2024-05-03 01:09:42','used','2024-05-03 09:09:42','2024-05-03 09:09:57'),
    (75,'dzc',100301,'测试活动',100006,'190487161872','2024-05-03 01:10:28','used','2024-05-03 09:10:28','2024-05-03 09:10:35'),
    (76,'dzc',100301,'测试活动',100006,'693117324295','2024-05-03 01:11:32','used','2024-05-03 09:11:32','2024-05-03 09:11:38');

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
