# --------------------------------------------------------
# Host:                         127.0.0.1
# Server version:               5.5.16-log
# Server OS:                    Win64
# HeidiSQL version:             6.0.0.3603
# Date/time:                    2012-04-06 19:48:46
# --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

# Dumping database structure for admission
DROP DATABASE IF EXISTS `admission`;
CREATE DATABASE IF NOT EXISTS `admission` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `admission`;


# Dumping structure for table admission.accomplishment
DROP TABLE IF EXISTS `accomplishment`;
CREATE TABLE IF NOT EXISTS `accomplishment` (
  `accomplishment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `accomplishment_type` bigint(20) NOT NULL,
  PRIMARY KEY (`accomplishment_id`),
  KEY `FK8B5E4621C04C2B4A` (`accomplishment_type`),
  CONSTRAINT `FK8B5E4621C04C2B4A` FOREIGN KEY (`accomplishment_type`) REFERENCES `accomplishment_type` (`accomplishment_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table admission.accomplishment_accomplishment_values
DROP TABLE IF EXISTS `accomplishment_accomplishment_values`;
CREATE TABLE IF NOT EXISTS `accomplishment_accomplishment_values` (
  `accomplishment` bigint(20) NOT NULL,
  `accomplishment_values` bigint(20) NOT NULL,
  PRIMARY KEY (`accomplishment`,`accomplishment_values`),
  UNIQUE KEY `accomplishment_values` (`accomplishment_values`),
  KEY `FK924E256226C62B79` (`accomplishment`),
  KEY `FK924E2562C356AFF9` (`accomplishment_values`),
  CONSTRAINT `FK924E2562C356AFF9` FOREIGN KEY (`accomplishment_values`) REFERENCES `accomplishment_value` (`accomplishment_value_id`),
  CONSTRAINT `FK924E256226C62B79` FOREIGN KEY (`accomplishment`) REFERENCES `accomplishment` (`accomplishment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table admission.accomplishment_type
DROP TABLE IF EXISTS `accomplishment_type`;
CREATE TABLE IF NOT EXISTS `accomplishment_type` (
  `accomplishment_type_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`accomplishment_type_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table admission.accomplishment_value
DROP TABLE IF EXISTS `accomplishment_value`;
CREATE TABLE IF NOT EXISTS `accomplishment_value` (
  `accomplishment_value_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`accomplishment_value_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table admission.address
DROP TABLE IF EXISTS `address`;
CREATE TABLE IF NOT EXISTS `address` (
  `address_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `house_number` varchar(255) DEFAULT NULL,
  `post_number` varchar(255) DEFAULT NULL,
  `postal_code` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `address_type` bigint(20) DEFAULT NULL,
  `city` bigint(20) NOT NULL,
  `country` bigint(20) NOT NULL,
  PRIMARY KEY (`address_id`),
  KEY `FKBB979BF4BE5FD641` (`city`),
  KEY `FKBB979BF464174828` (`address_type`),
  KEY `FKBB979BF42735CFE1` (`country`),
  CONSTRAINT `FKBB979BF42735CFE1` FOREIGN KEY (`country`) REFERENCES `country` (`country_id`),
  CONSTRAINT `FKBB979BF464174828` FOREIGN KEY (`address_type`) REFERENCES `address_type` (`address_type_id`),
  CONSTRAINT `FKBB979BF4BE5FD641` FOREIGN KEY (`city`) REFERENCES `city` (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table admission.address_print_lines
DROP TABLE IF EXISTS `address_print_lines`;
CREATE TABLE IF NOT EXISTS `address_print_lines` (
  `address` bigint(20) NOT NULL,
  `print_lines` bigint(20) NOT NULL,
  PRIMARY KEY (`address`,`print_lines`),
  UNIQUE KEY `print_lines` (`print_lines`),
  KEY `FK95FD9B222C36589D` (`address`),
  KEY `FK95FD9B2224CA6EA3` (`print_lines`),
  CONSTRAINT `FK95FD9B2224CA6EA3` FOREIGN KEY (`print_lines`) REFERENCES `print_line` (`print_line_id`),
  CONSTRAINT `FK95FD9B222C36589D` FOREIGN KEY (`address`) REFERENCES `address` (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table admission.address_type
DROP TABLE IF EXISTS `address_type`;
CREATE TABLE IF NOT EXISTS `address_type` (
  `address_type_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`address_type_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table admission.admission
DROP TABLE IF EXISTS `admission`;
CREATE TABLE IF NOT EXISTS `admission` (
  `admission_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `accepted` tinyint(1) NOT NULL,
  `code` varchar(255) NOT NULL,
  `dormitory_request` tinyint(1) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `admission_state` bigint(20) DEFAULT NULL,
  `faculty` bigint(20) DEFAULT NULL,
  `person` bigint(20) NOT NULL,
  `programme` bigint(20) DEFAULT NULL,
  `result` bigint(20) DEFAULT NULL,
  `user_identity` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`admission_id`),
  UNIQUE KEY `code` (`code`),
  KEY `FK1A2180926272B07` (`person`),
  KEY `FK1A21809305D0A12` (`faculty`),
  KEY `FK1A218092AD7252` (`result`),
  KEY `FK1A21809B4E8E102` (`programme`),
  KEY `FK1A218094AF3FECD` (`user_identity`),
  KEY `FK1A21809A2979454` (`admission_state`),
  CONSTRAINT `FK1A21809A2979454` FOREIGN KEY (`admission_state`) REFERENCES `admission_state` (`admission_state_id`),
  CONSTRAINT `FK1A2180926272B07` FOREIGN KEY (`person`) REFERENCES `person` (`person_id`),
  CONSTRAINT `FK1A218092AD7252` FOREIGN KEY (`result`) REFERENCES `admission_result` (`admission_result_id`),
  CONSTRAINT `FK1A21809305D0A12` FOREIGN KEY (`faculty`) REFERENCES `faculty` (`faculty_id`),
  CONSTRAINT `FK1A218094AF3FECD` FOREIGN KEY (`user_identity`) REFERENCES `user_identity` (`user_identity_id`),
  CONSTRAINT `FK1A21809B4E8E102` FOREIGN KEY (`programme`) REFERENCES `programme` (`programme_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table admission.admission_accomplishments
DROP TABLE IF EXISTS `admission_accomplishments`;
CREATE TABLE IF NOT EXISTS `admission_accomplishments` (
  `admission` bigint(20) NOT NULL,
  `accomplishments` bigint(20) NOT NULL,
  PRIMARY KEY (`admission`,`accomplishments`),
  UNIQUE KEY `accomplishments` (`accomplishments`),
  KEY `FKD5F6BA3C14DCE801` (`admission`),
  KEY `FKD5F6BA3C7BD263CA` (`accomplishments`),
  CONSTRAINT `FKD5F6BA3C7BD263CA` FOREIGN KEY (`accomplishments`) REFERENCES `accomplishment` (`accomplishment_id`),
  CONSTRAINT `FKD5F6BA3C14DCE801` FOREIGN KEY (`admission`) REFERENCES `admission` (`admission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table admission.admission_appeals
DROP TABLE IF EXISTS `admission_appeals`;
CREATE TABLE IF NOT EXISTS `admission_appeals` (
  `admission` bigint(20) NOT NULL,
  `appeals` bigint(20) NOT NULL,
  PRIMARY KEY (`admission`,`appeals`),
  UNIQUE KEY `appeals` (`appeals`),
  KEY `FK3DB68A8E14DCE801` (`admission`),
  KEY `FK3DB68A8E42C298C4` (`appeals`),
  CONSTRAINT `FK3DB68A8E42C298C4` FOREIGN KEY (`appeals`) REFERENCES `appeal` (`appeal_id`),
  CONSTRAINT `FK3DB68A8E14DCE801` FOREIGN KEY (`admission`) REFERENCES `admission` (`admission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table admission.admission_evaluations
DROP TABLE IF EXISTS `admission_evaluations`;
CREATE TABLE IF NOT EXISTS `admission_evaluations` (
  `admission` bigint(20) NOT NULL,
  `evaluations` bigint(20) NOT NULL,
  PRIMARY KEY (`admission`,`evaluations`),
  UNIQUE KEY `evaluations` (`evaluations`),
  KEY `FK571A918114DCE801` (`admission`),
  KEY `FK571A918186FF2DE4` (`evaluations`),
  CONSTRAINT `FK571A918186FF2DE4` FOREIGN KEY (`evaluations`) REFERENCES `evaluation` (`evaluation_id`),
  CONSTRAINT `FK571A918114DCE801` FOREIGN KEY (`admission`) REFERENCES `admission` (`admission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table admission.admission_photos
DROP TABLE IF EXISTS `admission_photos`;
CREATE TABLE IF NOT EXISTS `admission_photos` (
  `admission` bigint(20) NOT NULL,
  `photos` bigint(20) NOT NULL,
  PRIMARY KEY (`admission`,`photos`),
  UNIQUE KEY `photos` (`photos`),
  KEY `FK6DBA0177EA83147B` (`photos`),
  KEY `FK6DBA017714DCE801` (`admission`),
  CONSTRAINT `FK6DBA017714DCE801` FOREIGN KEY (`admission`) REFERENCES `admission` (`admission_id`),
  CONSTRAINT `FK6DBA0177EA83147B` FOREIGN KEY (`photos`) REFERENCES `appendix` (`attachment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table admission.admission_registrations
DROP TABLE IF EXISTS `admission_registrations`;
CREATE TABLE IF NOT EXISTS `admission_registrations` (
  `admission` bigint(20) NOT NULL,
  `registrations` bigint(20) NOT NULL,
  PRIMARY KEY (`admission`,`registrations`),
  UNIQUE KEY `registrations` (`registrations`),
  KEY `FK4B15D52414DCE801` (`admission`),
  KEY `FK4B15D5242C33BB50` (`registrations`),
  CONSTRAINT `FK4B15D5242C33BB50` FOREIGN KEY (`registrations`) REFERENCES `term_registration` (`term_registration_id`),
  CONSTRAINT `FK4B15D52414DCE801` FOREIGN KEY (`admission`) REFERENCES `admission` (`admission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table admission.admission_result
DROP TABLE IF EXISTS `admission_result`;
CREATE TABLE IF NOT EXISTS `admission_result` (
  `admission_result_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `value` double NOT NULL,
  PRIMARY KEY (`admission_result_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table admission.admission_state
DROP TABLE IF EXISTS `admission_state`;
CREATE TABLE IF NOT EXISTS `admission_state` (
  `admission_state_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `desciption` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`admission_state_id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table admission.apology
DROP TABLE IF EXISTS `apology`;
CREATE TABLE IF NOT EXISTS `apology` (
  `apology_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `approved` tinyint(1) NOT NULL,
  `text` varchar(255) NOT NULL,
  `registration` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`apology_id`),
  KEY `FKD0AA2FD59ABE752F` (`registration`),
  CONSTRAINT `FKD0AA2FD59ABE752F` FOREIGN KEY (`registration`) REFERENCES `term_registration` (`term_registration_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table admission.apology_files
DROP TABLE IF EXISTS `apology_files`;
CREATE TABLE IF NOT EXISTS `apology_files` (
  `apology` bigint(20) NOT NULL,
  `files` bigint(20) NOT NULL,
  PRIMARY KEY (`apology`,`files`),
  UNIQUE KEY `files` (`files`),
  KEY `FK1985598DA0484759` (`apology`),
  KEY `FK1985598D2B454671` (`files`),
  CONSTRAINT `FK1985598D2B454671` FOREIGN KEY (`files`) REFERENCES `appendix` (`attachment_id`),
  CONSTRAINT `FK1985598DA0484759` FOREIGN KEY (`apology`) REFERENCES `apology` (`apology_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table admission.appeal
DROP TABLE IF EXISTS `appeal`;
CREATE TABLE IF NOT EXISTS `appeal` (
  `appeal_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `accepted` tinyint(1) NOT NULL,
  `appeal_type` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`appeal_id`),
  KEY `FKABE4CD8F79C55344` (`appeal_type`),
  CONSTRAINT `FKABE4CD8F79C55344` FOREIGN KEY (`appeal_type`) REFERENCES `appeal_type` (`appeal_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table admission.appeal_type
DROP TABLE IF EXISTS `appeal_type`;
CREATE TABLE IF NOT EXISTS `appeal_type` (
  `appeal_type_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`appeal_type_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table admission.appendix
DROP TABLE IF EXISTS `appendix`;
CREATE TABLE IF NOT EXISTS `appendix` (
  `attachment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` longtext NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `mime_type` varchar(255) NOT NULL,
  `attachment_type` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`attachment_id`),
  KEY `FK45ED7DC97072F2A` (`attachment_type`),
  CONSTRAINT `FK45ED7DC97072F2A` FOREIGN KEY (`attachment_type`) REFERENCES `appendix_type` (`attachment_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table admission.appendix_type
DROP TABLE IF EXISTS `appendix_type`;
CREATE TABLE IF NOT EXISTS `appendix_type` (
  `attachment_type_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`attachment_type_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table admission.attachment
DROP TABLE IF EXISTS `attachment`;
CREATE TABLE IF NOT EXISTS `attachment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `access_type` int(11) DEFAULT NULL,
  `attached_at` datetime DEFAULT NULL,
  `attachment_content_id` bigint(20) NOT NULL,
  `content_type` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `attachment_size` int(11) DEFAULT NULL,
  `attached_by` varchar(255) DEFAULT NULL,
  `task_data_attachments_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8AF75923D627EAC4` (`task_data_attachments_id`),
  KEY `FK8AF7592365D67657` (`attached_by`),
  CONSTRAINT `FK8AF7592365D67657` FOREIGN KEY (`attached_by`) REFERENCES `organizational_entity` (`id`),
  CONSTRAINT `FK8AF75923D627EAC4` FOREIGN KEY (`task_data_attachments_id`) REFERENCES `task` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table admission.boolean_expression
DROP TABLE IF EXISTS `boolean_expression`;
CREATE TABLE IF NOT EXISTS `boolean_expression` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `expression` longtext,
  `type` varchar(255) DEFAULT NULL,
  `escalation_constraints_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK90A4D30FAFB75F7D` (`escalation_constraints_id`),
  CONSTRAINT `FK90A4D30FAFB75F7D` FOREIGN KEY (`escalation_constraints_id`) REFERENCES `escalation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table admission.city
DROP TABLE IF EXISTS `city`;
CREATE TABLE IF NOT EXISTS `city` (
  `city_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `part` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`city_id`),
  UNIQUE KEY `name` (`name`,`part`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table admission.content
DROP TABLE IF EXISTS `content`;
CREATE TABLE IF NOT EXISTS `content` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` longblob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table admission.country
DROP TABLE IF EXISTS `country`;
CREATE TABLE IF NOT EXISTS `country` (
  `country_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`country_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table admission.deadline
DROP TABLE IF EXISTS `deadline`;
CREATE TABLE IF NOT EXISTS `deadline` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `deadline_date` datetime DEFAULT NULL,
  `escalated` tinyint(1) NOT NULL,
  `deadlines_start_dead_line_id` bigint(20) DEFAULT NULL,
  `deadlines_end_dead_line_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1E04DA587ECCD20B` (`deadlines_start_dead_line_id`),
  KEY `FK1E04DA58E718F332` (`deadlines_end_dead_line_id`),
  CONSTRAINT `FK1E04DA58E718F332` FOREIGN KEY (`deadlines_end_dead_line_id`) REFERENCES `task` (`id`),
  CONSTRAINT `FK1E04DA587ECCD20B` FOREIGN KEY (`deadlines_start_dead_line_id`) REFERENCES `task` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table admission.degree
DROP TABLE IF EXISTS `degree`;
CREATE TABLE IF NOT EXISTS `degree` (
  `degree_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`degree_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table admission.delegation_delegates
DROP TABLE IF EXISTS `delegation_delegates`;
CREATE TABLE IF NOT EXISTS `delegation_delegates` (
  `task_id` bigint(20) NOT NULL,
  `entity_id` varchar(255) NOT NULL,
  KEY `FK3B8329372C122ED2` (`entity_id`),
  KEY `FK3B83293736B2F154` (`task_id`),
  CONSTRAINT `FK3B83293736B2F154` FOREIGN KEY (`task_id`) REFERENCES `task` (`id`),
  CONSTRAINT `FK3B8329372C122ED2` FOREIGN KEY (`entity_id`) REFERENCES `organizational_entity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table admission.disability_type
DROP TABLE IF EXISTS `disability_type`;
CREATE TABLE IF NOT EXISTS `disability_type` (
  `disability_type_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`disability_type_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table admission.document
DROP TABLE IF EXISTS `document`;
CREATE TABLE IF NOT EXISTS `document` (
  `document_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `number` varchar(255) NOT NULL,
  `document_type` bigint(20) NOT NULL,
  PRIMARY KEY (`document_id`),
  KEY `FK335CD11B47EF3970` (`document_type`),
  CONSTRAINT `FK335CD11B47EF3970` FOREIGN KEY (`document_type`) REFERENCES `document_type` (`document_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table admission.document_type
DROP TABLE IF EXISTS `document_type`;
CREATE TABLE IF NOT EXISTS `document_type` (
  `document_type_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`document_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table admission.email_header
DROP TABLE IF EXISTS `email_header`;
CREATE TABLE IF NOT EXISTS `email_header` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `body` longtext,
  `from_address` varchar(255) DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `reply_to_address` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table admission.escalation
DROP TABLE IF EXISTS `escalation`;
CREATE TABLE IF NOT EXISTS `escalation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `deadline_escalation_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKF0E0EA95C7A04C70` (`deadline_escalation_id`),
  CONSTRAINT `FKF0E0EA95C7A04C70` FOREIGN KEY (`deadline_escalation_id`) REFERENCES `deadline` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table admission.evaluation
DROP TABLE IF EXISTS `evaluation`;
CREATE TABLE IF NOT EXISTS `evaluation` (
  `evaluation_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `value` varchar(255) NOT NULL,
  `evaluation_type` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`evaluation_id`),
  KEY `FK332C073C75725864` (`evaluation_type`),
  CONSTRAINT `FK332C073C75725864` FOREIGN KEY (`evaluation_type`) REFERENCES `evaluation_type` (`evaluation_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table admission.evaluation_type
DROP TABLE IF EXISTS `evaluation_type`;
CREATE TABLE IF NOT EXISTS `evaluation_type` (
  `evaluation_type_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`evaluation_type_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table admission.faculty
DROP TABLE IF EXISTS `faculty`;
CREATE TABLE IF NOT EXISTS `faculty` (
  `faculty_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`faculty_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table admission.gender
DROP TABLE IF EXISTS `gender`;
CREATE TABLE IF NOT EXISTS `gender` (
  `gender_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`gender_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table admission.i18ntext
DROP TABLE IF EXISTS `i18ntext`;
CREATE TABLE IF NOT EXISTS `i18ntext` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `language` varchar(255) DEFAULT NULL,
  `text` longtext,
  `task_subjects_id` bigint(20) DEFAULT NULL,
  `task_names_id` bigint(20) DEFAULT NULL,
  `task_descriptions_id` bigint(20) DEFAULT NULL,
  `reassignment_documentation_id` bigint(20) DEFAULT NULL,
  `notification_subjects_id` bigint(20) DEFAULT NULL,
  `notification_names_id` bigint(20) DEFAULT NULL,
  `notification_documentation_id` bigint(20) DEFAULT NULL,
  `notification_descriptions_id` bigint(20) DEFAULT NULL,
  `deadline_documentation_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2140804B2162DFB4` (`notification_descriptions_id`),
  KEY `FK2140804BD488CEEB` (`notification_names_id`),
  KEY `FK2140804B5EEBB6D9` (`reassignment_documentation_id`),
  KEY `FK2140804B3330F6D9` (`deadline_documentation_id`),
  KEY `FK2140804B8046A239` (`notification_documentation_id`),
  KEY `FK2140804B69B21EE8` (`task_descriptions_id`),
  KEY `FK2140804BB2FA6B18` (`task_subjects_id`),
  KEY `FK2140804B98B62B` (`task_names_id`),
  KEY `FK2140804BF952CEE4` (`notification_subjects_id`),
  CONSTRAINT `FK2140804BF952CEE4` FOREIGN KEY (`notification_subjects_id`) REFERENCES `notification` (`id`),
  CONSTRAINT `FK2140804B2162DFB4` FOREIGN KEY (`notification_descriptions_id`) REFERENCES `notification` (`id`),
  CONSTRAINT `FK2140804B3330F6D9` FOREIGN KEY (`deadline_documentation_id`) REFERENCES `deadline` (`id`),
  CONSTRAINT `FK2140804B5EEBB6D9` FOREIGN KEY (`reassignment_documentation_id`) REFERENCES `reassignment` (`id`),
  CONSTRAINT `FK2140804B69B21EE8` FOREIGN KEY (`task_descriptions_id`) REFERENCES `task` (`id`),
  CONSTRAINT `FK2140804B8046A239` FOREIGN KEY (`notification_documentation_id`) REFERENCES `notification` (`id`),
  CONSTRAINT `FK2140804B98B62B` FOREIGN KEY (`task_names_id`) REFERENCES `task` (`id`),
  CONSTRAINT `FK2140804BB2FA6B18` FOREIGN KEY (`task_subjects_id`) REFERENCES `task` (`id`),
  CONSTRAINT `FK2140804BD488CEEB` FOREIGN KEY (`notification_names_id`) REFERENCES `notification` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table admission.language
DROP TABLE IF EXISTS `language`;
CREATE TABLE IF NOT EXISTS `language` (
  `language_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`language_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table admission.marital_status
DROP TABLE IF EXISTS `marital_status`;
CREATE TABLE IF NOT EXISTS `marital_status` (
  `marital_status_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`marital_status_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table admission.notification
DROP TABLE IF EXISTS `notification`;
CREATE TABLE IF NOT EXISTS `notification` (
  `dtype` varchar(31) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `priority` int(11) NOT NULL,
  `escalation_notifications_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK237A88EB3E0890B` (`escalation_notifications_id`),
  CONSTRAINT `FK237A88EB3E0890B` FOREIGN KEY (`escalation_notifications_id`) REFERENCES `escalation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table admission.notification_bas
DROP TABLE IF EXISTS `notification_bas`;
CREATE TABLE IF NOT EXISTS `notification_bas` (
  `task_id` bigint(20) NOT NULL,
  `entity_id` varchar(255) NOT NULL,
  KEY `FK6012C6C02C122ED2` (`entity_id`),
  KEY `FK6012C6C09C76EABA` (`task_id`),
  CONSTRAINT `FK6012C6C09C76EABA` FOREIGN KEY (`task_id`) REFERENCES `notification` (`id`),
  CONSTRAINT `FK6012C6C02C122ED2` FOREIGN KEY (`entity_id`) REFERENCES `organizational_entity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table admission.notification_email_headers
DROP TABLE IF EXISTS `notification_email_headers`;
CREATE TABLE IF NOT EXISTS `notification_email_headers` (
  `notification` bigint(20) NOT NULL,
  `email_headers` bigint(20) NOT NULL,
  `email_headers_key` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`notification`,`email_headers_key`),
  UNIQUE KEY `email_headers` (`email_headers`),
  KEY `FKAA16E98FF88391FD` (`email_headers`),
  KEY `FKAA16E98FA3B41C18` (`notification`),
  CONSTRAINT `FKAA16E98FA3B41C18` FOREIGN KEY (`notification`) REFERENCES `notification` (`id`),
  CONSTRAINT `FKAA16E98FF88391FD` FOREIGN KEY (`email_headers`) REFERENCES `email_header` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table admission.notification_recipients
DROP TABLE IF EXISTS `notification_recipients`;
CREATE TABLE IF NOT EXISTS `notification_recipients` (
  `task_id` bigint(20) NOT NULL,
  `entity_id` varchar(255) NOT NULL,
  KEY `FK685E6D4E2C122ED2` (`entity_id`),
  KEY `FK685E6D4E9C76EABA` (`task_id`),
  CONSTRAINT `FK685E6D4E9C76EABA` FOREIGN KEY (`task_id`) REFERENCES `notification` (`id`),
  CONSTRAINT `FK685E6D4E2C122ED2` FOREIGN KEY (`entity_id`) REFERENCES `organizational_entity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table admission.organizational_entity
DROP TABLE IF EXISTS `organizational_entity`;
CREATE TABLE IF NOT EXISTS `organizational_entity` (
  `dtype` varchar(31) NOT NULL,
  `id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table admission.people_assignments_bas
DROP TABLE IF EXISTS `people_assignments_bas`;
CREATE TABLE IF NOT EXISTS `people_assignments_bas` (
  `task_id` bigint(20) NOT NULL,
  `entity_id` varchar(255) NOT NULL,
  KEY `FK5AD75EB2C122ED2` (`entity_id`),
  KEY `FK5AD75EB36B2F154` (`task_id`),
  CONSTRAINT `FK5AD75EB36B2F154` FOREIGN KEY (`task_id`) REFERENCES `task` (`id`),
  CONSTRAINT `FK5AD75EB2C122ED2` FOREIGN KEY (`entity_id`) REFERENCES `organizational_entity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table admission.people_assignments_excl_owners
DROP TABLE IF EXISTS `people_assignments_excl_owners`;
CREATE TABLE IF NOT EXISTS `people_assignments_excl_owners` (
  `task_id` bigint(20) NOT NULL,
  `entity_id` varchar(255) NOT NULL,
  KEY `FKFD3FC3A2C122ED2` (`entity_id`),
  KEY `FKFD3FC3A36B2F154` (`task_id`),
  CONSTRAINT `FKFD3FC3A36B2F154` FOREIGN KEY (`task_id`) REFERENCES `task` (`id`),
  CONSTRAINT `FKFD3FC3A2C122ED2` FOREIGN KEY (`entity_id`) REFERENCES `organizational_entity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table admission.people_assignments_pot_owners
DROP TABLE IF EXISTS `people_assignments_pot_owners`;
CREATE TABLE IF NOT EXISTS `people_assignments_pot_owners` (
  `task_id` bigint(20) NOT NULL,
  `entity_id` varchar(255) NOT NULL,
  KEY `FK3826EB932C122ED2` (`entity_id`),
  KEY `FK3826EB9336B2F154` (`task_id`),
  CONSTRAINT `FK3826EB9336B2F154` FOREIGN KEY (`task_id`) REFERENCES `task` (`id`),
  CONSTRAINT `FK3826EB932C122ED2` FOREIGN KEY (`entity_id`) REFERENCES `organizational_entity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table admission.people_assignments_recipients
DROP TABLE IF EXISTS `people_assignments_recipients`;
CREATE TABLE IF NOT EXISTS `people_assignments_recipients` (
  `task_id` bigint(20) NOT NULL,
  `entity_id` varchar(255) NOT NULL,
  KEY `FK820367C32C122ED2` (`entity_id`),
  KEY `FK820367C336B2F154` (`task_id`),
  CONSTRAINT `FK820367C336B2F154` FOREIGN KEY (`task_id`) REFERENCES `task` (`id`),
  CONSTRAINT `FK820367C32C122ED2` FOREIGN KEY (`entity_id`) REFERENCES `organizational_entity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table admission.people_assignments_stakeholders
DROP TABLE IF EXISTS `people_assignments_stakeholders`;
CREATE TABLE IF NOT EXISTS `people_assignments_stakeholders` (
  `task_id` bigint(20) NOT NULL,
  `entity_id` varchar(255) NOT NULL,
  KEY `FK75304F962C122ED2` (`entity_id`),
  KEY `FK75304F9636B2F154` (`task_id`),
  CONSTRAINT `FK75304F9636B2F154` FOREIGN KEY (`task_id`) REFERENCES `task` (`id`),
  CONSTRAINT `FK75304F962C122ED2` FOREIGN KEY (`entity_id`) REFERENCES `organizational_entity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table admission.person
DROP TABLE IF EXISTS `person`;
CREATE TABLE IF NOT EXISTS `person` (
  `person_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `birth_identification_number` varchar(255) DEFAULT NULL,
  `birthdate` datetime DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `maidenname` varchar(255) DEFAULT NULL,
  `middlename` varchar(255) DEFAULT NULL,
  `permanent_residence_granted` tinyint(1) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `prefix` varchar(255) DEFAULT NULL,
  `suffix` varchar(255) DEFAULT NULL,
  `citizenship` bigint(20) DEFAULT NULL,
  `city_of_birth` bigint(20) DEFAULT NULL,
  `country_of_birth` bigint(20) DEFAULT NULL,
  `gender` bigint(20) DEFAULT NULL,
  `marital_status` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`person_id`),
  KEY `FKC4E39B55E2D7632B` (`country_of_birth`),
  KEY `FKC4E39B55777AA0A6` (`marital_status`),
  KEY `FKC4E39B5576BD9DF` (`gender`),
  KEY `FKC4E39B55676259EF` (`citizenship`),
  KEY `FKC4E39B55DC872581` (`city_of_birth`),
  CONSTRAINT `FKC4E39B55DC872581` FOREIGN KEY (`city_of_birth`) REFERENCES `city` (`city_id`),
  CONSTRAINT `FKC4E39B55676259EF` FOREIGN KEY (`citizenship`) REFERENCES `country` (`country_id`),
  CONSTRAINT `FKC4E39B5576BD9DF` FOREIGN KEY (`gender`) REFERENCES `gender` (`gender_id`),
  CONSTRAINT `FKC4E39B55777AA0A6` FOREIGN KEY (`marital_status`) REFERENCES `marital_status` (`marital_status_id`),
  CONSTRAINT `FKC4E39B55E2D7632B` FOREIGN KEY (`country_of_birth`) REFERENCES `country` (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table admission.person_addresses
DROP TABLE IF EXISTS `person_addresses`;
CREATE TABLE IF NOT EXISTS `person_addresses` (
  `person` bigint(20) NOT NULL,
  `addresses` bigint(20) NOT NULL,
  PRIMARY KEY (`person`,`addresses`),
  UNIQUE KEY `addresses` (`addresses`),
  KEY `FK8AEAB3826272B07` (`person`),
  KEY `FK8AEAB38A4BF384B` (`addresses`),
  CONSTRAINT `FK8AEAB38A4BF384B` FOREIGN KEY (`addresses`) REFERENCES `address` (`address_id`),
  CONSTRAINT `FK8AEAB3826272B07` FOREIGN KEY (`person`) REFERENCES `person` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table admission.person_disability_type
DROP TABLE IF EXISTS `person_disability_type`;
CREATE TABLE IF NOT EXISTS `person_disability_type` (
  `person_id` bigint(20) NOT NULL,
  `disability_type_id` bigint(20) NOT NULL,
  PRIMARY KEY (`person_id`,`disability_type_id`),
  KEY `FKE8D303D372499170` (`disability_type_id`),
  KEY `FKE8D303D3941E29F7` (`person_id`),
  CONSTRAINT `FKE8D303D3941E29F7` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`),
  CONSTRAINT `FKE8D303D372499170` FOREIGN KEY (`disability_type_id`) REFERENCES `disability_type` (`disability_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table admission.person_documents
DROP TABLE IF EXISTS `person_documents`;
CREATE TABLE IF NOT EXISTS `person_documents` (
  `person` bigint(20) NOT NULL,
  `documents` bigint(20) NOT NULL,
  PRIMARY KEY (`person`,`documents`),
  UNIQUE KEY `documents` (`documents`),
  KEY `FKCCB824E26272B07` (`person`),
  KEY `FKCCB824E6FCE74F0` (`documents`),
  CONSTRAINT `FKCCB824E6FCE74F0` FOREIGN KEY (`documents`) REFERENCES `document` (`document_id`),
  CONSTRAINT `FKCCB824E26272B07` FOREIGN KEY (`person`) REFERENCES `person` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table admission.print_line
DROP TABLE IF EXISTS `print_line`;
CREATE TABLE IF NOT EXISTS `print_line` (
  `print_line_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `value` varchar(255) NOT NULL,
  `print_line_type` bigint(20) NOT NULL,
  PRIMARY KEY (`print_line_id`),
  KEY `FK8435A46C62121A3` (`print_line_type`),
  CONSTRAINT `FK8435A46C62121A3` FOREIGN KEY (`print_line_type`) REFERENCES `print_line_type` (`print_line_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table admission.print_line_type
DROP TABLE IF EXISTS `print_line_type`;
CREATE TABLE IF NOT EXISTS `print_line_type` (
  `print_line_type_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`print_line_type_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table admission.programme
DROP TABLE IF EXISTS `programme`;
CREATE TABLE IF NOT EXISTS `programme` (
  `programme_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `degree` bigint(20) DEFAULT NULL,
  `language` bigint(20) DEFAULT NULL,
  `study_mode` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`programme_id`),
  UNIQUE KEY `name` (`name`),
  KEY `FKC6419B1C9798742F` (`study_mode`),
  KEY `FKC6419B1CF2EE370E` (`degree`),
  KEY `FKC6419B1CDDD9FAA6` (`language`),
  CONSTRAINT `FKC6419B1CDDD9FAA6` FOREIGN KEY (`language`) REFERENCES `language` (`language_id`),
  CONSTRAINT `FKC6419B1C9798742F` FOREIGN KEY (`study_mode`) REFERENCES `study_mode` (`study_mode_id`),
  CONSTRAINT `FKC6419B1CF2EE370E` FOREIGN KEY (`degree`) REFERENCES `degree` (`degree_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table admission.reassignment
DROP TABLE IF EXISTS `reassignment`;
CREATE TABLE IF NOT EXISTS `reassignment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `escalation_reassignments_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6881B140A5C17EE0` (`escalation_reassignments_id`),
  CONSTRAINT `FK6881B140A5C17EE0` FOREIGN KEY (`escalation_reassignments_id`) REFERENCES `escalation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table admission.reassignment_potential_owners
DROP TABLE IF EXISTS `reassignment_potential_owners`;
CREATE TABLE IF NOT EXISTS `reassignment_potential_owners` (
  `task_id` bigint(20) NOT NULL,
  `entity_id` varchar(255) NOT NULL,
  KEY `FKF13A3C802C122ED2` (`entity_id`),
  KEY `FKF13A3C80E17E130F` (`task_id`),
  CONSTRAINT `FKF13A3C80E17E130F` FOREIGN KEY (`task_id`) REFERENCES `reassignment` (`id`),
  CONSTRAINT `FKF13A3C802C122ED2` FOREIGN KEY (`entity_id`) REFERENCES `organizational_entity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table admission.study_mode
DROP TABLE IF EXISTS `study_mode`;
CREATE TABLE IF NOT EXISTS `study_mode` (
  `study_mode_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`study_mode_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table admission.sub_tasks_strategy
DROP TABLE IF EXISTS `sub_tasks_strategy`;
CREATE TABLE IF NOT EXISTS `sub_tasks_strategy` (
  `dtype` varchar(100) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `task_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK72E9E0E336B2F154` (`task_id`),
  CONSTRAINT `FK72E9E0E336B2F154` FOREIGN KEY (`task_id`) REFERENCES `task` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table admission.task
DROP TABLE IF EXISTS `task`;
CREATE TABLE IF NOT EXISTS `task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `allowed_to_delegate` varchar(255) DEFAULT NULL,
  `priority` int(11) NOT NULL,
  `activation_time` datetime DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `document_access_type` int(11) DEFAULT NULL,
  `document_content_id` bigint(20) NOT NULL,
  `document_type` varchar(255) DEFAULT NULL,
  `expiration_time` datetime DEFAULT NULL,
  `fault_access_type` int(11) DEFAULT NULL,
  `fault_content_id` bigint(20) NOT NULL,
  `fault_name` varchar(255) DEFAULT NULL,
  `fault_type` varchar(255) DEFAULT NULL,
  `output_access_type` int(11) DEFAULT NULL,
  `output_content_id` bigint(20) NOT NULL,
  `output_type` varchar(255) DEFAULT NULL,
  `parent_id` bigint(20) NOT NULL,
  `previous_status` int(11) DEFAULT NULL,
  `process_id` varchar(255) DEFAULT NULL,
  `process_instance_id` bigint(20) NOT NULL,
  `process_session_id` int(11) NOT NULL,
  `skipable` tinyint(1) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `work_item_id` bigint(20) NOT NULL,
  `task_initiator` varchar(255) DEFAULT NULL,
  `actual_owner` varchar(255) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK363585E3F7BE93` (`created_by`),
  KEY `FK363585DB863247` (`actual_owner`),
  KEY `FK3635859346A57A` (`task_initiator`),
  CONSTRAINT `FK3635859346A57A` FOREIGN KEY (`task_initiator`) REFERENCES `organizational_entity` (`id`),
  CONSTRAINT `FK363585DB863247` FOREIGN KEY (`actual_owner`) REFERENCES `organizational_entity` (`id`),
  CONSTRAINT `FK363585E3F7BE93` FOREIGN KEY (`created_by`) REFERENCES `organizational_entity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table admission.task_comment
DROP TABLE IF EXISTS `task_comment`;
CREATE TABLE IF NOT EXISTS `task_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `added_at` datetime DEFAULT NULL,
  `text` longtext,
  `added_by` varchar(255) DEFAULT NULL,
  `task_data_comments_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK61F475A5C12024EA` (`task_data_comments_id`),
  KEY `FK61F475A548F8057B` (`added_by`),
  CONSTRAINT `FK61F475A548F8057B` FOREIGN KEY (`added_by`) REFERENCES `organizational_entity` (`id`),
  CONSTRAINT `FK61F475A5C12024EA` FOREIGN KEY (`task_data_comments_id`) REFERENCES `task` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table admission.term
DROP TABLE IF EXISTS `term`;
CREATE TABLE IF NOT EXISTS `term` (
  `term_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `apology_to` datetime NOT NULL,
  `capacity` int(11) NOT NULL,
  `date_of_term` datetime NOT NULL,
  `register_from` datetime NOT NULL,
  `register_to` datetime NOT NULL,
  `room` varchar(255) NOT NULL,
  `term_type` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`term_id`),
  KEY `FK36446C11E82724` (`term_type`),
  CONSTRAINT `FK36446C11E82724` FOREIGN KEY (`term_type`) REFERENCES `term_type` (`term_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table admission.term_programs
DROP TABLE IF EXISTS `term_programs`;
CREATE TABLE IF NOT EXISTS `term_programs` (
  `term` bigint(20) NOT NULL,
  `programs` bigint(20) NOT NULL,
  PRIMARY KEY (`term`,`programs`),
  UNIQUE KEY `programs` (`programs`),
  KEY `FK374BD8E217CE5789` (`term`),
  KEY `FK374BD8E2B2FBF855` (`programs`),
  CONSTRAINT `FK374BD8E2B2FBF855` FOREIGN KEY (`programs`) REFERENCES `programme` (`programme_id`),
  CONSTRAINT `FK374BD8E217CE5789` FOREIGN KEY (`term`) REFERENCES `term` (`term_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table admission.term_registration
DROP TABLE IF EXISTS `term_registration`;
CREATE TABLE IF NOT EXISTS `term_registration` (
  `term_registration_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `attendance` tinyint(1) DEFAULT NULL,
  `admission` bigint(20) NOT NULL,
  `apology` bigint(20) DEFAULT NULL,
  `term` bigint(20) NOT NULL,
  PRIMARY KEY (`term_registration_id`),
  KEY `FKECCC9DAC14DCE801` (`admission`),
  KEY `FKECCC9DACA0484759` (`apology`),
  KEY `FKECCC9DAC17CE5789` (`term`),
  CONSTRAINT `FKECCC9DAC17CE5789` FOREIGN KEY (`term`) REFERENCES `term` (`term_id`),
  CONSTRAINT `FKECCC9DAC14DCE801` FOREIGN KEY (`admission`) REFERENCES `admission` (`admission_id`),
  CONSTRAINT `FKECCC9DACA0484759` FOREIGN KEY (`apology`) REFERENCES `apology` (`apology_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table admission.term_registrations
DROP TABLE IF EXISTS `term_registrations`;
CREATE TABLE IF NOT EXISTS `term_registrations` (
  `term` bigint(20) NOT NULL,
  `registrations` bigint(20) NOT NULL,
  PRIMARY KEY (`term`,`registrations`),
  UNIQUE KEY `registrations` (`registrations`),
  KEY `FKACC7184717CE5789` (`term`),
  KEY `FKACC718472C33BB50` (`registrations`),
  CONSTRAINT `FKACC718472C33BB50` FOREIGN KEY (`registrations`) REFERENCES `term_registration` (`term_registration_id`),
  CONSTRAINT `FKACC7184717CE5789` FOREIGN KEY (`term`) REFERENCES `term` (`term_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table admission.term_type
DROP TABLE IF EXISTS `term_type`;
CREATE TABLE IF NOT EXISTS `term_type` (
  `term_type_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`term_type_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table admission.user_identity
DROP TABLE IF EXISTS `user_identity`;
CREATE TABLE IF NOT EXISTS `user_identity` (
  `user_identity_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `authentication` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY (`user_identity_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table admission.user_identity_role
DROP TABLE IF EXISTS `user_identity_role`;
CREATE TABLE IF NOT EXISTS `user_identity_role` (
  `user_identity_id` bigint(20) NOT NULL,
  `user_role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_identity_id`,`user_role_id`),
  KEY `FK8114DE3B8D0A763` (`user_role_id`),
  KEY `FK8114DE3456285E3` (`user_identity_id`),
  CONSTRAINT `FK8114DE3456285E3` FOREIGN KEY (`user_identity_id`) REFERENCES `user_identity` (`user_identity_id`),
  CONSTRAINT `FK8114DE3B8D0A763` FOREIGN KEY (`user_role_id`) REFERENCES `user_role` (`user_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table admission.user_password
DROP TABLE IF EXISTS `user_password`;
CREATE TABLE IF NOT EXISTS `user_password` (
  `user_password_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `value` varchar(255) NOT NULL,
  `user_identity` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`user_password_id`),
  KEY `FK4B8D148F4AF3FECD` (`user_identity`),
  CONSTRAINT `FK4B8D148F4AF3FECD` FOREIGN KEY (`user_identity`) REFERENCES `user_identity` (`user_identity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table admission.user_permission
DROP TABLE IF EXISTS `user_permission`;
CREATE TABLE IF NOT EXISTS `user_permission` (
  `user_permission_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`user_permission_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table admission.user_role
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE IF NOT EXISTS `user_role` (
  `user_role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`user_role_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table admission.user_role_permission
DROP TABLE IF EXISTS `user_role_permission`;
CREATE TABLE IF NOT EXISTS `user_role_permission` (
  `user_role_id` bigint(20) NOT NULL,
  `user_permission_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_role_id`,`user_permission_id`),
  KEY `FK2C1620C4B8D0A763` (`user_role_id`),
  KEY `FK2C1620C441948A03` (`user_permission_id`),
  CONSTRAINT `FK2C1620C441948A03` FOREIGN KEY (`user_permission_id`) REFERENCES `user_permission` (`user_permission_id`),
  CONSTRAINT `FK2C1620C4B8D0A763` FOREIGN KEY (`user_role_id`) REFERENCES `user_role` (`user_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table admission.user_session
DROP TABLE IF EXISTS `user_session`;
CREATE TABLE IF NOT EXISTS `user_session` (
  `user_session_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `grant_valid_to` datetime NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `user_identity_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`user_session_id`),
  UNIQUE KEY `identifier` (`identifier`),
  KEY `FKD1401A22456285E3` (`user_identity_id`),
  CONSTRAINT `FKD1401A22456285E3` FOREIGN KEY (`user_identity_id`) REFERENCES `user_identity` (`user_identity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Data exporting was unselected.
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;