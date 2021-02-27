-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        8.0.22 - MySQL Community Server - GPL
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  11.1.0.6116
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- 导出 mydb 的数据库结构
CREATE DATABASE IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mydb`;

-- 导出  表 mydb.auth_group 结构
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  mydb.auth_group 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;

-- 导出  表 mydb.auth_group_permissions 结构
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  mydb.auth_group_permissions 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;

-- 导出  表 mydb.auth_permission 结构
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8;

-- 正在导出表  mydb.auth_permission 的数据：~76 rows (大约)
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
	(1, 'Can add log entry', 1, 'add_logentry'),
	(2, 'Can change log entry', 1, 'change_logentry'),
	(3, 'Can delete log entry', 1, 'delete_logentry'),
	(4, 'Can view log entry', 1, 'view_logentry'),
	(5, 'Can add permission', 2, 'add_permission'),
	(6, 'Can change permission', 2, 'change_permission'),
	(7, 'Can delete permission', 2, 'delete_permission'),
	(8, 'Can view permission', 2, 'view_permission'),
	(9, 'Can add group', 3, 'add_group'),
	(10, 'Can change group', 3, 'change_group'),
	(11, 'Can delete group', 3, 'delete_group'),
	(12, 'Can view group', 3, 'view_group'),
	(13, 'Can add user', 4, 'add_user'),
	(14, 'Can change user', 4, 'change_user'),
	(15, 'Can delete user', 4, 'delete_user'),
	(16, 'Can view user', 4, 'view_user'),
	(17, 'Can add content type', 5, 'add_contenttype'),
	(18, 'Can change content type', 5, 'change_contenttype'),
	(19, 'Can delete content type', 5, 'delete_contenttype'),
	(20, 'Can view content type', 5, 'view_contenttype'),
	(21, 'Can add session', 6, 'add_session'),
	(22, 'Can change session', 6, 'change_session'),
	(23, 'Can delete session', 6, 'delete_session'),
	(24, 'Can view session', 6, 'view_session'),
	(25, 'Can add 用户', 7, 'add_user'),
	(26, 'Can change 用户', 7, 'change_user'),
	(27, 'Can delete 用户', 7, 'delete_user'),
	(28, 'Can view 用户', 7, 'view_user'),
	(29, 'Can add role', 8, 'add_role'),
	(30, 'Can change role', 8, 'change_role'),
	(31, 'Can delete role', 8, 'delete_role'),
	(32, 'Can view role', 8, 'view_role'),
	(33, 'Can add token', 9, 'add_token'),
	(34, 'Can change token', 9, 'change_token'),
	(35, 'Can delete token', 9, 'delete_token'),
	(36, 'Can view token', 9, 'view_token'),
	(37, 'Can add api login', 10, 'add_apilogin'),
	(38, 'Can change api login', 10, 'change_apilogin'),
	(39, 'Can delete api login', 10, 'delete_apilogin'),
	(40, 'Can view api login', 10, 'view_apilogin'),
	(41, 'Can add fuzz', 11, 'add_fuzz'),
	(42, 'Can change fuzz', 11, 'change_fuzz'),
	(43, 'Can delete fuzz', 11, 'delete_fuzz'),
	(44, 'Can view fuzz', 11, 'view_fuzz'),
	(45, 'Can add suite', 12, 'add_suite'),
	(46, 'Can change suite', 12, 'change_suite'),
	(47, 'Can delete suite', 12, 'delete_suite'),
	(48, 'Can view suite', 12, 'view_suite'),
	(49, 'Can add task', 13, 'add_task'),
	(50, 'Can change task', 13, 'change_task'),
	(51, 'Can delete task', 13, 'delete_task'),
	(52, 'Can view task', 13, 'view_task'),
	(53, 'Can add suite set case', 14, 'add_suitesetcase'),
	(54, 'Can change suite set case', 14, 'change_suitesetcase'),
	(55, 'Can delete suite set case', 14, 'delete_suitesetcase'),
	(56, 'Can view suite set case', 14, 'view_suitesetcase'),
	(57, 'Can add report item', 15, 'add_reportitem'),
	(58, 'Can change report item', 15, 'change_reportitem'),
	(59, 'Can delete report item', 15, 'delete_reportitem'),
	(60, 'Can view report item', 15, 'view_reportitem'),
	(61, 'Can add report', 16, 'add_report'),
	(62, 'Can change report', 16, 'change_report'),
	(63, 'Can delete report', 16, 'delete_report'),
	(64, 'Can view report', 16, 'view_report'),
	(65, 'Can add case', 17, 'add_case'),
	(66, 'Can change case', 17, 'change_case'),
	(67, 'Can delete case', 17, 'delete_case'),
	(68, 'Can view case', 17, 'view_case'),
	(69, 'Can add django job', 18, 'add_djangojob'),
	(70, 'Can change django job', 18, 'change_djangojob'),
	(71, 'Can delete django job', 18, 'delete_djangojob'),
	(72, 'Can view django job', 18, 'view_djangojob'),
	(73, 'Can add django job execution', 19, 'add_djangojobexecution'),
	(74, 'Can change django job execution', 19, 'change_djangojobexecution'),
	(75, 'Can delete django job execution', 19, 'delete_djangojobexecution'),
	(76, 'Can view django job execution', 19, 'view_djangojobexecution');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;

-- 导出  表 mydb.auth_user 结构
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- 正在导出表  mydb.auth_user 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
	(1, 'pbkdf2_sha256$216000$dLGBQrZXp5Jm$u0VSGLE/wAQYG6NWTj1ds8wLg9EgdXg0tkFzoCyBRqI=', '2020-11-28 07:45:45.986112', 1, 'shikun', '', '', 'shikun@126.com', 1, 1, '2020-11-28 07:42:54.762369');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;

-- 导出  表 mydb.auth_user_groups 结构
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  mydb.auth_user_groups 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;

-- 导出  表 mydb.auth_user_user_permissions 结构
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  mydb.auth_user_user_permissions 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;

-- 导出  表 mydb.django_admin_log 结构
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- 正在导出表  mydb.django_admin_log 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
	(1, '2020-11-28 07:46:49.136631', '1', 'test1', 1, '[{"added": {}}]', 7, 1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;

-- 导出  表 mydb.django_apscheduler_djangojob 结构
CREATE TABLE IF NOT EXISTS `django_apscheduler_djangojob` (
  `id` varchar(255) NOT NULL,
  `next_run_time` datetime(6) DEFAULT NULL,
  `job_state` longblob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_apscheduler_djangojob_next_run_time_2f022619` (`next_run_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  mydb.django_apscheduler_djangojob 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `django_apscheduler_djangojob` DISABLE KEYS */;
INSERT INTO `django_apscheduler_djangojob` (`id`, `next_run_time`, `job_state`) VALUES
	('92', '2021-01-31 17:00:00.000000', _binary 0x80049507050000000000007D94288C0776657273696F6E944B018C026964948C023932948C0466756E63948C1B6D796170692E76696577733A6261636B67726F756E645F7461736B948C0774726967676572948C1961707363686564756C65722E74726967676572732E63726F6E948C0B43726F6E547269676765729493942981947D942868014B028C0874696D657A6F6E65948C047079747A948C025F70949394288C0D417369612F5368616E67686169944DE8714B008C034C4D5494749452948C0A73746172745F64617465944E8C08656E645F64617465944E8C066669656C6473945D94288C2061707363686564756C65722E74726967676572732E63726F6E2E6669656C6473948C09426173654669656C649493942981947D94288C046E616D65948C0479656172948C0A69735F64656661756C7494888C0B65787072657373696F6E73945D948C2561707363686564756C65722E74726967676572732E63726F6E2E65787072657373696F6E73948C0D416C6C45787072657373696F6E9493942981947D948C0473746570944E736261756268188C0A4D6F6E74684669656C649493942981947D9428681D8C056D6F6E746894681F8868205D9468242981947D9468274E736261756268188C0F4461794F664D6F6E74684669656C649493942981947D9428681D8C0364617994681F8868205D9468242981947D9468274E736261756268188C095765656B4669656C649493942981947D9428681D8C047765656B94681F8868205D9468242981947D9468274E736261756268188C0E4461794F665765656B4669656C649493942981947D9428681D8C0B6461795F6F665F7765656B94681F8868205D9468242981947D9468274E7362617562681A2981947D9428681D8C04686F757294681F8968205D9468228C0F52616E676545787072657373696F6E9493942981947D942868274E8C056669727374944B018C046C617374944B017562617562681A2981947D9428681D8C066D696E75746594681F8968205D94684D2981947D942868274E68504B0068514B007562617562681A2981947D9428681D8C067365636F6E6494681F8868205D94684D2981947D942868274E68504B0068514B007562617562658C066A6974746572944E75628C086578656375746F72948C0764656661756C74948C046172677394298C066B7761726773947D94288C0873756974655F6964944B078C047461736B948C15646A616E676F2E64622E6D6F64656C732E62617365948C0E6D6F64656C5F756E7069636B6C659493948C056D79617069948C045461736B948694859452947D94288C065F73746174659468668C0A4D6F64656C53746174659493942981947D94288C0C6669656C64735F6361636865947D948C0264629468608C06616464696E679489756268024B5C681D8C13E5AE9AE697B6E4BBBBE58AA1E6B58BE8AF9532948C0A7461736B5F7374617465944B008C097461736B5F74797065944B028C0A73746172745F74696D65948C0530313A3030948C0873756974655F6964944B078C0F5F646A616E676F5F76657273696F6E948C05332E312E3394756275681D8C0F6261636B67726F756E645F7461736B948C126D6973666972655F67726163655F74696D65944B018C08636F616C6573636594888C0D6D61785F696E7374616E636573944B018C0D6E6578745F72756E5F74696D65948C086461746574696D65948C086461746574696D65949394430A07E5020101000000000094680F2868104D80704B008C03435354947494529486945294752E),
	('93', '2021-02-01 14:15:00.000000', _binary 0x80049500050000000000007D94288C0776657273696F6E944B018C026964948C023933948C0466756E63948C1B6D796170692E76696577733A6261636B67726F756E645F7461736B948C0774726967676572948C1961707363686564756C65722E74726967676572732E63726F6E948C0B43726F6E547269676765729493942981947D942868014B028C0874696D657A6F6E65948C047079747A948C025F70949394288C0D417369612F5368616E67686169944DE8714B008C034C4D5494749452948C0A73746172745F64617465944E8C08656E645F64617465944E8C066669656C6473945D94288C2061707363686564756C65722E74726967676572732E63726F6E2E6669656C6473948C09426173654669656C649493942981947D94288C046E616D65948C0479656172948C0A69735F64656661756C7494888C0B65787072657373696F6E73945D948C2561707363686564756C65722E74726967676572732E63726F6E2E65787072657373696F6E73948C0D416C6C45787072657373696F6E9493942981947D948C0473746570944E736261756268188C0A4D6F6E74684669656C649493942981947D9428681D8C056D6F6E746894681F8868205D9468242981947D9468274E736261756268188C0F4461794F664D6F6E74684669656C649493942981947D9428681D8C0364617994681F8868205D9468242981947D9468274E736261756268188C095765656B4669656C649493942981947D9428681D8C047765656B94681F8868205D9468242981947D9468274E736261756268188C0E4461794F665765656B4669656C649493942981947D9428681D8C0B6461795F6F665F7765656B94681F8868205D9468242981947D9468274E7362617562681A2981947D9428681D8C04686F757294681F8968205D9468228C0F52616E676545787072657373696F6E9493942981947D942868274E8C056669727374944B168C046C617374944B167562617562681A2981947D9428681D8C066D696E75746594681F8968205D94684D2981947D942868274E68504B0F68514B0F7562617562681A2981947D9428681D8C067365636F6E6494681F8868205D94684D2981947D942868274E68504B0068514B007562617562658C066A6974746572944E75628C086578656375746F72948C0764656661756C74948C046172677394298C066B7761726773947D94288C0873756974655F6964944B078C047461736B948C15646A616E676F2E64622E6D6F64656C732E62617365948C0E6D6F64656C5F756E7069636B6C659493948C056D79617069948C045461736B948694859452947D94288C065F73746174659468668C0A4D6F64656C53746174659493942981947D94288C0C6669656C64735F6361636865947D948C0264629468608C06616464696E679489756268024B5D681D8C0CE5AE9AE697B6E6B58BE8AF95948C0A7461736B5F7374617465944B018C097461736B5F74797065944B028C0A73746172745F74696D65948C0532323A3135948C0873756974655F6964944B078C0F5F646A616E676F5F76657273696F6E948C05332E312E3394756275681D8C0F6261636B67726F756E645F7461736B948C126D6973666972655F67726163655F74696D65944B018C08636F616C6573636594888C0D6D61785F696E7374616E636573944B018C0D6E6578745F72756E5F74696D65948C086461746574696D65948C086461746574696D65949394430A07E50201160F0000000094680F2868104D80704B008C03435354947494529486945294752E);
/*!40000 ALTER TABLE `django_apscheduler_djangojob` ENABLE KEYS */;

-- 导出  表 mydb.django_apscheduler_djangojobexecution 结构
CREATE TABLE IF NOT EXISTS `django_apscheduler_djangojobexecution` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `status` varchar(50) NOT NULL,
  `run_time` datetime(6) NOT NULL,
  `duration` decimal(15,2) DEFAULT NULL,
  `finished` decimal(15,2) DEFAULT NULL,
  `exception` varchar(1000) DEFAULT NULL,
  `traceback` longtext,
  `job_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_apscheduler_djangojobexecution_run_time_16edd96b` (`run_time`),
  KEY `django_apscheduler_djangojobexecution_job_id_daf5090a_fk` (`job_id`),
  CONSTRAINT `django_apscheduler_djangojobexecution_job_id_daf5090a_fk` FOREIGN KEY (`job_id`) REFERENCES `django_apscheduler_djangojob` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- 正在导出表  mydb.django_apscheduler_djangojobexecution 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `django_apscheduler_djangojobexecution` DISABLE KEYS */;
INSERT INTO `django_apscheduler_djangojobexecution` (`id`, `status`, `run_time`, `duration`, `finished`, `exception`, `traceback`, `job_id`) VALUES
	(1, 'Executed', '2021-01-31 14:15:00.000000', 2.43, 1612102502.43, NULL, NULL, '93');
/*!40000 ALTER TABLE `django_apscheduler_djangojobexecution` ENABLE KEYS */;

-- 导出  表 mydb.django_content_type 结构
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- 正在导出表  mydb.django_content_type 的数据：~17 rows (大约)
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(1, 'admin', 'logentry'),
	(3, 'auth', 'group'),
	(2, 'auth', 'permission'),
	(4, 'auth', 'user'),
	(5, 'contenttypes', 'contenttype'),
	(18, 'django_apscheduler', 'djangojob'),
	(19, 'django_apscheduler', 'djangojobexecution'),
	(10, 'myapi', 'apilogin'),
	(17, 'myapi', 'case'),
	(11, 'myapi', 'fuzz'),
	(16, 'myapi', 'report'),
	(15, 'myapi', 'reportitem'),
	(8, 'myapi', 'role'),
	(12, 'myapi', 'suite'),
	(14, 'myapi', 'suitesetcase'),
	(13, 'myapi', 'task'),
	(9, 'myapi', 'token'),
	(7, 'myapi', 'user'),
	(6, 'sessions', 'session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;

-- 导出  表 mydb.django_migrations 结构
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- 正在导出表  mydb.django_migrations 的数据：~32 rows (大约)
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
	(1, 'contenttypes', '0001_initial', '2020-11-28 07:37:42.195678'),
	(2, 'auth', '0001_initial', '2020-11-28 07:37:42.539222'),
	(3, 'admin', '0001_initial', '2020-11-28 07:37:43.136798'),
	(4, 'admin', '0002_logentry_remove_auto_add', '2020-11-28 07:37:43.301819'),
	(5, 'admin', '0003_logentry_add_action_flag_choices', '2020-11-28 07:37:43.316821'),
	(6, 'contenttypes', '0002_remove_content_type_name', '2020-11-28 07:37:43.506845'),
	(7, 'auth', '0002_alter_permission_name_max_length', '2020-11-28 07:37:43.582854'),
	(8, 'auth', '0003_alter_user_email_max_length', '2020-11-28 07:37:43.663865'),
	(9, 'auth', '0004_alter_user_username_opts', '2020-11-28 07:37:43.677366'),
	(10, 'auth', '0005_alter_user_last_login_null', '2020-11-28 07:37:43.747875'),
	(11, 'auth', '0006_require_contenttypes_0002', '2020-11-28 07:37:43.753876'),
	(12, 'auth', '0007_alter_validators_add_error_messages', '2020-11-28 07:37:43.765878'),
	(13, 'auth', '0008_alter_user_username_max_length', '2020-11-28 07:37:43.854389'),
	(14, 'auth', '0009_alter_user_last_name_max_length', '2020-11-28 07:37:43.949401'),
	(15, 'auth', '0010_alter_group_name_max_length', '2020-11-28 07:37:44.024410'),
	(16, 'auth', '0011_update_proxy_permissions', '2020-11-28 07:37:44.039412'),
	(17, 'auth', '0012_alter_user_first_name_max_length', '2020-11-28 07:37:44.127924'),
	(19, 'sessions', '0001_initial', '2020-11-28 07:37:44.212934'),
	(22, 'myapi', '0001_initial', '2020-12-07 14:23:28.198534'),
	(23, 'myapi', '0002_auto_20201207_2257', '2020-12-07 14:57:41.596975'),
	(24, 'myapi', '0003_auto_20201207_2308', '2020-12-07 15:08:21.110553'),
	(25, 'myapi', '0004_auto_20201207_2312', '2020-12-07 15:12:55.627254'),
	(26, 'myapi', '0005_auto_20201207_2313', '2020-12-07 15:14:03.397130'),
	(27, 'django_apscheduler', '0001_initial', '2021-01-06 12:36:06.532594'),
	(28, 'django_apscheduler', '0002_auto_20180412_0758', '2021-01-06 12:36:06.688594'),
	(29, 'django_apscheduler', '0003_auto_20200716_1632', '2021-01-06 12:36:06.844594'),
	(30, 'django_apscheduler', '0004_auto_20200717_1043', '2021-01-06 12:36:07.296995'),
	(31, 'django_apscheduler', '0005_migrate_name_to_id', '2021-01-06 12:36:07.343795'),
	(32, 'django_apscheduler', '0006_remove_djangojob_name', '2021-01-06 12:36:07.406195'),
	(33, 'django_apscheduler', '0007_auto_20200717_1404', '2021-01-06 12:36:07.484195'),
	(34, 'django_apscheduler', '0008_remove_djangojobexecution_started', '2021-01-06 12:36:07.530996'),
	(35, 'myapi', '0006_apilogin_case_fuzz_report_reportitem_suite_suitesetcase_task', '2021-01-06 12:36:07.827396'),
	(36, 'myapi', '0007_auto_20210117_1217', '2021-01-17 04:17:24.003337'),
	(37, 'myapi', '0008_auto_20210117_2157', '2021-01-17 13:57:35.326190'),
	(38, 'myapi', '0009_task_suite', '2021-01-20 14:32:41.914830'),
	(39, 'myapi', '0010_auto_20210124_1750', '2021-01-24 09:50:36.511774'),
	(40, 'myapi', '0011_auto_20210131_1055', '2021-01-31 02:56:10.234671'),
	(41, 'myapi', '0012_remove_case_hope', '2021-01-31 03:10:34.718117'),
	(42, 'myapi', '0013_auto_20210131_1117', '2021-01-31 03:17:28.106761'),
	(43, 'myapi', '0014_task_start_time', '2021-01-31 13:12:24.455969');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;

-- 导出  表 mydb.django_session 结构
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  mydb.django_session 的数据：~53 rows (大约)
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
	('1zflt5te9lm1p1lenfo6kh9y7u2syqmo', 'eyJpc19sb2dpbiI6dHJ1ZSwidXNlcl9pZCI6MSwidXNlcl9uYW1lIjoidGVzdDEifQ:1kjCjP:wg3E0DZr9XER-EnvhY26tSBe29gXmmc7_Pha4eKUmXA', '2020-12-13 02:46:31.274975'),
	('2bd4myvr49ezapx8xks305j6kk6330l4', 'eyJpc19sb2dpbiI6dHJ1ZSwidXNlcl9pZCI6MSwidXNlcl9uYW1lIjoidGVzdDEifQ:1klu6q:8kujuq_i1Ic1sxFhi3USVNqWLLnfGnI-Yzn5EGwbEFY', '2020-12-20 13:29:52.737338'),
	('2xgfcsuk20ijqt1ab6g8shoxvas1vr8n', 'eyJpc19sb2dpbiI6dHJ1ZSwidXNlcl9pZCI6MSwidXNlcl9uYW1lIjoidGVzdDEifQ:1klv3v:SfkUFyoTScYTt-OqgvAdc3E5hnbrdKbhd9KiYlPC_FI', '2020-12-20 14:30:55.203812'),
	('3lxqhb399g0hm1m8upzf1oy6om8o0mkl', 'eyJpc19sb2dpbiI6dHJ1ZSwidXNlcl9pZCI6MSwidXNlcl9uYW1lIjoidGVzdDEifQ:1kluxu:aVYtrsZVkhoRbQ24ZHUDItVO0kLp4bYhn4PEtVH_b64', '2020-12-20 14:24:42.393141'),
	('42dhr5n7bc15n3svsjdulnamu0dpeqvt', 'eyJpc19sb2dpbiI6dHJ1ZSwidXNlcl9pZCI6MSwidXNlcl9uYW1lIjoidGVzdDEifQ:1klv7D:NZJGSVLVq6tqG-Qy2KUV6swp2Nw5WI5_MONRh71nh2Q', '2020-12-20 14:34:19.905248'),
	('4xg4zh6xku8ttulwo1emtomj2x85a3wh', 'eyJpc19sb2dpbiI6dHJ1ZSwidXNlcl9pZCI6MSwidXNlcl9uYW1lIjoidGVzdDEifQ:1kjE7g:Dmg2KX6ZjhdC16JDDATB7JH2_G4Swuogx5hrs6jDlBA', '2020-12-13 04:15:40.844344'),
	('502arcrpqyjuzyazvl6wuiy2w5vyqh1t', 'eyJpc19sb2dpbiI6dHJ1ZSwidXNlcl9pZCI6MSwidXNlcl9uYW1lIjoidGVzdDEifQ:1klpM5:vJuqloWGrMAo95ESPvyIf96cP2F5KX5RUAiGYznEwX8', '2020-12-20 08:25:17.289645'),
	('741rl96y4g4lzrsow7k7ynl2xyb11j0t', 'eyJpc19sb2dpbiI6dHJ1ZSwidXNlcl9pZCI6MSwidXNlcl9uYW1lIjoidGVzdDEifQ:1kj35W:6mnUhrt2dyHAlm5jc8ZpkpcR9HLahvTB9lD9wkw5Hbg', '2020-12-12 16:28:42.622556'),
	('7ppt5xsa2gmdmsw32fpjhytddkz64yn0', 'eyJpc19sb2dpbiI6dHJ1ZSwidXNlcl9pZCI6MSwidXNlcl9uYW1lIjoidGVzdDEifQ:1kluny:HcJSEwYmBBK7KbJm8f6xNpdT8gVmTMZlVFt8uNT6TFU', '2020-12-20 14:14:26.231692'),
	('a95h4akvk92x6nk6oxhp10oovl84lzdy', 'eyJpc19sb2dpbiI6dHJ1ZSwidXNlcl9pZCI6MSwidXNlcl9uYW1lIjoidGVzdDEifQ:1kjDoK:3JG2WpDxbj8E7fyMYQu1hg_ikUr7gYRAvEPW9ilhTVI', '2020-12-13 03:55:40.699316'),
	('ax40zep0thkq4xr3zuzwyjf9yz5f0kya', 'eyJpc19sb2dpbiI6dHJ1ZSwidXNlcl9pZCI6MSwidXNlcl9uYW1lIjoidGVzdDEifQ:1kiwTu:FsS5DvA3Po82_dMgnL1_WuSC6KieIw4lj07G9_y1cLM', '2020-12-12 09:25:26.274012'),
	('b2lsj50yaciuni25cxn8r0y5mpcrtp1d', 'eyJpc19sb2dpbiI6dHJ1ZSwidXNlcl9pZCI6MSwidXNlcl9uYW1lIjoidGVzdDEifQ:1kjDfv:ZaVni9SyWJE_EHiQgmj0_7ctrcgZ7kS48NZikYpvMYg', '2020-12-13 03:46:59.057092'),
	('bjet5p3uknm3krov9e5sx9s4si4yv8kw', 'eyJpc19sb2dpbiI6dHJ1ZSwidXNlcl9pZCI6MSwidXNlcl9uYW1lIjoidGVzdDEifQ:1kjDZQ:Q2zbhLzhpxDfpn2-bzF3beqvOKQNrDxz4DPfytUu48E', '2020-12-13 03:40:16.609198'),
	('bjjzccfa0iubpfgkft7b8atnuo2v98c4', 'eyJpc19sb2dpbiI6dHJ1ZSwidXNlcl9pZCI6MSwidXNlcl9uYW1lIjoidGVzdDEifQ:1klv0Z:4kSKVDDH0zuCYl5LQFrgXRKKcDMa2i6H3IVP9tTvKfA', '2020-12-20 14:27:27.687489'),
	('bshfa75bzu8bv4c3f0t2gtlncyukay7h', 'eyJpc19sb2dpbiI6dHJ1ZSwidXNlcl9pZCI6MSwidXNlcl9uYW1lIjoidGVzdDEifQ:1klv5Z:IiC4YSFF470qpQddp2thL23gF0tASyBiXTHGZuIZOTs', '2020-12-20 14:32:37.565539'),
	('dw2hdrgv884quyutgff92j6hhygzkpr0', 'eyJpc19sb2dpbiI6dHJ1ZSwidXNlcl9pZCI6MSwidXNlcl9uYW1lIjoidGVzdDEifQ:1klujT:fZoVudTyY4Vc9eNKsse66-UTVwnnBqbRP7Z4esE1-M4', '2020-12-20 14:09:47.394921'),
	('ej4eculk3h94npxrzwxfjn4e0gro35yd', 'eyJpc19sb2dpbiI6dHJ1ZSwidXNlcl9pZCI6MSwidXNlcl9uYW1lIjoidGVzdDEifQ:1kluRK:fQ7yDlxQgUIieYUEbdYTmya_YXd1RuGS5xLYlBzfADw', '2020-12-20 13:51:02.962414'),
	('erfewynepwvbp5hnger01v43bkiy80f0', 'eyJpc19sb2dpbiI6dHJ1ZSwidXNlcl9pZCI6MSwidXNlcl9uYW1lIjoidGVzdDEifQ:1kluSV:emxmcCVgQSP0q9m7fKUrbq5GU3ZyMlX88PXNJ4fU1kk', '2020-12-20 13:52:15.816295'),
	('fiihp9mxaysyosser95dhg1xls2512xj', 'eyJpc19sb2dpbiI6dHJ1ZSwidXNlcl9pZCI6MSwidXNlcl9uYW1lIjoidGVzdDEifQ:1kiwOM:d62jUf9f1SV-b_T9bGY-yShjQF51Skh7bt1pHu0VJ1w', '2020-12-12 09:19:42.433850'),
	('fpwqj0f6hgkzcm8f3yzgr7t1b5tt4icb', 'eyJpc19sb2dpbiI6dHJ1ZSwidXNlcl9pZCI6MSwidXNlcl9uYW1lIjoidGVzdDEifQ:1kluYQ:4YcSBOiLGFWrH-ORCTVsvFPVyMlJyLg20utskAlJpC8', '2020-12-20 13:58:22.840167'),
	('fq0ym99i4xbfj3ay1mejcq7t6du2vv15', 'eyJpc19sb2dpbiI6dHJ1ZSwidXNlcl9pZCI6MSwidXNlcl9uYW1lIjoidGVzdDEifQ:1kiwN7:IDc7E2FLAv7kjIvEsSqsUDHevJyhWFeS1RWy_3tog_0', '2020-12-12 09:18:25.873628'),
	('if6p0ur1b2waumu5yhpn8go1kkobwflg', 'eyJpc19sb2dpbiI6dHJ1ZSwidXNlcl9pZCI6MSwidXNlcl9uYW1lIjoidGVzdDEifQ:1kjDX9:qtPXJtxm8AQCxeTVq_HkMsUvGntCTFi_6QRGBYqsNzs', '2020-12-13 03:37:55.360394'),
	('iyoca247evxt7eyw1qk5tagjbfbwxgj3', 'eyJpc19sb2dpbiI6dHJ1ZSwidXNlcl9pZCI6MSwidXNlcl9uYW1lIjoidGVzdDEifQ:1kjChZ:ikTjBYq33DgPyAPhqE7QZDPU6fZOHQVPtCjAvmqMATI', '2020-12-13 02:44:37.586809'),
	('jhd6w5rbdyqoax6nn283ho30e23hllwo', 'eyJpc19sb2dpbiI6dHJ1ZSwidXNlcl9pZCI6MSwidXNlcl9uYW1lIjoidGVzdDEifQ:1kiwbf:8czTEIXSgb70YxU_dmQy5sOmJ2IvvpCv_hG5-r7DI2g', '2020-12-12 09:33:27.629136'),
	('ktl4cmovgxmme3fylyiysy5c15mu8wgp', 'eyJpc19sb2dpbiI6dHJ1ZSwidXNlcl9pZCI6MSwidXNlcl9uYW1lIjoidGVzdDEifQ:1kludA:rnaBUZllT1LhhZD7F04Cv4GS5Fn4s1pOtupe3CfS0BM', '2020-12-20 14:03:16.193290'),
	('ky2pa70c5owv38lbu545e083hep5z2vh', 'eyJpc19sb2dpbiI6dHJ1ZSwidXNlcl9pZCI6MSwidXNlcl9uYW1lIjoidGVzdDEifQ:1kiwkC:O3YX25gKIu4UHLqDbldvbt1AKTi7ts9w5HpGGzpXhAs', '2020-12-12 09:42:16.885343'),
	('lv3mmzqqngj4thu0xo9d4i0wcooi38wr', 'eyJpc19sb2dpbiI6dHJ1ZSwidXNlcl9pZCI6MSwidXNlcl9uYW1lIjoidGVzdDEifQ:1klu67:qyX6EBF2va5puNhHsPv0gx1KN2RjKdKIxxBjWQPJlzU', '2020-12-20 13:29:07.185838'),
	('m9kf3oqpqenudad7dtz6070scotac5py', 'eyJpc19sb2dpbiI6dHJ1ZSwidXNlcl9pZCI6MSwidXNlcl9uYW1lIjoidGVzdDEifQ:1kluAJ:wdt1oMn2ZLaka6UmBvDe-_JIWi-wtjBYt0QN2Rzg11E', '2020-12-20 13:33:27.297938'),
	('mtr84lg0qd1b0flchrqaiqx6v30hgxgs', 'eyJpc19sb2dpbiI6dHJ1ZSwidXNlcl9pZCI6MSwidXNlcl9uYW1lIjoidGVzdDEifQ:1kjDip:RFtXvuBj_ys-QfOSxqnq1wh29J8iaLh0NRKNocg4xBg', '2020-12-13 03:49:59.057890'),
	('pwki7nkq25z1w74rjljv3476fcevnjfu', 'eyJpc19sb2dpbiI6dHJ1ZSwidXNlcl9pZCI6MSwidXNlcl9uYW1lIjoidGVzdDEifQ:1kjDjM:WK6sUN0xhICLP1NM89_WiPkNiUnN7ikffzxZpYhNdgs', '2020-12-13 03:50:32.411174'),
	('q1a3p7pgjmmnvt368eqxg58vgc6s25kx', 'eyJpc19sb2dpbiI6dHJ1ZSwidXNlcl9pZCI6MSwidXNlcl9uYW1lIjoidGVzdDEifQ:1kj2tN:ynloEz8DZMAEl9-DFHqmGieDogvnSLetfXeoQEa4bBo', '2020-12-12 16:16:09.274496'),
	('q8t3pm409mbxcv0rh68sqfjgiztdb7ac', 'eyJpc19sb2dpbiI6dHJ1ZSwidXNlcl9pZCI6MSwidXNlcl9uYW1lIjoidGVzdDEifQ:1kiwg8:2ahEi8Ci8H21tauvoQQWtoYsxrEZL44bRNQpbmIseZE', '2020-12-12 09:38:04.374278'),
	('qfjjhi795u2k394c5g9w5u1i8j9fghbp', 'eyJpc19sb2dpbiI6dHJ1ZSwidXNlcl9pZCI6MSwidXNlcl9uYW1lIjoidGVzdDEifQ:1kluUu:rJqNN5gaxwIlJLeiSRh8oZLIfJoZCsQroO1u-Yji6Qs', '2020-12-20 13:54:44.126197'),
	('qtvg3few5e6a9ybwbq9p837h214zki6o', 'eyJpc19sb2dpbiI6dHJ1ZSwidXNlcl9pZCI6MSwidXNlcl9uYW1lIjoidGVzdDEifQ:1kiwbN:ByTtytjkym98cd6lNgq1x74etIrYGLDOjbR9KbErfs8', '2020-12-12 09:33:09.646853'),
	('r45peu64q7bmz4bs1mqgk5ndaj6c7wt7', 'eyJpc19sb2dpbiI6dHJ1ZSwidXNlcl9pZCI6MSwidXNlcl9uYW1lIjoidGVzdDEifQ:1klpjo:fDHq_-BFgNz1WoC68cnZWB_VgpUFq1rpOcb4rxp__c8', '2020-12-20 08:49:48.085220'),
	('righhoorj327ol7d0347ztrbh07l8a5v', 'eyJpc19sb2dpbiI6dHJ1ZSwidXNlcl9pZCI6MSwidXNlcl9uYW1lIjoidGVzdDEifQ:1kj3Rm:7A2Y_usJWA_-EfEwCil84D5wjF6mgQUqplqrZBohZCg', '2020-12-12 16:51:42.081113'),
	('s3rgxwjptls1r3xzxx1gqh0suaut70ki', 'eyJpc19sb2dpbiI6dHJ1ZSwidXNlcl9pZCI6MSwidXNlcl9uYW1lIjoidGVzdDEifQ:1kiwR4:YkCaK5MVfCFNGw-6_mV2EUURN8ix4zz2BdkSLw4Hpp0', '2020-12-12 09:22:30.530695'),
	('s8bozmo7v9cn0dahe92498y4ybxleyer', 'eyJpc19sb2dpbiI6dHJ1ZSwidXNlcl9pZCI6MSwidXNlcl9uYW1lIjoidGVzdDEifQ:1klvCp:l9LosVrdzdTaVsI1PMM3yJD5vLLthBb3kQTRPruRpfw', '2020-12-20 14:40:07.368056'),
	('te7iu4lult68dne2njv3lytl2fxi6vni', 'eyJpc19sb2dpbiI6dHJ1ZSwidXNlcl9pZCI6MSwidXNlcl9uYW1lIjoidGVzdDEifQ:1kiwNL:jBh7Xtd7ypQIT3Q_HDjUzMUPQr8VK8O5__MdppXsXZw', '2020-12-12 09:18:39.141813'),
	('tmja5iwlc9vcm8fip2s8q4l74m6gvkcz', 'eyJpc19sb2dpbiI6dHJ1ZSwidXNlcl9pZCI6MSwidXNlcl9uYW1lIjoidGVzdDEifQ:1kjHEg:GypC3fIB8iWuAHytd4MDWZdf-O8Uy0Leg9EMD_e77CA', '2020-12-13 07:35:06.719213'),
	('twx8eh0o1hu3gsdybsbf5308g8khg7d1', 'eyJpc19sb2dpbiI6dHJ1ZSwidXNlcl9pZCI6MSwidXNlcl9uYW1lIjoidGVzdDEifQ:1kiwgK:PO1w2-ujmh-Vz70vvgjmTxTc2aZdyWEvNvidhHntly0', '2020-12-12 09:38:16.895368'),
	('tzw746vpch27xyvwtzwzs6j56lonqzlt', 'eyJpc19sb2dpbiI6dHJ1ZSwidXNlcl9pZCI6MSwidXNlcl9uYW1lIjoidGVzdDEifQ:1kluuo:_p6p2lLXQRh8yYZLhWFc71wB5UnyOaI-zSP4TOt7jec', '2020-12-20 14:21:30.028210'),
	('ukkvhdthrgpa6f9eazpi9vj6wwhq9alo', 'eyJpc19sb2dpbiI6dHJ1ZSwidXNlcl9pZCI6MSwidXNlcl9uYW1lIjoidGVzdDEifQ:1kluBR:jOje2fF2SvlBlXx3TyeVrU7cgaPkhfvuosoV3imqaAw', '2020-12-20 13:34:37.168733'),
	('uzwcio3rvc0vut8s46f0kw7ik0ccmv4g', 'eyJpc19sb2dpbiI6dHJ1ZSwidXNlcl9pZCI6MSwidXNlcl9uYW1lIjoidGVzdDEifQ:1kluW9:XGkDy02nUw6jfB4r6DHVRU7BP5CCg8fbC0kQO4NXI_Y', '2020-12-20 13:56:01.774424'),
	('vlrcj4jp9urwee7617g0rprnp2zvc1q1', 'eyJpc19sb2dpbiI6dHJ1ZSwidXNlcl9pZCI6MSwidXNlcl9uYW1lIjoidGVzdDEifQ:1klv5D:EuHTlcKyeXJSnz-frWZ2V9DH2K7AByeU8jCxGXkTyF8', '2020-12-20 14:32:15.047981'),
	('wjfwohqirjm566wnno4zqe9duhzq4861', 'eyJpc19sb2dpbiI6dHJ1ZSwidXNlcl9pZCI6MSwidXNlcl9uYW1lIjoidGVzdDEifQ:1klv95:ZWFa_3p7MVX1qOgF6Mrt99_P518_3YgH5hbNjJ2shls', '2020-12-20 14:36:15.233411'),
	('x2iqexckp9c9zm937la60b9dzxptt7k7', 'eyJpc19sb2dpbiI6dHJ1ZSwidXNlcl9pZCI6MSwidXNlcl9uYW1lIjoidGVzdDEifQ:1kiwNQ:28SXFVwYN1Zen8qQZ_xUxao1qjcnxXFWYezvXyiVzA0', '2020-12-12 09:18:44.024933'),
	('xzeviz3imp75yek5p3tdx6lq2iywn6yu', 'eyJpc19sb2dpbiI6dHJ1ZSwidXNlcl9pZCI6MSwidXNlcl9uYW1lIjoidGVzdDEifQ:1klufF:n_wrLn7zsb6WKiQ5mSGmswTS5pU0XTVrNmKzoVU6gpM', '2020-12-20 14:05:25.794421'),
	('y2h33ewq4otwmwsgaqgu2lauxzqqjz4x', 'eyJpc19sb2dpbiI6dHJ1ZSwidXNlcl9pZCI6MSwidXNlcl9uYW1lIjoidGVzdDEifQ:1kluTm:qIwbe-8exhjyCEVdP4WH89x8Oxq6chfGExDLGvQccRg', '2020-12-20 13:53:34.019572'),
	('yoptzntrlzpttw63zu1ghqba9b3vh3k7', 'eyJpc19sb2dpbiI6dHJ1ZSwidXNlcl9pZCI6MSwidXNlcl9uYW1lIjoidGVzdDEifQ:1kjEPD:nUJ13rxtzYmSVMl8OR1UOmAbg1CKgMkUBOAE8lj933g', '2020-12-13 04:33:47.811410'),
	('yux3gavwbf9akglufhytl9l9nesuheei', 'eyJpc19sb2dpbiI6dHJ1ZSwidXNlcl9pZCI6MSwidXNlcl9uYW1lIjoidGVzdDEifQ:1klv3Z:YDMFjLhuirPUekICtesJVhSliRdNj9PBSjbLay_DkMc', '2020-12-20 14:30:33.443220'),
	('zbx087rcb8r8y2aj2rm6dp8tijbqzi3f', 'eyJpc19sb2dpbiI6dHJ1ZSwidXNlcl9pZCI6MSwidXNlcl9uYW1lIjoidGVzdDEifQ:1kiwgT:v3NjQX4PzgYbA3rhwNauiHjXHNuLqFCFSXUIh0S4vc0', '2020-12-12 09:38:25.606975'),
	('ze24vvsspq2lv6006d3jxidxx3ow4mji', 'eyJpc19sb2dpbiI6dHJ1ZSwidXNlcl9pZCI6MSwidXNlcl9uYW1lIjoidGVzdDEifQ:1kiwMY:FgBQrdJR7NNW-T10ahguEql93ka01EpVnm822Hpgvlg', '2020-12-12 09:17:50.694161'),
	('zt35ykrd6ng271l3fq6vxn97yrfpvbrj', 'eyJpc19sb2dpbiI6dHJ1ZSwidXNlcl9pZCI6MSwidXNlcl9uYW1lIjoidGVzdDEifQ:1kiwkQ:e871FTsPWMlEeaUUyX4P7DQdsbRXdQitgYTH0UfG4vc', '2020-12-12 09:42:30.991135'),
	('zu1bs6rah26jplxz1j7qyy2az8ix75ra', 'eyJpc19sb2dpbiI6dHJ1ZSwidXNlcl9pZCI6MSwidXNlcl9uYW1lIjoidGVzdDEifQ:1kiwXz:dUxxTBO4KccREMYatdQat75vBws435cJSI_72LhDCw4', '2020-12-12 09:29:39.866214');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;

-- 导出  表 mydb.myapi_apilogin 结构
CREATE TABLE IF NOT EXISTS `myapi_apilogin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `url` varchar(300) NOT NULL,
  `params` varchar(10000) NOT NULL,
  `method` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  mydb.myapi_apilogin 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `myapi_apilogin` DISABLE KEYS */;
/*!40000 ALTER TABLE `myapi_apilogin` ENABLE KEYS */;

-- 导出  表 mydb.myapi_case 结构
CREATE TABLE IF NOT EXISTS `myapi_case` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `url` varchar(100) NOT NULL,
  `protocol` varchar(10) NOT NULL,
  `method` varchar(10) NOT NULL,
  `params` varchar(1000) NOT NULL,
  `suite_id` int DEFAULT NULL,
  `hope` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `myapi_case_suite_id_1f38cdf8_fk_myapi_suite_id` (`suite_id`),
  CONSTRAINT `myapi_case_suite_id_1f38cdf8_fk_myapi_suite_id` FOREIGN KEY (`suite_id`) REFERENCES `myapi_suite` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- 正在导出表  mydb.myapi_case 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `myapi_case` DISABLE KEYS */;
INSERT INTO `myapi_case` (`id`, `name`, `url`, `protocol`, `method`, `params`, `suite_id`, `hope`) VALUES
	(2, '添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{"name": "111","price": 100, "address":"北京"}', NULL, '"code":1|"msg":"success"'),
	(4, '商品列表', '127.0.0.1:8100/myapi/get_shop_list', 'http', 'get', '', NULL, '"code":1');
/*!40000 ALTER TABLE `myapi_case` ENABLE KEYS */;

-- 导出  表 mydb.myapi_fuzz 结构
CREATE TABLE IF NOT EXISTS `myapi_fuzz` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `fuzz_type` int NOT NULL,
  `fuzz_content` varchar(10000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- 正在导出表  mydb.myapi_fuzz 的数据：~4 rows (大约)
/*!40000 ALTER TABLE `myapi_fuzz` DISABLE KEYS */;
INSERT INTO `myapi_fuzz` (`id`, `name`, `fuzz_type`, `fuzz_content`) VALUES
	(1, '不传参数', 0, '默认不传value'),
	(2, '删除key', 1, 'key不传'),
	(3, '超长传值', 2, '系统生成'),
	(5, '注入攻击1', -3, 'x\' AND userid IS NULL; --');
/*!40000 ALTER TABLE `myapi_fuzz` ENABLE KEYS */;

-- 导出  表 mydb.myapi_report 结构
CREATE TABLE IF NOT EXISTS `myapi_report` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `start_time` varchar(100) NOT NULL,
  `sum_time` varchar(10) NOT NULL,
  `passed` int NOT NULL,
  `failed` int NOT NULL,
  `no_check` int NOT NULL,
  `log` varchar(100) DEFAULT NULL,
  `report_path` varchar(100) NOT NULL,
  `task_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `myapi_report_task_id_cc6aa865` (`task_id`),
  CONSTRAINT `myapi_report_task_id_cc6aa865_fk_myapi_task_id` FOREIGN KEY (`task_id`) REFERENCES `myapi_task` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;

-- 正在导出表  mydb.myapi_report 的数据：~38 rows (大约)
/*!40000 ALTER TABLE `myapi_report` DISABLE KEYS */;
INSERT INTO `myapi_report` (`id`, `name`, `start_time`, `sum_time`, `passed`, `failed`, `no_check`, `log`, `report_path`, `task_id`) VALUES
	(37, '大回归1', '17:56:21', '', 0, 0, 0, NULL, '', NULL),
	(38, '大回归1', '17:57:11', '', 0, 0, 0, NULL, '', NULL),
	(39, '大回归1', '17:58:20', '0:00:03', 3, 0, 4, NULL, '', NULL),
	(40, '大回归1', '18:01:25', '0:00:02', 2, 0, 3, NULL, '', NULL),
	(41, '大回归1', '18:02:38', '0:00:02', 2, 0, 0, NULL, '', NULL),
	(42, '大回归1', '18:03:25', '', 0, 0, 0, NULL, '', NULL),
	(43, '大回归1', '18:04:20', '0:00:02', 18, 0, 0, NULL, '', NULL),
	(44, '大回归1', '19:12:54', '', 0, 0, 0, NULL, '', NULL),
	(45, '大回归1', '19:22:04', '0:00:02', 16, 0, 2, NULL, '', NULL),
	(46, '大回归1', '19:23:54', '0:00:03', 16, 0, 2, NULL, '', NULL),
	(47, '大回归1', '19:32:37', '0:00:02', 4, 0, 14, NULL, '', NULL),
	(48, '大回归1', '19:39:05', '0:00:02', 1, 0, 17, NULL, '', NULL),
	(49, '大回归1', '22:26:19', '0:00:03', 2, 0, 16, NULL, '', NULL),
	(50, '大回归1', '22:39:34', '0:00:02', 2, 0, 0, NULL, '', 62),
	(51, '注入规则1', '10:19:09', '', 0, 0, 0, NULL, '', NULL),
	(52, '注入规则1', '10:19:37', '', 0, 0, 0, NULL, '', NULL),
	(53, '注入规则1', '10:25:06', '0:00:03', 2, 0, 25, NULL, '', 65),
	(54, '注入规则1', '10:34:48', '0:00:02', 2, 0, 25, NULL, '', 66),
	(55, '注入规则1', '10:40:41', '0:00:02', 2, 0, 25, NULL, '', NULL),
	(56, '注入规则1', '10:52:36', '0:00:02', 27, 0, 0, NULL, '', NULL),
	(57, '注入规则1', '11:06:25', '0:00:03', 27, 0, 0, NULL, '', NULL),
	(58, '注入规则1', '11:08:11', '0:00:03', 27, 0, 0, NULL, '', NULL),
	(59, '注入规则1', '11:16:17', '', 0, 0, 0, NULL, '', NULL),
	(60, '注入规则1', '11:18:21', '0:00:03', 0, 27, 0, NULL, '', NULL),
	(61, '注入规则1', '11:27:51', '0:00:03', 0, 27, 0, NULL, '', NULL),
	(62, '注入规则1', '11:33:53', '0:00:03', 0, 27, 0, NULL, '', NULL),
	(63, '注入规则1', '11:38:09', '0:00:03', 0, 27, 0, NULL, '', NULL),
	(64, '注入规则1', '11:41:00', '0:00:02', 27, 0, 0, NULL, '', NULL),
	(65, '注入规则1', '11:43:26', '0:00:02', 27, 0, 0, NULL, '', NULL),
	(66, '注入规则1', '11:44:42', '0:00:02', 27, 0, 0, NULL, '', NULL),
	(67, '注入规则1', '11:47:40', '0:00:02', 27, 0, 0, NULL, '', NULL),
	(68, '注入规则1', '11:53:23', '0:00:02', 27, 0, 0, NULL, '', NULL),
	(69, '注入规则1', '11:54:04', '0:00:03', 27, 0, 0, NULL, '', NULL),
	(70, '注入规则1', '11:55:37', '0:00:02', 3, 24, 0, NULL, '', NULL),
	(71, '注入规则1', '12:04:23', '0:01:40', 3, 24, 0, NULL, '', NULL),
	(72, '注入规则1', '21:50:32', '0:00:02', 3, 24, 0, NULL, '', NULL),
	(73, '大回归1', '21:51:13', '0:00:02', 2, 0, 0, NULL, '', NULL),
	(74, '大回归1', '21:57:30', '0:00:02', 2, 0, 0, NULL, '', NULL),
	(75, '注入规则1', '22:15:00', '0:00:02', 3, 24, 0, NULL, '', 93);
/*!40000 ALTER TABLE `myapi_report` ENABLE KEYS */;

-- 导出  表 mydb.myapi_reportitem 结构
CREATE TABLE IF NOT EXISTS `myapi_reportitem` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `url` varchar(100) NOT NULL,
  `protocol` varchar(10) NOT NULL,
  `method` varchar(10) NOT NULL,
  `params` varchar(1000) NOT NULL,
  `hope` varchar(100) NOT NULL,
  `sum_time` varchar(50) NOT NULL,
  `fact` varchar(10000) NOT NULL,
  `result` int NOT NULL,
  `report_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `myapi_reportitem_report_id_85f04e9d_fk_myapi_report_id` (`report_id`),
  CONSTRAINT `myapi_reportitem_report_id_85f04e9d_fk_myapi_report_id` FOREIGN KEY (`report_id`) REFERENCES `myapi_report` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=683 DEFAULT CHARSET=utf8;

-- 正在导出表  mydb.myapi_reportitem 的数据：~599 rows (大约)
/*!40000 ALTER TABLE `myapi_reportitem` DISABLE KEYS */;
INSERT INTO `myapi_reportitem` (`id`, `name`, `url`, `protocol`, `method`, `params`, `hope`, `sum_time`, `fact`, `result`, `report_id`) VALUES
	(45, '商品列表', '127.0.0.1:8100/myapi/get_shop_list', 'http', 'get', '{}', '[\'"code":1\', \'"id":1\']', '0:00:00', '{"code":1,"msg":"success","data":[{"id":0,"name":"\\u624b\\u673a0","price":100},{"id":1,"name":"\\u624b\\u673a1","price":101},{"id":2,"name":"\\u624b\\u673a2","price":102},{"id":3,"name":"\\u624b\\u673a3","price":103},{"id":4,"name":"\\u624b\\u673a4","price":104},{"id":5,"name":"\\u624b\\u673a5","price":105},{"id":6,"name":"\\u624b\\u673a6","price":106},{"id":7,"name":"\\u624b\\u673a7","price":107},{"id":8,"name":"\\u624b\\u673a8","price":108},{"id":9,"name":"\\u624b\\u673a9","price":109}]}', 1, 39),
	(46, '添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'price\': 100, \'address\': \'北京\'}', '[\'"code":1\']', '0:00:01', '{"code":1,"msg":"success"}', 1, 39),
	(47, '商品列表', '127.0.0.1:8100/myapi/get_shop_list', 'http', 'get', '{}', '[\'"code":1\', \'"id":1\']', '0:00:00', '{"code":1,"msg":"success","data":[{"id":0,"name":"\\u624b\\u673a0","price":100},{"id":1,"name":"\\u624b\\u673a1","price":101},{"id":2,"name":"\\u624b\\u673a2","price":102},{"id":3,"name":"\\u624b\\u673a3","price":103},{"id":4,"name":"\\u624b\\u673a4","price":104},{"id":5,"name":"\\u624b\\u673a5","price":105},{"id":6,"name":"\\u624b\\u673a6","price":106},{"id":7,"name":"\\u624b\\u673a7","price":107},{"id":8,"name":"\\u624b\\u673a8","price":108},{"id":9,"name":"\\u624b\\u673a9","price":109}]}', 1, 40),
	(48, '添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'price\': 100, \'address\': \'北京\'}', '[\'"code":1\']', '0:00:00', '{"code":1,"msg":"success"}', 1, 40),
	(49, '商品列表', '127.0.0.1:8100/myapi/get_shop_list', 'http', 'get', '{}', '[\'"code":1\', \'"id":1\']', '0:00:00', '{"code":1,"msg":"success","data":[{"id":0,"name":"\\u624b\\u673a0","price":100},{"id":1,"name":"\\u624b\\u673a1","price":101},{"id":2,"name":"\\u624b\\u673a2","price":102},{"id":3,"name":"\\u624b\\u673a3","price":103},{"id":4,"name":"\\u624b\\u673a4","price":104},{"id":5,"name":"\\u624b\\u673a5","price":105},{"id":6,"name":"\\u624b\\u673a6","price":106},{"id":7,"name":"\\u624b\\u673a7","price":107},{"id":8,"name":"\\u624b\\u673a8","price":108},{"id":9,"name":"\\u624b\\u673a9","price":109}]}', 1, 41),
	(50, '添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'price\': 100, \'address\': \'北京\'}', '[\'"code":1\']', '0:00:00', '{"code":1,"msg":"success"}', 1, 41),
	(51, '商品列表', '127.0.0.1:8100/myapi/get_shop_list', 'http', 'get', '{}', '[\'"code":1\', \'"id":1\']', '0:00:00', '{"code":1,"msg":"success","data":[{"id":0,"name":"\\u624b\\u673a0","price":100},{"id":1,"name":"\\u624b\\u673a1","price":101},{"id":2,"name":"\\u624b\\u673a2","price":102},{"id":3,"name":"\\u624b\\u673a3","price":103},{"id":4,"name":"\\u624b\\u673a4","price":104},{"id":5,"name":"\\u624b\\u673a5","price":105},{"id":6,"name":"\\u624b\\u673a6","price":106},{"id":7,"name":"\\u624b\\u673a7","price":107},{"id":8,"name":"\\u624b\\u673a8","price":108},{"id":9,"name":"\\u624b\\u673a9","price":109}]}', 1, 42),
	(52, '商品列表', '127.0.0.1:8100/myapi/get_shop_list', 'http', 'get', '{}', '[\'"code":1\', \'"id":1\']', '0:00:00', '{"code":1,"msg":"success","data":[{"id":0,"name":"\\u624b\\u673a0","price":100},{"id":1,"name":"\\u624b\\u673a1","price":101},{"id":2,"name":"\\u624b\\u673a2","price":102},{"id":3,"name":"\\u624b\\u673a3","price":103},{"id":4,"name":"\\u624b\\u673a4","price":104},{"id":5,"name":"\\u624b\\u673a5","price":105},{"id":6,"name":"\\u624b\\u673a6","price":106},{"id":7,"name":"\\u624b\\u673a7","price":107},{"id":8,"name":"\\u624b\\u673a8","price":108},{"id":9,"name":"\\u624b\\u673a9","price":109}]}', 1, 43),
	(53, '[模糊测试_name正确的值,price正确的值,address正确的值]添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name正确的值,price正确的值,address正确的值\', \'price\': 100, \'address\': \'北京\'}', '[\'"code":1\']', '0:00:00', '{"code":1,"msg":"success"}', 1, 43),
	(54, '[模糊测试_name值不传,price值不传,address正确的值]添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name值不传,price值不传,address正确的值\', \'price\': \'\', \'address\': \'北京\'}', '[\'"code":1\']', '0:00:00', '{"code":1,"msg":"success"}', 1, 43),
	(55, '[模糊测试_name超长的值,price超长的值,address正确的值]添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'’@#$%^&*()13131546489749411654132120.321131032132120#@$%^&*发发顺丰131315464897494116541321201313154648974941165413212013131546489749411654132120dfa13131546489749411654‘132120 第三方13131546489749411654132120安抚ds 13131546489749411654132120‘\', \'info\': \'name超长的值,price超长的值,address正确的值\', \'price\': \'’@#$%^&*()13131546489749411654132120.321131032132120#@$%^&*发发顺丰131315464897494116541321201313154648974941165413212013131546489749411654132120dfa13131546489749411654‘132120 第三方13131546489749411654132120安抚ds 13131546489749411654132120‘\', \'address\': \'北京\'}', '[\'"code":1\']', '0:00:00', '{"code":1,"msg":"success"}', 1, 43),
	(56, '[模糊测试_namekey直接删除,pricekey直接删除,address正确的值]添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'namekey直接删除,pricekey直接删除,address正确的值\', \'price\': \'\', \'address\': \'北京\'}', '[\'"code":1\']', '0:00:00', '{"code":1,"msg":"success"}', 1, 43),
	(57, '[模糊测试_namekey直接删除,price超长的值,address值不传]添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'namekey直接删除,price超长的值,address值不传\', \'price\': \'’@#$%^&*()13131546489749411654132120.321131032132120#@$%^&*发发顺丰131315464897494116541321201313154648974941165413212013131546489749411654132120dfa13131546489749411654‘132120 第三方13131546489749411654132120安抚ds 13131546489749411654132120‘\', \'address\': \'\'}', '[\'"code":1\']', '0:00:00', '{"code":1,"msg":"success"}', 1, 43),
	(58, '[模糊测试_name超长的值,price值不传,address值不传]添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'’@#$%^&*()13131546489749411654132120.321131032132120#@$%^&*发发顺丰131315464897494116541321201313154648974941165413212013131546489749411654132120dfa13131546489749411654‘132120 第三方13131546489749411654132120安抚ds 13131546489749411654132120‘\', \'info\': \'name超长的值,price值不传,address值不传\', \'price\': \'\', \'address\': \'\'}', '[\'"code":1\']', '0:00:00', '{"code":1,"msg":"success"}', 1, 43),
	(59, '[模糊测试_name值不传,price正确的值,address值不传]添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name值不传,price正确的值,address值不传\', \'price\': 100, \'address\': \'\'}', '[\'"code":1\']', '0:00:00', '{"code":1,"msg":"success"}', 1, 43),
	(60, '[模糊测试_name正确的值,pricekey直接删除,address值不传]添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name正确的值,pricekey直接删除,address值不传\', \'price\': \'\', \'address\': \'\'}', '[\'"code":1\']', '0:00:00', '{"code":1,"msg":"success"}', 1, 43),
	(61, '[模糊测试_name正确的值,price超长的值,address超长的值]添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name正确的值,price超长的值,address超长的值\', \'price\': \'’@#$%^&*()13131546489749411654132120.321131032132120#@$%^&*发发顺丰131315464897494116541321201313154648974941165413212013131546489749411654132120dfa13131546489749411654‘132120 第三方13131546489749411654132120安抚ds 13131546489749411654132120‘\', \'address\': \'’@#$%^&*()13131546489749411654132120.321131032132120#@$%^&*发发顺丰131315464897494116541321201313154648974941165413212013131546489749411654132120dfa13131546489749411654‘132120 第三方13131546489749411654132120安抚ds 13131546489749411654132120‘\'}', '[\'"code":1\']', '0:00:00', '{"code":1,"msg":"success"}', 1, 43),
	(62, '[模糊测试_name值不传,pricekey直接删除,address超长的值]添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name值不传,pricekey直接删除,address超长的值\', \'price\': \'\', \'address\': \'’@#$%^&*()13131546489749411654132120.321131032132120#@$%^&*发发顺丰131315464897494116541321201313154648974941165413212013131546489749411654132120dfa13131546489749411654‘132120 第三方13131546489749411654132120安抚ds 13131546489749411654132120‘\'}', '[\'"code":1\']', '0:00:00', '{"code":1,"msg":"success"}', 1, 43),
	(63, '[模糊测试_name超长的值,price正确的值,address超长的值]添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'’@#$%^&*()13131546489749411654132120.321131032132120#@$%^&*发发顺丰131315464897494116541321201313154648974941165413212013131546489749411654132120dfa13131546489749411654‘132120 第三方13131546489749411654132120安抚ds 13131546489749411654132120‘\', \'info\': \'name超长的值,price正确的值,address超长的值\', \'price\': 100, \'address\': \'’@#$%^&*()13131546489749411654132120.321131032132120#@$%^&*发发顺丰131315464897494116541321201313154648974941165413212013131546489749411654132120dfa13131546489749411654‘132120 第三方13131546489749411654132120安抚ds 13131546489749411654132120‘\'}', '[\'"code":1\']', '0:00:00', '{"code":1,"msg":"success"}', 1, 43),
	(64, '[模糊测试_namekey直接删除,price值不传,address超长的值]添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'namekey直接删除,price值不传,address超长的值\', \'price\': \'\', \'address\': \'’@#$%^&*()13131546489749411654132120.321131032132120#@$%^&*发发顺丰131315464897494116541321201313154648974941165413212013131546489749411654132120dfa13131546489749411654‘132120 第三方13131546489749411654132120安抚ds 13131546489749411654132120‘\'}', '[\'"code":1\']', '0:00:00', '{"code":1,"msg":"success"}', 1, 43),
	(65, '[模糊测试_namekey直接删除,price正确的值,addresskey直接删除]添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'namekey直接删除,price正确的值,addresskey直接删除\', \'price\': 100, \'address\': \'\'}', '[\'"code":1\']', '0:00:00', '{"code":1,"msg":"success"}', 1, 43),
	(66, '[模糊测试_name超长的值,pricekey直接删除,addresskey直接删除]添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'’@#$%^&*()13131546489749411654132120.321131032132120#@$%^&*发发顺丰131315464897494116541321201313154648974941165413212013131546489749411654132120dfa13131546489749411654‘132120 第三方13131546489749411654132120安抚ds 13131546489749411654132120‘\', \'info\': \'name超长的值,pricekey直接删除,addresskey直接删除\', \'price\': \'\', \'address\': \'\'}', '[\'"code":1\']', '0:00:00', '{"code":1,"msg":"success"}', 1, 43),
	(67, '[模糊测试_name值不传,price超长的值,addresskey直接删除]添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name值不传,price超长的值,addresskey直接删除\', \'price\': \'’@#$%^&*()13131546489749411654132120.321131032132120#@$%^&*发发顺丰131315464897494116541321201313154648974941165413212013131546489749411654132120dfa13131546489749411654‘132120 第三方13131546489749411654132120安抚ds 13131546489749411654132120‘\', \'address\': \'\'}', '[\'"code":1\']', '0:00:00', '{"code":1,"msg":"success"}', 1, 43),
	(68, '[模糊测试_name正确的值,price值不传,addresskey直接删除]添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name正确的值,price值不传,addresskey直接删除\', \'price\': \'\', \'address\': \'\'}', '[\'"code":1\']', '0:00:00', '{"code":1,"msg":"success"}', 1, 43),
	(69, '商品列表', '127.0.0.1:8100/myapi/get_shop_list', 'http', 'get', '{}', '[\'"code":1\', \'"id":1\']', '0:00:00', '{"code":1,"msg":"success","data":[{"id":0,"name":"\\u624b\\u673a0","price":100},{"id":1,"name":"\\u624b\\u673a1","price":101},{"id":2,"name":"\\u624b\\u673a2","price":102},{"id":3,"name":"\\u624b\\u673a3","price":103},{"id":4,"name":"\\u624b\\u673a4","price":104},{"id":5,"name":"\\u624b\\u673a5","price":105},{"id":6,"name":"\\u624b\\u673a6","price":106},{"id":7,"name":"\\u624b\\u673a7","price":107},{"id":8,"name":"\\u624b\\u673a8","price":108},{"id":9,"name":"\\u624b\\u673a9","price":109}]}', 1, 44),
	(70, '商品列表', '127.0.0.1:8100/myapi/get_shop_list', 'http', 'get', '{}', '', '0:00:00', '{"code":1,"msg":"success","data":[{"id":0,"name":"\\u624b\\u673a0","price":100},{"id":1,"name":"\\u624b\\u673a1","price":101},{"id":2,"name":"\\u624b\\u673a2","price":102},{"id":3,"name":"\\u624b\\u673a3","price":103},{"id":4,"name":"\\u624b\\u673a4","price":104},{"id":5,"name":"\\u624b\\u673a5","price":105},{"id":6,"name":"\\u624b\\u673a6","price":106},{"id":7,"name":"\\u624b\\u673a7","price":107},{"id":8,"name":"\\u624b\\u673a8","price":108},{"id":9,"name":"\\u624b\\u673a9","price":109}]}', 0, 45),
	(71, '[模糊测试_name正确的值,price正确的值,address正确的值_]添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'code\': 1, \'name\': \'111\', \'info\': \'name正确的值,price正确的值,address正确的值\', \'price\': 100, \'address\': \'北京\'}', '[\'"code":1\']', '0:00:00', '{"code":1,"msg":"success"}', 1, 45),
	(72, '[模糊测试_name值不传,price值不传,address正确的值_]添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'code\': 1, \'name\': \'\', \'info\': \'name值不传,price值不传,address正确的值\', \'price\': \'\', \'address\': \'北京\'}', '[\'"code":1\']', '0:00:00', '{"code":1,"msg":"success"}', 1, 45),
	(73, '[模糊测试_name超长的值,price超长的值,address正确的值_]添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'code\': 1, \'name\': \'’@#$%^&*()13131546489749411654132120.321131032132120#@$%^&*发发顺丰131315464897494116541321201313154648974941165413212013131546489749411654132120dfa13131546489749411654‘132120 第三方13131546489749411654132120安抚ds 13131546489749411654132120‘\', \'info\': \'name超长的值,price超长的值,address正确的值\', \'price\': \'’@#$%^&*()13131546489749411654132120.321131032132120#@$%^&*发发顺丰131315464897494116541321201313154648974941165413212013131546489749411654132120dfa13131546489749411654‘132120 第三方13131546489749411654132120安抚ds 13131546489749411654132120‘\', \'address\': \'北京\'}', '[\'"code":1\']', '0:00:00', '{"code":1,"msg":"success"}', 1, 45),
	(74, '[模糊测试_namekey直接删除,pricekey直接删除,address正确的值_]添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'code\': 1, \'info\': \'namekey直接删除,pricekey直接删除,address正确的值\', \'address\': \'北京\'}', '[\'"code":1\']', '0:00:00', '{"code":1,"msg":"success"}', 1, 45),
	(75, '[模糊测试_namekey直接删除,price超长的值,address值不传_]添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'code\': 0, \'info\': \'namekey直接删除,price超长的值,address值不传\', \'price\': \'’@#$%^&*()13131546489749411654132120.321131032132120#@$%^&*发发顺丰131315464897494116541321201313154648974941165413212013131546489749411654132120dfa13131546489749411654‘132120 第三方13131546489749411654132120安抚ds 13131546489749411654132120‘\', \'address\': \'\'}', '[\'"code":1\']', '0:00:00', '{"code":1,"msg":"success"}', 1, 45),
	(76, '[模糊测试_name超长的值,price值不传,address值不传_]添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'code\': 0, \'name\': \'’@#$%^&*()13131546489749411654132120.321131032132120#@$%^&*发发顺丰131315464897494116541321201313154648974941165413212013131546489749411654132120dfa13131546489749411654‘132120 第三方13131546489749411654132120安抚ds 13131546489749411654132120‘\', \'info\': \'name超长的值,price值不传,address值不传\', \'price\': \'\', \'address\': \'\'}', '[\'"code":1\']', '0:00:00', '{"code":1,"msg":"success"}', 1, 45),
	(77, '[模糊测试_name值不传,price正确的值,address值不传_]添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'code\': 0, \'name\': \'\', \'info\': \'name值不传,price正确的值,address值不传\', \'price\': 100, \'address\': \'\'}', '[\'"code":1\']', '0:00:00', '{"code":1,"msg":"success"}', 1, 45),
	(78, '[模糊测试_name正确的值,pricekey直接删除,address值不传_]添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'code\': 0, \'name\': \'111\', \'info\': \'name正确的值,pricekey直接删除,address值不传\', \'address\': \'\'}', '[\'"code":1\']', '0:00:00', '{"code":1,"msg":"success"}', 1, 45),
	(79, '[模糊测试_name正确的值,price超长的值,address超长的值_]添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'code\': -2, \'name\': \'111\', \'info\': \'name正确的值,price超长的值,address超长的值\', \'price\': \'’@#$%^&*()13131546489749411654132120.321131032132120#@$%^&*发发顺丰131315464897494116541321201313154648974941165413212013131546489749411654132120dfa13131546489749411654‘132120 第三方13131546489749411654132120安抚ds 13131546489749411654132120‘\', \'address\': \'’@#$%^&*()13131546489749411654132120.321131032132120#@$%^&*发发顺丰131315464897494116541321201313154648974941165413212013131546489749411654132120dfa13131546489749411654‘132120 第三方13131546489749411654132120安抚ds 13131546489749411654132120‘\'}', '[\'"code":1\']', '0:00:00', '{"code":1,"msg":"success"}', 1, 45),
	(80, '[模糊测试_name值不传,pricekey直接删除,address超长的值_]添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'code\': -2, \'name\': \'\', \'info\': \'name值不传,pricekey直接删除,address超长的值\', \'address\': \'’@#$%^&*()13131546489749411654132120.321131032132120#@$%^&*发发顺丰131315464897494116541321201313154648974941165413212013131546489749411654132120dfa13131546489749411654‘132120 第三方13131546489749411654132120安抚ds 13131546489749411654132120‘\'}', '[\'"code":1\']', '0:00:00', '{"code":1,"msg":"success"}', 1, 45),
	(81, '[模糊测试_name超长的值,price正确的值,address超长的值_]添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'code\': -2, \'name\': \'’@#$%^&*()13131546489749411654132120.321131032132120#@$%^&*发发顺丰131315464897494116541321201313154648974941165413212013131546489749411654132120dfa13131546489749411654‘132120 第三方13131546489749411654132120安抚ds 13131546489749411654132120‘\', \'info\': \'name超长的值,price正确的值,address超长的值\', \'price\': 100, \'address\': \'’@#$%^&*()13131546489749411654132120.321131032132120#@$%^&*发发顺丰131315464897494116541321201313154648974941165413212013131546489749411654132120dfa13131546489749411654‘132120 第三方13131546489749411654132120安抚ds 13131546489749411654132120‘\'}', '[\'"code":1\']', '0:00:00', '{"code":1,"msg":"success"}', 1, 45),
	(82, '[模糊测试_namekey直接删除,price值不传,address超长的值_]添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'code\': -2, \'info\': \'namekey直接删除,price值不传,address超长的值\', \'price\': \'\', \'address\': \'’@#$%^&*()13131546489749411654132120.321131032132120#@$%^&*发发顺丰131315464897494116541321201313154648974941165413212013131546489749411654132120dfa13131546489749411654‘132120 第三方13131546489749411654132120安抚ds 13131546489749411654132120‘\'}', '[\'"code":1\']', '0:00:00', '{"code":1,"msg":"success"}', 1, 45),
	(83, '[模糊测试_namekey直接删除,price正确的值,addresskey直接删除_]添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'code\': -1, \'info\': \'namekey直接删除,price正确的值,addresskey直接删除\', \'price\': 100}', '[\'"code":1\']', '0:00:00', '{"code":1,"msg":"success"}', 1, 45),
	(84, '[模糊测试_name超长的值,pricekey直接删除,addresskey直接删除_]添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'code\': -1, \'name\': \'’@#$%^&*()13131546489749411654132120.321131032132120#@$%^&*发发顺丰131315464897494116541321201313154648974941165413212013131546489749411654132120dfa13131546489749411654‘132120 第三方13131546489749411654132120安抚ds 13131546489749411654132120‘\', \'info\': \'name超长的值,pricekey直接删除,addresskey直接删除\'}', '[\'"code":1\']', '0:00:00', '{"code":1,"msg":"success"}', 1, 45),
	(85, '[模糊测试_name值不传,price超长的值,addresskey直接删除_]添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'code\': -1, \'name\': \'\', \'info\': \'name值不传,price超长的值,addresskey直接删除\', \'price\': \'’@#$%^&*()13131546489749411654132120.321131032132120#@$%^&*发发顺丰131315464897494116541321201313154648974941165413212013131546489749411654132120dfa13131546489749411654‘132120 第三方13131546489749411654132120安抚ds 13131546489749411654132120‘\'}', '[\'"code":1\']', '0:00:00', '{"code":1,"msg":"success"}', 1, 45),
	(86, '[模糊测试_name正确的值,price值不传,addresskey直接删除_]添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'code\': -1, \'name\': \'111\', \'info\': \'name正确的值,price值不传,addresskey直接删除\', \'price\': \'\'}', '[\'"code":1\']', '0:00:00', '{"code":1,"msg":"success"}', 1, 45),
	(87, '商品列表', '127.0.0.1:8100/myapi/get_shop_list', 'http', 'get', '{}', '', '0:00:00', '{"code":1,"msg":"success","data":[{"id":0,"name":"\\u624b\\u673a0","price":100},{"id":1,"name":"\\u624b\\u673a1","price":101},{"id":2,"name":"\\u624b\\u673a2","price":102},{"id":3,"name":"\\u624b\\u673a3","price":103},{"id":4,"name":"\\u624b\\u673a4","price":104},{"id":5,"name":"\\u624b\\u673a5","price":105},{"id":6,"name":"\\u624b\\u673a6","price":106},{"id":7,"name":"\\u624b\\u673a7","price":107},{"id":8,"name":"\\u624b\\u673a8","price":108},{"id":9,"name":"\\u624b\\u673a9","price":109}]}', 0, 46),
	(88, '[模糊测试_name正确的值,price正确的值,address正确的值_]添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'code\': 1, \'info\': \'name正确的值,price正确的值,address正确的值\', \'price\': 100, \'address\': \'北京\'}', '[\'"code":1\']', '0:00:00', '{"code":1,"msg":"success"}', 1, 46),
	(89, '[模糊测试_name值不传,price值不传,address正确的值_]添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'code\': 1, \'info\': \'name值不传,price值不传,address正确的值\', \'price\': \'\', \'address\': \'北京\'}', '[\'"code":1\']', '0:00:00', '{"code":1,"msg":"success"}', 1, 46),
	(90, '[模糊测试_name超长的值,price超长的值,address正确的值_]添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'’@#$%^&*()13131546489749411654132120.321131032132120#@$%^&*发发顺丰131315464897494116541321201313154648974941165413212013131546489749411654132120dfa13131546489749411654‘132120 第三方13131546489749411654132120安抚ds 13131546489749411654132120‘\', \'code\': 1, \'info\': \'name超长的值,price超长的值,address正确的值\', \'price\': \'’@#$%^&*()13131546489749411654132120.321131032132120#@$%^&*发发顺丰131315464897494116541321201313154648974941165413212013131546489749411654132120dfa13131546489749411654‘132120 第三方13131546489749411654132120安抚ds 13131546489749411654132120‘\', \'address\': \'北京\'}', '[\'"code":1\']', '0:00:00', '{"code":1,"msg":"success"}', 1, 46),
	(91, '[模糊测试_namekey直接删除,pricekey直接删除,address正确的值_]添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'code\': 1, \'info\': \'namekey直接删除,pricekey直接删除,address正确的值\', \'address\': \'北京\'}', '[\'"code":1\']', '0:00:00', '{"code":1,"msg":"success"}', 1, 46),
	(92, '[模糊测试_namekey直接删除,price超长的值,address值不传_]添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'code\': 0, \'info\': \'namekey直接删除,price超长的值,address值不传\', \'price\': \'’@#$%^&*()13131546489749411654132120.321131032132120#@$%^&*发发顺丰131315464897494116541321201313154648974941165413212013131546489749411654132120dfa13131546489749411654‘132120 第三方13131546489749411654132120安抚ds 13131546489749411654132120‘\', \'address\': \'\'}', '[\'"code":1\']', '0:00:00', '{"code":1,"msg":"success"}', 1, 46),
	(93, '[模糊测试_name超长的值,price值不传,address值不传_]添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'’@#$%^&*()13131546489749411654132120.321131032132120#@$%^&*发发顺丰131315464897494116541321201313154648974941165413212013131546489749411654132120dfa13131546489749411654‘132120 第三方13131546489749411654132120安抚ds 13131546489749411654132120‘\', \'code\': 0, \'info\': \'name超长的值,price值不传,address值不传\', \'price\': \'\', \'address\': \'\'}', '[\'"code":1\']', '0:00:01', '{"code":1,"msg":"success"}', 1, 46),
	(94, '[模糊测试_name值不传,price正确的值,address值不传_]添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'code\': 0, \'info\': \'name值不传,price正确的值,address值不传\', \'price\': 100, \'address\': \'\'}', '[\'"code":1\']', '0:00:01', '{"code":1,"msg":"success"}', 1, 46),
	(95, '[模糊测试_name正确的值,pricekey直接删除,address值不传_]添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'code\': 0, \'info\': \'name正确的值,pricekey直接删除,address值不传\', \'address\': \'\'}', '[\'"code":1\']', '0:00:01', '{"code":1,"msg":"success"}', 1, 46),
	(96, '[模糊测试_name正确的值,price超长的值,address超长的值_]添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'code\': -2, \'info\': \'name正确的值,price超长的值,address超长的值\', \'price\': \'’@#$%^&*()13131546489749411654132120.321131032132120#@$%^&*发发顺丰131315464897494116541321201313154648974941165413212013131546489749411654132120dfa13131546489749411654‘132120 第三方13131546489749411654132120安抚ds 13131546489749411654132120‘\', \'address\': \'’@#$%^&*()13131546489749411654132120.321131032132120#@$%^&*发发顺丰131315464897494116541321201313154648974941165413212013131546489749411654132120dfa13131546489749411654‘132120 第三方13131546489749411654132120安抚ds 13131546489749411654132120‘\'}', '[\'"code":1\']', '0:00:01', '{"code":1,"msg":"success"}', 1, 46),
	(97, '[模糊测试_name值不传,pricekey直接删除,address超长的值_]添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'code\': -2, \'info\': \'name值不传,pricekey直接删除,address超长的值\', \'address\': \'’@#$%^&*()13131546489749411654132120.321131032132120#@$%^&*发发顺丰131315464897494116541321201313154648974941165413212013131546489749411654132120dfa13131546489749411654‘132120 第三方13131546489749411654132120安抚ds 13131546489749411654132120‘\'}', '[\'"code":1\']', '0:00:01', '{"code":1,"msg":"success"}', 1, 46),
	(98, '[模糊测试_name超长的值,price正确的值,address超长的值_]添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'’@#$%^&*()13131546489749411654132120.321131032132120#@$%^&*发发顺丰131315464897494116541321201313154648974941165413212013131546489749411654132120dfa13131546489749411654‘132120 第三方13131546489749411654132120安抚ds 13131546489749411654132120‘\', \'code\': -2, \'info\': \'name超长的值,price正确的值,address超长的值\', \'price\': 100, \'address\': \'’@#$%^&*()13131546489749411654132120.321131032132120#@$%^&*发发顺丰131315464897494116541321201313154648974941165413212013131546489749411654132120dfa13131546489749411654‘132120 第三方13131546489749411654132120安抚ds 13131546489749411654132120‘\'}', '[\'"code":1\']', '0:00:01', '{"code":1,"msg":"success"}', 1, 46),
	(99, '[模糊测试_namekey直接删除,price值不传,address超长的值_]添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'code\': -2, \'info\': \'namekey直接删除,price值不传,address超长的值\', \'price\': \'\', \'address\': \'’@#$%^&*()13131546489749411654132120.321131032132120#@$%^&*发发顺丰131315464897494116541321201313154648974941165413212013131546489749411654132120dfa13131546489749411654‘132120 第三方13131546489749411654132120安抚ds 13131546489749411654132120‘\'}', '[\'"code":1\']', '0:00:01', '{"code":1,"msg":"success"}', 1, 46),
	(100, '[模糊测试_namekey直接删除,price正确的值,addresskey直接删除_]添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'code\': -1, \'info\': \'namekey直接删除,price正确的值,addresskey直接删除\', \'price\': 100}', '[\'"code":1\']', '0:00:01', '{"code":1,"msg":"success"}', 1, 46),
	(101, '[模糊测试_name超长的值,pricekey直接删除,addresskey直接删除_]添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'’@#$%^&*()13131546489749411654132120.321131032132120#@$%^&*发发顺丰131315464897494116541321201313154648974941165413212013131546489749411654132120dfa13131546489749411654‘132120 第三方13131546489749411654132120安抚ds 13131546489749411654132120‘\', \'code\': -1, \'info\': \'name超长的值,pricekey直接删除,addresskey直接删除\'}', '[\'"code":1\']', '0:00:01', '{"code":1,"msg":"success"}', 1, 46),
	(102, '[模糊测试_name值不传,price超长的值,addresskey直接删除_]添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'code\': -1, \'info\': \'name值不传,price超长的值,addresskey直接删除\', \'price\': \'’@#$%^&*()13131546489749411654132120.321131032132120#@$%^&*发发顺丰131315464897494116541321201313154648974941165413212013131546489749411654132120dfa13131546489749411654‘132120 第三方13131546489749411654132120安抚ds 13131546489749411654132120‘\'}', '[\'"code":1\']', '0:00:01', '{"code":1,"msg":"success"}', 1, 46),
	(103, '[模糊测试_name正确的值,price值不传,addresskey直接删除_]添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'code\': -1, \'info\': \'name正确的值,price值不传,addresskey直接删除\', \'price\': \'\'}', '[\'"code":1\']', '0:00:01', '{"code":1,"msg":"success"}', 1, 46),
	(104, '商品列表', '127.0.0.1:8100/myapi/get_shop_list', 'http', 'get', '{}', '', '0:00:00', '{"code":1,"msg":"success","data":[{"id":0,"name":"\\u624b\\u673a0","price":100},{"id":1,"name":"\\u624b\\u673a1","price":101},{"id":2,"name":"\\u624b\\u673a2","price":102},{"id":3,"name":"\\u624b\\u673a3","price":103},{"id":4,"name":"\\u624b\\u673a4","price":104},{"id":5,"name":"\\u624b\\u673a5","price":105},{"id":6,"name":"\\u624b\\u673a6","price":106},{"id":7,"name":"\\u624b\\u673a7","price":107},{"id":8,"name":"\\u624b\\u673a8","price":108},{"id":9,"name":"\\u624b\\u673a9","price":109}]}', 0, 47),
	(105, '[模糊测试_name正确的值,price正确的值,address正确的值_]添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'code\': 1, \'info\': \'name正确的值,price正确的值,address正确的值\', \'price\': 100, \'address\': \'北京\'}', '[\'"code":1\']', '0:00:00', '{"code":1,"msg":"success"}', 1, 47),
	(106, '[模糊测试_name值不传,price值不传,address正确的值_]添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'code\': 1, \'info\': \'name值不传,price值不传,address正确的值\', \'price\': \'\', \'address\': \'北京\'}', '[\'"code":1\']', '0:00:00', '{"code":1,"msg":"success"}', 1, 47),
	(107, '[模糊测试_name超长的值,price超长的值,address正确的值_]添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'’@#$%^&*()13131546489749411654132120.321131032132120#@$%^&*发发顺丰131315464897494116541321201313154648974941165413212013131546489749411654132120dfa13131546489749411654‘132120 第三方13131546489749411654132120安抚ds 13131546489749411654132120‘\', \'code\': 1, \'info\': \'name超长的值,price超长的值,address正确的值\', \'price\': \'’@#$%^&*()13131546489749411654132120.321131032132120#@$%^&*发发顺丰131315464897494116541321201313154648974941165413212013131546489749411654132120dfa13131546489749411654‘132120 第三方13131546489749411654132120安抚ds 13131546489749411654132120‘\', \'address\': \'北京\'}', '[\'"code":1\']', '0:00:00', '{"code":1,"msg":"success"}', 1, 47),
	(108, '[模糊测试_namekey直接删除,pricekey直接删除,address正确的值_]添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'code\': 1, \'info\': \'namekey直接删除,pricekey直接删除,address正确的值\', \'address\': \'北京\'}', '[\'"code":1\']', '0:00:00', '{"code":1,"msg":"success"}', 1, 47),
	(109, '[模糊测试_namekey直接删除,price超长的值,address值不传_]添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'code\': 0, \'info\': \'namekey直接删除,price超长的值,address值不传\', \'price\': \'’@#$%^&*()13131546489749411654132120.321131032132120#@$%^&*发发顺丰131315464897494116541321201313154648974941165413212013131546489749411654132120dfa13131546489749411654‘132120 第三方13131546489749411654132120安抚ds 13131546489749411654132120‘\', \'address\': \'\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 47),
	(110, '[模糊测试_name超长的值,price值不传,address值不传_]添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'’@#$%^&*()13131546489749411654132120.321131032132120#@$%^&*发发顺丰131315464897494116541321201313154648974941165413212013131546489749411654132120dfa13131546489749411654‘132120 第三方13131546489749411654132120安抚ds 13131546489749411654132120‘\', \'code\': 0, \'info\': \'name超长的值,price值不传,address值不传\', \'price\': \'\', \'address\': \'\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 47),
	(111, '[模糊测试_name值不传,price正确的值,address值不传_]添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'code\': 0, \'info\': \'name值不传,price正确的值,address值不传\', \'price\': 100, \'address\': \'\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 47),
	(112, '[模糊测试_name正确的值,pricekey直接删除,address值不传_]添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'code\': 0, \'info\': \'name正确的值,pricekey直接删除,address值不传\', \'address\': \'\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 47),
	(113, '[模糊测试_name正确的值,price超长的值,address超长的值_]添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'code\': -2, \'info\': \'name正确的值,price超长的值,address超长的值\', \'price\': \'’@#$%^&*()13131546489749411654132120.321131032132120#@$%^&*发发顺丰131315464897494116541321201313154648974941165413212013131546489749411654132120dfa13131546489749411654‘132120 第三方13131546489749411654132120安抚ds 13131546489749411654132120‘\', \'address\': \'’@#$%^&*()13131546489749411654132120.321131032132120#@$%^&*发发顺丰131315464897494116541321201313154648974941165413212013131546489749411654132120dfa13131546489749411654‘132120 第三方13131546489749411654132120安抚ds 13131546489749411654132120‘\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 47),
	(114, '[模糊测试_name值不传,pricekey直接删除,address超长的值_]添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'code\': -2, \'info\': \'name值不传,pricekey直接删除,address超长的值\', \'address\': \'’@#$%^&*()13131546489749411654132120.321131032132120#@$%^&*发发顺丰131315464897494116541321201313154648974941165413212013131546489749411654132120dfa13131546489749411654‘132120 第三方13131546489749411654132120安抚ds 13131546489749411654132120‘\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 47),
	(115, '[模糊测试_name超长的值,price正确的值,address超长的值_]添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'’@#$%^&*()13131546489749411654132120.321131032132120#@$%^&*发发顺丰131315464897494116541321201313154648974941165413212013131546489749411654132120dfa13131546489749411654‘132120 第三方13131546489749411654132120安抚ds 13131546489749411654132120‘\', \'code\': -2, \'info\': \'name超长的值,price正确的值,address超长的值\', \'price\': 100, \'address\': \'’@#$%^&*()13131546489749411654132120.321131032132120#@$%^&*发发顺丰131315464897494116541321201313154648974941165413212013131546489749411654132120dfa13131546489749411654‘132120 第三方13131546489749411654132120安抚ds 13131546489749411654132120‘\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 47),
	(116, '[模糊测试_namekey直接删除,price值不传,address超长的值_]添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'code\': -2, \'info\': \'namekey直接删除,price值不传,address超长的值\', \'price\': \'\', \'address\': \'’@#$%^&*()13131546489749411654132120.321131032132120#@$%^&*发发顺丰131315464897494116541321201313154648974941165413212013131546489749411654132120dfa13131546489749411654‘132120 第三方13131546489749411654132120安抚ds 13131546489749411654132120‘\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 47),
	(117, '[模糊测试_namekey直接删除,price正确的值,addresskey直接删除_]添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'code\': -1, \'info\': \'namekey直接删除,price正确的值,addresskey直接删除\', \'price\': 100}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 47),
	(118, '[模糊测试_name超长的值,pricekey直接删除,addresskey直接删除_]添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'’@#$%^&*()13131546489749411654132120.321131032132120#@$%^&*发发顺丰131315464897494116541321201313154648974941165413212013131546489749411654132120dfa13131546489749411654‘132120 第三方13131546489749411654132120安抚ds 13131546489749411654132120‘\', \'code\': -1, \'info\': \'name超长的值,pricekey直接删除,addresskey直接删除\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 47),
	(119, '[模糊测试_name值不传,price超长的值,addresskey直接删除_]添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'code\': -1, \'info\': \'name值不传,price超长的值,addresskey直接删除\', \'price\': \'’@#$%^&*()13131546489749411654132120.321131032132120#@$%^&*发发顺丰131315464897494116541321201313154648974941165413212013131546489749411654132120dfa13131546489749411654‘132120 第三方13131546489749411654132120安抚ds 13131546489749411654132120‘\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 47),
	(120, '[模糊测试_name正确的值,price值不传,addresskey直接删除_]添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'code\': -1, \'info\': \'name正确的值,price值不传,addresskey直接删除\', \'price\': \'\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 47),
	(121, '商品列表', '127.0.0.1:8100/myapi/get_shop_list', 'http', 'get', '{}', '', '0:00:00', '{"code":1,"msg":"success","data":[{"id":0,"name":"\\u624b\\u673a0","price":100},{"id":1,"name":"\\u624b\\u673a1","price":101},{"id":2,"name":"\\u624b\\u673a2","price":102},{"id":3,"name":"\\u624b\\u673a3","price":103},{"id":4,"name":"\\u624b\\u673a4","price":104},{"id":5,"name":"\\u624b\\u673a5","price":105},{"id":6,"name":"\\u624b\\u673a6","price":106},{"id":7,"name":"\\u624b\\u673a7","price":107},{"id":8,"name":"\\u624b\\u673a8","price":108},{"id":9,"name":"\\u624b\\u673a9","price":109}]}', 0, 48),
	(122, '[模糊测试_name正确的值,price正确的值,address正确的值_]添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name正确的值,price正确的值,address正确的值\', \'price\': 100, \'address\': \'北京\'}', '[\'"code":1\']', '0:00:00', '{"code":1,"msg":"success"}', 1, 48),
	(123, '[模糊测试_name值不传,price值不传,address正确的值_]添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name值不传,price值不传,address正确的值\', \'price\': \'\', \'address\': \'北京\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 48),
	(124, '[模糊测试_name超长的值,price超长的值,address正确的值_]添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'’@#$%^&*()13131546489749411654132120.321131032132120#@$%^&*发发顺丰131315464897494116541321201313154648974941165413212013131546489749411654132120dfa13131546489749411654‘132120 第三方13131546489749411654132120安抚ds 13131546489749411654132120‘\', \'info\': \'name超长的值,price超长的值,address正确的值\', \'price\': \'’@#$%^&*()13131546489749411654132120.321131032132120#@$%^&*发发顺丰131315464897494116541321201313154648974941165413212013131546489749411654132120dfa13131546489749411654‘132120 第三方13131546489749411654132120安抚ds 13131546489749411654132120‘\', \'address\': \'北京\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 48),
	(125, '[模糊测试_namekey直接删除,pricekey直接删除,address正确的值_]添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'info\': \'namekey直接删除,pricekey直接删除,address正确的值\', \'address\': \'北京\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 48),
	(126, '[模糊测试_namekey直接删除,price超长的值,address值不传_]添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'info\': \'namekey直接删除,price超长的值,address值不传\', \'price\': \'’@#$%^&*()13131546489749411654132120.321131032132120#@$%^&*发发顺丰131315464897494116541321201313154648974941165413212013131546489749411654132120dfa13131546489749411654‘132120 第三方13131546489749411654132120安抚ds 13131546489749411654132120‘\', \'address\': \'\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 48),
	(127, '[模糊测试_name超长的值,price值不传,address值不传_]添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'’@#$%^&*()13131546489749411654132120.321131032132120#@$%^&*发发顺丰131315464897494116541321201313154648974941165413212013131546489749411654132120dfa13131546489749411654‘132120 第三方13131546489749411654132120安抚ds 13131546489749411654132120‘\', \'info\': \'name超长的值,price值不传,address值不传\', \'price\': \'\', \'address\': \'\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 48),
	(128, '[模糊测试_name值不传,price正确的值,address值不传_]添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name值不传,price正确的值,address值不传\', \'price\': 100, \'address\': \'\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 48),
	(129, '[模糊测试_name正确的值,pricekey直接删除,address值不传_]添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name正确的值,pricekey直接删除,address值不传\', \'address\': \'\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 48),
	(130, '[模糊测试_name正确的值,price超长的值,address超长的值_]添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name正确的值,price超长的值,address超长的值\', \'price\': \'’@#$%^&*()13131546489749411654132120.321131032132120#@$%^&*发发顺丰131315464897494116541321201313154648974941165413212013131546489749411654132120dfa13131546489749411654‘132120 第三方13131546489749411654132120安抚ds 13131546489749411654132120‘\', \'address\': \'’@#$%^&*()13131546489749411654132120.321131032132120#@$%^&*发发顺丰131315464897494116541321201313154648974941165413212013131546489749411654132120dfa13131546489749411654‘132120 第三方13131546489749411654132120安抚ds 13131546489749411654132120‘\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 48),
	(131, '[模糊测试_name值不传,pricekey直接删除,address超长的值_]添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name值不传,pricekey直接删除,address超长的值\', \'address\': \'’@#$%^&*()13131546489749411654132120.321131032132120#@$%^&*发发顺丰131315464897494116541321201313154648974941165413212013131546489749411654132120dfa13131546489749411654‘132120 第三方13131546489749411654132120安抚ds 13131546489749411654132120‘\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 48),
	(132, '[模糊测试_name超长的值,price正确的值,address超长的值_]添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'’@#$%^&*()13131546489749411654132120.321131032132120#@$%^&*发发顺丰131315464897494116541321201313154648974941165413212013131546489749411654132120dfa13131546489749411654‘132120 第三方13131546489749411654132120安抚ds 13131546489749411654132120‘\', \'info\': \'name超长的值,price正确的值,address超长的值\', \'price\': 100, \'address\': \'’@#$%^&*()13131546489749411654132120.321131032132120#@$%^&*发发顺丰131315464897494116541321201313154648974941165413212013131546489749411654132120dfa13131546489749411654‘132120 第三方13131546489749411654132120安抚ds 13131546489749411654132120‘\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 48),
	(133, '[模糊测试_namekey直接删除,price值不传,address超长的值_]添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'info\': \'namekey直接删除,price值不传,address超长的值\', \'price\': \'\', \'address\': \'’@#$%^&*()13131546489749411654132120.321131032132120#@$%^&*发发顺丰131315464897494116541321201313154648974941165413212013131546489749411654132120dfa13131546489749411654‘132120 第三方13131546489749411654132120安抚ds 13131546489749411654132120‘\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 48),
	(134, '[模糊测试_namekey直接删除,price正确的值,addresskey直接删除_]添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'info\': \'namekey直接删除,price正确的值,addresskey直接删除\', \'price\': 100}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 48),
	(135, '[模糊测试_name超长的值,pricekey直接删除,addresskey直接删除_]添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'’@#$%^&*()13131546489749411654132120.321131032132120#@$%^&*发发顺丰131315464897494116541321201313154648974941165413212013131546489749411654132120dfa13131546489749411654‘132120 第三方13131546489749411654132120安抚ds 13131546489749411654132120‘\', \'info\': \'name超长的值,pricekey直接删除,addresskey直接删除\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 48),
	(136, '[模糊测试_name值不传,price超长的值,addresskey直接删除_]添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name值不传,price超长的值,addresskey直接删除\', \'price\': \'’@#$%^&*()13131546489749411654132120.321131032132120#@$%^&*发发顺丰131315464897494116541321201313154648974941165413212013131546489749411654132120dfa13131546489749411654‘132120 第三方13131546489749411654132120安抚ds 13131546489749411654132120‘\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 48),
	(137, '[模糊测试_name正确的值,price值不传,addresskey直接删除_]添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name正确的值,price值不传,addresskey直接删除\', \'price\': \'\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 48),
	(138, '商品列表', '127.0.0.1:8100/myapi/get_shop_list', 'http', 'get', '{}', '[\'"code":1\', \'"id":1\']', '0:00:00', '{"code":1,"msg":"success","data":[{"id":0,"name":"\\u624b\\u673a0","price":100},{"id":1,"name":"\\u624b\\u673a1","price":101},{"id":2,"name":"\\u624b\\u673a2","price":102},{"id":3,"name":"\\u624b\\u673a3","price":103},{"id":4,"name":"\\u624b\\u673a4","price":104},{"id":5,"name":"\\u624b\\u673a5","price":105},{"id":6,"name":"\\u624b\\u673a6","price":106},{"id":7,"name":"\\u624b\\u673a7","price":107},{"id":8,"name":"\\u624b\\u673a8","price":108},{"id":9,"name":"\\u624b\\u673a9","price":109}]}', 1, 49),
	(139, '[模糊测试_name正确的值,price正确的值,address正确的值]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name正确的值,price正确的值,address正确的值\', \'price\': 100, \'address\': \'北京\'}', '[\'"code":1\']', '0:00:00', '{"code":1,"msg":"success"}', 0, 49),
	(140, '[模糊测试_name值不传,price值不传,address正确的值]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name值不传,price值不传,address正确的值\', \'price\': \'\', \'address\': \'北京\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 49),
	(141, '[模糊测试_name超长的值,price超长的值,address正确的值]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'’@#$%^&*()13131546489749411654132120.321131032132120#@$%^&*发发顺丰131315464897494116541321201313154648974941165413212013131546489749411654132120dfa13131546489749411654‘132120 第三方13131546489749411654132120安抚ds 13131546489749411654132120‘\', \'info\': \'name超长的值,price超长的值,address正确的值\', \'price\': \'’@#$%^&*()13131546489749411654132120.321131032132120#@$%^&*发发顺丰131315464897494116541321201313154648974941165413212013131546489749411654132120dfa13131546489749411654‘132120 第三方13131546489749411654132120安抚ds 13131546489749411654132120‘\', \'address\': \'北京\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 49),
	(142, '[模糊测试_namekey直接删除,pricekey直接删除,address正确的值]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'info\': \'namekey直接删除,pricekey直接删除,address正确的值\', \'address\': \'北京\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 49),
	(143, '[模糊测试_namekey直接删除,price超长的值,address值不传]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'info\': \'namekey直接删除,price超长的值,address值不传\', \'price\': \'’@#$%^&*()13131546489749411654132120.321131032132120#@$%^&*发发顺丰131315464897494116541321201313154648974941165413212013131546489749411654132120dfa13131546489749411654‘132120 第三方13131546489749411654132120安抚ds 13131546489749411654132120‘\', \'address\': \'\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 49),
	(144, '[模糊测试_name超长的值,price值不传,address值不传]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'’@#$%^&*()13131546489749411654132120.321131032132120#@$%^&*发发顺丰131315464897494116541321201313154648974941165413212013131546489749411654132120dfa13131546489749411654‘132120 第三方13131546489749411654132120安抚ds 13131546489749411654132120‘\', \'info\': \'name超长的值,price值不传,address值不传\', \'price\': \'\', \'address\': \'\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 49),
	(145, '[模糊测试_name值不传,price正确的值,address值不传]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name值不传,price正确的值,address值不传\', \'price\': 100, \'address\': \'\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 49),
	(146, '[模糊测试_name正确的值,pricekey直接删除,address值不传]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name正确的值,pricekey直接删除,address值不传\', \'address\': \'\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 49),
	(147, '[模糊测试_name正确的值,price超长的值,address超长的值]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name正确的值,price超长的值,address超长的值\', \'price\': \'’@#$%^&*()13131546489749411654132120.321131032132120#@$%^&*发发顺丰131315464897494116541321201313154648974941165413212013131546489749411654132120dfa13131546489749411654‘132120 第三方13131546489749411654132120安抚ds 13131546489749411654132120‘\', \'address\': \'’@#$%^&*()13131546489749411654132120.321131032132120#@$%^&*发发顺丰131315464897494116541321201313154648974941165413212013131546489749411654132120dfa13131546489749411654‘132120 第三方13131546489749411654132120安抚ds 13131546489749411654132120‘\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 49),
	(148, '[模糊测试_name值不传,pricekey直接删除,address超长的值]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name值不传,pricekey直接删除,address超长的值\', \'address\': \'’@#$%^&*()13131546489749411654132120.321131032132120#@$%^&*发发顺丰131315464897494116541321201313154648974941165413212013131546489749411654132120dfa13131546489749411654‘132120 第三方13131546489749411654132120安抚ds 13131546489749411654132120‘\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 49),
	(149, '[模糊测试_name超长的值,price正确的值,address超长的值]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'’@#$%^&*()13131546489749411654132120.321131032132120#@$%^&*发发顺丰131315464897494116541321201313154648974941165413212013131546489749411654132120dfa13131546489749411654‘132120 第三方13131546489749411654132120安抚ds 13131546489749411654132120‘\', \'info\': \'name超长的值,price正确的值,address超长的值\', \'price\': 100, \'address\': \'’@#$%^&*()13131546489749411654132120.321131032132120#@$%^&*发发顺丰131315464897494116541321201313154648974941165413212013131546489749411654132120dfa13131546489749411654‘132120 第三方13131546489749411654132120安抚ds 13131546489749411654132120‘\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 49),
	(150, '[模糊测试_namekey直接删除,price值不传,address超长的值]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'info\': \'namekey直接删除,price值不传,address超长的值\', \'price\': \'\', \'address\': \'’@#$%^&*()13131546489749411654132120.321131032132120#@$%^&*发发顺丰131315464897494116541321201313154648974941165413212013131546489749411654132120dfa13131546489749411654‘132120 第三方13131546489749411654132120安抚ds 13131546489749411654132120‘\'}', '', '0:00:01', '{"code":1,"msg":"success"}', 0, 49),
	(151, '[模糊测试_namekey直接删除,price正确的值,addresskey直接删除]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'info\': \'namekey直接删除,price正确的值,addresskey直接删除\', \'price\': 100}', '', '0:00:01', '{"code":1,"msg":"success"}', 0, 49),
	(152, '[模糊测试_name超长的值,pricekey直接删除,addresskey直接删除]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'’@#$%^&*()13131546489749411654132120.321131032132120#@$%^&*发发顺丰131315464897494116541321201313154648974941165413212013131546489749411654132120dfa13131546489749411654‘132120 第三方13131546489749411654132120安抚ds 13131546489749411654132120‘\', \'info\': \'name超长的值,pricekey直接删除,addresskey直接删除\'}', '', '0:00:01', '{"code":1,"msg":"success"}', 0, 49),
	(153, '[模糊测试_name值不传,price超长的值,addresskey直接删除]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name值不传,price超长的值,addresskey直接删除\', \'price\': \'’@#$%^&*()13131546489749411654132120.321131032132120#@$%^&*发发顺丰131315464897494116541321201313154648974941165413212013131546489749411654132120dfa13131546489749411654‘132120 第三方13131546489749411654132120安抚ds 13131546489749411654132120‘\'}', '', '0:00:01', '{"code":1,"msg":"success"}', 0, 49),
	(154, '[模糊测试_name正确的值,price值不传,addresskey直接删除]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name正确的值,price值不传,addresskey直接删除\', \'price\': \'\'}', '', '0:00:01', '{"code":1,"msg":"success"}', 0, 49),
	(155, '商品列表', '127.0.0.1:8100/myapi/get_shop_list', 'http', 'get', '{}', '"code":1|"id":1', '0:00:00', '{"code":1,"msg":"success","data":[{"id":0,"name":"\\u624b\\u673a0","price":100},{"id":1,"name":"\\u624b\\u673a1","price":101},{"id":2,"name":"\\u624b\\u673a2","price":102},{"id":3,"name":"\\u624b\\u673a3","price":103},{"id":4,"name":"\\u624b\\u673a4","price":104},{"id":5,"name":"\\u624b\\u673a5","price":105},{"id":6,"name":"\\u624b\\u673a6","price":106},{"id":7,"name":"\\u624b\\u673a7","price":107},{"id":8,"name":"\\u624b\\u673a8","price":108},{"id":9,"name":"\\u624b\\u673a9","price":109}]}', 1, 50),
	(156, '添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'price\': 100, \'address\': \'北京\'}', '"code":1', '0:00:00', '{"code":1,"msg":"success"}', 1, 50),
	(157, '商品列表', '127.0.0.1:8100/myapi/get_shop_list', 'http', 'get', '{}', '"code":1|"id":1', '0:00:01', '{"code":1,"msg":"success","data":[{"id":0,"name":"\\u624b\\u673a0","price":100},{"id":1,"name":"\\u624b\\u673a1","price":101},{"id":2,"name":"\\u624b\\u673a2","price":102},{"id":3,"name":"\\u624b\\u673a3","price":103},{"id":4,"name":"\\u624b\\u673a4","price":104},{"id":5,"name":"\\u624b\\u673a5","price":105},{"id":6,"name":"\\u624b\\u673a6","price":106},{"id":7,"name":"\\u624b\\u673a7","price":107},{"id":8,"name":"\\u624b\\u673a8","price":108},{"id":9,"name":"\\u624b\\u673a9","price":109}]}', 1, 51),
	(158, '商品列表', '127.0.0.1:8100/myapi/get_shop_list', 'http', 'get', '{}', '"code":1|"id":1', '0:00:00', '{"code":1,"msg":"success","data":[{"id":0,"name":"\\u624b\\u673a0","price":100},{"id":1,"name":"\\u624b\\u673a1","price":101},{"id":2,"name":"\\u624b\\u673a2","price":102},{"id":3,"name":"\\u624b\\u673a3","price":103},{"id":4,"name":"\\u624b\\u673a4","price":104},{"id":5,"name":"\\u624b\\u673a5","price":105},{"id":6,"name":"\\u624b\\u673a6","price":106},{"id":7,"name":"\\u624b\\u673a7","price":107},{"id":8,"name":"\\u624b\\u673a8","price":108},{"id":9,"name":"\\u624b\\u673a9","price":109}]}', 1, 52),
	(159, '商品列表', '127.0.0.1:8100/myapi/get_shop_list', 'http', 'get', '{}', '"code":1|"id":1', '0:00:00', '{"code":1,"msg":"success","data":[{"id":0,"name":"\\u624b\\u673a0","price":100},{"id":1,"name":"\\u624b\\u673a1","price":101},{"id":2,"name":"\\u624b\\u673a2","price":102},{"id":3,"name":"\\u624b\\u673a3","price":103},{"id":4,"name":"\\u624b\\u673a4","price":104},{"id":5,"name":"\\u624b\\u673a5","price":105},{"id":6,"name":"\\u624b\\u673a6","price":106},{"id":7,"name":"\\u624b\\u673a7","price":107},{"id":8,"name":"\\u624b\\u673a8","price":108},{"id":9,"name":"\\u624b\\u673a9","price":109}]}', 1, 53),
	(160, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': 100, \'address\': \'北京\'}', '"code":1', '0:00:01', '{"code":1,"msg":"success"}', 0, 53),
	(161, '[模糊测试_name参数不传内容,price参数不传内容,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数不传内容,address参数正确\', \'price\': \'\', \'address\': \'北京\'}', '', '0:00:01', '{"code":1,"msg":"success"}', 0, 53),
	(162, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'key不传\', \'address\': \'北京\'}', '', '0:00:01', '{"code":1,"msg":"success"}', 0, 53),
	(163, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'系统生成\', \'address\': \'北京\'}', '', '0:00:01', '{"code":1,"msg":"success"}', 0, 53),
	(164, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': "x\' AND userid IS NULL; --", \'address\': \'北京\'}', '', '0:00:01', '{"code":1,"msg":"success"}', 0, 53),
	(165, '[模糊测试_name参数正确,price参数正确,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name参数正确,price参数正确,address参数不传内容\', \'price\': \'系统生成\', \'address\': \'\'}', '', '0:00:01', '{"code":1,"msg":"success"}', 0, 53),
	(166, '[模糊测试_name参数正确,price参数正确,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数正确,address参数不传内容\', \'price\': \'key不传\', \'address\': \'\'}', '', '0:00:01', '{"code":1,"msg":"success"}', 0, 53),
	(167, '[模糊测试_name参数正确,price参数不传内容,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数不传内容,address参数不传内容\', \'price\': \'\', \'address\': \'\'}', '', '0:00:01', '{"code":1,"msg":"success"}', 0, 53),
	(168, '[模糊测试_name参数不传内容,price参数正确,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数正确,address参数不传内容\', \'price\': 100, \'address\': \'\'}', '', '0:00:01', '{"code":1,"msg":"success"}', 0, 53),
	(169, '[模糊测试_name参数正确,price参数正确,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数正确,address参数不传内容\', \'price\': "x\' AND userid IS NULL; --", \'address\': \'\'}', '', '0:00:01', '{"code":1,"msg":"success"}', 0, 53),
	(170, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'系统生成\', \'address\': \'key不传\'}', '', '0:00:01', '{"code":1,"msg":"success"}', 0, 53),
	(171, '[模糊测试_name参数不传内容,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数正确,address参数正确\', \'price\': \'key不传\', \'address\': \'key不传\'}', '', '0:00:01', '{"code":1,"msg":"success"}', 0, 53),
	(172, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': "x\' AND userid IS NULL; --", \'address\': \'key不传\'}', '', '0:00:01', '{"code":1,"msg":"success"}', 0, 53),
	(173, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': 100, \'address\': \'key不传\'}', '', '0:00:01', '{"code":1,"msg":"success"}', 0, 53),
	(174, '[模糊测试_name参数正确,price参数不传内容,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name参数正确,price参数不传内容,address参数正确\', \'price\': \'\', \'address\': \'key不传\'}', '', '0:00:01', '{"code":1,"msg":"success"}', 0, 53),
	(175, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': 100, \'address\': \'系统生成\'}', '', '0:00:01', '{"code":1,"msg":"success"}', 0, 53),
	(176, '[模糊测试_name参数正确,price参数不传内容,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数不传内容,address参数正确\', \'price\': \'\', \'address\': \'系统生成\'}', '', '0:00:01', '{"code":1,"msg":"success"}', 0, 53),
	(177, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'系统生成\', \'address\': \'系统生成\'}', '', '0:00:01', '{"code":1,"msg":"success"}', 0, 53),
	(178, '[模糊测试_name参数不传内容,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数正确,address参数正确\', \'price\': "x\' AND userid IS NULL; --", \'address\': \'系统生成\'}', '', '0:00:01', '{"code":1,"msg":"success"}', 0, 53),
	(179, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'key不传\', \'address\': \'系统生成\'}', '', '0:00:01', '{"code":1,"msg":"success"}', 0, 53),
	(180, '[模糊测试_name参数正确,price参数不传内容,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数不传内容,address参数正确\', \'price\': \'\', \'address\': "x\' AND userid IS NULL; --"}', '', '0:00:01', '{"code":1,"msg":"success"}', 0, 53),
	(181, '[模糊测试_name参数不传内容,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数正确,address参数正确\', \'price\': \'系统生成\', \'address\': "x\' AND userid IS NULL; --"}', '', '0:00:01', '{"code":1,"msg":"success"}', 0, 53),
	(182, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': 100, \'address\': "x\' AND userid IS NULL; --"}', '', '0:00:01', '{"code":1,"msg":"success"}', 0, 53),
	(183, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': "x\' AND userid IS NULL; --", \'address\': "x\' AND userid IS NULL; --"}', '', '0:00:01', '{"code":1,"msg":"success"}', 0, 53),
	(184, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'key不传\', \'address\': "x\' AND userid IS NULL; --"}', '', '0:00:01', '{"code":1,"msg":"success"}', 0, 53),
	(185, '商品列表', '127.0.0.1:8100/myapi/get_shop_list', 'http', 'get', '{}', '"code":1|"id":1', '0:00:00', '{"code":1,"msg":"success","data":[{"id":0,"name":"\\u624b\\u673a0","price":100},{"id":1,"name":"\\u624b\\u673a1","price":101},{"id":2,"name":"\\u624b\\u673a2","price":102},{"id":3,"name":"\\u624b\\u673a3","price":103},{"id":4,"name":"\\u624b\\u673a4","price":104},{"id":5,"name":"\\u624b\\u673a5","price":105},{"id":6,"name":"\\u624b\\u673a6","price":106},{"id":7,"name":"\\u624b\\u673a7","price":107},{"id":8,"name":"\\u624b\\u673a8","price":108},{"id":9,"name":"\\u624b\\u673a9","price":109}]}', 1, 54),
	(186, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': 100, \'address\': \'北京\'}', '"code":1', '0:00:00', '{"code":1,"msg":"success"}', 0, 54),
	(187, '[模糊测试_name参数不传内容,price参数不传内容,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数不传内容,address参数正确\', \'price\': \'\', \'address\': \'北京\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 54),
	(188, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'key不传\', \'address\': \'北京\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 54),
	(189, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'系统生成\', \'address\': \'北京\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 54),
	(190, '[模糊测试_name注入攻击1,price注入攻击1,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price注入攻击1,address参数正确\', \'price\': "x\' AND userid IS NULL; --", \'address\': \'北京\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 54),
	(191, '[模糊测试_name注入攻击1,price参数正确,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price参数正确,address参数不传内容\', \'price\': \'系统生成\', \'address\': \'\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 54),
	(192, '[模糊测试_name参数正确,price参数正确,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数正确,address参数不传内容\', \'price\': \'key不传\', \'address\': \'\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 54),
	(193, '[模糊测试_name参数正确,price参数不传内容,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数不传内容,address参数不传内容\', \'price\': \'\', \'address\': \'\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 54),
	(194, '[模糊测试_name参数不传内容,price参数正确,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数正确,address参数不传内容\', \'price\': 100, \'address\': \'\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 54),
	(195, '[模糊测试_name参数正确,price注入攻击1,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price注入攻击1,address参数不传内容\', \'price\': "x\' AND userid IS NULL; --", \'address\': \'\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 54),
	(196, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'系统生成\', \'address\': \'key不传\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 54),
	(197, '[模糊测试_name参数不传内容,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数正确,address参数正确\', \'price\': \'key不传\', \'address\': \'key不传\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 54),
	(198, '[模糊测试_name参数正确,price注入攻击1,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price注入攻击1,address参数正确\', \'price\': "x\' AND userid IS NULL; --", \'address\': \'key不传\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 54),
	(199, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': 100, \'address\': \'key不传\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 54),
	(200, '[模糊测试_name注入攻击1,price参数不传内容,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price参数不传内容,address参数正确\', \'price\': \'\', \'address\': \'key不传\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 54),
	(201, '[模糊测试_name注入攻击1,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price参数正确,address参数正确\', \'price\': 100, \'address\': \'系统生成\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 54),
	(202, '[模糊测试_name参数正确,price参数不传内容,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数不传内容,address参数正确\', \'price\': \'\', \'address\': \'系统生成\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 54),
	(203, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'系统生成\', \'address\': \'系统生成\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 54),
	(204, '[模糊测试_name参数不传内容,price注入攻击1,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price注入攻击1,address参数正确\', \'price\': "x\' AND userid IS NULL; --", \'address\': \'系统生成\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 54),
	(205, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'key不传\', \'address\': \'系统生成\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 54),
	(206, '[模糊测试_name参数正确,price参数不传内容,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数不传内容,address注入攻击1\', \'price\': \'\', \'address\': "x\' AND userid IS NULL; --"}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 54),
	(207, '[模糊测试_name参数不传内容,price参数正确,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数正确,address注入攻击1\', \'price\': \'系统生成\', \'address\': "x\' AND userid IS NULL; --"}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 54),
	(208, '[模糊测试_name参数正确,price参数正确,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数正确,address注入攻击1\', \'price\': 100, \'address\': "x\' AND userid IS NULL; --"}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 54),
	(209, '[模糊测试_name参数正确,price注入攻击1,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price注入攻击1,address注入攻击1\', \'price\': "x\' AND userid IS NULL; --", \'address\': "x\' AND userid IS NULL; --"}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 54),
	(210, '[模糊测试_name注入攻击1,price参数正确,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price参数正确,address注入攻击1\', \'price\': \'key不传\', \'address\': "x\' AND userid IS NULL; --"}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 54),
	(211, '商品列表', '127.0.0.1:8100/myapi/get_shop_list', 'http', 'get', '{}', '"code":1|"id":1', '0:00:00', '{"code":1,"msg":"success","data":[{"id":0,"name":"\\u624b\\u673a0","price":100},{"id":1,"name":"\\u624b\\u673a1","price":101},{"id":2,"name":"\\u624b\\u673a2","price":102},{"id":3,"name":"\\u624b\\u673a3","price":103},{"id":4,"name":"\\u624b\\u673a4","price":104},{"id":5,"name":"\\u624b\\u673a5","price":105},{"id":6,"name":"\\u624b\\u673a6","price":106},{"id":7,"name":"\\u624b\\u673a7","price":107},{"id":8,"name":"\\u624b\\u673a8","price":108},{"id":9,"name":"\\u624b\\u673a9","price":109}]}', 1, 55),
	(212, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': 100, \'address\': \'北京\'}', '"code":1', '0:00:00', '{"code":1,"msg":"success"}', 0, 55),
	(213, '[模糊测试_name参数不传内容,price参数不传内容,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数不传内容,address参数正确\', \'price\': \'\', \'address\': \'北京\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 55),
	(214, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'key不传\', \'address\': \'北京\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 55),
	(215, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'系统生成\', \'address\': \'北京\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 55),
	(216, '[模糊测试_name注入攻击1,price注入攻击1,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price注入攻击1,address参数正确\', \'price\': "x\' AND userid IS NULL; --", \'address\': \'北京\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 55),
	(217, '[模糊测试_name注入攻击1,price参数正确,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price参数正确,address参数不传内容\', \'price\': \'系统生成\', \'address\': \'\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 55),
	(218, '[模糊测试_name参数正确,price参数正确,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数正确,address参数不传内容\', \'price\': \'key不传\', \'address\': \'\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 55),
	(219, '[模糊测试_name参数正确,price参数不传内容,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数不传内容,address参数不传内容\', \'price\': \'\', \'address\': \'\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 55),
	(220, '[模糊测试_name参数不传内容,price参数正确,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数正确,address参数不传内容\', \'price\': 100, \'address\': \'\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 55),
	(221, '[模糊测试_name参数正确,price注入攻击1,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price注入攻击1,address参数不传内容\', \'price\': "x\' AND userid IS NULL; --", \'address\': \'\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 55),
	(222, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'系统生成\', \'address\': \'key不传\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 55),
	(223, '[模糊测试_name参数不传内容,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数正确,address参数正确\', \'price\': \'key不传\', \'address\': \'key不传\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 55),
	(224, '[模糊测试_name参数正确,price注入攻击1,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price注入攻击1,address参数正确\', \'price\': "x\' AND userid IS NULL; --", \'address\': \'key不传\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 55),
	(225, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': 100, \'address\': \'key不传\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 55),
	(226, '[模糊测试_name注入攻击1,price参数不传内容,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price参数不传内容,address参数正确\', \'price\': \'\', \'address\': \'key不传\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 55),
	(227, '[模糊测试_name注入攻击1,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price参数正确,address参数正确\', \'price\': 100, \'address\': \'系统生成\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 55),
	(228, '[模糊测试_name参数正确,price参数不传内容,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数不传内容,address参数正确\', \'price\': \'\', \'address\': \'系统生成\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 55),
	(229, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'系统生成\', \'address\': \'系统生成\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 55),
	(230, '[模糊测试_name参数不传内容,price注入攻击1,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price注入攻击1,address参数正确\', \'price\': "x\' AND userid IS NULL; --", \'address\': \'系统生成\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 55),
	(231, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'key不传\', \'address\': \'系统生成\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 55),
	(232, '[模糊测试_name参数正确,price参数不传内容,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数不传内容,address注入攻击1\', \'price\': \'\', \'address\': "x\' AND userid IS NULL; --"}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 55),
	(233, '[模糊测试_name参数不传内容,price参数正确,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数正确,address注入攻击1\', \'price\': \'系统生成\', \'address\': "x\' AND userid IS NULL; --"}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 55),
	(234, '[模糊测试_name参数正确,price参数正确,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数正确,address注入攻击1\', \'price\': 100, \'address\': "x\' AND userid IS NULL; --"}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 55),
	(235, '[模糊测试_name参数正确,price注入攻击1,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price注入攻击1,address注入攻击1\', \'price\': "x\' AND userid IS NULL; --", \'address\': "x\' AND userid IS NULL; --"}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 55),
	(236, '[模糊测试_name注入攻击1,price参数正确,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price参数正确,address注入攻击1\', \'price\': \'key不传\', \'address\': "x\' AND userid IS NULL; --"}', '', '0:00:00', '{"code":1,"msg":"success"}', 0, 55),
	(237, '商品列表', '127.0.0.1:8100/myapi/get_shop_list', 'http', 'get', '{}', '"code":1|"id":1', '0:00:00', '{"code":1,"msg":"success","data":[{"id":0,"name":"\\u624b\\u673a0","price":100},{"id":1,"name":"\\u624b\\u673a1","price":101},{"id":2,"name":"\\u624b\\u673a2","price":102},{"id":3,"name":"\\u624b\\u673a3","price":103},{"id":4,"name":"\\u624b\\u673a4","price":104},{"id":5,"name":"\\u624b\\u673a5","price":105},{"id":6,"name":"\\u624b\\u673a6","price":106},{"id":7,"name":"\\u624b\\u673a7","price":107},{"id":8,"name":"\\u624b\\u673a8","price":108},{"id":9,"name":"\\u624b\\u673a9","price":109}]}', 1, 56),
	(238, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': 100, \'address\': \'北京\'}', '"code":1', '0:00:00', '{"code":1,"msg":"success"}', 1, 56),
	(239, '[模糊测试_name参数不传内容,price参数不传内容,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数不传内容,address参数正确\', \'price\': \'\', \'address\': \'北京\'}', '"code":1', '0:00:00', '{"code":1,"msg":"success"}', 1, 56),
	(240, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'key不传\', \'address\': \'北京\'}', '"code":1', '0:00:00', '{"code":1,"msg":"success"}', 1, 56),
	(241, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'系统生成\', \'address\': \'北京\'}', '"code":1', '0:00:00', '{"code":1,"msg":"success"}', 1, 56),
	(242, '[模糊测试_name注入攻击1,price注入攻击1,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price注入攻击1,address参数正确\', \'price\': "x\' AND userid IS NULL; --", \'address\': \'北京\'}', '"code":1', '0:00:00', '{"code":1,"msg":"success"}', 1, 56),
	(243, '[模糊测试_name注入攻击1,price参数正确,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price参数正确,address参数不传内容\', \'price\': \'系统生成\', \'address\': \'\'}', '"code":1', '0:00:00', '{"code":1,"msg":"success"}', 1, 56),
	(244, '[模糊测试_name参数正确,price参数正确,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数正确,address参数不传内容\', \'price\': \'key不传\', \'address\': \'\'}', '"code":1', '0:00:00', '{"code":1,"msg":"success"}', 1, 56),
	(245, '[模糊测试_name参数正确,price参数不传内容,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数不传内容,address参数不传内容\', \'price\': \'\', \'address\': \'\'}', '"code":1', '0:00:00', '{"code":1,"msg":"success"}', 1, 56),
	(246, '[模糊测试_name参数不传内容,price参数正确,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数正确,address参数不传内容\', \'price\': 100, \'address\': \'\'}', '"code":1', '0:00:00', '{"code":1,"msg":"success"}', 1, 56),
	(247, '[模糊测试_name参数正确,price注入攻击1,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price注入攻击1,address参数不传内容\', \'price\': "x\' AND userid IS NULL; --", \'address\': \'\'}', '"code":1', '0:00:00', '{"code":1,"msg":"success"}', 1, 56),
	(248, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'系统生成\', \'address\': \'key不传\'}', '"code":1', '0:00:00', '{"code":1,"msg":"success"}', 1, 56),
	(249, '[模糊测试_name参数不传内容,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数正确,address参数正确\', \'price\': \'key不传\', \'address\': \'key不传\'}', '"code":1', '0:00:00', '{"code":1,"msg":"success"}', 1, 56),
	(250, '[模糊测试_name参数正确,price注入攻击1,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price注入攻击1,address参数正确\', \'price\': "x\' AND userid IS NULL; --", \'address\': \'key不传\'}', '"code":1', '0:00:00', '{"code":1,"msg":"success"}', 1, 56),
	(251, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': 100, \'address\': \'key不传\'}', '"code":1', '0:00:00', '{"code":1,"msg":"success"}', 1, 56),
	(252, '[模糊测试_name注入攻击1,price参数不传内容,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price参数不传内容,address参数正确\', \'price\': \'\', \'address\': \'key不传\'}', '"code":1', '0:00:00', '{"code":1,"msg":"success"}', 1, 56),
	(253, '[模糊测试_name注入攻击1,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price参数正确,address参数正确\', \'price\': 100, \'address\': \'系统生成\'}', '"code":1', '0:00:00', '{"code":1,"msg":"success"}', 1, 56),
	(254, '[模糊测试_name参数正确,price参数不传内容,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数不传内容,address参数正确\', \'price\': \'\', \'address\': \'系统生成\'}', '"code":1', '0:00:00', '{"code":1,"msg":"success"}', 1, 56),
	(255, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'系统生成\', \'address\': \'系统生成\'}', '"code":1', '0:00:00', '{"code":1,"msg":"success"}', 1, 56),
	(256, '[模糊测试_name参数不传内容,price注入攻击1,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price注入攻击1,address参数正确\', \'price\': "x\' AND userid IS NULL; --", \'address\': \'系统生成\'}', '"code":1', '0:00:00', '{"code":1,"msg":"success"}', 1, 56),
	(257, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'key不传\', \'address\': \'系统生成\'}', '"code":1', '0:00:00', '{"code":1,"msg":"success"}', 1, 56),
	(258, '[模糊测试_name参数正确,price参数不传内容,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数不传内容,address注入攻击1\', \'price\': \'\', \'address\': "x\' AND userid IS NULL; --"}', '"code":1', '0:00:00', '{"code":1,"msg":"success"}', 1, 56),
	(259, '[模糊测试_name参数不传内容,price参数正确,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数正确,address注入攻击1\', \'price\': \'系统生成\', \'address\': "x\' AND userid IS NULL; --"}', '"code":1', '0:00:00', '{"code":1,"msg":"success"}', 1, 56),
	(260, '[模糊测试_name参数正确,price参数正确,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数正确,address注入攻击1\', \'price\': 100, \'address\': "x\' AND userid IS NULL; --"}', '"code":1', '0:00:00', '{"code":1,"msg":"success"}', 1, 56),
	(261, '[模糊测试_name参数正确,price注入攻击1,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price注入攻击1,address注入攻击1\', \'price\': "x\' AND userid IS NULL; --", \'address\': "x\' AND userid IS NULL; --"}', '"code":1', '0:00:00', '{"code":1,"msg":"success"}', 1, 56),
	(262, '[模糊测试_name注入攻击1,price参数正确,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price参数正确,address注入攻击1\', \'price\': \'key不传\', \'address\': "x\' AND userid IS NULL; --"}', '"code":1', '0:00:00', '{"code":1,"msg":"success"}', 1, 56),
	(263, '商品列表', '127.0.0.1:8100/myapi/get_shop_list', 'http', 'get', '{}', '"code":1|"id":1', '0:00:00', '{"code":1,"msg":"success","data":[{"id":0,"name":"\\u624b\\u673a0","price":100},{"id":1,"name":"\\u624b\\u673a1","price":101},{"id":2,"name":"\\u624b\\u673a2","price":102},{"id":3,"name":"\\u624b\\u673a3","price":103},{"id":4,"name":"\\u624b\\u673a4","price":104},{"id":5,"name":"\\u624b\\u673a5","price":105},{"id":6,"name":"\\u624b\\u673a6","price":106},{"id":7,"name":"\\u624b\\u673a7","price":107},{"id":8,"name":"\\u624b\\u673a8","price":108},{"id":9,"name":"\\u624b\\u673a9","price":109}]}', 1, 57),
	(264, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': 100, \'address\': \'北京\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 1, 57),
	(265, '[模糊测试_name参数不传内容,price参数不传内容,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数不传内容,address参数正确\', \'price\': \'\', \'address\': \'北京\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 1, 57),
	(266, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'key不传\', \'address\': \'北京\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 1, 57),
	(267, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'系统生成\', \'address\': \'北京\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 1, 57),
	(268, '[模糊测试_name注入攻击1,price注入攻击1,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price注入攻击1,address参数正确\', \'price\': "x\' AND userid IS NULL; --", \'address\': \'北京\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 1, 57),
	(269, '[模糊测试_name注入攻击1,price参数正确,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price参数正确,address参数不传内容\', \'price\': \'系统生成\', \'address\': \'\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 1, 57),
	(270, '[模糊测试_name参数正确,price参数正确,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数正确,address参数不传内容\', \'price\': \'key不传\', \'address\': \'\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 1, 57),
	(271, '[模糊测试_name参数正确,price参数不传内容,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数不传内容,address参数不传内容\', \'price\': \'\', \'address\': \'\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 1, 57),
	(272, '[模糊测试_name参数不传内容,price参数正确,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数正确,address参数不传内容\', \'price\': 100, \'address\': \'\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 1, 57),
	(273, '[模糊测试_name参数正确,price注入攻击1,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price注入攻击1,address参数不传内容\', \'price\': "x\' AND userid IS NULL; --", \'address\': \'\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 1, 57),
	(274, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'系统生成\', \'address\': \'key不传\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 1, 57),
	(275, '[模糊测试_name参数不传内容,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数正确,address参数正确\', \'price\': \'key不传\', \'address\': \'key不传\'}', '', '0:00:01', '{"code":1,"msg":"success"}', 1, 57),
	(276, '[模糊测试_name参数正确,price注入攻击1,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price注入攻击1,address参数正确\', \'price\': "x\' AND userid IS NULL; --", \'address\': \'key不传\'}', '', '0:00:01', '{"code":1,"msg":"success"}', 1, 57),
	(277, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': 100, \'address\': \'key不传\'}', '', '0:00:01', '{"code":1,"msg":"success"}', 1, 57),
	(278, '[模糊测试_name注入攻击1,price参数不传内容,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price参数不传内容,address参数正确\', \'price\': \'\', \'address\': \'key不传\'}', '', '0:00:01', '{"code":1,"msg":"success"}', 1, 57),
	(279, '[模糊测试_name注入攻击1,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price参数正确,address参数正确\', \'price\': 100, \'address\': \'系统生成\'}', '', '0:00:01', '{"code":1,"msg":"success"}', 1, 57),
	(280, '[模糊测试_name参数正确,price参数不传内容,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数不传内容,address参数正确\', \'price\': \'\', \'address\': \'系统生成\'}', '', '0:00:01', '{"code":1,"msg":"success"}', 1, 57),
	(281, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'系统生成\', \'address\': \'系统生成\'}', '', '0:00:01', '{"code":1,"msg":"success"}', 1, 57),
	(282, '[模糊测试_name参数不传内容,price注入攻击1,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price注入攻击1,address参数正确\', \'price\': "x\' AND userid IS NULL; --", \'address\': \'系统生成\'}', '', '0:00:01', '{"code":1,"msg":"success"}', 1, 57),
	(283, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'key不传\', \'address\': \'系统生成\'}', '', '0:00:01', '{"code":1,"msg":"success"}', 1, 57),
	(284, '[模糊测试_name参数正确,price参数不传内容,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数不传内容,address注入攻击1\', \'price\': \'\', \'address\': "x\' AND userid IS NULL; --"}', '', '0:00:01', '{"code":1,"msg":"success"}', 1, 57),
	(285, '[模糊测试_name参数不传内容,price参数正确,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数正确,address注入攻击1\', \'price\': \'系统生成\', \'address\': "x\' AND userid IS NULL; --"}', '', '0:00:01', '{"code":1,"msg":"success"}', 1, 57),
	(286, '[模糊测试_name参数正确,price参数正确,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数正确,address注入攻击1\', \'price\': 100, \'address\': "x\' AND userid IS NULL; --"}', '', '0:00:01', '{"code":1,"msg":"success"}', 1, 57),
	(287, '[模糊测试_name参数正确,price注入攻击1,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price注入攻击1,address注入攻击1\', \'price\': "x\' AND userid IS NULL; --", \'address\': "x\' AND userid IS NULL; --"}', '', '0:00:01', '{"code":1,"msg":"success"}', 1, 57),
	(288, '[模糊测试_name注入攻击1,price参数正确,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price参数正确,address注入攻击1\', \'price\': \'key不传\', \'address\': "x\' AND userid IS NULL; --"}', '', '0:00:01', '{"code":1,"msg":"success"}', 1, 57),
	(289, '商品列表', '127.0.0.1:8100/myapi/get_shop_list', 'http', 'get', '{}', '"code":1|"id":1', '0:00:00', '{"code":1,"msg":"success","data":[{"id":0,"name":"\\u624b\\u673a0","price":100},{"id":1,"name":"\\u624b\\u673a1","price":101},{"id":2,"name":"\\u624b\\u673a2","price":102},{"id":3,"name":"\\u624b\\u673a3","price":103},{"id":4,"name":"\\u624b\\u673a4","price":104},{"id":5,"name":"\\u624b\\u673a5","price":105},{"id":6,"name":"\\u624b\\u673a6","price":106},{"id":7,"name":"\\u624b\\u673a7","price":107},{"id":8,"name":"\\u624b\\u673a8","price":108},{"id":9,"name":"\\u624b\\u673a9","price":109}]}', 1, 58),
	(290, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': 100, \'address\': \'北京\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 1, 58),
	(291, '[模糊测试_name参数不传内容,price参数不传内容,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数不传内容,address参数正确\', \'price\': \'\', \'address\': \'北京\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 1, 58),
	(292, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'key不传\', \'address\': \'北京\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 1, 58),
	(293, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'系统生成\', \'address\': \'北京\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 1, 58),
	(294, '[模糊测试_name注入攻击1,price注入攻击1,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price注入攻击1,address参数正确\', \'price\': "x\' AND userid IS NULL; --", \'address\': \'北京\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 1, 58),
	(295, '[模糊测试_name注入攻击1,price参数正确,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price参数正确,address参数不传内容\', \'price\': \'系统生成\', \'address\': \'\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 1, 58),
	(296, '[模糊测试_name参数正确,price参数正确,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数正确,address参数不传内容\', \'price\': \'key不传\', \'address\': \'\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 1, 58),
	(297, '[模糊测试_name参数正确,price参数不传内容,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数不传内容,address参数不传内容\', \'price\': \'\', \'address\': \'\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 1, 58),
	(298, '[模糊测试_name参数不传内容,price参数正确,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数正确,address参数不传内容\', \'price\': 100, \'address\': \'\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 1, 58),
	(299, '[模糊测试_name参数正确,price注入攻击1,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price注入攻击1,address参数不传内容\', \'price\': "x\' AND userid IS NULL; --", \'address\': \'\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 1, 58),
	(300, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'系统生成\', \'address\': \'key不传\'}', '', '0:00:00', '{"code":1,"msg":"success"}', 1, 58),
	(301, '[模糊测试_name参数不传内容,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数正确,address参数正确\', \'price\': \'key不传\', \'address\': \'key不传\'}', '', '0:00:01', '{"code":1,"msg":"success"}', 1, 58),
	(302, '[模糊测试_name参数正确,price注入攻击1,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price注入攻击1,address参数正确\', \'price\': "x\' AND userid IS NULL; --", \'address\': \'key不传\'}', '', '0:00:01', '{"code":1,"msg":"success"}', 1, 58),
	(303, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': 100, \'address\': \'key不传\'}', '', '0:00:01', '{"code":1,"msg":"success"}', 1, 58),
	(304, '[模糊测试_name注入攻击1,price参数不传内容,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price参数不传内容,address参数正确\', \'price\': \'\', \'address\': \'key不传\'}', '', '0:00:01', '{"code":1,"msg":"success"}', 1, 58),
	(305, '[模糊测试_name注入攻击1,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price参数正确,address参数正确\', \'price\': 100, \'address\': \'系统生成\'}', '', '0:00:01', '{"code":1,"msg":"success"}', 1, 58),
	(306, '[模糊测试_name参数正确,price参数不传内容,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数不传内容,address参数正确\', \'price\': \'\', \'address\': \'系统生成\'}', '', '0:00:01', '{"code":1,"msg":"success"}', 1, 58),
	(307, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'系统生成\', \'address\': \'系统生成\'}', '', '0:00:01', '{"code":1,"msg":"success"}', 1, 58),
	(308, '[模糊测试_name参数不传内容,price注入攻击1,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price注入攻击1,address参数正确\', \'price\': "x\' AND userid IS NULL; --", \'address\': \'系统生成\'}', '', '0:00:01', '{"code":1,"msg":"success"}', 1, 58),
	(309, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'key不传\', \'address\': \'系统生成\'}', '', '0:00:01', '{"code":1,"msg":"success"}', 1, 58),
	(310, '[模糊测试_name参数正确,price参数不传内容,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数不传内容,address注入攻击1\', \'price\': \'\', \'address\': "x\' AND userid IS NULL; --"}', '', '0:00:01', '{"code":1,"msg":"success"}', 1, 58),
	(311, '[模糊测试_name参数不传内容,price参数正确,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数正确,address注入攻击1\', \'price\': \'系统生成\', \'address\': "x\' AND userid IS NULL; --"}', '', '0:00:01', '{"code":1,"msg":"success"}', 1, 58),
	(312, '[模糊测试_name参数正确,price参数正确,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数正确,address注入攻击1\', \'price\': 100, \'address\': "x\' AND userid IS NULL; --"}', '', '0:00:01', '{"code":1,"msg":"success"}', 1, 58),
	(313, '[模糊测试_name参数正确,price注入攻击1,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price注入攻击1,address注入攻击1\', \'price\': "x\' AND userid IS NULL; --", \'address\': "x\' AND userid IS NULL; --"}', '', '0:00:01', '{"code":1,"msg":"success"}', 1, 58),
	(314, '[模糊测试_name注入攻击1,price参数正确,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price参数正确,address注入攻击1\', \'price\': \'key不传\', \'address\': "x\' AND userid IS NULL; --"}', '', '0:00:01', '{"code":1,"msg":"success"}', 1, 58),
	(315, '商品列表', '127.0.0.1:8100/myapi/get_shop_list', 'http', 'get', '{}', 'code:1', '0:00:00', '{"code":1,"msg":"success","data":[{"id":0,"name":"\\u624b\\u673a0","price":100},{"id":1,"name":"\\u624b\\u673a1","price":101},{"id":2,"name":"\\u624b\\u673a2","price":102},{"id":3,"name":"\\u624b\\u673a3","price":103},{"id":4,"name":"\\u624b\\u673a4","price":104},{"id":5,"name":"\\u624b\\u673a5","price":105},{"id":6,"name":"\\u624b\\u673a6","price":106},{"id":7,"name":"\\u624b\\u673a7","price":107},{"id":8,"name":"\\u624b\\u673a8","price":108},{"id":9,"name":"\\u624b\\u673a9","price":109}]}', -1, 60),
	(316, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': 100, \'address\': \'北京\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 60),
	(317, '[模糊测试_name参数不传内容,price参数不传内容,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数不传内容,address参数正确\', \'price\': \'\', \'address\': \'北京\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 60),
	(318, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'key不传\', \'address\': \'北京\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 60),
	(319, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'系统生成\', \'address\': \'北京\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 60),
	(320, '[模糊测试_name注入攻击1,price注入攻击1,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price注入攻击1,address参数正确\', \'price\': "x\' AND userid IS NULL; --", \'address\': \'北京\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 60),
	(321, '[模糊测试_name注入攻击1,price参数正确,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price参数正确,address参数不传内容\', \'price\': \'系统生成\', \'address\': \'\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 60),
	(322, '[模糊测试_name参数正确,price参数正确,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数正确,address参数不传内容\', \'price\': \'key不传\', \'address\': \'\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 60),
	(323, '[模糊测试_name参数正确,price参数不传内容,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数不传内容,address参数不传内容\', \'price\': \'\', \'address\': \'\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 60),
	(324, '[模糊测试_name参数不传内容,price参数正确,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数正确,address参数不传内容\', \'price\': 100, \'address\': \'\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 60),
	(325, '[模糊测试_name参数正确,price注入攻击1,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price注入攻击1,address参数不传内容\', \'price\': "x\' AND userid IS NULL; --", \'address\': \'\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 60),
	(326, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'系统生成\', \'address\': \'key不传\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 60),
	(327, '[模糊测试_name参数不传内容,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数正确,address参数正确\', \'price\': \'key不传\', \'address\': \'key不传\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 60),
	(328, '[模糊测试_name参数正确,price注入攻击1,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price注入攻击1,address参数正确\', \'price\': "x\' AND userid IS NULL; --", \'address\': \'key不传\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 60),
	(329, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': 100, \'address\': \'key不传\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 60),
	(330, '[模糊测试_name注入攻击1,price参数不传内容,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price参数不传内容,address参数正确\', \'price\': \'\', \'address\': \'key不传\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 60),
	(331, '[模糊测试_name注入攻击1,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price参数正确,address参数正确\', \'price\': 100, \'address\': \'系统生成\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 60),
	(332, '[模糊测试_name参数正确,price参数不传内容,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数不传内容,address参数正确\', \'price\': \'\', \'address\': \'系统生成\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 60),
	(333, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'系统生成\', \'address\': \'系统生成\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 60),
	(334, '[模糊测试_name参数不传内容,price注入攻击1,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price注入攻击1,address参数正确\', \'price\': "x\' AND userid IS NULL; --", \'address\': \'系统生成\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 60),
	(335, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'key不传\', \'address\': \'系统生成\'}', 'code:2', '0:00:01', '{"code":1,"msg":"success"}', -1, 60),
	(336, '[模糊测试_name参数正确,price参数不传内容,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数不传内容,address注入攻击1\', \'price\': \'\', \'address\': "x\' AND userid IS NULL; --"}', 'code:2', '0:00:01', '{"code":1,"msg":"success"}', -1, 60),
	(337, '[模糊测试_name参数不传内容,price参数正确,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数正确,address注入攻击1\', \'price\': \'系统生成\', \'address\': "x\' AND userid IS NULL; --"}', 'code:2', '0:00:01', '{"code":1,"msg":"success"}', -1, 60),
	(338, '[模糊测试_name参数正确,price参数正确,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数正确,address注入攻击1\', \'price\': 100, \'address\': "x\' AND userid IS NULL; --"}', 'code:2', '0:00:01', '{"code":1,"msg":"success"}', -1, 60),
	(339, '[模糊测试_name参数正确,price注入攻击1,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price注入攻击1,address注入攻击1\', \'price\': "x\' AND userid IS NULL; --", \'address\': "x\' AND userid IS NULL; --"}', 'code:2', '0:00:01', '{"code":1,"msg":"success"}', -1, 60),
	(340, '[模糊测试_name注入攻击1,price参数正确,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price参数正确,address注入攻击1\', \'price\': \'key不传\', \'address\': "x\' AND userid IS NULL; --"}', 'code:2', '0:00:01', '{"code":1,"msg":"success"}', -1, 60),
	(341, '商品列表', '127.0.0.1:8100/myapi/get_shop_list', 'http', 'get', '{}', 'code:1', '0:00:00', '{"code":1,"msg":"success","data":[{"id":0,"name":"\\u624b\\u673a0","price":100},{"id":1,"name":"\\u624b\\u673a1","price":101},{"id":2,"name":"\\u624b\\u673a2","price":102},{"id":3,"name":"\\u624b\\u673a3","price":103},{"id":4,"name":"\\u624b\\u673a4","price":104},{"id":5,"name":"\\u624b\\u673a5","price":105},{"id":6,"name":"\\u624b\\u673a6","price":106},{"id":7,"name":"\\u624b\\u673a7","price":107},{"id":8,"name":"\\u624b\\u673a8","price":108},{"id":9,"name":"\\u624b\\u673a9","price":109}]}', -1, 61),
	(342, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': 100, \'address\': \'北京\'}', 'code:1|msg:success', '0:00:00', '{"code":1,"msg":"success"}', -1, 61),
	(343, '[模糊测试_name参数不传内容,price参数不传内容,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数不传内容,address参数正确\', \'price\': \'\', \'address\': \'北京\'}', 'code:1|msg:success', '0:00:00', '{"code":1,"msg":"success"}', -1, 61),
	(344, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'key不传\', \'address\': \'北京\'}', 'code:1|msg:success', '0:00:00', '{"code":1,"msg":"success"}', -1, 61),
	(345, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'系统生成\', \'address\': \'北京\'}', 'code:1|msg:success', '0:00:00', '{"code":1,"msg":"success"}', -1, 61),
	(346, '[模糊测试_name注入攻击1,price注入攻击1,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price注入攻击1,address参数正确\', \'price\': "x\' AND userid IS NULL; --", \'address\': \'北京\'}', 'code:1|msg:success', '0:00:00', '{"code":1,"msg":"success"}', -1, 61),
	(347, '[模糊测试_name注入攻击1,price参数正确,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price参数正确,address参数不传内容\', \'price\': \'系统生成\', \'address\': \'\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 61),
	(348, '[模糊测试_name参数正确,price参数正确,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数正确,address参数不传内容\', \'price\': \'key不传\', \'address\': \'\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 61),
	(349, '[模糊测试_name参数正确,price参数不传内容,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数不传内容,address参数不传内容\', \'price\': \'\', \'address\': \'\'}', 'code:2', '0:00:01', '{"code":1,"msg":"success"}', -1, 61),
	(350, '[模糊测试_name参数不传内容,price参数正确,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数正确,address参数不传内容\', \'price\': 100, \'address\': \'\'}', 'code:2', '0:00:01', '{"code":1,"msg":"success"}', -1, 61),
	(351, '[模糊测试_name参数正确,price注入攻击1,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price注入攻击1,address参数不传内容\', \'price\': "x\' AND userid IS NULL; --", \'address\': \'\'}', 'code:2', '0:00:01', '{"code":1,"msg":"success"}', -1, 61),
	(352, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'系统生成\', \'address\': \'key不传\'}', 'code:1|msg:success', '0:00:01', '{"code":1,"msg":"success"}', -1, 61),
	(353, '[模糊测试_name参数不传内容,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数正确,address参数正确\', \'price\': \'key不传\', \'address\': \'key不传\'}', 'code:1|msg:success', '0:00:01', '{"code":1,"msg":"success"}', -1, 61),
	(354, '[模糊测试_name参数正确,price注入攻击1,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price注入攻击1,address参数正确\', \'price\': "x\' AND userid IS NULL; --", \'address\': \'key不传\'}', 'code:1|msg:success', '0:00:01', '{"code":1,"msg":"success"}', -1, 61),
	(355, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': 100, \'address\': \'key不传\'}', 'code:1|msg:success', '0:00:01', '{"code":1,"msg":"success"}', -1, 61),
	(356, '[模糊测试_name注入攻击1,price参数不传内容,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price参数不传内容,address参数正确\', \'price\': \'\', \'address\': \'key不传\'}', 'code:1|msg:success', '0:00:01', '{"code":1,"msg":"success"}', -1, 61),
	(357, '[模糊测试_name注入攻击1,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price参数正确,address参数正确\', \'price\': 100, \'address\': \'系统生成\'}', 'code:2', '0:00:01', '{"code":1,"msg":"success"}', -1, 61),
	(358, '[模糊测试_name参数正确,price参数不传内容,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数不传内容,address参数正确\', \'price\': \'\', \'address\': \'系统生成\'}', 'code:2', '0:00:01', '{"code":1,"msg":"success"}', -1, 61),
	(359, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'系统生成\', \'address\': \'系统生成\'}', 'code:2', '0:00:01', '{"code":1,"msg":"success"}', -1, 61),
	(360, '[模糊测试_name参数不传内容,price注入攻击1,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price注入攻击1,address参数正确\', \'price\': "x\' AND userid IS NULL; --", \'address\': \'系统生成\'}', 'code:2', '0:00:01', '{"code":1,"msg":"success"}', -1, 61),
	(361, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'key不传\', \'address\': \'系统生成\'}', 'code:2', '0:00:01', '{"code":1,"msg":"success"}', -1, 61),
	(362, '[模糊测试_name参数正确,price参数不传内容,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数不传内容,address注入攻击1\', \'price\': \'\', \'address\': "x\' AND userid IS NULL; --"}', 'code:2', '0:00:01', '{"code":1,"msg":"success"}', -1, 61),
	(363, '[模糊测试_name参数不传内容,price参数正确,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数正确,address注入攻击1\', \'price\': \'系统生成\', \'address\': "x\' AND userid IS NULL; --"}', 'code:2', '0:00:01', '{"code":1,"msg":"success"}', -1, 61),
	(364, '[模糊测试_name参数正确,price参数正确,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数正确,address注入攻击1\', \'price\': 100, \'address\': "x\' AND userid IS NULL; --"}', 'code:2', '0:00:01', '{"code":1,"msg":"success"}', -1, 61),
	(365, '[模糊测试_name参数正确,price注入攻击1,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price注入攻击1,address注入攻击1\', \'price\': "x\' AND userid IS NULL; --", \'address\': "x\' AND userid IS NULL; --"}', 'code:2', '0:00:01', '{"code":1,"msg":"success"}', -1, 61),
	(366, '[模糊测试_name注入攻击1,price参数正确,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price参数正确,address注入攻击1\', \'price\': \'key不传\', \'address\': "x\' AND userid IS NULL; --"}', 'code:2', '0:00:01', '{"code":1,"msg":"success"}', -1, 61),
	(367, '商品列表', '127.0.0.1:8100/myapi/get_shop_list', 'http', 'get', '{}', 'code:1', '0:00:01', '{"code":1,"msg":"success","data":[{"id":0,"name":"\\u624b\\u673a0","price":100},{"id":1,"name":"\\u624b\\u673a1","price":101},{"id":2,"name":"\\u624b\\u673a2","price":102},{"id":3,"name":"\\u624b\\u673a3","price":103},{"id":4,"name":"\\u624b\\u673a4","price":104},{"id":5,"name":"\\u624b\\u673a5","price":105},{"id":6,"name":"\\u624b\\u673a6","price":106},{"id":7,"name":"\\u624b\\u673a7","price":107},{"id":8,"name":"\\u624b\\u673a8","price":108},{"id":9,"name":"\\u624b\\u673a9","price":109}]}', -1, 62),
	(368, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': 100, \'address\': \'北京\'}', 'code:1|msg:success', '0:00:00', '{"code":1,"msg":"success"}', -1, 62),
	(369, '[模糊测试_name参数不传内容,price参数不传内容,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数不传内容,address参数正确\', \'price\': \'\', \'address\': \'北京\'}', 'code:1|msg:success', '0:00:00', '{"code":1,"msg":"success"}', -1, 62),
	(370, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'key不传\', \'address\': \'北京\'}', 'code:1|msg:success', '0:00:00', '{"code":1,"msg":"success"}', -1, 62),
	(371, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'系统生成\', \'address\': \'北京\'}', 'code:1|msg:success', '0:00:00', '{"code":1,"msg":"success"}', -1, 62),
	(372, '[模糊测试_name注入攻击1,price注入攻击1,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price注入攻击1,address参数正确\', \'price\': "x\' AND userid IS NULL; --", \'address\': \'北京\'}', 'code:1|msg:success', '0:00:00', '{"code":1,"msg":"success"}', -1, 62),
	(373, '[模糊测试_name注入攻击1,price参数正确,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price参数正确,address参数不传内容\', \'price\': \'系统生成\', \'address\': \'\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 62),
	(374, '[模糊测试_name参数正确,price参数正确,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数正确,address参数不传内容\', \'price\': \'key不传\', \'address\': \'\'}', 'code:1|msg:success', '0:00:00', '{"code":1,"msg":"success"}', -1, 62),
	(375, '[模糊测试_name参数正确,price参数不传内容,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数不传内容,address参数不传内容\', \'price\': \'\', \'address\': \'\'}', 'code:1|msg:success', '0:00:00', '{"code":1,"msg":"success"}', -1, 62),
	(376, '[模糊测试_name参数不传内容,price参数正确,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数正确,address参数不传内容\', \'price\': 100, \'address\': \'\'}', 'code:1|msg:success', '0:00:00', '{"code":1,"msg":"success"}', -1, 62),
	(377, '[模糊测试_name参数正确,price注入攻击1,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price注入攻击1,address参数不传内容\', \'price\': "x\' AND userid IS NULL; --", \'address\': \'\'}', 'code:1|msg:success', '0:00:00', '{"code":1,"msg":"success"}', -1, 62),
	(378, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'系统生成\', \'address\': \'key不传\'}', 'code:1|msg:success', '0:00:00', '{"code":1,"msg":"success"}', -1, 62),
	(379, '[模糊测试_name参数不传内容,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数正确,address参数正确\', \'price\': \'key不传\', \'address\': \'key不传\'}', 'code:1|msg:success', '0:00:00', '{"code":1,"msg":"success"}', -1, 62),
	(380, '[模糊测试_name参数正确,price注入攻击1,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price注入攻击1,address参数正确\', \'price\': "x\' AND userid IS NULL; --", \'address\': \'key不传\'}', 'code:1|msg:success', '0:00:00', '{"code":1,"msg":"success"}', -1, 62),
	(381, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': 100, \'address\': \'key不传\'}', 'code:1|msg:success', '0:00:00', '{"code":1,"msg":"success"}', -1, 62),
	(382, '[模糊测试_name注入攻击1,price参数不传内容,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price参数不传内容,address参数正确\', \'price\': \'\', \'address\': \'key不传\'}', 'code:1|msg:success', '0:00:00', '{"code":1,"msg":"success"}', -1, 62),
	(383, '[模糊测试_name注入攻击1,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price参数正确,address参数正确\', \'price\': 100, \'address\': \'系统生成\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 62),
	(384, '[模糊测试_name参数正确,price参数不传内容,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数不传内容,address参数正确\', \'price\': \'\', \'address\': \'系统生成\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 62),
	(385, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'系统生成\', \'address\': \'系统生成\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 62),
	(386, '[模糊测试_name参数不传内容,price注入攻击1,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price注入攻击1,address参数正确\', \'price\': "x\' AND userid IS NULL; --", \'address\': \'系统生成\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 62),
	(387, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'key不传\', \'address\': \'系统生成\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 62),
	(388, '[模糊测试_name参数正确,price参数不传内容,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数不传内容,address注入攻击1\', \'price\': \'\', \'address\': "x\' AND userid IS NULL; --"}', 'code:1|msg:success', '0:00:00', '{"code":1,"msg":"success"}', -1, 62),
	(389, '[模糊测试_name参数不传内容,price参数正确,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数正确,address注入攻击1\', \'price\': \'系统生成\', \'address\': "x\' AND userid IS NULL; --"}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 62),
	(390, '[模糊测试_name参数正确,price参数正确,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数正确,address注入攻击1\', \'price\': 100, \'address\': "x\' AND userid IS NULL; --"}', 'code:1|msg:success', '0:00:00', '{"code":1,"msg":"success"}', -1, 62),
	(391, '[模糊测试_name参数正确,price注入攻击1,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price注入攻击1,address注入攻击1\', \'price\': "x\' AND userid IS NULL; --", \'address\': "x\' AND userid IS NULL; --"}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 62),
	(392, '[模糊测试_name注入攻击1,price参数正确,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price参数正确,address注入攻击1\', \'price\': \'key不传\', \'address\': "x\' AND userid IS NULL; --"}', 'code:1|msg:success', '0:00:00', '{"code":1,"msg":"success"}', -1, 62),
	(393, '商品列表', '127.0.0.1:8100/myapi/get_shop_list', 'http', 'get', '{}', 'code:1', '0:00:00', '{"code":1,"msg":"success","data":[{"id":0,"name":"\\u624b\\u673a0","price":100},{"id":1,"name":"\\u624b\\u673a1","price":101},{"id":2,"name":"\\u624b\\u673a2","price":102},{"id":3,"name":"\\u624b\\u673a3","price":103},{"id":4,"name":"\\u624b\\u673a4","price":104},{"id":5,"name":"\\u624b\\u673a5","price":105},{"id":6,"name":"\\u624b\\u673a6","price":106},{"id":7,"name":"\\u624b\\u673a7","price":107},{"id":8,"name":"\\u624b\\u673a8","price":108},{"id":9,"name":"\\u624b\\u673a9","price":109}]}', -1, 63),
	(394, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': 100, \'address\': \'北京\'}', 'code:1|msg:success', '0:00:00', '{"code":1,"msg":"success"}', -1, 63),
	(395, '[模糊测试_name参数不传内容,price参数不传内容,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数不传内容,address参数正确\', \'price\': \'\', \'address\': \'北京\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 63),
	(396, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'key不传\', \'address\': \'北京\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 63),
	(397, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'系统生成\', \'address\': \'北京\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 63),
	(398, '[模糊测试_name注入攻击1,price注入攻击1,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price注入攻击1,address参数正确\', \'price\': "x\' AND userid IS NULL; --", \'address\': \'北京\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 63),
	(399, '[模糊测试_name注入攻击1,price参数正确,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price参数正确,address参数不传内容\', \'price\': \'系统生成\', \'address\': \'\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 63),
	(400, '[模糊测试_name参数正确,price参数正确,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数正确,address参数不传内容\', \'price\': \'key不传\', \'address\': \'\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 63),
	(401, '[模糊测试_name参数正确,price参数不传内容,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数不传内容,address参数不传内容\', \'price\': \'\', \'address\': \'\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 63),
	(402, '[模糊测试_name参数不传内容,price参数正确,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数正确,address参数不传内容\', \'price\': 100, \'address\': \'\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 63),
	(403, '[模糊测试_name参数正确,price注入攻击1,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price注入攻击1,address参数不传内容\', \'price\': "x\' AND userid IS NULL; --", \'address\': \'\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 63),
	(404, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'系统生成\', \'address\': \'key不传\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 63),
	(405, '[模糊测试_name参数不传内容,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数正确,address参数正确\', \'price\': \'key不传\', \'address\': \'key不传\'}', 'code:2', '0:00:01', '{"code":1,"msg":"success"}', -1, 63),
	(406, '[模糊测试_name参数正确,price注入攻击1,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price注入攻击1,address参数正确\', \'price\': "x\' AND userid IS NULL; --", \'address\': \'key不传\'}', 'code:2', '0:00:01', '{"code":1,"msg":"success"}', -1, 63),
	(407, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': 100, \'address\': \'key不传\'}', 'code:2', '0:00:01', '{"code":1,"msg":"success"}', -1, 63),
	(408, '[模糊测试_name注入攻击1,price参数不传内容,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price参数不传内容,address参数正确\', \'price\': \'\', \'address\': \'key不传\'}', 'code:2', '0:00:01', '{"code":1,"msg":"success"}', -1, 63),
	(409, '[模糊测试_name注入攻击1,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price参数正确,address参数正确\', \'price\': 100, \'address\': \'系统生成\'}', 'code:2', '0:00:01', '{"code":1,"msg":"success"}', -1, 63),
	(410, '[模糊测试_name参数正确,price参数不传内容,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数不传内容,address参数正确\', \'price\': \'\', \'address\': \'系统生成\'}', 'code:2', '0:00:01', '{"code":1,"msg":"success"}', -1, 63),
	(411, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'系统生成\', \'address\': \'系统生成\'}', 'code:2', '0:00:01', '{"code":1,"msg":"success"}', -1, 63),
	(412, '[模糊测试_name参数不传内容,price注入攻击1,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price注入攻击1,address参数正确\', \'price\': "x\' AND userid IS NULL; --", \'address\': \'系统生成\'}', 'code:2', '0:00:01', '{"code":1,"msg":"success"}', -1, 63),
	(413, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'key不传\', \'address\': \'系统生成\'}', 'code:2', '0:00:01', '{"code":1,"msg":"success"}', -1, 63),
	(414, '[模糊测试_name参数正确,price参数不传内容,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数不传内容,address注入攻击1\', \'price\': \'\', \'address\': "x\' AND userid IS NULL; --"}', 'code:2', '0:00:01', '{"code":1,"msg":"success"}', -1, 63),
	(415, '[模糊测试_name参数不传内容,price参数正确,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数正确,address注入攻击1\', \'price\': \'系统生成\', \'address\': "x\' AND userid IS NULL; --"}', 'code:2', '0:00:01', '{"code":1,"msg":"success"}', -1, 63),
	(416, '[模糊测试_name参数正确,price参数正确,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数正确,address注入攻击1\', \'price\': 100, \'address\': "x\' AND userid IS NULL; --"}', 'code:2', '0:00:01', '{"code":1,"msg":"success"}', -1, 63),
	(417, '[模糊测试_name参数正确,price注入攻击1,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price注入攻击1,address注入攻击1\', \'price\': "x\' AND userid IS NULL; --", \'address\': "x\' AND userid IS NULL; --"}', 'code:2', '0:00:01', '{"code":1,"msg":"success"}', -1, 63),
	(418, '[模糊测试_name注入攻击1,price参数正确,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price参数正确,address注入攻击1\', \'price\': \'key不传\', \'address\': "x\' AND userid IS NULL; --"}', 'code:2', '0:00:01', '{"code":1,"msg":"success"}', -1, 63),
	(419, '商品列表', '127.0.0.1:8100/myapi/get_shop_list', 'http', 'get', '{}', '"code":1', '0:00:00', '{"code":1,"msg":"success","data":[{"id":0,"name":"\\u624b\\u673a0","price":100},{"id":1,"name":"\\u624b\\u673a1","price":101},{"id":2,"name":"\\u624b\\u673a2","price":102},{"id":3,"name":"\\u624b\\u673a3","price":103},{"id":4,"name":"\\u624b\\u673a4","price":104},{"id":5,"name":"\\u624b\\u673a5","price":105},{"id":6,"name":"\\u624b\\u673a6","price":106},{"id":7,"name":"\\u624b\\u673a7","price":107},{"id":8,"name":"\\u624b\\u673a8","price":108},{"id":9,"name":"\\u624b\\u673a9","price":109}]}', 1, 64),
	(420, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': 100, \'address\': \'北京\'}', '"code":1|"msg":"success"', '0:00:00', '{"code":1,"msg":"success"}', 1, 64),
	(421, '[模糊测试_name参数不传内容,price参数不传内容,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数不传内容,address参数正确\', \'price\': \'\', \'address\': \'北京\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 64),
	(422, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'key不传\', \'address\': \'北京\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 64),
	(423, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'系统生成\', \'address\': \'北京\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 64),
	(424, '[模糊测试_name注入攻击1,price注入攻击1,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price注入攻击1,address参数正确\', \'price\': "x\' AND userid IS NULL; --", \'address\': \'北京\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 64),
	(425, '[模糊测试_name注入攻击1,price参数正确,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price参数正确,address参数不传内容\', \'price\': \'系统生成\', \'address\': \'\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 64),
	(426, '[模糊测试_name参数正确,price参数正确,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数正确,address参数不传内容\', \'price\': \'key不传\', \'address\': \'\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 64),
	(427, '[模糊测试_name参数正确,price参数不传内容,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数不传内容,address参数不传内容\', \'price\': \'\', \'address\': \'\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 64),
	(428, '[模糊测试_name参数不传内容,price参数正确,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数正确,address参数不传内容\', \'price\': 100, \'address\': \'\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 64),
	(429, '[模糊测试_name参数正确,price注入攻击1,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price注入攻击1,address参数不传内容\', \'price\': "x\' AND userid IS NULL; --", \'address\': \'\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 64),
	(430, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'系统生成\', \'address\': \'key不传\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 64),
	(431, '[模糊测试_name参数不传内容,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数正确,address参数正确\', \'price\': \'key不传\', \'address\': \'key不传\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 64),
	(432, '[模糊测试_name参数正确,price注入攻击1,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price注入攻击1,address参数正确\', \'price\': "x\' AND userid IS NULL; --", \'address\': \'key不传\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 64),
	(433, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': 100, \'address\': \'key不传\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 64),
	(434, '[模糊测试_name注入攻击1,price参数不传内容,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price参数不传内容,address参数正确\', \'price\': \'\', \'address\': \'key不传\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 64),
	(435, '[模糊测试_name注入攻击1,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price参数正确,address参数正确\', \'price\': 100, \'address\': \'系统生成\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 64),
	(436, '[模糊测试_name参数正确,price参数不传内容,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数不传内容,address参数正确\', \'price\': \'\', \'address\': \'系统生成\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 64),
	(437, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'系统生成\', \'address\': \'系统生成\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 64),
	(438, '[模糊测试_name参数不传内容,price注入攻击1,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price注入攻击1,address参数正确\', \'price\': "x\' AND userid IS NULL; --", \'address\': \'系统生成\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 64),
	(439, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'key不传\', \'address\': \'系统生成\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 64),
	(440, '[模糊测试_name参数正确,price参数不传内容,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数不传内容,address注入攻击1\', \'price\': \'\', \'address\': "x\' AND userid IS NULL; --"}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 64),
	(441, '[模糊测试_name参数不传内容,price参数正确,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数正确,address注入攻击1\', \'price\': \'系统生成\', \'address\': "x\' AND userid IS NULL; --"}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 64),
	(442, '[模糊测试_name参数正确,price参数正确,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数正确,address注入攻击1\', \'price\': 100, \'address\': "x\' AND userid IS NULL; --"}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 64),
	(443, '[模糊测试_name参数正确,price注入攻击1,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price注入攻击1,address注入攻击1\', \'price\': "x\' AND userid IS NULL; --", \'address\': "x\' AND userid IS NULL; --"}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 64),
	(444, '[模糊测试_name注入攻击1,price参数正确,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price参数正确,address注入攻击1\', \'price\': \'key不传\', \'address\': "x\' AND userid IS NULL; --"}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 64),
	(445, '商品列表', '127.0.0.1:8100/myapi/get_shop_list', 'http', 'get', '{}', '"code":1', '0:00:00', '{"code":1,"msg":"success","data":[{"id":0,"name":"\\u624b\\u673a0","price":100},{"id":1,"name":"\\u624b\\u673a1","price":101},{"id":2,"name":"\\u624b\\u673a2","price":102},{"id":3,"name":"\\u624b\\u673a3","price":103},{"id":4,"name":"\\u624b\\u673a4","price":104},{"id":5,"name":"\\u624b\\u673a5","price":105},{"id":6,"name":"\\u624b\\u673a6","price":106},{"id":7,"name":"\\u624b\\u673a7","price":107},{"id":8,"name":"\\u624b\\u673a8","price":108},{"id":9,"name":"\\u624b\\u673a9","price":109}]}', 1, 65),
	(446, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': 100, \'address\': \'北京\'}', '"code":1|"msg":"success"', '0:00:00', '{"code":1,"msg":"success"}', 1, 65),
	(447, '[模糊测试_name参数不传内容,price参数不传内容,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数不传内容,address参数正确\', \'price\': \'\', \'address\': \'北京\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 65),
	(448, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'key不传\', \'address\': \'北京\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 65),
	(449, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'系统生成\', \'address\': \'北京\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 65),
	(450, '[模糊测试_name注入攻击1,price注入攻击1,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price注入攻击1,address参数正确\', \'price\': "x\' AND userid IS NULL; --", \'address\': \'北京\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 65),
	(451, '[模糊测试_name注入攻击1,price参数正确,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price参数正确,address参数不传内容\', \'price\': \'系统生成\', \'address\': \'\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 65),
	(452, '[模糊测试_name参数正确,price参数正确,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数正确,address参数不传内容\', \'price\': \'key不传\', \'address\': \'\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 65),
	(453, '[模糊测试_name参数正确,price参数不传内容,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数不传内容,address参数不传内容\', \'price\': \'\', \'address\': \'\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 65),
	(454, '[模糊测试_name参数不传内容,price参数正确,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数正确,address参数不传内容\', \'price\': 100, \'address\': \'\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 65),
	(455, '[模糊测试_name参数正确,price注入攻击1,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price注入攻击1,address参数不传内容\', \'price\': "x\' AND userid IS NULL; --", \'address\': \'\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 65),
	(456, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'系统生成\', \'address\': \'key不传\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 65),
	(457, '[模糊测试_name参数不传内容,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数正确,address参数正确\', \'price\': \'key不传\', \'address\': \'key不传\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 65),
	(458, '[模糊测试_name参数正确,price注入攻击1,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price注入攻击1,address参数正确\', \'price\': "x\' AND userid IS NULL; --", \'address\': \'key不传\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 65),
	(459, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': 100, \'address\': \'key不传\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 65),
	(460, '[模糊测试_name注入攻击1,price参数不传内容,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price参数不传内容,address参数正确\', \'price\': \'\', \'address\': \'key不传\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 65),
	(461, '[模糊测试_name注入攻击1,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price参数正确,address参数正确\', \'price\': 100, \'address\': \'系统生成\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 65),
	(462, '[模糊测试_name参数正确,price参数不传内容,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数不传内容,address参数正确\', \'price\': \'\', \'address\': \'系统生成\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 65),
	(463, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'系统生成\', \'address\': \'系统生成\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 65),
	(464, '[模糊测试_name参数不传内容,price注入攻击1,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price注入攻击1,address参数正确\', \'price\': "x\' AND userid IS NULL; --", \'address\': \'系统生成\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 65),
	(465, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'key不传\', \'address\': \'系统生成\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 65),
	(466, '[模糊测试_name参数正确,price参数不传内容,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数不传内容,address注入攻击1\', \'price\': \'\', \'address\': "x\' AND userid IS NULL; --"}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 65),
	(467, '[模糊测试_name参数不传内容,price参数正确,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数正确,address注入攻击1\', \'price\': \'系统生成\', \'address\': "x\' AND userid IS NULL; --"}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 65),
	(468, '[模糊测试_name参数正确,price参数正确,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数正确,address注入攻击1\', \'price\': 100, \'address\': "x\' AND userid IS NULL; --"}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 65),
	(469, '[模糊测试_name参数正确,price注入攻击1,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price注入攻击1,address注入攻击1\', \'price\': "x\' AND userid IS NULL; --", \'address\': "x\' AND userid IS NULL; --"}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 65),
	(470, '[模糊测试_name注入攻击1,price参数正确,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price参数正确,address注入攻击1\', \'price\': \'key不传\', \'address\': "x\' AND userid IS NULL; --"}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 65),
	(471, '商品列表', '127.0.0.1:8100/myapi/get_shop_list', 'http', 'get', '{}', '"code":1', '0:00:00', '{"code":1,"msg":"success","data":[{"id":0,"name":"\\u624b\\u673a0","price":100},{"id":1,"name":"\\u624b\\u673a1","price":101},{"id":2,"name":"\\u624b\\u673a2","price":102},{"id":3,"name":"\\u624b\\u673a3","price":103},{"id":4,"name":"\\u624b\\u673a4","price":104},{"id":5,"name":"\\u624b\\u673a5","price":105},{"id":6,"name":"\\u624b\\u673a6","price":106},{"id":7,"name":"\\u624b\\u673a7","price":107},{"id":8,"name":"\\u624b\\u673a8","price":108},{"id":9,"name":"\\u624b\\u673a9","price":109}]}', 1, 66),
	(472, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': 100, \'address\': \'北京\'}', '"code":1|"msg":"success"', '0:00:00', '{"code":1,"msg":"success"}', 1, 66),
	(473, '[模糊测试_name参数不传内容,price参数不传内容,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数不传内容,address参数正确\', \'price\': \'\', \'address\': \'北京\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 66),
	(474, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'key不传\', \'address\': \'北京\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 66),
	(475, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'系统生成\', \'address\': \'北京\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 66),
	(476, '[模糊测试_name注入攻击1,price注入攻击1,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price注入攻击1,address参数正确\', \'price\': "x\' AND userid IS NULL; --", \'address\': \'北京\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 66),
	(477, '[模糊测试_name注入攻击1,price参数正确,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price参数正确,address参数不传内容\', \'price\': \'系统生成\', \'address\': \'\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 66),
	(478, '[模糊测试_name参数正确,price参数正确,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数正确,address参数不传内容\', \'price\': \'key不传\', \'address\': \'\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 66),
	(479, '[模糊测试_name参数正确,price参数不传内容,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数不传内容,address参数不传内容\', \'price\': \'\', \'address\': \'\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 66),
	(480, '[模糊测试_name参数不传内容,price参数正确,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数正确,address参数不传内容\', \'price\': 100, \'address\': \'\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 66),
	(481, '[模糊测试_name参数正确,price注入攻击1,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price注入攻击1,address参数不传内容\', \'price\': "x\' AND userid IS NULL; --", \'address\': \'\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 66),
	(482, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'系统生成\', \'address\': \'key不传\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 66),
	(483, '[模糊测试_name参数不传内容,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数正确,address参数正确\', \'price\': \'key不传\', \'address\': \'key不传\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 66),
	(484, '[模糊测试_name参数正确,price注入攻击1,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price注入攻击1,address参数正确\', \'price\': "x\' AND userid IS NULL; --", \'address\': \'key不传\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 66),
	(485, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': 100, \'address\': \'key不传\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 66),
	(486, '[模糊测试_name注入攻击1,price参数不传内容,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price参数不传内容,address参数正确\', \'price\': \'\', \'address\': \'key不传\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 66),
	(487, '[模糊测试_name注入攻击1,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price参数正确,address参数正确\', \'price\': 100, \'address\': \'系统生成\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 66),
	(488, '[模糊测试_name参数正确,price参数不传内容,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数不传内容,address参数正确\', \'price\': \'\', \'address\': \'系统生成\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 66),
	(489, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'系统生成\', \'address\': \'系统生成\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 66),
	(490, '[模糊测试_name参数不传内容,price注入攻击1,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price注入攻击1,address参数正确\', \'price\': "x\' AND userid IS NULL; --", \'address\': \'系统生成\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 66),
	(491, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'key不传\', \'address\': \'系统生成\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 66),
	(492, '[模糊测试_name参数正确,price参数不传内容,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数不传内容,address注入攻击1\', \'price\': \'\', \'address\': "x\' AND userid IS NULL; --"}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 66),
	(493, '[模糊测试_name参数不传内容,price参数正确,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数正确,address注入攻击1\', \'price\': \'系统生成\', \'address\': "x\' AND userid IS NULL; --"}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 66),
	(494, '[模糊测试_name参数正确,price参数正确,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数正确,address注入攻击1\', \'price\': 100, \'address\': "x\' AND userid IS NULL; --"}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 66),
	(495, '[模糊测试_name参数正确,price注入攻击1,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price注入攻击1,address注入攻击1\', \'price\': "x\' AND userid IS NULL; --", \'address\': "x\' AND userid IS NULL; --"}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 66),
	(496, '[模糊测试_name注入攻击1,price参数正确,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price参数正确,address注入攻击1\', \'price\': \'key不传\', \'address\': "x\' AND userid IS NULL; --"}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 66),
	(497, '商品列表', '127.0.0.1:8100/myapi/get_shop_list', 'http', 'get', '{}', '"code":1', '0:00:00', '{"code":1,"msg":"success","data":[{"id":0,"name":"\\u624b\\u673a0","price":100},{"id":1,"name":"\\u624b\\u673a1","price":101},{"id":2,"name":"\\u624b\\u673a2","price":102},{"id":3,"name":"\\u624b\\u673a3","price":103},{"id":4,"name":"\\u624b\\u673a4","price":104},{"id":5,"name":"\\u624b\\u673a5","price":105},{"id":6,"name":"\\u624b\\u673a6","price":106},{"id":7,"name":"\\u624b\\u673a7","price":107},{"id":8,"name":"\\u624b\\u673a8","price":108},{"id":9,"name":"\\u624b\\u673a9","price":109}]}', 1, 67),
	(498, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': 100, \'address\': \'北京\'}', '"code":1|"msg":"success"', '0:00:00', '{"code":1,"msg":"success"}', 1, 67),
	(499, '[模糊测试_name参数不传内容,price参数不传内容,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数不传内容,address参数正确\', \'price\': \'\', \'address\': \'北京\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 67),
	(500, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'key不传\', \'address\': \'北京\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 67),
	(501, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'系统生成\', \'address\': \'北京\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 67),
	(502, '[模糊测试_name注入攻击1,price注入攻击1,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price注入攻击1,address参数正确\', \'price\': "x\' AND userid IS NULL; --", \'address\': \'北京\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 67),
	(503, '[模糊测试_name注入攻击1,price参数正确,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price参数正确,address参数不传内容\', \'price\': \'系统生成\', \'address\': \'\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 67),
	(504, '[模糊测试_name参数正确,price参数正确,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数正确,address参数不传内容\', \'price\': \'key不传\', \'address\': \'\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 67),
	(505, '[模糊测试_name参数正确,price参数不传内容,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数不传内容,address参数不传内容\', \'price\': \'\', \'address\': \'\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 67),
	(506, '[模糊测试_name参数不传内容,price参数正确,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数正确,address参数不传内容\', \'price\': 100, \'address\': \'\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 67),
	(507, '[模糊测试_name参数正确,price注入攻击1,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price注入攻击1,address参数不传内容\', \'price\': "x\' AND userid IS NULL; --", \'address\': \'\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 67),
	(508, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'系统生成\', \'address\': \'key不传\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 67),
	(509, '[模糊测试_name参数不传内容,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数正确,address参数正确\', \'price\': \'key不传\', \'address\': \'key不传\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 67),
	(510, '[模糊测试_name参数正确,price注入攻击1,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price注入攻击1,address参数正确\', \'price\': "x\' AND userid IS NULL; --", \'address\': \'key不传\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 67),
	(511, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': 100, \'address\': \'key不传\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 67),
	(512, '[模糊测试_name注入攻击1,price参数不传内容,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price参数不传内容,address参数正确\', \'price\': \'\', \'address\': \'key不传\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 67),
	(513, '[模糊测试_name注入攻击1,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price参数正确,address参数正确\', \'price\': 100, \'address\': \'系统生成\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 67),
	(514, '[模糊测试_name参数正确,price参数不传内容,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数不传内容,address参数正确\', \'price\': \'\', \'address\': \'系统生成\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 67),
	(515, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'系统生成\', \'address\': \'系统生成\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 67),
	(516, '[模糊测试_name参数不传内容,price注入攻击1,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price注入攻击1,address参数正确\', \'price\': "x\' AND userid IS NULL; --", \'address\': \'系统生成\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 67),
	(517, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'key不传\', \'address\': \'系统生成\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 67),
	(518, '[模糊测试_name参数正确,price参数不传内容,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数不传内容,address注入攻击1\', \'price\': \'\', \'address\': "x\' AND userid IS NULL; --"}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 67),
	(519, '[模糊测试_name参数不传内容,price参数正确,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数正确,address注入攻击1\', \'price\': \'系统生成\', \'address\': "x\' AND userid IS NULL; --"}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 67),
	(520, '[模糊测试_name参数正确,price参数正确,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数正确,address注入攻击1\', \'price\': 100, \'address\': "x\' AND userid IS NULL; --"}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 67),
	(521, '[模糊测试_name参数正确,price注入攻击1,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price注入攻击1,address注入攻击1\', \'price\': "x\' AND userid IS NULL; --", \'address\': "x\' AND userid IS NULL; --"}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 67),
	(522, '[模糊测试_name注入攻击1,price参数正确,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price参数正确,address注入攻击1\', \'price\': \'key不传\', \'address\': "x\' AND userid IS NULL; --"}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 67),
	(523, '商品列表', '127.0.0.1:8100/myapi/get_shop_list', 'http', 'get', '{}', '"code":1', '0:00:00', '{"code":1,"msg":"success","data":[{"id":0,"name":"\\u624b\\u673a0","price":100},{"id":1,"name":"\\u624b\\u673a1","price":101},{"id":2,"name":"\\u624b\\u673a2","price":102},{"id":3,"name":"\\u624b\\u673a3","price":103},{"id":4,"name":"\\u624b\\u673a4","price":104},{"id":5,"name":"\\u624b\\u673a5","price":105},{"id":6,"name":"\\u624b\\u673a6","price":106},{"id":7,"name":"\\u624b\\u673a7","price":107},{"id":8,"name":"\\u624b\\u673a8","price":108},{"id":9,"name":"\\u624b\\u673a9","price":109}]}', 1, 68),
	(524, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': 100, \'address\': \'北京\'}', '"code":1|"msg":"success"', '0:00:00', '{"code":1,"msg":"success"}', 1, 68),
	(525, '[模糊测试_name参数不传内容,price参数不传内容,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数不传内容,address参数正确\', \'price\': \'\', \'address\': \'北京\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 68),
	(526, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'key不传\', \'address\': \'北京\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 68),
	(527, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'系统生成\', \'address\': \'北京\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 68),
	(528, '[模糊测试_name注入攻击1,price注入攻击1,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price注入攻击1,address参数正确\', \'price\': "x\' AND userid IS NULL; --", \'address\': \'北京\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 68),
	(529, '[模糊测试_name注入攻击1,price参数正确,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price参数正确,address参数不传内容\', \'price\': \'系统生成\', \'address\': \'\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 68),
	(530, '[模糊测试_name参数正确,price参数正确,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数正确,address参数不传内容\', \'price\': \'key不传\', \'address\': \'\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 68),
	(531, '[模糊测试_name参数正确,price参数不传内容,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数不传内容,address参数不传内容\', \'price\': \'\', \'address\': \'\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 68),
	(532, '[模糊测试_name参数不传内容,price参数正确,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数正确,address参数不传内容\', \'price\': 100, \'address\': \'\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 68),
	(533, '[模糊测试_name参数正确,price注入攻击1,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price注入攻击1,address参数不传内容\', \'price\': "x\' AND userid IS NULL; --", \'address\': \'\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 68),
	(534, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'系统生成\', \'address\': \'key不传\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 68),
	(535, '[模糊测试_name参数不传内容,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数正确,address参数正确\', \'price\': \'key不传\', \'address\': \'key不传\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 68),
	(536, '[模糊测试_name参数正确,price注入攻击1,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price注入攻击1,address参数正确\', \'price\': "x\' AND userid IS NULL; --", \'address\': \'key不传\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 68),
	(537, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': 100, \'address\': \'key不传\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 68),
	(538, '[模糊测试_name注入攻击1,price参数不传内容,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price参数不传内容,address参数正确\', \'price\': \'\', \'address\': \'key不传\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 68),
	(539, '[模糊测试_name注入攻击1,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price参数正确,address参数正确\', \'price\': 100, \'address\': \'系统生成\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 68),
	(540, '[模糊测试_name参数正确,price参数不传内容,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数不传内容,address参数正确\', \'price\': \'\', \'address\': \'系统生成\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 68),
	(541, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'系统生成\', \'address\': \'系统生成\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 68),
	(542, '[模糊测试_name参数不传内容,price注入攻击1,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price注入攻击1,address参数正确\', \'price\': "x\' AND userid IS NULL; --", \'address\': \'系统生成\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 68),
	(543, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'key不传\', \'address\': \'系统生成\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 68),
	(544, '[模糊测试_name参数正确,price参数不传内容,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数不传内容,address注入攻击1\', \'price\': \'\', \'address\': "x\' AND userid IS NULL; --"}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 68),
	(545, '[模糊测试_name参数不传内容,price参数正确,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数正确,address注入攻击1\', \'price\': \'系统生成\', \'address\': "x\' AND userid IS NULL; --"}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 68),
	(546, '[模糊测试_name参数正确,price参数正确,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数正确,address注入攻击1\', \'price\': 100, \'address\': "x\' AND userid IS NULL; --"}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 68),
	(547, '[模糊测试_name参数正确,price注入攻击1,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price注入攻击1,address注入攻击1\', \'price\': "x\' AND userid IS NULL; --", \'address\': "x\' AND userid IS NULL; --"}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 68),
	(548, '[模糊测试_name注入攻击1,price参数正确,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price参数正确,address注入攻击1\', \'price\': \'key不传\', \'address\': "x\' AND userid IS NULL; --"}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 68),
	(549, '商品列表', '127.0.0.1:8100/myapi/get_shop_list', 'http', 'get', '{}', '"code":1', '0:00:00', '{"code":1,"msg":"success","data":[{"id":0,"name":"\\u624b\\u673a0","price":100},{"id":1,"name":"\\u624b\\u673a1","price":101},{"id":2,"name":"\\u624b\\u673a2","price":102},{"id":3,"name":"\\u624b\\u673a3","price":103},{"id":4,"name":"\\u624b\\u673a4","price":104},{"id":5,"name":"\\u624b\\u673a5","price":105},{"id":6,"name":"\\u624b\\u673a6","price":106},{"id":7,"name":"\\u624b\\u673a7","price":107},{"id":8,"name":"\\u624b\\u673a8","price":108},{"id":9,"name":"\\u624b\\u673a9","price":109}]}', 1, 69),
	(550, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': 100, \'address\': \'北京\'}', '"code":1|"msg":"success"', '0:00:00', '{"code":1,"msg":"success"}', 1, 69),
	(551, '[模糊测试_name参数不传内容,price参数不传内容,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数不传内容,address参数正确\', \'price\': \'\', \'address\': \'北京\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 69),
	(552, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'key不传\', \'address\': \'北京\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 69),
	(553, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'系统生成\', \'address\': \'北京\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 69),
	(554, '[模糊测试_name注入攻击1,price注入攻击1,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price注入攻击1,address参数正确\', \'price\': "x\' AND userid IS NULL; --", \'address\': \'北京\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 69),
	(555, '[模糊测试_name注入攻击1,price参数正确,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price参数正确,address参数不传内容\', \'price\': \'系统生成\', \'address\': \'\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 69),
	(556, '[模糊测试_name参数正确,price参数正确,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数正确,address参数不传内容\', \'price\': \'key不传\', \'address\': \'\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 69),
	(557, '[模糊测试_name参数正确,price参数不传内容,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数不传内容,address参数不传内容\', \'price\': \'\', \'address\': \'\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 69),
	(558, '[模糊测试_name参数不传内容,price参数正确,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数正确,address参数不传内容\', \'price\': 100, \'address\': \'\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 69),
	(559, '[模糊测试_name参数正确,price注入攻击1,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price注入攻击1,address参数不传内容\', \'price\': "x\' AND userid IS NULL; --", \'address\': \'\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 69),
	(560, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'系统生成\', \'address\': \'key不传\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 69),
	(561, '[模糊测试_name参数不传内容,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数正确,address参数正确\', \'price\': \'key不传\', \'address\': \'key不传\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 69),
	(562, '[模糊测试_name参数正确,price注入攻击1,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price注入攻击1,address参数正确\', \'price\': "x\' AND userid IS NULL; --", \'address\': \'key不传\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 69),
	(563, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': 100, \'address\': \'key不传\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 69),
	(564, '[模糊测试_name注入攻击1,price参数不传内容,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price参数不传内容,address参数正确\', \'price\': \'\', \'address\': \'key不传\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 69),
	(565, '[模糊测试_name注入攻击1,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price参数正确,address参数正确\', \'price\': 100, \'address\': \'系统生成\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 69),
	(566, '[模糊测试_name参数正确,price参数不传内容,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数不传内容,address参数正确\', \'price\': \'\', \'address\': \'系统生成\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 69),
	(567, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'系统生成\', \'address\': \'系统生成\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 69),
	(568, '[模糊测试_name参数不传内容,price注入攻击1,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price注入攻击1,address参数正确\', \'price\': "x\' AND userid IS NULL; --", \'address\': \'系统生成\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 69),
	(569, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'key不传\', \'address\': \'系统生成\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 69),
	(570, '[模糊测试_name参数正确,price参数不传内容,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数不传内容,address注入攻击1\', \'price\': \'\', \'address\': "x\' AND userid IS NULL; --"}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 69),
	(571, '[模糊测试_name参数不传内容,price参数正确,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数正确,address注入攻击1\', \'price\': \'系统生成\', \'address\': "x\' AND userid IS NULL; --"}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 69),
	(572, '[模糊测试_name参数正确,price参数正确,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数正确,address注入攻击1\', \'price\': 100, \'address\': "x\' AND userid IS NULL; --"}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', 1, 69),
	(573, '[模糊测试_name参数正确,price注入攻击1,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price注入攻击1,address注入攻击1\', \'price\': "x\' AND userid IS NULL; --", \'address\': "x\' AND userid IS NULL; --"}', 'code:2', '0:00:01', '{"code":1,"msg":"success"}', 1, 69),
	(574, '[模糊测试_name注入攻击1,price参数正确,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price参数正确,address注入攻击1\', \'price\': \'key不传\', \'address\': "x\' AND userid IS NULL; --"}', 'code:2', '0:00:01', '{"code":1,"msg":"success"}', 1, 69),
	(575, '商品列表', '127.0.0.1:8100/myapi/get_shop_list', 'http', 'get', '{}', '"code":1', '0:00:00', '{"code":1,"msg":"success","data":[{"id":0,"name":"\\u624b\\u673a0","price":100},{"id":1,"name":"\\u624b\\u673a1","price":101},{"id":2,"name":"\\u624b\\u673a2","price":102},{"id":3,"name":"\\u624b\\u673a3","price":103},{"id":4,"name":"\\u624b\\u673a4","price":104},{"id":5,"name":"\\u624b\\u673a5","price":105},{"id":6,"name":"\\u624b\\u673a6","price":106},{"id":7,"name":"\\u624b\\u673a7","price":107},{"id":8,"name":"\\u624b\\u673a8","price":108},{"id":9,"name":"\\u624b\\u673a9","price":109}]}', 1, 70),
	(576, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': 100, \'address\': \'北京\'}', '"code":1|"msg":"success"', '0:00:00', '{"code":1,"msg":"success"}', 1, 70),
	(577, '[模糊测试_name参数不传内容,price参数不传内容,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数不传内容,address参数正确\', \'price\': \'\', \'address\': \'北京\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 70),
	(578, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'key不传\', \'address\': \'北京\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 70),
	(579, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'系统生成\', \'address\': \'北京\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 70),
	(580, '[模糊测试_name注入攻击1,price注入攻击1,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price注入攻击1,address参数正确\', \'price\': "x\' AND userid IS NULL; --", \'address\': \'北京\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 70),
	(581, '[模糊测试_name注入攻击1,price参数正确,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price参数正确,address参数不传内容\', \'price\': \'系统生成\', \'address\': \'\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 70),
	(582, '[模糊测试_name参数正确,price参数正确,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数正确,address参数不传内容\', \'price\': \'key不传\', \'address\': \'\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 70),
	(583, '[模糊测试_name参数正确,price参数不传内容,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数不传内容,address参数不传内容\', \'price\': \'\', \'address\': \'\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 70),
	(584, '[模糊测试_name参数不传内容,price参数正确,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数正确,address参数不传内容\', \'price\': 100, \'address\': \'\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 70),
	(585, '[模糊测试_name参数正确,price注入攻击1,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price注入攻击1,address参数不传内容\', \'price\': "x\' AND userid IS NULL; --", \'address\': \'\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 70),
	(586, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'系统生成\', \'address\': \'key不传\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 70),
	(587, '[模糊测试_name参数不传内容,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数正确,address参数正确\', \'price\': \'key不传\', \'address\': \'key不传\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 70),
	(588, '[模糊测试_name参数正确,price注入攻击1,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price注入攻击1,address参数正确\', \'price\': "x\' AND userid IS NULL; --", \'address\': \'key不传\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 70),
	(589, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': 100, \'address\': \'key不传\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 70),
	(590, '[模糊测试_name注入攻击1,price参数不传内容,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price参数不传内容,address参数正确\', \'price\': \'\', \'address\': \'key不传\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 70),
	(591, '[模糊测试_name注入攻击1,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price参数正确,address参数正确\', \'price\': 100, \'address\': \'系统生成\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 70),
	(592, '[模糊测试_name参数正确,price参数不传内容,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数不传内容,address参数正确\', \'price\': \'\', \'address\': \'系统生成\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 70),
	(593, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'系统生成\', \'address\': \'系统生成\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 70),
	(594, '[模糊测试_name参数不传内容,price注入攻击1,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price注入攻击1,address参数正确\', \'price\': "x\' AND userid IS NULL; --", \'address\': \'系统生成\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 70),
	(595, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'key不传\', \'address\': \'系统生成\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 70),
	(596, '[模糊测试_name参数正确,price参数不传内容,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数不传内容,address注入攻击1\', \'price\': \'\', \'address\': "x\' AND userid IS NULL; --"}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 70),
	(597, '[模糊测试_name参数不传内容,price参数正确,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数正确,address注入攻击1\', \'price\': \'系统生成\', \'address\': "x\' AND userid IS NULL; --"}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 70),
	(598, '[模糊测试_name参数正确,price参数正确,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数正确,address注入攻击1\', \'price\': 100, \'address\': "x\' AND userid IS NULL; --"}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 70),
	(599, '[模糊测试_name参数正确,price注入攻击1,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price注入攻击1,address注入攻击1\', \'price\': "x\' AND userid IS NULL; --", \'address\': "x\' AND userid IS NULL; --"}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 70),
	(600, '[模糊测试_name注入攻击1,price参数正确,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price参数正确,address注入攻击1\', \'price\': \'key不传\', \'address\': "x\' AND userid IS NULL; --"}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 70),
	(601, '商品列表', '127.0.0.1:8100/myapi/get_shop_list', 'http', 'get', '{}', '"code":1', '0:00:00', '{"code":1,"msg":"success","data":[{"id":0,"name":"\\u624b\\u673a0","price":100},{"id":1,"name":"\\u624b\\u673a1","price":101},{"id":2,"name":"\\u624b\\u673a2","price":102},{"id":3,"name":"\\u624b\\u673a3","price":103},{"id":4,"name":"\\u624b\\u673a4","price":104},{"id":5,"name":"\\u624b\\u673a5","price":105},{"id":6,"name":"\\u624b\\u673a6","price":106},{"id":7,"name":"\\u624b\\u673a7","price":107},{"id":8,"name":"\\u624b\\u673a8","price":108},{"id":9,"name":"\\u624b\\u673a9","price":109}]}', 1, 71),
	(602, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': 100, \'address\': \'北京\'}', '"code":1|"msg":"success"', '0:00:00', '{"code":1,"msg":"success"}', 1, 71),
	(603, '[模糊测试_name参数不传内容,price参数不传内容,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数不传内容,address参数正确\', \'price\': \'\', \'address\': \'北京\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 71),
	(604, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'key不传\', \'address\': \'北京\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 71),
	(605, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'系统生成\', \'address\': \'北京\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 71),
	(606, '[模糊测试_name注入攻击1,price注入攻击1,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price注入攻击1,address参数正确\', \'price\': "x\' AND userid IS NULL; --", \'address\': \'北京\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 71),
	(607, '[模糊测试_name注入攻击1,price参数正确,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price参数正确,address参数不传内容\', \'price\': \'系统生成\', \'address\': \'\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 71),
	(608, '[模糊测试_name参数正确,price参数正确,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数正确,address参数不传内容\', \'price\': \'key不传\', \'address\': \'\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 71),
	(609, '[模糊测试_name参数正确,price参数不传内容,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数不传内容,address参数不传内容\', \'price\': \'\', \'address\': \'\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 71),
	(610, '[模糊测试_name参数不传内容,price参数正确,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数正确,address参数不传内容\', \'price\': 100, \'address\': \'\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 71),
	(611, '[模糊测试_name参数正确,price注入攻击1,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price注入攻击1,address参数不传内容\', \'price\': "x\' AND userid IS NULL; --", \'address\': \'\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 71),
	(612, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'系统生成\', \'address\': \'key不传\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 71),
	(613, '[模糊测试_name参数不传内容,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数正确,address参数正确\', \'price\': \'key不传\', \'address\': \'key不传\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 71),
	(614, '[模糊测试_name参数正确,price注入攻击1,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price注入攻击1,address参数正确\', \'price\': "x\' AND userid IS NULL; --", \'address\': \'key不传\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 71),
	(615, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': 100, \'address\': \'key不传\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 71),
	(616, '[模糊测试_name注入攻击1,price参数不传内容,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price参数不传内容,address参数正确\', \'price\': \'\', \'address\': \'key不传\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 71),
	(617, '[模糊测试_name注入攻击1,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price参数正确,address参数正确\', \'price\': 100, \'address\': \'系统生成\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 71),
	(618, '[模糊测试_name参数正确,price参数不传内容,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数不传内容,address参数正确\', \'price\': \'\', \'address\': \'系统生成\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 71),
	(619, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'系统生成\', \'address\': \'系统生成\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 71),
	(620, '[模糊测试_name参数不传内容,price注入攻击1,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price注入攻击1,address参数正确\', \'price\': "x\' AND userid IS NULL; --", \'address\': \'系统生成\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 71),
	(621, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'key不传\', \'address\': \'系统生成\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 71),
	(622, '[模糊测试_name参数正确,price参数不传内容,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数不传内容,address注入攻击1\', \'price\': \'\', \'address\': "x\' AND userid IS NULL; --"}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 71),
	(623, '[模糊测试_name参数不传内容,price参数正确,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数正确,address注入攻击1\', \'price\': \'系统生成\', \'address\': "x\' AND userid IS NULL; --"}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 71),
	(624, '[模糊测试_name参数正确,price参数正确,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数正确,address注入攻击1\', \'price\': 100, \'address\': "x\' AND userid IS NULL; --"}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 71),
	(625, '[模糊测试_name参数正确,price注入攻击1,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price注入攻击1,address注入攻击1\', \'price\': "x\' AND userid IS NULL; --", \'address\': "x\' AND userid IS NULL; --"}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 71),
	(626, '[模糊测试_name注入攻击1,price参数正确,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price参数正确,address注入攻击1\', \'price\': \'key不传\', \'address\': "x\' AND userid IS NULL; --"}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 71),
	(627, '商品列表', '127.0.0.1:8100/myapi/get_shop_list', 'http', 'get', '{}', '"code":1', '0:00:00', '{"code":1,"msg":"success","data":[{"id":0,"name":"\\u624b\\u673a0","price":100},{"id":1,"name":"\\u624b\\u673a1","price":101},{"id":2,"name":"\\u624b\\u673a2","price":102},{"id":3,"name":"\\u624b\\u673a3","price":103},{"id":4,"name":"\\u624b\\u673a4","price":104},{"id":5,"name":"\\u624b\\u673a5","price":105},{"id":6,"name":"\\u624b\\u673a6","price":106},{"id":7,"name":"\\u624b\\u673a7","price":107},{"id":8,"name":"\\u624b\\u673a8","price":108},{"id":9,"name":"\\u624b\\u673a9","price":109}]}', 1, 72),
	(628, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': 100, \'address\': \'北京\'}', '"code":1|"msg":"success"', '0:00:00', '{"code":1,"msg":"success"}', 1, 72),
	(629, '[模糊测试_name参数不传内容,price参数不传内容,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数不传内容,address参数正确\', \'price\': \'\', \'address\': \'北京\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 72),
	(630, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'key不传\', \'address\': \'北京\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 72),
	(631, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'系统生成\', \'address\': \'北京\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 72),
	(632, '[模糊测试_name注入攻击1,price注入攻击1,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price注入攻击1,address参数正确\', \'price\': "x\' AND userid IS NULL; --", \'address\': \'北京\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 72),
	(633, '[模糊测试_name注入攻击1,price参数正确,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price参数正确,address参数不传内容\', \'price\': \'系统生成\', \'address\': \'\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 72),
	(634, '[模糊测试_name参数正确,price参数正确,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数正确,address参数不传内容\', \'price\': \'key不传\', \'address\': \'\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 72),
	(635, '[模糊测试_name参数正确,price参数不传内容,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数不传内容,address参数不传内容\', \'price\': \'\', \'address\': \'\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 72),
	(636, '[模糊测试_name参数不传内容,price参数正确,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数正确,address参数不传内容\', \'price\': 100, \'address\': \'\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 72),
	(637, '[模糊测试_name参数正确,price注入攻击1,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price注入攻击1,address参数不传内容\', \'price\': "x\' AND userid IS NULL; --", \'address\': \'\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 72),
	(638, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'系统生成\', \'address\': \'key不传\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 72),
	(639, '[模糊测试_name参数不传内容,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数正确,address参数正确\', \'price\': \'key不传\', \'address\': \'key不传\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 72),
	(640, '[模糊测试_name参数正确,price注入攻击1,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price注入攻击1,address参数正确\', \'price\': "x\' AND userid IS NULL; --", \'address\': \'key不传\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 72),
	(641, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': 100, \'address\': \'key不传\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 72),
	(642, '[模糊测试_name注入攻击1,price参数不传内容,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price参数不传内容,address参数正确\', \'price\': \'\', \'address\': \'key不传\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 72),
	(643, '[模糊测试_name注入攻击1,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price参数正确,address参数正确\', \'price\': 100, \'address\': \'系统生成\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 72),
	(644, '[模糊测试_name参数正确,price参数不传内容,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数不传内容,address参数正确\', \'price\': \'\', \'address\': \'系统生成\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 72),
	(645, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'系统生成\', \'address\': \'系统生成\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 72),
	(646, '[模糊测试_name参数不传内容,price注入攻击1,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price注入攻击1,address参数正确\', \'price\': "x\' AND userid IS NULL; --", \'address\': \'系统生成\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 72),
	(647, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'key不传\', \'address\': \'系统生成\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 72),
	(648, '[模糊测试_name参数正确,price参数不传内容,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数不传内容,address注入攻击1\', \'price\': \'\', \'address\': "x\' AND userid IS NULL; --"}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 72),
	(649, '[模糊测试_name参数不传内容,price参数正确,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数正确,address注入攻击1\', \'price\': \'系统生成\', \'address\': "x\' AND userid IS NULL; --"}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 72),
	(650, '[模糊测试_name参数正确,price参数正确,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数正确,address注入攻击1\', \'price\': 100, \'address\': "x\' AND userid IS NULL; --"}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 72),
	(651, '[模糊测试_name参数正确,price注入攻击1,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price注入攻击1,address注入攻击1\', \'price\': "x\' AND userid IS NULL; --", \'address\': "x\' AND userid IS NULL; --"}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 72),
	(652, '[模糊测试_name注入攻击1,price参数正确,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price参数正确,address注入攻击1\', \'price\': \'key不传\', \'address\': "x\' AND userid IS NULL; --"}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 72),
	(653, '商品列表', '127.0.0.1:8100/myapi/get_shop_list', 'http', 'get', '{}', '"code":1', '0:00:00', '{"code":1,"msg":"success","data":[{"id":0,"name":"\\u624b\\u673a0","price":100},{"id":1,"name":"\\u624b\\u673a1","price":101},{"id":2,"name":"\\u624b\\u673a2","price":102},{"id":3,"name":"\\u624b\\u673a3","price":103},{"id":4,"name":"\\u624b\\u673a4","price":104},{"id":5,"name":"\\u624b\\u673a5","price":105},{"id":6,"name":"\\u624b\\u673a6","price":106},{"id":7,"name":"\\u624b\\u673a7","price":107},{"id":8,"name":"\\u624b\\u673a8","price":108},{"id":9,"name":"\\u624b\\u673a9","price":109}]}', 1, 73),
	(654, '添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'price\': 100, \'address\': \'北京\'}', '"code":1|"msg":"success"', '0:00:00', '{"code":1,"msg":"success"}', 1, 73),
	(655, '商品列表', '127.0.0.1:8100/myapi/get_shop_list', 'http', 'get', '{}', '"code":1', '0:00:00', '{"code":1,"msg":"success","data":[{"id":0,"name":"\\u624b\\u673a0","price":100},{"id":1,"name":"\\u624b\\u673a1","price":101},{"id":2,"name":"\\u624b\\u673a2","price":102},{"id":3,"name":"\\u624b\\u673a3","price":103},{"id":4,"name":"\\u624b\\u673a4","price":104},{"id":5,"name":"\\u624b\\u673a5","price":105},{"id":6,"name":"\\u624b\\u673a6","price":106},{"id":7,"name":"\\u624b\\u673a7","price":107},{"id":8,"name":"\\u624b\\u673a8","price":108},{"id":9,"name":"\\u624b\\u673a9","price":109}]}', 1, 74),
	(656, '添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'price\': 100, \'address\': \'北京\'}', '"code":1|"msg":"success"', '0:00:00', '{"code":1,"msg":"success"}', 1, 74),
	(657, '商品列表', '127.0.0.1:8100/myapi/get_shop_list', 'http', 'get', '{}', '"code":1', '0:00:00', '{"code":1,"msg":"success","data":[{"id":0,"name":"\\u624b\\u673a0","price":100},{"id":1,"name":"\\u624b\\u673a1","price":101},{"id":2,"name":"\\u624b\\u673a2","price":102},{"id":3,"name":"\\u624b\\u673a3","price":103},{"id":4,"name":"\\u624b\\u673a4","price":104},{"id":5,"name":"\\u624b\\u673a5","price":105},{"id":6,"name":"\\u624b\\u673a6","price":106},{"id":7,"name":"\\u624b\\u673a7","price":107},{"id":8,"name":"\\u624b\\u673a8","price":108},{"id":9,"name":"\\u624b\\u673a9","price":109}]}', 1, 75),
	(658, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': 100, \'address\': \'北京\'}', '"code":1|"msg":"success"', '0:00:00', '{"code":1,"msg":"success"}', 1, 75),
	(659, '[模糊测试_name参数不传内容,price参数不传内容,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数不传内容,address参数正确\', \'price\': \'\', \'address\': \'北京\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 75),
	(660, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'key不传\', \'address\': \'北京\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 75),
	(661, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'系统生成\', \'address\': \'北京\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 75),
	(662, '[模糊测试_name注入攻击1,price注入攻击1,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price注入攻击1,address参数正确\', \'price\': "x\' AND userid IS NULL; --", \'address\': \'北京\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 75),
	(663, '[模糊测试_name注入攻击1,price参数正确,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price参数正确,address参数不传内容\', \'price\': \'系统生成\', \'address\': \'\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 75),
	(664, '[模糊测试_name参数正确,price参数正确,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数正确,address参数不传内容\', \'price\': \'key不传\', \'address\': \'\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 75),
	(665, '[模糊测试_name参数正确,price参数不传内容,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数不传内容,address参数不传内容\', \'price\': \'\', \'address\': \'\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 75),
	(666, '[模糊测试_name参数不传内容,price参数正确,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数正确,address参数不传内容\', \'price\': 100, \'address\': \'\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 75),
	(667, '[模糊测试_name参数正确,price注入攻击1,address参数不传内容]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price注入攻击1,address参数不传内容\', \'price\': "x\' AND userid IS NULL; --", \'address\': \'\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 75),
	(668, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'系统生成\', \'address\': \'key不传\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 75),
	(669, '[模糊测试_name参数不传内容,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数正确,address参数正确\', \'price\': \'key不传\', \'address\': \'key不传\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 75),
	(670, '[模糊测试_name参数正确,price注入攻击1,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price注入攻击1,address参数正确\', \'price\': "x\' AND userid IS NULL; --", \'address\': \'key不传\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 75),
	(671, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': 100, \'address\': \'key不传\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 75),
	(672, '[模糊测试_name注入攻击1,price参数不传内容,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price参数不传内容,address参数正确\', \'price\': \'\', \'address\': \'key不传\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 75),
	(673, '[模糊测试_name注入攻击1,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price参数正确,address参数正确\', \'price\': 100, \'address\': \'系统生成\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 75),
	(674, '[模糊测试_name参数正确,price参数不传内容,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price参数不传内容,address参数正确\', \'price\': \'\', \'address\': \'系统生成\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 75),
	(675, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'系统生成\', \'address\': \'系统生成\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 75),
	(676, '[模糊测试_name参数不传内容,price注入攻击1,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price注入攻击1,address参数正确\', \'price\': "x\' AND userid IS NULL; --", \'address\': \'系统生成\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 75),
	(677, '[模糊测试_name参数正确,price参数正确,address参数正确]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数正确,address参数正确\', \'price\': \'key不传\', \'address\': \'系统生成\'}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 75),
	(678, '[模糊测试_name参数正确,price参数不传内容,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'111\', \'info\': \'name参数正确,price参数不传内容,address注入攻击1\', \'price\': \'\', \'address\': "x\' AND userid IS NULL; --"}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 75),
	(679, '[模糊测试_name参数不传内容,price参数正确,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'\', \'info\': \'name参数不传内容,price参数正确,address注入攻击1\', \'price\': \'系统生成\', \'address\': "x\' AND userid IS NULL; --"}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 75),
	(680, '[模糊测试_name参数正确,price参数正确,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'key不传\', \'info\': \'name参数正确,price参数正确,address注入攻击1\', \'price\': 100, \'address\': "x\' AND userid IS NULL; --"}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 75),
	(681, '[模糊测试_name参数正确,price注入攻击1,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': \'系统生成\', \'info\': \'name参数正确,price注入攻击1,address注入攻击1\', \'price\': "x\' AND userid IS NULL; --", \'address\': "x\' AND userid IS NULL; --"}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 75),
	(682, '[模糊测试_name注入攻击1,price参数正确,address注入攻击1]_添加商品', '127.0.0.1:8100/myapi/shop_add', 'http', 'post', '{\'name\': "x\' AND userid IS NULL; --", \'info\': \'name注入攻击1,price参数正确,address注入攻击1\', \'price\': \'key不传\', \'address\': "x\' AND userid IS NULL; --"}', 'code:2', '0:00:00', '{"code":1,"msg":"success"}', -1, 75);
/*!40000 ALTER TABLE `myapi_reportitem` ENABLE KEYS */;

-- 导出  表 mydb.myapi_role 结构
CREATE TABLE IF NOT EXISTS `myapi_role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- 正在导出表  mydb.myapi_role 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `myapi_role` DISABLE KEYS */;
INSERT INTO `myapi_role` (`id`, `name`) VALUES
	(1, 'admin'),
	(2, 'comm');
/*!40000 ALTER TABLE `myapi_role` ENABLE KEYS */;

-- 导出  表 mydb.myapi_suite 结构
CREATE TABLE IF NOT EXISTS `myapi_suite` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `is_fuzz` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- 正在导出表  mydb.myapi_suite 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `myapi_suite` DISABLE KEYS */;
INSERT INTO `myapi_suite` (`id`, `name`, `is_fuzz`) VALUES
	(6, '大回归1', 0),
	(7, '注入规则1', 1);
/*!40000 ALTER TABLE `myapi_suite` ENABLE KEYS */;

-- 导出  表 mydb.myapi_suitesetcase 结构
CREATE TABLE IF NOT EXISTS `myapi_suitesetcase` (
  `id` int NOT NULL AUTO_INCREMENT,
  `case_id` int DEFAULT NULL,
  `suite_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapi_suitesetcase_suite_id_a3aa72d8_fk_myapi_suite_id` (`suite_id`),
  CONSTRAINT `myapi_suitesetcase_suite_id_a3aa72d8_fk_myapi_suite_id` FOREIGN KEY (`suite_id`) REFERENCES `myapi_suite` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- 正在导出表  mydb.myapi_suitesetcase 的数据：~4 rows (大约)
/*!40000 ALTER TABLE `myapi_suitesetcase` DISABLE KEYS */;
INSERT INTO `myapi_suitesetcase` (`id`, `case_id`, `suite_id`) VALUES
	(8, 4, 7),
	(9, 2, 7),
	(13, 4, 6),
	(14, 4, 6);
/*!40000 ALTER TABLE `myapi_suitesetcase` ENABLE KEYS */;

-- 导出  表 mydb.myapi_task 结构
CREATE TABLE IF NOT EXISTS `myapi_task` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `task_state` int NOT NULL,
  `task_type` int NOT NULL,
  `suite_id` int DEFAULT NULL,
  `start_time` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `myapi_task_suite_id_f808ac45` (`suite_id`),
  CONSTRAINT `myapi_task_suite_id_f808ac45_fk_myapi_suite_id` FOREIGN KEY (`suite_id`) REFERENCES `myapi_suite` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8;

-- 正在导出表  mydb.myapi_task 的数据：~5 rows (大约)
/*!40000 ALTER TABLE `myapi_task` DISABLE KEYS */;
INSERT INTO `myapi_task` (`id`, `name`, `task_state`, `task_type`, `suite_id`, `start_time`) VALUES
	(62, '我的任务', 2, 1, 6, NULL),
	(65, '大回归测试3', 2, 1, 7, NULL),
	(66, '模糊测试123', 2, 1, 7, NULL),
	(93, '定时测试', 2, 2, 7, '22:15');
/*!40000 ALTER TABLE `myapi_task` ENABLE KEYS */;

-- 导出  表 mydb.myapi_token 结构
CREATE TABLE IF NOT EXISTS `myapi_token` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(1000) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token_id` (`user_id`),
  CONSTRAINT `myapi_token_user_id_51ee717b_fk_myapi_user_id` FOREIGN KEY (`user_id`) REFERENCES `myapi_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- 正在导出表  mydb.myapi_token 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `myapi_token` DISABLE KEYS */;
INSERT INTO `myapi_token` (`id`, `name`, `user_id`) VALUES
	(16, '2a110e00-682e-11eb-87bd-bcee7b76a849', 2);
/*!40000 ALTER TABLE `myapi_token` ENABLE KEYS */;

-- 导出  表 mydb.myapi_user 结构
CREATE TABLE IF NOT EXISTS `myapi_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `password` varchar(256) NOT NULL,
  `c_time` datetime(6) NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `myapi_user_role_id_f61c4e0a_fk_myapi_role_id` (`role_id`),
  CONSTRAINT `myapi_user_role_id_f61c4e0a_fk_myapi_role_id` FOREIGN KEY (`role_id`) REFERENCES `myapi_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- 正在导出表  mydb.myapi_user 的数据：~11 rows (大约)
/*!40000 ALTER TABLE `myapi_user` DISABLE KEYS */;
INSERT INTO `myapi_user` (`id`, `name`, `password`, `c_time`, `role_id`) VALUES
	(2, 'test1', '1234567', '2020-12-07 22:58:18.000000', 2),
	(3, 'admin', '1234567', '2020-12-12 21:10:07.000000', 1),
	(4, 'test2', '1234567', '2020-12-07 22:58:18.000000', 2),
	(5, 'test3', '1234567', '2020-12-07 22:58:18.000000', 2),
	(6, 'test4', '1234567', '2020-12-07 22:58:18.000000', 2),
	(7, 'test6', '1234567', '2020-12-07 22:58:18.000000', 2),
	(8, 'test7', '1234567', '2020-12-12 22:48:34.000000', 1),
	(9, 'test9', '1234567', '2020-12-12 22:48:34.000000', 2),
	(10, 'test10', '1234567', '2020-12-12 22:48:34.000000', 2),
	(11, 'test11', '1234567', '2020-12-12 22:48:34.000000', 2),
	(12, 'test12', '1234567', '2020-12-12 22:48:34.000000', 2);
/*!40000 ALTER TABLE `myapi_user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
