-- MySQL dump 10.13  Distrib 5.1.73, for redhat-linux-gnu (x86_64)
--
-- Host: localhost    Database: OMdemo
-- ------------------------------------------------------
-- Server version	5.1.73

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
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
  KEY `auth_group_permissions_bda51c3c` (`group_id`),
  KEY `auth_group_permissions_1e014c8f` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
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
  KEY `auth_permission_e4470c6e` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add site',6,'add_site'),(17,'Can change site',6,'change_site'),(18,'Can delete site',6,'delete_site'),(19,'Can add log entry',7,'add_logentry'),(20,'Can change log entry',7,'change_logentry'),(21,'Can delete log entry',7,'delete_logentry');
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
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'root','','','1029884576@qq.com','pbkdf2_sha256$10000$CscD1MFMlZVD$YDg5V6PmlbpUsLrag7n4ZiEXxOw1cNQZg23gFRjWwQY=',1,1,1,'2014-12-18 17:00:41','2014-12-18 17:00:30');
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
  KEY `auth_user_groups_fbfc09f1` (`user_id`),
  KEY `auth_user_groups_bda51c3c` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
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
  KEY `auth_user_user_permissions_fbfc09f1` (`user_id`),
  KEY `auth_user_user_permissions_1e014c8f` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
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
  KEY `django_admin_log_fbfc09f1` (`user_id`),
  KEY `django_admin_log_e4470c6e` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2014-12-18 17:46:05',1,8,'sn2013-08-022','ServerList object',2,'Changed server_lip.'),(2,'2014-12-18 17:46:18',1,8,'sn2013-08-021','ServerList object',2,'Changed server_lip.');
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
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'user','auth','user'),(4,'content type','contenttypes','contenttype'),(5,'session','sessions','session'),(6,'site','sites','site'),(7,'log entry','admin','logentry'),(8,'server list','autoadmin','serverlist');
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
  KEY `django_session_c25c2c28` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('51d5b9810e5e35dc3dc2aefb7822b3b6','Y2MyZGM5ZmM2ZWIyZTNlZTIzMjY0ZDA5YTFjNTU5MTU2YTQ4ZTA5ODqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2015-01-01 17:00:41');
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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
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
-- Table structure for table `module_list`
--

DROP TABLE IF EXISTS `module_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `module_list` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '模块ID号',
  `module_name` char(20) NOT NULL COMMENT '模块名称',
  `module_caption` char(255) NOT NULL COMMENT '模块功能描述',
  `module_extend` varchar(2000) NOT NULL COMMENT '模块前端扩展',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1008 DEFAULT CHARSET=utf8 COMMENT='模块列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module_list`
--

