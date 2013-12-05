-- MySQL dump 10.13  Distrib 5.1.66, for redhat-linux-gnu (i386)
--
-- Host: localhost    Database: appServerDB
-- ------------------------------------------------------
-- Server version	5.1.66

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_5f412f9a` (`group_id`),
  KEY `auth_group_permissions_83d7f98b` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_37ef4eb4` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission');
INSERT INTO `auth_permission` VALUES (2,'Can change permission',1,'change_permission');
INSERT INTO `auth_permission` VALUES (3,'Can delete permission',1,'delete_permission');
INSERT INTO `auth_permission` VALUES (4,'Can add group',2,'add_group');
INSERT INTO `auth_permission` VALUES (5,'Can change group',2,'change_group');
INSERT INTO `auth_permission` VALUES (6,'Can delete group',2,'delete_group');
INSERT INTO `auth_permission` VALUES (7,'Can add user',3,'add_user');
INSERT INTO `auth_permission` VALUES (8,'Can change user',3,'change_user');
INSERT INTO `auth_permission` VALUES (9,'Can delete user',3,'delete_user');
INSERT INTO `auth_permission` VALUES (10,'Can add content type',4,'add_contenttype');
INSERT INTO `auth_permission` VALUES (11,'Can change content type',4,'change_contenttype');
INSERT INTO `auth_permission` VALUES (12,'Can delete content type',4,'delete_contenttype');
INSERT INTO `auth_permission` VALUES (13,'Can add session',5,'add_session');
INSERT INTO `auth_permission` VALUES (14,'Can change session',5,'change_session');
INSERT INTO `auth_permission` VALUES (15,'Can delete session',5,'delete_session');
INSERT INTO `auth_permission` VALUES (16,'Can add site',6,'add_site');
INSERT INTO `auth_permission` VALUES (17,'Can change site',6,'change_site');
INSERT INTO `auth_permission` VALUES (18,'Can delete site',6,'delete_site');
INSERT INTO `auth_permission` VALUES (19,'Can add user',7,'add_user');
INSERT INTO `auth_permission` VALUES (20,'Can change user',7,'change_user');
INSERT INTO `auth_permission` VALUES (21,'Can delete user',7,'delete_user');
INSERT INTO `auth_permission` VALUES (22,'Can add chapter',8,'add_chapter');
INSERT INTO `auth_permission` VALUES (23,'Can change chapter',8,'change_chapter');
INSERT INTO `auth_permission` VALUES (24,'Can delete chapter',8,'delete_chapter');
INSERT INTO `auth_permission` VALUES (25,'Can add story',9,'add_story');
INSERT INTO `auth_permission` VALUES (26,'Can change story',9,'change_story');
INSERT INTO `auth_permission` VALUES (27,'Can delete story',9,'delete_story');
INSERT INTO `auth_permission` VALUES (28,'Can add log entry',10,'add_logentry');
INSERT INTO `auth_permission` VALUES (29,'Can change log entry',10,'change_logentry');
INSERT INTO `auth_permission` VALUES (30,'Can delete log entry',10,'delete_logentry');
INSERT INTO `auth_permission` VALUES (31,'Can add migration history',11,'add_migrationhistory');
INSERT INTO `auth_permission` VALUES (32,'Can change migration history',11,'change_migrationhistory');
INSERT INTO `auth_permission` VALUES (33,'Can delete migration history',11,'delete_migrationhistory');
INSERT INTO `auth_permission` VALUES (34,'Can add coauthors statistics',12,'add_coauthorsstatistics');
INSERT INTO `auth_permission` VALUES (35,'Can change coauthors statistics',12,'change_coauthorsstatistics');
INSERT INTO `auth_permission` VALUES (36,'Can delete coauthors statistics',12,'delete_coauthorsstatistics');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$10000$gjR78wLV5YcX$HdYwvq4hsIcc5W/d5baI+4bCxbxN+sDtvPbrh2ini8w=','2013-11-13 12:01:33',1,'hm','','','kobe6672823@qq.com',1,1,'2013-08-27 07:17:12');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_6340c63c` (`user_id`),
  KEY `auth_user_groups_5f412f9a` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_6340c63c` (`user_id`),
  KEY `auth_user_user_permissions_83d7f98b` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_6340c63c` (`user_id`),
  KEY `django_admin_log_37ef4eb4` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2013-08-28 02:04:57',1,7,'access token check failed','access token check failed',3,'');
