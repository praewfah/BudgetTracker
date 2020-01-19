/*
 Navicat MySQL Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : localhost:8889
 Source Schema         : budgettracker

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 20/01/2020 02:10:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for budgets
-- ----------------------------
DROP TABLE IF EXISTS `budgets`;
CREATE TABLE `budgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `budget_month` varchar(2) DEFAULT NULL,
  `budget_year` int(4) DEFAULT NULL,
  `budget_type` varchar(255) DEFAULT NULL,
  `budget_category` varchar(255) DEFAULT NULL,
  `budget_amount` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of budgets
-- ----------------------------
BEGIN;
INSERT INTO `budgets` VALUES (1, '01', 2020, 'Income', 'Salary', 97000);
INSERT INTO `budgets` VALUES (2, '01', 2020, 'Income', 'Investing Income', 10000);
INSERT INTO `budgets` VALUES (3, '01', 2020, 'Expense', 'Loans', 21300);
INSERT INTO `budgets` VALUES (4, '01', 2020, 'Expense', 'Loans', 15500);
INSERT INTO `budgets` VALUES (5, '01', 2020, 'Expense', 'Electricity', 1500);
INSERT INTO `budgets` VALUES (6, '01', 2020, 'Expense', 'Water', 100);
INSERT INTO `budgets` VALUES (7, '01', 2020, 'Expense', 'Personal Items', 7500);
INSERT INTO `budgets` VALUES (8, '01', 2020, 'Expense', 'Other', 50000);
COMMIT;

-- ----------------------------
-- Table structure for transections
-- ----------------------------
DROP TABLE IF EXISTS `transections`;
CREATE TABLE `transections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_budget` int(11) DEFAULT NULL,
  `transection_date` datetime DEFAULT NULL,
  `budget_type` varchar(255) DEFAULT NULL,
  `budget_category` varchar(255) DEFAULT NULL,
  `description` text,
  `actual` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of transections
-- ----------------------------
BEGIN;
INSERT INTO `transections` VALUES (1, NULL, '2020-01-01 00:00:00', 'Income', 'Salary', 'My Salary 01/2020', 55000);
INSERT INTO `transections` VALUES (2, NULL, '2020-01-01 00:00:00', 'Income', 'Salary', 'Partner\'s Salary 01/2020', 42000);
INSERT INTO `transections` VALUES (3, NULL, '2020-01-01 00:00:00', 'Expense', 'Loans', 'Home loan', 21300);
INSERT INTO `transections` VALUES (4, NULL, '2020-01-01 00:00:00', 'Expense', 'Loans', 'Car loan', 15500);
INSERT INTO `transections` VALUES (5, NULL, '2020-01-05 00:00:00', 'Expense', 'Personal Items', 'Party', 8000);
INSERT INTO `transections` VALUES (6, NULL, '2020-01-05 00:00:00', 'Expense', 'Other', 'Credit Card Payment', 49780);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
