# Host: localhost  (Version: 5.1.73-community)
# Date: 2015-06-01 21:31:11
# Generator: MySQL-Front 5.3  (Build 4.214)

/*!40101 SET NAMES latin1 */;

#
# Structure for table "employee"
#

DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `emp_name` varchar(10) NOT NULL,
  `salary` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "employee"
#

INSERT INTO `employee` VALUES ('abc',200),('mkmk',33),('abc',200),('mkmk',33);

#
# Structure for table "registration"
#

DROP TABLE IF EXISTS `registration`;
CREATE TABLE `registration` (
  `fname` varchar(15) NOT NULL,
  `lname` varchar(15) NOT NULL,
  `uid` varchar(10) NOT NULL,
  `password` varchar(32) NOT NULL,
  `email` varchar(35) NOT NULL,
  `dob` varchar(15) NOT NULL,
  `mno` bigint(10) DEFAULT NULL,
  `gender` varchar(6) NOT NULL,
  `occupation` varchar(15) DEFAULT NULL,
  `country` varchar(30) DEFAULT NULL,
  `state` varchar(30) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`uid`,`email`),
  KEY `uid` (`uid`),
  KEY `password` (`password`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "registration"
#

INSERT INTO `registration` VALUES ('Harshal','Carpenter','hcarp','827ccb0eea8a706c4c34a16891f84e7b','hcarp@gmail.com','01/01/1992',6508896443,'male','Student','Russia','Khabarovskiy','abc'),('Honey','galeen','honeyg','25d55ad283aa400af464c76d713c07ad','honey@gmail.com','03/06/1991',6508896445,'female','Student','USA','California','Hayward'),('John','Cena','jcena','827ccb0eea8a706c4c34a16891f84e7b','jcena@gmail.com','06/04/2015',6508896441,'male','Professional','USA','Kansas','dishdjs'),('JIL','trivedi','jtr','2e99bf4e42962410038bc6fa4ce40d97','jt@gmail.com','01/01/1992',6508896440,'female','Professional','USA','California','Hayward'),('kk','kk','kk','dc468c70fb574ebd07287b38d0d0676d','ss@gmail.com','04/10/2013',1234567890,'female','Service','',NULL,''),('n','n','n','e6c151d449e1db05b1ffb5ad5ec656cf','nkhanpara08@gmail.com','07/25/1992',9712056027,'male','Business','Austria','Kaernten','ahmedabad'),('nayan','h','nayan','b257312296cecbec7a9918cf5661dc51','nkhanpara@gmail.com','07/25/1992',9712056027,'male','Business','',NULL,''),('abc','def','nnn','eab71244afb687f16d8c4f5ee9d6ef0e','fgss@gmail.com','04/03/2013',1234567890,'male','Retired','Bahamas','Cat Island','nmkl'),('Payal','Gandhi','pgandhi','8e55ecef6a2e2b363e7f56fe00d6cd64','payalgandhi1989@gmail.com','09/30/1989',6509605204,'female','Student','USA','California','Newark'),('Tanay','Suthar','tsuthar','25f9e794323b453885f5181f1b624d0b','tsuthar5@gmail.com','04/11/1990',6508896445,'male','Student','USA','California','union city'),('varun','shah','varun312','25f9e794323b453885f5181f1b624d0b','varun.shah3129@gmail.com','04/29/2015',6508896447,'male','Student','USA','California','union city'),('varun','shah','varun3129','fcea920f7412b5da7be0cf42b8c93759','varun.shah3129@gmail.com','12/03/1990',6508896447,'male','Student','USA','California','union city'),('Vatsal','Gajera','vgajera7','20f745434d7becbeffe9dde240c54275','vgajera7@gmail.com','07/25/1992',9712056027,'male','Student','India','Gujarat','Junagadh');

#
# Structure for table "property_info"
#

DROP TABLE IF EXISTS `property_info`;
CREATE TABLE `property_info` (
  `fixedassest_id` int(10) NOT NULL AUTO_INCREMENT,
  `prop_name` varchar(50) NOT NULL,
  `date` varchar(15) NOT NULL,
  `location` varchar(10) NOT NULL,
  `latest_price` float(10,0) NOT NULL,
  `price` float(10,0) NOT NULL,
  `uid` varchar(10) NOT NULL,
  PRIMARY KEY (`fixedassest_id`),
  KEY `abc` (`uid`) USING BTREE,
  CONSTRAINT `property_info_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `registration` (`uid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

#
# Data for table "property_info"
#

INSERT INTO `property_info` VALUES (1,'Commercial','22-3-2012','jgi',868,38,'n'),(2,'Residential','05/26/2015','satellite',3000000,2400000,'nnn'),(3,'Land','05/13/2015','satellite',100000000,90000000,'varun312'),(4,'Residential','03/05/2015','Newark',100000000,7000000,'pgandhi');

#
# Structure for table "mutualfund_info"
#

DROP TABLE IF EXISTS `mutualfund_info`;
CREATE TABLE `mutualfund_info` (
  `mf_id` int(10) NOT NULL AUTO_INCREMENT,
  `mf_name` varchar(50) NOT NULL,
  `mf_price` float(8,0) NOT NULL,
  `quantity` int(8) NOT NULL,
  `date` varchar(15) NOT NULL,
  `uid` varchar(10) NOT NULL,
  PRIMARY KEY (`mf_id`),
  KEY `abc` (`uid`),
  CONSTRAINT `abc` FOREIGN KEY (`uid`) REFERENCES `registration` (`uid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

#
# Data for table "mutualfund_info"
#

INSERT INTO `mutualfund_info` VALUES (1,'14053455.002066',99,99,'04/24/2013','nnn'),(2,'Kotak Mahindra',12000,20,'06/02/2015','pgandhi'),(3,'Voya Russia I',2200,22,'05/11/2015','varun312');

#
# Structure for table "loan_info"
#

DROP TABLE IF EXISTS `loan_info`;
CREATE TABLE `loan_info` (
  `loan_id` int(4) NOT NULL AUTO_INCREMENT,
  `loan_type` varchar(30) NOT NULL,
  `loan_amt` float(10,0) NOT NULL,
  `emi_start_date` varchar(10) NOT NULL,
  `rate` float(10,0) NOT NULL,
  `period_unit` varchar(10) NOT NULL,
  `tenure` int(10) NOT NULL,
  `uid` varchar(10) NOT NULL,
  PRIMARY KEY (`loan_id`),
  KEY `u_i` (`uid`) USING BTREE,
  CONSTRAINT `loan_info_ibfk_3` FOREIGN KEY (`uid`) REFERENCES `registration` (`uid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

#
# Data for table "loan_info"
#

INSERT INTO `loan_info` VALUES (13,'Educational',2500,'03/01/2013',10,'Months',7,'vgajera7'),(14,'Personal',88,'04/23/2013',22,'Years',5,'n'),(15,'Auto',1000,'06/01/2015',10,'Months',2,'nnn'),(16,'Educational',21000,'06/01/2016',8,'Years',2,'pgandhi'),(17,'Home',6000000,'07/01/2015',5,'Years',30,'pgandhi'),(18,'Educational',100000,'07/01/2015',9,'Months',12,'jcena'),(21,'Educational',25000,'09/02/2015',3,'Months',50,'varun312');

#
# Structure for table "bullion_info"
#

DROP TABLE IF EXISTS `bullion_info`;
CREATE TABLE `bullion_info` (
  `bullion_id` int(11) NOT NULL AUTO_INCREMENT,
  `commodity_name` varchar(50) NOT NULL,
  `quantity` int(50) NOT NULL,
  `price` float(50,0) NOT NULL,
  `date` varchar(50) NOT NULL,
  `uid` varchar(11) NOT NULL,
  PRIMARY KEY (`bullion_id`),
  KEY `uid` (`uid`),
  CONSTRAINT `bullion_info_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `registration` (`uid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

#
# Data for table "bullion_info"
#

INSERT INTO `bullion_info` VALUES (1,'Gold',10,24000,'05/27/2015','nnn'),(2,'Gold',200,25000,'06/02/2015','pgandhi'),(3,'Silver',5000,34000,'01/01/2015','varun312'),(4,'Gold',100,27000,'03/10/2015','tsuthar'),(5,'Gold',150,26000,'06/04/2013','jcena');

#
# Structure for table "stock_info"
#

DROP TABLE IF EXISTS `stock_info`;
CREATE TABLE `stock_info` (
  `stock_id` int(4) NOT NULL AUTO_INCREMENT,
  `stock_name` varchar(30) NOT NULL,
  `quantity` int(10) NOT NULL,
  `date` varchar(10) NOT NULL,
  `price` float(10,0) NOT NULL,
  `uid` varchar(10) NOT NULL,
  PRIMARY KEY (`stock_id`,`stock_name`),
  KEY `u_i` (`uid`),
  CONSTRAINT `u_i` FOREIGN KEY (`uid`) REFERENCES `registration` (`uid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

#
# Data for table "stock_info"
#

INSERT INTO `stock_info` VALUES (1,'AKS',11,'22-3-2012',38,'n'),(2,'BHP',12,'04/10/2013',290,'n'),(3,'TXN',99,'04/02/2013',78,'nnn'),(4,'IMOS',99,'04/02/2013',78,'nnn'),(6,'Google',500,'05/26/2015',5000,'pgandhi'),(8,'IMOS',12,'05/05/2015',1200,'varun312'),(9,'IMOS',33,'06/04/2013',15000,'jcena');
