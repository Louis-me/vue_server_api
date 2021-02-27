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

-- 数据导出被取消选择。

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

-- 数据导出被取消选择。

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

-- 数据导出被取消选择。

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

-- 数据导出被取消选择。

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

-- 数据导出被取消选择。

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

-- 数据导出被取消选择。

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

-- 数据导出被取消选择。

-- 导出  表 mydb.django_apscheduler_djangojob 结构
CREATE TABLE IF NOT EXISTS `django_apscheduler_djangojob` (
  `id` varchar(255) NOT NULL,
  `next_run_time` datetime(6) DEFAULT NULL,
  `job_state` longblob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_apscheduler_djangojob_next_run_time_2f022619` (`next_run_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。

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

-- 数据导出被取消选择。

-- 导出  表 mydb.django_content_type 结构
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。

-- 导出  表 mydb.django_migrations 结构
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。

-- 导出  表 mydb.django_session 结构
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。

-- 导出  表 mydb.myapi_apilogin 结构
CREATE TABLE IF NOT EXISTS `myapi_apilogin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `url` varchar(300) NOT NULL,
  `params` varchar(10000) NOT NULL,
  `method` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。

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

-- 数据导出被取消选择。

-- 导出  表 mydb.myapi_fuzz 结构
CREATE TABLE IF NOT EXISTS `myapi_fuzz` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `fuzz_type` int NOT NULL,
  `fuzz_content` varchar(10000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。

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

-- 数据导出被取消选择。

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

-- 数据导出被取消选择。

-- 导出  表 mydb.myapi_role 结构
CREATE TABLE IF NOT EXISTS `myapi_role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。

-- 导出  表 mydb.myapi_suite 结构
CREATE TABLE IF NOT EXISTS `myapi_suite` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `is_fuzz` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。

-- 导出  表 mydb.myapi_suitesetcase 结构
CREATE TABLE IF NOT EXISTS `myapi_suitesetcase` (
  `id` int NOT NULL AUTO_INCREMENT,
  `case_id` int DEFAULT NULL,
  `suite_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapi_suitesetcase_suite_id_a3aa72d8_fk_myapi_suite_id` (`suite_id`),
  CONSTRAINT `myapi_suitesetcase_suite_id_a3aa72d8_fk_myapi_suite_id` FOREIGN KEY (`suite_id`) REFERENCES `myapi_suite` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。

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

-- 数据导出被取消选择。

-- 导出  表 mydb.myapi_token 结构
CREATE TABLE IF NOT EXISTS `myapi_token` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(1000) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token_id` (`user_id`),
  CONSTRAINT `myapi_token_user_id_51ee717b_fk_myapi_user_id` FOREIGN KEY (`user_id`) REFERENCES `myapi_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。

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

-- 数据导出被取消选择。

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
