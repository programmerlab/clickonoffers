-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 11, 2018 at 05:27 AM
-- Server version: 5.7.23-0ubuntu0.18.04.1
-- PHP Version: 7.2.10-1+ubuntu18.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `clickonoffer`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL COMMENT '0-inactive , 1-active',
  `is_developer` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0-developer , 1-other',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `name`, `email`, `password`, `image`, `status`, `is_developer`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Ok4Homes', 'admin@admin.com', '$2y$10$G8ILTi8Gmte4Te51RNAj2OiQ2zI5H3SNUfypMHV/MYoAe7J1v8XJ2', NULL, 1, 1, '1ZHfJKjBaNZJC9x8tlWaDl7Oy08evn1X7tGSdJljScd9rV9uQL6jwQGbOj5u', '2018-09-16 11:10:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ads_type`
--

CREATE TABLE `ads_type` (
  `id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `slug` varchar(250) NOT NULL,
  `image` varchar(500) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `all_countries`
--

CREATE TABLE `all_countries` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `flag` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `currency` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `currency_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `callingCodes` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `symbol` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0-inactive , 1-active',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `all_countries`
--

INSERT INTO `all_countries` (`id`, `name`, `flag`, `code`, `currency`, `currency_code`, `callingCodes`, `symbol`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Afghanistan', 'af', 'afg', 'Afghanis', 'AF', '93', '؋', 1, '2018-09-16 11:10:00', NULL, NULL),
(2, 'Albania', 'al', 'alb', 'Leke', 'ALL', '355', 'Lek', 1, '2018-09-16 11:10:00', NULL, NULL),
(3, 'Argentina', 'ar', 'arg', 'Pesos', 'ARS', '54', '$', 1, '2018-09-16 11:10:00', NULL, NULL),
(4, 'Aruba', 'aw', 'abw', 'Guilders', 'AWG', '297', 'ƒ', 1, '2018-09-16 11:10:00', NULL, NULL),
(5, 'Australia', 'au', 'aus', 'Dollars', 'AUD', '61', '$', 1, '2018-09-16 11:10:00', NULL, NULL),
(6, 'Azerbaijan', 'az', 'aze', 'New Manats', 'AZ', '994', 'ман', 1, '2018-09-16 11:10:00', NULL, NULL),
(7, 'Bahamas', 'bs', 'bhs', 'Dollars', 'BSD', '1242', '$', 1, '2018-09-16 11:10:00', NULL, NULL),
(8, 'Barbados', 'bb', 'brb', 'Dollars', 'BBD', '1246', '$', 1, '2018-09-16 11:10:00', NULL, NULL),
(9, 'Belarus', 'by', 'blr', 'Rubles', 'BYR', '375', 'p.', 1, '2018-09-16 11:10:00', NULL, NULL),
(10, 'Belgium', 'be', 'bel', 'Euro', 'EUR', '32', '€', 1, '2018-09-16 11:10:00', NULL, NULL),
(11, 'Bermuda', 'bm', 'bmu', 'Dollars', 'BMD', '1441', '$', 1, '2018-09-16 11:10:00', NULL, NULL),
(12, 'Bosnia and Herzegovina', 'ba', 'bih', 'Convertible Marka', 'BAM', '387', 'KM', 1, '2018-09-16 11:10:00', NULL, NULL),
(13, 'Botswana', 'bw', 'bwa', 'Pula\'s', 'BWP', '267', 'P', 1, '2018-09-16 11:10:00', NULL, NULL),
(14, 'Brazil', 'br', 'bra', 'Reais', 'BRL', '55', 'R$', 1, '2018-09-16 11:10:00', NULL, NULL),
(15, 'Brunei Darussalam', 'bn', 'brn', 'Dollars', 'BND', '673', '$', 1, '2018-09-16 11:10:00', NULL, NULL),
(16, 'Bulgaria', 'bg', 'bgr', 'Leva', 'BG', '359', 'лв', 1, '2018-09-16 11:10:00', NULL, NULL),
(17, 'Cambodia', 'kh', 'khm', 'Riels', 'KHR', '855', '៛', 1, '2018-09-16 11:10:00', NULL, NULL),
(18, 'Canada', 'ca', 'can', 'Dollars', 'CAD', '1', '$', 1, '2018-09-16 11:10:00', NULL, NULL),
(19, 'Cayman Islands', 'ky', 'cym', 'Dollars', 'KYD', '1345', '$', 1, '2018-09-16 11:10:00', NULL, NULL),
(20, 'Chile', 'cl', 'chl', 'Pesos', 'CLP', '56', '$', 1, '2018-09-16 11:10:00', NULL, NULL),
(21, 'China', 'cn', 'chn', 'Yuan Renminbi', 'CNY', '86', '¥', 1, '2018-09-16 11:10:00', NULL, NULL),
(22, 'Colombia', 'co', 'col', 'Pesos', 'COP', '57', '$', 1, '2018-09-16 11:10:00', NULL, NULL),
(23, 'Costa Rica', 'cr', 'cri', 'Colón', 'CRC', '506', '₡', 1, '2018-09-16 11:10:00', NULL, NULL),
(24, 'Croatia', 'hr', 'hrv', 'Kuna', 'HRK', '385', 'kn', 1, '2018-09-16 11:10:00', NULL, NULL),
(25, 'Cuba', 'cu', 'cub', 'Pesos', 'CUP', '53', '₱', 1, '2018-09-16 11:10:00', NULL, NULL),
(26, 'Cyprus', 'cy', 'cyp', 'Euro', 'EUR', '357', '€', 1, '2018-09-16 11:10:00', NULL, NULL),
(27, 'Denmark', 'dk', 'dnk', 'Kroner', 'DKK', '45', 'kr', 1, '2018-09-16 11:10:00', NULL, NULL),
(28, 'Dominican Republic', 'do', 'dom', 'Pesos', 'DOP', '1809', 'RD$', 1, '2018-09-16 11:10:00', NULL, NULL),
(29, 'Egypt', 'eg', 'egy', 'Pounds', 'EGP', '20', '£', 1, '2018-09-16 11:10:00', NULL, NULL),
(30, 'El Salvador', 'sv', 'slv', 'Colones', 'SVC', '503', '$', 1, '2018-09-16 11:10:00', NULL, NULL),
(31, 'Fiji', 'fj', 'fji', 'Dollars', 'FJD', '679', '$', 1, '2018-09-16 11:10:00', NULL, NULL),
(32, 'France', 'fr', 'fra', 'Euro', 'EUR', '33', '€', 1, '2018-09-16 11:10:00', NULL, NULL),
(33, 'Ghana', 'gh', 'gha', 'Cedis', 'GHC', '233', '¢', 1, '2018-09-16 11:10:00', NULL, NULL),
(34, 'Gibraltar', 'gi', 'gib', 'Pounds', 'GIP', '350', '£', 1, '2018-09-16 11:10:00', NULL, NULL),
(35, 'Greece', 'gr', 'grc', 'Euro', 'EUR', '30', '€', 1, '2018-09-16 11:10:00', NULL, NULL),
(36, 'Guatemala', 'gt', 'gtm', 'Quetzales', 'GTQ', '502', 'Q', 1, '2018-09-16 11:10:00', NULL, NULL),
(37, 'Guernsey', 'gg', 'ggy', 'Pounds', 'GGP', NULL, '£', 1, '2018-09-16 11:10:00', NULL, NULL),
(38, 'Guyana', 'gy', 'guy', 'Dollars', 'GYD', '592', '$', 1, '2018-09-16 11:10:00', NULL, NULL),
(39, 'Honduras', 'hn', 'hnd', 'Lempiras', 'HNL', '504', 'L', 1, '2018-09-16 11:10:00', NULL, NULL),
(40, 'Hong Kong', 'hk', 'hkg', 'Dollars', 'HKD', '852', '$', 1, '2018-09-16 11:10:00', NULL, NULL),
(41, 'Hungary', 'hu', 'hun', 'Forint', 'HUF', '36', 'Ft', 1, '2018-09-16 11:10:00', NULL, NULL),
(42, 'Iceland', 'is', 'isl', 'Kronur', 'ISK', '354', 'kr', 1, '2018-09-16 11:10:00', NULL, NULL),
(43, 'India', 'in', 'ind', 'Rupees', 'INR', '+91', '₹', 1, '2018-09-16 11:10:00', NULL, NULL),
(44, 'Indonesia', 'id', 'idn', 'Rupiahs', 'IDR', '62', 'Rp', 1, '2018-09-16 11:10:00', NULL, NULL),
(45, 'Ireland', 'ie', 'irl', 'Euro', 'EUR', '353', '€', 1, '2018-09-16 11:10:00', NULL, NULL),
(46, 'Isle of Man', 'im', 'imn', 'Pounds', 'IMP', '44', '£', 1, '2018-09-16 11:10:00', NULL, NULL),
(47, 'Israel', 'il', 'isr', 'New Shekels', 'ILS', '972', '₪', 1, '2018-09-16 11:10:00', NULL, NULL),
(48, 'Italy', 'it', 'ita', 'Euro', 'EUR', '39', '€', 1, '2018-09-16 11:10:00', NULL, NULL),
(49, 'Jamaica', 'jm', 'jam', 'Dollars', 'JMD', '1876', 'J$', 1, '2018-09-16 11:10:00', NULL, NULL),
(50, 'Japan', 'jp', 'jpn', 'Yen', 'JPY', '81', '¥', 1, '2018-09-16 11:10:00', NULL, NULL),
(51, 'Jersey', 'je', 'jey', 'Pounds', 'JEP', NULL, '£', 1, '2018-09-16 11:10:00', NULL, NULL),
(52, 'Kazakhstan', 'kz', 'kaz', 'Tenge', 'KZT', '7', 'лв', 1, '2018-09-16 11:10:00', NULL, NULL),
(53, 'Kyrgyzstan', 'kg', 'kgz', 'Soms', 'KGS', '996', 'лв', 1, '2018-09-16 11:10:00', NULL, NULL),
(54, 'Latvia', 'lv', 'lva', 'Lati', 'LVL', '371', 'Ls', 1, '2018-09-16 11:10:00', NULL, NULL),
(55, 'Lebanon', 'lb', 'lbn', 'Pounds', 'LBP', '961', '£', 1, '2018-09-16 11:10:00', NULL, NULL),
(56, 'Liberia', 'lr', 'lbr', 'Dollars', 'LRD', '231', '$', 1, '2018-09-16 11:10:00', NULL, NULL),
(57, 'Liechtenstein', 'li', 'lie', 'Switzerland Francs', 'CHF', '423', 'CHF', 1, '2018-09-16 11:10:00', NULL, NULL),
(58, 'Lithuania', 'lt', 'ltu', 'Litai', 'LTL', '370', 'Lt', 1, '2018-09-16 11:10:00', NULL, NULL),
(59, 'Luxembourg', 'lu', 'lux', 'Euro', 'EUR', '352', '€', 1, '2018-09-16 11:10:00', NULL, NULL),
(60, 'Malaysia', 'my', 'mys', 'Ringgits', 'MYR', '60', 'RM', 1, '2018-09-16 11:10:00', NULL, NULL),
(61, 'Malta', 'mt', 'mlt', 'Euro', 'EUR', '356', '€', 1, '2018-09-16 11:10:00', NULL, NULL),
(62, 'Mauritius', 'mu', 'mus', 'Rupees', 'MUR', '230', '₨', 1, '2018-09-16 11:10:00', NULL, NULL),
(63, 'Mexico', 'mx', 'mex', 'Pesos', 'MX', '52', '$', 1, '2018-09-16 11:10:00', NULL, NULL),
(64, ' Mongolia', 'mn', 'mng', 'Tugriks', 'MNT', '976', '₮', 1, '2018-09-16 11:10:00', NULL, NULL),
(65, 'Mozambique', 'mz', 'moz', 'Meticais', 'MZ', '258', 'MT', 1, '2018-09-16 11:10:00', NULL, NULL),
(66, 'Namibia', 'na', 'nam', 'Dollars', 'NAD', '264', '$', 1, '2018-09-16 11:10:00', NULL, NULL),
(67, 'Nepal', 'np', 'npl', 'Rupees', 'NPR', '977', '₨', 1, '2018-09-16 11:10:00', NULL, NULL),
(68, 'Netherlands', 'nl', 'nld', 'Euro', 'EUR', '31', '€', 1, '2018-09-16 11:10:00', NULL, NULL),
(69, 'New Zealand', 'nz', 'nzl', 'Dollars', 'NZD', '64', '$', 1, '2018-09-16 11:10:00', NULL, NULL),
(70, 'Nicaragua', 'ni', 'nic', 'Cordobas', 'NIO', '505', 'C$', 1, '2018-09-16 11:10:00', NULL, NULL),
(71, 'Nigeria', 'ng', 'nga', 'Nairas', 'NG', '234', '₦', 1, '2018-09-16 11:10:00', NULL, NULL),
(72, 'Norway', 'no', 'nor', 'Krone', 'NOK', '47', 'kr', 1, '2018-09-16 11:10:00', NULL, NULL),
(73, 'Oman', 'om', 'omn', 'Rials', 'OMR', '968', '﷼', 1, '2018-09-16 11:10:00', NULL, NULL),
(74, 'Pakistan', 'pk', 'pak', 'Rupees', 'PKR', '92', '₨', 1, '2018-09-16 11:10:00', NULL, NULL),
(75, 'Panama', 'pa', 'pan', 'Balboa', 'PAB', '507', 'B/.', 1, '2018-09-16 11:10:00', NULL, NULL),
(76, 'Paraguay', 'py', 'pry', 'Guarani', 'PYG', '595', 'Gs', 1, '2018-09-16 11:10:00', NULL, NULL),
(77, 'Peru', 'pe', 'per', 'Nuevos Soles', 'PE', '51', 'S/.', 1, '2018-09-16 11:10:00', NULL, NULL),
(78, 'Philippines', 'ph', 'phl', 'Pesos', 'PHP', '63', 'Php', 1, '2018-09-16 11:10:00', NULL, NULL),
(79, 'Poland', 'pl', 'pol', 'Zlotych', 'PL', '48', 'zł', 1, '2018-09-16 11:10:00', NULL, NULL),
(80, 'Qatar', 'qa', 'qat', 'Rials', 'QAR', '974', '﷼', 1, '2018-09-16 11:10:00', NULL, NULL),
(81, 'Romania', 'ro', 'rou', 'New Lei', 'RO', '40', 'lei', 1, '2018-09-16 11:10:00', NULL, NULL),
(82, 'Saudi Arabia', 'sa', 'sau', 'Riyals', 'SAR', '966', '﷼', 1, '2018-09-16 11:10:00', NULL, NULL),
(83, 'Serbia', 'rs', 'srb', 'Dinars', 'RSD', '381', 'Дин.', 1, '2018-09-16 11:10:00', NULL, NULL),
(84, 'Seychelles', 'sc', 'syc', 'Rupees', 'SCR', '248', '₨', 1, '2018-09-16 11:10:00', NULL, NULL),
(85, 'Singapore', 'sg', 'sgp', 'Dollars', 'SGD', '65', '$', 1, '2018-09-16 11:10:00', NULL, NULL),
(86, 'Slovenia', 'si', 'svn', 'Euro', 'EUR', '386', '€', 1, '2018-09-16 11:10:00', NULL, NULL),
(87, 'Solomon Islands', 'sb', 'slb', 'Dollars', 'SBD', '677', '$', 1, '2018-09-16 11:10:00', NULL, NULL),
(88, 'Somalia', 'so', 'som', 'Shillings', 'SOS', '252', 'S', 1, '2018-09-16 11:10:00', NULL, NULL),
(89, 'South Africa', 'za', 'zaf', 'Rand', 'ZAR', '27', 'R', 1, '2018-09-16 11:10:00', NULL, NULL),
(90, 'Spain', 'es', 'esp', 'Euro', 'EUR', '34', '€', 1, '2018-09-16 11:10:00', NULL, NULL),
(91, 'Sri Lanka', 'lk', 'lka', 'Rupees', 'LKR', '94', '₨', 1, '2018-09-16 11:10:00', NULL, NULL),
(92, 'Suriname', 'sr', 'sur', 'Dollars', 'SRD', '597', '$', 1, '2018-09-16 11:10:00', NULL, NULL),
(93, 'Sweden', 'se', 'swe', 'Kronor', 'SEK', '46', 'kr', 1, '2018-09-16 11:10:00', NULL, NULL),
(94, 'Switzerland', 'ch', 'che', 'Francs', 'CHF', '41', 'CHF', 1, '2018-09-16 11:10:00', NULL, NULL),
(95, 'Thailand', 'th', 'tha', 'Baht', 'THB', '66', '฿', 1, '2018-09-16 11:10:00', NULL, NULL),
(96, 'Trinidad and Tobago', 'tt', 'tto', 'Dollars', 'TTD', '1868', 'TT$', 1, '2018-09-16 11:10:00', NULL, NULL),
(97, 'Turkey', 'tr', 'tur', 'Lira', 'TRY', '90', 'TL', 1, '2018-09-16 11:10:00', NULL, NULL),
(98, 'Tuvalu', 'tv', 'tuv', 'Dollars', 'TVD', '688', '$', 1, '2018-09-16 11:10:00', NULL, NULL),
(99, 'Ukraine', 'ua', 'ukr', 'Hryvnia', 'UAH', '380', '₴', 1, '2018-09-16 11:10:00', NULL, NULL),
(100, 'United States of America', 'us', 'usa', 'Dollars', 'USD', '1', '$', 1, '2018-09-16 11:10:00', NULL, NULL),
(101, 'Uruguay', 'uy', 'ury', 'Pesos', 'UYU', '598', '$U', 1, '2018-09-16 11:10:00', NULL, NULL),
(102, 'Uzbekistan', 'uz', 'uzb', 'Sums', 'UZS', '998', 'лв', 1, '2018-09-16 11:10:00', NULL, NULL),
(103, 'Yemen', 'ye', 'yem', 'Rials', 'YER', '967', '﷼', 1, '2018-09-16 11:10:00', NULL, NULL),
(104, 'Zimbabwe', 'zw', 'zwe', 'Zimbabwe Dollars', 'ZWD', '263', 'Z$', 1, '2018-09-16 11:10:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `all_languages`
--

CREATE TABLE `all_languages` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `lang_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0-inactive , 1-active',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `all_languages`
--

INSERT INTO `all_languages` (`id`, `name`, `lang_code`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'English', 'en', 1, '2018-09-16 11:10:00', NULL, NULL),
(2, 'Afar', 'aa', 1, '2018-09-16 11:10:00', NULL, NULL),
(3, 'Abkhazian', 'ab', 1, '2018-09-16 11:10:00', NULL, NULL),
(4, 'Afrikaans', 'af', 1, '2018-09-16 11:10:00', NULL, NULL),
(5, 'Amharic', 'am', 1, '2018-09-16 11:10:00', NULL, NULL),
(6, 'Arabic', 'ar', 1, '2018-09-16 11:10:00', NULL, NULL),
(7, 'Assamese', 'as', 1, '2018-09-16 11:10:00', NULL, NULL),
(8, 'Aymara', 'ay', 1, '2018-09-16 11:10:00', NULL, NULL),
(9, 'Azerbaijani', 'az', 1, '2018-09-16 11:10:00', NULL, NULL),
(10, 'Bashkir', 'ba', 1, '2018-09-16 11:10:00', NULL, NULL),
(11, 'Belarusian', 'be', 1, '2018-09-16 11:10:00', NULL, NULL),
(12, 'Bulgarian', 'bg', 1, '2018-09-16 11:10:00', NULL, NULL),
(13, 'Bihari', 'bh', 1, '2018-09-16 11:10:00', NULL, NULL),
(14, 'Bislama', 'bi', 1, '2018-09-16 11:10:00', NULL, NULL),
(15, 'Bengali/Bangla', 'bn', 1, '2018-09-16 11:10:00', NULL, NULL),
(16, 'Tibetan', 'bo', 1, '2018-09-16 11:10:00', NULL, NULL),
(17, 'Breton', 'br', 1, '2018-09-16 11:10:00', NULL, NULL),
(18, 'Catalan', 'ca', 1, '2018-09-16 11:10:00', NULL, NULL),
(19, 'Corsican', 'co', 1, '2018-09-16 11:10:00', NULL, NULL),
(20, 'Czech', 'cs', 1, '2018-09-16 11:10:00', NULL, NULL),
(21, 'Welsh', 'cy', 1, '2018-09-16 11:10:00', NULL, NULL),
(22, 'Danish', 'da', 1, '2018-09-16 11:10:00', NULL, NULL),
(23, 'German', 'de', 1, '2018-09-16 11:10:00', NULL, NULL),
(24, 'Bhutani', 'dz', 1, '2018-09-16 11:10:00', NULL, NULL),
(25, 'Greek', 'el', 1, '2018-09-16 11:10:00', NULL, NULL),
(26, 'Esperanto', 'eo', 1, '2018-09-16 11:10:00', NULL, NULL),
(27, 'Spanish', 'es', 1, '2018-09-16 11:10:00', NULL, NULL),
(28, 'Estonian', 'et', 1, '2018-09-16 11:10:00', NULL, NULL),
(29, 'Basque', 'eu', 1, '2018-09-16 11:10:00', NULL, NULL),
(30, 'Persian', 'fa', 1, '2018-09-16 11:10:00', NULL, NULL),
(31, 'Finnish', 'fi', 1, '2018-09-16 11:10:00', NULL, NULL),
(32, 'Fiji', 'fj', 1, '2018-09-16 11:10:00', NULL, NULL),
(33, 'Faeroese', 'fo', 1, '2018-09-16 11:10:00', NULL, NULL),
(34, 'French', 'fr', 1, '2018-09-16 11:10:00', NULL, NULL),
(35, 'Frisian', 'fy', 1, '2018-09-16 11:10:00', NULL, NULL),
(36, 'Irish', 'ga', 1, '2018-09-16 11:10:00', NULL, NULL),
(37, 'Scots/Gaelic', 'gd', 1, '2018-09-16 11:10:00', NULL, NULL),
(38, 'Galician', 'gl', 1, '2018-09-16 11:10:00', NULL, NULL),
(39, 'Guarani', 'gn', 1, '2018-09-16 11:10:00', NULL, NULL),
(40, 'Gujarati', 'gu', 1, '2018-09-16 11:10:00', NULL, NULL),
(41, 'Hausa', 'ha', 1, '2018-09-16 11:10:00', NULL, NULL),
(42, 'Hindi', 'hi', 1, '2018-09-16 11:10:00', NULL, NULL),
(43, 'Croatian', 'hr', 1, '2018-09-16 11:10:00', NULL, NULL),
(44, 'Hungarian', 'hu', 1, '2018-09-16 11:10:00', NULL, NULL),
(45, 'Armenian', 'hy', 1, '2018-09-16 11:10:00', NULL, NULL),
(46, 'Interlingua', 'ia', 1, '2018-09-16 11:10:00', NULL, NULL),
(47, 'Interlingue', 'ie', 1, '2018-09-16 11:10:00', NULL, NULL),
(48, 'Inupiak', 'ik', 1, '2018-09-16 11:10:00', NULL, NULL),
(49, 'Indonesian', 'in', 1, '2018-09-16 11:10:00', NULL, NULL),
(50, 'Icelandic', 'is', 1, '2018-09-16 11:10:00', NULL, NULL),
(51, 'Italian', 'it', 1, '2018-09-16 11:10:00', NULL, NULL),
(52, 'Hebrew', 'iw', 1, '2018-09-16 11:10:00', NULL, NULL),
(53, 'Japanese', 'ja', 1, '2018-09-16 11:10:00', NULL, NULL),
(54, 'Yiddish', 'ji', 1, '2018-09-16 11:10:00', NULL, NULL),
(55, 'Javanese', 'jw', 1, '2018-09-16 11:10:00', NULL, NULL),
(56, 'Georgian', 'ka', 1, '2018-09-16 11:10:00', NULL, NULL),
(57, 'Kazakh', 'kk', 1, '2018-09-16 11:10:00', NULL, NULL),
(58, 'Greenlandic', 'kl', 1, '2018-09-16 11:10:00', NULL, NULL),
(59, 'Cambodian', 'km', 1, '2018-09-16 11:10:00', NULL, NULL),
(60, 'Kannada', 'kn', 1, '2018-09-16 11:10:00', NULL, NULL),
(61, 'Korean', 'ko', 1, '2018-09-16 11:10:00', NULL, NULL),
(62, 'Kashmiri', 'ks', 1, '2018-09-16 11:10:00', NULL, NULL),
(63, 'Kurdish', 'ku', 1, '2018-09-16 11:10:00', NULL, NULL),
(64, 'Kirghiz', 'ky', 1, '2018-09-16 11:10:00', NULL, NULL),
(65, 'Latin', 'la', 1, '2018-09-16 11:10:00', NULL, NULL),
(66, 'Lingala', 'ln', 1, '2018-09-16 11:10:00', NULL, NULL),
(67, 'Laothian', 'lo', 1, '2018-09-16 11:10:00', NULL, NULL),
(68, 'Lithuanian', 'lt', 1, '2018-09-16 11:10:00', NULL, NULL),
(69, 'Latvian/Lettish', 'lv', 1, '2018-09-16 11:10:00', NULL, NULL),
(70, 'Malagasy', 'mg', 1, '2018-09-16 11:10:00', NULL, NULL),
(71, 'Maori', 'mi', 1, '2018-09-16 11:10:00', NULL, NULL),
(72, 'Macedonian', 'mk', 1, '2018-09-16 11:10:00', NULL, NULL),
(73, 'Malayalam', 'ml', 1, '2018-09-16 11:10:00', NULL, NULL),
(74, 'Mongolian', 'mn', 1, '2018-09-16 11:10:00', NULL, NULL),
(75, 'Moldavian', 'mo', 1, '2018-09-16 11:10:00', NULL, NULL),
(76, 'Marathi', 'mr', 1, '2018-09-16 11:10:00', NULL, NULL),
(77, 'Malay', 'ms', 1, '2018-09-16 11:10:00', NULL, NULL),
(78, 'Maltese', 'mt', 1, '2018-09-16 11:10:00', NULL, NULL),
(79, 'Burmese', 'my', 1, '2018-09-16 11:10:00', NULL, NULL),
(80, 'Nauru', 'na', 1, '2018-09-16 11:10:00', NULL, NULL),
(81, 'Nepali', 'ne', 1, '2018-09-16 11:10:00', NULL, NULL),
(82, 'Dutch', 'nl', 1, '2018-09-16 11:10:00', NULL, NULL),
(83, 'Norwegian', 'no', 1, '2018-09-16 11:10:00', NULL, NULL),
(84, 'Occitan', 'oc', 1, '2018-09-16 11:10:00', NULL, NULL),
(85, '(Afan)/Oromoor/Oriya', 'om', 1, '2018-09-16 11:10:00', NULL, NULL),
(86, 'Punjabi', 'pa', 1, '2018-09-16 11:10:00', NULL, NULL),
(87, 'Polish', 'pl', 1, '2018-09-16 11:10:00', NULL, NULL),
(88, 'Pashto/Pushto', 'ps', 1, '2018-09-16 11:10:00', NULL, NULL),
(89, 'Portuguese', 'pt', 1, '2018-09-16 11:10:00', NULL, NULL),
(90, 'Quechua', 'qu', 1, '2018-09-16 11:10:00', NULL, NULL),
(91, 'Rhaeto-Romance', 'rm', 1, '2018-09-16 11:10:00', NULL, NULL),
(92, 'Kirundi', 'rn', 1, '2018-09-16 11:10:00', NULL, NULL),
(93, 'Romanian', 'ro', 1, '2018-09-16 11:10:00', NULL, NULL),
(94, 'Russian', 'ru', 1, '2018-09-16 11:10:00', NULL, NULL),
(95, 'Kinyarwanda', 'rw', 1, '2018-09-16 11:10:00', NULL, NULL),
(96, 'Sanskrit', 'sa', 1, '2018-09-16 11:10:00', NULL, NULL),
(97, 'Sindhi', 'sd', 1, '2018-09-16 11:10:00', NULL, NULL),
(98, 'Sangro', 'sg', 1, '2018-09-16 11:10:00', NULL, NULL),
(99, 'Serbo-Croatian', 'sh', 1, '2018-09-16 11:10:00', NULL, NULL),
(100, 'Singhalese', 'si', 1, '2018-09-16 11:10:00', NULL, NULL),
(101, 'Slovak', 'sk', 1, '2018-09-16 11:10:00', NULL, NULL),
(102, 'Slovenian', 'sl', 1, '2018-09-16 11:10:00', NULL, NULL),
(103, 'Samoan', 'sm', 1, '2018-09-16 11:10:00', NULL, NULL),
(104, 'Shona', 'sn', 1, '2018-09-16 11:10:00', NULL, NULL),
(105, 'Somali', 'so', 1, '2018-09-16 11:10:00', NULL, NULL),
(106, 'Albanian', 'sq', 1, '2018-09-16 11:10:00', NULL, NULL),
(107, 'Serbian', 'sr', 1, '2018-09-16 11:10:00', NULL, NULL),
(108, 'Siswati', 'ss', 1, '2018-09-16 11:10:00', NULL, NULL),
(109, 'Sesotho', 'st', 1, '2018-09-16 11:10:00', NULL, NULL),
(110, 'Sundanese', 'su', 1, '2018-09-16 11:10:00', NULL, NULL),
(111, 'Swedish', 'sv', 1, '2018-09-16 11:10:00', NULL, NULL),
(112, 'Swahili', 'sw', 1, '2018-09-16 11:10:00', NULL, NULL),
(113, 'Tamil', 'ta', 1, '2018-09-16 11:10:00', NULL, NULL),
(114, 'Telugu', 'te', 1, '2018-09-16 11:10:00', NULL, NULL),
(115, 'Tajik', 'tg', 1, '2018-09-16 11:10:00', NULL, NULL),
(116, 'Thai', 'th', 1, '2018-09-16 11:10:00', NULL, NULL),
(117, 'Tigrinya', 'ti', 1, '2018-09-16 11:10:00', NULL, NULL),
(118, 'Turkmen', 'tk', 1, '2018-09-16 11:10:00', NULL, NULL),
(119, 'Tagalog', 'tl', 1, '2018-09-16 11:10:00', NULL, NULL),
(120, 'Setswana', 'tn', 1, '2018-09-16 11:10:00', NULL, NULL),
(121, 'Tonga', 'to', 1, '2018-09-16 11:10:00', NULL, NULL),
(122, 'Turkish', 'tr', 1, '2018-09-16 11:10:00', NULL, NULL),
(123, 'Tsonga', 'ts', 1, '2018-09-16 11:10:00', NULL, NULL),
(124, 'Tatar', 'tt', 1, '2018-09-16 11:10:00', NULL, NULL),
(125, 'Twi', 'tw', 1, '2018-09-16 11:10:00', NULL, NULL),
(126, 'Ukrainian', 'uk', 1, '2018-09-16 11:10:00', NULL, NULL),
(127, 'Urdu', 'ur', 1, '2018-09-16 11:10:00', NULL, NULL),
(128, 'Uzbek', 'uz', 1, '2018-09-16 11:10:00', NULL, NULL),
(129, 'Vietnamese', 'vi', 1, '2018-09-16 11:10:00', NULL, NULL),
(130, 'Volapuk', 'vo', 1, '2018-09-16 11:10:00', NULL, NULL),
(131, 'Wolof', 'wo', 1, '2018-09-16 11:10:00', NULL, NULL),
(132, 'Xhosa', 'xh', 1, '2018-09-16 11:10:00', NULL, NULL),
(133, 'Yoruba', 'yo', 1, '2018-09-16 11:10:00', NULL, NULL),
(134, 'Chinese', 'zh', 1, '2018-09-16 11:10:00', NULL, NULL),
(135, 'Zulu', 'zu', 1, '2018-09-16 11:10:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` text COLLATE utf8_unicode_ci,
  `sub_category_image` text COLLATE utf8_unicode_ci,
  `category_image` text COLLATE utf8_unicode_ci,
  `sub_category_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci,
  `description` text COLLATE utf8_unicode_ci,
  `meta_key` text COLLATE utf8_unicode_ci,
  `parent_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `level` int(10) UNSIGNED DEFAULT '1',
  `status` tinyint(1) DEFAULT '1',
  `meta_title` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `slug`, `category_name`, `url`, `sub_category_image`, `category_image`, `sub_category_name`, `meta_description`, `description`, `meta_key`, `parent_id`, `order_id`, `level`, `status`, `meta_title`, `created_at`, `updated_at`) VALUES
(87, 'category1', 'Category1', 'category/category1', '1537206318natural-cow-ghee-500x500.jpg', 'storage/uploads/category/15392078331537354103IMG_20180804_200135.jpg', 'Masoor Dal', NULL, 'category 1', NULL, 0, NULL, 1, 1, NULL, '2017-04-20 20:30:06', '2018-10-10 16:13:53'),
(116, 'sub-cat1', 'Sub Category1', 'category/116', 'storage/uploads/category/15379115133.png', 'storage/uploads/category/15379137503.png', 'sub cat1', NULL, NULL, NULL, 116, NULL, 3, 1, NULL, '2018-09-25 16:08:33', '2018-10-07 15:14:03'),
(121, 'dsf', 'Sub Category1', 'category/dsf', NULL, 'storage/uploads/category/15379137503.png', NULL, NULL, 'dsfds', NULL, 0, NULL, 1, 1, NULL, '2018-09-25 16:45:50', '2018-09-25 16:45:50'),
(123, 'sub-category2', 'Sub Category2', 'category/sub-category2', NULL, 'storage/uploads/category/15390410631537354103IMG_20180804_200135.jpg', NULL, NULL, NULL, NULL, 0, NULL, 1, 1, NULL, NULL, '2018-10-08 17:54:23'),
(124, 'test', 'test', 'category/test', NULL, 'storage/uploads/category/15390410481537354103IMG_20180804_200135.jpg', NULL, NULL, '<p>test</p>', NULL, 0, NULL, 1, 1, NULL, '2018-10-08 17:54:08', '2018-10-08 17:54:08');

-- --------------------------------------------------------

--
-- Table structure for table `country_languages`
--

CREATE TABLE `country_languages` (
  `id` int(11) NOT NULL,
  `country_id` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `default_language_id` int(11) DEFAULT NULL,
  `add_languages` text,
  `other_information` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2018_09_16_062807_create_admin_users_table', 1),
(2, '2018_09_16_062857_create_all_countries_table', 1),
(3, '2018_09_16_062935_create_all_languages_table', 1),
(4, '2018_09_16_064630_create_languages_table', 1),
(5, '2018_09_16_084831_create_modules_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` int(10) UNSIGNED NOT NULL,
  `module_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` tinyint(4) NOT NULL DEFAULT '0',
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `module_type` tinyint(4) NOT NULL COMMENT '0-main (free) , 1-other (paid), 2-admin',
  `short_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0-inactive , 1-active',
  `re_order` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `offer_type`
--

CREATE TABLE `offer_type` (
  `id` int(11) NOT NULL,
  `offer_name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0-inactive , 1-active',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1-admin, 2-user,3-vendor',
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `role_type`, `slug`, `description`, `status`, `type`, `permissions`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3, 'Admin', '1', 'Admin', 'Admin', 1, 1, '{\"SingleUsers\":{\"read\":\"1\",\"write\":\"1\",\"delete\":\"1\"},\"Advertiser\":{\"read\":\"1\",\"write\":\"1\",\"delete\":\"1\"},\"Vendor\":{\"read\":\"1\",\"write\":\"1\",\"delete\":\"1\"},\"Settings\":{\"read\":\"1\",\"write\":\"1\",\"delete\":\"1\"},\"Category\":{\"read\":\"1\",\"write\":\"1\",\"delete\":\"1\"},\"SubCategory\":{\"read\":\"1\",\"write\":\"1\",\"delete\":\"1\"},\"Product\":{\"read\":\"1\",\"write\":\"1\",\"delete\":\"1\"}}', '2018-07-12 00:04:04', '2018-10-08 14:37:43', NULL),
(6, 'User', '2', 'User', 'User', 1, 2, 'null', '2018-09-16 16:03:02', '2018-10-08 14:38:58', NULL),
(7, 'Advertiser', '3', 'Advertiser', 'Advertiser', 1, 3, '{\"Module\":{\"admin\":{\"read\":\"1\",\"write\":\"1\",\"delete\":\"1\"}}}', '2018-09-16 16:17:15', '2018-09-22 17:12:09', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `field_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `field_key`, `field_value`, `created_at`, `updated_at`) VALUES
(44, 'website_title', 'Nuvka global export import company ', '2017-04-15 17:31:06', '2018-09-19 08:26:47'),
(45, 'website_email', 'kroy.iips@gmail.com', '2017-04-15 17:31:07', '2018-09-09 17:55:43'),
(46, 'website_url', 'http://localhost/noovka', '2017-04-15 17:31:07', '2018-09-19 08:20:32'),
(47, 'contact_number', '+91-7974343960', '2017-04-15 17:31:07', '2018-05-23 19:02:38'),
(48, 'company_address', '<p>istanbul </p>\r\n\r\n<p>80027</p>\r\n', '2017-04-15 17:31:07', '2018-09-09 17:31:06'),
(49, 'banner_image1', '15373858531.jpeg', '2017-04-15 17:31:07', '2018-09-19 15:07:33'),
(53, '_method', 'PATCH', '2017-04-15 18:06:33', '2017-04-15 18:06:33'),
(54, 'banner_image2', '15373856792.jpeg', '2017-04-20 12:49:23', '2018-09-19 15:04:39'),
(55, 'banner_image3', '15373856793.png', '2017-04-20 12:49:23', '2018-09-19 15:04:39'),
(56, 'meta_key', 'Novika', '2018-06-05 16:39:18', '2018-09-09 17:55:43'),
(57, 'meta_description', 'Novika', '2018-06-05 16:39:18', '2018-09-09 17:55:43'),
(58, 'banner_image1_heading', 'Your New Sunday Location', '2018-07-26 04:11:49', '2018-07-26 04:30:27'),
(59, 'banner_image1_subheading', 'Start selling immediately in your low-commission market place.', '2018-07-26 04:20:46', '2018-07-26 04:30:43'),
(60, 'banner_image2_heading', 'Your New Sunday Location', '2018-07-26 04:22:34', '2018-07-26 04:33:30'),
(61, 'banner_image2_subheading', 'Start selling immediately in your low-commission market place.', '2018-07-26 04:22:34', '2018-07-26 04:33:31'),
(62, 'banner_image3_heading', 'Your New Sunday Location', '2018-07-26 04:23:57', '2018-07-26 04:33:31'),
(63, 'banner_image3_subheading', 'Start selling immediately in your low-commission market place.', '2018-07-26 04:23:57', '2018-07-26 04:33:31'),
(64, 'banner_image1_small', '1534510778indirim-kazan.jpg', '2018-07-26 04:39:05', '2018-08-17 09:59:38'),
(65, 'banner_image2_small', '1534510791sepette-indirim.jpg', '2018-07-26 04:40:15', '2018-08-17 09:59:51'),
(66, 'google_tag', '<script>\r\n</script>', '2018-08-17 09:26:36', '2018-08-17 09:26:57'),
(67, 'google_analytic', ' <script>\r\n</script>', '2018-08-18 10:25:07', '2018-08-18 10:25:07'),
(68, 'fb_id', 'https://facebook.com', '2018-08-21 08:33:43', '2018-08-21 08:33:43'),
(69, 'twitter_id', 'https://twitter.com', '2018-08-21 08:33:43', '2018-08-21 08:33:51'),
(70, 'linkedin_id', 'https://linkedin.com', '2018-08-21 08:33:43', '2018-08-21 08:33:58'),
(71, 'pinterest_id', 'https://pinterest.com', '2018-08-21 08:33:43', '2018-08-21 08:34:09'),
(72, 'instagram_id', 'https://instagram.com', '2018-08-21 08:33:43', '2018-08-21 08:34:09'),
(73, 'youtube_id', 'https://youtube.com', '2018-08-21 08:33:43', '2018-08-21 08:34:09'),
(74, 'google_id', 'https://google.com', '2018-08-21 08:33:43', '2018-08-21 08:34:09'),
(75, 'flicker_id', 'https://flicker.com', '2018-08-21 08:33:43', '2018-08-21 08:34:09'),
(76, 'skype_id', 'https://skype.com', '2018-08-21 08:33:43', '2018-08-21 08:34:09'),
(77, 'phone', '888888888', '2018-09-09 17:31:06', '2018-09-19 08:20:32'),
(78, 'mobile', '8103194076', '2018-09-09 17:31:06', '2018-09-09 17:55:43'),
(79, 'meta_title', 'Novika', '2018-09-09 17:31:06', '2018-09-09 17:55:43'),
(80, 'website_description', 'Nuvka global export import company ', '2018-09-09 17:31:06', '2018-09-19 08:48:44'),
(81, 'google_analytics_code', '', '2018-09-09 17:31:06', '2018-09-09 17:31:06'),
(82, 'facebook_url', 'kundan roy', '2018-09-09 17:31:06', '2018-09-09 17:55:43'),
(83, 'linkedin_url', 'https://www.linkedin.com/company/1marketresearch.com/', '2018-09-09 17:31:06', '2018-09-09 17:31:06'),
(84, 'twitter_url', 'https://twitter.com/1marketresearc1', '2018-09-09 17:31:06', '2018-09-09 17:31:06'),
(85, 'MAIL_HOST', '', '2018-09-09 17:31:06', '2018-09-09 17:31:06'),
(86, 'MAIL_PORT', '587', '2018-09-09 17:31:06', '2018-09-09 17:31:06'),
(87, 'MAIL_USERNAME', '', '2018-09-09 17:31:06', '2018-09-09 17:31:06'),
(88, 'MAIL_PASSWORD', '', '2018-09-09 17:31:06', '2018-09-09 17:31:06'),
(89, 'MAIL_ENCRYPTION', 'tls', '2018-09-09 17:31:06', '2018-09-09 17:31:06'),
(90, 'MAIL_FROM', '1marketresearch', '2018-09-09 17:31:06', '2018-09-09 17:31:06'),
(91, 'MAIL_TO', 'admin@1marketresearch.com', '2018-09-09 17:31:06', '2018-09-09 17:31:06'),
(92, 'website_logo', '15373614321537354103IMG_20180804_200135.jpg', '2018-09-09 17:31:06', '2018-09-19 08:20:32');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `about_me` text COLLATE utf8_unicode_ci,
  `profile_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `tagLine` text COLLATE utf8_unicode_ci,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birthday` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `skills` text COLLATE utf8_unicode_ci,
  `modeOfreach` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `language` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `qualification` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `workExperience` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `percentageCompletion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rating` tinyint(4) NOT NULL DEFAULT '4',
  `current_balance` float(10,2) NOT NULL DEFAULT '0.00',
  `total_balance` float(10,2) NOT NULL DEFAULT '0.00',
  `skill_completion` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `profile_completion` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `badges` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provider_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `abn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `about_me`, `profile_image`, `phone`, `role_type`, `email`, `password`, `remember_token`, `status`, `tagLine`, `location`, `birthday`, `skills`, `modeOfreach`, `language`, `qualification`, `workExperience`, `percentageCompletion`, `rating`, `current_balance`, `total_balance`, `skill_completion`, `profile_completion`, `badges`, `user_type`, `provider_id`, `abn`, `created_at`, `updated_at`) VALUES
(178, 'kundan', 'roy', 'test', NULL, '8103194076', '1', 'kroy.iips@gmail.com', 'admin', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, '2018-07-01 12:41:57', '2018-10-10 21:31:26'),
(192, 'kundan', 'roy2', NULL, 'storage/uploads/profile/15392078941537354103IMG_20180804_200135.jpg', '8103194076', '3', 'kandsy2@admin.coms', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, '2018-09-22 22:13:08', '2018-10-10 21:47:47'),
(194, 'kundan', 'roy', NULL, 'storage/uploads/profile/15376552991.jpeg', '8103194076', '2', 'kandssy2s@admin.coms', '123456', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, '2018-09-22 22:16:53', '2018-09-22 22:49:23'),
(195, 'kundan', 'roy', NULL, NULL, '8103194076', '1', 'kroy.iip2s@gmail.com', '1234567', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, '2018-10-10 21:08:14', '2018-10-10 21:13:02');

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE `user_details` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_detail` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `all_countries`
--
ALTER TABLE `all_countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `all_languages`
--
ALTER TABLE `all_languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `all_countries`
--
ALTER TABLE `all_countries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;
--
-- AUTO_INCREMENT for table `all_languages`
--
ALTER TABLE `all_languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=196;
--
-- AUTO_INCREMENT for table `user_details`
--
ALTER TABLE `user_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