INSERT INTO `django_admin_log` VALUES (2,'2013-08-28 09:30:19',1,8,'1','1',1,'');
INSERT INTO `django_admin_log` VALUES (3,'2013-08-28 09:37:38',1,8,'2','2',1,'');
INSERT INTO `django_admin_log` VALUES (4,'2013-08-28 09:38:58',1,8,'3','3',1,'');
INSERT INTO `django_admin_log` VALUES (5,'2013-08-28 09:44:38',1,9,'1','1',1,'');
INSERT INTO `django_admin_log` VALUES (6,'2013-08-28 09:44:54',1,8,'3','3',3,'');
INSERT INTO `django_admin_log` VALUES (7,'2013-08-28 09:45:01',1,8,'2','2',3,'');
INSERT INTO `django_admin_log` VALUES (8,'2013-08-28 09:45:49',1,8,'4','4',1,'');
INSERT INTO `django_admin_log` VALUES (9,'2013-08-28 09:52:56',1,7,'1122a3sdfs','1122a3sdfs',1,'');
INSERT INTO `django_admin_log` VALUES (10,'2013-08-28 10:01:53',1,7,'3165416546','3165416546',1,'');
INSERT INTO `django_admin_log` VALUES (11,'2013-08-28 10:02:19',1,8,'1','1',1,'');
INSERT INTO `django_admin_log` VALUES (12,'2013-08-28 10:02:55',1,7,'99','99',1,'');
INSERT INTO `django_admin_log` VALUES (13,'2013-08-28 10:03:10',1,8,'1','1',1,'');
INSERT INTO `django_admin_log` VALUES (14,'2013-08-28 10:05:06',1,7,'303','303',1,'');
INSERT INTO `django_admin_log` VALUES (15,'2013-08-28 10:05:27',1,7,'56','56',1,'');
INSERT INTO `django_admin_log` VALUES (16,'2013-08-28 10:05:41',1,7,'6456','6456',1,'');
INSERT INTO `django_admin_log` VALUES (17,'2013-08-28 10:06:14',1,7,'266','266',1,'');
INSERT INTO `django_admin_log` VALUES (18,'2013-08-28 10:06:31',1,8,'1','1',1,'');
INSERT INTO `django_admin_log` VALUES (19,'2013-08-28 10:13:34',1,9,'1','aaaa',1,'');
INSERT INTO `django_admin_log` VALUES (20,'2013-08-28 10:14:22',1,8,'1','1',1,'');
INSERT INTO `django_admin_log` VALUES (21,'2013-08-28 10:15:09',1,8,'1','1',1,'');
INSERT INTO `django_admin_log` VALUES (22,'2013-08-28 10:15:27',1,8,'1','1',1,'');
INSERT INTO `django_admin_log` VALUES (23,'2013-08-28 10:34:14',1,7,'1522','1522',1,'');
INSERT INTO `django_admin_log` VALUES (24,'2013-08-28 10:34:36',1,7,'sdf','sdf',1,'');
INSERT INTO `django_admin_log` VALUES (25,'2013-08-28 10:34:50',1,8,'1','1',1,'');
INSERT INTO `django_admin_log` VALUES (26,'2013-08-28 10:36:29',1,8,'2','sdfsf',1,'');
INSERT INTO `django_admin_log` VALUES (27,'2013-08-28 10:36:32',1,9,'1','3132',1,'');
INSERT INTO `django_admin_log` VALUES (28,'2013-08-28 11:39:02',1,8,'5','start chap',3,'');
INSERT INTO `django_admin_log` VALUES (29,'2013-08-28 11:39:06',1,8,'4','start chap',3,'');
INSERT INTO `django_admin_log` VALUES (30,'2013-08-28 11:39:09',1,8,'3','start chap',3,'');
INSERT INTO `django_admin_log` VALUES (31,'2013-08-28 11:39:13',1,8,'2','sdfsf',3,'');
INSERT INTO `django_admin_log` VALUES (32,'2013-08-28 11:39:17',1,8,'1','asdfasdf',3,'');
INSERT INTO `django_admin_log` VALUES (33,'2013-09-03 10:15:32',1,7,'1522','1522',1,'');
INSERT INTO `django_admin_log` VALUES (34,'2013-10-15 02:17:26',1,8,'7','sdfasf',1,'');
INSERT INTO `django_admin_log` VALUES (35,'2013-10-15 02:18:12',1,8,'7','sdfasf',2,'No fields changed.');
INSERT INTO `django_admin_log` VALUES (36,'2013-10-15 02:26:23',1,8,'7','sdfasf',3,'');
INSERT INTO `django_admin_log` VALUES (37,'2013-10-15 02:26:23',1,8,'6','start chap',3,'');
INSERT INTO `django_admin_log` VALUES (38,'2013-10-15 02:26:23',1,8,'5','test create new chapter',3,'');
INSERT INTO `django_admin_log` VALUES (39,'2013-10-15 02:26:23',1,8,'4','test create new chapter',3,'');
INSERT INTO `django_admin_log` VALUES (40,'2013-10-15 02:26:23',1,8,'3','test create new chapter',3,'');
INSERT INTO `django_admin_log` VALUES (41,'2013-10-15 02:26:23',1,8,'2','test create new chapter',3,'');
INSERT INTO `django_admin_log` VALUES (42,'2013-10-15 02:26:23',1,8,'1','start chap',3,'');
INSERT INTO `django_admin_log` VALUES (43,'2013-10-15 02:36:45',1,8,'8','agasdgsa',1,'');
INSERT INTO `django_admin_log` VALUES (44,'2013-10-15 02:36:48',1,9,'3','frist story',1,'');
INSERT INTO `django_admin_log` VALUES (45,'2013-10-15 02:37:20',1,8,'9','456456',1,'');
INSERT INTO `django_admin_log` VALUES (46,'2013-10-15 03:30:26',1,8,'9','456456',2,'No fields changed.');
INSERT INTO `django_admin_log` VALUES (47,'2013-10-15 03:30:32',1,8,'9','456456',2,'Changed parentId.');
INSERT INTO `django_admin_log` VALUES (48,'2013-10-15 03:30:55',1,8,'10','asdfasf',1,'');
INSERT INTO `django_admin_log` VALUES (49,'2013-10-15 04:18:11',1,8,'1','test create new chapter',3,'');
INSERT INTO `django_admin_log` VALUES (50,'2013-10-15 04:18:36',1,8,'2','adfasdf',1,'');
INSERT INTO `django_admin_log` VALUES (51,'2013-10-15 04:18:38',1,9,'1','sadfaf',1,'');
INSERT INTO `django_admin_log` VALUES (52,'2013-10-16 07:05:34',1,7,'1522','1522',1,'');
INSERT INTO `django_admin_log` VALUES (53,'2013-10-16 07:06:16',1,8,'1','asdfsf',1,'');
INSERT INTO `django_admin_log` VALUES (54,'2013-10-16 07:06:25',1,9,'1','3132',1,'');
INSERT INTO `django_admin_log` VALUES (55,'2013-10-16 07:27:42',1,7,'1122a3sdfs','1122a3sdfs',1,'');
INSERT INTO `django_admin_log` VALUES (56,'2013-10-16 07:28:18',1,8,'1','sdfsdfasf',1,'');
INSERT INTO `django_admin_log` VALUES (57,'2013-10-16 07:28:25',1,9,'1','3132',1,'');
INSERT INTO `django_admin_log` VALUES (58,'2013-10-16 07:48:04',1,7,'1557','1557',1,'');
INSERT INTO `django_admin_log` VALUES (59,'2013-10-16 08:12:38',1,7,'1522','1522',1,'');
INSERT INTO `django_admin_log` VALUES (60,'2013-10-16 08:13:02',1,8,'1','sfsfdasf',1,'');
INSERT INTO `django_admin_log` VALUES (61,'2013-10-16 08:13:04',1,9,'1','aaaa',1,'');
INSERT INTO `django_admin_log` VALUES (62,'2013-10-18 01:53:11',1,7,'1557','1557',1,'');
INSERT INTO `django_admin_log` VALUES (63,'2013-10-18 01:57:14',1,8,'1','adsgadsg',1,'');
INSERT INTO `django_admin_log` VALUES (64,'2013-10-18 01:57:18',1,9,'1','Story object',1,'');
INSERT INTO `django_admin_log` VALUES (65,'2013-10-18 01:57:48',1,8,'1','adsgadsg',2,'Changed storyid.');
INSERT INTO `django_admin_log` VALUES (66,'2013-10-18 02:05:23',1,8,'1','adsgadsg',2,'Changed storyId.');
INSERT INTO `django_admin_log` VALUES (67,'2013-10-18 07:50:09',1,9,'4','abc',3,'');
INSERT INTO `django_admin_log` VALUES (68,'2013-10-18 07:50:09',1,9,'3','abc',3,'');
INSERT INTO `django_admin_log` VALUES (69,'2013-10-18 07:50:09',1,9,'2','abc',3,'');
INSERT INTO `django_admin_log` VALUES (70,'2013-10-18 07:50:09',1,9,'1','333',3,'');
INSERT INTO `django_admin_log` VALUES (71,'2013-10-18 07:50:19',1,8,'8','start chap',3,'');
INSERT INTO `django_admin_log` VALUES (72,'2013-10-18 07:50:19',1,8,'7','start chap',3,'');
INSERT INTO `django_admin_log` VALUES (73,'2013-10-18 07:50:19',1,8,'6','test create new chapter',3,'');
INSERT INTO `django_admin_log` VALUES (74,'2013-10-18 07:50:19',1,8,'5','test create new chapter',3,'');
INSERT INTO `django_admin_log` VALUES (75,'2013-10-18 07:50:19',1,8,'4','test create new chapter',3,'');
INSERT INTO `django_admin_log` VALUES (76,'2013-10-18 07:50:19',1,8,'3','test create new chapter',3,'');
INSERT INTO `django_admin_log` VALUES (77,'2013-10-18 07:50:19',1,8,'2','start chap',3,'');
INSERT INTO `django_admin_log` VALUES (78,'2013-10-18 07:50:19',1,8,'1','adsgadsg',3,'');
INSERT INTO `django_admin_log` VALUES (79,'2013-10-18 07:58:51',1,8,'15','test create new chapter',3,'');
INSERT INTO `django_admin_log` VALUES (80,'2013-10-18 07:58:51',1,8,'14','test create new chapter',3,'');
INSERT INTO `django_admin_log` VALUES (81,'2013-10-18 07:58:51',1,8,'13','start chap',3,'');
INSERT INTO `django_admin_log` VALUES (82,'2013-10-18 07:58:51',1,8,'12','test create new chapter',3,'');
INSERT INTO `django_admin_log` VALUES (83,'2013-10-18 07:58:51',1,8,'11','test create new chapter',3,'');
INSERT INTO `django_admin_log` VALUES (84,'2013-10-18 07:58:51',1,8,'10','test create new chapter',3,'');
INSERT INTO `django_admin_log` VALUES (85,'2013-10-18 07:58:51',1,8,'9','start chap',3,'');
INSERT INTO `django_admin_log` VALUES (86,'2013-10-18 08:03:58',1,8,'18','test create new chapter',3,'');
INSERT INTO `django_admin_log` VALUES (87,'2013-10-18 08:03:58',1,8,'17','test create new chapter',3,'');
INSERT INTO `django_admin_log` VALUES (88,'2013-10-18 08:03:58',1,8,'16','start chap',3,'');
INSERT INTO `django_admin_log` VALUES (89,'2013-11-21 07:51:44',1,8,'19','start chap',2,'Changed shareNum, collectNum and scanNum.');
INSERT INTO `django_admin_log` VALUES (90,'2013-11-21 07:51:55',1,9,'3','abc',2,'Changed shareNum, collectNum and scanNum.');
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'permission','auth','permission');
INSERT INTO `django_content_type` VALUES (2,'group','auth','group');
INSERT INTO `django_content_type` VALUES (3,'user','auth','user');
INSERT INTO `django_content_type` VALUES (4,'content type','contenttypes','contenttype');
INSERT INTO `django_content_type` VALUES (5,'session','sessions','session');
INSERT INTO `django_content_type` VALUES (6,'site','sites','site');
INSERT INTO `django_content_type` VALUES (7,'user','game','user');
INSERT INTO `django_content_type` VALUES (8,'chapter','game','chapter');
INSERT INTO `django_content_type` VALUES (9,'story','game','story');
INSERT INTO `django_content_type` VALUES (10,'log entry','admin','logentry');
INSERT INTO `django_content_type` VALUES (11,'migration history','south','migrationhistory');
INSERT INTO `django_content_type` VALUES (12,'coauthors statistics','game','coauthorsstatistics');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_b7b81f0c` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('t7fbr9859qble0w7anyx5pc6e77hhl7s','ODY2NWFkOWE3MzA0NzQ0YjUzNDBlYjdlZWQyNDg4NmJjMmEzYzY1ODqAAn1xAVUDbWlkcQJVGWFjY2VzcyB0b2tlbiBjaGVjayBmYWlsZWRxA3Mu','2013-09-11 01:58:52');
INSERT INTO `django_session` VALUES ('r8w4c8s4l0kf7p2buoy4ee320eg8hnmw','MWUwNTIyMjVlNzlhMmRhYmU1ZGQ0YTFjZjljZjM3ZmMzYzE3YzdjMTqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==','2013-09-10 07:17:27');
INSERT INTO `django_session` VALUES ('2534cy3yu39djpr5ny9w605cbt1xuari','Y2Y3ZTEzNDAwYWZiM2M3ZWM3YWI1MTQ4MGYyZWU1YmNmZjRhNGUzYjqAAn1xAVUDbWlkcQJVIDgzMEI4RTIyRjMzNjY4MkUwOTg5QTNGMDJGMEJEOEMxcQNzLg==','2013-09-11 01:58:53');
INSERT INTO `django_session` VALUES ('hiixddfmbltehm3g13qgj474tqtgledg','ODY2NWFkOWE3MzA0NzQ0YjUzNDBlYjdlZWQyNDg4NmJjMmEzYzY1ODqAAn1xAVUDbWlkcQJVGWFjY2VzcyB0b2tlbiBjaGVjayBmYWlsZWRxA3Mu','2013-09-11 02:00:35');
INSERT INTO `django_session` VALUES ('51wwcy5ebhnhvv7qzmmbjqj8rz2hctap','Y2Y3ZTEzNDAwYWZiM2M3ZWM3YWI1MTQ4MGYyZWU1YmNmZjRhNGUzYjqAAn1xAVUDbWlkcQJVIDgzMEI4RTIyRjMzNjY4MkUwOTg5QTNGMDJGMEJEOEMxcQNzLg==','2013-09-11 02:00:36');
INSERT INTO `django_session` VALUES ('0k02lenkrheacb9rhgmap9mo9scmuih7','ODY2NWFkOWE3MzA0NzQ0YjUzNDBlYjdlZWQyNDg4NmJjMmEzYzY1ODqAAn1xAVUDbWlkcQJVGWFjY2VzcyB0b2tlbiBjaGVjayBmYWlsZWRxA3Mu','2013-09-11 02:02:40');
INSERT INTO `django_session` VALUES ('9z8qkyax0fbe7la2t2kj18tdaak4j6zc','Y2Y3ZTEzNDAwYWZiM2M3ZWM3YWI1MTQ4MGYyZWU1YmNmZjRhNGUzYjqAAn1xAVUDbWlkcQJVIDgzMEI4RTIyRjMzNjY4MkUwOTg5QTNGMDJGMEJEOEMxcQNzLg==','2013-09-11 02:02:40');
INSERT INTO `django_session` VALUES ('wbpdx5rihgpf783ppa8zn0rcqb3zeyev','Y2Y3ZTEzNDAwYWZiM2M3ZWM3YWI1MTQ4MGYyZWU1YmNmZjRhNGUzYjqAAn1xAVUDbWlkcQJVIDgzMEI4RTIyRjMzNjY4MkUwOTg5QTNGMDJGMEJEOEMxcQNzLg==','2013-09-11 02:04:25');
INSERT INTO `django_session` VALUES ('r4r1eoo4quq9ck2nnwediobifo6p2p6a','OTkxYmQxZWI1YTQ5ZDc0M2IxYmRmOThkMDZkZDcwYzRiNGQwODI4NTqAAn1xAVUDbWlkcQJKWdANe3Mu','2013-09-11 03:30:01');
INSERT INTO `django_session` VALUES ('qzhz7le8lv30ojxusov2qegt542ent0s','Y2Y3ZTEzNDAwYWZiM2M3ZWM3YWI1MTQ4MGYyZWU1YmNmZjRhNGUzYjqAAn1xAVUDbWlkcQJVIDgzMEI4RTIyRjMzNjY4MkUwOTg5QTNGMDJGMEJEOEMxcQNzLg==','2013-09-11 03:43:37');
INSERT INTO `django_session` VALUES ('73py5c9qdee6hvkglkn9ejedcu8wrfry','Y2Y3ZTEzNDAwYWZiM2M3ZWM3YWI1MTQ4MGYyZWU1YmNmZjRhNGUzYjqAAn1xAVUDbWlkcQJVIDgzMEI4RTIyRjMzNjY4MkUwOTg5QTNGMDJGMEJEOEMxcQNzLg==','2013-09-11 03:44:17');
INSERT INTO `django_session` VALUES ('4wlads2j5qlfcgwcthaaz3bom07ooyht','Y2Y3ZTEzNDAwYWZiM2M3ZWM3YWI1MTQ4MGYyZWU1YmNmZjRhNGUzYjqAAn1xAVUDbWlkcQJVIDgzMEI4RTIyRjMzNjY4MkUwOTg5QTNGMDJGMEJEOEMxcQNzLg==','2013-09-11 03:46:00');
INSERT INTO `django_session` VALUES ('av9qrona4hztl4gbr61vw50z9yyw4r1b','Y2Y3ZTEzNDAwYWZiM2M3ZWM3YWI1MTQ4MGYyZWU1YmNmZjRhNGUzYjqAAn1xAVUDbWlkcQJVIDgzMEI4RTIyRjMzNjY4MkUwOTg5QTNGMDJGMEJEOEMxcQNzLg==','2013-09-11 03:48:07');
INSERT INTO `django_session` VALUES ('solvmjze19t9ct330if7hflfr4gexoox','OTkxYmQxZWI1YTQ5ZDc0M2IxYmRmOThkMDZkZDcwYzRiNGQwODI4NTqAAn1xAVUDbWlkcQJKWdANe3Mu','2013-09-11 03:48:11');
INSERT INTO `django_session` VALUES ('cpfnqzr3osyni7hm4oa9vqvrx35l9j0f','OTkxYmQxZWI1YTQ5ZDc0M2IxYmRmOThkMDZkZDcwYzRiNGQwODI4NTqAAn1xAVUDbWlkcQJKWdANe3Mu','2013-09-11 07:05:42');
INSERT INTO `django_session` VALUES ('joufmtnux7k4e62nc9fx1rku7tyergvl','Y2Y3ZTEzNDAwYWZiM2M3ZWM3YWI1MTQ4MGYyZWU1YmNmZjRhNGUzYjqAAn1xAVUDbWlkcQJVIDgzMEI4RTIyRjMzNjY4MkUwOTg5QTNGMDJGMEJEOEMxcQNzLg==','2013-09-11 07:05:49');
INSERT INTO `django_session` VALUES ('agcpnkdnotp8l17ecjosubb1vmv50l6z','OTkxYmQxZWI1YTQ5ZDc0M2IxYmRmOThkMDZkZDcwYzRiNGQwODI4NTqAAn1xAVUDbWlkcQJKWdANe3Mu','2013-09-11 07:06:57');
INSERT INTO `django_session` VALUES ('asr1isv6tkt7ikj828tno3q7k2a1yjol','Y2Y3ZTEzNDAwYWZiM2M3ZWM3YWI1MTQ4MGYyZWU1YmNmZjRhNGUzYjqAAn1xAVUDbWlkcQJVIDgzMEI4RTIyRjMzNjY4MkUwOTg5QTNGMDJGMEJEOEMxcQNzLg==','2013-09-11 09:24:17');
INSERT INTO `django_session` VALUES ('cfyqylhigwnmmfelv5m90k9okfl7noi5','OTkxYmQxZWI1YTQ5ZDc0M2IxYmRmOThkMDZkZDcwYzRiNGQwODI4NTqAAn1xAVUDbWlkcQJKWdANe3Mu','2013-09-11 09:24:26');
INSERT INTO `django_session` VALUES ('l2tvgo103b1acyx0ql8hyubhyp1cocta','Y2Y3ZTEzNDAwYWZiM2M3ZWM3YWI1MTQ4MGYyZWU1YmNmZjRhNGUzYjqAAn1xAVUDbWlkcQJVIDgzMEI4RTIyRjMzNjY4MkUwOTg5QTNGMDJGMEJEOEMxcQNzLg==','2013-09-11 11:19:48');
INSERT INTO `django_session` VALUES ('l19snpzqj3x7cgdw2esalw5dxcgjru88','Y2Y3ZTEzNDAwYWZiM2M3ZWM3YWI1MTQ4MGYyZWU1YmNmZjRhNGUzYjqAAn1xAVUDbWlkcQJVIDgzMEI4RTIyRjMzNjY4MkUwOTg5QTNGMDJGMEJEOEMxcQNzLg==','2013-09-11 11:21:37');
INSERT INTO `django_session` VALUES ('auo737hzdq08mau4826gou6cozcng3pm','Y2Y3ZTEzNDAwYWZiM2M3ZWM3YWI1MTQ4MGYyZWU1YmNmZjRhNGUzYjqAAn1xAVUDbWlkcQJVIDgzMEI4RTIyRjMzNjY4MkUwOTg5QTNGMDJGMEJEOEMxcQNzLg==','2013-09-11 11:26:50');
INSERT INTO `django_session` VALUES ('8geczbp4qjxz8bx7hinnlr6278boockj','Y2Y3ZTEzNDAwYWZiM2M3ZWM3YWI1MTQ4MGYyZWU1YmNmZjRhNGUzYjqAAn1xAVUDbWlkcQJVIDgzMEI4RTIyRjMzNjY4MkUwOTg5QTNGMDJGMEJEOEMxcQNzLg==','2013-09-11 11:27:47');
INSERT INTO `django_session` VALUES ('1fm1ev7xfbdssfjvfbrieppf6xxih11m','Y2Y3ZTEzNDAwYWZiM2M3ZWM3YWI1MTQ4MGYyZWU1YmNmZjRhNGUzYjqAAn1xAVUDbWlkcQJVIDgzMEI4RTIyRjMzNjY4MkUwOTg5QTNGMDJGMEJEOEMxcQNzLg==','2013-09-11 11:29:27');
INSERT INTO `django_session` VALUES ('23yvkmqsxpqmep7n9qvukvear4knkuj2','Y2Y3ZTEzNDAwYWZiM2M3ZWM3YWI1MTQ4MGYyZWU1YmNmZjRhNGUzYjqAAn1xAVUDbWlkcQJVIDgzMEI4RTIyRjMzNjY4MkUwOTg5QTNGMDJGMEJEOEMxcQNzLg==','2013-09-11 11:31:03');
INSERT INTO `django_session` VALUES ('4lpaxpzq5tca7ppwm5vlipvi1sskutoz','Y2Y3ZTEzNDAwYWZiM2M3ZWM3YWI1MTQ4MGYyZWU1YmNmZjRhNGUzYjqAAn1xAVUDbWlkcQJVIDgzMEI4RTIyRjMzNjY4MkUwOTg5QTNGMDJGMEJEOEMxcQNzLg==','2013-09-11 11:32:12');
INSERT INTO `django_session` VALUES ('8funvzqj0r19yaxzc1ozjp5puk40r0ft','Y2Y3ZTEzNDAwYWZiM2M3ZWM3YWI1MTQ4MGYyZWU1YmNmZjRhNGUzYjqAAn1xAVUDbWlkcQJVIDgzMEI4RTIyRjMzNjY4MkUwOTg5QTNGMDJGMEJEOEMxcQNzLg==','2013-09-11 11:37:15');
INSERT INTO `django_session` VALUES ('qn3gt4msssou52vv0vpmmg16gbgqhdcg','Y2Y3ZTEzNDAwYWZiM2M3ZWM3YWI1MTQ4MGYyZWU1YmNmZjRhNGUzYjqAAn1xAVUDbWlkcQJVIDgzMEI4RTIyRjMzNjY4MkUwOTg5QTNGMDJGMEJEOEMxcQNzLg==','2013-09-11 11:37:48');
INSERT INTO `django_session` VALUES ('7zl34p0n0qaqkei8p0a0x8cjasr94uq8','Y2Y3ZTEzNDAwYWZiM2M3ZWM3YWI1MTQ4MGYyZWU1YmNmZjRhNGUzYjqAAn1xAVUDbWlkcQJVIDgzMEI4RTIyRjMzNjY4MkUwOTg5QTNGMDJGMEJEOEMxcQNzLg==','2013-09-11 11:38:12');
INSERT INTO `django_session` VALUES ('26qmpjpy9ckjdalblxmb2ya4klwe2ehk','Y2Y3ZTEzNDAwYWZiM2M3ZWM3YWI1MTQ4MGYyZWU1YmNmZjRhNGUzYjqAAn1xAVUDbWlkcQJVIDgzMEI4RTIyRjMzNjY4MkUwOTg5QTNGMDJGMEJEOEMxcQNzLg==','2013-09-11 11:39:30');
INSERT INTO `django_session` VALUES ('s76jhib80gluoc3qybq4uogytmmtxsqu','Y2Y3ZTEzNDAwYWZiM2M3ZWM3YWI1MTQ4MGYyZWU1YmNmZjRhNGUzYjqAAn1xAVUDbWlkcQJVIDgzMEI4RTIyRjMzNjY4MkUwOTg5QTNGMDJGMEJEOEMxcQNzLg==','2013-09-11 11:40:06');
INSERT INTO `django_session` VALUES ('zdwpi4im3j75ulw14km0svxqzi1g0dwf','Y2Y3ZTEzNDAwYWZiM2M3ZWM3YWI1MTQ4MGYyZWU1YmNmZjRhNGUzYjqAAn1xAVUDbWlkcQJVIDgzMEI4RTIyRjMzNjY4MkUwOTg5QTNGMDJGMEJEOEMxcQNzLg==','2013-09-11 11:42:07');
INSERT INTO `django_session` VALUES ('bsxfcu7abcwm78p8rmkhry0r26800t3k','Y2Y3ZTEzNDAwYWZiM2M3ZWM3YWI1MTQ4MGYyZWU1YmNmZjRhNGUzYjqAAn1xAVUDbWlkcQJVIDgzMEI4RTIyRjMzNjY4MkUwOTg5QTNGMDJGMEJEOEMxcQNzLg==','2013-09-11 11:43:22');
INSERT INTO `django_session` VALUES ('fivhi4mk5izvnxu3gsi4ox2l6cyr0fbw','Y2Y3ZTEzNDAwYWZiM2M3ZWM3YWI1MTQ4MGYyZWU1YmNmZjRhNGUzYjqAAn1xAVUDbWlkcQJVIDgzMEI4RTIyRjMzNjY4MkUwOTg5QTNGMDJGMEJEOEMxcQNzLg==','2013-09-12 02:45:07');
INSERT INTO `django_session` VALUES ('xhmvb1orjdaqwr2vwkj4eqz0a53f4vi1','OTkxYmQxZWI1YTQ5ZDc0M2IxYmRmOThkMDZkZDcwYzRiNGQwODI4NTqAAn1xAVUDbWlkcQJKWdANe3Mu','2013-09-12 02:45:15');
INSERT INTO `django_session` VALUES ('hkkru84jilx8slaa5xl3btu06dz3cztl','Y2Y3ZTEzNDAwYWZiM2M3ZWM3YWI1MTQ4MGYyZWU1YmNmZjRhNGUzYjqAAn1xAVUDbWlkcQJVIDgzMEI4RTIyRjMzNjY4MkUwOTg5QTNGMDJGMEJEOEMxcQNzLg==','2013-09-12 02:45:44');
INSERT INTO `django_session` VALUES ('7i7a0ahb7ikroz44rztkaoc52lkckt6s','Y2Y3ZTEzNDAwYWZiM2M3ZWM3YWI1MTQ4MGYyZWU1YmNmZjRhNGUzYjqAAn1xAVUDbWlkcQJVIDgzMEI4RTIyRjMzNjY4MkUwOTg5QTNGMDJGMEJEOEMxcQNzLg==','2013-09-12 02:49:07');
INSERT INTO `django_session` VALUES ('diyytiey5zsrmjqcim5r1cpc70i0lsa9','Y2Y3ZTEzNDAwYWZiM2M3ZWM3YWI1MTQ4MGYyZWU1YmNmZjRhNGUzYjqAAn1xAVUDbWlkcQJVIDgzMEI4RTIyRjMzNjY4MkUwOTg5QTNGMDJGMEJEOEMxcQNzLg==','2013-09-12 02:49:14');
INSERT INTO `django_session` VALUES ('ug5b9e34q89zowezzk78xrfl85evjjq0','Y2Y3ZTEzNDAwYWZiM2M3ZWM3YWI1MTQ4MGYyZWU1YmNmZjRhNGUzYjqAAn1xAVUDbWlkcQJVIDgzMEI4RTIyRjMzNjY4MkUwOTg5QTNGMDJGMEJEOEMxcQNzLg==','2013-09-12 02:49:18');
INSERT INTO `django_session` VALUES ('ft8y59g7yhupokwl517fz1ls6ujin000','Y2Y3ZTEzNDAwYWZiM2M3ZWM3YWI1MTQ4MGYyZWU1YmNmZjRhNGUzYjqAAn1xAVUDbWlkcQJVIDgzMEI4RTIyRjMzNjY4MkUwOTg5QTNGMDJGMEJEOEMxcQNzLg==','2013-09-12 02:49:21');
INSERT INTO `django_session` VALUES ('2czvcv7ghpi6uwkb496satxi742cmewm','Y2Y3ZTEzNDAwYWZiM2M3ZWM3YWI1MTQ4MGYyZWU1YmNmZjRhNGUzYjqAAn1xAVUDbWlkcQJVIDgzMEI4RTIyRjMzNjY4MkUwOTg5QTNGMDJGMEJEOEMxcQNzLg==','2013-09-12 07:31:55');
INSERT INTO `django_session` VALUES ('6q8sh0b035hunhrb9faygfcdpcgyhjxp','Y2Y3ZTEzNDAwYWZiM2M3ZWM3YWI1MTQ4MGYyZWU1YmNmZjRhNGUzYjqAAn1xAVUDbWlkcQJVIDgzMEI4RTIyRjMzNjY4MkUwOTg5QTNGMDJGMEJEOEMxcQNzLg==','2013-09-17 08:53:33');
INSERT INTO `django_session` VALUES ('g6m81wd5jw5ba45rxtliaeevm66mecua','MWUwNTIyMjVlNzlhMmRhYmU1ZGQ0YTFjZjljZjM3ZmMzYzE3YzdjMTqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==','2013-09-17 08:41:06');
INSERT INTO `django_session` VALUES ('2yj8yl66ckbjwarooi11992pwj3dug51','Y2Y3ZTEzNDAwYWZiM2M3ZWM3YWI1MTQ4MGYyZWU1YmNmZjRhNGUzYjqAAn1xAVUDbWlkcQJVIDgzMEI4RTIyRjMzNjY4MkUwOTg5QTNGMDJGMEJEOEMxcQNzLg==','2013-09-17 09:55:43');
INSERT INTO `django_session` VALUES ('s9h0kvpayt1y2uwsel29dhmcujoi7oh7','Y2Y3ZTEzNDAwYWZiM2M3ZWM3YWI1MTQ4MGYyZWU1YmNmZjRhNGUzYjqAAn1xAVUDbWlkcQJVIDgzMEI4RTIyRjMzNjY4MkUwOTg5QTNGMDJGMEJEOEMxcQNzLg==','2013-10-29 03:26:37');
INSERT INTO `django_session` VALUES ('fdsqvye2wygdbjbegd5gv6fhrztihclv','MWUwNTIyMjVlNzlhMmRhYmU1ZGQ0YTFjZjljZjM3ZmMzYzE3YzdjMTqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==','2013-10-29 02:15:31');
INSERT INTO `django_session` VALUES ('04q8yaa4pciy4nwqo49jxy8lr8cnj7x3','Y2Y3ZTEzNDAwYWZiM2M3ZWM3YWI1MTQ4MGYyZWU1YmNmZjRhNGUzYjqAAn1xAVUDbWlkcQJVIDgzMEI4RTIyRjMzNjY4MkUwOTg5QTNGMDJGMEJEOEMxcQNzLg==','2013-10-29 03:33:00');
INSERT INTO `django_session` VALUES ('pqd4fv3b474bj1m1hqsl9d2s9z47po74','Y2Y3ZTEzNDAwYWZiM2M3ZWM3YWI1MTQ4MGYyZWU1YmNmZjRhNGUzYjqAAn1xAVUDbWlkcQJVIDgzMEI4RTIyRjMzNjY4MkUwOTg5QTNGMDJGMEJEOEMxcQNzLg==','2013-10-29 03:39:42');
INSERT INTO `django_session` VALUES ('wsezpoormohnvynv91w53ce5a6jmboqk','Y2Y3ZTEzNDAwYWZiM2M3ZWM3YWI1MTQ4MGYyZWU1YmNmZjRhNGUzYjqAAn1xAVUDbWlkcQJVIDgzMEI4RTIyRjMzNjY4MkUwOTg5QTNGMDJGMEJEOEMxcQNzLg==','2013-10-30 07:40:29');
INSERT INTO `django_session` VALUES ('f06gi0cnafzw0mrux06gl87bmxexik3s','Y2Y3ZTEzNDAwYWZiM2M3ZWM3YWI1MTQ4MGYyZWU1YmNmZjRhNGUzYjqAAn1xAVUDbWlkcQJVIDgzMEI4RTIyRjMzNjY4MkUwOTg5QTNGMDJGMEJEOEMxcQNzLg==','2013-10-30 07:45:44');
INSERT INTO `django_session` VALUES ('orofmg3om466djgu5abvjm04okllriaz','Y2Y3ZTEzNDAwYWZiM2M3ZWM3YWI1MTQ4MGYyZWU1YmNmZjRhNGUzYjqAAn1xAVUDbWlkcQJVIDgzMEI4RTIyRjMzNjY4MkUwOTg5QTNGMDJGMEJEOEMxcQNzLg==','2013-10-30 07:48:29');
INSERT INTO `django_session` VALUES ('rjelv1xshim76jw8pvj1510xz3099myu','Y2Y3ZTEzNDAwYWZiM2M3ZWM3YWI1MTQ4MGYyZWU1YmNmZjRhNGUzYjqAAn1xAVUDbWlkcQJVIDgzMEI4RTIyRjMzNjY4MkUwOTg5QTNGMDJGMEJEOEMxcQNzLg==','2013-10-30 07:51:20');
INSERT INTO `django_session` VALUES ('mpvls9e6jh47xyyw9eq43vhrfqu54hka','Y2Y3ZTEzNDAwYWZiM2M3ZWM3YWI1MTQ4MGYyZWU1YmNmZjRhNGUzYjqAAn1xAVUDbWlkcQJVIDgzMEI4RTIyRjMzNjY4MkUwOTg5QTNGMDJGMEJEOEMxcQNzLg==','2013-10-30 08:17:18');
INSERT INTO `django_session` VALUES ('z15opc3hgsjo9of63o49cgavej8p300t','OTkxYmQxZWI1YTQ5ZDc0M2IxYmRmOThkMDZkZDcwYzRiNGQwODI4NTqAAn1xAVUDbWlkcQJKWdANe3Mu','2013-10-30 08:17:24');
INSERT INTO `django_session` VALUES ('5cfw6huxlu9o49ria5dzduky15sd9vmt','Y2Y3ZTEzNDAwYWZiM2M3ZWM3YWI1MTQ4MGYyZWU1YmNmZjRhNGUzYjqAAn1xAVUDbWlkcQJVIDgzMEI4RTIyRjMzNjY4MkUwOTg5QTNGMDJGMEJEOEMxcQNzLg==','2013-10-30 08:17:35');
INSERT INTO `django_session` VALUES ('z5o6v7dccrlxc38i5lpswdg151jsi2bd','Y2Y3ZTEzNDAwYWZiM2M3ZWM3YWI1MTQ4MGYyZWU1YmNmZjRhNGUzYjqAAn1xAVUDbWlkcQJVIDgzMEI4RTIyRjMzNjY4MkUwOTg5QTNGMDJGMEJEOEMxcQNzLg==','2013-10-30 08:18:03');
INSERT INTO `django_session` VALUES ('rrqlyuxi1cuh1wjh63fp0b40btvwmt3k','Y2Y3ZTEzNDAwYWZiM2M3ZWM3YWI1MTQ4MGYyZWU1YmNmZjRhNGUzYjqAAn1xAVUDbWlkcQJVIDgzMEI4RTIyRjMzNjY4MkUwOTg5QTNGMDJGMEJEOEMxcQNzLg==','2013-11-01 02:07:31');
INSERT INTO `django_session` VALUES ('j9re95xjlr9exlhdwssng5tbs3zomc7n','Y2Y3ZTEzNDAwYWZiM2M3ZWM3YWI1MTQ4MGYyZWU1YmNmZjRhNGUzYjqAAn1xAVUDbWlkcQJVIDgzMEI4RTIyRjMzNjY4MkUwOTg5QTNGMDJGMEJEOEMxcQNzLg==','2013-11-01 02:07:57');
INSERT INTO `django_session` VALUES ('ys1b2t3v7fj5c55n4z75grz22pkk3h9j','Y2Y3ZTEzNDAwYWZiM2M3ZWM3YWI1MTQ4MGYyZWU1YmNmZjRhNGUzYjqAAn1xAVUDbWlkcQJVIDgzMEI4RTIyRjMzNjY4MkUwOTg5QTNGMDJGMEJEOEMxcQNzLg==','2013-11-01 02:18:07');
INSERT INTO `django_session` VALUES ('fwa8vgqzfe036s4yreqpdw7qz7nce72q','Y2Y3ZTEzNDAwYWZiM2M3ZWM3YWI1MTQ4MGYyZWU1YmNmZjRhNGUzYjqAAn1xAVUDbWlkcQJVIDgzMEI4RTIyRjMzNjY4MkUwOTg5QTNGMDJGMEJEOEMxcQNzLg==','2013-11-01 02:19:56');
INSERT INTO `django_session` VALUES ('zrmuu4wnxvn9pghvgu4o3od0s4m0k1z3','Y2Y3ZTEzNDAwYWZiM2M3ZWM3YWI1MTQ4MGYyZWU1YmNmZjRhNGUzYjqAAn1xAVUDbWlkcQJVIDgzMEI4RTIyRjMzNjY4MkUwOTg5QTNGMDJGMEJEOEMxcQNzLg==','2013-11-01 02:21:28');
INSERT INTO `django_session` VALUES ('lehau2h5snxyx0tx8b3fhib3zbiyatdl','Y2Y3ZTEzNDAwYWZiM2M3ZWM3YWI1MTQ4MGYyZWU1YmNmZjRhNGUzYjqAAn1xAVUDbWlkcQJVIDgzMEI4RTIyRjMzNjY4MkUwOTg5QTNGMDJGMEJEOEMxcQNzLg==','2013-11-01 07:44:17');
INSERT INTO `django_session` VALUES ('gt75t45ywfetfhege9hy1btz3z2dxq94','Y2Y3ZTEzNDAwYWZiM2M3ZWM3YWI1MTQ4MGYyZWU1YmNmZjRhNGUzYjqAAn1xAVUDbWlkcQJVIDgzMEI4RTIyRjMzNjY4MkUwOTg5QTNGMDJGMEJEOEMxcQNzLg==','2013-11-01 07:46:08');
INSERT INTO `django_session` VALUES ('q218wlgpzkd5hindh1y0gza4lqly2k4g','Y2Y3ZTEzNDAwYWZiM2M3ZWM3YWI1MTQ4MGYyZWU1YmNmZjRhNGUzYjqAAn1xAVUDbWlkcQJVIDgzMEI4RTIyRjMzNjY4MkUwOTg5QTNGMDJGMEJEOEMxcQNzLg==','2013-11-01 07:50:30');
INSERT INTO `django_session` VALUES ('2utqp68mi99r652xefu3zun6fpay3v55','Y2Y3ZTEzNDAwYWZiM2M3ZWM3YWI1MTQ4MGYyZWU1YmNmZjRhNGUzYjqAAn1xAVUDbWlkcQJVIDgzMEI4RTIyRjMzNjY4MkUwOTg5QTNGMDJGMEJEOEMxcQNzLg==','2013-11-01 07:51:43');
INSERT INTO `django_session` VALUES ('dryj4r5zjhcvwf55bj7xigaevfm1wnc9','Y2Y3ZTEzNDAwYWZiM2M3ZWM3YWI1MTQ4MGYyZWU1YmNmZjRhNGUzYjqAAn1xAVUDbWlkcQJVIDgzMEI4RTIyRjMzNjY4MkUwOTg5QTNGMDJGMEJEOEMxcQNzLg==','2013-11-01 07:52:36');
INSERT INTO `django_session` VALUES ('0qc0myh1w144pj8qyhwkwaanptsdpb8y','Y2Y3ZTEzNDAwYWZiM2M3ZWM3YWI1MTQ4MGYyZWU1YmNmZjRhNGUzYjqAAn1xAVUDbWlkcQJVIDgzMEI4RTIyRjMzNjY4MkUwOTg5QTNGMDJGMEJEOEMxcQNzLg==','2013-11-01 07:54:37');
INSERT INTO `django_session` VALUES ('51lchkj36nsh53mubo55q8g7kztstms4','Y2Y3ZTEzNDAwYWZiM2M3ZWM3YWI1MTQ4MGYyZWU1YmNmZjRhNGUzYjqAAn1xAVUDbWlkcQJVIDgzMEI4RTIyRjMzNjY4MkUwOTg5QTNGMDJGMEJEOEMxcQNzLg==','2013-11-01 07:57:35');
INSERT INTO `django_session` VALUES ('naoww66h1jeeas1z19smon8afim67l2k','Y2Y3ZTEzNDAwYWZiM2M3ZWM3YWI1MTQ4MGYyZWU1YmNmZjRhNGUzYjqAAn1xAVUDbWlkcQJVIDgzMEI4RTIyRjMzNjY4MkUwOTg5QTNGMDJGMEJEOEMxcQNzLg==','2013-11-01 07:57:47');
INSERT INTO `django_session` VALUES ('fnsct4svm46rsa8cin3kf0sbdo50fw3f','Y2Y3ZTEzNDAwYWZiM2M3ZWM3YWI1MTQ4MGYyZWU1YmNmZjRhNGUzYjqAAn1xAVUDbWlkcQJVIDgzMEI4RTIyRjMzNjY4MkUwOTg5QTNGMDJGMEJEOEMxcQNzLg==','2013-11-01 07:58:13');
INSERT INTO `django_session` VALUES ('b7qqz22w4j70sb6le5c5iafrx7szjpcw','Y2Y3ZTEzNDAwYWZiM2M3ZWM3YWI1MTQ4MGYyZWU1YmNmZjRhNGUzYjqAAn1xAVUDbWlkcQJVIDgzMEI4RTIyRjMzNjY4MkUwOTg5QTNGMDJGMEJEOEMxcQNzLg==','2013-11-01 07:59:36');
INSERT INTO `django_session` VALUES ('2ndqwzhxpzf19g7hrdy9a6fr5iylc203','Y2Y3ZTEzNDAwYWZiM2M3ZWM3YWI1MTQ4MGYyZWU1YmNmZjRhNGUzYjqAAn1xAVUDbWlkcQJVIDgzMEI4RTIyRjMzNjY4MkUwOTg5QTNGMDJGMEJEOEMxcQNzLg==','2013-11-01 08:00:27');
INSERT INTO `django_session` VALUES ('cowhqlugiud60iyeug91owlz1r7tlk5l','Y2Y3ZTEzNDAwYWZiM2M3ZWM3YWI1MTQ4MGYyZWU1YmNmZjRhNGUzYjqAAn1xAVUDbWlkcQJVIDgzMEI4RTIyRjMzNjY4MkUwOTg5QTNGMDJGMEJEOEMxcQNzLg==','2013-11-01 08:00:58');
INSERT INTO `django_session` VALUES ('afxoi1xea3hb51o6z7oi0vqq7ccnj4vl','Y2Y3ZTEzNDAwYWZiM2M3ZWM3YWI1MTQ4MGYyZWU1YmNmZjRhNGUzYjqAAn1xAVUDbWlkcQJVIDgzMEI4RTIyRjMzNjY4MkUwOTg5QTNGMDJGMEJEOEMxcQNzLg==','2013-11-01 08:04:19');
INSERT INTO `django_session` VALUES ('lqjx9vdlgcyu7430m9tuxpu87adhvv1z','Y2Y3ZTEzNDAwYWZiM2M3ZWM3YWI1MTQ4MGYyZWU1YmNmZjRhNGUzYjqAAn1xAVUDbWlkcQJVIDgzMEI4RTIyRjMzNjY4MkUwOTg5QTNGMDJGMEJEOEMxcQNzLg==','2013-11-01 08:05:14');
INSERT INTO `django_session` VALUES ('gwe5emj47a4e6c5fmnh5jp74jc71wtmp','Y2Y3ZTEzNDAwYWZiM2M3ZWM3YWI1MTQ4MGYyZWU1YmNmZjRhNGUzYjqAAn1xAVUDbWlkcQJVIDgzMEI4RTIyRjMzNjY4MkUwOTg5QTNGMDJGMEJEOEMxcQNzLg==','2013-11-01 08:06:20');
INSERT INTO `django_session` VALUES ('eiwsvljk0r1idzwhwl9ijyjziyi3cvol','Y2Y3ZTEzNDAwYWZiM2M3ZWM3YWI1MTQ4MGYyZWU1YmNmZjRhNGUzYjqAAn1xAVUDbWlkcQJVIDgzMEI4RTIyRjMzNjY4MkUwOTg5QTNGMDJGMEJEOEMxcQNzLg==','2013-11-01 08:07:51');
INSERT INTO `django_session` VALUES ('gc2w393d94ins1zbwv2rwnkawda20w2q','Y2Y3ZTEzNDAwYWZiM2M3ZWM3YWI1MTQ4MGYyZWU1YmNmZjRhNGUzYjqAAn1xAVUDbWlkcQJVIDgzMEI4RTIyRjMzNjY4MkUwOTg5QTNGMDJGMEJEOEMxcQNzLg==','2013-11-01 08:08:15');
INSERT INTO `django_session` VALUES ('u1h8d3z7fmeewz8i3et3mvfvxv6vibq9','Y2Y3ZTEzNDAwYWZiM2M3ZWM3YWI1MTQ4MGYyZWU1YmNmZjRhNGUzYjqAAn1xAVUDbWlkcQJVIDgzMEI4RTIyRjMzNjY4MkUwOTg5QTNGMDJGMEJEOEMxcQNzLg==','2013-11-04 02:19:40');
INSERT INTO `django_session` VALUES ('x1eor3vi2xazjqp0znch21gmo81d1psk','Y2Y3ZTEzNDAwYWZiM2M3ZWM3YWI1MTQ4MGYyZWU1YmNmZjRhNGUzYjqAAn1xAVUDbWlkcQJVIDgzMEI4RTIyRjMzNjY4MkUwOTg5QTNGMDJGMEJEOEMxcQNzLg==','2013-11-04 02:19:50');
INSERT INTO `django_session` VALUES ('8re5i6amtp5vnloecq31zzfjvdgmd6ry','Y2Y3ZTEzNDAwYWZiM2M3ZWM3YWI1MTQ4MGYyZWU1YmNmZjRhNGUzYjqAAn1xAVUDbWlkcQJVIDgzMEI4RTIyRjMzNjY4MkUwOTg5QTNGMDJGMEJEOEMxcQNzLg==','2013-11-04 02:21:17');
INSERT INTO `django_session` VALUES ('cd4hpue8yt1ofhud73ucuu8eqvybhm7s','OTkxYmQxZWI1YTQ5ZDc0M2IxYmRmOThkMDZkZDcwYzRiNGQwODI4NTqAAn1xAVUDbWlkcQJKWdANe3Mu','2013-11-04 02:21:22');
INSERT INTO `django_session` VALUES ('3fkd2ipxt1dgr652hvnhd6j48o8pblup','Y2Y3ZTEzNDAwYWZiM2M3ZWM3YWI1MTQ4MGYyZWU1YmNmZjRhNGUzYjqAAn1xAVUDbWlkcQJVIDgzMEI4RTIyRjMzNjY4MkUwOTg5QTNGMDJGMEJEOEMxcQNzLg==','2013-11-05 03:13:55');
INSERT INTO `django_session` VALUES ('dejfakdkn9i5yjxbae7dsbo2qreplyq9','Y2Y3ZTEzNDAwYWZiM2M3ZWM3YWI1MTQ4MGYyZWU1YmNmZjRhNGUzYjqAAn1xAVUDbWlkcQJVIDgzMEI4RTIyRjMzNjY4MkUwOTg5QTNGMDJGMEJEOEMxcQNzLg==','2013-11-05 03:15:52');
INSERT INTO `django_session` VALUES ('j22ausa85jiv9ygtp5d9cr7kwb3fsafe','OTkxYmQxZWI1YTQ5ZDc0M2IxYmRmOThkMDZkZDcwYzRiNGQwODI4NTqAAn1xAVUDbWlkcQJKWdANe3Mu','2013-11-27 11:45:26');
INSERT INTO `django_session` VALUES ('il2vcm8xgtkx7hvpcnuilwfq1qtk3it3','OTkxYmQxZWI1YTQ5ZDc0M2IxYmRmOThkMDZkZDcwYzRiNGQwODI4NTqAAn1xAVUDbWlkcQJKWdANe3Mu','2013-11-27 12:21:48');
INSERT INTO `django_session` VALUES ('lt69j39rn3lngk1xkb5mvaaar19reea1','MWUwNTIyMjVlNzlhMmRhYmU1ZGQ0YTFjZjljZjM3ZmMzYzE3YzdjMTqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==','2013-11-27 12:01:33');
INSERT INTO `django_session` VALUES ('su3u2fsv12yr88iesdzoq1qpkbndkxex','OTkxYmQxZWI1YTQ5ZDc0M2IxYmRmOThkMDZkZDcwYzRiNGQwODI4NTqAAn1xAVUDbWlkcQJKWdANe3Mu','2013-11-27 12:22:29');
INSERT INTO `django_session` VALUES ('0td4d5s619jkmrb7s7lpnhzin7rlkrfu','OTkxYmQxZWI1YTQ5ZDc0M2IxYmRmOThkMDZkZDcwYzRiNGQwODI4NTqAAn1xAVUDbWlkcQJKWdANe3Mu','2013-11-27 12:32:04');
INSERT INTO `django_session` VALUES ('8kels86npgcriu5ifews7ykytg97k49u','OTkxYmQxZWI1YTQ5ZDc0M2IxYmRmOThkMDZkZDcwYzRiNGQwODI4NTqAAn1xAVUDbWlkcQJKWdANe3Mu','2013-11-27 12:37:37');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_chapter`
--

