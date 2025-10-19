-- phpMyAdmin SQL Dump
-- version 5.2.1deb3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 19, 2025 at 10:01 AM
-- Server version: 8.0.43-0ubuntu0.24.04.2
-- PHP Version: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `omeka`
--

-- --------------------------------------------------------

--
-- Table structure for table `api_key`
--

CREATE TABLE `api_key` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_id` int NOT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `credential_hash` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_ip` varbinary(16) DEFAULT NULL COMMENT '(DC2Type:ip_address)',
  `last_accessed` datetime DEFAULT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `asset`
--

CREATE TABLE `asset` (
  `id` int NOT NULL,
  `owner_id` int DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `media_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `storage_id` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `extension` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt_text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `csvimport_entity`
--

CREATE TABLE `csvimport_entity` (
  `id` int NOT NULL,
  `job_id` int NOT NULL,
  `entity_id` int NOT NULL,
  `resource_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `csvimport_entity`
--

INSERT INTO `csvimport_entity` (`id`, `job_id`, `entity_id`, `resource_type`) VALUES
(1, 1, 5, 'items'),
(2, 1, 6, 'items'),
(3, 1, 7, 'items'),
(4, 1, 8, 'items'),
(5, 1, 9, 'items'),
(6, 2, 10, 'items'),
(7, 2, 11, 'items'),
(8, 2, 12, 'items'),
(9, 2, 13, 'items'),
(10, 2, 14, 'items'),
(11, 3, 15, 'items'),
(12, 3, 16, 'items'),
(13, 3, 17, 'items'),
(14, 3, 18, 'items'),
(15, 3, 19, 'items'),
(16, 4, 20, 'items'),
(17, 4, 21, 'items'),
(18, 4, 22, 'items'),
(19, 4, 23, 'items'),
(20, 4, 24, 'items'),
(21, 5, 25, 'items'),
(22, 5, 26, 'items'),
(23, 5, 27, 'items'),
(24, 5, 28, 'items'),
(25, 5, 29, 'items'),
(26, 6, 30, 'items'),
(27, 6, 31, 'items'),
(28, 6, 32, 'items'),
(29, 6, 33, 'items'),
(30, 6, 34, 'items'),
(31, 8, 35, 'items'),
(32, 8, 36, 'items'),
(33, 8, 37, 'items'),
(34, 8, 38, 'items'),
(35, 8, 39, 'items'),
(36, 10, 40, 'items'),
(37, 10, 41, 'items'),
(38, 10, 42, 'items'),
(39, 10, 43, 'items'),
(40, 10, 44, 'items'),
(41, 12, 45, 'items'),
(42, 12, 46, 'items'),
(43, 12, 47, 'items'),
(44, 12, 48, 'items'),
(45, 12, 49, 'items'),
(46, 14, 50, 'items'),
(47, 14, 51, 'items'),
(48, 14, 52, 'items'),
(49, 14, 53, 'items'),
(50, 14, 54, 'items'),
(51, 15, 55, 'items'),
(52, 15, 56, 'items'),
(53, 15, 57, 'items'),
(54, 15, 58, 'items'),
(55, 15, 59, 'items'),
(56, 17, 60, 'items'),
(57, 17, 61, 'items'),
(58, 17, 62, 'items'),
(59, 17, 63, 'items'),
(60, 17, 64, 'items'),
(61, 18, 65, 'items'),
(62, 18, 66, 'items'),
(63, 18, 67, 'items'),
(64, 18, 68, 'items'),
(65, 18, 69, 'items'),
(66, 19, 70, 'items'),
(67, 19, 71, 'items'),
(68, 19, 72, 'items'),
(69, 19, 73, 'items'),
(70, 19, 74, 'items'),
(71, 20, 75, 'items'),
(72, 20, 76, 'items'),
(73, 20, 77, 'items'),
(74, 20, 78, 'items'),
(75, 20, 79, 'items'),
(76, 22, 80, 'items'),
(77, 22, 81, 'items'),
(78, 22, 82, 'items'),
(79, 22, 83, 'items'),
(80, 22, 84, 'items'),
(81, 23, 85, 'items'),
(82, 23, 86, 'items'),
(83, 23, 87, 'items'),
(84, 23, 88, 'items'),
(85, 23, 89, 'items'),
(86, 24, 90, 'items'),
(87, 24, 91, 'items'),
(88, 24, 92, 'items'),
(89, 24, 93, 'items'),
(90, 24, 94, 'items'),
(91, 25, 95, 'items'),
(92, 25, 96, 'items'),
(93, 25, 97, 'items'),
(94, 25, 98, 'items'),
(95, 25, 99, 'items'),
(96, 26, 100, 'items'),
(97, 26, 101, 'items'),
(98, 26, 102, 'items'),
(99, 26, 103, 'items'),
(100, 26, 104, 'items'),
(101, 27, 105, 'items'),
(102, 27, 106, 'items'),
(103, 27, 107, 'items'),
(104, 27, 108, 'items'),
(105, 27, 109, 'items'),
(106, 28, 110, 'items'),
(107, 28, 111, 'items'),
(108, 28, 112, 'items'),
(109, 28, 113, 'items'),
(110, 28, 114, 'items'),
(111, 29, 115, 'items'),
(112, 29, 116, 'items'),
(113, 29, 117, 'items'),
(114, 29, 118, 'items'),
(115, 29, 119, 'items'),
(116, 30, 120, 'items'),
(117, 30, 121, 'items'),
(118, 30, 122, 'items'),
(119, 30, 123, 'items'),
(120, 30, 124, 'items'),
(121, 31, 125, 'items'),
(122, 31, 126, 'items'),
(123, 31, 127, 'items'),
(124, 31, 128, 'items'),
(125, 31, 129, 'items'),
(126, 34, 130, 'items'),
(127, 34, 131, 'items'),
(128, 34, 132, 'items'),
(129, 34, 133, 'items'),
(130, 34, 134, 'items'),
(136, 41, 140, 'items'),
(137, 41, 141, 'items'),
(138, 41, 142, 'items'),
(139, 41, 143, 'items'),
(140, 41, 144, 'items'),
(141, 42, 145, 'items'),
(142, 42, 146, 'items'),
(143, 42, 147, 'items'),
(144, 42, 148, 'items'),
(145, 42, 149, 'items');

-- --------------------------------------------------------

--
-- Table structure for table `csvimport_import`
--

CREATE TABLE `csvimport_import` (
  `id` int NOT NULL,
  `job_id` int NOT NULL,
  `undo_job_id` int DEFAULT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resource_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `has_err` tinyint(1) NOT NULL,
  `stats` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `csvimport_import`
--

INSERT INTO `csvimport_import` (`id`, `job_id`, `undo_job_id`, `comment`, `resource_type`, `has_err`, `stats`) VALUES
(1, 1, NULL, '', 'items', 0, '{\"added\":{\"items\":5}}'),
(2, 2, NULL, '', 'items', 0, '{\"added\":{\"items\":5}}'),
(3, 3, NULL, '', 'items', 0, '{\"added\":{\"items\":5}}'),
(4, 4, NULL, '', 'items', 0, '{\"added\":{\"items\":5}}'),
(5, 5, NULL, '', 'items', 0, '{\"added\":{\"items\":5}}'),
(6, 6, NULL, '', 'items', 0, '{\"added\":{\"items\":5}}'),
(7, 8, NULL, '', 'items', 0, '{\"added\":{\"items\":5}}'),
(8, 10, NULL, '', 'items', 0, '{\"added\":{\"items\":5}}'),
(9, 12, NULL, '', 'items', 0, '{\"added\":{\"items\":5}}'),
(10, 14, NULL, '', 'items', 1, '{\"added\":{\"items\":5}}'),
(11, 15, NULL, '', 'items', 0, '{\"added\":{\"items\":5}}'),
(12, 17, NULL, '', 'items', 0, '{\"added\":{\"items\":5}}'),
(13, 18, NULL, '', 'items', 0, '{\"added\":{\"items\":5}}'),
(14, 19, NULL, '', 'items', 0, '{\"added\":{\"items\":5}}'),
(15, 20, NULL, '', 'items', 0, '{\"added\":{\"items\":5}}'),
(16, 22, NULL, '', 'items', 0, '{\"added\":{\"items\":5}}'),
(17, 23, NULL, '', 'items', 0, '{\"added\":{\"items\":5}}'),
(18, 24, NULL, '', 'items', 0, '{\"added\":{\"items\":5}}'),
(19, 25, NULL, '', 'items', 0, '{\"added\":{\"items\":5}}'),
(20, 26, NULL, '', 'items', 0, '{\"added\":{\"items\":5}}'),
(21, 27, NULL, '', 'items', 0, '{\"added\":{\"items\":5}}'),
(22, 28, NULL, '', 'items', 0, '{\"added\":{\"items\":5}}'),
(23, 29, NULL, '', 'items', 0, '{\"added\":{\"items\":5}}'),
(24, 30, NULL, '', 'items', 0, '{\"added\":{\"items\":5}}'),
(25, 31, NULL, '', 'items', 0, '{\"added\":{\"items\":5}}'),
(26, 32, NULL, '', 'items', 0, '{\"added\":{\"items\":0}}'),
(27, 33, NULL, '', 'items', 1, '{\"added\":{\"items\":0}}'),
(28, 34, NULL, '', 'items', 0, '{\"added\":{\"items\":5}}'),
(29, 35, 40, '', 'items', 1, '{\"added\":{\"items\":5}}'),
(30, 36, 39, '', 'items', 0, '{\"added\":{\"items\":0}}'),
(31, 37, 38, '', 'items', 0, '{\"added\":{\"items\":0}}'),
(32, 41, NULL, '', 'items', 0, '{\"added\":{\"items\":5}}'),
(33, 42, NULL, '', 'items', 0, '{\"added\":{\"items\":5}}');

-- --------------------------------------------------------

--
-- Table structure for table `fulltext_search`
--

CREATE TABLE `fulltext_search` (
  `id` int NOT NULL,
  `resource` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_id` int DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fulltext_search`
--

INSERT INTO `fulltext_search` (`id`, `resource`, `owner_id`, `is_public`, `title`, `text`) VALUES
(80, 'items', 1, 1, 'Alice Smith', 'Alice Smith\nAlice\nSmith\nalice.smith@example.com\npass1234'),
(81, 'items', 1, 1, 'Bob Johnson', 'Bob Johnson\nBob\nJohnson\nbob.johnson@example.com\nsecurepass'),
(82, 'items', 1, 1, 'Charlie Brown', 'Charlie Brown\nCharlie\nBrown\ncharlie.brown@example.com\nhelloWorld'),
(83, 'items', 1, 1, 'Diana Evans', 'Diana Evans\nDiana\nEvans\ndiana.evans@example.com\nmyPassword'),
(84, 'items', 1, 1, 'Ethan Lee', 'Ethan Lee\nEthan\nLee\nethan.lee@example.com\nletmein'),
(85, 'items', 1, 1, 'Tomato', 'Tomato\nCalories: 18, Carbs: 3.9g, Protein: 0.9g\ntrue'),
(86, 'items', 1, 1, 'Olive Oil', 'Olive Oil\nCalories: 119, Fat: 13.5g, Carbs: 0g\ntrue'),
(87, 'items', 1, 1, 'Sugar', 'Sugar\nCalories: 387, Carbs: 100g, Protein: 0g\nfalse'),
(88, 'items', 1, 1, 'Chicken Breast', 'Chicken Breast\nCalories: 165, Protein: 31g, Fat: 3.6g\ntrue'),
(89, 'items', 1, 1, 'Butter', 'Butter\nCalories: 717, Fat: 81g, Carbs: 0.1g\nfalse'),
(90, 'items', 1, 1, 'Facebook', 'Facebook\nhttps://example.com/facebook-logo.png\nhttps://facebook.com/example'),
(91, 'items', 1, 1, 'Twitter', 'Twitter\nhttps://example.com/twitter-logo.png\nhttps://twitter.com/example'),
(92, 'items', 1, 1, 'Instagram', 'Instagram\nhttps://example.com/instagram-logo.png\nhttps://instagram.com/example'),
(93, 'items', 1, 1, 'LinkedIn', 'LinkedIn\nhttps://example.com/linkedin-logo.png\nhttps://linkedin.com/company/example'),
(94, 'items', 1, 1, 'YouTube', 'YouTube\nhttps://example.com/youtube-logo.png\nhttps://youtube.com/example'),
(115, 'items', 1, 1, 'How to Make Tomato Sauce', 'How to Make Tomato Sauce\nA step-by-step guide to making fresh tomato sauce.\nEthan Lee'),
(116, 'items', 1, 1, 'Benefits of Olive Oil', 'Benefits of Olive Oil\nDiscover the health benefits of using olive oil in your recipes.\nDiana Evans'),
(117, 'items', 1, 1, 'Chicken Breast Recipes', 'Chicken Breast Recipes\nDelicious and healthy chicken breast recipes for any occasion.\nAlice Smith'),
(118, 'items', 1, 1, 'Sugar Alternatives', 'Sugar Alternatives\nExploring healthier alternatives to sugar in cooking.\nBob Johnson'),
(119, 'items', 1, 1, 'Butter vs. Margarine', 'Butter vs. Margarine\nA comparison of butter and margarine for baking.\nEthan Lee'),
(140, 'items', 1, 1, 'Classic Tomato Sauce', 'Classic Tomato Sauce\nA simple and delicious tomato sauce for pasta.\nhttps://example.com/images/tomato_sauce.jpg\nTomato\nOlive Oil\n10 min\n30 min\nChop tomatoes; Cook with garlic and olive oil; Simmer; Season.\n120\nEasy\nTomato'),
(141, 'items', 1, 1, 'Grilled Chicken Breast', 'Grilled Chicken Breast\nJuicy grilled chicken breast with herbs.\nhttps://example.com/images/grilled_chicken.jpg\nSugar\n15 min\n20 min\nMarinate chicken; Preheat grill; Grill chicken; Rest and serve.\n220\nMedium\nOlive Oil'),
(142, 'items', 1, 1, 'Vegetable Stir Fry', 'Vegetable Stir Fry\nColorful vegetables stir-fried in olive oil.\nhttps://example.com/images/veggie_stirfry.jpg\nChicken Breast\nButter\nTomato\n10 min\n10 min\nChop vegetables; Heat oil; Stir fry; Add sauce.\n180\nEasy\nSugar'),
(143, 'items', 1, 1, 'Chocolate Cake', 'Chocolate Cake\nRich and moist chocolate cake.\nhttps://example.com/images/chocolate_cake.jpg\nOlive Oil\nSugar\nChicken Breast\n20 min\n35 min\nMix ingredients; Bake; Cool; Frost.\n350\nHard\nChicken Breast'),
(144, 'items', 1, 1, 'Caesar Salad', 'Caesar Salad\nFresh Caesar salad with homemade dressing.\nhttps://example.com/images/caesar_salad.jpg\nButter\nTomato\n15 min\n0 min\nPrepare lettuce; Make dressing; Toss; Add croutons.\n150\nEasy\nButter'),
(145, 'items', 1, 1, '5', '5\nAlice Smith\nClassic Tomato Sauce'),
(146, 'items', 1, 1, '4', '4\nBob Johnson\nGrilled Chicken Breast'),
(147, 'items', 1, 1, '3', '3\nCharlie Brown\nVegetable Stir Fry'),
(148, 'items', 1, 1, '2', '2\nDiana Evans\nChocolate Cake'),
(149, 'items', 1, 1, '1', '1\nEthan Lee\nCaesar Salad');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `id` int NOT NULL,
  `primary_media_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`id`, `primary_media_id`) VALUES
(80, NULL),
(81, NULL),
(82, NULL),
(83, NULL),
(84, NULL),
(85, NULL),
(86, NULL),
(87, NULL),
(88, NULL),
(89, NULL),
(90, NULL),
(91, NULL),
(92, NULL),
(93, NULL),
(94, NULL),
(115, NULL),
(116, NULL),
(117, NULL),
(118, NULL),
(119, NULL),
(140, NULL),
(141, NULL),
(142, NULL),
(143, NULL),
(144, NULL),
(145, NULL),
(146, NULL),
(147, NULL),
(148, NULL),
(149, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `item_item_set`
--

CREATE TABLE `item_item_set` (
  `item_id` int NOT NULL,
  `item_set_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_set`
--

CREATE TABLE `item_set` (
  `id` int NOT NULL,
  `is_open` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_site`
--

CREATE TABLE `item_site` (
  `item_id` int NOT NULL,
  `site_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job`
--

CREATE TABLE `job` (
  `id` int NOT NULL,
  `owner_id` int DEFAULT NULL,
  `pid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `args` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:json_array)',
  `log` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `started` datetime NOT NULL,
  `ended` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `job`
--

INSERT INTO `job` (`id`, `owner_id`, `pid`, `status`, `class`, `args`, `log`, `started`, `ended`) VALUES
(1, 1, '42589', 'completed', 'CSVImport\\Job\\Import', '{\"filename\":\"User_fake.csv\",\"filesize\":\"266\",\"filepath\":\"\\/tmp\\/omekatckJiY\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":false,\"column\":[\"First Name\",\"Last Name\",\"Email\",\"Password\"],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2025-10-17 13:14:54', '2025-10-17 13:14:55'),
(2, 1, '42733', 'completed', 'CSVImport\\Job\\Import', '{\"filename\":\"User_fake.csv\",\"filesize\":\"274\",\"filepath\":\"\\/tmp\\/omekaysLIXJ\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-property\":[{\"ke:firstName\":210},{\"ke:lastName\":211},{\"ke:email\":212},{\"ke:password\":213}],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2025-10-17 13:18:04', '2025-10-17 13:18:05'),
(3, 1, '44312', 'completed', 'CSVImport\\Job\\Import', '{\"filename\":\"User_fake.csv\",\"filesize\":\"392\",\"filepath\":\"\\/tmp\\/omeka9g4vrH\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-property\":[{\"dcterms:title\":1},{\"ke:firstName\":210},{\"ke:lastName\":211},{\"ke:email\":212},{\"ke:password\":213}],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2025-10-17 13:46:26', '2025-10-17 13:46:26'),
(4, 1, '44568', 'completed', 'CSVImport\\Job\\Import', '{\"filename\":\"SocialMediaLink_fake.csv\",\"filesize\":\"436\",\"filepath\":\"\\/tmp\\/omekaW81SDx\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-property\":[{\"foaf:name\":138},{\"foaf:logo\":169},{\"ke:link\":215}],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2025-10-17 13:53:11', '2025-10-17 13:53:11'),
(5, 1, '44758', 'completed', 'CSVImport\\Job\\Import', '{\"filename\":\"SocialMediaLink_fake.csv\",\"filesize\":\"436\",\"filepath\":\"\\/tmp\\/omekanFFaax\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-property\":[{\"foaf:name\":138},{\"foaf:logo\":169},{\"ke:link\":215}],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2025-10-17 13:58:41', '2025-10-17 13:58:41'),
(6, 1, '55250', 'completed', 'CSVImport\\Job\\Import', '{\"filename\":\"SocialMediaLink_fake.csv\",\"filesize\":\"436\",\"filepath\":\"\\/tmp\\/omekaJQ7Vq3\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-property\":[{\"foaf:name\":138},{\"foaf:logo\":169},{\"ke:link\":215}],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2025-10-18 08:03:14', '2025-10-18 08:03:14'),
(7, 1, '55644', 'completed', 'Omeka\\Job\\BatchDelete', '{\"resource\":\"items\",\"query\":{\"sort_by_default\":\"\",\"sort_order_default\":\"\"}}', NULL, '2025-10-18 08:07:59', '2025-10-18 08:07:59'),
(8, 1, '55664', 'completed', 'CSVImport\\Job\\Import', '{\"filename\":\"User_fake.csv\",\"filesize\":\"442\",\"filepath\":\"\\/tmp\\/omekazWBWs6\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-property\":[{\"dcterms:type\":8},{\"dcterms:title\":1},{\"ke:firstName\":210},{\"ke:lastName\":211},{\"ke:email\":212},{\"ke:password\":213}],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2025-10-18 08:08:17', '2025-10-18 08:08:17'),
(9, 1, '55915', 'completed', 'Omeka\\Job\\BatchDelete', '{\"resource\":\"items\",\"query\":{\"sort_by_default\":\"\",\"sort_order_default\":\"\"}}', NULL, '2025-10-18 08:13:29', '2025-10-18 08:13:30'),
(10, 1, '55961', 'completed', 'CSVImport\\Job\\Import', '{\"filename\":\"User_fake.csv\",\"filesize\":\"470\",\"filepath\":\"\\/tmp\\/omeka7CXQ8f\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-resource_class\":[\"1\"],\"column-property\":{\"1\":{\"ke:title\":235},\"2\":{\"ke:firstName\":210},\"3\":{\"ke:lastName\":211},\"4\":{\"ke:email\":212},\"5\":{\"ke:password\":213}},\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2025-10-18 08:14:25', '2025-10-18 08:14:26'),
(11, 1, '55988', 'completed', 'Omeka\\Job\\BatchDelete', '{\"resource\":\"items\",\"query\":{\"sort_by_default\":\"\",\"sort_order_default\":\"\"}}', NULL, '2025-10-18 08:15:16', '2025-10-18 08:15:17'),
(12, 1, '56025', 'completed', 'CSVImport\\Job\\Import', '{\"filename\":\"User_fake.csv\",\"filesize\":\"470\",\"filepath\":\"\\/tmp\\/omekaxxzh82\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-resource_class\":[\"1\"],\"column-property\":{\"1\":{\"ke:title\":235},\"2\":{\"ke:firstName\":210},\"3\":{\"ke:lastName\":211},\"4\":{\"ke:email\":212},\"5\":{\"ke:password\":213}},\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2025-10-18 08:15:51', '2025-10-18 08:15:51'),
(13, 1, '56120', 'completed', 'Omeka\\Job\\BatchDelete', '{\"resource\":\"items\",\"query\":{\"sort_by_default\":\"\",\"sort_order_default\":\"\"}}', NULL, '2025-10-18 08:19:26', '2025-10-18 08:19:26'),
(14, 1, '56158', 'completed', 'CSVImport\\Job\\Import', '{\"filename\":\"User_fake.csv\",\"filesize\":\"467\",\"filepath\":\"\\/tmp\\/omekajif1Hb\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-resource_template\":[\"1\"],\"column-property\":{\"1\":{\"dcterms:title\":1},\"2\":{\"ke:firstName\":210},\"3\":{\"ke:lastName\":211},\"4\":{\"ke:email\":212},\"5\":{\"ke:password\":213}},\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', '2025-10-18T08:20:02+00:00 ERR (3): \"ke:User\" is not a valid Resource Template name.\n2025-10-18T08:20:02+00:00 ERR (3): \"ke:User\" is not a valid Resource Template name.\n2025-10-18T08:20:02+00:00 ERR (3): \"ke:User\" is not a valid Resource Template name.\n2025-10-18T08:20:02+00:00 ERR (3): \"ke:User\" is not a valid Resource Template name.\n2025-10-18T08:20:02+00:00 ERR (3): \"ke:User\" is not a valid Resource Template name.\n', '2025-10-18 08:20:01', '2025-10-18 08:20:02'),
(15, 1, '56211', 'completed', 'CSVImport\\Job\\Import', '{\"filename\":\"SocialMediaLink_fake.csv\",\"filesize\":\"569\",\"filepath\":\"\\/tmp\\/omeka01s6Fl\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-resource_class\":[\"1\"],\"column-property\":{\"1\":{\"ke:name\":214},\"2\":{\"ke:logo\":216},\"3\":{\"ke:link\":215}},\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2025-10-18 08:21:24', '2025-10-18 08:21:24'),
(16, 1, '56260', 'completed', 'Omeka\\Job\\BatchDelete', '{\"resource\":\"items\",\"query\":{\"sort_by_default\":\"\",\"sort_order_default\":\"\"}}', NULL, '2025-10-18 08:22:41', '2025-10-18 08:22:42'),
(17, 1, '56301', 'completed', 'CSVImport\\Job\\Import', '{\"filename\":\"User_fake.csv\",\"filesize\":\"471\",\"filepath\":\"\\/tmp\\/omekaUt17OT\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-resource_class\":[\"1\"],\"column-property\":{\"1\":{\"dcterms:title\":1},\"2\":{\"ke:firstName\":210},\"3\":{\"ke:lastName\":211},\"4\":{\"ke:email\":212},\"5\":{\"ke:password\":213}},\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2025-10-18 08:23:10', '2025-10-18 08:23:10'),
(18, 1, '56339', 'completed', 'CSVImport\\Job\\Import', '{\"filename\":\"SocialMediaLink_fake.csv\",\"filesize\":\"569\",\"filepath\":\"\\/tmp\\/omeka29OaEV\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-resource_class\":[\"1\"],\"column-property\":{\"1\":{\"ke:name\":214},\"2\":{\"ke:logo\":216},\"3\":{\"ke:link\":215}},\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2025-10-18 08:24:05', '2025-10-18 08:24:05'),
(19, 1, '56463', 'completed', 'CSVImport\\Job\\Import', '{\"filename\":\"Ingredient_fake.csv\",\"filesize\":\"441\",\"filepath\":\"\\/tmp\\/omekaTOpTHn\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-resource_class\":[\"1\"],\"column-property\":{\"1\":{\"ke:name\":214},\"2\":{\"ke:nutritionalInfo\":225},\"3\":{\"ke:isHealthy\":226}},\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2025-10-18 08:26:54', '2025-10-18 08:26:54'),
(20, 1, '56560', 'completed', 'CSVImport\\Job\\Import', '{\"filename\":\"Post_fake.csv\",\"filesize\":\"579\",\"filepath\":\"\\/tmp\\/omeka1GEM8W\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-resource_class\":[\"1\"],\"column-property\":{\"1\":{\"ke:title\":235},\"2\":{\"ke:description\":234},\"3\":{\"ke:createdBy\":223}},\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2025-10-18 08:28:39', '2025-10-18 08:28:40'),
(21, 1, '56578', 'completed', 'Omeka\\Job\\BatchDelete', '{\"resource\":\"items\",\"query\":{\"sort_by_default\":\"\",\"sort_order_default\":\"\"}}', NULL, '2025-10-18 08:29:09', '2025-10-18 08:29:09'),
(22, 1, '56751', 'completed', 'CSVImport\\Job\\Import', '{\"filename\":\"User_fake.csv\",\"filesize\":\"528\",\"filepath\":\"\\/tmp\\/omekawuHf5K\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-resource_class\":[\"1\"],\"column-resource_template\":{\"1\":\"1\"},\"column-property\":{\"2\":{\"dcterms:title\":1},\"3\":{\"ke:firstName\":210},\"4\":{\"ke:lastName\":211},\"5\":{\"ke:email\":212},\"6\":{\"ke:password\":213}},\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2025-10-18 08:31:38', '2025-10-18 08:31:38'),
(23, 1, '56787', 'completed', 'CSVImport\\Job\\Import', '{\"filename\":\"Ingredient_fake.csv\",\"filesize\":\"528\",\"filepath\":\"\\/tmp\\/omekaBVZdGa\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-resource_class\":[\"1\"],\"column-resource_template\":{\"1\":\"1\"},\"column-property\":{\"2\":{\"ke:name\":214},\"3\":{\"ke:nutritionalInfo\":225},\"4\":{\"ke:isHealthy\":226}},\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2025-10-18 08:32:07', '2025-10-18 08:32:08'),
(24, 1, '56820', 'completed', 'CSVImport\\Job\\Import', '{\"filename\":\"SocialMediaLink_fake.csv\",\"filesize\":\"681\",\"filepath\":\"\\/tmp\\/omekacMLCGB\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-resource_class\":[\"1\"],\"column-resource_template\":{\"1\":\"1\"},\"column-property\":{\"2\":{\"ke:name\":214},\"3\":{\"ke:logo\":216},\"4\":{\"ke:link\":215}},\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2025-10-18 08:32:55', '2025-10-18 08:32:55'),
(25, 1, '57148', 'completed', 'CSVImport\\Job\\Import', '{\"filename\":\"Post_fake.csv\",\"filesize\":\"606\",\"filepath\":\"\\/tmp\\/omekaoRL1P2\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-resource_class\":[\"1\"],\"column-resource_template\":{\"1\":\"1\"},\"column-property\":{\"2\":{\"ke:title\":235},\"3\":{\"ke:description\":234},\"4\":{\"ke:createdBy\":223}},\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2025-10-18 08:39:41', '2025-10-18 08:39:41'),
(26, 1, '57354', 'completed', 'CSVImport\\Job\\Import', '{\"filename\":\"Post_fake.csv\",\"filesize\":\"641\",\"filepath\":\"\\/tmp\\/omeka3EIZXY\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-resource_class\":[\"1\"],\"column-resource_template\":{\"1\":\"1\"},\"column-property\":{\"2\":{\"ke:title\":235},\"3\":{\"ke:description\":234},\"4\":{\"ke:createdBy\":223}},\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2025-10-18 08:45:28', '2025-10-18 08:45:29'),
(27, 1, '57405', 'completed', 'CSVImport\\Job\\Import', '{\"filename\":\"Post_fake.csv\",\"filesize\":\"641\",\"filepath\":\"\\/tmp\\/omekaAvtUi7\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-resource_class\":[\"1\"],\"column-resource_template\":{\"1\":\"1\"},\"column-property\":{\"2\":{\"ke:title\":235},\"3\":{\"ke:description\":234},\"4\":{\"ke:createdBy\":223}},\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2025-10-18 08:46:46', '2025-10-18 08:46:46'),
(28, 1, '57467', 'completed', 'CSVImport\\Job\\Import', '{\"filename\":\"Post_fake.csv\",\"filesize\":\"641\",\"filepath\":\"\\/tmp\\/omekaS4ePMR\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-resource_class\":[\"1\"],\"column-resource_template\":{\"1\":\"1\"},\"column-property\":{\"2\":{\"ke:title\":235},\"3\":{\"ke:description\":234},\"4\":{\"ke:createdBy\":223}},\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2025-10-18 08:48:55', '2025-10-18 08:48:55'),
(29, 1, '57554', 'completed', 'CSVImport\\Job\\Import', '{\"filename\":\"Post_fake.csv\",\"filesize\":\"606\",\"filepath\":\"\\/tmp\\/omekapdmiLC\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-resource_class\":[\"1\"],\"column-resource_template\":{\"1\":\"1\"},\"column-property\":{\"2\":{\"ke:title\":235},\"3\":{\"ke:description\":234},\"4\":{\"ke:createdBy\":223}},\"column-data-type\":{\"4\":\"resource\"},\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2025-10-18 08:50:31', '2025-10-18 08:50:32'),
(30, 1, '11265', 'completed', 'CSVImport\\Job\\Import', '{\"filename\":\"Recipe_fake.csv\",\"filesize\":\"1360\",\"filepath\":\"\\/tmp\\/omekaqh1oWG\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-resource_class\":[\"1\"],\"column-resource_template\":{\"1\":\"1\"},\"column-property\":{\"2\":{\"ke:name\":214},\"3\":{\"ke:description\":234},\"4\":{\"ke:image\":217},\"5\":{\"ke:hasIngredient\":224},\"6\":{\"ke:preparationTime\":220},\"7\":{\"ke:cookingTime\":219},\"8\":{\"ke:steps\":218},\"9\":{\"ke:calories\":221},\"10\":{\"ke:difficulty\":222},\"11\":{\"ke:createdBy\":223}},\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2025-10-19 09:31:19', '2025-10-19 09:31:20'),
(31, 1, '11303', 'completed', 'CSVImport\\Job\\Import', '{\"filename\":\"Recipe_fake.csv\",\"filesize\":\"1360\",\"filepath\":\"\\/tmp\\/omeka6tYt7t\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-resource_class\":[\"1\"],\"column-resource_template\":{\"1\":\"1\"},\"column-property\":{\"2\":{\"ke:name\":214},\"3\":{\"ke:description\":234},\"4\":{\"ke:image\":217},\"5\":{\"ke:hasIngredient\":224},\"6\":{\"ke:preparationTime\":220},\"7\":{\"ke:cookingTime\":219},\"8\":{\"ke:steps\":218},\"9\":{\"ke:calories\":221},\"10\":{\"ke:difficulty\":222},\"11\":{\"ke:createdBy\":223}},\"column-data-type\":{\"11\":\"resource\"},\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2025-10-19 09:32:50', '2025-10-19 09:32:50'),
(32, 1, '11402', 'completed', 'CSVImport\\Job\\Import', '{\"filename\":\"Recipe_fake.csv\",\"filesize\":\"1360\",\"filepath\":\"\\/tmp\\/omekaRNFa1X\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-resource_class\":[\"1\"],\"column-resource_template\":{\"1\":\"1\"},\"column-property\":{\"2\":{\"ke:name\":214},\"3\":{\"ke:description\":234},\"4\":{\"ke:image\":217},\"5\":{\"ke:hasIngredient\":224},\"6\":{\"ke:preparationTime\":220},\"7\":{\"ke:cookingTime\":219},\"8\":{\"ke:steps\":218},\"9\":{\"ke:calories\":221},\"10\":{\"ke:difficulty\":222},\"11\":{\"ke:createdBy\":223}},\"column-data-type\":{\"5\":\"resource\",\"11\":\"resource\"},\"column-multivalue\":{\"5\":\"1\"},\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', '2025-10-19T09:36:21+00:00 ERR (3): Omeka\\Api\\Exception\\NotFoundException: Resource not found with id 101. in /var/www/html/omeka-s/application/src/DataType/Resource/AbstractResource.php:60\nStack trace:\n#0 /var/www/html/omeka-s/application/src/Api/Adapter/ValueHydrator.php(132): Omeka\\DataType\\Resource\\AbstractResource->hydrate()\n#1 /var/www/html/omeka-s/application/src/Api/Adapter/AbstractResourceEntityAdapter.php(174): Omeka\\Api\\Adapter\\ValueHydrator->hydrate()\n#2 /var/www/html/omeka-s/application/src/Api/Adapter/ItemAdapter.php(166): Omeka\\Api\\Adapter\\AbstractResourceEntityAdapter->hydrate()\n#3 /var/www/html/omeka-s/application/src/Api/Adapter/AbstractEntityAdapter.php(643): Omeka\\Api\\Adapter\\ItemAdapter->hydrate()\n#4 /var/www/html/omeka-s/application/src/Api/Adapter/AbstractEntityAdapter.php(354): Omeka\\Api\\Adapter\\AbstractEntityAdapter->hydrateEntity()\n#5 /var/www/html/omeka-s/application/src/Api/Manager.php(224): Omeka\\Api\\Adapter\\AbstractEntityAdapter->create()\n#6 /var/www/html/omeka-s/application/src/Api/Manager.php(78): Omeka\\Api\\Manager->execute()\n#7 /var/www/html/omeka-s/application/src/Api/Adapter/AbstractEntityAdapter.php(402): Omeka\\Api\\Manager->create()\n#8 /var/www/html/omeka-s/application/src/Api/Manager.php(227): Omeka\\Api\\Adapter\\AbstractEntityAdapter->batchCreate()\n#9 /var/www/html/omeka-s/application/src/Api/Manager.php(97): Omeka\\Api\\Manager->execute()\n#10 /var/www/html/omeka-s/modules/CSVImport/src/Job/Import.php(364): Omeka\\Api\\Manager->batchCreate()\n#11 /var/www/html/omeka-s/modules/CSVImport/src/Job/Import.php(266): CSVImport\\Job\\Import->create()\n#12 /var/www/html/omeka-s/modules/CSVImport/src/Job/Import.php(205): CSVImport\\Job\\Import->processBatchData()\n#13 /var/www/html/omeka-s/application/src/Job/DispatchStrategy/Synchronous.php(34): CSVImport\\Job\\Import->perform()\n#14 /var/www/html/omeka-s/application/src/Job/Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\Synchronous->send()\n#15 /var/www/html/omeka-s/application/data/scripts/perform-job.php(66): Omeka\\Job\\Dispatcher->send()\n#16 {main}\n2025-10-19T09:36:21+00:00 ERR (3): Omeka\\Api\\Exception\\NotFoundException: Resource not found with id 103. in /var/www/html/omeka-s/application/src/DataType/Resource/AbstractResource.php:60\nStack trace:\n#0 /var/www/html/omeka-s/application/src/Api/Adapter/ValueHydrator.php(132): Omeka\\DataType\\Resource\\AbstractResource->hydrate()\n#1 /var/www/html/omeka-s/application/src/Api/Adapter/AbstractResourceEntityAdapter.php(174): Omeka\\Api\\Adapter\\ValueHydrator->hydrate()\n#2 /var/www/html/omeka-s/application/src/Api/Adapter/ItemAdapter.php(166): Omeka\\Api\\Adapter\\AbstractResourceEntityAdapter->hydrate()\n#3 /var/www/html/omeka-s/application/src/Api/Adapter/AbstractEntityAdapter.php(643): Omeka\\Api\\Adapter\\ItemAdapter->hydrate()\n#4 /var/www/html/omeka-s/application/src/Api/Adapter/AbstractEntityAdapter.php(354): Omeka\\Api\\Adapter\\AbstractEntityAdapter->hydrateEntity()\n#5 /var/www/html/omeka-s/application/src/Api/Manager.php(224): Omeka\\Api\\Adapter\\AbstractEntityAdapter->create()\n#6 /var/www/html/omeka-s/application/src/Api/Manager.php(78): Omeka\\Api\\Manager->execute()\n#7 /var/www/html/omeka-s/application/src/Api/Adapter/AbstractEntityAdapter.php(402): Omeka\\Api\\Manager->create()\n#8 /var/www/html/omeka-s/application/src/Api/Manager.php(227): Omeka\\Api\\Adapter\\AbstractEntityAdapter->batchCreate()\n#9 /var/www/html/omeka-s/application/src/Api/Manager.php(97): Omeka\\Api\\Manager->execute()\n#10 /var/www/html/omeka-s/modules/CSVImport/src/Job/Import.php(364): Omeka\\Api\\Manager->batchCreate()\n#11 /var/www/html/omeka-s/modules/CSVImport/src/Job/Import.php(266): CSVImport\\Job\\Import->create()\n#12 /var/www/html/omeka-s/modules/CSVImport/src/Job/Import.php(205): CSVImport\\Job\\Import->processBatchData()\n#13 /var/www/html/omeka-s/application/src/Job/DispatchStrategy/Synchronous.php(34): CSVImport\\Job\\Import->perform()\n#14 /var/www/html/omeka-s/application/src/Job/Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\Synchronous->send()\n#15 /var/www/html/omeka-s/application/data/scripts/perform-job.php(66): Omeka\\Job\\Dispatcher->send()\n#16 {main}\n2025-10-19T09:36:21+00:00 ERR (3): Omeka\\Api\\Exception\\NotFoundException: Resource not found with id 104. in /var/www/html/omeka-s/application/src/DataType/Resource/AbstractResource.php:60\nStack trace:\n#0 /var/www/html/omeka-s/application/src/Api/Adapter/ValueHydrator.php(132): Omeka\\DataType\\Resource\\AbstractResource->hydrate()\n#1 /var/www/html/omeka-s/application/src/Api/Adapter/AbstractResourceEntityAdapter.php(174): Omeka\\Api\\Adapter\\ValueHydrator->hydrate()\n#2 /var/www/html/omeka-s/application/src/Api/Adapter/ItemAdapter.php(166): Omeka\\Api\\Adapter\\AbstractResourceEntityAdapter->hydrate()\n#3 /var/www/html/omeka-s/application/src/Api/Adapter/AbstractEntityAdapter.php(643): Omeka\\Api\\Adapter\\ItemAdapter->hydrate()\n#4 /var/www/html/omeka-s/application/src/Api/Adapter/AbstractEntityAdapter.php(354): Omeka\\Api\\Adapter\\AbstractEntityAdapter->hydrateEntity()\n#5 /var/www/html/omeka-s/application/src/Api/Manager.php(224): Omeka\\Api\\Adapter\\AbstractEntityAdapter->create()\n#6 /var/www/html/omeka-s/application/src/Api/Manager.php(78): Omeka\\Api\\Manager->execute()\n#7 /var/www/html/omeka-s/application/src/Api/Adapter/AbstractEntityAdapter.php(402): Omeka\\Api\\Manager->create()\n#8 /var/www/html/omeka-s/application/src/Api/Manager.php(227): Omeka\\Api\\Adapter\\AbstractEntityAdapter->batchCreate()\n#9 /var/www/html/omeka-s/application/src/Api/Manager.php(97): Omeka\\Api\\Manager->execute()\n#10 /var/www/html/omeka-s/modules/CSVImport/src/Job/Import.php(364): Omeka\\Api\\Manager->batchCreate()\n#11 /var/www/html/omeka-s/modules/CSVImport/src/Job/Import.php(266): CSVImport\\Job\\Import->create()\n#12 /var/www/html/omeka-s/modules/CSVImport/src/Job/Import.php(205): CSVImport\\Job\\Import->processBatchData()\n#13 /var/www/html/omeka-s/application/src/Job/DispatchStrategy/Synchronous.php(34): CSVImport\\Job\\Import->perform()\n#14 /var/www/html/omeka-s/application/src/Job/Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\Synchronous->send()\n#15 /var/www/html/omeka-s/application/data/scripts/perform-job.php(66): Omeka\\Job\\Dispatcher->send()\n#16 {main}\n2025-10-19T09:36:21+00:00 ERR (3): Omeka\\Api\\Exception\\NotFoundException: Resource not found with id 107. in /var/www/html/omeka-s/application/src/DataType/Resource/AbstractResource.php:60\nStack trace:\n#0 /var/www/html/omeka-s/application/src/Api/Adapter/ValueHydrator.php(132): Omeka\\DataType\\Resource\\AbstractResource->hydrate()\n#1 /var/www/html/omeka-s/application/src/Api/Adapter/AbstractResourceEntityAdapter.php(174): Omeka\\Api\\Adapter\\ValueHydrator->hydrate()\n#2 /var/www/html/omeka-s/application/src/Api/Adapter/ItemAdapter.php(166): Omeka\\Api\\Adapter\\AbstractResourceEntityAdapter->hydrate()\n#3 /var/www/html/omeka-s/application/src/Api/Adapter/AbstractEntityAdapter.php(643): Omeka\\Api\\Adapter\\ItemAdapter->hydrate()\n#4 /var/www/html/omeka-s/application/src/Api/Adapter/AbstractEntityAdapter.php(354): Omeka\\Api\\Adapter\\AbstractEntityAdapter->hydrateEntity()\n#5 /var/www/html/omeka-s/application/src/Api/Manager.php(224): Omeka\\Api\\Adapter\\AbstractEntityAdapter->create()\n#6 /var/www/html/omeka-s/application/src/Api/Manager.php(78): Omeka\\Api\\Manager->execute()\n#7 /var/www/html/omeka-s/application/src/Api/Adapter/AbstractEntityAdapter.php(402): Omeka\\Api\\Manager->create()\n#8 /var/www/html/omeka-s/application/src/Api/Manager.php(227): Omeka\\Api\\Adapter\\AbstractEntityAdapter->batchCreate()\n#9 /var/www/html/omeka-s/application/src/Api/Manager.php(97): Omeka\\Api\\Manager->execute()\n#10 /var/www/html/omeka-s/modules/CSVImport/src/Job/Import.php(364): Omeka\\Api\\Manager->batchCreate()\n#11 /var/www/html/omeka-s/modules/CSVImport/src/Job/Import.php(266): CSVImport\\Job\\Import->create()\n#12 /var/www/html/omeka-s/modules/CSVImport/src/Job/Import.php(205): CSVImport\\Job\\Import->processBatchData()\n#13 /var/www/html/omeka-s/application/src/Job/DispatchStrategy/Synchronous.php(34): CSVImport\\Job\\Import->perform()\n#14 /var/www/html/omeka-s/application/src/Job/Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\Synchronous->send()\n#15 /var/www/html/omeka-s/application/data/scripts/perform-job.php(66): Omeka\\Job\\Dispatcher->send()\n#16 {main}\n2025-10-19T09:36:21+00:00 ERR (3): Omeka\\Api\\Exception\\NotFoundException: Resource not found with id 110. in /var/www/html/omeka-s/application/src/DataType/Resource/AbstractResource.php:60\nStack trace:\n#0 /var/www/html/omeka-s/application/src/Api/Adapter/ValueHydrator.php(132): Omeka\\DataType\\Resource\\AbstractResource->hydrate()\n#1 /var/www/html/omeka-s/application/src/Api/Adapter/AbstractResourceEntityAdapter.php(174): Omeka\\Api\\Adapter\\ValueHydrator->hydrate()\n#2 /var/www/html/omeka-s/application/src/Api/Adapter/ItemAdapter.php(166): Omeka\\Api\\Adapter\\AbstractResourceEntityAdapter->hydrate()\n#3 /var/www/html/omeka-s/application/src/Api/Adapter/AbstractEntityAdapter.php(643): Omeka\\Api\\Adapter\\ItemAdapter->hydrate()\n#4 /var/www/html/omeka-s/application/src/Api/Adapter/AbstractEntityAdapter.php(354): Omeka\\Api\\Adapter\\AbstractEntityAdapter->hydrateEntity()\n#5 /var/www/html/omeka-s/application/src/Api/Manager.php(224): Omeka\\Api\\Adapter\\AbstractEntityAdapter->create()\n#6 /var/www/html/omeka-s/application/src/Api/Manager.php(78): Omeka\\Api\\Manager->execute()\n#7 /var/www/html/omeka-s/application/src/Api/Adapter/AbstractEntityAdapter.php(402): Omeka\\Api\\Manager->create()\n#8 /var/www/html/omeka-s/application/src/Api/Manager.php(227): Omeka\\Api\\Adapter\\AbstractEntityAdapter->batchCreate()\n#9 /var/www/html/omeka-s/application/src/Api/Manager.php(97): Omeka\\Api\\Manager->execute()\n#10 /var/www/html/omeka-s/modules/CSVImport/src/Job/Import.php(364): Omeka\\Api\\Manager->batchCreate()\n#11 /var/www/html/omeka-s/modules/CSVImport/src/Job/Import.php(266): CSVImport\\Job\\Import->create()\n#12 /var/www/html/omeka-s/modules/CSVImport/src/Job/Import.php(205): CSVImport\\Job\\Import->processBatchData()\n#13 /var/www/html/omeka-s/application/src/Job/DispatchStrategy/Synchronous.php(34): CSVImport\\Job\\Import->perform()\n#14 /var/www/html/omeka-s/application/src/Job/Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\Synchronous->send()\n#15 /var/www/html/omeka-s/application/data/scripts/perform-job.php(66): Omeka\\Job\\Dispatcher->send()\n#16 {main}\n', '2025-10-19 09:36:20', '2025-10-19 09:36:21');
INSERT INTO `job` (`id`, `owner_id`, `pid`, `status`, `class`, `args`, `log`, `started`, `ended`) VALUES
(33, 1, '11805', 'completed', 'CSVImport\\Job\\Import', '{\"filename\":\"Recipe_fake.csv\",\"filesize\":\"1360\",\"filepath\":\"\\/tmp\\/omeka2UF13P\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-resource_class\":[\"1\",\"1\"],\"column-property\":{\"2\":{\"ke:name\":214},\"3\":{\"ke:description\":234},\"4\":{\"ke:image\":217},\"5\":{\"ke:hasIngredient\":224},\"6\":{\"ke:preparationTime\":220},\"7\":{\"ke:cookingTime\":219},\"8\":{\"ke:steps\":218},\"9\":{\"ke:calories\":221},\"10\":{\"ke:difficulty\":222},\"11\":{\"ke:createdBy\":223}},\"column-item_set\":{\"5\":\"internal_id\"},\"column-data-type\":{\"5\":\"resource\",\"11\":\"resource\"},\"column-multivalue\":{\"5\":\"1\"},\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', '2025-10-19T09:44:03+00:00 ERR (3): \"Recipe\" is not a valid resource class. Resource Classes must be a Class found on the Vocabularies page.\n2025-10-19T09:44:03+00:00 ERR (3): \"101\" (internal_id) is not a valid item set.\n2025-10-19T09:44:03+00:00 ERR (3): \"102\" (internal_id) is not a valid item set.\n2025-10-19T09:44:03+00:00 ERR (3): \"Recipe\" is not a valid resource class. Resource Classes must be a Class found on the Vocabularies page.\n2025-10-19T09:44:03+00:00 ERR (3): \"103\" (internal_id) is not a valid item set.\n2025-10-19T09:44:03+00:00 ERR (3): \"Recipe\" is not a valid resource class. Resource Classes must be a Class found on the Vocabularies page.\n2025-10-19T09:44:03+00:00 ERR (3): \"104\" (internal_id) is not a valid item set.\n2025-10-19T09:44:03+00:00 ERR (3): \"105\" (internal_id) is not a valid item set.\n2025-10-19T09:44:03+00:00 ERR (3): \"106\" (internal_id) is not a valid item set.\n2025-10-19T09:44:03+00:00 ERR (3): \"Recipe\" is not a valid resource class. Resource Classes must be a Class found on the Vocabularies page.\n2025-10-19T09:44:03+00:00 ERR (3): \"107\" (internal_id) is not a valid item set.\n2025-10-19T09:44:03+00:00 ERR (3): \"108\" (internal_id) is not a valid item set.\n2025-10-19T09:44:03+00:00 ERR (3): \"109\" (internal_id) is not a valid item set.\n2025-10-19T09:44:03+00:00 ERR (3): \"Recipe\" is not a valid resource class. Resource Classes must be a Class found on the Vocabularies page.\n2025-10-19T09:44:03+00:00 ERR (3): \"110\" (internal_id) is not a valid item set.\n2025-10-19T09:44:03+00:00 ERR (3): \"111\" (internal_id) is not a valid item set.\n2025-10-19T09:44:03+00:00 ERR (3): Omeka\\Api\\Exception\\NotFoundException: Resource not found with id 101. in /var/www/html/omeka-s/application/src/DataType/Resource/AbstractResource.php:60\nStack trace:\n#0 /var/www/html/omeka-s/application/src/Api/Adapter/ValueHydrator.php(132): Omeka\\DataType\\Resource\\AbstractResource->hydrate()\n#1 /var/www/html/omeka-s/application/src/Api/Adapter/AbstractResourceEntityAdapter.php(174): Omeka\\Api\\Adapter\\ValueHydrator->hydrate()\n#2 /var/www/html/omeka-s/application/src/Api/Adapter/ItemAdapter.php(166): Omeka\\Api\\Adapter\\AbstractResourceEntityAdapter->hydrate()\n#3 /var/www/html/omeka-s/application/src/Api/Adapter/AbstractEntityAdapter.php(643): Omeka\\Api\\Adapter\\ItemAdapter->hydrate()\n#4 /var/www/html/omeka-s/application/src/Api/Adapter/AbstractEntityAdapter.php(354): Omeka\\Api\\Adapter\\AbstractEntityAdapter->hydrateEntity()\n#5 /var/www/html/omeka-s/application/src/Api/Manager.php(224): Omeka\\Api\\Adapter\\AbstractEntityAdapter->create()\n#6 /var/www/html/omeka-s/application/src/Api/Manager.php(78): Omeka\\Api\\Manager->execute()\n#7 /var/www/html/omeka-s/application/src/Api/Adapter/AbstractEntityAdapter.php(402): Omeka\\Api\\Manager->create()\n#8 /var/www/html/omeka-s/application/src/Api/Manager.php(227): Omeka\\Api\\Adapter\\AbstractEntityAdapter->batchCreate()\n#9 /var/www/html/omeka-s/application/src/Api/Manager.php(97): Omeka\\Api\\Manager->execute()\n#10 /var/www/html/omeka-s/modules/CSVImport/src/Job/Import.php(364): Omeka\\Api\\Manager->batchCreate()\n#11 /var/www/html/omeka-s/modules/CSVImport/src/Job/Import.php(266): CSVImport\\Job\\Import->create()\n#12 /var/www/html/omeka-s/modules/CSVImport/src/Job/Import.php(205): CSVImport\\Job\\Import->processBatchData()\n#13 /var/www/html/omeka-s/application/src/Job/DispatchStrategy/Synchronous.php(34): CSVImport\\Job\\Import->perform()\n#14 /var/www/html/omeka-s/application/src/Job/Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\Synchronous->send()\n#15 /var/www/html/omeka-s/application/data/scripts/perform-job.php(66): Omeka\\Job\\Dispatcher->send()\n#16 {main}\n2025-10-19T09:44:03+00:00 ERR (3): Omeka\\Api\\Exception\\NotFoundException: Resource not found with id 103. in /var/www/html/omeka-s/application/src/DataType/Resource/AbstractResource.php:60\nStack trace:\n#0 /var/www/html/omeka-s/application/src/Api/Adapter/ValueHydrator.php(132): Omeka\\DataType\\Resource\\AbstractResource->hydrate()\n#1 /var/www/html/omeka-s/application/src/Api/Adapter/AbstractResourceEntityAdapter.php(174): Omeka\\Api\\Adapter\\ValueHydrator->hydrate()\n#2 /var/www/html/omeka-s/application/src/Api/Adapter/ItemAdapter.php(166): Omeka\\Api\\Adapter\\AbstractResourceEntityAdapter->hydrate()\n#3 /var/www/html/omeka-s/application/src/Api/Adapter/AbstractEntityAdapter.php(643): Omeka\\Api\\Adapter\\ItemAdapter->hydrate()\n#4 /var/www/html/omeka-s/application/src/Api/Adapter/AbstractEntityAdapter.php(354): Omeka\\Api\\Adapter\\AbstractEntityAdapter->hydrateEntity()\n#5 /var/www/html/omeka-s/application/src/Api/Manager.php(224): Omeka\\Api\\Adapter\\AbstractEntityAdapter->create()\n#6 /var/www/html/omeka-s/application/src/Api/Manager.php(78): Omeka\\Api\\Manager->execute()\n#7 /var/www/html/omeka-s/application/src/Api/Adapter/AbstractEntityAdapter.php(402): Omeka\\Api\\Manager->create()\n#8 /var/www/html/omeka-s/application/src/Api/Manager.php(227): Omeka\\Api\\Adapter\\AbstractEntityAdapter->batchCreate()\n#9 /var/www/html/omeka-s/application/src/Api/Manager.php(97): Omeka\\Api\\Manager->execute()\n#10 /var/www/html/omeka-s/modules/CSVImport/src/Job/Import.php(364): Omeka\\Api\\Manager->batchCreate()\n#11 /var/www/html/omeka-s/modules/CSVImport/src/Job/Import.php(266): CSVImport\\Job\\Import->create()\n#12 /var/www/html/omeka-s/modules/CSVImport/src/Job/Import.php(205): CSVImport\\Job\\Import->processBatchData()\n#13 /var/www/html/omeka-s/application/src/Job/DispatchStrategy/Synchronous.php(34): CSVImport\\Job\\Import->perform()\n#14 /var/www/html/omeka-s/application/src/Job/Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\Synchronous->send()\n#15 /var/www/html/omeka-s/application/data/scripts/perform-job.php(66): Omeka\\Job\\Dispatcher->send()\n#16 {main}\n2025-10-19T09:44:03+00:00 ERR (3): Omeka\\Api\\Exception\\NotFoundException: Resource not found with id 104. in /var/www/html/omeka-s/application/src/DataType/Resource/AbstractResource.php:60\nStack trace:\n#0 /var/www/html/omeka-s/application/src/Api/Adapter/ValueHydrator.php(132): Omeka\\DataType\\Resource\\AbstractResource->hydrate()\n#1 /var/www/html/omeka-s/application/src/Api/Adapter/AbstractResourceEntityAdapter.php(174): Omeka\\Api\\Adapter\\ValueHydrator->hydrate()\n#2 /var/www/html/omeka-s/application/src/Api/Adapter/ItemAdapter.php(166): Omeka\\Api\\Adapter\\AbstractResourceEntityAdapter->hydrate()\n#3 /var/www/html/omeka-s/application/src/Api/Adapter/AbstractEntityAdapter.php(643): Omeka\\Api\\Adapter\\ItemAdapter->hydrate()\n#4 /var/www/html/omeka-s/application/src/Api/Adapter/AbstractEntityAdapter.php(354): Omeka\\Api\\Adapter\\AbstractEntityAdapter->hydrateEntity()\n#5 /var/www/html/omeka-s/application/src/Api/Manager.php(224): Omeka\\Api\\Adapter\\AbstractEntityAdapter->create()\n#6 /var/www/html/omeka-s/application/src/Api/Manager.php(78): Omeka\\Api\\Manager->execute()\n#7 /var/www/html/omeka-s/application/src/Api/Adapter/AbstractEntityAdapter.php(402): Omeka\\Api\\Manager->create()\n#8 /var/www/html/omeka-s/application/src/Api/Manager.php(227): Omeka\\Api\\Adapter\\AbstractEntityAdapter->batchCreate()\n#9 /var/www/html/omeka-s/application/src/Api/Manager.php(97): Omeka\\Api\\Manager->execute()\n#10 /var/www/html/omeka-s/modules/CSVImport/src/Job/Import.php(364): Omeka\\Api\\Manager->batchCreate()\n#11 /var/www/html/omeka-s/modules/CSVImport/src/Job/Import.php(266): CSVImport\\Job\\Import->create()\n#12 /var/www/html/omeka-s/modules/CSVImport/src/Job/Import.php(205): CSVImport\\Job\\Import->processBatchData()\n#13 /var/www/html/omeka-s/application/src/Job/DispatchStrategy/Synchronous.php(34): CSVImport\\Job\\Import->perform()\n#14 /var/www/html/omeka-s/application/src/Job/Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\Synchronous->send()\n#15 /var/www/html/omeka-s/application/data/scripts/perform-job.php(66): Omeka\\Job\\Dispatcher->send()\n#16 {main}\n2025-10-19T09:44:03+00:00 ERR (3): Omeka\\Api\\Exception\\NotFoundException: Resource not found with id 107. in /var/www/html/omeka-s/application/src/DataType/Resource/AbstractResource.php:60\nStack trace:\n#0 /var/www/html/omeka-s/application/src/Api/Adapter/ValueHydrator.php(132): Omeka\\DataType\\Resource\\AbstractResource->hydrate()\n#1 /var/www/html/omeka-s/application/src/Api/Adapter/AbstractResourceEntityAdapter.php(174): Omeka\\Api\\Adapter\\ValueHydrator->hydrate()\n#2 /var/www/html/omeka-s/application/src/Api/Adapter/ItemAdapter.php(166): Omeka\\Api\\Adapter\\AbstractResourceEntityAdapter->hydrate()\n#3 /var/www/html/omeka-s/application/src/Api/Adapter/AbstractEntityAdapter.php(643): Omeka\\Api\\Adapter\\ItemAdapter->hydrate()\n#4 /var/www/html/omeka-s/application/src/Api/Adapter/AbstractEntityAdapter.php(354): Omeka\\Api\\Adapter\\AbstractEntityAdapter->hydrateEntity()\n#5 /var/www/html/omeka-s/application/src/Api/Manager.php(224): Omeka\\Api\\Adapter\\AbstractEntityAdapter->create()\n#6 /var/www/html/omeka-s/application/src/Api/Manager.php(78): Omeka\\Api\\Manager->execute()\n#7 /var/www/html/omeka-s/application/src/Api/Adapter/AbstractEntityAdapter.php(402): Omeka\\Api\\Manager->create()\n#8 /var/www/html/omeka-s/application/src/Api/Manager.php(227): Omeka\\Api\\Adapter\\AbstractEntityAdapter->batchCreate()\n#9 /var/www/html/omeka-s/application/src/Api/Manager.php(97): Omeka\\Api\\Manager->execute()\n#10 /var/www/html/omeka-s/modules/CSVImport/src/Job/Import.php(364): Omeka\\Api\\Manager->batchCreate()\n#11 /var/www/html/omeka-s/modules/CSVImport/src/Job/Import.php(266): CSVImport\\Job\\Import->create()\n#12 /var/www/html/omeka-s/modules/CSVImport/src/Job/Import.php(205): CSVImport\\Job\\Import->processBatchData()\n#13 /var/www/html/omeka-s/application/src/Job/DispatchStrategy/Synchronous.php(34): CSVImport\\Job\\Import->perform()\n#14 /var/www/html/omeka-s/application/src/Job/Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\Synchronous->send()\n#15 /var/www/html/omeka-s/application/data/scripts/perform-job.php(66): Omeka\\Job\\Dispatcher->send()\n#16 {main}\n2025-10-19T09:44:03+00:00 ERR (3): Omeka\\Api\\Exception\\NotFoundException: Resource not found with id 110. in /var/www/html/omeka-s/application/src/DataType/Resource/AbstractResource.php:60\nStack trace:\n#0 /var/www/html/omeka-s/application/src/Api/Adapter/ValueHydrator.php(132): Omeka\\DataType\\Resource\\AbstractResource->hydrate()\n#1 /var/www/html/omeka-s/application/src/Api/Adapter/AbstractResourceEntityAdapter.php(174): Omeka\\Api\\Adapter\\ValueHydrator->hydrate()\n#2 /var/www/html/omeka-s/application/src/Api/Adapter/ItemAdapter.php(166): Omeka\\Api\\Adapter\\AbstractResourceEntityAdapter->hydrate()\n#3 /var/www/html/omeka-s/application/src/Api/Adapter/AbstractEntityAdapter.php(643): Omeka\\Api\\Adapter\\ItemAdapter->hydrate()\n#4 /var/www/html/omeka-s/application/src/Api/Adapter/AbstractEntityAdapter.php(354): Omeka\\Api\\Adapter\\AbstractEntityAdapter->hydrateEntity()\n#5 /var/www/html/omeka-s/application/src/Api/Manager.php(224): Omeka\\Api\\Adapter\\AbstractEntityAdapter->create()\n#6 /var/www/html/omeka-s/application/src/Api/Manager.php(78): Omeka\\Api\\Manager->execute()\n#7 /var/www/html/omeka-s/application/src/Api/Adapter/AbstractEntityAdapter.php(402): Omeka\\Api\\Manager->create()\n#8 /var/www/html/omeka-s/application/src/Api/Manager.php(227): Omeka\\Api\\Adapter\\AbstractEntityAdapter->batchCreate()\n#9 /var/www/html/omeka-s/application/src/Api/Manager.php(97): Omeka\\Api\\Manager->execute()\n#10 /var/www/html/omeka-s/modules/CSVImport/src/Job/Import.php(364): Omeka\\Api\\Manager->batchCreate()\n#11 /var/www/html/omeka-s/modules/CSVImport/src/Job/Import.php(266): CSVImport\\Job\\Import->create()\n#12 /var/www/html/omeka-s/modules/CSVImport/src/Job/Import.php(205): CSVImport\\Job\\Import->processBatchData()\n#13 /var/www/html/omeka-s/application/src/Job/DispatchStrategy/Synchronous.php(34): CSVImport\\Job\\Import->perform()\n#14 /var/www/html/omeka-s/application/src/Job/Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\Synchronous->send()\n#15 /var/www/html/omeka-s/application/data/scripts/perform-job.php(66): Omeka\\Job\\Dispatcher->send()\n#16 {main}\n', '2025-10-19 09:44:03', '2025-10-19 09:44:03'),
(34, 1, '11839', 'completed', 'CSVImport\\Job\\Import', '{\"filename\":\"Recipe_fake.csv\",\"filesize\":\"1360\",\"filepath\":\"\\/tmp\\/omekaZZbnym\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-property\":{\"2\":{\"ke:name\":214},\"3\":{\"ke:description\":234},\"4\":{\"ke:image\":217},\"5\":{\"ke:hasIngredient\":224},\"6\":{\"ke:preparationTime\":220},\"7\":{\"ke:cookingTime\":219},\"8\":{\"ke:steps\":218},\"9\":{\"ke:calories\":221},\"10\":{\"ke:difficulty\":222},\"11\":{\"ke:createdBy\":223}},\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2025-10-19 09:44:17', '2025-10-19 09:44:17'),
(35, 1, '11931', 'completed', 'CSVImport\\Job\\Import', '{\"filename\":\"Recipe_fake.csv\",\"filesize\":\"1360\",\"filepath\":\"\\/tmp\\/omekaEHqlh6\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-resource_class\":[\"1\"],\"column-resource_template\":{\"1\":\"1\"},\"column-property\":{\"2\":{\"ke:name\":214},\"3\":{\"ke:description\":234},\"4\":{\"ke:image\":217},\"5\":{\"ke:hasIngredient\":224},\"6\":{\"ke:preparationTime\":220},\"7\":{\"ke:cookingTime\":219},\"8\":{\"ke:steps\":218},\"9\":{\"ke:calories\":221},\"10\":{\"ke:difficulty\":222},\"11\":{\"ke:createdBy\":223}},\"column-item_set\":{\"5\":\"internal_id\"},\"column-data-type\":{\"11\":\"resource\"},\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', '2025-10-19T09:47:38+00:00 ERR (3): \"101,102\" (internal_id) is not a valid item set.\n2025-10-19T09:47:38+00:00 ERR (3): \"103\" (internal_id) is not a valid item set.\n2025-10-19T09:47:38+00:00 ERR (3): \"104,105,106\" (internal_id) is not a valid item set.\n2025-10-19T09:47:38+00:00 ERR (3): \"107,108,109\" (internal_id) is not a valid item set.\n2025-10-19T09:47:38+00:00 ERR (3): \"110,111\" (internal_id) is not a valid item set.\n', '2025-10-19 09:47:38', '2025-10-19 09:47:38'),
(36, 1, '12031', 'completed', 'CSVImport\\Job\\Import', '{\"filename\":\"Recipe_fake.csv\",\"filesize\":\"1360\",\"filepath\":\"\\/tmp\\/omekaAJwchr\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-resource_class\":[\"1\"],\"column-resource_template\":{\"1\":\"1\"},\"column-property\":{\"2\":{\"ke:name\":214},\"3\":{\"ke:description\":234},\"4\":{\"ke:image\":217},\"5\":{\"ke:hasIngredient\":224},\"6\":{\"ke:preparationTime\":220},\"7\":{\"ke:cookingTime\":219},\"8\":{\"ke:steps\":218},\"9\":{\"ke:calories\":221},\"10\":{\"ke:difficulty\":222},\"11\":{\"ke:createdBy\":223}},\"column-data-type\":{\"5\":\"resource\",\"11\":\"resource\"},\"column-multivalue\":{\"5\":\"1\"},\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', '2025-10-19T09:50:08+00:00 ERR (3): Omeka\\Api\\Exception\\NotFoundException: Resource not found with id 101. in /var/www/html/omeka-s/application/src/DataType/Resource/AbstractResource.php:60\nStack trace:\n#0 /var/www/html/omeka-s/application/src/Api/Adapter/ValueHydrator.php(132): Omeka\\DataType\\Resource\\AbstractResource->hydrate()\n#1 /var/www/html/omeka-s/application/src/Api/Adapter/AbstractResourceEntityAdapter.php(174): Omeka\\Api\\Adapter\\ValueHydrator->hydrate()\n#2 /var/www/html/omeka-s/application/src/Api/Adapter/ItemAdapter.php(166): Omeka\\Api\\Adapter\\AbstractResourceEntityAdapter->hydrate()\n#3 /var/www/html/omeka-s/application/src/Api/Adapter/AbstractEntityAdapter.php(643): Omeka\\Api\\Adapter\\ItemAdapter->hydrate()\n#4 /var/www/html/omeka-s/application/src/Api/Adapter/AbstractEntityAdapter.php(354): Omeka\\Api\\Adapter\\AbstractEntityAdapter->hydrateEntity()\n#5 /var/www/html/omeka-s/application/src/Api/Manager.php(224): Omeka\\Api\\Adapter\\AbstractEntityAdapter->create()\n#6 /var/www/html/omeka-s/application/src/Api/Manager.php(78): Omeka\\Api\\Manager->execute()\n#7 /var/www/html/omeka-s/application/src/Api/Adapter/AbstractEntityAdapter.php(402): Omeka\\Api\\Manager->create()\n#8 /var/www/html/omeka-s/application/src/Api/Manager.php(227): Omeka\\Api\\Adapter\\AbstractEntityAdapter->batchCreate()\n#9 /var/www/html/omeka-s/application/src/Api/Manager.php(97): Omeka\\Api\\Manager->execute()\n#10 /var/www/html/omeka-s/modules/CSVImport/src/Job/Import.php(364): Omeka\\Api\\Manager->batchCreate()\n#11 /var/www/html/omeka-s/modules/CSVImport/src/Job/Import.php(266): CSVImport\\Job\\Import->create()\n#12 /var/www/html/omeka-s/modules/CSVImport/src/Job/Import.php(205): CSVImport\\Job\\Import->processBatchData()\n#13 /var/www/html/omeka-s/application/src/Job/DispatchStrategy/Synchronous.php(34): CSVImport\\Job\\Import->perform()\n#14 /var/www/html/omeka-s/application/src/Job/Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\Synchronous->send()\n#15 /var/www/html/omeka-s/application/data/scripts/perform-job.php(66): Omeka\\Job\\Dispatcher->send()\n#16 {main}\n2025-10-19T09:50:08+00:00 ERR (3): Omeka\\Api\\Exception\\NotFoundException: Resource not found with id 103. in /var/www/html/omeka-s/application/src/DataType/Resource/AbstractResource.php:60\nStack trace:\n#0 /var/www/html/omeka-s/application/src/Api/Adapter/ValueHydrator.php(132): Omeka\\DataType\\Resource\\AbstractResource->hydrate()\n#1 /var/www/html/omeka-s/application/src/Api/Adapter/AbstractResourceEntityAdapter.php(174): Omeka\\Api\\Adapter\\ValueHydrator->hydrate()\n#2 /var/www/html/omeka-s/application/src/Api/Adapter/ItemAdapter.php(166): Omeka\\Api\\Adapter\\AbstractResourceEntityAdapter->hydrate()\n#3 /var/www/html/omeka-s/application/src/Api/Adapter/AbstractEntityAdapter.php(643): Omeka\\Api\\Adapter\\ItemAdapter->hydrate()\n#4 /var/www/html/omeka-s/application/src/Api/Adapter/AbstractEntityAdapter.php(354): Omeka\\Api\\Adapter\\AbstractEntityAdapter->hydrateEntity()\n#5 /var/www/html/omeka-s/application/src/Api/Manager.php(224): Omeka\\Api\\Adapter\\AbstractEntityAdapter->create()\n#6 /var/www/html/omeka-s/application/src/Api/Manager.php(78): Omeka\\Api\\Manager->execute()\n#7 /var/www/html/omeka-s/application/src/Api/Adapter/AbstractEntityAdapter.php(402): Omeka\\Api\\Manager->create()\n#8 /var/www/html/omeka-s/application/src/Api/Manager.php(227): Omeka\\Api\\Adapter\\AbstractEntityAdapter->batchCreate()\n#9 /var/www/html/omeka-s/application/src/Api/Manager.php(97): Omeka\\Api\\Manager->execute()\n#10 /var/www/html/omeka-s/modules/CSVImport/src/Job/Import.php(364): Omeka\\Api\\Manager->batchCreate()\n#11 /var/www/html/omeka-s/modules/CSVImport/src/Job/Import.php(266): CSVImport\\Job\\Import->create()\n#12 /var/www/html/omeka-s/modules/CSVImport/src/Job/Import.php(205): CSVImport\\Job\\Import->processBatchData()\n#13 /var/www/html/omeka-s/application/src/Job/DispatchStrategy/Synchronous.php(34): CSVImport\\Job\\Import->perform()\n#14 /var/www/html/omeka-s/application/src/Job/Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\Synchronous->send()\n#15 /var/www/html/omeka-s/application/data/scripts/perform-job.php(66): Omeka\\Job\\Dispatcher->send()\n#16 {main}\n2025-10-19T09:50:08+00:00 ERR (3): Omeka\\Api\\Exception\\NotFoundException: Resource not found with id 104. in /var/www/html/omeka-s/application/src/DataType/Resource/AbstractResource.php:60\nStack trace:\n#0 /var/www/html/omeka-s/application/src/Api/Adapter/ValueHydrator.php(132): Omeka\\DataType\\Resource\\AbstractResource->hydrate()\n#1 /var/www/html/omeka-s/application/src/Api/Adapter/AbstractResourceEntityAdapter.php(174): Omeka\\Api\\Adapter\\ValueHydrator->hydrate()\n#2 /var/www/html/omeka-s/application/src/Api/Adapter/ItemAdapter.php(166): Omeka\\Api\\Adapter\\AbstractResourceEntityAdapter->hydrate()\n#3 /var/www/html/omeka-s/application/src/Api/Adapter/AbstractEntityAdapter.php(643): Omeka\\Api\\Adapter\\ItemAdapter->hydrate()\n#4 /var/www/html/omeka-s/application/src/Api/Adapter/AbstractEntityAdapter.php(354): Omeka\\Api\\Adapter\\AbstractEntityAdapter->hydrateEntity()\n#5 /var/www/html/omeka-s/application/src/Api/Manager.php(224): Omeka\\Api\\Adapter\\AbstractEntityAdapter->create()\n#6 /var/www/html/omeka-s/application/src/Api/Manager.php(78): Omeka\\Api\\Manager->execute()\n#7 /var/www/html/omeka-s/application/src/Api/Adapter/AbstractEntityAdapter.php(402): Omeka\\Api\\Manager->create()\n#8 /var/www/html/omeka-s/application/src/Api/Manager.php(227): Omeka\\Api\\Adapter\\AbstractEntityAdapter->batchCreate()\n#9 /var/www/html/omeka-s/application/src/Api/Manager.php(97): Omeka\\Api\\Manager->execute()\n#10 /var/www/html/omeka-s/modules/CSVImport/src/Job/Import.php(364): Omeka\\Api\\Manager->batchCreate()\n#11 /var/www/html/omeka-s/modules/CSVImport/src/Job/Import.php(266): CSVImport\\Job\\Import->create()\n#12 /var/www/html/omeka-s/modules/CSVImport/src/Job/Import.php(205): CSVImport\\Job\\Import->processBatchData()\n#13 /var/www/html/omeka-s/application/src/Job/DispatchStrategy/Synchronous.php(34): CSVImport\\Job\\Import->perform()\n#14 /var/www/html/omeka-s/application/src/Job/Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\Synchronous->send()\n#15 /var/www/html/omeka-s/application/data/scripts/perform-job.php(66): Omeka\\Job\\Dispatcher->send()\n#16 {main}\n2025-10-19T09:50:08+00:00 ERR (3): Omeka\\Api\\Exception\\NotFoundException: Resource not found with id 107. in /var/www/html/omeka-s/application/src/DataType/Resource/AbstractResource.php:60\nStack trace:\n#0 /var/www/html/omeka-s/application/src/Api/Adapter/ValueHydrator.php(132): Omeka\\DataType\\Resource\\AbstractResource->hydrate()\n#1 /var/www/html/omeka-s/application/src/Api/Adapter/AbstractResourceEntityAdapter.php(174): Omeka\\Api\\Adapter\\ValueHydrator->hydrate()\n#2 /var/www/html/omeka-s/application/src/Api/Adapter/ItemAdapter.php(166): Omeka\\Api\\Adapter\\AbstractResourceEntityAdapter->hydrate()\n#3 /var/www/html/omeka-s/application/src/Api/Adapter/AbstractEntityAdapter.php(643): Omeka\\Api\\Adapter\\ItemAdapter->hydrate()\n#4 /var/www/html/omeka-s/application/src/Api/Adapter/AbstractEntityAdapter.php(354): Omeka\\Api\\Adapter\\AbstractEntityAdapter->hydrateEntity()\n#5 /var/www/html/omeka-s/application/src/Api/Manager.php(224): Omeka\\Api\\Adapter\\AbstractEntityAdapter->create()\n#6 /var/www/html/omeka-s/application/src/Api/Manager.php(78): Omeka\\Api\\Manager->execute()\n#7 /var/www/html/omeka-s/application/src/Api/Adapter/AbstractEntityAdapter.php(402): Omeka\\Api\\Manager->create()\n#8 /var/www/html/omeka-s/application/src/Api/Manager.php(227): Omeka\\Api\\Adapter\\AbstractEntityAdapter->batchCreate()\n#9 /var/www/html/omeka-s/application/src/Api/Manager.php(97): Omeka\\Api\\Manager->execute()\n#10 /var/www/html/omeka-s/modules/CSVImport/src/Job/Import.php(364): Omeka\\Api\\Manager->batchCreate()\n#11 /var/www/html/omeka-s/modules/CSVImport/src/Job/Import.php(266): CSVImport\\Job\\Import->create()\n#12 /var/www/html/omeka-s/modules/CSVImport/src/Job/Import.php(205): CSVImport\\Job\\Import->processBatchData()\n#13 /var/www/html/omeka-s/application/src/Job/DispatchStrategy/Synchronous.php(34): CSVImport\\Job\\Import->perform()\n#14 /var/www/html/omeka-s/application/src/Job/Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\Synchronous->send()\n#15 /var/www/html/omeka-s/application/data/scripts/perform-job.php(66): Omeka\\Job\\Dispatcher->send()\n#16 {main}\n2025-10-19T09:50:08+00:00 ERR (3): Omeka\\Api\\Exception\\NotFoundException: Resource not found with id 110. in /var/www/html/omeka-s/application/src/DataType/Resource/AbstractResource.php:60\nStack trace:\n#0 /var/www/html/omeka-s/application/src/Api/Adapter/ValueHydrator.php(132): Omeka\\DataType\\Resource\\AbstractResource->hydrate()\n#1 /var/www/html/omeka-s/application/src/Api/Adapter/AbstractResourceEntityAdapter.php(174): Omeka\\Api\\Adapter\\ValueHydrator->hydrate()\n#2 /var/www/html/omeka-s/application/src/Api/Adapter/ItemAdapter.php(166): Omeka\\Api\\Adapter\\AbstractResourceEntityAdapter->hydrate()\n#3 /var/www/html/omeka-s/application/src/Api/Adapter/AbstractEntityAdapter.php(643): Omeka\\Api\\Adapter\\ItemAdapter->hydrate()\n#4 /var/www/html/omeka-s/application/src/Api/Adapter/AbstractEntityAdapter.php(354): Omeka\\Api\\Adapter\\AbstractEntityAdapter->hydrateEntity()\n#5 /var/www/html/omeka-s/application/src/Api/Manager.php(224): Omeka\\Api\\Adapter\\AbstractEntityAdapter->create()\n#6 /var/www/html/omeka-s/application/src/Api/Manager.php(78): Omeka\\Api\\Manager->execute()\n#7 /var/www/html/omeka-s/application/src/Api/Adapter/AbstractEntityAdapter.php(402): Omeka\\Api\\Manager->create()\n#8 /var/www/html/omeka-s/application/src/Api/Manager.php(227): Omeka\\Api\\Adapter\\AbstractEntityAdapter->batchCreate()\n#9 /var/www/html/omeka-s/application/src/Api/Manager.php(97): Omeka\\Api\\Manager->execute()\n#10 /var/www/html/omeka-s/modules/CSVImport/src/Job/Import.php(364): Omeka\\Api\\Manager->batchCreate()\n#11 /var/www/html/omeka-s/modules/CSVImport/src/Job/Import.php(266): CSVImport\\Job\\Import->create()\n#12 /var/www/html/omeka-s/modules/CSVImport/src/Job/Import.php(205): CSVImport\\Job\\Import->processBatchData()\n#13 /var/www/html/omeka-s/application/src/Job/DispatchStrategy/Synchronous.php(34): CSVImport\\Job\\Import->perform()\n#14 /var/www/html/omeka-s/application/src/Job/Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\Synchronous->send()\n#15 /var/www/html/omeka-s/application/data/scripts/perform-job.php(66): Omeka\\Job\\Dispatcher->send()\n#16 {main}\n', '2025-10-19 09:50:08', '2025-10-19 09:50:08'),
(37, 1, '12126', 'completed', 'CSVImport\\Job\\Import', '{\"filename\":\"Recipe_fake.csv\",\"filesize\":\"1360\",\"filepath\":\"\\/tmp\\/omekaAkZCmR\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-resource_class\":[\"1\"],\"column-resource_template\":{\"1\":\"1\"},\"column-property\":{\"2\":{\"ke:name\":214},\"3\":{\"ke:description\":234},\"4\":{\"ke:image\":217},\"5\":{\"ke:hasIngredient\":224},\"6\":{\"ke:preparationTime\":220},\"7\":{\"ke:cookingTime\":219},\"8\":{\"ke:steps\":218},\"9\":{\"ke:calories\":221},\"10\":{\"ke:difficulty\":222},\"11\":{\"ke:createdBy\":223}},\"column-data-type\":{\"5\":\"resource\",\"11\":\"resource\"},\"column-multivalue\":{\"5\":\"1\"},\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', '2025-10-19T09:52:35+00:00 ERR (3): Omeka\\Api\\Exception\\NotFoundException: Resource not found with id 101. in /var/www/html/omeka-s/application/src/DataType/Resource/AbstractResource.php:60\nStack trace:\n#0 /var/www/html/omeka-s/application/src/Api/Adapter/ValueHydrator.php(132): Omeka\\DataType\\Resource\\AbstractResource->hydrate()\n#1 /var/www/html/omeka-s/application/src/Api/Adapter/AbstractResourceEntityAdapter.php(174): Omeka\\Api\\Adapter\\ValueHydrator->hydrate()\n#2 /var/www/html/omeka-s/application/src/Api/Adapter/ItemAdapter.php(166): Omeka\\Api\\Adapter\\AbstractResourceEntityAdapter->hydrate()\n#3 /var/www/html/omeka-s/application/src/Api/Adapter/AbstractEntityAdapter.php(643): Omeka\\Api\\Adapter\\ItemAdapter->hydrate()\n#4 /var/www/html/omeka-s/application/src/Api/Adapter/AbstractEntityAdapter.php(354): Omeka\\Api\\Adapter\\AbstractEntityAdapter->hydrateEntity()\n#5 /var/www/html/omeka-s/application/src/Api/Manager.php(224): Omeka\\Api\\Adapter\\AbstractEntityAdapter->create()\n#6 /var/www/html/omeka-s/application/src/Api/Manager.php(78): Omeka\\Api\\Manager->execute()\n#7 /var/www/html/omeka-s/application/src/Api/Adapter/AbstractEntityAdapter.php(402): Omeka\\Api\\Manager->create()\n#8 /var/www/html/omeka-s/application/src/Api/Manager.php(227): Omeka\\Api\\Adapter\\AbstractEntityAdapter->batchCreate()\n#9 /var/www/html/omeka-s/application/src/Api/Manager.php(97): Omeka\\Api\\Manager->execute()\n#10 /var/www/html/omeka-s/modules/CSVImport/src/Job/Import.php(364): Omeka\\Api\\Manager->batchCreate()\n#11 /var/www/html/omeka-s/modules/CSVImport/src/Job/Import.php(266): CSVImport\\Job\\Import->create()\n#12 /var/www/html/omeka-s/modules/CSVImport/src/Job/Import.php(205): CSVImport\\Job\\Import->processBatchData()\n#13 /var/www/html/omeka-s/application/src/Job/DispatchStrategy/Synchronous.php(34): CSVImport\\Job\\Import->perform()\n#14 /var/www/html/omeka-s/application/src/Job/Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\Synchronous->send()\n#15 /var/www/html/omeka-s/application/data/scripts/perform-job.php(66): Omeka\\Job\\Dispatcher->send()\n#16 {main}\n2025-10-19T09:52:35+00:00 ERR (3): Omeka\\Api\\Exception\\NotFoundException: Resource not found with id 103. in /var/www/html/omeka-s/application/src/DataType/Resource/AbstractResource.php:60\nStack trace:\n#0 /var/www/html/omeka-s/application/src/Api/Adapter/ValueHydrator.php(132): Omeka\\DataType\\Resource\\AbstractResource->hydrate()\n#1 /var/www/html/omeka-s/application/src/Api/Adapter/AbstractResourceEntityAdapter.php(174): Omeka\\Api\\Adapter\\ValueHydrator->hydrate()\n#2 /var/www/html/omeka-s/application/src/Api/Adapter/ItemAdapter.php(166): Omeka\\Api\\Adapter\\AbstractResourceEntityAdapter->hydrate()\n#3 /var/www/html/omeka-s/application/src/Api/Adapter/AbstractEntityAdapter.php(643): Omeka\\Api\\Adapter\\ItemAdapter->hydrate()\n#4 /var/www/html/omeka-s/application/src/Api/Adapter/AbstractEntityAdapter.php(354): Omeka\\Api\\Adapter\\AbstractEntityAdapter->hydrateEntity()\n#5 /var/www/html/omeka-s/application/src/Api/Manager.php(224): Omeka\\Api\\Adapter\\AbstractEntityAdapter->create()\n#6 /var/www/html/omeka-s/application/src/Api/Manager.php(78): Omeka\\Api\\Manager->execute()\n#7 /var/www/html/omeka-s/application/src/Api/Adapter/AbstractEntityAdapter.php(402): Omeka\\Api\\Manager->create()\n#8 /var/www/html/omeka-s/application/src/Api/Manager.php(227): Omeka\\Api\\Adapter\\AbstractEntityAdapter->batchCreate()\n#9 /var/www/html/omeka-s/application/src/Api/Manager.php(97): Omeka\\Api\\Manager->execute()\n#10 /var/www/html/omeka-s/modules/CSVImport/src/Job/Import.php(364): Omeka\\Api\\Manager->batchCreate()\n#11 /var/www/html/omeka-s/modules/CSVImport/src/Job/Import.php(266): CSVImport\\Job\\Import->create()\n#12 /var/www/html/omeka-s/modules/CSVImport/src/Job/Import.php(205): CSVImport\\Job\\Import->processBatchData()\n#13 /var/www/html/omeka-s/application/src/Job/DispatchStrategy/Synchronous.php(34): CSVImport\\Job\\Import->perform()\n#14 /var/www/html/omeka-s/application/src/Job/Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\Synchronous->send()\n#15 /var/www/html/omeka-s/application/data/scripts/perform-job.php(66): Omeka\\Job\\Dispatcher->send()\n#16 {main}\n2025-10-19T09:52:35+00:00 ERR (3): Omeka\\Api\\Exception\\NotFoundException: Resource not found with id 104. in /var/www/html/omeka-s/application/src/DataType/Resource/AbstractResource.php:60\nStack trace:\n#0 /var/www/html/omeka-s/application/src/Api/Adapter/ValueHydrator.php(132): Omeka\\DataType\\Resource\\AbstractResource->hydrate()\n#1 /var/www/html/omeka-s/application/src/Api/Adapter/AbstractResourceEntityAdapter.php(174): Omeka\\Api\\Adapter\\ValueHydrator->hydrate()\n#2 /var/www/html/omeka-s/application/src/Api/Adapter/ItemAdapter.php(166): Omeka\\Api\\Adapter\\AbstractResourceEntityAdapter->hydrate()\n#3 /var/www/html/omeka-s/application/src/Api/Adapter/AbstractEntityAdapter.php(643): Omeka\\Api\\Adapter\\ItemAdapter->hydrate()\n#4 /var/www/html/omeka-s/application/src/Api/Adapter/AbstractEntityAdapter.php(354): Omeka\\Api\\Adapter\\AbstractEntityAdapter->hydrateEntity()\n#5 /var/www/html/omeka-s/application/src/Api/Manager.php(224): Omeka\\Api\\Adapter\\AbstractEntityAdapter->create()\n#6 /var/www/html/omeka-s/application/src/Api/Manager.php(78): Omeka\\Api\\Manager->execute()\n#7 /var/www/html/omeka-s/application/src/Api/Adapter/AbstractEntityAdapter.php(402): Omeka\\Api\\Manager->create()\n#8 /var/www/html/omeka-s/application/src/Api/Manager.php(227): Omeka\\Api\\Adapter\\AbstractEntityAdapter->batchCreate()\n#9 /var/www/html/omeka-s/application/src/Api/Manager.php(97): Omeka\\Api\\Manager->execute()\n#10 /var/www/html/omeka-s/modules/CSVImport/src/Job/Import.php(364): Omeka\\Api\\Manager->batchCreate()\n#11 /var/www/html/omeka-s/modules/CSVImport/src/Job/Import.php(266): CSVImport\\Job\\Import->create()\n#12 /var/www/html/omeka-s/modules/CSVImport/src/Job/Import.php(205): CSVImport\\Job\\Import->processBatchData()\n#13 /var/www/html/omeka-s/application/src/Job/DispatchStrategy/Synchronous.php(34): CSVImport\\Job\\Import->perform()\n#14 /var/www/html/omeka-s/application/src/Job/Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\Synchronous->send()\n#15 /var/www/html/omeka-s/application/data/scripts/perform-job.php(66): Omeka\\Job\\Dispatcher->send()\n#16 {main}\n2025-10-19T09:52:35+00:00 ERR (3): Omeka\\Api\\Exception\\NotFoundException: Resource not found with id 107. in /var/www/html/omeka-s/application/src/DataType/Resource/AbstractResource.php:60\nStack trace:\n#0 /var/www/html/omeka-s/application/src/Api/Adapter/ValueHydrator.php(132): Omeka\\DataType\\Resource\\AbstractResource->hydrate()\n#1 /var/www/html/omeka-s/application/src/Api/Adapter/AbstractResourceEntityAdapter.php(174): Omeka\\Api\\Adapter\\ValueHydrator->hydrate()\n#2 /var/www/html/omeka-s/application/src/Api/Adapter/ItemAdapter.php(166): Omeka\\Api\\Adapter\\AbstractResourceEntityAdapter->hydrate()\n#3 /var/www/html/omeka-s/application/src/Api/Adapter/AbstractEntityAdapter.php(643): Omeka\\Api\\Adapter\\ItemAdapter->hydrate()\n#4 /var/www/html/omeka-s/application/src/Api/Adapter/AbstractEntityAdapter.php(354): Omeka\\Api\\Adapter\\AbstractEntityAdapter->hydrateEntity()\n#5 /var/www/html/omeka-s/application/src/Api/Manager.php(224): Omeka\\Api\\Adapter\\AbstractEntityAdapter->create()\n#6 /var/www/html/omeka-s/application/src/Api/Manager.php(78): Omeka\\Api\\Manager->execute()\n#7 /var/www/html/omeka-s/application/src/Api/Adapter/AbstractEntityAdapter.php(402): Omeka\\Api\\Manager->create()\n#8 /var/www/html/omeka-s/application/src/Api/Manager.php(227): Omeka\\Api\\Adapter\\AbstractEntityAdapter->batchCreate()\n#9 /var/www/html/omeka-s/application/src/Api/Manager.php(97): Omeka\\Api\\Manager->execute()\n#10 /var/www/html/omeka-s/modules/CSVImport/src/Job/Import.php(364): Omeka\\Api\\Manager->batchCreate()\n#11 /var/www/html/omeka-s/modules/CSVImport/src/Job/Import.php(266): CSVImport\\Job\\Import->create()\n#12 /var/www/html/omeka-s/modules/CSVImport/src/Job/Import.php(205): CSVImport\\Job\\Import->processBatchData()\n#13 /var/www/html/omeka-s/application/src/Job/DispatchStrategy/Synchronous.php(34): CSVImport\\Job\\Import->perform()\n#14 /var/www/html/omeka-s/application/src/Job/Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\Synchronous->send()\n#15 /var/www/html/omeka-s/application/data/scripts/perform-job.php(66): Omeka\\Job\\Dispatcher->send()\n#16 {main}\n2025-10-19T09:52:35+00:00 ERR (3): Omeka\\Api\\Exception\\NotFoundException: Resource not found with id 110. in /var/www/html/omeka-s/application/src/DataType/Resource/AbstractResource.php:60\nStack trace:\n#0 /var/www/html/omeka-s/application/src/Api/Adapter/ValueHydrator.php(132): Omeka\\DataType\\Resource\\AbstractResource->hydrate()\n#1 /var/www/html/omeka-s/application/src/Api/Adapter/AbstractResourceEntityAdapter.php(174): Omeka\\Api\\Adapter\\ValueHydrator->hydrate()\n#2 /var/www/html/omeka-s/application/src/Api/Adapter/ItemAdapter.php(166): Omeka\\Api\\Adapter\\AbstractResourceEntityAdapter->hydrate()\n#3 /var/www/html/omeka-s/application/src/Api/Adapter/AbstractEntityAdapter.php(643): Omeka\\Api\\Adapter\\ItemAdapter->hydrate()\n#4 /var/www/html/omeka-s/application/src/Api/Adapter/AbstractEntityAdapter.php(354): Omeka\\Api\\Adapter\\AbstractEntityAdapter->hydrateEntity()\n#5 /var/www/html/omeka-s/application/src/Api/Manager.php(224): Omeka\\Api\\Adapter\\AbstractEntityAdapter->create()\n#6 /var/www/html/omeka-s/application/src/Api/Manager.php(78): Omeka\\Api\\Manager->execute()\n#7 /var/www/html/omeka-s/application/src/Api/Adapter/AbstractEntityAdapter.php(402): Omeka\\Api\\Manager->create()\n#8 /var/www/html/omeka-s/application/src/Api/Manager.php(227): Omeka\\Api\\Adapter\\AbstractEntityAdapter->batchCreate()\n#9 /var/www/html/omeka-s/application/src/Api/Manager.php(97): Omeka\\Api\\Manager->execute()\n#10 /var/www/html/omeka-s/modules/CSVImport/src/Job/Import.php(364): Omeka\\Api\\Manager->batchCreate()\n#11 /var/www/html/omeka-s/modules/CSVImport/src/Job/Import.php(266): CSVImport\\Job\\Import->create()\n#12 /var/www/html/omeka-s/modules/CSVImport/src/Job/Import.php(205): CSVImport\\Job\\Import->processBatchData()\n#13 /var/www/html/omeka-s/application/src/Job/DispatchStrategy/Synchronous.php(34): CSVImport\\Job\\Import->perform()\n#14 /var/www/html/omeka-s/application/src/Job/Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\Synchronous->send()\n#15 /var/www/html/omeka-s/application/data/scripts/perform-job.php(66): Omeka\\Job\\Dispatcher->send()\n#16 {main}\n', '2025-10-19 09:52:35', '2025-10-19 09:52:35'),
(38, 1, '12178', 'completed', 'CSVImport\\Job\\Undo', '{\"jobId\":\"37\"}', NULL, '2025-10-19 09:53:23', '2025-10-19 09:53:23'),
(39, 1, '12181', 'completed', 'CSVImport\\Job\\Undo', '{\"jobId\":\"36\"}', NULL, '2025-10-19 09:53:23', '2025-10-19 09:53:23'),
(40, 1, '12185', 'completed', 'CSVImport\\Job\\Undo', '{\"jobId\":\"35\"}', NULL, '2025-10-19 09:53:23', '2025-10-19 09:53:23'),
(41, 1, '12282', 'completed', 'CSVImport\\Job\\Import', '{\"filename\":\"Recipe_fake.csv\",\"filesize\":\"1349\",\"filepath\":\"\\/tmp\\/omekaRm7gMZ\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-resource_class\":[\"1\"],\"column-resource_template\":{\"1\":\"1\"},\"column-property\":{\"2\":{\"ke:name\":214},\"3\":{\"ke:description\":234},\"4\":{\"ke:image\":217},\"5\":{\"ke:hasIngredient\":224},\"6\":{\"ke:preparationTime\":220},\"7\":{\"ke:cookingTime\":219},\"8\":{\"ke:steps\":218},\"9\":{\"ke:calories\":221},\"10\":{\"ke:difficulty\":222},\"11\":{\"ke:createdBy\":223}},\"column-data-type\":{\"5\":\"resource\",\"11\":\"resource\"},\"column-multivalue\":{\"5\":\"1\"},\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\";\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2025-10-19 09:55:42', '2025-10-19 09:55:42'),
(42, 1, '12493', 'completed', 'CSVImport\\Job\\Import', '{\"filename\":\"Rating_fake.csv\",\"filesize\":\"268\",\"filepath\":\"\\/tmp\\/omekadVYUU8\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-resource_class\":[\"1\"],\"column-resource_template\":{\"1\":\"1\"},\"column-property\":{\"2\":{\"ke:ratingValue\":229},\"3\":{\"ke:ratedBy\":227},\"4\":{\"ke:ratesRecipe\":228}},\"column-data-type\":{\"3\":\"resource\",\"4\":\"resource\"},\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\";\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2025-10-19 09:59:23', '2025-10-19 09:59:23');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` int NOT NULL,
  `item_id` int NOT NULL,
  `ingester` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `renderer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:json_array)',
  `source` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `media_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `storage_id` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extension` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sha256` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` bigint DEFAULT NULL,
  `has_original` tinyint(1) NOT NULL,
  `has_thumbnails` tinyint(1) NOT NULL,
  `position` int DEFAULT NULL,
  `lang` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt_text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migration`
--

CREATE TABLE `migration` (
  `version` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migration`
--

INSERT INTO `migration` (`version`) VALUES
('20171128053327'),
('20180412035023'),
('20180919072656'),
('20180924033501'),
('20181002015551'),
('20181004043735'),
('20181106060421'),
('20190307043537'),
('20190319020708'),
('20190412090532'),
('20190423040354'),
('20190423071228'),
('20190514061351'),
('20190515055359'),
('20190729023728'),
('20190809092609'),
('20190815062003'),
('20200224022356'),
('20200226064602'),
('20200325091157'),
('20200326091310'),
('20200803000000'),
('20200831000000'),
('20210205101827'),
('20210225095734'),
('20210810083804'),
('20220718090449'),
('20220824103916'),
('20230124033031'),
('20230410074846'),
('20230523085358'),
('20230601060113'),
('20230713101012'),
('20231016000000'),
('20240103030617');

-- --------------------------------------------------------

--
-- Table structure for table `module`
--

CREATE TABLE `module` (
  `id` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `version` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `module`
--

INSERT INTO `module` (`id`, `is_active`, `version`) VALUES
('CSVImport', 1, '2.6.2');

-- --------------------------------------------------------

--
-- Table structure for table `password_creation`
--

CREATE TABLE `password_creation` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `user_id` int NOT NULL,
  `created` datetime NOT NULL,
  `activate` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `property`
--

CREATE TABLE `property` (
  `id` int NOT NULL,
  `owner_id` int DEFAULT NULL,
  `vocabulary_id` int NOT NULL,
  `local_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `property`
--

INSERT INTO `property` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(1, NULL, 1, 'title', 'Title', 'A name given to the resource.'),
(2, NULL, 1, 'creator', 'Creator', 'An entity primarily responsible for making the resource.'),
(3, NULL, 1, 'subject', 'Subject', 'The topic of the resource.'),
(4, NULL, 1, 'description', 'Description', 'An account of the resource.'),
(5, NULL, 1, 'publisher', 'Publisher', 'An entity responsible for making the resource available.'),
(6, NULL, 1, 'contributor', 'Contributor', 'An entity responsible for making contributions to the resource.'),
(7, NULL, 1, 'date', 'Date', 'A point or period of time associated with an event in the lifecycle of the resource.'),
(8, NULL, 1, 'type', 'Type', 'The nature or genre of the resource.'),
(9, NULL, 1, 'format', 'Format', 'The file format, physical medium, or dimensions of the resource.'),
(10, NULL, 1, 'identifier', 'Identifier', 'An unambiguous reference to the resource within a given context.'),
(11, NULL, 1, 'source', 'Source', 'A related resource from which the described resource is derived.'),
(12, NULL, 1, 'language', 'Language', 'A language of the resource.'),
(13, NULL, 1, 'relation', 'Relation', 'A related resource.'),
(14, NULL, 1, 'coverage', 'Coverage', 'The spatial or temporal topic of the resource, the spatial applicability of the resource, or the jurisdiction under which the resource is relevant.'),
(15, NULL, 1, 'rights', 'Rights', 'Information about rights held in and over the resource.'),
(16, NULL, 1, 'audience', 'Audience', 'A class of entity for whom the resource is intended or useful.'),
(17, NULL, 1, 'alternative', 'Alternative Title', 'An alternative name for the resource.'),
(18, NULL, 1, 'tableOfContents', 'Table Of Contents', 'A list of subunits of the resource.'),
(19, NULL, 1, 'abstract', 'Abstract', 'A summary of the resource.'),
(20, NULL, 1, 'created', 'Date Created', 'Date of creation of the resource.'),
(21, NULL, 1, 'valid', 'Date Valid', 'Date (often a range) of validity of a resource.'),
(22, NULL, 1, 'available', 'Date Available', 'Date (often a range) that the resource became or will become available.'),
(23, NULL, 1, 'issued', 'Date Issued', 'Date of formal issuance (e.g., publication) of the resource.'),
(24, NULL, 1, 'modified', 'Date Modified', 'Date on which the resource was changed.'),
(25, NULL, 1, 'extent', 'Extent', 'The size or duration of the resource.'),
(26, NULL, 1, 'medium', 'Medium', 'The material or physical carrier of the resource.'),
(27, NULL, 1, 'isVersionOf', 'Is Version Of', 'A related resource of which the described resource is a version, edition, or adaptation.'),
(28, NULL, 1, 'hasVersion', 'Has Version', 'A related resource that is a version, edition, or adaptation of the described resource.'),
(29, NULL, 1, 'isReplacedBy', 'Is Replaced By', 'A related resource that supplants, displaces, or supersedes the described resource.'),
(30, NULL, 1, 'replaces', 'Replaces', 'A related resource that is supplanted, displaced, or superseded by the described resource.'),
(31, NULL, 1, 'isRequiredBy', 'Is Required By', 'A related resource that requires the described resource to support its function, delivery, or coherence.'),
(32, NULL, 1, 'requires', 'Requires', 'A related resource that is required by the described resource to support its function, delivery, or coherence.'),
(33, NULL, 1, 'isPartOf', 'Is Part Of', 'A related resource in which the described resource is physically or logically included.'),
(34, NULL, 1, 'hasPart', 'Has Part', 'A related resource that is included either physically or logically in the described resource.'),
(35, NULL, 1, 'isReferencedBy', 'Is Referenced By', 'A related resource that references, cites, or otherwise points to the described resource.'),
(36, NULL, 1, 'references', 'References', 'A related resource that is referenced, cited, or otherwise pointed to by the described resource.'),
(37, NULL, 1, 'isFormatOf', 'Is Format Of', 'A related resource that is substantially the same as the described resource, but in another format.'),
(38, NULL, 1, 'hasFormat', 'Has Format', 'A related resource that is substantially the same as the pre-existing described resource, but in another format.'),
(39, NULL, 1, 'conformsTo', 'Conforms To', 'An established standard to which the described resource conforms.'),
(40, NULL, 1, 'spatial', 'Spatial Coverage', 'Spatial characteristics of the resource.'),
(41, NULL, 1, 'temporal', 'Temporal Coverage', 'Temporal characteristics of the resource.'),
(42, NULL, 1, 'mediator', 'Mediator', 'An entity that mediates access to the resource and for whom the resource is intended or useful.'),
(43, NULL, 1, 'dateAccepted', 'Date Accepted', 'Date of acceptance of the resource.'),
(44, NULL, 1, 'dateCopyrighted', 'Date Copyrighted', 'Date of copyright.'),
(45, NULL, 1, 'dateSubmitted', 'Date Submitted', 'Date of submission of the resource.'),
(46, NULL, 1, 'educationLevel', 'Audience Education Level', 'A class of entity, defined in terms of progression through an educational or training context, for which the described resource is intended.'),
(47, NULL, 1, 'accessRights', 'Access Rights', 'Information about who can access the resource or an indication of its security status.'),
(48, NULL, 1, 'bibliographicCitation', 'Bibliographic Citation', 'A bibliographic reference for the resource.'),
(49, NULL, 1, 'license', 'License', 'A legal document giving official permission to do something with the resource.'),
(50, NULL, 1, 'rightsHolder', 'Rights Holder', 'A person or organization owning or managing rights over the resource.'),
(51, NULL, 1, 'provenance', 'Provenance', 'A statement of any changes in ownership and custody of the resource since its creation that are significant for its authenticity, integrity, and interpretation.'),
(52, NULL, 1, 'instructionalMethod', 'Instructional Method', 'A process, used to engender knowledge, attitudes and skills, that the described resource is designed to support.'),
(53, NULL, 1, 'accrualMethod', 'Accrual Method', 'The method by which items are added to a collection.'),
(54, NULL, 1, 'accrualPeriodicity', 'Accrual Periodicity', 'The frequency with which items are added to a collection.'),
(55, NULL, 1, 'accrualPolicy', 'Accrual Policy', 'The policy governing the addition of items to a collection.'),
(56, NULL, 3, 'affirmedBy', 'affirmedBy', 'A legal decision that affirms a ruling.'),
(57, NULL, 3, 'annotates', 'annotates', 'Critical or explanatory note for a Document.'),
(58, NULL, 3, 'authorList', 'list of authors', 'An ordered list of authors. Normally, this list is seen as a priority list that order authors by importance.'),
(59, NULL, 3, 'citedBy', 'cited by', 'Relates a document to another document that cites the\nfirst document.'),
(60, NULL, 3, 'cites', 'cites', 'Relates a document to another document that is cited\nby the first document as reference, comment, review, quotation or for\nanother purpose.'),
(61, NULL, 3, 'contributorList', 'list of contributors', 'An ordered list of contributors. Normally, this list is seen as a priority list that order contributors by importance.'),
(62, NULL, 3, 'court', 'court', 'A court associated with a legal document; for example, that which issues a decision.'),
(63, NULL, 3, 'degree', 'degree', 'The thesis degree.'),
(64, NULL, 3, 'director', 'director', 'A Film director.'),
(65, NULL, 3, 'distributor', 'distributor', 'Distributor of a document or a collection of documents.'),
(66, NULL, 3, 'editor', 'editor', 'A person having managerial and sometimes policy-making responsibility for the editorial part of a publishing firm or of a newspaper, magazine, or other publication.'),
(67, NULL, 3, 'editorList', 'list of editors', 'An ordered list of editors. Normally, this list is seen as a priority list that order editors by importance.'),
(68, NULL, 3, 'interviewee', 'interviewee', 'An agent that is interviewed by another agent.'),
(69, NULL, 3, 'interviewer', 'interviewer', 'An agent that interview another agent.'),
(70, NULL, 3, 'issuer', 'issuer', 'An entity responsible for issuing often informally published documents such as press releases, reports, etc.'),
(71, NULL, 3, 'organizer', 'organizer', 'The organizer of an event; includes conference organizers, but also government agencies or other bodies that are responsible for conducting hearings.'),
(72, NULL, 3, 'owner', 'owner', 'Owner of a document or a collection of documents.'),
(73, NULL, 3, 'performer', 'performer', NULL),
(74, NULL, 3, 'presentedAt', 'presented at', 'Relates a document to an event; for example, a paper to a conference.'),
(75, NULL, 3, 'presents', 'presents', 'Relates an event to associated documents; for example, conference to a paper.'),
(76, NULL, 3, 'producer', 'producer', 'Producer of a document or a collection of documents.'),
(77, NULL, 3, 'recipient', 'recipient', 'An agent that receives a communication document.'),
(78, NULL, 3, 'reproducedIn', 'reproducedIn', 'The resource in which another resource is reproduced.'),
(79, NULL, 3, 'reversedBy', 'reversedBy', 'A legal decision that reverses a ruling.'),
(80, NULL, 3, 'reviewOf', 'review of', 'Relates a review document to a reviewed thing (resource, item, etc.).'),
(81, NULL, 3, 'status', 'status', 'The publication status of (typically academic) content.'),
(82, NULL, 3, 'subsequentLegalDecision', 'subsequentLegalDecision', 'A legal decision on appeal that takes action on a case (affirming it, reversing it, etc.).'),
(83, NULL, 3, 'transcriptOf', 'transcript of', 'Relates a document to some transcribed original.'),
(84, NULL, 3, 'translationOf', 'translation of', 'Relates a translated document to the original document.'),
(85, NULL, 3, 'translator', 'translator', 'A person who translates written document from one language to another.'),
(86, NULL, 3, 'abstract', 'abstract', 'A summary of the resource.'),
(87, NULL, 3, 'argued', 'date argued', 'The date on which a legal case is argued before a court. Date is of format xsd:date'),
(88, NULL, 3, 'asin', 'asin', NULL),
(89, NULL, 3, 'chapter', 'chapter', 'An chapter number'),
(90, NULL, 3, 'coden', 'coden', NULL),
(91, NULL, 3, 'content', 'content', 'This property is for a plain-text rendering of the content of a Document. While the plain-text content of an entire document could be described by this property.'),
(92, NULL, 3, 'doi', 'doi', NULL),
(93, NULL, 3, 'eanucc13', 'eanucc13', NULL),
(94, NULL, 3, 'edition', 'edition', 'The name defining a special edition of a document. Normally its a literal value composed of a version number and words.'),
(95, NULL, 3, 'eissn', 'eissn', NULL),
(96, NULL, 3, 'gtin14', 'gtin14', NULL),
(97, NULL, 3, 'handle', 'handle', NULL),
(98, NULL, 3, 'identifier', 'identifier', NULL),
(99, NULL, 3, 'isbn', 'isbn', NULL),
(100, NULL, 3, 'isbn10', 'isbn10', NULL),
(101, NULL, 3, 'isbn13', 'isbn13', NULL),
(102, NULL, 3, 'issn', 'issn', NULL),
(103, NULL, 3, 'issue', 'issue', 'An issue number'),
(104, NULL, 3, 'lccn', 'lccn', NULL),
(105, NULL, 3, 'locator', 'locator', 'A description (often numeric) that locates an item within a containing document or collection.'),
(106, NULL, 3, 'numPages', 'number of pages', 'The number of pages contained in a document'),
(107, NULL, 3, 'numVolumes', 'number of volumes', 'The number of volumes contained in a collection of documents (usually a series, periodical, etc.).'),
(108, NULL, 3, 'number', 'number', 'A generic item or document number. Not to be confused with issue number.'),
(109, NULL, 3, 'oclcnum', 'oclcnum', NULL),
(110, NULL, 3, 'pageEnd', 'page end', 'Ending page number within a continuous page range.'),
(111, NULL, 3, 'pageStart', 'page start', 'Starting page number within a continuous page range.'),
(112, NULL, 3, 'pages', 'pages', 'A string of non-contiguous page spans that locate a Document within a Collection. Example: 23-25, 34, 54-56. For continuous page ranges, use the pageStart and pageEnd properties.'),
(113, NULL, 3, 'pmid', 'pmid', NULL),
(114, NULL, 3, 'prefixName', 'prefix name', 'The prefix of a name'),
(115, NULL, 3, 'section', 'section', 'A section number'),
(116, NULL, 3, 'shortDescription', 'shortDescription', NULL),
(117, NULL, 3, 'shortTitle', 'short title', 'The abbreviation of a title.'),
(118, NULL, 3, 'sici', 'sici', NULL),
(119, NULL, 3, 'suffixName', 'suffix name', 'The suffix of a name'),
(120, NULL, 3, 'upc', 'upc', NULL),
(121, NULL, 3, 'uri', 'uri', 'Universal Resource Identifier of a document'),
(122, NULL, 3, 'volume', 'volume', 'A volume number'),
(123, NULL, 4, 'mbox', 'personal mailbox', 'A  personal mailbox, ie. an Internet mailbox associated with exactly one owner, the first owner of this mailbox. This is a \'static inverse functional property\', in that  there is (across time and change) at most one individual that ever has any particular value for foaf:mbox.'),
(124, NULL, 4, 'mbox_sha1sum', 'sha1sum of a personal mailbox URI name', 'The sha1sum of the URI of an Internet mailbox associated with exactly one owner, the  first owner of the mailbox.'),
(125, NULL, 4, 'gender', 'gender', 'The gender of this Agent (typically but not necessarily \'male\' or \'female\').'),
(126, NULL, 4, 'geekcode', 'geekcode', 'A textual geekcode for this person, see http://www.geekcode.com/geek.html'),
(127, NULL, 4, 'dnaChecksum', 'DNA checksum', 'A checksum for the DNA of some thing. Joke.'),
(128, NULL, 4, 'sha1', 'sha1sum (hex)', 'A sha1sum hash, in hex.'),
(129, NULL, 4, 'based_near', 'based near', 'A location that something is based near, for some broadly human notion of near.'),
(130, NULL, 4, 'title', 'title', 'Title (Mr, Mrs, Ms, Dr. etc)'),
(131, NULL, 4, 'nick', 'nickname', 'A short informal nickname characterising an agent (includes login identifiers, IRC and other chat nicknames).'),
(132, NULL, 4, 'jabberID', 'jabber ID', 'A jabber ID for something.'),
(133, NULL, 4, 'aimChatID', 'AIM chat ID', 'An AIM chat ID'),
(134, NULL, 4, 'skypeID', 'Skype ID', 'A Skype ID'),
(135, NULL, 4, 'icqChatID', 'ICQ chat ID', 'An ICQ chat ID'),
(136, NULL, 4, 'yahooChatID', 'Yahoo chat ID', 'A Yahoo chat ID'),
(137, NULL, 4, 'msnChatID', 'MSN chat ID', 'An MSN chat ID'),
(138, NULL, 4, 'name', 'name', 'A name for some thing.'),
(139, NULL, 4, 'firstName', 'firstName', 'The first name of a person.'),
(140, NULL, 4, 'lastName', 'lastName', 'The last name of a person.'),
(141, NULL, 4, 'givenName', 'Given name', 'The given name of some person.'),
(142, NULL, 4, 'givenname', 'Given name', 'The given name of some person.'),
(143, NULL, 4, 'surname', 'Surname', 'The surname of some person.'),
(144, NULL, 4, 'family_name', 'family_name', 'The family name of some person.'),
(145, NULL, 4, 'familyName', 'familyName', 'The family name of some person.'),
(146, NULL, 4, 'phone', 'phone', 'A phone,  specified using fully qualified tel: URI scheme (refs: http://www.w3.org/Addressing/schemes.html#tel).'),
(147, NULL, 4, 'homepage', 'homepage', 'A homepage for some thing.'),
(148, NULL, 4, 'weblog', 'weblog', 'A weblog of some thing (whether person, group, company etc.).'),
(149, NULL, 4, 'openid', 'openid', 'An OpenID for an Agent.'),
(150, NULL, 4, 'tipjar', 'tipjar', 'A tipjar document for this agent, describing means for payment and reward.'),
(151, NULL, 4, 'plan', 'plan', 'A .plan comment, in the tradition of finger and \'.plan\' files.'),
(152, NULL, 4, 'made', 'made', 'Something that was made by this agent.'),
(153, NULL, 4, 'maker', 'maker', 'An agent that  made this thing.'),
(154, NULL, 4, 'img', 'image', 'An image that can be used to represent some thing (ie. those depictions which are particularly representative of something, eg. one\'s photo on a homepage).'),
(155, NULL, 4, 'depiction', 'depiction', 'A depiction of some thing.'),
(156, NULL, 4, 'depicts', 'depicts', 'A thing depicted in this representation.'),
(157, NULL, 4, 'thumbnail', 'thumbnail', 'A derived thumbnail image.'),
(158, NULL, 4, 'myersBriggs', 'myersBriggs', 'A Myers Briggs (MBTI) personality classification.'),
(159, NULL, 4, 'workplaceHomepage', 'workplace homepage', 'A workplace homepage of some person; the homepage of an organization they work for.'),
(160, NULL, 4, 'workInfoHomepage', 'work info homepage', 'A work info homepage of some person; a page about their work for some organization.'),
(161, NULL, 4, 'schoolHomepage', 'schoolHomepage', 'A homepage of a school attended by the person.'),
(162, NULL, 4, 'knows', 'knows', 'A person known by this person (indicating some level of reciprocated interaction between the parties).'),
(163, NULL, 4, 'interest', 'interest', 'A page about a topic of interest to this person.'),
(164, NULL, 4, 'topic_interest', 'topic_interest', 'A thing of interest to this person.'),
(165, NULL, 4, 'publications', 'publications', 'A link to the publications of this person.'),
(166, NULL, 4, 'currentProject', 'current project', 'A current project this person works on.'),
(167, NULL, 4, 'pastProject', 'past project', 'A project this person has previously worked on.'),
(168, NULL, 4, 'fundedBy', 'funded by', 'An organization funding a project or person.'),
(169, NULL, 4, 'logo', 'logo', 'A logo representing some thing.'),
(170, NULL, 4, 'topic', 'topic', 'A topic of some page or document.'),
(171, NULL, 4, 'primaryTopic', 'primary topic', 'The primary topic of some page or document.'),
(172, NULL, 4, 'focus', 'focus', 'The underlying or \'focal\' entity associated with some SKOS-described concept.'),
(173, NULL, 4, 'isPrimaryTopicOf', 'is primary topic of', 'A document that this thing is the primary topic of.'),
(174, NULL, 4, 'page', 'page', 'A page or document about this thing.'),
(175, NULL, 4, 'theme', 'theme', 'A theme.'),
(176, NULL, 4, 'account', 'account', 'Indicates an account held by this agent.'),
(177, NULL, 4, 'holdsAccount', 'account', 'Indicates an account held by this agent.'),
(178, NULL, 4, 'accountServiceHomepage', 'account service homepage', 'Indicates a homepage of the service provide for this online account.'),
(179, NULL, 4, 'accountName', 'account name', 'Indicates the name (identifier) associated with this online account.'),
(180, NULL, 4, 'member', 'member', 'Indicates a member of a Group'),
(181, NULL, 4, 'membershipClass', 'membershipClass', 'Indicates the class of individuals that are a member of a Group'),
(182, NULL, 4, 'birthday', 'birthday', 'The birthday of this Agent, represented in mm-dd string form, eg. \'12-31\'.'),
(183, NULL, 4, 'age', 'age', 'The age in years of some agent.'),
(184, NULL, 4, 'status', 'status', 'A string expressing what the user is happy for the general public (normally) to know about their current activity.'),
(185, 1, 5, 'x', 'x', NULL),
(186, 1, 5, 'y', 'y', NULL),
(187, 1, 5, 'xRatingValue', 'xRatingValue', NULL),
(188, 1, 5, 'yRatingValue', 'yRatingValue', NULL),
(189, 1, 5, 'degradName', 'degradName', NULL),
(190, 1, 5, 'degradColors', 'degradColors', NULL),
(191, 1, 5, 'creationDate', 'creationDate', NULL),
(192, 1, 5, 'hasExistence', 'a comme existence', NULL),
(193, 1, 5, 'hasActant', 'a comme actant', NULL),
(194, 1, 5, 'hasPhysique', 'a comme physique', NULL),
(195, 1, 5, 'hasConcept', 'a comme concept', NULL),
(196, 1, 5, 'hasRapport', 'a comme rapport', NULL),
(197, 1, 5, 'hasCrible', 'a comme crible', NULL),
(198, 1, 5, 'cribleLabel', 'cribleLabel', NULL),
(199, 1, 5, 'cribleId', 'cribleId', NULL),
(200, 1, 5, 'cribleRatingValue', 'cribleRatingValue', NULL),
(201, 1, 5, 'distanceCenter', 'distance du centre', NULL),
(202, 1, 5, 'distanceConcept', 'distance du concept', NULL),
(203, 1, 5, 'ordreCrible', 'Ordre dans le crible', NULL),
(204, 1, 5, 'hasCribleCarto', 'a comme cartographie', NULL),
(205, 1, 5, 'hasSujet', 'a comme sujet', NULL),
(206, 1, 5, 'hasObjet', 'a comme objet', NULL),
(207, 1, 5, 'hasPredicat', 'a comme prédicat', NULL),
(208, 1, 5, 'hasMenu', 'a comme menu', NULL),
(209, 1, 5, 'hasArchetype', 'a comme archetype', NULL),
(210, 1, 6, 'firstName', 'First Name', NULL),
(211, 1, 6, 'lastName', 'Last Name', NULL),
(212, 1, 6, 'email', 'Email', NULL),
(213, 1, 6, 'password', 'Password', NULL),
(214, 1, 6, 'name', 'Name', NULL),
(215, 1, 6, 'link', 'Link', NULL),
(216, 1, 6, 'logo', 'Logo', NULL),
(217, 1, 6, 'image', 'Image', NULL),
(218, 1, 6, 'steps', 'Steps', NULL),
(219, 1, 6, 'cookingTime', 'Cooking Time', NULL),
(220, 1, 6, 'preparationTime', 'Preparation Time', NULL),
(221, 1, 6, 'calories', 'Calories', NULL),
(222, 1, 6, 'difficulty', 'Difficulty', NULL),
(223, 1, 6, 'createdBy', 'createdBy', NULL),
(224, 1, 6, 'hasIngredient', 'Has Ingredient', NULL),
(225, 1, 6, 'nutritionalInfo', 'Nutritional Info', NULL),
(226, 1, 6, 'isHealthy', 'Is Healthy', NULL),
(227, 1, 6, 'ratedBy', 'Rated By', NULL),
(228, 1, 6, 'ratesRecipe', 'Rates Recipe', NULL),
(229, 1, 6, 'ratingValue', 'Rating Value', NULL),
(230, 1, 6, 'recipe', 'Recipe', NULL),
(231, 1, 6, 'ingredient', 'Ingredient', NULL),
(232, 1, 6, 'quantity', 'Quantity', NULL),
(233, 1, 6, 'note', 'Note', NULL),
(234, NULL, 6, 'description', 'Description', NULL),
(235, NULL, 6, 'title', 'Title', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `resource`
--

CREATE TABLE `resource` (
  `id` int NOT NULL,
  `owner_id` int DEFAULT NULL,
  `resource_class_id` int DEFAULT NULL,
  `resource_template_id` int DEFAULT NULL,
  `thumbnail_id` int DEFAULT NULL,
  `title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_public` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `resource_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `resource`
--

INSERT INTO `resource` (`id`, `owner_id`, `resource_class_id`, `resource_template_id`, `thumbnail_id`, `title`, `is_public`, `created`, `modified`, `resource_type`) VALUES
(80, 1, 117, 2, NULL, 'Alice Smith', 1, '2025-10-18 08:31:38', '2025-10-18 08:31:38', 'Omeka\\Entity\\Item'),
(81, 1, 117, 2, NULL, 'Bob Johnson', 1, '2025-10-18 08:31:38', '2025-10-18 08:31:38', 'Omeka\\Entity\\Item'),
(82, 1, 117, 2, NULL, 'Charlie Brown', 1, '2025-10-18 08:31:38', '2025-10-18 08:31:38', 'Omeka\\Entity\\Item'),
(83, 1, 117, 2, NULL, 'Diana Evans', 1, '2025-10-18 08:31:38', '2025-10-18 08:31:38', 'Omeka\\Entity\\Item'),
(84, 1, 117, 2, NULL, 'Ethan Lee', 1, '2025-10-18 08:31:38', '2025-10-18 08:31:38', 'Omeka\\Entity\\Item'),
(85, 1, 121, 7, NULL, 'Tomato', 1, '2025-10-18 08:32:08', '2025-10-18 08:32:08', 'Omeka\\Entity\\Item'),
(86, 1, 121, 7, NULL, 'Olive Oil', 1, '2025-10-18 08:32:08', '2025-10-18 08:32:08', 'Omeka\\Entity\\Item'),
(87, 1, 121, 7, NULL, 'Sugar', 1, '2025-10-18 08:32:08', '2025-10-18 08:32:08', 'Omeka\\Entity\\Item'),
(88, 1, 121, 7, NULL, 'Chicken Breast', 1, '2025-10-18 08:32:08', '2025-10-18 08:32:08', 'Omeka\\Entity\\Item'),
(89, 1, 121, 7, NULL, 'Butter', 1, '2025-10-18 08:32:08', '2025-10-18 08:32:08', 'Omeka\\Entity\\Item'),
(90, 1, 118, 3, NULL, 'Facebook', 1, '2025-10-18 08:32:55', '2025-10-18 08:32:55', 'Omeka\\Entity\\Item'),
(91, 1, 118, 3, NULL, 'Twitter', 1, '2025-10-18 08:32:55', '2025-10-18 08:32:55', 'Omeka\\Entity\\Item'),
(92, 1, 118, 3, NULL, 'Instagram', 1, '2025-10-18 08:32:55', '2025-10-18 08:32:55', 'Omeka\\Entity\\Item'),
(93, 1, 118, 3, NULL, 'LinkedIn', 1, '2025-10-18 08:32:55', '2025-10-18 08:32:55', 'Omeka\\Entity\\Item'),
(94, 1, 118, 3, NULL, 'YouTube', 1, '2025-10-18 08:32:55', '2025-10-18 08:32:55', 'Omeka\\Entity\\Item'),
(115, 1, 120, 6, NULL, 'How to Make Tomato Sauce', 1, '2025-10-18 08:50:32', '2025-10-18 08:50:32', 'Omeka\\Entity\\Item'),
(116, 1, 120, 6, NULL, 'Benefits of Olive Oil', 1, '2025-10-18 08:50:32', '2025-10-18 08:50:32', 'Omeka\\Entity\\Item'),
(117, 1, 120, 6, NULL, 'Chicken Breast Recipes', 1, '2025-10-18 08:50:32', '2025-10-18 08:50:32', 'Omeka\\Entity\\Item'),
(118, 1, 120, 6, NULL, 'Sugar Alternatives', 1, '2025-10-18 08:50:32', '2025-10-18 08:50:32', 'Omeka\\Entity\\Item'),
(119, 1, 120, 6, NULL, 'Butter vs. Margarine', 1, '2025-10-18 08:50:32', '2025-10-18 08:50:32', 'Omeka\\Entity\\Item'),
(140, 1, 116, 4, NULL, 'Classic Tomato Sauce', 1, '2025-10-19 09:55:42', '2025-10-19 09:55:42', 'Omeka\\Entity\\Item'),
(141, 1, 116, 4, NULL, 'Grilled Chicken Breast', 1, '2025-10-19 09:55:42', '2025-10-19 09:55:42', 'Omeka\\Entity\\Item'),
(142, 1, 116, 4, NULL, 'Vegetable Stir Fry', 1, '2025-10-19 09:55:42', '2025-10-19 09:55:42', 'Omeka\\Entity\\Item'),
(143, 1, 116, 4, NULL, 'Chocolate Cake', 1, '2025-10-19 09:55:42', '2025-10-19 09:55:42', 'Omeka\\Entity\\Item'),
(144, 1, 116, 4, NULL, 'Caesar Salad', 1, '2025-10-19 09:55:42', '2025-10-19 09:55:42', 'Omeka\\Entity\\Item'),
(145, 1, 119, 5, NULL, '5', 1, '2025-10-19 09:59:23', '2025-10-19 09:59:23', 'Omeka\\Entity\\Item'),
(146, 1, 119, 5, NULL, '4', 1, '2025-10-19 09:59:23', '2025-10-19 09:59:23', 'Omeka\\Entity\\Item'),
(147, 1, 119, 5, NULL, '3', 1, '2025-10-19 09:59:23', '2025-10-19 09:59:23', 'Omeka\\Entity\\Item'),
(148, 1, 119, 5, NULL, '2', 1, '2025-10-19 09:59:23', '2025-10-19 09:59:23', 'Omeka\\Entity\\Item'),
(149, 1, 119, 5, NULL, '1', 1, '2025-10-19 09:59:23', '2025-10-19 09:59:23', 'Omeka\\Entity\\Item');

-- --------------------------------------------------------

--
-- Table structure for table `resource_class`
--

CREATE TABLE `resource_class` (
  `id` int NOT NULL,
  `owner_id` int DEFAULT NULL,
  `vocabulary_id` int NOT NULL,
  `local_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `resource_class`
--

INSERT INTO `resource_class` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(1, NULL, 1, 'Agent', 'Agent', 'A resource that acts or has the power to act.'),
(2, NULL, 1, 'AgentClass', 'Agent Class', 'A group of agents.'),
(3, NULL, 1, 'BibliographicResource', 'Bibliographic Resource', 'A book, article, or other documentary resource.'),
(4, NULL, 1, 'FileFormat', 'File Format', 'A digital resource format.'),
(5, NULL, 1, 'Frequency', 'Frequency', 'A rate at which something recurs.'),
(6, NULL, 1, 'Jurisdiction', 'Jurisdiction', 'The extent or range of judicial, law enforcement, or other authority.'),
(7, NULL, 1, 'LicenseDocument', 'License Document', 'A legal document giving official permission to do something with a Resource.'),
(8, NULL, 1, 'LinguisticSystem', 'Linguistic System', 'A system of signs, symbols, sounds, gestures, or rules used in communication.'),
(9, NULL, 1, 'Location', 'Location', 'A spatial region or named place.'),
(10, NULL, 1, 'LocationPeriodOrJurisdiction', 'Location, Period, or Jurisdiction', 'A location, period of time, or jurisdiction.'),
(11, NULL, 1, 'MediaType', 'Media Type', 'A file format or physical medium.'),
(12, NULL, 1, 'MediaTypeOrExtent', 'Media Type or Extent', 'A media type or extent.'),
(13, NULL, 1, 'MethodOfInstruction', 'Method of Instruction', 'A process that is used to engender knowledge, attitudes, and skills.'),
(14, NULL, 1, 'MethodOfAccrual', 'Method of Accrual', 'A method by which resources are added to a collection.'),
(15, NULL, 1, 'PeriodOfTime', 'Period of Time', 'An interval of time that is named or defined by its start and end dates.'),
(16, NULL, 1, 'PhysicalMedium', 'Physical Medium', 'A physical material or carrier.'),
(17, NULL, 1, 'PhysicalResource', 'Physical Resource', 'A material thing.'),
(18, NULL, 1, 'Policy', 'Policy', 'A plan or course of action by an authority, intended to influence and determine decisions, actions, and other matters.'),
(19, NULL, 1, 'ProvenanceStatement', 'Provenance Statement', 'A statement of any changes in ownership and custody of a resource since its creation that are significant for its authenticity, integrity, and interpretation.'),
(20, NULL, 1, 'RightsStatement', 'Rights Statement', 'A statement about the intellectual property rights (IPR) held in or over a Resource, a legal document giving official permission to do something with a resource, or a statement about access rights.'),
(21, NULL, 1, 'SizeOrDuration', 'Size or Duration', 'A dimension or extent, or a time taken to play or execute.'),
(22, NULL, 1, 'Standard', 'Standard', 'A basis for comparison; a reference point against which other things can be evaluated.'),
(23, NULL, 2, 'Collection', 'Collection', 'An aggregation of resources.'),
(24, NULL, 2, 'Dataset', 'Dataset', 'Data encoded in a defined structure.'),
(25, NULL, 2, 'Event', 'Event', 'A non-persistent, time-based occurrence.'),
(26, NULL, 2, 'Image', 'Image', 'A visual representation other than text.'),
(27, NULL, 2, 'InteractiveResource', 'Interactive Resource', 'A resource requiring interaction from the user to be understood, executed, or experienced.'),
(28, NULL, 2, 'Service', 'Service', 'A system that provides one or more functions.'),
(29, NULL, 2, 'Software', 'Software', 'A computer program in source or compiled form.'),
(30, NULL, 2, 'Sound', 'Sound', 'A resource primarily intended to be heard.'),
(31, NULL, 2, 'Text', 'Text', 'A resource consisting primarily of words for reading.'),
(32, NULL, 2, 'PhysicalObject', 'Physical Object', 'An inanimate, three-dimensional object or substance.'),
(33, NULL, 2, 'StillImage', 'Still Image', 'A static visual representation.'),
(34, NULL, 2, 'MovingImage', 'Moving Image', 'A series of visual representations imparting an impression of motion when shown in succession.'),
(35, NULL, 3, 'AcademicArticle', 'Academic Article', 'A scholarly academic article, typically published in a journal.'),
(36, NULL, 3, 'Article', 'Article', 'A written composition in prose, usually nonfiction, on a specific topic, forming an independent part of a book or other publication, as a newspaper or magazine.'),
(37, NULL, 3, 'AudioDocument', 'audio document', 'An audio document; aka record.'),
(38, NULL, 3, 'AudioVisualDocument', 'audio-visual document', 'An audio-visual document; film, video, and so forth.'),
(39, NULL, 3, 'Bill', 'Bill', 'Draft legislation presented for discussion to a legal body.'),
(40, NULL, 3, 'Book', 'Book', 'A written or printed work of fiction or nonfiction, usually on sheets of paper fastened or bound together within covers.'),
(41, NULL, 3, 'BookSection', 'Book Section', 'A section of a book.'),
(42, NULL, 3, 'Brief', 'Brief', 'A written argument submitted to a court.'),
(43, NULL, 3, 'Chapter', 'Chapter', 'A chapter of a book.'),
(44, NULL, 3, 'Code', 'Code', 'A collection of statutes.'),
(45, NULL, 3, 'CollectedDocument', 'Collected Document', 'A document that simultaneously contains other documents.'),
(46, NULL, 3, 'Collection', 'Collection', 'A collection of Documents or Collections'),
(47, NULL, 3, 'Conference', 'Conference', 'A meeting for consultation or discussion.'),
(48, NULL, 3, 'CourtReporter', 'Court Reporter', 'A collection of legal cases.'),
(49, NULL, 3, 'Document', 'Document', 'A document (noun) is a bounded physical representation of body of information designed with the capacity (and usually intent) to communicate. A document may manifest symbolic, diagrammatic or sensory-representational information.'),
(50, NULL, 3, 'DocumentPart', 'document part', 'a distinct part of a larger document or collected document.'),
(51, NULL, 3, 'DocumentStatus', 'Document Status', 'The status of the publication of a document.'),
(52, NULL, 3, 'EditedBook', 'Edited Book', 'An edited book.'),
(53, NULL, 3, 'Email', 'EMail', 'A written communication addressed to a person or organization and transmitted electronically.'),
(54, NULL, 3, 'Event', 'Event', NULL),
(55, NULL, 3, 'Excerpt', 'Excerpt', 'A passage selected from a larger work.'),
(56, NULL, 3, 'Film', 'Film', 'aka movie.'),
(57, NULL, 3, 'Hearing', 'Hearing', 'An instance or a session in which testimony and arguments are presented, esp. before an official, as a judge in a lawsuit.'),
(58, NULL, 3, 'Image', 'Image', 'A document that presents visual or diagrammatic information.'),
(59, NULL, 3, 'Interview', 'Interview', 'A formalized discussion between two or more people.'),
(60, NULL, 3, 'Issue', 'Issue', 'something that is printed or published and distributed, esp. a given number of a periodical'),
(61, NULL, 3, 'Journal', 'Journal', 'A periodical of scholarly journal Articles.'),
(62, NULL, 3, 'LegalCaseDocument', 'Legal Case Document', 'A document accompanying a legal case.'),
(63, NULL, 3, 'LegalDecision', 'Decision', 'A document containing an authoritative determination (as a decree or judgment) made after consideration of facts or law.'),
(64, NULL, 3, 'LegalDocument', 'Legal Document', 'A legal document; for example, a court decision, a brief, and so forth.'),
(65, NULL, 3, 'Legislation', 'Legislation', 'A legal document proposing or enacting a law or a group of laws.'),
(66, NULL, 3, 'Letter', 'Letter', 'A written or printed communication addressed to a person or organization and usually transmitted by mail.'),
(67, NULL, 3, 'Magazine', 'Magazine', 'A periodical of magazine Articles. A magazine is a publication that is issued periodically, usually bound in a paper cover, and typically contains essays, stories, poems, etc., by many writers, and often photographs and drawings, frequently specializing in a particular subject or area, as hobbies, news, or sports.'),
(68, NULL, 3, 'Manual', 'Manual', 'A small reference book, especially one giving instructions.'),
(69, NULL, 3, 'Manuscript', 'Manuscript', 'An unpublished Document, which may also be submitted to a publisher for publication.'),
(70, NULL, 3, 'Map', 'Map', 'A graphical depiction of geographic features.'),
(71, NULL, 3, 'MultiVolumeBook', 'Multivolume Book', 'A loose, thematic, collection of Documents, often Books.'),
(72, NULL, 3, 'Newspaper', 'Newspaper', 'A periodical of documents, usually issued daily or weekly, containing current news, editorials, feature articles, and usually advertising.'),
(73, NULL, 3, 'Note', 'Note', 'Notes or annotations about a resource.'),
(74, NULL, 3, 'Patent', 'Patent', 'A document describing the exclusive right granted by a government to an inventor to manufacture, use, or sell an invention for a certain number of years.'),
(75, NULL, 3, 'Performance', 'Performance', 'A public performance.'),
(76, NULL, 3, 'Periodical', 'Periodical', 'A group of related documents issued at regular intervals.'),
(77, NULL, 3, 'PersonalCommunication', 'Personal Communication', 'A communication between an agent and one or more specific recipients.'),
(78, NULL, 3, 'PersonalCommunicationDocument', 'Personal Communication Document', 'A personal communication manifested in some document.'),
(79, NULL, 3, 'Proceedings', 'Proceedings', 'A compilation of documents published from an event, such as a conference.'),
(80, NULL, 3, 'Quote', 'Quote', 'An excerpted collection of words.'),
(81, NULL, 3, 'ReferenceSource', 'Reference Source', 'A document that presents authoritative reference information, such as a dictionary or encylopedia .'),
(82, NULL, 3, 'Report', 'Report', 'A document describing an account or statement describing in detail an event, situation, or the like, usually as the result of observation, inquiry, etc..'),
(83, NULL, 3, 'Series', 'Series', 'A loose, thematic, collection of Documents, often Books.'),
(84, NULL, 3, 'Slide', 'Slide', 'A slide in a slideshow'),
(85, NULL, 3, 'Slideshow', 'Slideshow', 'A presentation of a series of slides, usually presented in front of an audience with written text and images.'),
(86, NULL, 3, 'Standard', 'Standard', 'A document describing a standard'),
(87, NULL, 3, 'Statute', 'Statute', 'A bill enacted into law.'),
(88, NULL, 3, 'Thesis', 'Thesis', 'A document created to summarize research findings associated with the completion of an academic degree.'),
(89, NULL, 3, 'ThesisDegree', 'Thesis degree', 'The academic degree of a Thesis'),
(90, NULL, 3, 'Webpage', 'Webpage', 'A web page is an online document available (at least initially) on the world wide web. A web page is written first and foremost to appear on the web, as distinct from other online resources such as books, manuscripts or audio documents which use the web primarily as a distribution mechanism alongside other more traditional methods such as print.'),
(91, NULL, 3, 'Website', 'Website', 'A group of Webpages accessible on the Web.'),
(92, NULL, 3, 'Workshop', 'Workshop', 'A seminar, discussion group, or the like, that emphasizes zxchange of ideas and the demonstration and application of techniques, skills, etc.'),
(93, NULL, 4, 'LabelProperty', 'Label Property', 'A foaf:LabelProperty is any RDF property with texual values that serve as labels.'),
(94, NULL, 4, 'Person', 'Person', 'A person.'),
(95, NULL, 4, 'Document', 'Document', 'A document.'),
(96, NULL, 4, 'Organization', 'Organization', 'An organization.'),
(97, NULL, 4, 'Group', 'Group', 'A class of Agents.'),
(98, NULL, 4, 'Agent', 'Agent', 'An agent (eg. person, group, software or physical artifact).'),
(99, NULL, 4, 'Project', 'Project', 'A project (a collective endeavour of some kind).'),
(100, NULL, 4, 'Image', 'Image', 'An image.'),
(101, NULL, 4, 'PersonalProfileDocument', 'PersonalProfileDocument', 'A personal profile RDF document.'),
(102, NULL, 4, 'OnlineAccount', 'Online Account', 'An online account.'),
(103, NULL, 4, 'OnlineGamingAccount', 'Online Gaming Account', 'An online gaming account.'),
(104, NULL, 4, 'OnlineEcommerceAccount', 'Online E-commerce Account', 'An online e-commerce account.'),
(105, NULL, 4, 'OnlineChatAccount', 'Online Chat Account', 'An online chat account.'),
(106, 1, 5, 'SemanticPosition', 'SemanticPosition', NULL),
(107, 1, 5, 'Crible', 'Crible', NULL),
(108, 1, 5, 'CriblePosition', 'CriblePosition', NULL),
(109, 1, 5, 'CribleCarto', 'Cartographie d\'un crible', NULL),
(110, 1, 5, 'Actant', 'Actant', NULL),
(111, 1, 5, 'Existence', 'Existence', NULL),
(112, 1, 5, 'Physique', 'Physique', NULL),
(113, 1, 5, 'Rapport', 'Rapport', NULL),
(114, 1, 5, 'Archetype', 'Archetype', NULL),
(115, 1, 5, 'Concept', 'Concept', NULL),
(116, 1, 6, 'Recipe', 'Recipe', NULL),
(117, 1, 6, 'User', 'User', NULL),
(118, 1, 6, 'SocialMediaLink', 'SocialMediaLink', NULL),
(119, 1, 6, 'Rating', 'Rating', NULL),
(120, 1, 6, 'Post', 'Post', NULL),
(121, 1, 6, 'Ingredient', 'Ingredient', NULL),
(122, 1, 6, 'RecipeIngredient', 'RecipeIngredient', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `resource_template`
--

CREATE TABLE `resource_template` (
  `id` int NOT NULL,
  `owner_id` int DEFAULT NULL,
  `resource_class_id` int DEFAULT NULL,
  `title_property_id` int DEFAULT NULL,
  `description_property_id` int DEFAULT NULL,
  `label` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `resource_template`
--

INSERT INTO `resource_template` (`id`, `owner_id`, `resource_class_id`, `title_property_id`, `description_property_id`, `label`) VALUES
(2, 1, 117, 1, NULL, 'User'),
(3, 1, 118, 214, 214, 'SocialMediaLink'),
(4, 1, 116, 214, NULL, 'Recipe'),
(5, 1, 119, 229, NULL, 'Rating'),
(6, 1, 120, 235, NULL, 'Post'),
(7, 1, 121, 214, NULL, 'Ingredient'),
(8, 1, 122, NULL, NULL, 'Recipe Ingredient');

-- --------------------------------------------------------

--
-- Table structure for table `resource_template_property`
--

CREATE TABLE `resource_template_property` (
  `id` int NOT NULL,
  `resource_template_id` int NOT NULL,
  `property_id` int NOT NULL,
  `alternate_label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternate_comment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `position` int DEFAULT NULL,
  `data_type` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:json_array)',
  `is_required` tinyint(1) NOT NULL,
  `is_private` tinyint(1) NOT NULL,
  `default_lang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `resource_template_property`
--

INSERT INTO `resource_template_property` (`id`, `resource_template_id`, `property_id`, `alternate_label`, `alternate_comment`, `position`, `data_type`, `is_required`, `is_private`, `default_lang`) VALUES
(21, 2, 210, NULL, NULL, 2, NULL, 0, 0, NULL),
(22, 2, 211, NULL, NULL, 3, NULL, 0, 0, NULL),
(23, 2, 212, NULL, NULL, 4, NULL, 0, 0, NULL),
(24, 2, 213, NULL, NULL, 5, NULL, 0, 0, NULL),
(25, 3, 214, NULL, NULL, 1, NULL, 0, 0, NULL),
(26, 3, 216, NULL, NULL, 2, NULL, 0, 0, NULL),
(27, 3, 215, NULL, NULL, 3, '[\"resource:item\"]', 0, 0, NULL),
(28, 4, 214, NULL, NULL, 1, NULL, 0, 0, NULL),
(29, 4, 234, NULL, NULL, 2, NULL, 0, 0, NULL),
(30, 4, 217, NULL, NULL, 3, NULL, 0, 0, NULL),
(31, 4, 218, NULL, NULL, 7, NULL, 0, 0, NULL),
(32, 4, 223, NULL, NULL, 10, '[\"resource:item\"]', 0, 0, NULL),
(33, 4, 220, NULL, NULL, 5, NULL, 0, 0, NULL),
(34, 4, 219, NULL, NULL, 6, NULL, 0, 0, NULL),
(35, 4, 221, NULL, NULL, 8, NULL, 0, 0, NULL),
(36, 4, 222, NULL, NULL, 9, NULL, 0, 0, NULL),
(37, 5, 229, NULL, NULL, 1, NULL, 0, 0, NULL),
(38, 5, 227, NULL, NULL, 2, '[\"resource:item\"]', 0, 0, NULL),
(39, 5, 228, NULL, NULL, 3, '[\"resource:item\"]', 0, 0, NULL),
(40, 6, 235, NULL, NULL, 1, NULL, 0, 0, NULL),
(41, 6, 234, NULL, NULL, 2, NULL, 0, 0, NULL),
(42, 6, 223, NULL, NULL, 3, '[\"resource:item\"]', 0, 0, NULL),
(43, 7, 214, NULL, NULL, 1, NULL, 0, 0, NULL),
(44, 7, 225, NULL, NULL, 2, NULL, 0, 0, NULL),
(45, 7, 226, NULL, NULL, 3, NULL, 0, 0, NULL),
(46, 8, 230, NULL, NULL, 1, '[\"resource:item\"]', 0, 0, NULL),
(47, 8, 232, NULL, NULL, 2, NULL, 0, 0, NULL),
(48, 8, 233, NULL, NULL, 3, NULL, 0, 0, NULL),
(49, 8, 231, NULL, NULL, 4, '[\"resource:item\"]', 0, 0, NULL),
(50, 4, 224, NULL, NULL, 4, NULL, 0, 0, NULL),
(51, 2, 1, NULL, NULL, 1, NULL, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE `session` (
  `id` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longblob NOT NULL,
  `modified` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `session`
--

INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('2bmju2rgck004ppe4jvhf7be80', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736303633313930352e3230363837383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226a6d6a3462637138637130766533713632383069736f396e6f66223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736303637343538343b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313736303637353038303b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736303637353037383b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226239353237306230303266323463653634393132643433656633343332636136223b733a33323a226333383765333465396133646131373561356466383866303736343038666235223b7d733a343a2268617368223b733a36353a2263333837653334653961336461313735613564663838663037363430386662352d6239353237306230303266323463653634393132643433656633343332636136223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a383a226d65737361676573223b613a313a7b693a313b613a313a7b693a303b733a32333a225375636365737366756c6c79206c6f67676564206f7574223b7d7d7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d72656469726563745f75726c7c4e3b4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a223265316439393330383065323833306666396166306262303233613630633734223b733a33323a223664383063376334306435623830626464333566663063363962643034313230223b733a33323a223238336139373764613962343638333738333063343764636336333765383363223b733a33323a226664343136646664656239356261396436303232343035636233313531363536223b7d733a343a2268617368223b733a36353a2266643431366466646562393562613964363032323430356362333135313635362d3238336139373764613962343638333738333063343764636336333765383363223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a226133646538623231613630386161623233666135323439386332616338386436223b733a33323a223666313161343563623263653235356332376433656237643332396663626135223b733a33323a223365333133633163396662623961666466633764666238643965646461383862223b733a33323a223832396337336436383737313165643364393733616161323236343166396437223b7d733a343a2268617368223b733a36353a2238323963373364363837373131656433643937336161613232363431663964372d3365333133633163396662623961666466633764666238643965646461383862223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1760631905);
INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('3bjkaki57nkcsogl8k4t6v2go8', 0x5f5f4c616d696e61737c613a383a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736303737383031322e3137353730383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22336d6d70316a3964636632386a643634616e3061687370623572223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736303733343430333b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313736303832303539333b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736303832303935383b7d733a35393a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465696d706f7274666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736303734383537393b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736303832303433333b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279757064617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736303734393238373b7d7d72656469726563745f75726c7c733a33303a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223737353330383364646631323436373830363665303230616664656334363161223b733a33323a223930396261626235333635396465653935303537653565333361643938303131223b7d733a343a2268617368223b733a36353a2239303962616262353336353964656539353035376535653333616439383031312d3737353330383364646631323436373830363665303230616664656334363161223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a35313a7b733a33323a223161383837643332326630373038656164343465323439623334316535386530223b733a33323a223531636632303962663665646638336332313862653335353732363830323764223b733a33323a223733343736613130353131663063616665636163373237653263613033313338223b733a33323a223439303333663765383030656133363030383130396534633331616334366534223b733a33323a223862366436363039326634336539646265663539633334363533396662636162223b733a33323a226131323463373430316635653463653039313966643632373134633338376662223b733a33323a223265353232383335643339323931326533643237336635376638623337346532223b733a33323a223962363765393938656366306136336330656438623932636666323361343936223b733a33323a226132383039363934386561653065303463363164666265383165326331396334223b733a33323a223837393032343338353063623333313437396264323536643465636137393862223b733a33323a223331343162653332626536393139623565353934373864303238313232383839223b733a33323a223931616634386164386533363163623135616664336364376363326231323264223b733a33323a223462306434663961323261633535643431356463383636663464313638393137223b733a33323a226634333863383761633131316632383434386465383837386232396463366461223b733a33323a226262613330373236323761313465313766633465636336306239356532666435223b733a33323a226262616263313234356464613837323066613433636231353830333731313037223b733a33323a226333616236323239623561323637616361376232646139363131366235336337223b733a33323a226332306362643163353039643437363637306666333138386539656164303839223b733a33323a223039376362383031343732363335623734353032346532666562303262343937223b733a33323a223162653030303730366466393465333737363534386664303531396463313862223b733a33323a226662666165346136333266363137303438373637386363646230653631646564223b733a33323a223533663964356465356135393535333134303561643439333062666562643361223b733a33323a226263386564643165626539306539336138353034323237333463313663326333223b733a33323a226266656264343230383363366534366565633032616430366261653134643739223b733a33323a226161366532336134373739646330323433333235623831633664653464323830223b733a33323a226262613632356430383563376132653936666564356639643030663632663831223b733a33323a226232343465633238613834373936303439623166633031633638653066333735223b733a33323a226431386164386132383934343661356266313632376235303537343632343031223b733a33323a226337653432366333363035643530306665313565613862396433353330393461223b733a33323a226638316339333063663462323636323236336431323965653636353337613766223b733a33323a226434343530666630656139303763656337346237396662346437356633366133223b733a33323a223461613466356566626132653166376532383262643463653937663466316435223b733a33323a223430613737633732643539616164373166613562643037363366343235366639223b733a33323a223636306465333664343363383834363830336334636530386162643963323933223b733a33323a226361383235663834353736623831333564613565306537663062393932323936223b733a33323a223264336536623365613231623630656662623766313838373765323063303730223b733a33323a223739326530663232616535396461353230643763623963376565333063643232223b733a33323a226131316162386639373061356265356466613962343232626465643731363631223b733a33323a223064396334666566653162396235393032346465366434323035356439316537223b733a33323a223963306138663433393761636262353934616336393033336431353033303366223b733a33323a223762643562343632363866356563396362393265303437323334393333656531223b733a33323a226635386135396233646231393662333462356162366564643038326337613763223b733a33323a226331333035333334613563373663623532663337326563633332343639633539223b733a33323a226461613631636561633962333666343266653166353938656637303031616332223b733a33323a223530323564653337313237386163363335373239316536363065623631366430223b733a33323a223866373137623162323464343433393163643366646434643162356531626161223b733a33323a223136663163653136666135363737373837316330623839326139636630346231223b733a33323a223364383231653634653731366139616164633539636461343463666133646637223b733a33323a223362393734613133336434393230393062323834393163373238353063666165223b733a33323a223063646663613632353733396537313862323831396133663638383863306133223b733a33323a223135623561393733336133333435376539643637643531616263343633643336223b733a33323a223930303364303937316536356561646334353063653261633038373565613335223b733a33323a226161303133633139636663646663663836623536393530636432323737373762223b733a33323a223561343934626437666564303563316636393466656431306238333031303361223b733a33323a223261303635646438356237353862656233626465343130303134646330636463223b733a33323a223137623636396431333537363134306435376339353032323835643736333236223b733a33323a223332373639613065383865323136613736336638643630316363653535656562223b733a33323a226637653039313536363562396466323139373466636365643563383130633730223b733a33323a223531663365346634326431366336393234616236373937666265393839303936223b733a33323a223166376330623963393138623839326337353861633432323431656364653865223b733a33323a223036386531346663346265646163343232616562303464303738376432356366223b733a33323a223266353132383434313962643338343435633230343237666636346561396561223b733a33323a223065623561333536346338643063343231353035323439333238356464386231223b733a33323a223130323239363731656430376261393536366633376462323465633965346332223b733a33323a226364656466643935623038663531356364643836313634393438653062303763223b733a33323a223035646435653839316462663234616233376366353139313666653438663135223b733a33323a226534383463303361323235366230623133363166653563623031663965363430223b733a33323a226539313063356361613133646566373238336232623131343039393234643338223b733a33323a223837613163333063613366653139663834343036393965313337313936383263223b733a33323a223066343931633931333635623336633164353133646239613237356463346237223b733a33323a223665646230306330303163636437386566363034656531326535373963616439223b733a33323a226136633237646364643663316564366238633035666537363935353063656331223b733a33323a226365623162613064336565363035643166383735616134353034306134316462223b733a33323a226562653563613962373839363762343335656233643763316537636431666161223b733a33323a226332653432386234396537646463366534623935623530356535363233316464223b733a33323a223031373530303062383938323935336137613161323432653637376666313339223b733a33323a223261653130336236613937373266303833363435326236376663326361616136223b733a33323a226139393465323330613538386234323732386533383234613466326433323662223b733a33323a223235353861383033343033363265633239313537323634393035373061663963223b733a33323a223039666266313634623931353535356362363736633931393131343565353339223b733a33323a223136333264653633623665626232366566396665386264613331613832613130223b733a33323a226137333835336237376161623736303434613563376134636666633837643934223b733a33323a226439623862633238353034623831623438303664626166366565386161306337223b733a33323a223635336433376638336535663663353661626439393336306466386335333066223b733a33323a226161366266346338383437326637623732386435393263666461396138386534223b733a33323a223838336430323030626264646339396362643061643739383365346433393333223b733a33323a223638636636653733316166653039636365623131303861303164353034656431223b733a33323a226164663235636239643861366233386231373365393435323765336636623833223b733a33323a223736386630663662396663383536333461346663393338333630663634363536223b733a33323a226566356463393530336433303431313262643032376333653937663964396465223b733a33323a223864316334316136353931666632636133633436323234643631366339393230223b733a33323a223538383961306132323066306630633934383539663664646461303032313163223b733a33323a223166353139623064333836393832333134386363643166336661633137303064223b733a33323a223930356562663365646330653130323366636339356566653238383631663833223b733a33323a226137313839626631346663393134306665346265633236336665383031636563223b733a33323a223530613363323565306238616133323561666164656335393638613238373836223b733a33323a223365383230643734663038346534353538363563616462616538636566396466223b733a33323a226366343739313262396463336462346239636661386263626464343666323065223b733a33323a226538303937633335656462353231633536626638643133393861646337333839223b733a33323a223962656263383932383030323931613666303964666134653266623732303062223b733a33323a223134636531313766613937353434393830613062373133396631323234373761223b733a33323a223766373935643935313061643264396530303738643334316236383962303535223b7d733a343a2268617368223b733a36353a2237663739356439353130616432643965303037386433343162363839623035352d3134636531313766613937353434393830613062373133396631323234373761223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a3138373a7b733a33323a223838653235623239616364353665656665366236643062336636363436613462223b733a33323a223465303463356437336532643431383431623065353331636339663137633866223b733a33323a226536363334623363353765303632613032393661323361646237303766313436223b733a33323a226266626131333765303061373736366437666434373734653738336534373930223b733a33323a223931646361323365346361623264643162383438356163373430336532393338223b733a33323a223965653962376436613937386433633130336636383838616336663262333431223b733a33323a226463613831636562663833656663643438343131326561613831343032646137223b733a33323a223261633365323866633031326534646136333961386638643065393835373832223b733a33323a223638623739653030313833313461336661386139306436626439326431626537223b733a33323a223238616365343235393631623563663863313661663563326266373837306361223b733a33323a226139356438616236373936633134373037646432386635363233646666346431223b733a33323a223135643930633036646336363334356537303838313664353638636530353435223b733a33323a223134373536666237373532383862363830306238363236323238363939333332223b733a33323a226637323332643462356363386535633864623834656434326232346639646466223b733a33323a223564643637303233353162316334386566373837373536643533383737393130223b733a33323a226262326531656531373165653361393838303232363335653835353631356439223b733a33323a223833396261633734323066356638326336363332333430333164373732656538223b733a33323a226463353235333237386166333532333561373163306365366265373733353561223b733a33323a226539653839353466623530613061316566356666313638623765356363646466223b733a33323a223234346438393531353235373233376366333231336164386634306236616539223b733a33323a223134636262306232373330633139326538353039366366366338336262323139223b733a33323a223633373530666533363234326331393536336433353063316331626539643338223b733a33323a223339303832326361313534303439636663656666613364623935386466663037223b733a33323a226463616462336138653731393163336235383933316138373331323333346264223b733a33323a226535386434373030313737633534653264613131613431623264613030653637223b733a33323a223564343436643461343664623738643039326531316565323936616531323033223b733a33323a226138656363393533666162643336666664666536366163376437366230343964223b733a33323a223235333039393338613238653432643065363730363131383238656533613364223b733a33323a223862613966613237373666613635393939316664353566623830373537356464223b733a33323a226262346238646234363764653238633835656531323461386237316232373335223b733a33323a223530393937306436316536376361646335343438343864336535646235313263223b733a33323a226462343637343336623236643937666431346639353134316637623834333439223b733a33323a223135366339663832303236363232383762313166363663353166383133633737223b733a33323a223434363239343436393363373265643164316536653333326134366363333638223b733a33323a223539613164356638356262306261326630316439633464383933316366333535223b733a33323a226332643264343866646435353465363333383334646331383664613166663134223b733a33323a226233393734356631303265373531626666306562313261623139366530666533223b733a33323a223833666362316566663938353730336362383865633937393666303030353538223b733a33323a226430643761393161356334323563643132356161383861366236646536303937223b733a33323a226164663430323461623264383634383835323237393331636462323930613738223b733a33323a223838376162333232646562343061303732653462373237663539326662313130223b733a33323a223762363932393239663662373262326262363231343131396163633064313164223b733a33323a226165333335323338353466396234643835336532633933663134653133363264223b733a33323a226339323766336363356165346130316232313630313162306262376464353633223b733a33323a223039393231346461353865333137373732323263346538366332633537333131223b733a33323a223738313232623931623730386433303735363734336365373230626632303130223b733a33323a223731313865303132373764636561376264653531383531633035353762633332223b733a33323a226530656661346330646437376364343334306430643234663865393337313234223b733a33323a223634643233373365303966333564633139343136353363346433303933386334223b733a33323a223463323735643263663130303464346539653762316334376431336435643235223b733a33323a226664323462323261326531656539363439333830353133636536383637323161223b733a33323a226335393831383537303235653238656265633463346364376364643237636130223b733a33323a226531633937636433663738663038386166613166373635656438346232623162223b733a33323a223135626134313038393263393935363633343635316464333961353664346339223b733a33323a226535633539303935396538393239656230643462316533616161343030366666223b733a33323a223932363432646161336336613332663030303531666163636432653937613536223b733a33323a226561373835636533303830316465313362323463356166633632636565623636223b733a33323a223530326236306636626138303638663661386365646334663662623037363931223b733a33323a223561393962383331383838613436356563636465373732376436626337343661223b733a33323a223465336431396461346333376666633364336437303165663830373539643765223b733a33323a223832363738356137633366663431303564376139616237653737396639623563223b733a33323a226364653732643264373164333362313764386137656262303635393531363135223b733a33323a223966636530666130396230613661383564333932373766396334663061633262223b733a33323a223838643733353231633065656265306234303765336633343364333034646636223b733a33323a223931636437383165643462343131626639306666663231623731393637376266223b733a33323a226239646166373835636134386335393535626364313033386131303037626364223b733a33323a223338656138363862313730656234616262353964613539396631616430326334223b733a33323a226632353032633464316137323566383734613032623039323031663561366232223b733a33323a223966663136346637303832336330663231316564653363633862623732393435223b733a33323a223733303062333334663162383363666537366532626265616439633832663034223b733a33323a223737656363366263376536343531376435653530363139303861323363343439223b733a33323a226363363363666636323034306231363432303562633335336565373466333661223b733a33323a223233646334376439613265663932343565316136613264663830353231656339223b733a33323a226432636639393735623332303230616431356661653264363230353166636562223b733a33323a226164396566333230653066376562626232626336306561646238623235376261223b733a33323a223035323765356164346535343933663165646437393662373337653261373666223b733a33323a226133643631656633613435333036353162626266663737363965393362303164223b733a33323a223930646637636637326561323839316131643037363531333130303430353362223b733a33323a226330313336303233373963623437313330313439376335336631336464663934223b733a33323a226437663465396235303063313635343561643263343963336461303666366635223b733a33323a226438613466386638336263396139643266316563666562306262616138353862223b733a33323a223631623733303136373037663762333366633764393231373231323138636264223b733a33323a223336613035636333323734323238316334613034633430663362666133396661223b733a33323a223731313332336665653862366339643761386365306461333063323038343530223b733a33323a223665363332396466646132333036356266363965313130353639656237303930223b733a33323a226131333130336239313137383464323562366561306262376161653035656137223b733a33323a223039356465396364336433323331613638373462643730643563343935336164223b733a33323a223131373936656130333530353737336638376139373865623865653364303937223b733a33323a226434653863643263663035386637633334626133383036306166376230373961223b733a33323a223637656130333261633432323531353361323062366263663964303738666535223b733a33323a223837343462633164353937376164363732376333323438303439376530373730223b733a33323a226362613635316339343631646432656234646563623432363435353432666266223b733a33323a223763613533376236653735393566616563356161303037656162643833623037223b733a33323a223064393631316437323330646434643532333635386232653962323164316634223b733a33323a223761383133316332326534386134666432633338326530653834306531386564223b733a33323a223265343265383230306566373136336261356335373631326361366232393361223b733a33323a226565633737383537343436636337646366616662383462666235626262356639223b733a33323a226635343735363538643436353837303063396162636638633234373935653263223b733a33323a226430373361616266346534336439343432373034633838343866313134646366223b733a33323a223630303962373033623831383761376632373939643363613964306331393939223b733a33323a226537323664373939373139313630653565313432333463656166626638626238223b733a33323a223061323135383533306435343337333264316630653565663265373531363037223b733a33323a223236663036383736313164613032353030663538373231333331333564333666223b733a33323a223532336434323638353133376564383733666165663236623030343464393835223b733a33323a226361653237613338633064393536646466353237656566616232353166616230223b733a33323a223436663263643736353333643334613030663330386137396364366633323061223b733a33323a223733656161343530376532333763316230636538333736643930616362353739223b733a33323a226535323631666564323739376630366637653530396266393461303333383336223b733a33323a226462663538663262316464373162616632303238326435313632323035393763223b733a33323a223937393938653266326363373062666133386131343330666661366265343337223b733a33323a226532636266313630633737313435323039356233323066313165613732353966223b733a33323a223461383434633032336430313234326264636132666232363431326632326335223b733a33323a223362323837316636383030393338333738383737666237666461343261373737223b733a33323a226135333930643461356131343335313161336135396638396662363863663563223b733a33323a223438376163393630363437613232623437353037366230663533346664633439223b733a33323a226365333734353630643965636463656137623933333864396561656562393730223b733a33323a223637386162393765303466653033386466646532343934356563623663323930223b733a33323a226432313835616261373464303035303532323431636463353564623138376164223b733a33323a226566363161323636376137336630653765653234346366633038383661313330223b733a33323a226231306238643439363534633436353565333037623264616233383763363537223b733a33323a223132316164323164336461653033356531336664643633653463316230386238223b733a33323a223938366538336237333366653261376332363566356466663530643535623431223b733a33323a223339366164356366303464336436316263343464363066373534363536623437223b733a33323a223863353333303436336539626164646437383036396661666636366632636636223b733a33323a223336316334653039396163663063613939333765663562613437633938316266223b733a33323a226366666662633864646666343164336433326666303861336263326464656537223b733a33323a223930376437396230313231343465383737613633653665326666326164316431223b733a33323a223665633664643032363363396638363839653534643639323736323734353632223b733a33323a226565646137393130366239323637363365653362663635383266376563613332223b733a33323a226134633738393038616335346539326666653864323134623866636165656663223b733a33323a223962386566653937643536623537653237333062353865616562316561303161223b733a33323a223838646136353435326364663365356137636132633236333036316136333365223b733a33323a223765653234653965643565393537323639393938333266343739316663376535223b733a33323a226338616564663431376336333733363236386131306162396537323935356435223b733a33323a226162656532346434376331646535316236653866393733636432623161333033223b733a33323a223036346338623861323832336162373435306230666663393031366666343530223b733a33323a226231363531666662323532333964386163653835653633643631333134353661223b733a33323a223035383961616535303766316639336335356231313031336364633939623563223b733a33323a223134313831623938643765356665306664653866653234643265613163633837223b733a33323a223462653264326434616163656265313064393332373461363337386135316363223b733a33323a226135393135656638353464353334653236666236326137613932656538393434223b733a33323a226630333933386539636565613134336136653134326638336536346333623264223b733a33323a226535333764353164623164303933366132353336313966306633666231343138223b733a33323a223861383637306630316165343961616631383537316338353435613132373733223b733a33323a223264633730646638623364316661333533366535633337366331346230373162223b733a33323a223761313132326361303036636333636430376538643634666566383133633966223b733a33323a226236333535663565323337373731346536373766663462373466663639613966223b733a33323a223539646363396432633761346166356133346532346463356530626235663866223b733a33323a223665333363343031326532316163333634383338653533626465326530616430223b733a33323a223663333136643765643263356365623263626338336363616463373636393337223b733a33323a223038666366386533663831373432393138316161613964653434363735333738223b733a33323a223437376364623037326333346530626165313538336231643331353466376161223b733a33323a223832396638363563393332653933663931323163346261333637613061353030223b733a33323a223034653239653561363162363633316639653835343730356336393264643335223b733a33323a223735663136396662663231356139663036656636663132373331353564326464223b733a33323a223461343839613837363461336161393239666537623933633230666539613236223b733a33323a223962396633653861613031643861636566663735323630623936383237383732223b733a33323a223863373235303265623362373134306634386434656536303431356136353261223b733a33323a223237303364623635313137376264633235343533613539373861383864383861223b733a33323a223366356431363261326535373462316661663366386636653337633935363565223b733a33323a226535653533626465323264656562346366646535313738613537666538353932223b733a33323a223238663131363962343161306238653865373164616230653632313030646236223b733a33323a223365343063626162366533353236383933633737376364326262356563313135223b733a33323a223037313336653566383133616431616438623137646262666362613932343735223b733a33323a223735613234356235343132623933653230653761303434376439643737313066223b733a33323a226238626230666365653862396539306332646261376161323235346334663430223b733a33323a226235323630333464613565633733336638316431313362323635313336373333223b733a33323a226666666339303861373437356663363336613166313239393062323530343230223b733a33323a226531366534643461393438303137333632396134626232336462333831393865223b733a33323a223036643962633865323038306530663166653731653938363839656635636236223b733a33323a223665333839313830393531626531336430356562333233353861343261626637223b733a33323a226263643439663133346535383738646365653134633331323735316563393033223b733a33323a226534363864653732636631316239383662656639393565663832376636616365223b733a33323a223463663166663236303837393439346130313661313335633539323338393932223b733a33323a226537313731323931626261663065643932373162616637663734356164323964223b733a33323a223338613038303464633666623230303237366533663930383530343139316464223b733a33323a223132393132316636323065633363373362353132623635383336323837326661223b733a33323a223939336437383838373835623639353062613766633834633361303036616530223b733a33323a226366343332373866376638366362343062393430633030303231316537613635223b733a33323a226164303636633966343632386530623633386437613264386138383164643036223b733a33323a223830333264616361653966353562306633636338333733633939336635346136223b733a33323a223333633039386532636331306430666139336334373963623261636237396365223b733a33323a223337356238306465383530323037343935386539653739393934316330653963223b733a33323a223361383135393635316362336630373266393935323766626639646661363533223b733a33323a226137376631313735386131376334653863643763313836306264373330363664223b733a33323a226462656632346236383437343138356438633237313636663163383836303834223b733a33323a226137363233316134353736636366623330373731643830333134353963336662223b733a33323a223365326332343564663736323366656434643932323462323733393735303965223b733a33323a226365616263633864323365346333333730383632383830303561323564656265223b733a33323a223364396533386163646166353830636335646635633339346336666332613434223b733a33323a223663313165356163633464636366663331343166393033646165333739666138223b733a33323a223538663538376435316533653933653631303766326465373362383337666361223b733a33323a226662363833633862626664393335333766636639653339316538663737666635223b733a33323a223235383633663332626439616334306135636635666464363962373265623232223b733a33323a226433383666323964396639663532356535396531623064646638366634326661223b733a33323a223435313839626634376237613665356131633838663666663130356632623463223b733a33323a226639373765633661663539303431623930353162653332356135386461353235223b733a33323a223934373635353763623666666534656230316338386133363761366161313262223b733a33323a226135353965396130356634326262653036383733396139646438643632313564223b733a33323a223634346330616165653662306431353563663531353863323730353734313536223b733a33323a223237313132373430653961333035616361313431663932346532333666353134223b733a33323a226537396466653764303365393863653232333563613930653834306266613664223b733a33323a223839353732303534333331633965636537663566363265393139326530626461223b733a33323a223437383134313565656430393334653761353537633061343036303436633430223b733a33323a223037386666316265313164346264643234343331643735613462613032616263223b733a33323a223565306134323232376636336134663331366631303765613165376132313161223b733a33323a223037376366626335616534333133316539383664303832633030326461373438223b733a33323a223062643766393263383631656531636230613134376532656339336636343665223b733a33323a223663383235623634373734633632376434386361653231303337313539366363223b733a33323a226636306238623131386334353232666231623932346564333438356232306563223b733a33323a223832383964313438616638643331663861356639346333313461643338333036223b733a33323a223563383134336163373431393333316333373664633539336533366535643461223b733a33323a223439383561396636616262316139373436313065303162633231336330373863223b733a33323a226363376638303933363930303765376163663338353763363237303163343032223b733a33323a226331343365383630366238303665353538383530353338356438313333363830223b733a33323a226439316337353461376337616638623865303662373465306265306661613736223b733a33323a223361653236613961343635323666303731333266643661346137653864396536223b733a33323a223539623431636239373033643239663434613064376532316235626538626466223b733a33323a223432383265643061386361363932353333333133376664663561633335363736223b733a33323a223430373432373035643164303663343566623166376535393136383562663637223b733a33323a226632663863393037653335623065626364653664343137333338376336393739223b733a33323a223361353363363633623634393536623165386536656466363163393065353734223b733a33323a223861323132373563326431303465666232343335323839326330333766646666223b733a33323a223762623964326232333465376336336564646565346535613066633233316362223b733a33323a223133666533333637353536633339323163373831386538343262396333383635223b733a33323a223032393565653163393537326163646663306166363162376463616631373437223b733a33323a226432393835326665353034666562626364313638343332636130623439323035223b733a33323a226565373532643561646434316534366132623131353936353233316162353539223b733a33323a223463323832633765326434616462353739646534346237346337383332626564223b733a33323a226662383461316565323762323566366534373265346365303263346235653061223b733a33323a226130373264643432306635636332366638376437383036386633303161656137223b733a33323a226331626331376230636334343666626635363538323237316634376637386434223b733a33323a223938643230353461313633353461343832333763353730633235306539386136223b733a33323a226239626139346166356164303161373532386130313437313837646330643164223b733a33323a223261636138623534363336326534376131323065656463666130356338646666223b733a33323a226564363665343165333735383165326634386336313265353738393537343232223b733a33323a223164356138303566313063653435613265316562616331376435626634663963223b733a33323a223733386562313062306138663439333139663564356532663030656265303766223b733a33323a223562393439313765303662646563383638376238376337663261636536653733223b733a33323a223535353838323339633762653535613736323537663734343533663332383964223b733a33323a226537326465336630343837616533333733333037626631323537343534303438223b733a33323a223730346338383237343037663935396364353663323465393438323564393336223b733a33323a223962653031613838623231646135326266343930376663373366363230303833223b733a33323a223862366236363933626337376633616435336239653639666663356133343235223b733a33323a223632643536656633333264333836346138366633656337633161363263333662223b733a33323a226136316534376664626261336461653966653066626563616463326434396535223b733a33323a223731323965626563303833313132366162393732613730323737666637343533223b733a33323a223435666563666636333136306261396131323035393662373938393035633365223b733a33323a223466386365633835616437343433633866633164313734326136393039663565223b733a33323a223637333331366531346565636437643237613837656664346164313434323339223b733a33323a223836616433643235663734313238343633616265623164303866646630383036223b733a33323a223632363966386634343035643936343334313366653466306534303366333863223b733a33323a226362663665636131386337633861326634303730333938373539373765313933223b733a33323a223066313464656437646436306639396563373131643237393832656131386565223b733a33323a223638633032633164363835616432613537366635613933373766303031336161223b733a33323a226534613366633734616462383531643663393733326235653864323336376333223b733a33323a223764316235343037666161373435656461323033343333336535346131323032223b733a33323a226336303639333538636632663465636438336538653836633265396166313838223b733a33323a226136616530333462316532333730393134396262303365386533623030666139223b733a33323a226135356237393466343136326537643561393036623437326564656438613266223b733a33323a223139373238656539306261633633623437623063386262303264316533356163223b733a33323a223439366564643965653231366462643835663265333461313432656335343465223b733a33323a226264393437653362303632383365353863303538376438323233303033623633223b733a33323a226637346335616339663064393561316564356462616465326565363139373166223b733a33323a226233323764653365376562653836633430326537626536646335666165633936223b733a33323a226632653736366338656137353363663663323138346365316361653862643634223b733a33323a226434363665623039373837303366396134343232383536613735666663653634223b733a33323a226565386636313961396464316363303939303862666365373264376432396531223b733a33323a223034653062393031336162333732303866323639313636376563623364653831223b733a33323a226433393635633935316662323030343837346538656361316330633261633062223b733a33323a223563336163666165306362323735626462663837666638363334613430626635223b733a33323a226565333262643536373062363263636461623539346631373136633762366336223b733a33323a226435353064343966373739353139633463653465393464323930613462373839223b733a33323a226135613938396338643035633266666535363637636661623032343835646163223b733a33323a226430636232663764356264393937643530643366373062643235353431623531223b733a33323a223339653561316665633761666233663732663563386530666438643434333063223b733a33323a226636383230633066353065316334393766653931656362343764393931353237223b733a33323a223465383737363161346338656334653835316138623237353461656333303665223b733a33323a223239343936386162626138323137366265363137613335613833613863386232223b733a33323a223761343939396433643535643461383933353939376437356366396363353236223b733a33323a223830336532383535393931326533323761646437343762363639303736316538223b733a33323a223633363133363836653532393165633834363864333862313464333631616335223b733a33323a223835623736323135313935303930613632386663633261623437613932313530223b733a33323a223561353832343461316636373264353064393766366137626465386264396462223b733a33323a226263663264326536373865613834366365333133643036396463383836316136223b733a33323a223234346165646131333464306634656634336262373162393135396533636466223b733a33323a223832376339363565656362393438326562396232616161303930626238393965223b733a33323a226564653764353033393735353863633338656461656535303133343466333330223b733a33323a223134363437353934646339386438306638313761623534623366373639643964223b733a33323a226437383433333465616435616433393430346364383333663262383065653861223b733a33323a223838643964623366353665383034343566366330366438663261636363346530223b733a33323a223831633863643539323565636532396234356664306266326664663635656633223b733a33323a223261346634633966343531333264643761333863613935623635646335613963223b733a33323a223830363263303232663963343035303363383561343964323465643734393266223b733a33323a226164346330643231393235646134393239383635343662616265323732623137223b733a33323a223930353938396632616138643862656139333866383936383736396462323866223b733a33323a223935613231323538656231333262356638633564373336303333653130623330223b733a33323a223539333461366663343065313130373530303030623965316165313162623536223b733a33323a226338373731393833313431663934626132636335393932376666623037353332223b733a33323a223531313265306334336164316266633730613935353431623934633965386363223b733a33323a223438643766306632363733353236363931326235653661393230626435323664223b733a33323a226537636162363536303836653834613739623465346537356261633539636336223b733a33323a223732656566643433633964616463623336303130633131366132346265333166223b733a33323a226133666630323734383232336666653832643331303434633562643062306365223b733a33323a226664333836396531383362366435633935316665623932393735623264353235223b733a33323a223539653765636662373961643734643665316638616134386433316139646436223b733a33323a223936383932623131383438346434643538373832653263616631666234616534223b733a33323a226132666663636636616239343136653136323838396332316161323831323065223b733a33323a226465303665366236666333623464633536303331333339633634376262353736223b733a33323a223438306262336237343933366261393034373064653039346537663536323664223b733a33323a226261396433666130356433336663633364313937393462306439313937386437223b733a33323a226532663333356365383063336537383564666163613132363033336137396639223b733a33323a223732623537373132313764323862303938353134663064373737343030646433223b733a33323a226337343530383433623262313834363866656162323330666662663461373138223b733a33323a223237353630333466623663303661346533316535313635626563343631373239223b733a33323a226237623030646536386230336330393265373433333939353836643833356134223b733a33323a223533313564666530636130356134613135393634633565326539666532313361223b733a33323a226333333961646631373261373137663039326566323532623536623166323637223b733a33323a226539313239306364613238653864663734616565626339393663626466653632223b733a33323a226233663735366264343835326566623262613537333435626238303964613466223b733a33323a223837383930633230323337633631623132393664373731356330633239333938223b733a33323a223961316232313164356163356262646564343534326533613531656263386533223b733a33323a226261356638336563656139383839626339316134333161316233643539303965223b733a33323a223838623764353866326232396461643162313163326262343330636130333430223b733a33323a223166653461653266373436613530646261646362623366363661303236386131223b733a33323a223761616334376137663634636439663366643532613461326232626131393436223b733a33323a223638343130653762313037383235313037656561303934316435636165333035223b733a33323a223636633235396665363566313739623335353235303531396135636138383664223b733a33323a223632316565376336656236363263323837376431343863653531393065613831223b733a33323a226333653530646230356261383466363333653437336338386462613135663865223b733a33323a223536366364353034633331393235363434396361386534613132323566373036223b733a33323a223038306439373331626338393366656662646235373631623830316237656166223b733a33323a226639303462366263623465636466613332316366303564373664646235633361223b733a33323a223331386566353161663034613135313733666539346233333733643765643166223b733a33323a226164373465663663636431623932613965353965353537396430616131333534223b733a33323a223662326539373131643333323431663763343966383461393432346364376137223b733a33323a223661383936616331376335363138613436323134643239306531626639653930223b733a33323a223163646536393966316338626234356464653565383834333139323636623563223b733a33323a226536346239333831376532643066393735663430313633623962623464356634223b733a33323a226162373365386335643739303233333633633838323362643631336665373062223b733a33323a223064343439666232303936643065393163643736616661323936336534613036223b733a33323a223037353834363136386436303162396136393661313161393330336165316665223b733a33323a223735393865306236666539383235333137313332633139313230373730366162223b733a33323a226664623365653234353436343266383239363032383732303834366461663864223b733a33323a223534363638333065653033626364363332653166646337663535356363336631223b733a33323a226566356131316335303936343966623766636635353064373563396161336461223b733a33323a223033363062393038326338313163623933363865373961313661646337336662223b733a33323a226634643766616536643732393962366230386237333339663036316633343066223b733a33323a223337346166353532653231373363356463313433356165326462363031306633223b733a33323a223861323866653331303161353031626531373563333637363832336565353062223b733a33323a223166303430356138353038613966656634643862636330616530393762363733223b733a33323a223639326565336464633266346339386334616462353365383835353131656663223b733a33323a223136333633376430303263396166366531663535663932636232333038393031223b733a33323a223835666663373732363731633733376561323532633533613231383335623761223b733a33323a226238346165383064386664323232646665326338373766636364346532646236223b733a33323a223833303239646133346365306465383465306332323636633331323238613263223b733a33323a223062316639663464616136336663343339383864333661316430303466653137223b733a33323a223133613064393666643161386134363737613633373265333264623465383535223b733a33323a226336393730613566353938623432383565633966656333396262663834353666223b733a33323a223136333931613662373365616165343135343534633936643464343664363031223b733a33323a226266303438313830663434383631373264393438636364356539636236633462223b733a33323a223830373534646436376530353233623539626263323562326565326137333731223b733a33323a223739383764306237376331323935346566333765666334323062663732373264223b733a33323a226563353661336130313964636237633866316661333461383266333964356363223b733a33323a223935346239366538383436383835613662393434393238633166393566336464223b733a33323a226262353065383935343637316230366262333361366433373736353432633061223b733a33323a226338376561333830633461643932366336343430323939653561356632663538223b733a33323a223762333633373036633164656139626132323637383161383762663837393238223b733a33323a226330356665303639363966643863386531326335613363333935383566306230223b733a33323a226265633566313263633537343163396439623937393761343637613132663436223b733a33323a223564653839643461633632366561666263613134353030343262383331383030223b733a33323a223261663566616332623138663162616235623839636636313932643263396665223b733a33323a223161323835616431306266353165386363643939396239386338666335653665223b733a33323a223164653063366233333239653564663537626137643837373264663361393864223b7d733a343a2268617368223b733a36353a2231646530633662333332396535646635376261376438373732646633613938642d3161323835616431306266353165386363643939396239386338666335653665223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465696d706f7274666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223738623862336239663233653537343035313962663730653861383938376466223b733a33323a226334613434323930616562386536383636333932366461656530333432333434223b7d733a343a2268617368223b733a36353a2263346134343239306165623865363836363339323664616565303334323334342d3738623862336239663233653537343035313962663730653861383938376466223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31333a7b733a33323a226632383734666434346538316162323932623237363063613163373835653663223b733a33323a223265313734353831623164306565366532636530313965343937616366643437223b733a33323a223466393632643762333330363137373164653964343637373833616365393764223b733a33323a223461653633303563383562393235613934663832653166666438366661303331223b733a33323a223636363538373433646233656465656339663331633436346234313737666561223b733a33323a223837316564346531343263376437363061633261336331353138373331396636223b733a33323a226635623165343036653035313836613630653163646333316335643937643237223b733a33323a223162376235353934616137303663636262643332363530393061323165633638223b733a33323a226239376237373135663761363330653032393930346336303234323432333237223b733a33323a223262613237316565656430396261323430623963316363373733396539653566223b733a33323a223335316539333235323963636432646339333164353536376530333332623365223b733a33323a223638393730313534653234373135323035633663313931393333636162653764223b733a33323a223662643963313635373630376432383737653932353861653761326632383635223b733a33323a223263386337336433363337663231633337623130633534353138326361343165223b733a33323a226338316539616363656231353432353338663762343362326637303231386633223b733a33323a223335373631623931346463663235323361353162323964376632343032343631223b733a33323a226634366434323035616562663264393139373830306537393839316661323534223b733a33323a223337623138343536313239356162626633356166656439643163623564356165223b733a33323a223765646437313731326231353062363361336463636134646438316161343562223b733a33323a226163326430346266383865333437646132343361393938353838633330353339223b733a33323a223635353166373939616564666539383066373766343533663532313930636464223b733a33323a223464316538343962313431333665323834316134383837366232306337306237223b733a33323a223031303938343636316436313831383532373535653130343237356361323331223b733a33323a226332363637316332363436326232376331393134663765356330633432653934223b733a33323a226165366264663962623061366337356335316538316566373061333033316232223b733a33323a223135623035373834636535333037383134643163343934303031346630346465223b7d733a343a2268617368223b733a36353a2231356230353738346365353330373831346431633439343030313466303464652d6165366264663962623061366337356335316538316566373061333033316232223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279757064617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a223332333734396636623337333566353734643563326239643962646333663936223b733a33323a226566346361353864663530646232393865396466623065353061663031373036223b733a33323a223364326137396232393939643830346336663832316565333136656630633761223b733a33323a223037353233326538343736373161356539653831393336386464343035656432223b7d733a343a2268617368223b733a36353a2230373532333265383437363731613565396538313933363864643430356564322d3364326137396232393939643830346336663832316565333136656630633761223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1760778012);
INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('g467l9pkh5v8vsj31q145ppe1m', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736303633323034372e3030373537393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22626466696b61743465747034396e69396a6f646c327369313970223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736303637353133343b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313736303637353234373b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736303637353234333b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a226132326466376633303031353764363539666638313035636138613137326666223b733a33323a226366366531643231626664373232396533313536313862353939393635633134223b733a33323a226663633936353533653836396137663366663631336136313438653461656336223b733a33323a223635303130646462626131333437326665376565633162346231353366353465223b7d733a343a2268617368223b733a36353a2236353031306464626261313334373266653765656331623462313533663534652d6663633936353533653836396137663366663631336136313438653461656336223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d72656469726563745f75726c7c733a33303a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d732f61646d696e223b4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a333a7b733a33323a223237373437306633396565353230316232663137333532396235323233383932223b733a33323a226136333262333661373566613138346431386134663035326239376261373034223b733a33323a226437333535373364656462393436393831383832313961666332316638623731223b733a33323a223339633337623965343438383065333432336533323466613332316161633665223b733a33323a223161366165346363646438613563636266663532646166323863393830353965223b733a33323a226638653436383835386462616638646636343134653034353665333136323762223b7d733a343a2268617368223b733a36353a2266386534363838353864626166386466363431346530343536653331363237622d3161366165346363646438613563636266663532646166323863393830353965223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a223965313166363137336137303131636236353537626534656235653931666563223b733a33323a223535653035643766386165393363353763616563303036643861316136363964223b733a33323a223337303437633564626232333537383264623565663730626635616666663961223b733a33323a223466356632373331636166343231336539383934643831636161313637346431223b7d733a343a2268617368223b733a36353a2234663566323733316361663432313365393839346438316361613136373464312d3337303437633564626232333537383264623565663730626635616666663961223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1760632047),
('jqmtgm6gballdj70uh6ebv1as9', 0x5f5f4c616d696e61737c613a363a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736303836383030392e3938353137383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223568613965356d396139656a63623576636431756d6a33616967223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736303930383734313b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736303931313136353b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736303931303336303b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313736303931313131303b7d7d72656469726563745f75726c7c733a33303a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226633373338306330316434343935363338653932353431313164353931653730223b733a33323a223337373763333664393935363336363637613534313839373336356435633063223b7d733a343a2268617368223b733a36353a2233373737633336643939353633363636376135343138393733363564356330632d6633373338306330316434343935363338653932353431313164353931653730223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a3130373a7b733a33323a223330613637366334623964613534616334663639316231636336376464353236223b733a33323a223466363130336462386665363537313638613064306362656239316332643063223b733a33323a223330336464376662353461623538656435333266653461613862653765363766223b733a33323a226635663233343064333530376536613665363634343565336235393364623734223b733a33323a226337623238316236373333306532666366633535626439613264366330343632223b733a33323a223664383431333439306161363938663936653834316564323063636237353532223b733a33323a226166376438643632656335386135653234623338666333653830383766663238223b733a33323a226465383766656265383439626463396664303734663039663565383237333030223b733a33323a226362626561363438373935656331313562396566656530663561623539393466223b733a33323a223365626232373530336239343363353535376364633362333464646237303530223b733a33323a226132633938316430393630626530323364633966313562363762343261373262223b733a33323a223537383431646661323932653130663032653138333034316438643061306164223b733a33323a223861653564336361366133383439346563346639643466633861626263633637223b733a33323a223137396132363535656365363239376637643564646637316431653965373134223b733a33323a223731353637333563343633336638626462323930313536623766626333623661223b733a33323a226663653338646134353635386561373366353863623363383037323261313430223b733a33323a223039303061373939353065656130313436393161393232633263623337633439223b733a33323a226230343535666463353231643065306562333431636439343030616463343138223b733a33323a226266313561653334346437376330313030343530633631346530613531626133223b733a33323a223233313031346139633438306566376561633030663463396562346535386439223b733a33323a226332623931353333616433636639396565666665316432386138306266373866223b733a33323a223735653236633435616365643431353461623035613165636337313435616130223b733a33323a223231383634343165303462323637666461376533383339386638363462353162223b733a33323a226265646364393532386432326333633133396139393336646263623165383664223b733a33323a226135323533666436653134333737363563366264303436333232643832656630223b733a33323a226464353037356630306530626539353139656263623166343739313063663961223b733a33323a226436656539666630336430363963316231353539333962326165613463376363223b733a33323a223263323561656533363466303931343135343839386231613432386538343830223b733a33323a223735353937383563386563636264346532376232343236396661613563323836223b733a33323a223035393835663863383131313639363764613734353737396531376132346634223b733a33323a226164316463313531656435313635636263356266643435346165343035363061223b733a33323a226231396638383435383734303163366338613238383731313862363235663163223b733a33323a223831326333313465346638386330356336623136326332363331353236383931223b733a33323a223339626664373461636434666236383833313530323861393030373637393363223b733a33323a226439626630333036333039376264373032643063646237303037303833313466223b733a33323a226662643561636366636266343531393133643365393035376566323363646435223b733a33323a223237396663626262626538626537653132363437373032396432363638316634223b733a33323a223161306637333333363333646365353265306631376364613738353736343861223b733a33323a226437346132373434393732636433363362323435383231333561383331303865223b733a33323a226165643336663763623433616535363338383035346161393332303233376634223b733a33323a223838393433623331393263316464383963303564316266333732366537303262223b733a33323a223335643038353334623464613532353832666433633131326134316334303331223b733a33323a223438653566346134346261376633363562343765343765363232333866323965223b733a33323a223361356535643630633062663363303336376461356335623161386266666561223b733a33323a223634636139663634383637663263646230386231393761643436666161316265223b733a33323a223661656666386462656430326535666330663066363037653561653037383665223b733a33323a226564323064626661386236656638636164653465346430326539313266643161223b733a33323a226263666132343434343133303635633336656561353235326265356135393933223b733a33323a223665363530616162633432336433376337373437306564663463623135306130223b733a33323a223866393335626230393439386263323666366530323132303732303338653266223b733a33323a223432373433376366316535656339363231343635333537336362353766306338223b733a33323a226535643037363063303231313734613563613937323865383637313434383264223b733a33323a223062353634303334333563343632393039616161356564633266336266336434223b733a33323a226230336562386535376335323464303162393632306336323230663533626562223b733a33323a226433656666396465366464303336646138333639376264393833623832363861223b733a33323a223637656537323430343764303464366662656333353530643330333463613261223b733a33323a223234343364646134646565343930633161333065666463336265323136353433223b733a33323a223037393934303736333335356162393035633136303032613039323562626636223b733a33323a223236643631633233383534303536663634663065323638343761323830393166223b733a33323a226335316164646661633730343765383637313039366537643030313633303235223b733a33323a223966613239393636653966393966373334393338313735353163626266646434223b733a33323a223239376231393662643032346232363432303839663030323134323165356436223b733a33323a223737666636303235373463353266653964323432303266643936396135383034223b733a33323a223938346138316433613730336434333063623566356237303730653234346566223b733a33323a223433373965643832356435666134323337643331353439336163353834653063223b733a33323a223763343039636438393132316430316161376531636563333663393739326438223b733a33323a226437396633643933336134363431306338383462316434653665646234613735223b733a33323a223763333161353365666365613631343163316335616664373333393163623063223b733a33323a223732626336646332363239346338663639616265323431643364356536366230223b733a33323a223564353963336437383332666264356236643062343964386564306438643232223b733a33323a223361623963336636333762333462323666343263396363396233326333366365223b733a33323a223536323135353238306630316136393363633833636633326636336465306466223b733a33323a223366383837383332393435643933333164323332656238633134353839646461223b733a33323a223337346662383765393631623236646166373336333862343238303231323632223b733a33323a223162613839396430663262353234333431326364666165353565346564343835223b733a33323a226430663534393233633563376366333236323062653662316238383332663738223b733a33323a223830613532653630316139343736656538356131393836336463303337326162223b733a33323a226438646531636533663934336530623938626638653931393662346263616235223b733a33323a223766373866363233373961366434646138383661323238616237613163363464223b733a33323a223163346134373832303266366230663964326639313962343832346361386363223b733a33323a223134666161663937333066363661323936633234383435323264366565396461223b733a33323a226239353136353735396631623036626632393938636263626164306164616161223b733a33323a226531336563356235373762633262336265326161393535613963333134643966223b733a33323a223461336332643732333232373930356563383063633164323634613936616432223b733a33323a223133373933626130313565633331353136363931323265323138303935356162223b733a33323a223637333063313736313436613633313539376237393562353638656336633935223b733a33323a223837346333346261633966623338383166303062366162336462313335633461223b733a33323a223730323730636364383865623539626130626631666265353265616461396339223b733a33323a223964653130393735373435343737346164623261356362646139623237333033223b733a33323a226530653334393133353031383363633561306439636136353239356139363734223b733a33323a223766646161333230626664626363393663613564393133323031343364626436223b733a33323a223731613466633766336162646138653735656564313135653162663738656266223b733a33323a226134653235343635316162353137613533396163333133636464393933353033223b733a33323a223963396264313863363762386437613434643034333962326237363232653432223b733a33323a223364373330303234666165623939373834333661643134646464303834343639223b733a33323a226137626639643731306665626333316264636235623038333465643637613962223b733a33323a226139613464373934393034383035623863663937643766653539663535306163223b733a33323a223830643063376138656630333064303838373466666635343334393537383930223b733a33323a223334383564666331393861316361346363326233353362666233363637316535223b733a33323a226438323637623737366565346432616434316436376536303666643664613231223b733a33323a223236616432303936343366626234376566623535613738333839323862393061223b733a33323a226239626166303266363134343563663266393163663864326435376532656133223b733a33323a223535636265393037616537313066363261353136623265383263666537313936223b733a33323a223232376139393639386639356537383333643232613462663333363234336164223b733a33323a223038333163363639376666333933356632313465623336613765356466376262223b733a33323a223933636539383666653636323831613735386365316134613431313537623366223b733a33323a226234313831363437336662656532626231333763356163306334633565636163223b733a33323a223039346132346134336639393331396337353931623931376333633866336236223b733a33323a223232363137373533656330613435663233653833333863373635303264313036223b733a33323a226461356539633063383239326336336239376435333063353966643233396362223b733a33323a226638653864346131383337663531373737366130656531613262636230323563223b733a33323a226337303135636531343337626137363839323236656433343432663134393461223b733a33323a226632366565353266636661356134396631626132636337336136626364326365223b733a33323a223766323161303361346431643434656237616238633731646431333665323237223b733a33323a223634623334383732303263363833636561623737336136656535353431636135223b733a33323a226639316438633932613030626339333534366465623863326361306435343966223b733a33323a223933633937313466306466323238383930373435633439353038623865663431223b733a33323a226262316136396239363661663863333530306538323862373836666361353039223b733a33323a226333623966356533636366373432343334333264323163393834373539323232223b733a33323a223338636366616566633464336337373539633363613931613538326265636635223b733a33323a223835303730306335323864663339343234663062373635623533633363393936223b733a33323a223538663939646534383138646164393035613334383039306562666239383538223b733a33323a226366353938373764623635323732646437636435636566636139366531623430223b733a33323a223837393466633566623137353839336131326131373139613236326235373237223b733a33323a226532363163373739616334313961323665343831393637313335643334643435223b733a33323a223961393933376234633365303831333232643361646464343365643237663930223b733a33323a223230333232306562383863613432303662653466343861323334646239326463223b733a33323a226266636666383032343836356436646536343961303331626534373638303662223b733a33323a223539383632623166306263353965393634653937343037383736313764386630223b733a33323a226162363438643461366662373437366336366663663961303362336431373637223b733a33323a223263303639653735396330633531323632366464316335333839386431363130223b733a33323a223731353638646236306539393535386639383232363162653630396538613764223b733a33323a223462323165366632616536376132616161313330653133643565613135323966223b733a33323a226164383730663335623732636438363866386265343130306437363461396437223b733a33323a223138386330333936333030323034653935383938396366313432303634383734223b733a33323a223262393032623763623837386435643932363938363833306637666236366339223b733a33323a223534353432666339353237616265336230343733353339316463313130323831223b733a33323a223031363665373633306562613763343135653233326539366364306334363538223b733a33323a226366646361653464373863383161333136393966383832323565353030353532223b733a33323a226630383038326536643938613733646632393061616636633639373664643563223b733a33323a223033666139666232353833636464623962373563393864646431396233336262223b733a33323a226335363538616239656233353239346530353431306361666535323861363430223b733a33323a226632646536626134646534656333616238643831396466336138633639306438223b733a33323a226535616633396566366531656239366432316664343331386536393130656466223b733a33323a223165663162316233316131623039366331653162633862326637663962613332223b733a33323a223833633163396634336633336439666135623335303434626164663961643635223b733a33323a223962303261636138373536666633653437393331626335633965643334646132223b733a33323a226139663732633266383764626431336532656163366538633363313466306566223b733a33323a223164323839666565366332313937643462336539643964313661336135396261223b733a33323a226235653463373865316264616465663439613336373536306131666634663738223b733a33323a223664353337373863353964363938323861636235616130306138316337656435223b733a33323a226630353765666666346565323939626362623665323665303138653730353964223b733a33323a223864343237353431653563323831613736653235306532386433376234383161223b733a33323a223265646166366362323366643162653463343134353134396461643066373965223b733a33323a223535343636656262363463616634626435383065656565396230643532343735223b733a33323a223564613239323531313233366363363466306563366234653937356362343838223b733a33323a223932343265653733373234346134623361646438366465316231373235626333223b733a33323a226533313962623732653031643639633835366639373538663939303462356232223b733a33323a226630376363656466636439646332323232656131653565663534373636633638223b733a33323a223730623335303835363361633438623531613764666435343663373130396339223b733a33323a226263616364303466376662323661353732343736323362366265653563633739223b733a33323a226232643165633339373734303130306665666664643732393263623736616566223b733a33323a223834623566383964623162386232326430643563343838613261333937363139223b733a33323a223835656266373334393365303738663938636363373631343232636232313639223b733a33323a223765353738636662373863313937343131383062626137356165396136623238223b733a33323a226566323062613761346134633062393732306133396233373631393639643935223b733a33323a223335366532346165663165343033393362613633323762343032383938633262223b733a33323a223330386266343638323863366236643234303834373164393234343462313736223b733a33323a223431333863353365633364353132346635643530633761363936316161373962223b733a33323a226234346530623161343166653838626338316233303462333062373530396265223b733a33323a223338663332383961393434636438663934353231303564336563393237616164223b733a33323a226665623635396437666264366537643436333439366633343937663131663134223b733a33323a226262323432636465366537613535633165656133323562306361343339396332223b733a33323a226134316166323264633962323763396565373530663039333636343938643463223b733a33323a226238313337613337363266653934343738313535383936653335313032323965223b733a33323a223432626166663065373665356331633333373931313735353666613338376435223b733a33323a223638636264343663623833333665356237303930383161303462636666333561223b733a33323a226235656262643464363037643039636663636364376265363536316330333534223b733a33323a223064633366623234306230656139646133626563366566326337373161316239223b733a33323a223633613663653937386263653861663436353563376637323437663033343666223b733a33323a223235316161623438336365306261373732353234356539613733363032313935223b733a33323a223262363137626664636463343731386532303339663932373362356436386535223b733a33323a223361613735643634363461323439316432363131666437393333363138313433223b733a33323a226139623436366366613965303666653930323132663761333361336635616363223b733a33323a226338313863316136383031373666653233373764626131303366326465346138223b733a33323a223030623663376630623562623733373037316563653532663634303065366566223b733a33323a223735636365396466646331393866383631316439376565306137636265656363223b733a33323a223035646437666339656239643536346133383763356665643063623564383461223b733a33323a226461663631633334643232353266366566616562393237353631626164306538223b733a33323a223133646436316434646337353738343132326162313132393562383762663463223b733a33323a223030323765393263653232366435303132633935356662393662393363353937223b733a33323a226139663739636433363861656130646166653132313839313136613661626164223b733a33323a226466666465313562613435323631323231656334393366626263316265623961223b733a33323a223137313264323964333035343835326564383436353533653938633065303734223b733a33323a223439616633653062356265613131643032353932383161613264626565356538223b733a33323a223738396639633138666463383830383537386136633231373737376136666661223b733a33323a226539383639333233346139383937653863643834313035373531316337393661223b733a33323a226638306666313839303832646439313733646436633864633035616237353334223b733a33323a226331326537346632636233343633303539313135383663306162393234653633223b733a33323a226464336332613032346637306564626137633331633730636663333531356436223b733a33323a223534306661313735383164373561333362353735643339323264623831633664223b733a33323a223935656430373263313766656661656639636538353632376136373236303662223b733a33323a226432383738383930383963303265343261663765643034386532666563373563223b733a33323a226335616232343963376361636161316663363162626463323565393133303531223b733a33323a223662626135613237653536343561643363333138346330323535316638306332223b733a33323a223038316438613931643931336465623433613064313336326461383531363938223b733a33323a223730366162343839376137373430373762643366393265386363646437373439223b733a33323a223832666564646133363239613635616130393333616364306337653264396631223b733a33323a226634626238663839326531373465376365376135616662323139363834333632223b733a33323a223430383531303739363361353764616366396437393736346465663832333264223b733a33323a223635613731343135636364373463636461303366346634663163393464303533223b733a33323a226137636537616136363637373834353866336666323635616331666664663131223b733a33323a223732666366643763383733646436653039366463336232663637393064663165223b733a33323a226661326436343966613562643533393436336534363261353763643865333238223b7d733a343a2268617368223b733a36353a2266613264363439666135626435333934363365343632613537636438653332382d3732666366643763383733646436653039366463336232663637393064663165223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31303a7b733a33323a226433643163393633376332653666623433346333626631363337366634626333223b733a33323a223233643230303264646637623334386665313562623039386538323936346639223b733a33323a223339653637616338616435333332636363663937663533626330623764383632223b733a33323a226436653361663638306135343463656430313965373634636363653863643639223b733a33323a226266373563656334353534643463383833663137393365393264303764656530223b733a33323a223163303235353937643862333065643566643631323762383064633562663531223b733a33323a223432663662633736333062376635383534333133623733383961313537386337223b733a33323a223739613439306266346662326530653333386138623963636435336464653066223b733a33323a223938616461396434363764353431393264333465373137313364656465323664223b733a33323a223930613165316234636637383234663331303236323739346662623466356539223b733a33323a223239326162363765366465353835656564376530363032623039356530623439223b733a33323a226239373930393362326663393538323834303363613230356461386334396630223b733a33323a223165616561396162383031626562383263373530336561393434343763353165223b733a33323a226336393934636334303961616534396161353161363734616634393363383538223b733a33323a223861333436616636356537646362323636353664353233333033366530343662223b733a33323a223165346239306530656437623264653736363361363336643837616233643237223b733a33323a226631323864376132346635636231383431653731323230313963316436353332223b733a33323a223965353239343839663437376263313863316339623837376365613062633632223b733a33323a223666636637386362663934623163643036636266623166643634626533623165223b733a33323a223031633136663863333330363732363736313166313962643966666635386534223b7d733a343a2268617368223b733a36353a2230316331366638633333303637323637363131663139626439666666353865342d3666636637386362663934623163643036636266623166643634626533623165223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a32383a7b733a33323a226134323434333231653338623263363566356131383039373738393631653631223b733a33323a223362383330613565353664393639613732663031613234626539376134316565223b733a33323a223339303838306133653636393361643837303335316164366239633038326362223b733a33323a226538616436353736366265326437616165363835656361363764353539373231223b733a33323a223564393732393161666139303234653534343264633664303963366364396436223b733a33323a223139646265363233633536336436663932306136653534383730363463333432223b733a33323a223261663931336339333163626330653938633035646533653633613838666166223b733a33323a223332623133303138666638626565373963376533393633306531656431313864223b733a33323a226165363964313536366462616663633366333164623233366534366465613635223b733a33323a223238663931633162316635613966363561323333613937363962616436353565223b733a33323a223031336136653433653931376130616631376466353530366562366666376133223b733a33323a223037303439363435633265313333366564646631636532613161623330393234223b733a33323a226437663430393939386137373231306338366134326665633963313262313862223b733a33323a223932663935613333373666653735653037306338643136663563616662393137223b733a33323a226365656436343764376163646263663063656361643736383263313732323539223b733a33323a223730643238353364393439313664643038343335366636356433373765633632223b733a33323a223737396630313664313237323736386266643836313866383066333830306332223b733a33323a223534313433303563386637613937313862386231613865326664396234373661223b733a33323a226337363239346431316564663761303731376630323131616231373737393337223b733a33323a226531623162363466333439653964393463383835653632623236316534663838223b733a33323a226165316162626163623066306230373638363631346665666432396265323431223b733a33323a223332373731336432393965336138663261366139313137616633313561626531223b733a33323a226639396436633434383563633134343830326435663865303933653033336466223b733a33323a223965656437366564343433333761623134343439333231663538653835343865223b733a33323a223537616339653633383637633664376330623931663233383066396365303634223b733a33323a223064646264306661626434616262343135386536633835366365663137643731223b733a33323a226438323663363665636632633134373137663436636266653337623534633438223b733a33323a223363346264323966396439663463616230326464316431306536303165306461223b733a33323a226663333335383438386365636530656261393134303136373963366162366332223b733a33323a223330643266653266636264346664366666323639356664663238313737323836223b733a33323a223663353337656334383837396639653739383962626266306163646361323663223b733a33323a226233616235313236623939343934316534666236333138303036636463333562223b733a33323a226435613334386335633065383039663465346564633239666661626231343234223b733a33323a226337303732623034653636326666323461393136636466643265353635363630223b733a33323a226265343966346130353463306232316133396662663266333664343065616437223b733a33323a223038373539646261333635343532633239363632303739303065303765613534223b733a33323a223938346237666237633030616666636331373361646365636534393661326563223b733a33323a223631373834323137333033656335393135383638656237323030333762323464223b733a33323a223234333765316635356537663931303863613735333338353532643364643566223b733a33323a226534363661376362373530623035323030343138323966393336316635646535223b733a33323a226132653632306362393161656435643737613437303566373932393166356466223b733a33323a223436653565333465613561643162623164653636313735663331633564333164223b733a33323a223935313438646338346535636633356435316265616661636261386534666439223b733a33323a223664303264363061316534366135333265366530623462643830656135643036223b733a33323a223463316337366461303463316162393839656438663930303464393333666234223b733a33323a223736313361353264666133656236623334323539613666613861336263326234223b733a33323a226638623432633332346365363765366464613436613330623962313735396235223b733a33323a223735343636646133393934363463316439366465353631626131373538353431223b733a33323a223065323630633230386663636135323536306562333264343535393435366637223b733a33323a223132396437306432626564353964646232613864393538346462383865376463223b733a33323a223034373630346431636232353864336136333430383331653534623239393066223b733a33323a226230376137336238383937336430313137363033316666366432376430343365223b733a33323a226134356139313334333631336136353134376264636535333535613631666333223b733a33323a223264336565373032343364333035376239616265386162386530333337343135223b733a33323a223533336636656161653063386364323436313732313436356164323334346363223b733a33323a223732323664623532633532343165663536663062353137663662373434613931223b7d733a343a2268617368223b733a36353a2237323236646235326335323431656635366630623531376636623734346139312d3533336636656161653063386364323436313732313436356164323334346363223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1760868010);

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `id` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`id`, `value`) VALUES
('administrator_email', '\"benakchaihab@gmail.com\"'),
('extension_whitelist', '[\"aac\",\"aif\",\"aiff\",\"asf\",\"asx\",\"avi\",\"bmp\",\"c\",\"cc\",\"class\",\"css\",\"divx\",\"doc\",\"docx\",\"exe\",\"gif\",\"gz\",\"gzip\",\"h\",\"ico\",\"j2k\",\"jp2\",\"jpe\",\"jpeg\",\"jpg\",\"m4a\",\"m4v\",\"mdb\",\"mid\",\"midi\",\"mov\",\"mp2\",\"mp3\",\"mp4\",\"mpa\",\"mpe\",\"mpeg\",\"mpg\",\"mpp\",\"odb\",\"odc\",\"odf\",\"odg\",\"odp\",\"ods\",\"odt\",\"ogg\",\"opus\",\"pdf\",\"png\",\"pot\",\"pps\",\"ppt\",\"pptx\",\"qt\",\"ra\",\"ram\",\"rtf\",\"rtx\",\"swf\",\"tar\",\"tif\",\"tiff\",\"txt\",\"wav\",\"wax\",\"webm\",\"webp\",\"wma\",\"wmv\",\"wmx\",\"wri\",\"xla\",\"xls\",\"xlsx\",\"xlt\",\"xlw\",\"zip\"]'),
('installation_title', '\"Omeka\"'),
('locale', '\"en_US\"'),
('media_type_whitelist', '[\"application\\/msword\",\"application\\/ogg\",\"application\\/pdf\",\"application\\/rtf\",\"application\\/vnd.ms-access\",\"application\\/vnd.ms-excel\",\"application\\/vnd.ms-powerpoint\",\"application\\/vnd.ms-project\",\"application\\/vnd.ms-write\",\"application\\/vnd.oasis.opendocument.chart\",\"application\\/vnd.oasis.opendocument.database\",\"application\\/vnd.oasis.opendocument.formula\",\"application\\/vnd.oasis.opendocument.graphics\",\"application\\/vnd.oasis.opendocument.presentation\",\"application\\/vnd.oasis.opendocument.spreadsheet\",\"application\\/vnd.oasis.opendocument.text\",\"application\\/vnd.openxmlformats-officedocument.wordprocessingml.document\",\"application\\/vnd.openxmlformats-officedocument.presentationml.presentation\",\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.sheet\",\"application\\/x-gzip\",\"application\\/x-ms-wmp\",\"application\\/x-msdownload\",\"application\\/x-shockwave-flash\",\"application\\/x-tar\",\"application\\/zip\",\"audio\\/midi\",\"audio\\/mp4\",\"audio\\/mpeg\",\"audio\\/ogg\",\"audio\\/x-aac\",\"audio\\/x-aiff\",\"audio\\/x-ms-wma\",\"audio\\/x-ms-wax\",\"audio\\/x-realaudio\",\"audio\\/x-wav\",\"image\\/bmp\",\"image\\/gif\",\"image\\/jp2\",\"image\\/jpeg\",\"image\\/pjpeg\",\"image\\/png\",\"image\\/tiff\",\"image\\/webp\",\"image\\/x-icon\",\"text\\/css\",\"text\\/plain\",\"text\\/richtext\",\"video\\/divx\",\"video\\/mp4\",\"video\\/mpeg\",\"video\\/ogg\",\"video\\/quicktime\",\"video\\/webm\",\"video\\/x-ms-asf,\",\"video\\/x-msvideo\",\"video\\/x-ms-wmv\"]'),
('pagination_per_page', '25'),
('time_zone', '\"Europe\\/Paris\"'),
('use_htmlpurifier', '\"1\"'),
('version', '\"4.1.1\"'),
('version_notifications', '\"1\"');

-- --------------------------------------------------------

--
-- Table structure for table `site`
--

CREATE TABLE `site` (
  `id` int NOT NULL,
  `thumbnail_id` int DEFAULT NULL,
  `homepage_id` int DEFAULT NULL,
  `owner_id` int DEFAULT NULL,
  `slug` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `navigation` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  `item_pool` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `assign_new_items` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `site_block_attachment`
--

CREATE TABLE `site_block_attachment` (
  `id` int NOT NULL,
  `block_id` int NOT NULL,
  `item_id` int DEFAULT NULL,
  `media_id` int DEFAULT NULL,
  `caption` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `site_item_set`
--

CREATE TABLE `site_item_set` (
  `id` int NOT NULL,
  `site_id` int NOT NULL,
  `item_set_id` int NOT NULL,
  `position` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `site_page`
--

CREATE TABLE `site_page` (
  `id` int NOT NULL,
  `site_id` int NOT NULL,
  `slug` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_public` tinyint(1) NOT NULL,
  `layout` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `layout_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:json)',
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `site_page_block`
--

CREATE TABLE `site_page_block` (
  `id` int NOT NULL,
  `page_id` int NOT NULL,
  `layout` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  `layout_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:json)',
  `position` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `site_permission`
--

CREATE TABLE `site_permission` (
  `id` int NOT NULL,
  `site_id` int NOT NULL,
  `user_id` int NOT NULL,
  `role` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `site_setting`
--

CREATE TABLE `site_setting` (
  `id` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_id` int NOT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `email` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `password_hash` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `name`, `created`, `modified`, `password_hash`, `role`, `is_active`) VALUES
(1, 'benakchaihab@gmail.com', 'Iheb Chaker', '2025-10-16 16:16:24', '2025-10-16 16:16:24', '$2y$10$2r/LIda6/.imF9nPVsDhVeXtg2/maEbdZqDVQH2cGn3JtoPSO1BK6', 'global_admin', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_setting`
--

CREATE TABLE `user_setting` (
  `id` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_setting`
--

INSERT INTO `user_setting` (`id`, `user_id`, `value`) VALUES
('csv_import_automap_check_names_alone', 1, 'true'),
('csv_import_delimiter', 1, '\",\"'),
('csv_import_enclosure', 1, '\"\\\"\"'),
('csv_import_global_language', 1, '\"\"'),
('csv_import_identifier_property', 1, '\"\"'),
('csv_import_multivalue_separator', 1, '\";\"'),
('csv_import_rows_by_batch', 1, '20');

-- --------------------------------------------------------

--
-- Table structure for table `value`
--

CREATE TABLE `value` (
  `id` int NOT NULL,
  `resource_id` int NOT NULL,
  `property_id` int NOT NULL,
  `value_resource_id` int DEFAULT NULL,
  `value_annotation_id` int DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `uri` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_public` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `value`
--

INSERT INTO `value` (`id`, `resource_id`, `property_id`, `value_resource_id`, `value_annotation_id`, `type`, `lang`, `value`, `uri`, `is_public`) VALUES
(295, 80, 1, NULL, NULL, 'literal', NULL, 'Alice Smith', NULL, 1),
(296, 80, 210, NULL, NULL, 'literal', NULL, 'Alice', NULL, 1),
(297, 80, 211, NULL, NULL, 'literal', NULL, 'Smith', NULL, 1),
(298, 80, 212, NULL, NULL, 'literal', NULL, 'alice.smith@example.com', NULL, 1),
(299, 80, 213, NULL, NULL, 'literal', NULL, 'pass1234', NULL, 1),
(300, 81, 1, NULL, NULL, 'literal', NULL, 'Bob Johnson', NULL, 1),
(301, 81, 210, NULL, NULL, 'literal', NULL, 'Bob', NULL, 1),
(302, 81, 211, NULL, NULL, 'literal', NULL, 'Johnson', NULL, 1),
(303, 81, 212, NULL, NULL, 'literal', NULL, 'bob.johnson@example.com', NULL, 1),
(304, 81, 213, NULL, NULL, 'literal', NULL, 'securepass', NULL, 1),
(305, 82, 1, NULL, NULL, 'literal', NULL, 'Charlie Brown', NULL, 1),
(306, 82, 210, NULL, NULL, 'literal', NULL, 'Charlie', NULL, 1),
(307, 82, 211, NULL, NULL, 'literal', NULL, 'Brown', NULL, 1),
(308, 82, 212, NULL, NULL, 'literal', NULL, 'charlie.brown@example.com', NULL, 1),
(309, 82, 213, NULL, NULL, 'literal', NULL, 'helloWorld', NULL, 1),
(310, 83, 1, NULL, NULL, 'literal', NULL, 'Diana Evans', NULL, 1),
(311, 83, 210, NULL, NULL, 'literal', NULL, 'Diana', NULL, 1),
(312, 83, 211, NULL, NULL, 'literal', NULL, 'Evans', NULL, 1),
(313, 83, 212, NULL, NULL, 'literal', NULL, 'diana.evans@example.com', NULL, 1),
(314, 83, 213, NULL, NULL, 'literal', NULL, 'myPassword', NULL, 1),
(315, 84, 1, NULL, NULL, 'literal', NULL, 'Ethan Lee', NULL, 1),
(316, 84, 210, NULL, NULL, 'literal', NULL, 'Ethan', NULL, 1),
(317, 84, 211, NULL, NULL, 'literal', NULL, 'Lee', NULL, 1),
(318, 84, 212, NULL, NULL, 'literal', NULL, 'ethan.lee@example.com', NULL, 1),
(319, 84, 213, NULL, NULL, 'literal', NULL, 'letmein', NULL, 1),
(320, 85, 214, NULL, NULL, 'literal', NULL, 'Tomato', NULL, 1),
(321, 85, 225, NULL, NULL, 'literal', NULL, 'Calories: 18, Carbs: 3.9g, Protein: 0.9g', NULL, 1),
(322, 85, 226, NULL, NULL, 'literal', NULL, 'true', NULL, 1),
(323, 86, 214, NULL, NULL, 'literal', NULL, 'Olive Oil', NULL, 1),
(324, 86, 225, NULL, NULL, 'literal', NULL, 'Calories: 119, Fat: 13.5g, Carbs: 0g', NULL, 1),
(325, 86, 226, NULL, NULL, 'literal', NULL, 'true', NULL, 1),
(326, 87, 214, NULL, NULL, 'literal', NULL, 'Sugar', NULL, 1),
(327, 87, 225, NULL, NULL, 'literal', NULL, 'Calories: 387, Carbs: 100g, Protein: 0g', NULL, 1),
(328, 87, 226, NULL, NULL, 'literal', NULL, 'false', NULL, 1),
(329, 88, 214, NULL, NULL, 'literal', NULL, 'Chicken Breast', NULL, 1),
(330, 88, 225, NULL, NULL, 'literal', NULL, 'Calories: 165, Protein: 31g, Fat: 3.6g', NULL, 1),
(331, 88, 226, NULL, NULL, 'literal', NULL, 'true', NULL, 1),
(332, 89, 214, NULL, NULL, 'literal', NULL, 'Butter', NULL, 1),
(333, 89, 225, NULL, NULL, 'literal', NULL, 'Calories: 717, Fat: 81g, Carbs: 0.1g', NULL, 1),
(334, 89, 226, NULL, NULL, 'literal', NULL, 'false', NULL, 1),
(335, 90, 214, NULL, NULL, 'literal', NULL, 'Facebook', NULL, 1),
(336, 90, 216, NULL, NULL, 'literal', NULL, 'https://example.com/facebook-logo.png', NULL, 1),
(337, 90, 215, NULL, NULL, 'literal', NULL, 'https://facebook.com/example', NULL, 1),
(338, 91, 214, NULL, NULL, 'literal', NULL, 'Twitter', NULL, 1),
(339, 91, 216, NULL, NULL, 'literal', NULL, 'https://example.com/twitter-logo.png', NULL, 1),
(340, 91, 215, NULL, NULL, 'literal', NULL, 'https://twitter.com/example', NULL, 1),
(341, 92, 214, NULL, NULL, 'literal', NULL, 'Instagram', NULL, 1),
(342, 92, 216, NULL, NULL, 'literal', NULL, 'https://example.com/instagram-logo.png', NULL, 1),
(343, 92, 215, NULL, NULL, 'literal', NULL, 'https://instagram.com/example', NULL, 1),
(344, 93, 214, NULL, NULL, 'literal', NULL, 'LinkedIn', NULL, 1),
(345, 93, 216, NULL, NULL, 'literal', NULL, 'https://example.com/linkedin-logo.png', NULL, 1),
(346, 93, 215, NULL, NULL, 'literal', NULL, 'https://linkedin.com/company/example', NULL, 1),
(347, 94, 214, NULL, NULL, 'literal', NULL, 'YouTube', NULL, 1),
(348, 94, 216, NULL, NULL, 'literal', NULL, 'https://example.com/youtube-logo.png', NULL, 1),
(349, 94, 215, NULL, NULL, 'literal', NULL, 'https://youtube.com/example', NULL, 1),
(410, 115, 235, NULL, NULL, 'literal', NULL, 'How to Make Tomato Sauce', NULL, 1),
(411, 115, 234, NULL, NULL, 'literal', NULL, 'A step-by-step guide to making fresh tomato sauce.', NULL, 1),
(412, 115, 223, 84, NULL, 'resource', NULL, NULL, NULL, 1),
(413, 116, 235, NULL, NULL, 'literal', NULL, 'Benefits of Olive Oil', NULL, 1),
(414, 116, 234, NULL, NULL, 'literal', NULL, 'Discover the health benefits of using olive oil in your recipes.', NULL, 1),
(415, 116, 223, 83, NULL, 'resource', NULL, NULL, NULL, 1),
(416, 117, 235, NULL, NULL, 'literal', NULL, 'Chicken Breast Recipes', NULL, 1),
(417, 117, 234, NULL, NULL, 'literal', NULL, 'Delicious and healthy chicken breast recipes for any occasion.', NULL, 1),
(418, 117, 223, 80, NULL, 'resource', NULL, NULL, NULL, 1),
(419, 118, 235, NULL, NULL, 'literal', NULL, 'Sugar Alternatives', NULL, 1),
(420, 118, 234, NULL, NULL, 'literal', NULL, 'Exploring healthier alternatives to sugar in cooking.', NULL, 1),
(421, 118, 223, 81, NULL, 'resource', NULL, NULL, NULL, 1),
(422, 119, 235, NULL, NULL, 'literal', NULL, 'Butter vs. Margarine', NULL, 1),
(423, 119, 234, NULL, NULL, 'literal', NULL, 'A comparison of butter and margarine for baking.', NULL, 1),
(424, 119, 223, 84, NULL, 'resource', NULL, NULL, NULL, 1),
(625, 140, 214, NULL, NULL, 'literal', NULL, 'Classic Tomato Sauce', NULL, 1),
(626, 140, 234, NULL, NULL, 'literal', NULL, 'A simple and delicious tomato sauce for pasta.', NULL, 1),
(627, 140, 217, NULL, NULL, 'literal', NULL, 'https://example.com/images/tomato_sauce.jpg', NULL, 1),
(628, 140, 224, 85, NULL, 'resource', NULL, NULL, NULL, 1),
(629, 140, 224, 86, NULL, 'resource', NULL, NULL, NULL, 1),
(630, 140, 220, NULL, NULL, 'literal', NULL, '10 min', NULL, 1),
(631, 140, 219, NULL, NULL, 'literal', NULL, '30 min', NULL, 1),
(632, 140, 218, NULL, NULL, 'literal', NULL, 'Chop tomatoes; Cook with garlic and olive oil; Simmer; Season.', NULL, 1),
(633, 140, 221, NULL, NULL, 'literal', NULL, '120', NULL, 1),
(634, 140, 222, NULL, NULL, 'literal', NULL, 'Easy', NULL, 1),
(635, 140, 223, 85, NULL, 'resource', NULL, NULL, NULL, 1),
(636, 141, 214, NULL, NULL, 'literal', NULL, 'Grilled Chicken Breast', NULL, 1),
(637, 141, 234, NULL, NULL, 'literal', NULL, 'Juicy grilled chicken breast with herbs.', NULL, 1),
(638, 141, 217, NULL, NULL, 'literal', NULL, 'https://example.com/images/grilled_chicken.jpg', NULL, 1),
(639, 141, 224, 87, NULL, 'resource', NULL, NULL, NULL, 1),
(640, 141, 220, NULL, NULL, 'literal', NULL, '15 min', NULL, 1),
(641, 141, 219, NULL, NULL, 'literal', NULL, '20 min', NULL, 1),
(642, 141, 218, NULL, NULL, 'literal', NULL, 'Marinate chicken; Preheat grill; Grill chicken; Rest and serve.', NULL, 1),
(643, 141, 221, NULL, NULL, 'literal', NULL, '220', NULL, 1),
(644, 141, 222, NULL, NULL, 'literal', NULL, 'Medium', NULL, 1),
(645, 141, 223, 86, NULL, 'resource', NULL, NULL, NULL, 1),
(646, 142, 214, NULL, NULL, 'literal', NULL, 'Vegetable Stir Fry', NULL, 1),
(647, 142, 234, NULL, NULL, 'literal', NULL, 'Colorful vegetables stir-fried in olive oil.', NULL, 1),
(648, 142, 217, NULL, NULL, 'literal', NULL, 'https://example.com/images/veggie_stirfry.jpg', NULL, 1),
(649, 142, 224, 88, NULL, 'resource', NULL, NULL, NULL, 1),
(650, 142, 224, 89, NULL, 'resource', NULL, NULL, NULL, 1),
(651, 142, 224, 85, NULL, 'resource', NULL, NULL, NULL, 1),
(652, 142, 220, NULL, NULL, 'literal', NULL, '10 min', NULL, 1),
(653, 142, 219, NULL, NULL, 'literal', NULL, '10 min', NULL, 1),
(654, 142, 218, NULL, NULL, 'literal', NULL, 'Chop vegetables; Heat oil; Stir fry; Add sauce.', NULL, 1),
(655, 142, 221, NULL, NULL, 'literal', NULL, '180', NULL, 1),
(656, 142, 222, NULL, NULL, 'literal', NULL, 'Easy', NULL, 1),
(657, 142, 223, 87, NULL, 'resource', NULL, NULL, NULL, 1),
(658, 143, 214, NULL, NULL, 'literal', NULL, 'Chocolate Cake', NULL, 1),
(659, 143, 234, NULL, NULL, 'literal', NULL, 'Rich and moist chocolate cake.', NULL, 1),
(660, 143, 217, NULL, NULL, 'literal', NULL, 'https://example.com/images/chocolate_cake.jpg', NULL, 1),
(661, 143, 224, 86, NULL, 'resource', NULL, NULL, NULL, 1),
(662, 143, 224, 87, NULL, 'resource', NULL, NULL, NULL, 1),
(663, 143, 224, 88, NULL, 'resource', NULL, NULL, NULL, 1),
(664, 143, 220, NULL, NULL, 'literal', NULL, '20 min', NULL, 1),
(665, 143, 219, NULL, NULL, 'literal', NULL, '35 min', NULL, 1),
(666, 143, 218, NULL, NULL, 'literal', NULL, 'Mix ingredients; Bake; Cool; Frost.', NULL, 1),
(667, 143, 221, NULL, NULL, 'literal', NULL, '350', NULL, 1),
(668, 143, 222, NULL, NULL, 'literal', NULL, 'Hard', NULL, 1),
(669, 143, 223, 88, NULL, 'resource', NULL, NULL, NULL, 1),
(670, 144, 214, NULL, NULL, 'literal', NULL, 'Caesar Salad', NULL, 1),
(671, 144, 234, NULL, NULL, 'literal', NULL, 'Fresh Caesar salad with homemade dressing.', NULL, 1),
(672, 144, 217, NULL, NULL, 'literal', NULL, 'https://example.com/images/caesar_salad.jpg', NULL, 1),
(673, 144, 224, 89, NULL, 'resource', NULL, NULL, NULL, 1),
(674, 144, 224, 85, NULL, 'resource', NULL, NULL, NULL, 1),
(675, 144, 220, NULL, NULL, 'literal', NULL, '15 min', NULL, 1),
(676, 144, 219, NULL, NULL, 'literal', NULL, '0 min', NULL, 1),
(677, 144, 218, NULL, NULL, 'literal', NULL, 'Prepare lettuce; Make dressing; Toss; Add croutons.', NULL, 1),
(678, 144, 221, NULL, NULL, 'literal', NULL, '150', NULL, 1),
(679, 144, 222, NULL, NULL, 'literal', NULL, 'Easy', NULL, 1),
(680, 144, 223, 89, NULL, 'resource', NULL, NULL, NULL, 1),
(681, 145, 229, NULL, NULL, 'literal', NULL, '5', NULL, 1),
(682, 145, 227, 80, NULL, 'resource', NULL, NULL, NULL, 1),
(683, 145, 228, 140, NULL, 'resource', NULL, NULL, NULL, 1),
(684, 146, 229, NULL, NULL, 'literal', NULL, '4', NULL, 1),
(685, 146, 227, 81, NULL, 'resource', NULL, NULL, NULL, 1),
(686, 146, 228, 141, NULL, 'resource', NULL, NULL, NULL, 1),
(687, 147, 229, NULL, NULL, 'literal', NULL, '3', NULL, 1),
(688, 147, 227, 82, NULL, 'resource', NULL, NULL, NULL, 1),
(689, 147, 228, 142, NULL, 'resource', NULL, NULL, NULL, 1),
(690, 148, 229, NULL, NULL, 'literal', NULL, '2', NULL, 1),
(691, 148, 227, 83, NULL, 'resource', NULL, NULL, NULL, 1),
(692, 148, 228, 143, NULL, 'resource', NULL, NULL, NULL, 1),
(693, 149, 229, NULL, NULL, 'literal', NULL, '1', NULL, 1),
(694, 149, 227, 84, NULL, 'resource', NULL, NULL, NULL, 1),
(695, 149, 228, 144, NULL, 'resource', NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `value_annotation`
--

CREATE TABLE `value_annotation` (
  `id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vocabulary`
--

CREATE TABLE `vocabulary` (
  `id` int NOT NULL,
  `owner_id` int DEFAULT NULL,
  `namespace_uri` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vocabulary`
--

INSERT INTO `vocabulary` (`id`, `owner_id`, `namespace_uri`, `prefix`, `label`, `comment`) VALUES
(1, NULL, 'http://purl.org/dc/terms/', 'dcterms', 'Dublin Core', 'Basic resource metadata (DCMI Metadata Terms)'),
(2, NULL, 'http://purl.org/dc/dcmitype/', 'dctype', 'Dublin Core Type', 'Basic resource types (DCMI Type Vocabulary)'),
(3, NULL, 'http://purl.org/ontology/bibo/', 'bibo', 'Bibliographic Ontology', 'Bibliographic metadata (BIBO)'),
(4, NULL, 'http://xmlns.com/foaf/0.1/', 'foaf', 'Friend of a Friend', 'Relationships between people and organizations (FOAF)'),
(5, 1, 'https://jardindesconnaissances.univ-paris8.fr/onto/jdc#', 'jdc', 'JDC', ''),
(6, 1, 'https://github.com/ihabChaker/KitchenExchange#', 'ke', 'Kitchen Exchange Vocab', 'Basic Kitchen Exchange vocab for describing the necessary items');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `api_key`
--
ALTER TABLE `api_key`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_C912ED9D7E3C61F9` (`owner_id`);

--
-- Indexes for table `asset`
--
ALTER TABLE `asset`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_2AF5A5C5CC5DB90` (`storage_id`),
  ADD KEY `IDX_2AF5A5C7E3C61F9` (`owner_id`);

--
-- Indexes for table `csvimport_entity`
--
ALTER TABLE `csvimport_entity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_84D382F4BE04EA9` (`job_id`);

--
-- Indexes for table `csvimport_import`
--
ALTER TABLE `csvimport_import`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_17B50881BE04EA9` (`job_id`),
  ADD UNIQUE KEY `UNIQ_17B508814C276F75` (`undo_job_id`);

--
-- Indexes for table `fulltext_search`
--
ALTER TABLE `fulltext_search`
  ADD PRIMARY KEY (`id`,`resource`),
  ADD KEY `IDX_AA31FE4A7E3C61F9` (`owner_id`);
ALTER TABLE `fulltext_search` ADD FULLTEXT KEY `IDX_AA31FE4A2B36786B3B8BA7C7` (`title`,`text`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_1F1B251ECBE0B084` (`primary_media_id`);

--
-- Indexes for table `item_item_set`
--
ALTER TABLE `item_item_set`
  ADD PRIMARY KEY (`item_id`,`item_set_id`),
  ADD KEY `IDX_6D0C9625126F525E` (`item_id`),
  ADD KEY `IDX_6D0C9625960278D7` (`item_set_id`);

--
-- Indexes for table `item_set`
--
ALTER TABLE `item_set`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_site`
--
ALTER TABLE `item_site`
  ADD PRIMARY KEY (`item_id`,`site_id`),
  ADD KEY `IDX_A1734D1F126F525E` (`item_id`),
  ADD KEY `IDX_A1734D1FF6BD1646` (`site_id`);

--
-- Indexes for table `job`
--
ALTER TABLE `job`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_FBD8E0F87E3C61F9` (`owner_id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_6A2CA10C5CC5DB90` (`storage_id`),
  ADD KEY `IDX_6A2CA10C126F525E` (`item_id`),
  ADD KEY `item_position` (`item_id`,`position`);

--
-- Indexes for table `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `module`
--
ALTER TABLE `module`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_creation`
--
ALTER TABLE `password_creation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_C77917B4A76ED395` (`user_id`);

--
-- Indexes for table `property`
--
ALTER TABLE `property`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8BF21CDEAD0E05F6623C14D5` (`vocabulary_id`,`local_name`),
  ADD KEY `IDX_8BF21CDE7E3C61F9` (`owner_id`),
  ADD KEY `IDX_8BF21CDEAD0E05F6` (`vocabulary_id`);

--
-- Indexes for table `resource`
--
ALTER TABLE `resource`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_BC91F4167E3C61F9` (`owner_id`),
  ADD KEY `IDX_BC91F416448CC1BD` (`resource_class_id`),
  ADD KEY `IDX_BC91F41616131EA` (`resource_template_id`),
  ADD KEY `IDX_BC91F416FDFF2E92` (`thumbnail_id`),
  ADD KEY `title` (`title`(190)),
  ADD KEY `is_public` (`is_public`);

--
-- Indexes for table `resource_class`
--
ALTER TABLE `resource_class`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_C6F063ADAD0E05F6623C14D5` (`vocabulary_id`,`local_name`),
  ADD KEY `IDX_C6F063AD7E3C61F9` (`owner_id`),
  ADD KEY `IDX_C6F063ADAD0E05F6` (`vocabulary_id`);

--
-- Indexes for table `resource_template`
--
ALTER TABLE `resource_template`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_39ECD52EEA750E8` (`label`),
  ADD KEY `IDX_39ECD52E7E3C61F9` (`owner_id`),
  ADD KEY `IDX_39ECD52E448CC1BD` (`resource_class_id`),
  ADD KEY `IDX_39ECD52E724734A3` (`title_property_id`),
  ADD KEY `IDX_39ECD52EB84E0D1D` (`description_property_id`);

--
-- Indexes for table `resource_template_property`
--
ALTER TABLE `resource_template_property`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_4689E2F116131EA549213EC` (`resource_template_id`,`property_id`),
  ADD KEY `IDX_4689E2F116131EA` (`resource_template_id`),
  ADD KEY `IDX_4689E2F1549213EC` (`property_id`);

--
-- Indexes for table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `site`
--
ALTER TABLE `site`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_694309E4989D9B62` (`slug`),
  ADD UNIQUE KEY `UNIQ_694309E4571EDDA` (`homepage_id`),
  ADD KEY `IDX_694309E4FDFF2E92` (`thumbnail_id`),
  ADD KEY `IDX_694309E47E3C61F9` (`owner_id`);

--
-- Indexes for table `site_block_attachment`
--
ALTER TABLE `site_block_attachment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_236473FEE9ED820C` (`block_id`),
  ADD KEY `IDX_236473FE126F525E` (`item_id`),
  ADD KEY `IDX_236473FEEA9FDD75` (`media_id`),
  ADD KEY `block_position` (`block_id`,`position`);

--
-- Indexes for table `site_item_set`
--
ALTER TABLE `site_item_set`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_D4CE134F6BD1646960278D7` (`site_id`,`item_set_id`),
  ADD KEY `IDX_D4CE134F6BD1646` (`site_id`),
  ADD KEY `IDX_D4CE134960278D7` (`item_set_id`),
  ADD KEY `position` (`position`);

--
-- Indexes for table `site_page`
--
ALTER TABLE `site_page`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_2F900BD9F6BD1646989D9B62` (`site_id`,`slug`),
  ADD KEY `is_public` (`is_public`),
  ADD KEY `IDX_2F900BD9F6BD1646` (`site_id`);

--
-- Indexes for table `site_page_block`
--
ALTER TABLE `site_page_block`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_C593E731C4663E4` (`page_id`),
  ADD KEY `page_position` (`page_id`,`position`);

--
-- Indexes for table `site_permission`
--
ALTER TABLE `site_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_C0401D6FF6BD1646A76ED395` (`site_id`,`user_id`),
  ADD KEY `IDX_C0401D6FF6BD1646` (`site_id`),
  ADD KEY `IDX_C0401D6FA76ED395` (`user_id`);

--
-- Indexes for table `site_setting`
--
ALTER TABLE `site_setting`
  ADD PRIMARY KEY (`id`,`site_id`),
  ADD KEY `IDX_64D05A53F6BD1646` (`site_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- Indexes for table `user_setting`
--
ALTER TABLE `user_setting`
  ADD PRIMARY KEY (`id`,`user_id`),
  ADD KEY `IDX_C779A692A76ED395` (`user_id`);

--
-- Indexes for table `value`
--
ALTER TABLE `value`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_1D7758349B66727E` (`value_annotation_id`),
  ADD KEY `IDX_1D77583489329D25` (`resource_id`),
  ADD KEY `IDX_1D775834549213EC` (`property_id`),
  ADD KEY `IDX_1D7758344BC72506` (`value_resource_id`),
  ADD KEY `value` (`value`(190)),
  ADD KEY `uri` (`uri`(190)),
  ADD KEY `is_public` (`is_public`);

--
-- Indexes for table `value_annotation`
--
ALTER TABLE `value_annotation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vocabulary`
--
ALTER TABLE `vocabulary`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_9099C97B9B267FDF` (`namespace_uri`),
  ADD UNIQUE KEY `UNIQ_9099C97B93B1868E` (`prefix`),
  ADD KEY `IDX_9099C97B7E3C61F9` (`owner_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `asset`
--
ALTER TABLE `asset`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `csvimport_entity`
--
ALTER TABLE `csvimport_entity`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;

--
-- AUTO_INCREMENT for table `csvimport_import`
--
ALTER TABLE `csvimport_import`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `job`
--
ALTER TABLE `job`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `property`
--
ALTER TABLE `property`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=236;

--
-- AUTO_INCREMENT for table `resource`
--
ALTER TABLE `resource`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=150;

--
-- AUTO_INCREMENT for table `resource_class`
--
ALTER TABLE `resource_class`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- AUTO_INCREMENT for table `resource_template`
--
ALTER TABLE `resource_template`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `resource_template_property`
--
ALTER TABLE `resource_template_property`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `site`
--
ALTER TABLE `site`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `site_block_attachment`
--
ALTER TABLE `site_block_attachment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `site_item_set`
--
ALTER TABLE `site_item_set`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `site_page`
--
ALTER TABLE `site_page`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `site_page_block`
--
ALTER TABLE `site_page_block`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `site_permission`
--
ALTER TABLE `site_permission`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `value`
--
ALTER TABLE `value`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=696;

--
-- AUTO_INCREMENT for table `vocabulary`
--
ALTER TABLE `vocabulary`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `api_key`
--
ALTER TABLE `api_key`
  ADD CONSTRAINT `FK_C912ED9D7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `asset`
--
ALTER TABLE `asset`
  ADD CONSTRAINT `FK_2AF5A5C7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `csvimport_entity`
--
ALTER TABLE `csvimport_entity`
  ADD CONSTRAINT `FK_84D382F4BE04EA9` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`);

--
-- Constraints for table `csvimport_import`
--
ALTER TABLE `csvimport_import`
  ADD CONSTRAINT `FK_17B508814C276F75` FOREIGN KEY (`undo_job_id`) REFERENCES `job` (`id`),
  ADD CONSTRAINT `FK_17B50881BE04EA9` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`);

--
-- Constraints for table `fulltext_search`
--
ALTER TABLE `fulltext_search`
  ADD CONSTRAINT `FK_AA31FE4A7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `FK_1F1B251EBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1F1B251ECBE0B084` FOREIGN KEY (`primary_media_id`) REFERENCES `media` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `item_item_set`
--
ALTER TABLE `item_item_set`
  ADD CONSTRAINT `FK_6D0C9625126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_6D0C9625960278D7` FOREIGN KEY (`item_set_id`) REFERENCES `item_set` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `item_set`
--
ALTER TABLE `item_set`
  ADD CONSTRAINT `FK_1015EEEBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `item_site`
--
ALTER TABLE `item_site`
  ADD CONSTRAINT `FK_A1734D1F126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_A1734D1FF6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `job`
--
ALTER TABLE `job`
  ADD CONSTRAINT `FK_FBD8E0F87E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `FK_6A2CA10C126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`),
  ADD CONSTRAINT `FK_6A2CA10CBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `password_creation`
--
ALTER TABLE `password_creation`
  ADD CONSTRAINT `FK_C77917B4A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `property`
--
ALTER TABLE `property`
  ADD CONSTRAINT `FK_8BF21CDE7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_8BF21CDEAD0E05F6` FOREIGN KEY (`vocabulary_id`) REFERENCES `vocabulary` (`id`);

--
-- Constraints for table `resource`
--
ALTER TABLE `resource`
  ADD CONSTRAINT `FK_BC91F41616131EA` FOREIGN KEY (`resource_template_id`) REFERENCES `resource_template` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F416448CC1BD` FOREIGN KEY (`resource_class_id`) REFERENCES `resource_class` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F4167E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F416FDFF2E92` FOREIGN KEY (`thumbnail_id`) REFERENCES `asset` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `resource_class`
--
ALTER TABLE `resource_class`
  ADD CONSTRAINT `FK_C6F063AD7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_C6F063ADAD0E05F6` FOREIGN KEY (`vocabulary_id`) REFERENCES `vocabulary` (`id`);

--
-- Constraints for table `resource_template`
--
ALTER TABLE `resource_template`
  ADD CONSTRAINT `FK_39ECD52E448CC1BD` FOREIGN KEY (`resource_class_id`) REFERENCES `resource_class` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_39ECD52E724734A3` FOREIGN KEY (`title_property_id`) REFERENCES `property` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_39ECD52E7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_39ECD52EB84E0D1D` FOREIGN KEY (`description_property_id`) REFERENCES `property` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `resource_template_property`
--
ALTER TABLE `resource_template_property`
  ADD CONSTRAINT `FK_4689E2F116131EA` FOREIGN KEY (`resource_template_id`) REFERENCES `resource_template` (`id`),
  ADD CONSTRAINT `FK_4689E2F1549213EC` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `site`
--
ALTER TABLE `site`
  ADD CONSTRAINT `FK_694309E4571EDDA` FOREIGN KEY (`homepage_id`) REFERENCES `site_page` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_694309E47E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_694309E4FDFF2E92` FOREIGN KEY (`thumbnail_id`) REFERENCES `asset` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `site_block_attachment`
--
ALTER TABLE `site_block_attachment`
  ADD CONSTRAINT `FK_236473FE126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_236473FEE9ED820C` FOREIGN KEY (`block_id`) REFERENCES `site_page_block` (`id`),
  ADD CONSTRAINT `FK_236473FEEA9FDD75` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `site_item_set`
--
ALTER TABLE `site_item_set`
  ADD CONSTRAINT `FK_D4CE134960278D7` FOREIGN KEY (`item_set_id`) REFERENCES `item_set` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_D4CE134F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `site_page`
--
ALTER TABLE `site_page`
  ADD CONSTRAINT `FK_2F900BD9F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`);

--
-- Constraints for table `site_page_block`
--
ALTER TABLE `site_page_block`
  ADD CONSTRAINT `FK_C593E731C4663E4` FOREIGN KEY (`page_id`) REFERENCES `site_page` (`id`);

--
-- Constraints for table `site_permission`
--
ALTER TABLE `site_permission`
  ADD CONSTRAINT `FK_C0401D6FA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_C0401D6FF6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `site_setting`
--
ALTER TABLE `site_setting`
  ADD CONSTRAINT `FK_64D05A53F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_setting`
--
ALTER TABLE `user_setting`
  ADD CONSTRAINT `FK_C779A692A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `value`
--
ALTER TABLE `value`
  ADD CONSTRAINT `FK_1D7758344BC72506` FOREIGN KEY (`value_resource_id`) REFERENCES `resource` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1D775834549213EC` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1D77583489329D25` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`),
  ADD CONSTRAINT `FK_1D7758349B66727E` FOREIGN KEY (`value_annotation_id`) REFERENCES `value_annotation` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `value_annotation`
--
ALTER TABLE `value_annotation`
  ADD CONSTRAINT `FK_C03BA4EBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vocabulary`
--
ALTER TABLE `vocabulary`
  ADD CONSTRAINT `FK_9099C97B7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