LOCK TABLES `module_list` WRITE;
/*!40000 ALTER TABLE `module_list` DISABLE KEYS */;
INSERT INTO `module_list` VALUES (1001,'查看系统日志','[<b>功能说明</b>]<br> 查看所选服务器的操作系统日志信息','返回信息行数：<input name=\"sys_param_1\" id=\"sys_param_1\" type=\"text\" size=\"5\" maxlength=\"3\" value=\"50\">'),(1002,'查看最新登录','[<b>功能说明</b>]<br> 查看所选服务器的最近的用户登录信息','返回信息行数：<input name=\"sys_param_1\" id=\"sys_param_1\" type=\"text\" size=\"5\" maxlength=\"3\" value=\"50\">'),(1003,'查看系统版本','[<b>功能说明</b>]<br> 查看所选服务器操作系统的版本信息',''),(1004,'查看内核模块','[<b>功能说明</b>]<br> 查看所选服务器操作系统的内核模块信息',''),(1005,'同步应用文件','[<b>功能说明</b>]<br> 同步选择的应用文件(可动态添加)到所选的目标服务器','选择同步文件：<select name=\"sys_param_1\" id=\"sys_param_1\"> <option value=\"nginx\" selected>nginx启动脚本</option> <option value=\"nginx_config\">nginx配置文件 </option> <option value=\"haproxy\" selected>Haproxy配置文件</option> <option value=\"syslog\" selected>syslog配置文件</option> <option value=\"sysctl\" selected>sysctl配置文件</option> <option value=\"resin\" selected>resin配置文件</option> <option value=\"resinhttpd\" selected>resin_httpd</option> <option value=\"resinjar\" selected>resin.jar</option> </select>'),(1006,'查看应用配置','[<b>功能说明</b>]<br> 查看指定的服务的配置信息','进程服务名称：<select name=\"sys_param_1\" id=\"sys_param_1\">  <option value=\"resin\" selected>resin</option>  <option value=\"nginx\">nginx</option>  <option value=\"haproxy\">haproxy</option>  <option value=\"apache\">apache</option>  <option value=\"mysql\">mysql</option>  <option value=\"lighttpd\">lighttpd</option></select>'),(1007,'重启进程服务','[<b>功能说明</b>]<br> 重启目标服务器的指定的进程或服务','进程服务名称： <select name=\"sys_param_1\" id=\"sys_param_1\">   <option value=\"resin\" selected>resin</option>   <option value=\"nginx\">nginx</option>   <option value=\"haproxy\">haproxy</option>   <option value=\"apache\">apache</option>   <option value=\"mysql\">mysql</option>   <option value=\"lighttpd\">lighttpd</option> </select>');
/*!40000 ALTER TABLE `module_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server_app_categ`
--

DROP TABLE IF EXISTS `server_app_categ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `server_app_categ` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '服务应用分类ID',
  `server_categ_id` int(11) NOT NULL COMMENT '服务功能分类ID',
  `app_categ_name` char(30) NOT NULL COMMENT '服务应用分类名称',
  PRIMARY KEY (`ID`),
  KEY `server_app_categ_ibfk_1` (`server_categ_id`),
  CONSTRAINT `server_app_categ_ibfk_1` FOREIGN KEY (`server_categ_id`) REFERENCES `server_fun_categ` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='服务应用分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server_app_categ`
--

LOCK TABLES `server_app_categ` WRITE;
/*!40000 ALTER TABLE `server_app_categ` DISABLE KEYS */;
INSERT INTO `server_app_categ` VALUES (1,11,'www.domain.com'),(2,11,'bbs.domain.com');
/*!40000 ALTER TABLE `server_app_categ` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server_fun_categ`
--

DROP TABLE IF EXISTS `server_fun_categ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `server_fun_categ` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '服务功能分类ID',
  `server_categ_name` char(20) NOT NULL COMMENT '服务功能分类名称',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='服务功能分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server_fun_categ`
--

LOCK TABLES `server_fun_categ` WRITE;
/*!40000 ALTER TABLE `server_fun_categ` DISABLE KEYS */;
INSERT INTO `server_fun_categ` VALUES (1,'Linux.Lbalancing'),(2,'Linux.Sysadmin'),(3,'Linux.Backup'),(4,'Linux.Ice'),(5,'Linux.Logs'),(6,'Linux.Hadoop'),(7,'Linux.Cache'),(8,'Linux.Memcached'),(9,'Linux.Mysql'),(10,'Linux.Proxy'),(11,'Linux.Web'),(12,'Windows.Mssql'),(13,'Windows.Web');
/*!40000 ALTER TABLE `server_fun_categ` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server_history`
--

DROP TABLE IF EXISTS `server_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `server_history` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `history_id` int(11) NOT NULL COMMENT '事件ID',
  `history_ip` char(15) NOT NULL COMMENT '事件IP地址',
  `history_user` char(15) NOT NULL COMMENT '事件用户名',
  `history_datetime` datetime NOT NULL COMMENT '事件时间',
  `db_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '入库时间',
  `history_command` char(255) NOT NULL COMMENT '事件命令',
  PRIMARY KEY (`ID`),
  KEY `history_ip` (`history_ip`),
  CONSTRAINT `server_history_ibfk_1` FOREIGN KEY (`history_ip`) REFERENCES `server_list` (`server_lip`)
) ENGINE=InnoDB AUTO_INCREMENT=1220 DEFAULT CHARSET=utf8 COMMENT='操作事件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server_history`
--

LOCK TABLES `server_history` WRITE;
/*!40000 ALTER TABLE `server_history` DISABLE KEYS */;
INSERT INTO `server_history` VALUES (1,82,'192.168.1.20','root','2014-06-02 15:29:06','2014-06-02 08:12:09','df -m'),(2,82,'192.168.1.20','root','2014-06-02 15:29:06','2014-06-02 08:21:28','df -m'),(3,82,'192.168.1.20','root','2014-06-02 15:29:06','2014-06-02 08:34:11','df -m'),(4,90,'192.168.1.20','root','2014-06-02 15:55:08','2014-06-02 08:48:03','vi /etc/hosts'),(5,90,'192.168.1.20','root','2014-06-02 15:55:08','2014-06-02 09:01:28','vi /etc/hosts'),(6,97,'192.168.1.20','root','2014-06-02 16:24:42','2014-06-02 09:07:12','last'),(7,98,'192.168.1.20','root','2014-06-02 16:25:34','2014-06-02 09:08:04','time'),(8,99,'192.168.1.20','root','2014-06-02 16:25:35','2014-06-02 09:08:05','date'),(9,100,'192.168.1.20','root','2014-06-02 16:25:41','2014-06-02 09:08:11','ps -ef|grep java'),(10,101,'192.168.1.20','root','2014-06-02 16:25:48','2014-06-02 09:08:18','ps -ef|grep nginx'),(11,102,'192.168.1.20','root','2014-06-02 16:26:04','2014-06-02 09:08:33','df -h'),(26,104,'192.168.1.20','root','2014-06-02 16:27:39','2014-06-02 09:10:08','history'),(27,105,'192.168.1.20','root','2014-06-03 13:20:52','2014-06-03 05:48:52','update time.com.cn'),(28,106,'192.168.1.20','root','2014-06-03 13:21:40','2014-06-03 05:49:40','ll'),(29,106,'192.168.1.20','root','2014-06-03 13:21:40','2014-06-03 05:49:49','ll'),(30,107,'192.168.1.20','root','2014-06-03 13:22:03','2014-06-03 05:49:58','dig www.hainan.net'),(31,108,'192.168.1.20','root','2014-06-03 13:27:34','2014-06-03 05:55:39','vi /etc/profile'),(32,109,'192.168.1.20','root','2014-06-03 13:27:48','2014-06-03 05:55:41','source /etc/profile'),(33,101,'192.168.1.20','root','2014-06-03 13:27:56','2014-06-03 05:55:54','exit'),(34,101,'192.168.1.20','root','2014-06-03 13:27:56','2014-06-03 05:55:56','exit'),(35,101,'192.168.1.20','root','2014-06-03 13:27:56','2014-06-03 05:55:58','exit'),(36,102,'192.168.1.20','root','2014-06-03 13:28:37','2014-06-03 05:56:30','df'),(37,103,'192.168.1.20','root','2014-06-03 13:29:17','2014-06-03 05:57:10','nohup ls &'),(38,103,'192.168.1.20','root','2014-06-03 13:29:17','2014-06-03 05:57:13','nohup ls &'),(39,104,'192.168.1.20','root','2014-06-03 13:29:23','2014-06-03 05:57:16','nohup ls'),(40,104,'192.168.1.20','root','2014-06-03 13:29:23','2014-06-03 05:57:34','nohup ls'),(41,104,'192.168.1.20','root','2014-06-03 13:29:23','2014-06-03 05:57:35','nohup ls'),(42,104,'192.168.1.20','root','2014-06-03 13:29:23','2014-06-03 05:57:35','nohup ls'),(43,104,'192.168.1.20','root','2014-06-03 13:29:23','2014-06-03 05:57:35','nohup ls'),(44,104,'192.168.1.20','root','2014-06-03 13:29:23','2014-06-03 05:57:35','nohup ls');
/*!40000 ALTER TABLE `server_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server_list`
--

DROP TABLE IF EXISTS `server_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `server_list` (
  `server_name` char(13) NOT NULL COMMENT '主机名称',
  `server_wip` char(15) NOT NULL DEFAULT '' COMMENT '主机外网IP',
  `server_lip` char(12) NOT NULL DEFAULT '' COMMENT '主机内网IP',
  `server_op` char(10) NOT NULL DEFAULT '' COMMENT '主机操作系统',
  `server_app_id` int(11) NOT NULL COMMENT '服务应用分类ID',
  PRIMARY KEY (`server_lip`),
  KEY `server_list_ibfk_1` (`server_app_id`),
  CONSTRAINT `server_list_ibfk_1` FOREIGN KEY (`server_app_id`) REFERENCES `server_app_categ` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='服务器列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server_list`
--

LOCK TABLES `server_list` WRITE;
/*!40000 ALTER TABLE `server_list` DISABLE KEYS */;
INSERT INTO `server_list` VALUES ('sn2013-08-021','10.11.100.21','127.0.0.1','Linux',2),('sn2012-07-010','10.11.100.10','192.168.1.10','Linux',1),('sn2013-08-020','10.11.100.20','192.168.1.20','Linux',1),('sn2013-08-022','10.11.100.22','192.168.56.2','Linux',2);
/*!40000 ALTER TABLE `server_list` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-12-19  7:24:21