DROP TABLE IF EXISTS `game_chapter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_chapter` (
  `cpid` bigint(20) NOT NULL AUTO_INCREMENT,
  `desc` longtext NOT NULL,
  `parentId` int(10) unsigned NOT NULL,
  `children` longtext NOT NULL,
  `coauthor_id` varchar(50) NOT NULL,
  `support` int(10) unsigned NOT NULL,
  `unsupport` int(10) unsigned NOT NULL,
  `modeMask` int(11) NOT NULL,
  `createTime` bigint(20) NOT NULL,
  `scanNum` int(10) unsigned NOT NULL,
  `storyId` bigint(20),
  `shareNum` int(10) unsigned NOT NULL,
  `collectNum` int(10) unsigned NOT NULL,
  PRIMARY KEY (`cpid`),
  KEY `game_chapter_c4d610e3` (`coauthor_id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_chapter`
--

LOCK TABLES `game_chapter` WRITE;
/*!40000 ALTER TABLE `game_chapter` DISABLE KEYS */;
INSERT INTO `game_chapter` VALUES (24,'test create new chapter',19,'','830B8E22F336682E0989A3F02F0BD8C1',0,0,1,1382321980,0,3,0,0);
INSERT INTO `game_chapter` VALUES (25,'start chap',0,'','830B8E22F336682E0989A3F02F0BD8C1',0,0,1,1382321990,0,4,0,0);
INSERT INTO `game_chapter` VALUES (23,'test create new chapter',19,'','830B8E22F336682E0989A3F02F0BD8C1',0,0,1,1382083695,0,3,0,0);
INSERT INTO `game_chapter` VALUES (22,'test create new chapter',19,'','830B8E22F336682E0989A3F02F0BD8C1',0,0,1,1382083671,0,3,0,0);
INSERT INTO `game_chapter` VALUES (19,'start chap',0,'21,22,23,24,26,27,30,31,33,34,35','830B8E22F336682E0989A3F02F0BD8C1',0,0,1,1382083459,1,3,1,1);
INSERT INTO `game_chapter` VALUES (20,'test create new chapter',1,'','830B8E22F336682E0989A3F02F0BD8C1',0,0,1,1382083514,0,3,0,0);
INSERT INTO `game_chapter` VALUES (21,'test create new chapter',19,'','830B8E22F336682E0989A3F02F0BD8C1',0,0,1,1382083580,0,3,0,0);
INSERT INTO `game_chapter` VALUES (26,'test create new chapter',19,'','830B8E22F336682E0989A3F02F0BD8C1',0,0,1,1382411635,0,3,0,0);
INSERT INTO `game_chapter` VALUES (27,'test create new chapter',19,'','830B8E22F336682E0989A3F02F0BD8C1',0,0,1,1382411752,0,3,0,0);
INSERT INTO `game_chapter` VALUES (28,'start chap',0,'','2064502873',0,0,1,1384345349,0,5,0,0);
INSERT INTO `game_chapter` VALUES (29,'start chap',0,'','2064502873',0,0,1,1384345924,0,6,0,0);
INSERT INTO `game_chapter` VALUES (30,'test create new chapter',19,'','2064502873',0,0,1,1384346257,0,3,0,0);
INSERT INTO `game_chapter` VALUES (31,'test create new chapter',19,'','1557',0,0,1,1384933946,0,3,0,0);
INSERT INTO `game_chapter` VALUES (32,'start chap',0,'','2064502873',0,0,1,1384934465,0,7,0,0);
INSERT INTO `game_chapter` VALUES (33,'test create new chapter',19,'','1557',0,0,1,1384935791,0,3,0,0);
INSERT INTO `game_chapter` VALUES (34,'test create new chapter',19,'','1557',0,0,1,1384935832,0,3,0,0);
INSERT INTO `game_chapter` VALUES (35,'test create new chapter',19,'','1557',0,0,1,1384935852,0,3,0,0);
INSERT INTO `game_chapter` VALUES (36,'start chap',0,'','2064502873',0,0,1,1384935867,0,8,0,0);
/*!40000 ALTER TABLE `game_chapter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_coauthorsstatistics`
--

DROP TABLE IF EXISTS `game_coauthorsstatistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_coauthorsstatistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `story_id` int(11) NOT NULL,
  `allCoauthorsSet` longtext NOT NULL,
  `allCoauthorsNum` bigint(20) NOT NULL,
  `sixDBefore` longtext NOT NULL,
  `fiveDBefore` longtext NOT NULL,
  `fourDBefore` longtext NOT NULL,
  `threeDBefore` longtext NOT NULL,
  `twoDBefore` longtext NOT NULL,
  `oneDBefore` longtext NOT NULL,
  `today` longtext NOT NULL,
  `weekCoauthorsSet` longtext NOT NULL,
  `weekCoauthorsNum` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `story_id` (`story_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_coauthorsstatistics`
--

LOCK TABLES `game_coauthorsstatistics` WRITE;
/*!40000 ALTER TABLE `game_coauthorsstatistics` DISABLE KEYS */;
INSERT INTO `game_coauthorsstatistics` VALUES (8,6,'2064502873',1,'','','','','2064502873','','','2064502873',1);
INSERT INTO `game_coauthorsstatistics` VALUES (5,3,'2064502873,830B8E22F336682E0989A3F02F0BD8C1,1557,minggggg',4,'',',830B8E22F336682E0989A3F02F0BD8C1,minggggg','','',',2064502873,1557','','','2064502873,830B8E22F336682E0989A3F02F0BD8C1,1557,minggggg',4);
INSERT INTO `game_coauthorsstatistics` VALUES (6,4,'830B8E22F336682E0989A3F02F0BD8C1',1,'','','','','','','','',0);
INSERT INTO `game_coauthorsstatistics` VALUES (7,5,'2064502873',1,'','','','','2064502873','','','2064502873',1);
INSERT INTO `game_coauthorsstatistics` VALUES (9,7,'2064502873',1,'','','','','2064502873','','','2064502873',1);
INSERT INTO `game_coauthorsstatistics` VALUES (10,8,'2064502873',1,'','','','','2064502873','','','2064502873',1);
/*!40000 ALTER TABLE `game_coauthorsstatistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_story`
--

DROP TABLE IF EXISTS `game_story`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_story` (
  `stid` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `keysMask` int(11) NOT NULL,
  `summary` longtext NOT NULL,
  `hot` int(11) NOT NULL,
  `support` int(10) unsigned NOT NULL,
  `unsupport` int(10) unsigned NOT NULL,
  `author_id` varchar(50) NOT NULL,
  `modeMask` int(11) NOT NULL,
  `chapNum` int(10) unsigned NOT NULL,
  `startChap_id` int(11) NOT NULL,
  `timeStamp` bigint(20) NOT NULL,
  `createTime` bigint(20) NOT NULL,
  `shareNum` int(10) unsigned NOT NULL,
  `collectNum` int(10) unsigned NOT NULL,
  `scanNum` int(10) unsigned NOT NULL,
  PRIMARY KEY (`stid`),
  UNIQUE KEY `startChap_id` (`startChap_id`),
  KEY `author_id_refs_uid_83f14185` (`author_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_story`
--

LOCK TABLES `game_story` WRITE;
/*!40000 ALTER TABLE `game_story` DISABLE KEYS */;
INSERT INTO `game_story` VALUES (3,'abc',100,'only a test',0,0,0,'830B8E22F336682E0989A3F02F0BD8C1',1,1,19,1384935852,1382083459,2,2,2);
INSERT INTO `game_story` VALUES (4,'abc',100,'only a test',0,0,0,'830B8E22F336682E0989A3F02F0BD8C1',1,1,25,1382321990,1382321990,0,0,0);
INSERT INTO `game_story` VALUES (5,'abc',100,'only a test',0,0,0,'2064502873',1,1,28,1384345349,1384345349,0,0,0);
INSERT INTO `game_story` VALUES (6,'abc',100,'only a test',0,0,0,'2064502873',1,1,29,1384345924,1384345924,0,0,0);
INSERT INTO `game_story` VALUES (7,'abc',100,'only a test',0,0,0,'2064502873',1,1,32,1384934465,1384934465,0,0,0);
INSERT INTO `game_story` VALUES (8,'abc',100,'only a test',0,0,0,'2064502873',1,1,36,1384935867,1384935867,0,0,0);
/*!40000 ALTER TABLE `game_story` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_user`
--

DROP TABLE IF EXISTS `game_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_user` (
  `uid` varchar(50) NOT NULL,
  `nickname` varchar(30) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_user`
--

LOCK TABLES `game_user` WRITE;
/*!40000 ALTER TABLE `game_user` DISABLE KEYS */;
INSERT INTO `game_user` VALUES ('1557','1321');
INSERT INTO `game_user` VALUES ('830B8E22F336682E0989A3F02F0BD8C1','mingg');
INSERT INTO `game_user` VALUES ('2064502873','mingg明');
/*!40000 ALTER TABLE `game_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `south_migrationhistory`
--

DROP TABLE IF EXISTS `south_migrationhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `south_migrationhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(255) NOT NULL,
  `migration` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `south_migrationhistory`
--

LOCK TABLES `south_migrationhistory` WRITE;
/*!40000 ALTER TABLE `south_migrationhistory` DISABLE KEYS */;
INSERT INTO `south_migrationhistory` VALUES (1,'game','0001_initial','2013-10-18 01:52:35');
INSERT INTO `south_migrationhistory` VALUES (2,'game','0002_auto__chg_field_chapter_storyid','2013-10-18 01:57:01');
INSERT INTO `south_migrationhistory` VALUES (3,'game','0003_auto__del_field_chapter_storyid__add_field_chapter_storyId','2013-10-18 02:04:56');
INSERT INTO `south_migrationhistory` VALUES (4,'game','0004_auto__add_field_chapter_shareNum__add_field_chapter_collectNum','2013-11-21 06:56:18');
/*!40000 ALTER TABLE `south_migrationhistory` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-12-17  3:00:35
