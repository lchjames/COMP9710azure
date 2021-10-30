CREATE DATABASE  IF NOT EXISTS `comp9710`;
USE `comp9710`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: mytestserver1.mysql.database.azure.com    Database: comp9710
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `activity`
--

DROP TABLE IF EXISTS `activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity` (
  `activity_id` int NOT NULL AUTO_INCREMENT COMMENT 'Unique number ID for all activities',
  `module_id` int NOT NULL COMMENT 'Module',
  `activity_name` char(30) DEFAULT NULL COMMENT 'Activity name',
  `description` char(50) DEFAULT NULL COMMENT 'Activity description',
  `start_date` datetime DEFAULT NULL COMMENT 'Activity start effective date',
  `end_date` datetime DEFAULT NULL COMMENT 'Activity end effective date',
  `creted_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Activity created date',
  `created_by` char(6) DEFAULT NULL COMMENT 'Activity created by',
  `last_modified_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Activity last modified date',
  `last_modified_by` char(6) DEFAULT NULL COMMENT 'Activity last modified by',
  PRIMARY KEY (`activity_id`,`module_id`),
  KEY `module_id` (`module_id`),
  CONSTRAINT `activity_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `module` (`module_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity`
--

LOCK TABLES `activity` WRITE;
/*!40000 ALTER TABLE `activity` DISABLE KEYS */;
INSERT INTO `activity` VALUES (1,1,'activity 1: open','activity description','2021-01-01 00:00:00','2021-12-31 00:00:00','2021-09-21 14:47:55','2',NULL,'2'),(2,1,'activity 2: open','activity description','2021-01-01 00:00:00','2021-12-31 00:00:00','2021-09-21 14:47:55','2',NULL,'2'),(3,1,'activity 3: close','activity description','2021-01-01 00:00:00','2021-03-31 00:00:00','2021-09-21 14:47:55','2',NULL,'2'),(7,1,'as','as','2021-10-14 00:00:00','2021-10-15 00:00:00','2021-10-10 10:29:40','admin',NULL,NULL);
/*!40000 ALTER TABLE `activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity_grade`
--

DROP TABLE IF EXISTS `activity_grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_grade` (
  `activity_grade_id` int NOT NULL AUTO_INCREMENT COMMENT 'Unique number ID for all activity grades',
  `user_id` int NOT NULL COMMENT 'A user who receive grades',
  `activity_id` int NOT NULL COMMENT 'An activity done by user',
  `total_mark` int DEFAULT NULL COMMENT 'A activity question total mark',
  `total_received_mark` int DEFAULT NULL COMMENT 'A total received mark',
  `attemp_no` int DEFAULT NULL COMMENT 'Attempt number',
  PRIMARY KEY (`activity_grade_id`,`user_id`,`activity_id`),
  KEY `user_id` (`user_id`),
  KEY `activity_id` (`activity_id`),
  CONSTRAINT `activity_grade_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `activity_grade_ibfk_2` FOREIGN KEY (`activity_id`) REFERENCES `activity` (`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_grade`
--

LOCK TABLES `activity_grade` WRITE;
/*!40000 ALTER TABLE `activity_grade` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity_grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity_question`
--

DROP TABLE IF EXISTS `activity_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_question` (
  `activity_question_id` int NOT NULL AUTO_INCREMENT COMMENT 'Unique number ID for all activity questions',
  `activity_id` int NOT NULL COMMENT 'Activity',
  `question_no` int DEFAULT NULL COMMENT 'Question number',
  `question` char(150) DEFAULT NULL COMMENT 'Question',
  `question_type_id` int NOT NULL COMMENT 'Question type',
  `multiple_answer1` char(50) DEFAULT NULL COMMENT 'First answer',
  `multiple_answer2` char(50) DEFAULT NULL COMMENT 'Second answer',
  `multiple_answer3` char(50) DEFAULT NULL COMMENT 'Third answer',
  `multiple_answer4` char(50) DEFAULT NULL COMMENT 'Forth answer',
  `multiple_correct_answer` char(50) DEFAULT NULL COMMENT 'Correct answer',
  `mark` int DEFAULT NULL COMMENT 'Question score',
  `creted_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Question created date',
  `created_by` char(6) DEFAULT NULL COMMENT 'Question created by',
  `last_modified_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Question last modified date',
  `last_modified_by` char(6) DEFAULT NULL COMMENT 'Question last modified by',
  PRIMARY KEY (`activity_question_id`,`question_type_id`,`activity_id`),
  KEY `question_type_id` (`question_type_id`),
  KEY `activity_id` (`activity_id`),
  CONSTRAINT `activity_question_ibfk_1` FOREIGN KEY (`question_type_id`) REFERENCES `question_type` (`question_type_id`),
  CONSTRAINT `activity_question_ibfk_2` FOREIGN KEY (`activity_id`) REFERENCES `activity` (`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_question`
--

LOCK TABLES `activity_question` WRITE;
/*!40000 ALTER TABLE `activity_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity_question_answer`
--

DROP TABLE IF EXISTS `activity_question_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_question_answer` (
  `activity_answer_id` int NOT NULL AUTO_INCREMENT COMMENT 'Unique number ID for all activity question answer',
  `activity_question_id` int NOT NULL COMMENT 'Activity question',
  `user_id` int NOT NULL COMMENT 'A user who submit a answer',
  `attemp_no` int DEFAULT NULL COMMENT 'Attempt number',
  `multiple_answer` char(50) DEFAULT NULL COMMENT 'Multiple answer',
  `short_answer` char(100) DEFAULT NULL COMMENT 'Short answer',
  `long_answer` char(150) DEFAULT NULL COMMENT 'Long answer',
  `screenshot_path` char(250) DEFAULT NULL COMMENT 'Screenshot file location',
  `received_mark` int DEFAULT NULL COMMENT 'Received mark',
  `answered_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Answer date',
  `review_by` char(6) DEFAULT NULL COMMENT 'A user who review this answer and provide an answer score',
  `review_date` datetime DEFAULT NULL COMMENT 'Answer review date',
  PRIMARY KEY (`activity_answer_id`,`activity_question_id`,`user_id`),
  KEY `activity_question_id` (`activity_question_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `activity_question_answer_ibfk_1` FOREIGN KEY (`activity_question_id`) REFERENCES `activity_question` (`activity_question_id`),
  CONSTRAINT `activity_question_answer_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_question_answer`
--

LOCK TABLES `activity_question_answer` WRITE;
/*!40000 ALTER TABLE `activity_question_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity_question_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `course_id` int NOT NULL AUTO_INCREMENT COMMENT 'Unique number ID for all courses',
  `course_key` char(10) DEFAULT NULL COMMENT 'Course key',
  `course_name` char(50) DEFAULT NULL COMMENT 'Course name',
  `description` char(50) DEFAULT NULL COMMENT 'Course description',
  `semester` char(1) DEFAULT NULL COMMENT 'Semester',
  `year` char(4) DEFAULT NULL COMMENT 'Year',
  `start_date` datetime DEFAULT NULL COMMENT 'Course start effective date',
  `end_date` datetime DEFAULT NULL COMMENT 'Course end effective date',
  `creted_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Course created date',
  `created_by` char(6) DEFAULT NULL COMMENT 'Course created by',
  `last_modified_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Course last modified date',
  `last_modified_by` char(6) DEFAULT NULL COMMENT 'Course last modified by',
  `archive_status` int DEFAULT NULL COMMENT 'Archive status',
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'COMP9781','Cybersecurity','test desciption','1','2021',NULL,NULL,'2021-09-21 14:47:55','2',NULL,'0',0);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document`
--

DROP TABLE IF EXISTS `document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `document` (
  `document_id` int NOT NULL AUTO_INCREMENT COMMENT 'Unique number ID for all documents',
  `activity_id` int NOT NULL COMMENT 'Activity',
  `document_name` char(50) DEFAULT NULL COMMENT 'Document name',
  `description` char(50) DEFAULT NULL COMMENT 'Document description',
  `file_path` char(250) DEFAULT NULL COMMENT 'Document fie location',
  `creted_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Document created date',
  `created_by` char(6) DEFAULT NULL COMMENT 'Document created by',
  `last_modified_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Document last modified date',
  `last_modified_by` char(6) DEFAULT NULL COMMENT 'Document last modified by',
  PRIMARY KEY (`document_id`,`activity_id`),
  KEY `activity_id` (`activity_id`),
  CONSTRAINT `document_ibfk_1` FOREIGN KEY (`activity_id`) REFERENCES `activity` (`activity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document`
--

LOCK TABLES `document` WRITE;
/*!40000 ALTER TABLE `document` DISABLE KEYS */;
INSERT INTO `document` VALUES (2,1,'test','test','test.pdf','2021-10-10 23:21:28',NULL,NULL,NULL);
/*!40000 ALTER TABLE `document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrolment`
--

DROP TABLE IF EXISTS `enrolment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enrolment` (
  `enrol_id` int NOT NULL AUTO_INCREMENT COMMENT 'Unique number ID for all enrolments',
  `course_id` int NOT NULL COMMENT 'A course that is enroled by users',
  `user_id` int NOT NULL COMMENT 'A user who enrol a course',
  `creted_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Enrolment created date',
  `created_by` char(6) DEFAULT NULL COMMENT 'Enrolment created by',
  `last_modified_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Enrolment last modified date',
  `last_modified_by` char(6) DEFAULT NULL COMMENT 'Enrolment last modified by',
  PRIMARY KEY (`enrol_id`,`course_id`,`user_id`),
  KEY `course_id` (`course_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `enrolment_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`),
  CONSTRAINT `enrolment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrolment`
--

LOCK TABLES `enrolment` WRITE;
/*!40000 ALTER TABLE `enrolment` DISABLE KEYS */;
/*!40000 ALTER TABLE `enrolment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `management`
--

DROP TABLE IF EXISTS `management`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `management` (
  `manage_id` int NOT NULL AUTO_INCREMENT COMMENT 'Unique number ID for all managements',
  `course_id` int NOT NULL COMMENT 'A course that is managed by users',
  `user_id` int NOT NULL COMMENT 'A user who manage courses',
  `creted_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Management created date',
  `created_by` char(6) DEFAULT NULL COMMENT 'Management created by',
  `last_modified_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Management last modified date',
  `last_modified_by` char(6) DEFAULT NULL COMMENT 'Management last modified by',
  PRIMARY KEY (`manage_id`,`course_id`,`user_id`),
  KEY `course_id` (`course_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `management_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`),
  CONSTRAINT `management_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `management`
--

LOCK TABLES `management` WRITE;
/*!40000 ALTER TABLE `management` DISABLE KEYS */;
/*!40000 ALTER TABLE `management` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module`
--

DROP TABLE IF EXISTS `module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `module` (
  `module_id` int NOT NULL AUTO_INCREMENT COMMENT 'Unique number ID for all modules',
  `course_id` int NOT NULL COMMENT 'Course',
  `module_name` char(100) DEFAULT NULL COMMENT 'Module name',
  `start_date` datetime DEFAULT NULL COMMENT 'Module start effective date',
  `end_date` datetime DEFAULT NULL COMMENT 'Module end effective date',
  `creted_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Module created date',
  `created_by` char(6) DEFAULT NULL COMMENT 'Module created by',
  `last_modified_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Module last modified date',
  `last_modified_by` char(6) DEFAULT NULL COMMENT 'Module last modified by',
  PRIMARY KEY (`module_id`,`course_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `module_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module`
--

LOCK TABLES `module` WRITE;
/*!40000 ALTER TABLE `module` DISABLE KEYS */;
INSERT INTO `module` VALUES (1,1,'Module1 - Understanding the various attack types','2021-09-01 02:47:12','2021-11-30 02:47:28','2021-09-21 14:47:55','2','2021-10-08 14:13:10','2'),(2,1,'Module2 - Install and Configure Type II Hypervisor','2021-09-02 00:00:00','2021-11-25 00:00:00','2021-09-21 14:47:55','2','2021-10-29 11:29:36','admin'),(3,1,'Module3 - Managing Local Storage and Virtual Hard Disks','2021-09-03 00:00:00','2021-11-30 00:00:00','2021-09-21 14:47:55','2','2021-10-29 11:29:45','admin'),(4,1,'Module4 - Write-Protect a USB Drive and Block a Port','2021-09-04 02:47:22','2021-09-30 02:47:35','2021-09-21 14:47:55','2','2021-09-27 02:47:36','2'),(5,1,'Module5 - this module already expired at 2021-03-01','2021-09-05 02:47:24','2021-09-10 02:47:33','2021-09-21 14:47:55','2','2021-09-27 02:47:35','2'),(6,1,'Module6 - This module will be opened at 2021-12-01','2021-09-06 02:47:26','2021-09-10 02:47:37','2021-09-21 14:47:55','2','2021-09-27 02:47:38','2'),(10,1,'7777777','2021-10-29 00:00:00','2021-10-31 00:00:00','2021-10-10 23:22:04','admin',NULL,NULL);
/*!40000 ALTER TABLE `module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `objective`
--

DROP TABLE IF EXISTS `objective`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `objective` (
  `objective_id` int NOT NULL AUTO_INCREMENT COMMENT 'Unique number ID for all objective',
  `activity_id` int NOT NULL COMMENT 'Activity',
  `description` char(50) DEFAULT NULL COMMENT 'Activity Objective description',
  `creted_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Activity Objective created date',
  `created_by` char(6) DEFAULT NULL COMMENT 'Activity Objective created by',
  `last_modified_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Activity objective last modified date',
  `last_modified_by` char(6) DEFAULT NULL COMMENT 'Activity objective last modified by',
  PRIMARY KEY (`objective_id`,`activity_id`),
  KEY `activity_id` (`activity_id`),
  CONSTRAINT `objective_ibfk_1` FOREIGN KEY (`activity_id`) REFERENCES `activity` (`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objective`
--

LOCK TABLES `objective` WRITE;
/*!40000 ALTER TABLE `objective` DISABLE KEYS */;
/*!40000 ALTER TABLE `objective` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_type`
--

DROP TABLE IF EXISTS `question_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question_type` (
  `question_type_id` int NOT NULL AUTO_INCREMENT COMMENT 'Unique number ID for all question type',
  `question_type_name` char(15) DEFAULT NULL COMMENT 'Question type name',
  `creted_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Question type created date',
  `created_by` char(6) DEFAULT NULL COMMENT 'Question type created by',
  `last_modified_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Question type last modified date',
  `last_modified_by` char(6) DEFAULT NULL COMMENT 'Question type last modified by',
  PRIMARY KEY (`question_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_type`
--

LOCK TABLES `question_type` WRITE;
/*!40000 ALTER TABLE `question_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `question_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `role_id` int NOT NULL AUTO_INCREMENT COMMENT 'Unique number ID for all roles',
  `role_name` char(20) DEFAULT NULL COMMENT 'Role name',
  `creted_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Role created date',
  `created_by` char(6) DEFAULT NULL COMMENT 'Role created by',
  `last_modified_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Role last modified date',
  `last_modified_by` char(6) DEFAULT NULL COMMENT 'Role last modified by',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'topic_coordinator','2021-09-21 14:47:55','0',NULL,'0'),(2,'tutor','2021-09-21 14:47:55','0',NULL,'0'),(3,'student','2021-09-21 14:47:55','0',NULL,'0');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test` (
  `test_id` int NOT NULL AUTO_INCREMENT COMMENT 'Unique number ID for all tests',
  `module_id` int NOT NULL COMMENT 'Module',
  `test_name` char(30) DEFAULT NULL COMMENT 'Test name',
  `description` char(50) DEFAULT NULL COMMENT 'Test description',
  `start_date` datetime DEFAULT NULL COMMENT 'Test start effective date',
  `end_date` datetime DEFAULT NULL COMMENT 'Test end effective date',
  `creted_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Test created date',
  `created_by` char(6) DEFAULT NULL COMMENT 'Test created by',
  `last_modified_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Test last modified date',
  `last_modified_by` char(6) DEFAULT NULL COMMENT 'Test last modified by',
  PRIMARY KEY (`test_id`,`module_id`),
  KEY `module_id` (`module_id`),
  CONSTRAINT `test_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `module` (`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_grade`
--

DROP TABLE IF EXISTS `test_grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_grade` (
  `test_grade_id` int NOT NULL AUTO_INCREMENT COMMENT 'Unique number ID for all test grades',
  `user_id` int NOT NULL COMMENT 'A user who receive grades',
  `test_id` int NOT NULL COMMENT 'A test done by a user',
  `total_mark` int DEFAULT NULL COMMENT 'A test question total mark',
  `total_received_mark` int DEFAULT NULL COMMENT 'A total received mark',
  `attemp_no` int DEFAULT NULL COMMENT 'Attempt number',
  PRIMARY KEY (`test_grade_id`,`user_id`,`test_id`),
  KEY `user_id` (`user_id`),
  KEY `test_id` (`test_id`),
  CONSTRAINT `test_grade_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `test_grade_ibfk_2` FOREIGN KEY (`test_id`) REFERENCES `test` (`test_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_grade`
--

LOCK TABLES `test_grade` WRITE;
/*!40000 ALTER TABLE `test_grade` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_question`
--

DROP TABLE IF EXISTS `test_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_question` (
  `test_question_id` int NOT NULL AUTO_INCREMENT COMMENT 'Unique number ID for all test questions',
  `question_no` int DEFAULT NULL COMMENT 'Test Question number',
  `question` char(150) DEFAULT NULL COMMENT 'Test Question',
  `question_type_id` int NOT NULL COMMENT 'Question type',
  `multiple_answer1` char(50) DEFAULT NULL COMMENT 'First answer',
  `multiple_answer2` char(50) DEFAULT NULL COMMENT 'Second answer',
  `multiple_answer3` char(50) DEFAULT NULL COMMENT 'Third answer',
  `multiple_answer4` char(50) DEFAULT NULL COMMENT 'Forth answer',
  `multiple_correct_answer` char(50) DEFAULT NULL COMMENT 'Correct answer',
  `mark` int DEFAULT NULL COMMENT 'Test question score',
  `creted_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Test question created date',
  `created_by` char(6) DEFAULT NULL COMMENT 'Test question created by',
  `last_modified_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Test question last modified date',
  `last_modified_by` char(6) DEFAULT NULL COMMENT 'Test question last modified by',
  PRIMARY KEY (`test_question_id`,`question_type_id`),
  KEY `question_type_id` (`question_type_id`),
  CONSTRAINT `test_question_ibfk_1` FOREIGN KEY (`question_type_id`) REFERENCES `question_type` (`question_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_question`
--

LOCK TABLES `test_question` WRITE;
/*!40000 ALTER TABLE `test_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_question_answer`
--

DROP TABLE IF EXISTS `test_question_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_question_answer` (
  `test_answer_id` int NOT NULL AUTO_INCREMENT COMMENT 'Unique number ID for all test questions answer',
  `test_question_id` int NOT NULL COMMENT 'Test question',
  `user_id` int NOT NULL COMMENT 'A user who submit a answer',
  `attemp_no` int DEFAULT NULL COMMENT 'Attempt number',
  `multiple_answer` char(50) DEFAULT NULL COMMENT 'Multiple answer',
  `short_answer` char(100) DEFAULT NULL COMMENT 'Short answer',
  `long_answer` char(150) DEFAULT NULL COMMENT 'Long answer',
  `received_mark` int DEFAULT NULL COMMENT 'Recevied mark',
  `answered_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Answer date',
  `review_by` char(6) DEFAULT NULL COMMENT 'A user who review this answer and provide an answer score',
  `review_date` datetime DEFAULT NULL COMMENT 'Answer review date',
  PRIMARY KEY (`test_answer_id`,`test_question_id`,`user_id`),
  KEY `test_question_id` (`test_question_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `test_question_answer_ibfk_1` FOREIGN KEY (`test_question_id`) REFERENCES `test_question` (`test_question_id`),
  CONSTRAINT `test_question_answer_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_question_answer`
--

LOCK TABLES `test_question_answer` WRITE;
/*!40000 ALTER TABLE `test_question_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_question_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_manual_document`
--

DROP TABLE IF EXISTS `user_manual_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_manual_document` (
  `document_id` int NOT NULL AUTO_INCREMENT COMMENT 'Unique number ID for all manual documents',
  `role_id` int NOT NULL COMMENT 'Document types',
  `document_name` char(30) DEFAULT NULL COMMENT 'Document name',
  `file_path` char(250) DEFAULT NULL COMMENT 'Document file location',
  `creted_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Document created date',
  `created_by` char(6) DEFAULT NULL COMMENT 'Document created by',
  `last_modified_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Document last modified date',
  `last_modified_by` char(6) DEFAULT NULL COMMENT 'Document last modified by',
  PRIMARY KEY (`document_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `user_manual_document_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_manual_document`
--

LOCK TABLES `user_manual_document` WRITE;
/*!40000 ALTER TABLE `user_manual_document` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_manual_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT COMMENT 'Unique number ID for all users',
  `role_id` int NOT NULL COMMENT 'User type',
  `title` char(3) DEFAULT NULL COMMENT 'User title',
  `first_name` char(20) DEFAULT NULL COMMENT 'User first name',
  `middle_name` char(20) DEFAULT NULL COMMENT 'User middle name',
  `family_name` char(20) DEFAULT NULL COMMENT 'User family name',
  `gender` char(1) DEFAULT NULL COMMENT 'User gender',
  `username` char(20) DEFAULT NULL COMMENT 'Username',
  `password` char(32) DEFAULT NULL COMMENT 'Password',
  `email_address` char(30) DEFAULT NULL COMMENT 'User email address',
  `student_id` char(7) DEFAULT NULL COMMENT 'Student ID or Staff ID',
  `FAN` char(8) DEFAULT NULL COMMENT 'FAN',
  `start_date` datetime DEFAULT NULL COMMENT 'User start effective date',
  `end_date` datetime DEFAULT NULL COMMENT 'User end effective date',
  `creted_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'User created date',
  `created_by` char(6) DEFAULT NULL COMMENT 'User created by',
  `last_modified_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'User last modified date',
  `last_modified_by` char(6) DEFAULT NULL COMMENT 'User last modified by',
  `vm1_port` int DEFAULT NULL COMMENT 'virtual machine port 1',
  `vm2_port` int DEFAULT NULL COMMENT 'virtual machine port 2',
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,2,NULL,'f1','m1','l1','M','test','098f6bcd4621d373cade4e832627b4f6','asdasdsd@asdasd.com',NULL,NULL,NULL,NULL,'2021-09-21 14:47:55','0','2021-10-30 12:10:18','admin',6000,6201),(2,1,NULL,'f2','m2','l2','F','admin','21232f297a57a5a743894a0e4a801fc3',NULL,NULL,NULL,NULL,NULL,'2021-09-21 14:47:55','0','2021-09-27 03:12:45','0',NULL,NULL),(3,3,NULL,'f3','m3','l3','N','lau0266','38243f2b627767520abf680060759349',NULL,NULL,NULL,NULL,NULL,'2021-09-21 14:47:55','0','2021-09-27 03:12:52','0',NULL,NULL),(20,1,'mr','vasu','','lg',NULL,'vasulg','779d5f897e9374eff2682b186669be77','notset@flinders.edu.au',NULL,'vasu0007',NULL,NULL,'2021-10-29 11:47:02','',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video`
--

DROP TABLE IF EXISTS `video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `video` (
  `video_id` int NOT NULL AUTO_INCREMENT COMMENT 'Unique number ID for all videos',
  `video_type_id` int NOT NULL COMMENT 'Video type',
  `activity_id` int NOT NULL COMMENT 'Activity',
  `video_name` char(50) DEFAULT NULL COMMENT 'Video name',
  `description` char(50) DEFAULT NULL COMMENT 'Video description',
  `file_path` char(200) DEFAULT NULL COMMENT 'Video file location',
  `url_link` char(200) DEFAULT NULL COMMENT 'Video URL link',
  `creted_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Video creted date',
  `created_by` char(6) DEFAULT NULL COMMENT 'Video created by',
  `last_modified_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Video last modified date',
  `last_modified_by` char(6) DEFAULT NULL COMMENT 'Video last modified by',
  PRIMARY KEY (`video_id`,`activity_id`,`video_type_id`),
  KEY `activity_id` (`activity_id`),
  KEY `video_type_id` (`video_type_id`),
  CONSTRAINT `video_ibfk_1` FOREIGN KEY (`activity_id`) REFERENCES `activity` (`activity_id`),
  CONSTRAINT `video_ibfk_2` FOREIGN KEY (`video_type_id`) REFERENCES `video_type` (`video_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video`
--

LOCK TABLES `video` WRITE;
/*!40000 ALTER TABLE `video` DISABLE KEYS */;
INSERT INTO `video` VALUES (11,1,1,'a','a',NULL,'rvelwxuzwEE','2021-10-10 14:51:38','admin',NULL,NULL);
/*!40000 ALTER TABLE `video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video_type`
--

DROP TABLE IF EXISTS `video_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `video_type` (
  `video_type_id` int NOT NULL AUTO_INCREMENT COMMENT 'Unique number ID for all video types',
  `video_type_name` char(15) DEFAULT NULL COMMENT 'Video type name',
  `creted_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Video type created date',
  `created_by` char(6) DEFAULT NULL COMMENT 'Video type created by',
  `last_modified_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Video type last modified date',
  `last_modified_by` char(6) DEFAULT NULL COMMENT 'Video type last modified by',
  PRIMARY KEY (`video_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_type`
--

LOCK TABLES `video_type` WRITE;
/*!40000 ALTER TABLE `video_type` DISABLE KEYS */;
INSERT INTO `video_type` VALUES (1,'link','2021-10-08 14:08:03',NULL,'2021-10-08 05:37:43',NULL),(2,'video','2021-10-08 14:08:18',NULL,'2021-10-08 05:38:10',NULL);
/*!40000 ALTER TABLE `video_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `virtual_machine`
--

DROP TABLE IF EXISTS `virtual_machine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `virtual_machine` (
  `vm_id` int NOT NULL AUTO_INCREMENT COMMENT 'Unique number ID for all managements',
  `vm_name` char(20) DEFAULT NULL COMMENT 'Virtual machine name',
  `creted_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Virtual machine created date',
  `created_by` char(6) DEFAULT NULL COMMENT 'Virtual machine created by',
  `last_modified_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Virtual machine last modified date',
  `last_modified_by` char(6) DEFAULT NULL COMMENT 'Virtual machine last modified by',
  PRIMARY KEY (`vm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `virtual_machine`
--

LOCK TABLES `virtual_machine` WRITE;
/*!40000 ALTER TABLE `virtual_machine` DISABLE KEYS */;
/*!40000 ALTER TABLE `virtual_machine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vm_management`
--

DROP TABLE IF EXISTS `vm_management`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vm_management` (
  `vm_mng_id` int NOT NULL AUTO_INCREMENT COMMENT 'Unique number ID for all VM managements',
  `vm_id` int NOT NULL COMMENT 'A VM that is assigned to a course',
  `course_id` int NOT NULL COMMENT 'A course for VMs',
  `creted_date_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'VM management created date ',
  `created_by` char(6) DEFAULT NULL COMMENT 'VM management created by',
  `last_modified_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'VM management last modified date',
  `last_modified_by` char(6) DEFAULT NULL COMMENT 'VM management last modified by',
  PRIMARY KEY (`vm_mng_id`,`vm_id`),
  KEY `vm_id` (`vm_id`),
  CONSTRAINT `vm_management_ibfk_1` FOREIGN KEY (`vm_id`) REFERENCES `virtual_machine` (`vm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vm_management`
--

LOCK TABLES `vm_management` WRITE;
/*!40000 ALTER TABLE `vm_management` DISABLE KEYS */;
/*!40000 ALTER TABLE `vm_management` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-30 23:00:54
