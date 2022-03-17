/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 5.7.33 : Database - matricula
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`matricula` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `matricula`;

/*Table structure for table `academicperiodgroups` */

DROP TABLE IF EXISTS `academicperiodgroups`;

CREATE TABLE `academicperiodgroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `ijourneyid` int(11) NOT NULL,
  `degree.id` int(11) NOT NULL,
  `group.id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `journeyId` (`ijourneyid`),
  KEY `degree.Id` (`degree.id`),
  KEY `group.Id` (`group.id`),
  CONSTRAINT `academicperiodgroups_ibfk_1` FOREIGN KEY (`ijourneyid`) REFERENCES `journey` (`id`),
  CONSTRAINT `academicperiodgroups_ibfk_2` FOREIGN KEY (`degree.id`) REFERENCES `degree` (`id`),
  CONSTRAINT `academicperiodgroups_ibfk_3` FOREIGN KEY (`group.id`) REFERENCES `group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `academicperiodgroups` */

/*Table structure for table `degree` */

DROP TABLE IF EXISTS `degree`;

CREATE TABLE `degree` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `levelid` int(11) NOT NULL,
  `abbreviation` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `levelId` (`levelid`),
  CONSTRAINT `degree_ibfk_1` FOREIGN KEY (`levelid`) REFERENCES `levels` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `degree` */

/*Table structure for table `group` */

DROP TABLE IF EXISTS `group`;

CREATE TABLE `group` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `abbreviation` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `group` */

/*Table structure for table `journey` */

DROP TABLE IF EXISTS `journey`;

CREATE TABLE `journey` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `abbreviation` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `journey` */

/*Table structure for table `levels` */

DROP TABLE IF EXISTS `levels`;

CREATE TABLE `levels` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `abbreviation` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `levels` */

/*Table structure for table `matriculates` */

DROP TABLE IF EXISTS `matriculates`;

CREATE TABLE `matriculates` (
  `id` int(11) NOT NULL,
  `academicPeriodGroupid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `academicPeriodGroupId` (`academicPeriodGroupid`),
  CONSTRAINT `matriculates_ibfk_1` FOREIGN KEY (`academicPeriodGroupid`) REFERENCES `academicperiodgroups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `matriculates` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
