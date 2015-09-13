-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 09, 2015 at 01:38 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `gradesystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `password` text COLLATE utf8_unicode_ci NOT NULL,
  `birth_date` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `mail` text COLLATE utf8_unicode_ci NOT NULL,
  `phone` text COLLATE utf8_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `type` text COLLATE utf8_unicode_ci NOT NULL,
  `profile_image` text COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `address`, `password`, `birth_date`, `mail`, `phone`, `date`, `type`, `profile_image`, `remember_token`) VALUES
(2, 'Hassan Alaa', 'djklgjdfj', '$2y$10$pFUR0MKBg.B1IrpEg1Y/cObz0.6mTS0J8MxpHH/z/Nt995itPlXQu', '05/04/2015', 'sapan5221@gmail.com', '21312391309jj', '0000-00-00 00:00:00', 'Administrator', '5aesWf_aiden_pearce-1366x768.jpg', 'Eo8CAY38hJkpztp6iQqPw14HbAnQXdk4fbJCqQePxoPHKomzREB4Ll7CffQE'),
(3, 'll', 'd', '$2y$10$tg1y/LBs3h5oLKbTe5qjQ.NzriSkJHMTcOfyhQAOf/g.44S2V0LCa', '05/11/2015', 'hossatroy@yahoo.comd', '13212d', '0000-00-00 00:00:00', '', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `assignments`
--

CREATE TABLE IF NOT EXISTS `assignments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) unsigned NOT NULL,
  `course_id` int(10) unsigned NOT NULL,
  `sub_teacher_id` int(10) unsigned NOT NULL,
  `class_assignment` text COLLATE utf8_unicode_ci NOT NULL,
  `student_assignment` text COLLATE utf8_unicode_ci NOT NULL,
  `deadline_day` date NOT NULL,
  `deadline_time` time NOT NULL,
  `assignment_grade` double NOT NULL,
  `student_grade` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `assignments_student_id_foreign` (`student_id`),
  KEY `assignments_course_id_foreign` (`course_id`),
  KEY `assignments_sub_teacher_id_foreign` (`sub_teacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `text` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `author` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=15 ;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `text`, `author`, `created_at`, `updated_at`) VALUES
(1, '123', 'ghk', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, '55555', 'hossam', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, '13', 'sdfsd', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, '123', 'fdg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'gfhjfghj', 'fgh', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'ghfj', 'fghj', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, '123', 'klj;', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, '123', 'ljk;', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, '123', 'fgh', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 'ghjgfhj', 'ghfjgfhj', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 'cxv', 'cvx', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, '123', 'sdf', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 'sssss', 'ssssss', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, '12', 'sdf', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE IF NOT EXISTS `course` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `department` int(10) unsigned NOT NULL,
  `course_code` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `hours` int(10) unsigned NOT NULL,
  `course_type` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course_department_foreign` (`department`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=20 ;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`id`, `name`, `department`, `course_code`, `date`, `hours`, `course_type`) VALUES
(1, 'internet application', 1, '123', '0000-00-00 00:00:00', 3, 'Yes'),
(2, 'information system', 1, '124', '0000-00-00 00:00:00', 3, 'Yes'),
(3, 'hossamm', 1, '123', '0000-00-00 00:00:00', 2, 'Yes'),
(4, 'hossamm', 1, '213', '0000-00-00 00:00:00', 2, 'Yes'),
(5, 'hossamm', 1, '23', '0000-00-00 00:00:00', 2, 'Yes'),
(6, 'hossamm', 1, '321', '0000-00-00 00:00:00', 2, 'Yes'),
(9, 'hossamm', 1, '32', '0000-00-00 00:00:00', 2, 'Yes'),
(10, 'asd', 1, '123', '0000-00-00 00:00:00', 2, 'Yes'),
(11, 'hossamm', 1, '123', '0000-00-00 00:00:00', 2, 'Yes'),
(12, 'asd', 1, '23', '0000-00-00 00:00:00', 2, 'Yes'),
(13, 'hossamm', 1, '123', '0000-00-00 00:00:00', 2, 'Yes'),
(14, 'hossamm', 1, '234', '0000-00-00 00:00:00', 2, 'No'),
(15, 'hossamm', 1, '213', '0000-00-00 00:00:00', 2, 'Yes'),
(16, 'computer scince', 2, '789', '0000-00-00 00:00:00', 2, 'Yes'),
(17, 'adasdsdas', 2, '165', '0000-00-00 00:00:00', 2, 'Yes'),
(18, 'kkk', 2, '546', '0000-00-00 00:00:00', 3, 'Yes'),
(19, 'computer org', 2, '22', '0000-00-00 00:00:00', 2, 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `course_fields`
--

CREATE TABLE IF NOT EXISTS `course_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` int(10) unsigned NOT NULL,
  `field_id` int(10) unsigned NOT NULL,
  `value` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `course_fields_field_id_foreign` (`field_id`),
  KEY `course_fields_course_id_foreign` (`course_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=57 ;

--
-- Dumping data for table `course_fields`
--

INSERT INTO `course_fields` (`id`, `course_id`, `field_id`, `value`, `created_at`, `updated_at`) VALUES
(47, 2, 1, '123', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, 5, 1, '12', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(49, 9, 1, '12', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, 17, 1, '12', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, 18, 1, '12', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, 13, 1, '123', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, 13, 1, '3', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, 19, 2, '123', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE IF NOT EXISTS `department` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `shortcut_of_department` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=12 ;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `name`, `shortcut_of_department`, `date`) VALUES
(1, 'information system', 'CS', '0000-00-00 00:00:00'),
(2, 'computer scince', 'IS', '0000-00-00 00:00:00'),
(3, 'computer-bb', 'dsjfskdf', '0000-00-00 00:00:00'),
(4, 'll', 'df', '0000-00-00 00:00:00'),
(5, 'gjh', '.k', '0000-00-00 00:00:00'),
(6, '123', '312', '0000-00-00 00:00:00'),
(7, '231', '333', '0000-00-00 00:00:00'),
(8, '1232', '22', '0000-00-00 00:00:00'),
(9, 'dass', 'ewq', '0000-00-00 00:00:00'),
(10, 'kldsfjlskdfj', 'kldsjfljsdf', '0000-00-00 00:00:00'),
(11, 'das', 'das1', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `fields`
--

CREATE TABLE IF NOT EXISTS `fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `fields`
--

INSERT INTO `fields` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'midterm', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'assignment', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `gpa`
--

CREATE TABLE IF NOT EXISTS `gpa` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) unsigned NOT NULL,
  `gpa_value` double NOT NULL,
  `gpa` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `gpa_student_id_foreign` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `grade`
--

CREATE TABLE IF NOT EXISTS `grade` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `teacher_id` int(10) unsigned NOT NULL,
  `student_id` int(10) unsigned NOT NULL,
  `course_field_id` int(10) unsigned NOT NULL,
  `Grade_value_field` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `grade_teacher_id_foreign` (`teacher_id`),
  KEY `grade_student_id_foreign` (`student_id`),
  KEY `grade_course_field_id_foreign` (`course_field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `id`
--

CREATE TABLE IF NOT EXISTS `id` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `num` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `id`
--

INSERT INTO `id` (`id`, `num`, `created_at`, `updated_at`) VALUES
(1, 20120000, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2015_03_16_224624_Create_admin_table', 1),
('2015_03_31_124106_create_students_table', 1),
('2015_03_31_124341_create_id_table', 1),
('2015_03_31_124423_create_teacher_table', 1),
('2015_03_31_173447_create_department_table', 1),
('2015_03_31_200316_create_professor_table', 1),
('2015_04_03_125320_create_slider', 1),
('2015_04_14_154802_create_course_table', 1),
('2015_04_14_170639_create_fields', 1),
('2015_04_14_170452_create_course_fields', 2),
('2015_04_14_171141_create_Grade_table', 2),
('2015_04_14_181450_create_student_total_grade_table', 2),
('2015_04_14_182050_create_prof_course_table', 2),
('2015_04_14_182412_create_sub_teacher_table', 2),
('2015_04_14_182713_create_register_course_section_table', 2),
('2015_04_14_183006_create_assignments_table', 2),
('2015_04_15_103223_create_gpa_table', 2),
('2015_05_03_132201_create_session_table', 3),
('2014_01_14_051556_create_comments_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `professor`
--

CREATE TABLE IF NOT EXISTS `professor` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `Address` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `Date` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `Phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Mail` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `profile_image` text COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `professor`
--

INSERT INTO `professor` (`id`, `name`, `Address`, `Date`, `password`, `Phone`, `Mail`, `profile_image`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'hossam', 'jasldkjasldj', '10/02/2017', '$2y$10$vI.gLqpAi9NDqMQV.hMDEOZXiggyl65kr4qRgRTIbnoxD.MwcmYOK', '21312391309', 'sapan5221@gmail.com', 'R4ECFw_batmobile-1366x768.jpg', '24vNHIYyGwviWwjmP3H01D1miMMdomdWav2lMuZ1TSPPnYjTwTDls8HAx34b', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'computer scince', 'hkh', '05/17/2015', '$2y$10$dskJbLipD09.yAbprGVo5.rQ0vmT9BfB0l3/RZ3BKMtHtOiHl1dUu', '13212zcdkl', 'jlkjsdkljsklj', '', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `prof_course`
--

CREATE TABLE IF NOT EXISTS `prof_course` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `prof_id` int(10) unsigned NOT NULL,
  `course_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `prof_course_course_id_foreign` (`course_id`),
  KEY `prof_course_prof_id_foreign` (`prof_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=53 ;

--
-- Dumping data for table `prof_course`
--

INSERT INTO `prof_course` (`id`, `prof_id`, `course_id`, `created_at`, `updated_at`) VALUES
(36, 2, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 2, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, 2, 16, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, 2, 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, 2, 14, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, 2, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, 2, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, 2, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, 2, 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, 2, 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, 2, 18, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, 2, 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, 2, 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `register_course_section`
--

CREATE TABLE IF NOT EXISTS `register_course_section` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) unsigned NOT NULL,
  `sub_teacher_id` int(10) unsigned DEFAULT NULL,
  `course_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `register_course_section_course_id_foreign` (`course_id`),
  KEY `register_course_section_student_id_foreign` (`student_id`),
  KEY `register_course_section_sub_teacher_id_foreign` (`sub_teacher_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `register_course_section`
--

INSERT INTO `register_course_section` (`id`, `student_id`, `sub_teacher_id`, `course_id`, `created_at`, `updated_at`) VALUES
(1, 1, 120, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 1, NULL, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 1, 124, 16, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 1, NULL, 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payload` text COLLATE utf8_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  UNIQUE KEY `sessions_id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `payload`, `last_activity`) VALUES
('02bf4e8816e212561347c7a9a138835547014409', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRU5OOUx3ZFZ1SUg2bGtQYnRTaWtEMlRiNlpFOXo2R3h4WFpZZ1ZWMiI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDY2Njk7czoxOiJjIjtpOjE0MzExMDY2Njk7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431106670),
('0320ef221718eded6149ee3332b6fb1832926dd9', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZVhTVjZGU0E4dHo0VnFWcXJSdWVDQ2VSd0Z0c1dQellvTko5d1UzSiI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDY2NDk7czoxOiJjIjtpOjE0MzExMDY2NDk7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431106649),
('05958d7263b8c7f82b06e1bf589b0cf174fbfa8d', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidWN0SlFoWWlhdmQ3a0puWVpiZmRVZVFZdGlzQ0ppMEJHZUk1MHF0YiI7czo1OiJmbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjk6Il9zZjJfbWV0YSI7YTozOntzOjE6InUiO2k6MTQzMTEwNjcxOTtzOjE6ImMiO2k6MTQzMTEwNjcxODtzOjE6ImwiO3M6MToiMCI7fX0=', 1431106720),
('05d8d5ff9bc7df7838a36644254f73430901f4f4', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib0tGcjV6ajhsOUJ0THJ4aGd6bTBEaFEzaUp1WWdiZ1ZKUE1qV2JQaSI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzEwOTk3NjM7czoxOiJjIjtpOjE0MzEwOTk3NjM7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431099764),
('06406893d827ee6f7819ad1fc00557a10228c35d', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoienlFcmhhbm0zVW56MGlYeWZDU3Y3M1Y5dEd3S3cydUx5YUZLRlBlYSI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDYyOTE7czoxOiJjIjtpOjE0MzExMDYyOTE7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431106291),
('08fed3033696d43eccceb09cbcd2f11d2e0989b8', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNk5kcEVDdEo4RjRZTThja2ZtQVE3VkRjSm94MkV0WGRpaGtiRDRxaCI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDY2NjY7czoxOiJjIjtpOjE0MzExMDY2NjY7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431106666),
('0a605c2ad045634500e6f095b1cd9818cd82300c', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieWVDbFhWTmtNR3JSZUszVWdHMG5aUFhyT3dXS0hKbXVPanJMOUt2TiI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDY3Mjk7czoxOiJjIjtpOjE0MzExMDY3Mjk7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431106730),
('0b5eee90bed04a5100cc4e7f55a36c7e95933d6c', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia2lmWlhNVFNXWmpwRjhyamlxQ2NLaUNyaTZzN0dLdlduQ2daZmJ0eSI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDYxMTM7czoxOiJjIjtpOjE0MzExMDYxMTM7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431106114),
('10aed4ec80985579c31059a85fdfcb04855ea380', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR25McnRBQlM4UTBkcklabHBVemxTNUQ4aHFXYTVxREV0Y2NTSVhNdyI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDYxMjI7czoxOiJjIjtpOjE0MzExMDYxMjI7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431106123),
('116819cb31703e14818350c8ba4ff7983b8f3bcb', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidGg4Zm9aWGZ4MFJXZkdYb1pRWjQ1NHF1UWpHNnVnenZhc1dnc0VlRiI7czo1OiJmbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjk6Il9zZjJfbWV0YSI7YTozOntzOjE6InUiO2k6MTQzMTEwNjE1NDtzOjE6ImMiO2k6MTQzMTEwNjE1NDtzOjE6ImwiO3M6MToiMCI7fX0=', 1431106155),
('1263a2a9178c4b98083db4e32bac0f968576e9b4', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUWY4NUQ0UHJEOHkxQzVRTjNPTzRkRnhQN1pRNkE4RzFVZjJZYkJQeSI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDYzNTg7czoxOiJjIjtpOjE0MzExMDYzNTg7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431106359),
('12b0588889b4fa50aa9c93c200d4bc4f4fdd29c1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVVBxbHNucGw5cVVta0plQ0g0ZEVxS0xMOGU4ZEdIc2hPMDd0eWtBcSI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDAwNzM7czoxOiJjIjtpOjE0MzExMDAwNzM7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431100073),
('130a5c5d3337e5ed5a1dbb461cb31cd7355f8ce6', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieTZYQ3BoNlVxZTYwMDI1ZnhJNVJwclFWbnlhdEN2UnBRdnF0bldwQiI7czo1OiJmbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjk6Il9zZjJfbWV0YSI7YTozOntzOjE6InUiO2k6MTQzMTEwNjM2MztzOjE6ImMiO2k6MTQzMTEwNjM2MTtzOjE6ImwiO3M6MToiMCI7fX0=', 1431106363),
('146395f60aa8f627d757c1d27c08a11ec6519c29', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidlY5RGhraXd3Y1A5ZFlHcmNsNkhtQll0dk9uU3VDY0dsM2FIOGpqUCI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDY3MjI7czoxOiJjIjtpOjE0MzExMDY3MjI7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431106723),
('16017912cf825931c17f953dda7309d0e3735966', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTFh1T1NpWlZhbFFGYzRiR0dacGlnUHhXenQ4MzMzNFk3bk9yOUtpVSI7czo1OiJmbGFzaCI7YToyOntzOjM6Im5ldyI7YTowOnt9czozOiJvbGQiO2E6MDp7fX1zOjk6Il9zZjJfbWV0YSI7YTozOntzOjE6InUiO2k6MTQzMTEwNjczNTtzOjE6ImMiO2k6MTQzMTEwNjczNTtzOjE6ImwiO3M6MToiMCI7fX0=', 1431106736),
('170c36a200827b839846ff4103fc825cacca38ec', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWlNpZGs1ZkpiQkRySk9tQmZaT3lZNEcxdUJySXpFOG9yRjNUU0d1NyI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzEwOTk3NTk7czoxOiJjIjtpOjE0MzEwOTk3NTk7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431099760),
('174231d83509cdde907b76591ddb381d0e636a08', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicUQyQnE1T3NGaXREaUVIYThnT2ZBN3dyQ1o0VWt2dmExcTdUeTMxWiI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDY3MjQ7czoxOiJjIjtpOjE0MzExMDY3MjQ7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431106724),
('1b286a7556189906cd2846c69cad8adb82c3f5cf', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY3pzNldNdndWM0xiQ3BHRWlobzRrc0NkYnRSMmI4RngzVzlJNTBSNSI7czo1OiJmbGFzaCI7YToyOntzOjM6Im5ldyI7YTowOnt9czozOiJvbGQiO2E6MDp7fX1zOjk6Il9zZjJfbWV0YSI7YTozOntzOjE6InUiO2k6MTQzMTEwNjcxNDtzOjE6ImMiO2k6MTQzMTEwNjcxNDtzOjE6ImwiO3M6MToiMCI7fX0=', 1431106715),
('1cfd3ec7182d5997376e22dc459b65d14cc36a6b', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSWU2SkZENzUwYVcwYnQ1WHRQck91SEV0NDlCZ1lkcjBjYk9MUFlydyI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDY3NzA7czoxOiJjIjtpOjE0MzExMDY3NzA7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431106770),
('1fd711e9c533b4101e29463abfd919dca680a948', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibTJTTGgxbnJmQ3hoUVZKWE5zMGplRzZncmphTko0ajNsenhWVXFzRyI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDYwOTE7czoxOiJjIjtpOjE0MzExMDYwOTE7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431106091),
('20a93b1f1efaec0fa59aa0b4fd517a399b01ba3d', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZFJXS2I2dHgwVm5UVDgzSUttWDZIWG5nVWdWOUtRaXB0NXkzanRRMCI7czo1OiJmbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjk6Il9zZjJfbWV0YSI7YTozOntzOjE6InUiO2k6MTQzMTEwNjE3NTtzOjE6ImMiO2k6MTQzMTEwNjE3NDtzOjE6ImwiO3M6MToiMCI7fX0=', 1431106175),
('21a6916a69db12ae81774e051f1927d39a17f1b9', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY2lmZXJkbFo1bjdEUmpDVk1pMjl0RWZRaExXN3ZZU2VLVkl4RmtTMSI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDAwNzU7czoxOiJjIjtpOjE0MzExMDAwNzU7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431100075),
('21d173e37a7443d46e375725f89c4339b9bb257a', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU3JMQ1FxR0M2OTVuVFFEaUo0aXpOZkY0UUI0Mm8za3lMM2l2Ykh5YSI7czo1OiJmbGFzaCI7YToyOntzOjM6Im5ldyI7YTowOnt9czozOiJvbGQiO2E6MDp7fX1zOjk6Il9zZjJfbWV0YSI7YTozOntzOjE6InUiO2k6MTQzMTEwNjEwMztzOjE6ImMiO2k6MTQzMTEwNjEwMztzOjE6ImwiO3M6MToiMCI7fX0=', 1431106103),
('2296f81358d6f0c0d1cbb1195964de18af7f300c', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVldWRXJraHd2dm5sVWlzdXZ2WkdkaFFyMmdXMlI5R0JMaDE2TnVjbSI7czo1OiJmbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjk6Il9zZjJfbWV0YSI7YTozOntzOjE6InUiO2k6MTQzMTEwMDI1NDtzOjE6ImMiO2k6MTQzMTEwMDIxNDtzOjE6ImwiO3M6MToiMCI7fX0=', 1431100254),
('24a0578c4a2dba867564803b6947613110259fee', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSFpUTEVCWWFRSFVkWmhpMUowTDVWQ2VOUXRFRDhreE9lelZNQ3dGaiI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDMxMjI7czoxOiJjIjtpOjE0MzExMDMxMjI7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431103122),
('26bd2927e994664583546405b5817255373f4075', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNUlPcVBIQ2NpcHVQR3d5OU1haWdyQlJlMVZGdVhrY3loWmV5ZmNzYSI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDMwOTc7czoxOiJjIjtpOjE0MzExMDMwOTc7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431103097),
('2a0f00b65dc161f0880eb6c7635d9eb24c8d3108', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWDdDeElWRmdPWWU5dmRsbW9Ta1ZyYW5NbzFpYU5nYkVxcHhlZUc3MCI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDYyOTQ7czoxOiJjIjtpOjE0MzExMDYyOTQ7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431106294),
('2bb3e297ede3214b7384f43593c682bcfd62235f', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTEN0VmJYdWF0SzZ1cVlISkhlSk1mdlVmQ2o2bzVmdkhKQUNWUk04bCI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDU4MzQ7czoxOiJjIjtpOjE0MzExMDU4MzQ7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431105834),
('2c223f8fa57161c6f96301e26416a700d7648147', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOGJ0V3haV3BvM2c0U1REM3BueDJ0SWJiRWp5ZGVsb3hadHVMS0pDMyI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDY2NDc7czoxOiJjIjtpOjE0MzExMDY2NDc7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431106647),
('2ded01984188327365f590f13b7e9ba94cd29492', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQW5xU0dIbDhnWW1LNjFrcHNQQkx3aUNPNmEzVkRIQlFDbGg3ZHBXVyI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDYxODI7czoxOiJjIjtpOjE0MzExMDYxODI7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431106182),
('2e80f3686388945d0ae148cc10a1ab2160cb60a2', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWmpYSnRVbEdwaTFkaU1ET0hQN1NwVEVTVzdwOUc3dVl4a2FtOXJUQiI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzEwOTk3Mzc7czoxOiJjIjtpOjE0MzEwOTk3Mzc7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431099737),
('30c3571b074d1258de8034893fb281a5b7e64c71', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicWkzTm5oYVJtTnBsM3E3aDA5V3hTZUd0SkNXVVVlUUNLaWJkRzRrZiI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDU4MTE7czoxOiJjIjtpOjE0MzExMDU4MTE7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431105811),
('33aa9f26e8c8e75138b80c1420e412a4733345ca', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidWFYQUZFZk96RXpPRUJPQWJCTFQ1VnRhSXU4aGUxbUtST2RqUVlqViI7czo1OiJmbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjk6Il9zZjJfbWV0YSI7YTozOntzOjE6InUiO2k6MTQzMTEwNjA5NztzOjE6ImMiO2k6MTQzMTEwNjA5NztzOjE6ImwiO3M6MToiMCI7fX0=', 1431106097),
('34e1fdc50f6654f2df793e059371b81b5d3cc74f', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUHdjTjFqWnVZekg1VHNHUThyN2gzOGZZeWllWHpMVmxLREdpbnlBYyI7czo1OiJmbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjk6Il9zZjJfbWV0YSI7YTozOntzOjE6InUiO2k6MTQzMTEwNjI4ODtzOjE6ImMiO2k6MTQzMTEwNjI4NjtzOjE6ImwiO3M6MToiMCI7fX0=', 1431106288),
('35ce8997eaf4e274a12d4ae91b16c79b5d573b95', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVm5mc2tUU3BqdnBKY21LVUM4QlA3RVA5T09PazBNTnpjY2VWRzJnTyI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDY0Mzc7czoxOiJjIjtpOjE0MzExMDY0Mzc7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431106438),
('38a3449d95d4b8202effefffd1053ce8822b0387', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRnZlaFVkMGdJWDcxQ1JOc3FWNlVZS0x3VHk0WXU4M1p6dXdDNlpzbSI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDYwNTA7czoxOiJjIjtpOjE0MzExMDYwNTA7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431106051),
('3a317517b3e496c74a80d0f40813df664a20413e', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOVVYTkluRzI4RXZscks2a3lOYk5ENGNvMkNFd1R2UlFVazdGOEhNNiI7czo1OiJmbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjk6Il9zZjJfbWV0YSI7YTozOntzOjE6InUiO2k6MTQzMTEwMDM1MjtzOjE6ImMiO2k6MTQzMTEwMDMxOTtzOjE6ImwiO3M6MToiMCI7fX0=', 1431100352),
('3d521289ebe579e14d462c5d5595d8d9b81d19b4', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaDI2OTloYkRsazBPRlNsQnVSa2QxSUJWbURQSHJmbzZjSXY2bVU3SSI7czo1OiJmbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjk6Il9zZjJfbWV0YSI7YTozOntzOjE6InUiO2k6MTQzMTEwMzA5MTtzOjE6ImMiO2k6MTQzMTEwMjgzOTtzOjE6ImwiO3M6MToiMCI7fX0=', 1431103091),
('3f332a9f31f3440c19a9b37b2f90a32e8f926180', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSmd4TEhyOWZuVTRWNXVEZUtwM0NaZ3o0UHZoR1FTOFlsb1JyRjFqaSI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDY3NzE7czoxOiJjIjtpOjE0MzExMDY3NzE7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431106771),
('41b52ec47713c81caaf666217f6970478df7fc9b', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibWtJeXdjZ3hQWkRjbW96cVk1MllwdUZFZjlPRzlCY0plY1h4dXVOWCI7czo1OiJmbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjk6Il9zZjJfbWV0YSI7YTozOntzOjE6InUiO2k6MTQzMTEwNjEyMDtzOjE6ImMiO2k6MTQzMTEwNjExOTtzOjE6ImwiO3M6MToiMCI7fX0=', 1431106121),
('4266452757acb0d43d9e7f380ee7e99159695e32', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaDFYVWVWeDRMRHF0SnVuOWtHN1hBU3JNNktqSUNwTW5ISER0WmRqbSI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDY3NDQ7czoxOiJjIjtpOjE0MzExMDY3NDQ7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431106744),
('43bf5abdb1db6b24952600cd1cf96e726e59af18', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidjB6eXRTYXlEc1hQWnVsTlpzbW41V0hnRExiWVNZYnF5QUdobThoZiI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDYyOTA7czoxOiJjIjtpOjE0MzExMDYyOTA7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431106290),
('455c398f14c2d6421ae610e718f8a18f4f14935b', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaThHWnpQcE0xbHZHNHRLVGVwcGw2RHFQV3VSS0dWbTdCS1pWV2wzTSI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDAyNjc7czoxOiJjIjtpOjE0MzExMDAyNjc7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431100267),
('463bd9fe0db52862819623c0fa525f194d172569', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibFBiYUxXS3BFTEtWdUlvS0dCSGJXSUd4OGlBYXpvMmNjV056UnRIVSI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDYxNDY7czoxOiJjIjtpOjE0MzExMDYxNDY7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431106146),
('46fef7724af20a119c87b5010e4dfcf024fc45eb', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWTNQcDJOUXlJTDdLbGdodzlsMFpyWFNVdWNiREZVMHFPajBhRkVHOSI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDY1NjQ7czoxOiJjIjtpOjE0MzExMDY1NjQ7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431106564),
('4713fbb8b14d527ffc3defda6009d1a1cd07b2df', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicXZJa0E0dmlIRk12Qnk3NEhaYlRsM0x0eHhlUUxyT0tqa3M2Y3JGZSI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDU4NTE7czoxOiJjIjtpOjE0MzExMDU4NTE7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431105851),
('50b34f683ee20324a9fcf58433174699ba247baa', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOFRCMUNtbERKZEdQVW1nOFNIVVRCZmNyZ0lROEZUVlFicTdwa21VcyI7czo1OiJmbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjk6Il9zZjJfbWV0YSI7YTozOntzOjE6InUiO2k6MTQzMTEwNjA0OTtzOjE6ImMiO2k6MTQzMTEwNTk5ODtzOjE6ImwiO3M6MToiMCI7fX0=', 1431106049),
('52c7bc3831737d32086014b1134a3ded72bc5932', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicUkwdmphQUp2S1FEa3F5aHdJbHlYVWRONU9Cc1Y4eDU3N1NENDRzbSI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDYyNTU7czoxOiJjIjtpOjE0MzExMDYyNTU7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431106255),
('52e2c810933ae58759226f0080bb704c468cbf2c', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSFZlY2FFSGxiVEQ5OEIzNWNCMmZZQkVscGRDaVl0eGRXV2VzVFBLRCI7czo1OiJmbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjk6Il9zZjJfbWV0YSI7YTozOntzOjE6InUiO2k6MTQzMTEwMDA3MTtzOjE6ImMiO2k6MTQzMTEwMDA0MztzOjE6ImwiO3M6MToiMCI7fX0=', 1431100071),
('53957f7bfa1e05577313247af388e034165b5864', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibWE5NUk0UjNRRW0zVDVEczZPTHlrZ2M5Sk9qM1RxOFhOOFBiMlV0YyI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDY2NDQ7czoxOiJjIjtpOjE0MzExMDY2NDQ7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431106644),
('5462f4c510d820532d32b5ed17cea167b05bbd12', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWFYydjRoSHR6OVhNTjhlOVA3VGNPNnpCUDZQQ0N3a21ZQUV3QmtjNyI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDY0NDA7czoxOiJjIjtpOjE0MzExMDY0NDA7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431106440),
('5540ca1a4ba0dec3ced899d34551d4b4d3f0581b', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSkxCYUI5U0l1QzFKY0NQaTFabzVQdGZPdG5wY1JvTTFOVjNoUHoyOSI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDYxOTM7czoxOiJjIjtpOjE0MzExMDYxOTM7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431106193),
('58066c3a6941d4d13fbc9a66c17c60607f1e71f7', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUDM3dTRsd1paN1FOdEg0STB4cXV6WUU4dXBFNHVvWjhhSmNxZGZMSSI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDMxMjQ7czoxOiJjIjtpOjE0MzExMDMxMjQ7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431103124),
('5a3edcdee71d2a99e48f63cd254a48f0295326e4', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaFVsZ1FPdmU0QkhVRVpSTng4SDhad1BNbExlY1pDUjVPR3YzckwxZiI7czo1OiJmbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjk6Il9zZjJfbWV0YSI7YTozOntzOjE6InUiO2k6MTQzMTEwMDUzNjtzOjE6ImMiO2k6MTQzMTEwMDM1NTtzOjE6ImwiO3M6MToiMCI7fX0=', 1431100536),
('5ac602d91bbe2faafe72112bbbb58e1aa066eb17', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid2JoS2dRYlcyQTN6R2Z3dG42YkV4YUFscUNCUk85dHlPbmFjS3FLTyI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDU4MDY7czoxOiJjIjtpOjE0MzExMDU4MDY7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431105806),
('5b3cdc668c565906acd36bd338fdc1ed1ccb9616', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoianZhNGp4cVFWYWdSVXFYSWZYaFIzYzd5eW1iQ0p6Tzd6bHp4OG44ZiI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDU4NDM7czoxOiJjIjtpOjE0MzExMDU4NDM7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431105843),
('5d284513b56da56f10875ea6acc2a1cfecb8fccb', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWnNabG9rdGFSR1pvcFF1MTQ4UDBNSXB5NjVLZm5ZMllISEs3eHFPSCI7czo1OiJmbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjk6Il9zZjJfbWV0YSI7YTozOntzOjE6InUiO2k6MTQzMTEwNjc1NDtzOjE6ImMiO2k6MTQzMTEwNjc1MjtzOjE6ImwiO3M6MToiMCI7fX0=', 1431106754),
('600109ea9737ba54642f5ed83e70a572d59e9ed0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibVA2bGhVenRtaW1UTWtXZVJoZjRVU2JWTzlpUkR6UTRvcHZZMW44RyI7czo1OiJmbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjk6Il9zZjJfbWV0YSI7YTozOntzOjE6InUiO2k6MTQzMTEwMjQyMTtzOjE6ImMiO2k6MTQzMTEwMDUzODtzOjE6ImwiO3M6MToiMCI7fX0=', 1431102421),
('604a32e51cf29cb46ecdb8c20f2d6f2bb4fc4bd8', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRWo0dUZxdGlMM2hIOEdOMjVFVVlDRmNPc3BSNmhyUGtERExiNDF2TCI7czo1OiJmbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjk6Il9zZjJfbWV0YSI7YTozOntzOjE6InUiO2k6MTQzMTEwNjA4OTtzOjE6ImMiO2k6MTQzMTEwNjA1NDtzOjE6ImwiO3M6MToiMCI7fX0=', 1431106089),
('650b46fea95949a84b7c2cc2288c600116c4a401', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiajk2WmRVejYzOHFqSDhlYVdJSm5aQ1ViT1FCWjBzV0ZObEw0dWsxeCI7czo1OiJmbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjk6Il9zZjJfbWV0YSI7YTozOntzOjE6InUiO2k6MTQzMTEwNjY2NTtzOjE6ImMiO2k6MTQzMTEwNjY2NDtzOjE6ImwiO3M6MToiMCI7fX0=', 1431106665),
('6954a9bf9ca126f601d9ec63c81b5caa910ee875', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVTM5UFhzZVI2SGVrQUtTVTFZdGszUktDaEFRQXJQT25iMlJHaDAxbSI7czo1OiJmbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjk6Il9zZjJfbWV0YSI7YTozOntzOjE6InUiO2k6MTQzMTEwMjQzMjtzOjE6ImMiO2k6MTQzMTEwMjQyMztzOjE6ImwiO3M6MToiMCI7fX0=', 1431102432),
('6aaab0669fa687bddb805976818626ea76587eda', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid2xnWmdOQ3pqbmZub0podDUxYXoza0RPZEl0VXo0NXpQd3d0R1VSTyI7czo1OiJmbGFzaCI7YToyOntzOjM6Im5ldyI7YTowOnt9czozOiJvbGQiO2E6MDp7fX1zOjk6Il9zZjJfbWV0YSI7YTozOntzOjE6InUiO2k6MTQzMTEwNTg0NztzOjE6ImMiO2k6MTQzMTEwNTg0NztzOjE6ImwiO3M6MToiMCI7fX0=', 1431105847),
('6bf9a4c182e478da33666e40dece2a8975459148', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM3hJRVM4dmZMMVR1d2JpcXZTOGNza2JpM1hjb09kSjE4dnA3QXpZVyI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDAxNzc7czoxOiJjIjtpOjE0MzExMDAxNzc7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431100177),
('6fc34130fda6721408eeca58c983cc6c29bc28e1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWnEzYzd6TTd2ZnZuVjdjYTNIWUdIcGlwZ2FUd0tabTB0cENLS2R4bCI7czo1OiJmbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjk6Il9zZjJfbWV0YSI7YTozOntzOjE6InUiO2k6MTQzMTEwNjYyMztzOjE6ImMiO2k6MTQzMTEwNjYyMztzOjE6ImwiO3M6MToiMCI7fX0=', 1431106624),
('72938fe9f091c0971ad126cab952640fda01a0a2', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoianNjaVAxTDZVOUdydVNybnZtWDlHeGZWRmRsam1mZ2N6TzFKUk1vUiI7czo1OiJmbGFzaCI7YToyOntzOjM6Im5ldyI7YTowOnt9czozOiJvbGQiO2E6MDp7fX1zOjk6Il9zZjJfbWV0YSI7YTozOntzOjE6InUiO2k6MTQzMTEwNjc2NjtzOjE6ImMiO2k6MTQzMTEwNjc2NDtzOjE6ImwiO3M6MToiMCI7fX0=', 1431106766),
('72bc6df69f34be4d688d0a590d44dc84aeb7ae87', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV0E0Y2JYNUFIbDBON2kwNXhCbmxkV05uMlZna24xbTE0SVRzSzVxNCI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDYyOTU7czoxOiJjIjtpOjE0MzExMDYyOTU7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431106295),
('74fb660b8b8a1f1443c8a3cd601574a766046633', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTVpNQlA1SEVGTmZiZ3d0OEt3OFFSZTU4SU1OWmduOHBsOFA4SjR5QSI7czo1OiJmbGFzaCI7YToyOntzOjM6Im5ldyI7YTowOnt9czozOiJvbGQiO2E6MDp7fX1zOjk6Il9zZjJfbWV0YSI7YTozOntzOjE6InUiO2k6MTQzMTEwNjIwMjtzOjE6ImMiO2k6MTQzMTEwNjIwMTtzOjE6ImwiO3M6MToiMCI7fX0=', 1431106202),
('754eeb93cece8544d46177ad5b6eca9964b68040', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaE9la2NReWp3WGFPaldYM09jbm8wd2puZGZma3dGejNUZHpIdnVvYSI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDY3NDI7czoxOiJjIjtpOjE0MzExMDY3NDI7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431106742),
('77b6080f848e36c974663f286a8e30b3548a362f', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibEhCcFQ1YkRqOXBDSE56S2tXWnZRMU1sdlozU09ZbXBETkxLM3puRiI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDAxNzQ7czoxOiJjIjtpOjE0MzExMDAxNzQ7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431100174),
('7a25a102b1e50767900fe8d866857bb09d88e2fb', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMWhDbTFwNEZkTGhTa2Q0TlJQTFNlU3BwR0hQd3YwaVBnYVdPeGlrcyI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDY2Njg7czoxOiJjIjtpOjE0MzExMDY2Njg7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431106668),
('7b90d31282066a109d7ddb5e0f8c6301323a59c7', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNWVYWXlzVms1OWI1V21CUWdlSElsSXBTYzllVU45UmFEUnZDWlRXbCI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDY0NDY7czoxOiJjIjtpOjE0MzExMDY0NDY7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431106447),
('7ca37d3991c77e9d8a56890e6b309cd16c991f65', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibzNYUWRBR0NGclFJcFNSOFhUM01xWWhONFFNV2dmZU9rT3ZXenVkZyI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDAzNTM7czoxOiJjIjtpOjE0MzExMDAzNTM7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431100353),
('7e6f4b39541d89493c558649f0ac050a7902aa4e', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWGNvMk0zNFNnTkR5dkg3d2NKYlRlTnI2T0l5M2cycXFBRVljWVhuOSI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDY3NDA7czoxOiJjIjtpOjE0MzExMDY3NDA7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431106740),
('871f8de48e596eca2acb1a6f957b2e115f33a966', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVGxOY2txTmJKNnFYdG5iMnMyeWVzV29WWWFmZkJxWGhFeHJweUpvVSI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDY2MTI7czoxOiJjIjtpOjE0MzExMDY2MTI7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431106613),
('88426e1c69b7ab54fe3d79168f458668461c636c', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZGNnRHFmYnNZYmo2bHU0Vkh5bHBVNklsTXliQmRSVlR1ckhLZ3lZMiI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDYxMDQ7czoxOiJjIjtpOjE0MzExMDYxMDQ7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431106105),
('8b91110932c1f444aa799b1348e6f20d7d9099a1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR1NkWWxGWWljYUhDamF0OTNDYTU4ZFFrMjhacU9QV0ZsSU1KVXR5QyI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDYzNjk7czoxOiJjIjtpOjE0MzExMDYzNjk7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431106369),
('8ef5440c7df378ce613977aa4e438ddb37208617', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia0ljd21IbzAxQnkwQjY4TERLUFRYQkYwYk43NGlhNEpUMHRpNmMydSI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDYyMDM7czoxOiJjIjtpOjE0MzExMDYyMDM7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431106203),
('8fe553d798cc1ea183fc05c7568a46b4da20518f', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNU1ONW9vVHIzNWl1bWEyQklGc2gxVURZdWg1MnRGSUdpcjFsSEhBQSI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDYyNTc7czoxOiJjIjtpOjE0MzExMDYyNTc7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431106257),
('905ab3a72c32498bfaa4c45379a5684d88418c26', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMEN2THhldHcyUDFrWlByVlZnWDJkaDFwcjc1NFhDRGVqemFIdEVQQyI7czo1OiJmbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjk6Il9zZjJfbWV0YSI7YTozOntzOjE6InUiO2k6MTQzMTEwMDA0MjtzOjE6ImMiO2k6MTQzMTEwMDA0MDtzOjE6ImwiO3M6MToiMCI7fX0=', 1431100042),
('957a272c827e84960e9b34fbc2e31fcd3cfad8ab', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTFM0UmtGVlV3MFhYR1BldG1LOXBoMzBjQU9EbExGd0hjUU5CaGJrbiI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDU4NDk7czoxOiJjIjtpOjE0MzExMDU4NDk7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431105849),
('962444abdda11bc9a35ffbe7bda089012ee38f4b', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNGRtUmZ5dlFGRkxvdWtKTFdTdDRwUGhQdnEyV1N6UTdkZkNmd1RzaSI7czo1OiJmbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjk6Il9zZjJfbWV0YSI7YTozOntzOjE6InUiO2k6MTQzMTEwNjE5NztzOjE6ImMiO2k6MTQzMTEwNjE5NjtzOjE6ImwiO3M6MToiMCI7fX0=', 1431106198),
('9644253c8ba81f183a83a177d8f8e4f633ef8250', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoialJkaVl6TTVSOU5GNkdIR3JuZDRaNGNIUm1Hc2FWaWxZc2VHZFlMYiI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzEwOTk3NjI7czoxOiJjIjtpOjE0MzEwOTk3NjI7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431099762),
('994e7c6c102a23f553917f97097d3a37c6356d8c', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVkxDckUxbGdKaUQzd0F2TkdUNkMwTUdkOHhjUE1PdURkdnJaOEhaYiI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDYxMTc7czoxOiJjIjtpOjE0MzExMDYxMTc7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431106117),
('99e9f33366481757c69d3e047dd3ca2979c73896', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTG1LRTVHcUVqRzExWXlyOER5dXNTdTRhcXJUR0g5NEQwdzNseFN1MCI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDYzNzE7czoxOiJjIjtpOjE0MzExMDYzNzE7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431106371),
('9af6578569181da8b883f23e2a8250ecd232bc62', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicElaMGhFYUVKdnRMUDIxbGkwZVVUZVphOGMyWHg2ZFlLamN0c0JjRiI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzEwOTk3MzU7czoxOiJjIjtpOjE0MzEwOTk3MzU7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431099735),
('9b727a794f4519e1e2bc8480c7ba2111175dda46', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMzZ4cHkxUkQ2dFpuZEp6bUxGS1VUcWRCVmM0VlRrU3NwcEpCTEdjciI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDYxNDQ7czoxOiJjIjtpOjE0MzExMDYxNDQ7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431106145),
('9fa67108afc6a8710d8ccba06cc9bb0d1309aec0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZlpMdHE0WWVBWTlKOVkwekdPb1d3V3prR3liVVBEbVgxNzY3WjdnaSI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDYxOTE7czoxOiJjIjtpOjE0MzExMDYxOTE7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431106191),
('a0f7d6785e9c99a72aa0230b657117a38b4bed92', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaVZIWUhqRUo5RFNNaDVNSmRtVjBlQTRGbVBBY1dmWjcwa1VFU21rMyI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDYwOTk7czoxOiJjIjtpOjE0MzExMDYwOTk7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431106099),
('a168f8bb65f810012f0943638b18bfab1d923715', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY2xUSUk4WjhiR2RkdTJJY1NlSzlBM0ZjT05na3VCM1lQRWRTSUllUiI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDY1NjY7czoxOiJjIjtpOjE0MzExMDY1NjY7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431106566),
('a26c90747962795fac3d3fefadcab1b881a58ec2', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia0lzelU3SUs4VXpOQ2FwOEZDb2RJUUFOMFRaZ1BQUU8wT0RHdzVvcSI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzEwOTk3Mzk7czoxOiJjIjtpOjE0MzEwOTk3Mzk7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431099740),
('a2b993be859100336bee33677d98a723207a9747', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicmRCWnJKeDQ4RXIzMk1lRVpuQ3I2REtzb2p0clVoMkJ4VjRMcTlyQyI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDY3Mzc7czoxOiJjIjtpOjE0MzExMDY3Mzc7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431106737),
('a32efece7d47db4a7bee3f33b2f655d67c4a5a97', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNk9rS0szSUZ5dHhJYk5HVnJsVkNad0pTNlpHVkhYRExNdjRNOTlYMiI7czo1OiJmbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjk6Il9zZjJfbWV0YSI7YTozOntzOjE6InUiO2k6MTQzMTEwNjQ2MTtzOjE6ImMiO2k6MTQzMTEwNjQ0ODtzOjE6ImwiO3M6MToiMCI7fX0=', 1431106461),
('a9fc3755408ac3c7f59aef3bcc5b14c9f239f620', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic2h5TXR5b256UVpFZVFFZVYyTEhDb2JLN241NlFzS3FrTkpndUN0QSI7czo1OiJmbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjk6Il9zZjJfbWV0YSI7YTozOntzOjE6InUiO2k6MTQzMTEwNTg2MjtzOjE6ImMiO2k6MTQzMTEwNTg2MTtzOjE6ImwiO3M6MToiMCI7fX0=', 1431105862),
('ac94c334b6fe1c8f4689435cecf7a15e5fa9d11a', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZnQ2b1FwTUlDYjJoM1JpSUVISjA0alV6alk1NW5PY2pxb3FIR1AzZyI7czo1OiJmbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjk6Il9zZjJfbWV0YSI7YTozOntzOjE6InUiO2k6MTQzMTEwNjU0MTtzOjE6ImMiO2k6MTQzMTEwNjU0MDtzOjE6ImwiO3M6MToiMCI7fX0=', 1431106541),
('ade906d4ba0af6f38df942dcec8a98dc868c236a', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSUFzdkE0VEdCY2dmeGJDekFoOFFXc2s2WnJjZXlJbjc2QU9OVlRqYiI7czo1OiJmbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjk6Il9zZjJfbWV0YSI7YTozOntzOjE6InUiO2k6MTQzMTEwNjcwOTtzOjE6ImMiO2k6MTQzMTEwNjcwODtzOjE6ImwiO3M6MToiMCI7fX0=', 1431106709),
('ae591b5419476b45485273cd8159ba920390eff3', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieXBBTGF4WVZncURDSXYzdGVEQlYxQWJQd0ExNUoxVzU1Y0RhalN6UyI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDU3ODI7czoxOiJjIjtpOjE0MzExMDU3ODI7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431105782),
('b04576e85dab48cdbab9f7cc2b514c241d7a6be1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNEVaczd4Y21lYlVTQTVIRllZRTV3djdzbGE2YnA0UUlTM0Q2ZmZLSiI7czo1OiJmbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjk6Il9zZjJfbWV0YSI7YTozOntzOjE6InUiO2k6MTQzMTEwNjU2MztzOjE6ImMiO2k6MTQzMTEwNjU1ODtzOjE6ImwiO3M6MToiMCI7fX0=', 1431106563),
('b2c4eaf172bd8e91bcdb0061f391dc376b9ea9b3', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieTQyRERHSGdHSHB5ck51dXdmVkNVMENKcURGbGxuYWtleVZaYVdzeCI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDY1NDU7czoxOiJjIjtpOjE0MzExMDY1NDU7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431106545),
('b34b10c090949aca62e2e107bf72ff9201094a0b', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiczlVY3d2SEs0SER4c0loT1FQa2N6dWp6ZmR1M2J6bWIzUVVCa2lLayI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDAxNzU7czoxOiJjIjtpOjE0MzExMDAxNzU7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431100176),
('b3e08ede1e93a397876a2e9041dd737f2a28f9f3', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOVZWb3dhblRtZHRFRjg2dU82QjJJbnZCamEwWTBlVGxUd3dKU3dzNSI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDAwNzQ7czoxOiJjIjtpOjE0MzExMDAwNzQ7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431100074),
('b80d5a23dd4bfd7dabc18f6a5c1d5e9b2eead6c7', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMlVDQld1WXF5RFdHaHhCWTE0Y3JhTVFWS1lwWVd1Z2pLSG96SlFKMyI7czo1OiJmbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjk6Il9zZjJfbWV0YSI7YTozOntzOjE6InUiO2k6MTQzMTEwMDI2MztzOjE6ImMiO2k6MTQzMTEwMDI1NTtzOjE6ImwiO3M6MToiMCI7fX0=', 1431100263),
('b9dcb34044b68410e37e9791b16e9c46bc0e60a0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWkRIelVmZmZGblpxVGVyMDRkTmltVjhqTjNPeU11T3ViejZlV1hseiI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDYxMTU7czoxOiJjIjtpOjE0MzExMDYxMTU7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431106115),
('bc3cb844fb462e7b930502eb4c4b6a826b09a363', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSEowaVI2UEtYOUNHY0NTQ0lpaEJwWkp0Q3NKRTJyVnZ3VFFXWHFmSCI7czo1OiJmbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjk6Il9zZjJfbWV0YSI7YTozOntzOjE6InUiO2k6MTQzMTEwNjU1NjtzOjE6ImMiO2k6MTQzMTEwNjU1NTtzOjE6ImwiO3M6MToiMCI7fX0=', 1431106556),
('bc63d629bd2be2dcd69b628a33fd19ac30724fd2', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMWJYNW9xbGNzUTl4enVvakJWbURxTU9OQWd3ZVhFZ3V4M3N0SU9SMiI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDU4MDg7czoxOiJjIjtpOjE0MzExMDU4MDg7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431105808),
('be8cbef19d99bfd9ba622de6d6d7d46cd6874ca4', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZUZ0cTVmeGNBTVhqQ1hMT01PaURjYUQybkxCeWE0YVpLU05HbWtNbCI7czo1OiJmbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjk6Il9zZjJfbWV0YSI7YTozOntzOjE6InUiO2k6MTQzMTEwNjY0MDtzOjE6ImMiO2k6MTQzMTEwNjYyNTtzOjE6ImwiO3M6MToiMCI7fX0=', 1431106640),
('c11ec24bfc11ea68942d2f5be491b4fb0549dbbd', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS1AzZ2NlSFdCMjlreGVGVE0zUlVrc3Jnb0Z4T1llUTlCMWQwNGwzaCI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDY3MTA7czoxOiJjIjtpOjE0MzExMDY3MTA7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431106710),
('c132023a5a773181e99582673856bc3537760199', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid2duVG9NZlkyYzNYeVhqSDRCWUhhNlBWWmQ3dlZvTERiMVhxZG9wYSI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDYzNTc7czoxOiJjIjtpOjE0MzExMDYzNTc7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431106357),
('c27fb8165fd83fd46bebcd30ef12f543ff6e6f1b', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic2lWSHU2Z0R0V240bFNHTHF5QlVycnBHd3NjdE9SNklaQnA5NjBaQSI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDYwOTM7czoxOiJjIjtpOjE0MzExMDYwOTM7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431106093),
('c2e728b784c615feecd2e2f18b033ae5654856c2', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY2RWaURBUE5WNU9BUnRkR05QN2tJb2NNRnJ2Sll5TVhOcGxVcnFqUyI7czo1OiJmbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjk6Il9zZjJfbWV0YSI7YTozOntzOjE6InUiO2k6MTQzMTEwNTg0MTtzOjE6ImMiO2k6MTQzMTEwNTg0MTtzOjE6ImwiO3M6MToiMCI7fX0=', 1431105842),
('c906150ac3918a8dfb2ddbfc7e2163b18d8267a6', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRmtuUDNNeDU2VzZoMXpLYVNPcHFQZnNNOEN5TGM5YWF2dU1zbkw3TSI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDY2MTE7czoxOiJjIjtpOjE0MzExMDY2MTE7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431106611),
('ca4ea50328ec68fe7449a5182beb0f41dfd162e7', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieFU1QWVUcmQ3MEI0VDhETFJ4SVRGdFpLc0MwTGcxeFA4QzR6UW5jYiI7czo1OiJmbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjk6Il9zZjJfbWV0YSI7YTozOntzOjE6InUiO2k6MTQzMTEwNjE3MjtzOjE6ImMiO2k6MTQzMTEwNjE1NjtzOjE6ImwiO3M6MToiMCI7fX0=', 1431106172),
('caf618f92661e8eac03b1c7cd00122c51ecc6eec', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiREdEZ1dmcmdQamdaemhGRHRUYzVrZ1NqQkF0NnNyWmh4dnFKaHNSYyI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDY3MTY7czoxOiJjIjtpOjE0MzExMDY3MTY7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431106716),
('cd164d3abd1075041a659dd5ad42c23f9cbefc28', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMWZmS1NrWlJBNHhDUmJuUnZUNnBiRGlrM2hjYXFpM2lmSjV5QWZ0NyI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDI4Mjc7czoxOiJjIjtpOjE0MzExMDI4Mjc7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431102827),
('ce1900d7186c4136db5c7e64afd7c3d4a02913ab', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidVVFZDhsNURMWGF5WENvV1VnWW8yZ0U4eUxhR3RnaU85V3FYeEJicCI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDY2NDE7czoxOiJjIjtpOjE0MzExMDY2NDE7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431106641),
('cee059b0671c44022e2950c2604fb14d6ede42a4', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibWhxYWcyMEJJRDVhOEhsVWFMbGRGaW15SUZ3N2xvRG5NQTF1YVBxcyI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDY2NDU7czoxOiJjIjtpOjE0MzExMDY2NDU7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431106645),
('cf365be3b22ec0a7bd78f4622b5651795a1aef0a', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ1p5Qnl6d3E2aFMwMVhHejVUVEpjSTJwU3diMU90RHZXREc4VzlRcSI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDMwOTg7czoxOiJjIjtpOjE0MzExMDMwOTg7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431103098),
('cfc7f73b8ba35b82f917a273381c78859d8ce841', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNFJiZHpmSWhKajVVSW5wanN0czQzSW84QXhjRTFYS1RTYjJHTlcyMCI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDYyMDc7czoxOiJjIjtpOjE0MzExMDYyMDc7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431106207),
('d092d55167362eb9e60e26321fc3068d095b7f03', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR0VrampFRGhGRDVpM2xZNm1vc21Ca1VJQUpicmIza083SFFIY1VnMyI7czo1OiJmbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjk6Il9zZjJfbWV0YSI7YTozOntzOjE6InUiO2k6MTQzMTEwNjMxNTtzOjE6ImMiO2k6MTQzMTEwNjI5ODtzOjE6ImwiO3M6MToiMCI7fX0=', 1431106316),
('d0948abdfab6e5c8f87e99e7178119ba3e0544b5', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia0J4M1Z0ckd3clB5YnpOV0x0MmhXc2h2bFBDUzYyUVF3RnluYTdxbCI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDAyMTM7czoxOiJjIjtpOjE0MzExMDAyMTM7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431100213),
('d1e99ef58d0b9e89751d9b437e32477a042d75ba', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoienU0a0J1VG02YWFTVUZCR0dWQ1ZQdWpmYlNBSWRqQ1BkUFY2eWNrMyI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzEwOTk3NjE7czoxOiJjIjtpOjE0MzEwOTk3NjE7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431099761),
('d391aaf03536899b7b2e02af6ebfa07f473fac42', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidlBQVkl0NFlZSmpGUHgxVWFsVDBHTGU4NE1NbThyOEF2TXc3SDBSVCI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDYzMTg7czoxOiJjIjtpOjE0MzExMDYzMTg7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431106318),
('d4d52772f1b58d3aa4fd3d87f4091f8acbf6409e', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTUxxTm54V3JxRkM2c1FGeUZqbGxiYkRyU0xXRzZ2YmdCTVc4QTkzaCI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDAyNjg7czoxOiJjIjtpOjE0MzExMDAyNjg7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431100268),
('d64a9e6f2cde402609b3d3e4042478fba01429a3', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaUQ4QXJ1NXNHOG9SdEljTXlsRUl2M2dlQlJyaDRQUXhIelRaaG9RcCI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDAyNjU7czoxOiJjIjtpOjE0MzExMDAyNjU7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431100265),
('dbaf5c81a0aed2d1f381673c375bcffc179699e9', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTG1PcVBhNEFQc0NYMHJja3RzVWgzM0Zpd1dURGxjUjRrbGN1ZFZzUSI7czo1OiJmbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjk6Il9zZjJfbWV0YSI7YTozOntzOjE6InUiO2k6MTQzMTEwNjcyODtzOjE6ImMiO2k6MTQzMTEwNjcyNztzOjE6ImwiO3M6MToiMCI7fX0=', 1431106728),
('dd1edad0a7f7ba618e239501ce5106a63875ea3a', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRnJKS3ZmeGRTcXV2enBYSmIzdWo4aENMOXdza1FWeTk5TjJ5VXJYNCI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDU3ODA7czoxOiJjIjtpOjE0MzExMDU3ODA7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431105780),
('dea0c0a618bf517f6842d62f2263ebbd799aab5a', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUmtveWdLTEJZMEFvWmZBY3JGVVVBb3pURDdhSnBvMFFpb2JjNWNXRyI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzEwOTk3Mzg7czoxOiJjIjtpOjE0MzEwOTk3Mzg7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431099738),
('e5cb38dd5c18aefa1d0dbc3b4ed8f45deec41021', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMEdlbEtEdmVNdk5UYVdZSU55cHgxTTZkRFd4TXlxUzBuWVd5aDhLVyI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDY1Njg7czoxOiJjIjtpOjE0MzExMDY1Njg7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431106568),
('e774ad97e186ceac85c9282fe57a80edeadfa386', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib1JmbGVZZlpia0plbjZiVnNhTFNzZzJ1cXVGV25sQlRqYVhIYWJERiI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDY3Mzk7czoxOiJjIjtpOjE0MzExMDY3Mzk7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431106739),
('e8ab6bc1155668204f6923eb3f7d3876482f0a17', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN1FMT2NFTFo5UmRSWU5MZ3dQZUhBbFVYWlhhdklIbkpldDdZemlBUCI7czo1OiJmbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjk6Il9zZjJfbWV0YSI7YTozOntzOjE6InUiO2k6MTQzMTEwMDIwOTtzOjE6ImMiO2k6MTQzMTEwMDE3ODtzOjE6ImwiO3M6MToiMCI7fX0=', 1431100209),
('edc7401f391bec39f8cf0c9afb7ea1d8c7e2a0a4', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM20xdE5tRUNDSDgxb3NRTmcwWmVrTkdDYkF4d1RyYUpCWXRPSjNzciI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDYyMDY7czoxOiJjIjtpOjE0MzExMDYyMDY7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431106206),
('edeead83db9d4e5ad2abf120a18482fbadf5ea41', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUUJxaHduQmdvY2E2R09VUHhTa0xaM0x4RzFkemQyTmlzdk5sQ3dQdyI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDU4MzI7czoxOiJjIjtpOjE0MzExMDU4MzI7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431105832),
('ee6b78b4046b4ecd284c1332ad1bcba6a198e8ad', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUzhOMXB2eGhOWUVOblk0aG5MaU9GQTJUU2pyRUFhSGFDM1JWMWFQQyI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDY1NDM7czoxOiJjIjtpOjE0MzExMDY1NDM7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431106543),
('eee3aaaca22725039f77f916dadb1e1e31a83d5c', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicHc2NWlYa2JuSDl4T0F3NXFvek5DcEtDN0E3S1FBRWgwcVRBbmlBMSI7czo1OiJmbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjk6Il9zZjJfbWV0YSI7YTozOntzOjE6InUiO2k6MTQzMTEwMjgyNjtzOjE6ImMiO2k6MTQzMTEwMjY1MDtzOjE6ImwiO3M6MToiMCI7fX0=', 1431102826),
('f3903e3e880a6710c9b3f0b371569f925730ad6f', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieEF5OVJpRkxVbUFtclJHR1hncmJrTGhSaVg0bVNEMXFDM2U3bVR4ayI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDU4NTI7czoxOiJjIjtpOjE0MzExMDU4NTI7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431105852),
('f3f8d70d3ca7abbe41a877e69e9a779890a91f36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicElweUlWcnU2cjBBUFZkaHlKdEppdmZ2dzZSRHFNNDZtb0V6Y09TaSI7czo1OiJmbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjk6Il9zZjJfbWV0YSI7YTozOntzOjE6InUiO2k6MTQzMTA5OTcyOTtzOjE6ImMiO2k6MTQzMTA5Nzg3NTtzOjE6ImwiO3M6MToiMCI7fX0=', 1431099729),
('f40804632b9e4c311a126f5d48902b15caf73458', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWGNZS3pjbGF3YTl6eU9vclZEVmp4dVBCOExvb1MweG5rVkN2MkhhMyI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDYyOTc7czoxOiJjIjtpOjE0MzExMDYyOTc7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431106297),
('f848970497d71af48a5f669ffd570b1d28ad9e91', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoialFZaFYwQlN4d3ZVaWE2RjJSVDVwVUlZVTdHRk94eTI5Nms3M1p0VyI7czo1OiJmbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjk6Il9zZjJfbWV0YSI7YTozOntzOjE6InUiO2k6MTQzMTEwMDMxODtzOjE6ImMiO2k6MTQzMTEwMDMxNTtzOjE6ImwiO3M6MToiMCI7fX0=', 1431100318),
('fa6d170d3bf659250b8348fb536414ebfa05a478', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSUp2bXVZTkRSTnBkbnVBUTdLSE9rTEk3Y3E1U1E3R1FiOG1rMExadiI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDI0MzQ7czoxOiJjIjtpOjE0MzExMDI0MzQ7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431102434),
('fb73d2fd07ceca01701b11d6f39e22586309bf77', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ3o1NVFTOEpadkRnS3l4R0I5Q1VqZFZGYjdLS0pXaENhM1BRSjhjdiI7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MzExMDU4MTA7czoxOiJjIjtpOjE0MzExMDU4MTA7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1431105810);

-- --------------------------------------------------------

--
-- Table structure for table `slider`
--

CREATE TABLE IF NOT EXISTS `slider` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `slider`
--

INSERT INTO `slider` (`id`, `name`, `created_at`, `updated_at`) VALUES
(4, 'PD4gBv_Anna-Kendrick-Wallpaper-101.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'VJ2qPK_Anna-Kendrick-Wallpaper-12.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE IF NOT EXISTS `students` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `Address` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `Date` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `level` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `Department` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `stu_id` int(11) NOT NULL,
  `profile_image` text COLLATE utf8_unicode_ci NOT NULL,
  `mail` text COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `name`, `Address`, `Date`, `password`, `level`, `Department`, `stu_id`, `profile_image`, `mail`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Hossam Emam', 'jasldkjasldj', '02/02/2010', '$2y$10$Z95wZy0MaU.YmnQafCFgAOYwxtS7YX5XAiYmOjBDjuIUQ2Hvm1IN2', '1', 'General', 20120001, 'nT6XCh_aiden_pearce-1366x768.jpg', 'hossatroy500@gmail.com', 'D7se83h4bQPOdYyyXdVxOEL8sikNEupkLNiHxj4tH2yFaE4pcfTpb1x0SDHy', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'hassan', 'sdasda', '07/16/2015', '$2y$10$FUaGeNx1YpIo6yUc710WNOlnYK.zzqok622Wm6LVPZiWic/FSzo6m', '1', 'General', 20120002, '', 'sapan5221@gmail.com', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'qdadasdas', 'wqdasda', '07/15/2015', '123456', '1', 'General', 20120003, '', 'hassanlaravel@gmail.com', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'hassan', '18st asda', '03/30/2012', '$2y$10$DPG/xQlSlph4S98HhkGgne5LHz7WgeuYBxxeYKwI1WxJByO7SgzeG', '1', 'General', 20120004, '', 'f.c.i.hellwan@hotmail.com', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'hossam eldin mohamed emam emam', 'dk;lasjdl;sajdk;asdj;l', '05/27/2014', '$2y$10$Ssjt0CXPQ6o2E3iIXfQs8uwswbIqNivPujX23r3LUPlE1xdXx/zmW', '1', 'General', 20120005, '', 'h_sapan5@hotmail.com', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'sapan5', 'hkh', '05/18/2015', '$2y$10$Kk4Q31Zb4a5nyZ51KqRjh.mTGS2J/2u.ODvnCVln1./Q6oc9jfj.u', '1', 'General', 20120006, '', 'myother3@esomething.com', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 'sapan5', 'dasda', '05/13/2015', '$2y$10$zkkLbs5d2q.l9tDSjm.KAOMU38Sm9dOziTFpAAScApl8zEjqFvngO', '1', 'General', 20120007, '', 'myother4@esomething.com', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `student_total_grade`
--

CREATE TABLE IF NOT EXISTS `student_total_grade` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) unsigned NOT NULL,
  `course_id` int(10) unsigned NOT NULL,
  `total_grade` double NOT NULL,
  `Grade_GPA` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `student_total_grade_course_id_foreign` (`course_id`),
  KEY `student_total_grade_student_id_foreign` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sub_teacher`
--

CREATE TABLE IF NOT EXISTS `sub_teacher` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `prof_course_id` int(10) unsigned NOT NULL,
  `teacher_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `sub_teacher_prof_course_id_foreign` (`prof_course_id`),
  KEY `sub_teacher_teacher_id_foreign` (`teacher_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=146 ;

--
-- Dumping data for table `sub_teacher`
--

INSERT INTO `sub_teacher` (`id`, `prof_course_id`, `teacher_id`, `created_at`, `updated_at`) VALUES
(119, 36, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(120, 36, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(121, 36, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(122, 37, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(123, 39, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(124, 39, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(125, 39, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(126, 40, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(127, 40, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(128, 40, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(129, 41, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(130, 41, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(131, 42, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(132, 42, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(133, 42, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(134, 44, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(135, 44, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(136, 45, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(137, 45, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(138, 46, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(139, 47, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(140, 47, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(141, 51, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(142, 51, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(143, 51, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(144, 52, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(145, 52, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tables`
--

CREATE TABLE IF NOT EXISTS `tables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=5 ;

--
-- Dumping data for table `tables`
--

INSERT INTO `tables` (`id`, `name`) VALUES
(1, 'Administrator'),
(2, 'Students'),
(3, 'Teacher'),
(4, 'Professor');

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE IF NOT EXISTS `teacher` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `Address` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `Date` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `Phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Mail` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `profile_image` text COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=11 ;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`id`, `name`, `Address`, `Date`, `password`, `Phone`, `Mail`, `profile_image`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Hassan Alaa', 'jasldkjasldj', '04/20/2015', '$2y$10$OEG4tJuepT1LPwXCL3vLleAgs4hovlihW23vnzSNVIQFQ8LbF6GKS', '23132', 'sapan5221@gmail.com', '3XVr6R_angelina_jolie_9-1366x768.jpg', 'vUabRcLNllwgekONfTsSoXxWKFGmirWsPZPuJybkIlOlUlB8A5RQnWwNvJRH', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'hossammqa', 'jasldkjasldj', '07/09/2015', '123456', '12312', '', '', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'internet application', 'jasldkjasldj', '09/25/2017', '$2y$10$FUaGeNx1YpIo6yUc710WNOlnYK.zzqok622Wm6LVPZiWic/FSzo6m', '23132sa', '', '', '2kPTrn1yPEM1to2OU1sOaNk1G3NVlHzhuVRc3GczArQZ0h6uxRu4WYOz2EwX', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'dsadsadasdas5', 'fgdfgdfsfsdddfsadsadassdgdfgdfg', '04/08/2015', '123456', '0178w21258222www2555', '', '', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'hassan', '18st asda', '07/15/2015', '$2y$10$2yWmD9KW/mqlBCZhT19xk.AMXttG2P/s3jLJE7Hn4Bdu.USlDUwR6', '012356', 'h_sapan52@hotmail.com', '', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'dsadsadasdas5', 'fgdfgdfsfsddddasdfsadsadassdgdfgdfg', '04/08/2015', '$2y$10$a73XsZnEHMtDF0BC6ozwMeqtEXrQqyGv.ilayiOdil5.ec6upyQ5W', '0178w21258222dasdwww2555', '', '', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 'dsadsadasdas5', 'fgdfgdfsfsddddasdfsadsadasdsadassdgdfgdfg', '04/08/2015', '$2y$10$r0lgjxz3gqGausft3n8L6eIKDbtnDsTd/bhSlI91zezV8vD8O7x9K', '0178w21258222dasdwwwdasdsa2555', '', '', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 'adasdsdas', ';sldkfls;dfk2', '05/03/2015', '$2y$10$oIBBA2WIZoe91VWnFE88QuYvCkWmAqwcuDkuxQrDgKysjr1.qToqO', '01123658894w2f', 'sapan5221@gmail.com', '', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 'computer scince', 'hkh', '05/17/2015', '$2y$10$AmVHH0tulSfaibDJJic3kOqu0mbKPbi8u2Xajr7L/2ks3j3wJNvBq', '13212', '', '', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 'computer scincek', 'hkh6', '05/04/2015', '$2y$10$wmYdfSrNIi.HuraLExX7OOnXWlJaNNIpwrjKr6OnFECB4qvezcmT.', '132126', '', '', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users_login`
--

CREATE TABLE IF NOT EXISTS `users_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_session` text COLLATE utf8_bin NOT NULL,
  `type` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=33 ;

--
-- Dumping data for table `users_login`
--

INSERT INTO `users_login` (`id`, `user_session`, `type`) VALUES
(2, 'sapan5221@gmail.com', 'Administrator'),
(3, '20120001', 'Student'),
(4, '20120001', 'Student'),
(5, 'hossam', 'Professor'),
(6, 'sapan5221@gmail.com', 'Administrator'),
(7, 'hossam', 'Professor'),
(8, 'hossam', 'Professor'),
(9, 'hossam', 'Professor'),
(10, 'hossam', 'Professor'),
(11, 'hossam', 'Professor'),
(12, 'sapan5221@gmail.com', 'Professor'),
(13, 'sapan5221@gmail.com', 'Professor'),
(14, 'sapan5221@gmail.com', 'Administrator'),
(15, 'sapan5221@gmail.com', 'Professor'),
(16, 'sapan5221@gmail.com', 'Professor'),
(17, 'sapan5221@gmail.com', 'Professor'),
(18, 'sapan5221@gmail.com', 'Administrator'),
(19, 'sapan5221@gmail.com', 'Professor'),
(20, 'sapan5221@gmail.com', 'Administrator'),
(21, 'sapan5221@gmail.com', 'Administrator'),
(22, 'sapan5221@gmail.com', 'Administrator'),
(23, 'sapan5221@gmail.com', 'Professor'),
(24, '20120001', 'Student'),
(25, '20120001', 'Student'),
(26, '20120001', 'Student'),
(27, 'sapan5221@gmail.com', 'Professor'),
(28, '20120001', 'Student'),
(29, 'sapan5221@gmail.com', 'Administrator'),
(30, 'sapan5221@gmail.com', 'Professor'),
(31, 'sapan5221@gmail.com', 'Professor'),
(32, '20120001', 'Student');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assignments`
--
ALTER TABLE `assignments`
  ADD CONSTRAINT `assignments_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `assignments_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `assignments_sub_teacher_id_foreign` FOREIGN KEY (`sub_teacher_id`) REFERENCES `sub_teacher` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_department_foreign` FOREIGN KEY (`department`) REFERENCES `department` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `course_fields`
--
ALTER TABLE `course_fields`
  ADD CONSTRAINT `course_fields_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `course_fields_field_id_foreign` FOREIGN KEY (`field_id`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `gpa`
--
ALTER TABLE `gpa`
  ADD CONSTRAINT `gpa_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `grade`
--
ALTER TABLE `grade`
  ADD CONSTRAINT `grade_course_field_id_foreign` FOREIGN KEY (`course_field_id`) REFERENCES `course_fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `grade_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `grade_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `prof_course`
--
ALTER TABLE `prof_course`
  ADD CONSTRAINT `prof_course_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `prof_course_prof_id_foreign` FOREIGN KEY (`prof_id`) REFERENCES `professor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `register_course_section`
--
ALTER TABLE `register_course_section`
  ADD CONSTRAINT `register_course_section_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `register_course_section_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `register_course_section_sub_teacher_id_foreign` FOREIGN KEY (`sub_teacher_id`) REFERENCES `sub_teacher` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student_total_grade`
--
ALTER TABLE `student_total_grade`
  ADD CONSTRAINT `student_total_grade_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_total_grade_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sub_teacher`
--
ALTER TABLE `sub_teacher`
  ADD CONSTRAINT `sub_teacher_prof_course_id_foreign` FOREIGN KEY (`prof_course_id`) REFERENCES `prof_course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sub_teacher_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
