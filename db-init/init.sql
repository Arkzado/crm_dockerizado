-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 22, 2025 at 07:49 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `crm_erp_admin`
--

-- --------------------------------------------------------

--
-- Table structure for table `activities`
--

CREATE TABLE `activities` (
  `id` int(11) NOT NULL,
  `subject` varchar(250) DEFAULT NULL,
  `due_date` datetime NOT NULL,
  `type` varchar(60) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1: Pendiente\r\n2: Completado',
  `notes` varchar(250) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `client_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `activities`
--

INSERT INTO `activities` (`id`, `subject`, `due_date`, `type`, `status`, `notes`, `user_id`, `client_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3, 'Finalizacion del proyecto', '2025-10-23 14:39:14', 'Importante', 1, 'Deben entregarlo a camilo', 1, NULL, '2025-10-19 19:39:47', '2025-10-19 19:39:47', NULL),
(5, 'Entrega', '2025-10-23 00:00:00', 'Llamada', 1, NULL, 10, 1, '2025-10-20 00:38:03', '2025-10-20 00:38:03', NULL),
(6, 'Junta de negocios', '2025-10-22 00:00:00', 'Reunion', 2, NULL, 1, 1, '2025-10-20 00:59:55', '2025-10-20 06:28:26', '2025-10-20 01:28:26'),
(7, 'Junta de negocios', '2025-10-30 00:00:00', 'Llamada', 1, NULL, 1, 2, '2025-10-22 02:27:28', '2025-10-22 02:27:28', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `surname` varchar(250) DEFAULT NULL,
  `full_name` varchar(250) NOT NULL,
  `client_segment_id` bigint(20) UNSIGNED NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(250) DEFAULT NULL,
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1-cliente, 2-empresa',
  `type_document` varchar(150) DEFAULT NULL,
  `n_document` varchar(50) NOT NULL,
  `birthdate` timestamp NULL DEFAULT NULL COMMENT 'Fecha de cumpleaños para enviar correo',
  `sucursal_id` bigint(20) DEFAULT NULL,
  `asesor_id` bigint(20) DEFAULT NULL,
  `state` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `is_parcial` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1 es no parcial 2 es parcial',
  `address` varchar(250) DEFAULT NULL,
  `ubigeo_municipio` varchar(25) DEFAULT NULL,
  `ubigeo_departamento` varchar(25) DEFAULT NULL,
  `municipio` varchar(80) DEFAULT NULL,
  `departamento` varchar(80) DEFAULT NULL,
  `origen` varchar(50) DEFAULT NULL,
  `sexo` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 masculino 2 femenino',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `name`, `surname`, `full_name`, `client_segment_id`, `phone`, `email`, `type`, `type_document`, `n_document`, `birthdate`, `sucursal_id`, `asesor_id`, `state`, `is_parcial`, `address`, `ubigeo_municipio`, `ubigeo_departamento`, `municipio`, `departamento`, `origen`, `sexo`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Juan', 'Perez Tienda', 'Juan Perez Tienda', 1, '3151234567', 'juan.perez@tienda.com', 1, 'CC', '79000001', '1985-05-15 00:00:00', NULL, 2, 1, 1, 'Calle Falsa 123', '66001', '66', 'Pereira', 'Risaralda', 'REFERIDO', 1, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL),
(2, 'Supermercado', 'La Economia SAS', 'Supermercado La Economia SAS', 2, '3201234567', 'compras@laeconomia.com', 2, 'NIT', '900123456-7', NULL, NULL, 3, 1, 1, 'Av. Circunvalar #5-30', '66170', '66', 'Dosquebradas', 'Risaralda', 'WEB', 1, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL),
(3, 'Maria', 'Gomez Dist.', 'Maria Gomez Dist.', 3, '3181234567', 'maria.gomez@distri.com', 1, 'CC', '1088000001', '1990-11-20 00:00:00', NULL, 2, 1, 2, 'Conjunto Cerrado El Portal', '66001', '66', 'Pereira', 'Risaralda', 'LLAMADA', 2, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL),
(4, 'Carlos', 'Restrepo VIP', 'Carlos Restrepo VIP', 4, '3141234567', 'carlos.restrepo@vip.net', 1, 'CC', '1088000002', '1978-01-10 00:00:00', NULL, 3, 1, 1, 'Carrera 8 #15-20 Apto 501', '66001', '66', 'Pereira', 'Risaralda', 'REFERIDO', 1, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `client_segments`
--

CREATE TABLE `client_segments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(250) NOT NULL,
  `state` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `client_segments`
--

INSERT INTO `client_segments` (`id`, `name`, `state`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Minorista', 1, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL),
(2, 'Mayorista', 1, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL),
(3, 'Distribuidor', 1, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL),
(4, 'VIP', 1, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `method_payments`
--

CREATE TABLE `method_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(250) NOT NULL,
  `method_payment_id` bigint(20) UNSIGNED DEFAULT NULL,
  `state` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `method_payments`
--

INSERT INTO `method_payments` (`id`, `name`, `method_payment_id`, `state`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Efectivo', NULL, 1, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL),
(2, 'Transferencia Bancaria', NULL, 1, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL),
(3, 'Nequi', NULL, 1, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL),
(4, 'Daviplata', NULL, 1, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL),
(5, 'Bancolombia', 2, 1, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL),
(6, 'Davivienda', 2, 1, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL),
(7, 'Banco de Bogotá', 2, 1, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2025_09_14_021604_create_permission_tables', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(1, 'App\\Models\\User', 10),
(2, 'App\\Models\\User', 7),
(2, 'App\\Models\\User', 8),
(2, 'App\\Models\\User', 9),
(2, 'App\\Models\\User', 11),
(2, 'App\\Models\\User', 12);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'register_role', 'api', '2025-09-22 07:49:57', '2025-09-22 07:49:57'),
(2, 'edit_role', 'api', '2025-09-22 07:49:57', '2025-09-22 07:49:57'),
(3, 'delete_role', 'api', '2025-09-22 07:49:57', '2025-09-22 07:49:57'),
(4, 'register_user', 'api', '2025-09-22 07:49:57', '2025-09-22 07:49:57'),
(5, 'edit_user', 'api', '2025-09-22 07:49:57', '2025-09-22 07:49:57'),
(6, 'delete_user', 'api', '2025-09-22 07:49:58', '2025-09-22 07:49:58'),
(7, 'register_product', 'api', '2025-09-22 07:49:58', '2025-09-22 07:49:58'),
(8, 'edit_product', 'api', '2025-09-22 07:49:58', '2025-09-22 07:49:58'),
(9, 'delete_product', 'api', '2025-09-22 07:49:58', '2025-09-22 07:49:58'),
(10, 'show_wallet_price_product', 'api', '2025-09-22 07:49:58', '2025-09-22 07:49:58'),
(11, 'register_wallet_price_product', 'api', '2025-09-22 07:49:58', '2025-09-22 07:49:58'),
(12, 'edit_wallet_price_product', 'api', '2025-09-22 07:49:58', '2025-09-22 07:49:58'),
(13, 'delete_wallet_price_product', 'api', '2025-09-22 07:49:58', '2025-09-22 07:49:58'),
(14, 'register_clientes', 'api', '2025-09-22 07:49:58', '2025-09-22 07:49:58'),
(15, 'edit_clientes', 'api', '2025-09-22 07:49:58', '2025-09-22 07:49:58'),
(16, 'delete_clientes', 'api', '2025-09-22 07:49:58', '2025-09-22 07:49:58'),
(17, 'valid_payments', 'api', '2025-09-22 07:49:58', '2025-09-22 07:49:58'),
(18, 'reports_caja', 'api', '2025-09-22 07:49:58', '2025-09-22 07:49:58'),
(19, 'record_contract_process', 'api', '2025-09-22 07:49:58', '2025-09-22 07:49:58'),
(20, 'egreso', 'api', '2025-09-22 07:49:58', '2025-09-22 07:49:58'),
(21, 'ingreso', 'api', '2025-09-22 07:49:58', '2025-09-22 07:49:58'),
(22, 'close_caja', 'api', '2025-09-22 07:49:58', '2025-09-22 07:49:58'),
(23, 'register_proforma', 'api', '2025-09-22 07:49:58', '2025-09-22 07:49:58'),
(24, 'edit_proforma', 'api', '2025-09-22 07:49:58', '2025-09-22 07:49:58'),
(25, 'delete_proforma', 'api', '2025-09-22 07:49:58', '2025-09-22 07:49:58'),
(26, 'cronograma', 'api', '2025-09-22 07:49:58', '2025-09-22 07:49:58'),
(27, 'comisiones', 'api', '2025-09-22 07:49:58', '2025-09-22 07:49:58'),
(28, 'register_compra', 'api', '2025-09-22 07:49:58', '2025-09-22 07:49:58'),
(29, 'edit_compra', 'api', '2025-09-22 07:49:58', '2025-09-22 07:49:58'),
(30, 'delete_compra', 'api', '2025-09-22 07:49:58', '2025-09-22 07:49:58'),
(31, 'register_transporte', 'api', '2025-09-22 07:49:58', '2025-09-22 07:49:58'),
(32, 'edit_transporte', 'api', '2025-09-22 07:49:58', '2025-09-22 07:49:58'),
(33, 'delete_transporte', 'api', '2025-09-22 07:49:58', '2025-09-22 07:49:58'),
(34, 'despacho', 'api', '2025-09-22 07:49:58', '2025-09-22 07:49:58'),
(35, 'movimientos', 'api', '2025-09-22 07:49:58', '2025-09-22 07:49:58'),
(36, 'kardex', 'api', '2025-09-22 07:49:58', '2025-09-22 07:49:58'),
(37, 'list-product', 'api', NULL, NULL),
(38, 'list_proforma', 'api', NULL, NULL),
(39, 'list_compra', 'api', NULL, NULL),
(40, 'list_transporte', 'api', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(250) NOT NULL,
  `product_categorie_id` bigint(20) UNSIGNED NOT NULL,
  `imagen` varchar(250) DEFAULT NULL,
  `sku` varchar(250) NOT NULL,
  `state` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1 activo 2 inactivo',
  `state_stock` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1 disponible 2 por agotar 3 agotado',
  `price_general` double NOT NULL,
  `description` longtext DEFAULT NULL,
  `specifications` longtext DEFAULT NULL,
  `is_discount` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 es sin descuento y 2 descuento',
  `min_discount` double DEFAULT NULL,
  `max_discount` double DEFAULT NULL,
  `is_gift` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '1 es no gratuito y 2 gratis',
  `tax_selected` tinyint(1) DEFAULT NULL,
  `importe_iva` double DEFAULT NULL,
  `umbral` double DEFAULT NULL,
  `umbral_unit_id` bigint(20) UNSIGNED DEFAULT NULL,
  `disponibilidad` tinyint(1) DEFAULT 1 COMMENT '1 es vender productos sin stock, 2 no vender productos sin stock y 3 proyectar con los contratos que se tenga',
  `tiempo_de_abastecimiento` double DEFAULT NULL,
  `provider_id` bigint(20) UNSIGNED DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `width` double DEFAULT NULL,
  `height` double DEFAULT NULL,
  `length` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `product_categorie_id`, `imagen`, `sku`, `state`, `state_stock`, `price_general`, `description`, `specifications`, `is_discount`, `min_discount`, `max_discount`, `is_gift`, `tax_selected`, `importe_iva`, `umbral`, `umbral_unit_id`, `disponibilidad`, `tiempo_de_abastecimiento`, `provider_id`, `weight`, `width`, `height`, `length`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Gaseosa Postobón Manzana 2L', 1, 'products/gaseosa_manzana_2l.jpg', 'POS-MAN-2L', 1, 1, 3500, 'Refrescante Gaseosa Postobón sabor a Manzana en presentación de 2 Litros.', '[{\"key_v\":\"Volumen\",\"value_v\":\"2 Litros\"},{\"key_v\":\"Sabor\",\"value_v\":\"Manzana\"}]', 1, 0, 0, 1, 2, 19, 20, 1, 1, 3, 1, 2.1, 10, 30, 10, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL),
(2, 'Papas Margarita Pollo Mega', 2, 'products/papas_pollo_mega.jpg', 'MAR-POL-MG', 1, 1, 4000, 'Crujientes Papas Margarita sabor a Pollo en tamaño Mega.', NULL, 2, 5, 15, 1, 2, 19, 50, 5, 1, 2, 2, 0.15, 20, 25, 3, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL),
(3, 'Detergente FAB Floral 1Kg', 3, 'products/fab_floral_1kg.jpg', 'FAB-FLO-1K', 1, 1, 12000, 'Detergente en polvo FAB con aroma Floral, bolsa de 1 Kilogramo.', NULL, 1, 0, 0, 1, 2, 19, 10, 7, 1, 5, 3, 1.05, 15, 25, 5, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL),
(4, 'Agua Cristal Sin Gas 600ml', 1, 'products/agua_cristal_600ml.jpg', 'CRI-SNG-600', 1, 1, 1500, 'Agua purificada Cristal sin gas en botella de 600ml.', NULL, 1, 0, 0, 1, 1, 0, 100, 1, 2, 1, 1, 0.62, 7, 20, 7, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL),
(5, 'Shampoo Johnson Baby Original 200ml', 4, 'products/shampoo_johnson_200ml.jpg', 'JNJ-SHB-200', 1, 1, 9500, 'Shampoo Johnson\'s Baby Original, fórmula suave No Más Lágrimas.', '[{\"key_v\":\"Volumen\",\"value_v\":\"200 ml\"}]', 1, 0, 0, 1, 2, 19, 30, 1, 1, 7, 4, 0.23, 5, 15, 5, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL),
(6, 'Arroz Diana Premium Bolsa 500gr', 5, 'products/arroz_diana_500gr.jpg', 'DIA-ARR-500', 1, 1, 2800, 'Arroz Diana Premium, seleccionado grano a grano. Bolsa de 500 gramos.', '[]', 1, 0, 0, 1, 1, 0, 100, 8, 1, 4, 5, 0.51, 10, 20, 3, '2025-10-21 04:05:14', '2025-10-21 04:05:39', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(250) NOT NULL,
  `imagen` varchar(250) NOT NULL,
  `state` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`id`, `name`, `imagen`, `state`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Bebidas', 'categories/bebidas.png', 1, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL),
(2, 'Snacks y Pasabocas', 'categories/snacks.png', 1, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL),
(3, 'Aseo Hogar', 'categories/aseo_hogar.png', 1, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL),
(4, 'Cuidado Personal', 'categories/cuidado_personal.png', 1, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL),
(5, 'Granos y Cereales', 'categories/granos.png', 1, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_wallets`
--

CREATE TABLE `product_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `unit_id` bigint(20) UNSIGNED NOT NULL,
  `client_segment_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sucursale_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_wallets`
--

INSERT INTO `product_wallets` (`id`, `product_id`, `unit_id`, `client_segment_id`, `sucursale_id`, `price`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 1, 1, 3500, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL),
(2, 1, 1, 2, 1, 3200, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL),
(3, 1, 3, 2, 1, 36000, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL),
(4, 1, 1, 3, NULL, 3000, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL),
(5, 2, 5, 1, 1, 4000, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL),
(6, 2, 5, 2, 1, 3700, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL),
(7, 3, 7, 1, 2, 12000, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL),
(8, 3, 7, 2, 2, 11000, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL),
(9, 4, 1, NULL, NULL, 1500, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL),
(10, 4, 3, 2, NULL, 16000, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL),
(11, 5, 1, 1, NULL, 9500, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL),
(12, 5, 2, 2, 1, 50000, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL),
(13, 6, 8, 1, 3, 2800, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL),
(14, 6, 7, 2, 3, 5400, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL),
(15, 1, 1, 4, NULL, 3100, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_warehouses`
--

CREATE TABLE `product_warehouses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `unit_id` bigint(20) UNSIGNED NOT NULL,
  `warehouse_id` bigint(20) UNSIGNED NOT NULL,
  `stock` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_warehouses`
--

INSERT INTO `product_warehouses` (`id`, `product_id`, `unit_id`, `warehouse_id`, `stock`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 1, 200, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL),
(2, 1, 3, 1, 15, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL),
(3, 2, 5, 1, 300, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL),
(4, 3, 7, 2, 50, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL),
(5, 4, 1, 2, 500, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL),
(6, 4, 3, 2, 40, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL),
(7, 5, 1, 1, 100, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL),
(8, 5, 2, 1, 15, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL),
(9, 6, 8, 3, 20000, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL),
(10, 6, 7, 3, 20, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `proformas`
--

CREATE TABLE `proformas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL COMMENT 'Asesor comercial',
  `client_id` bigint(20) UNSIGNED NOT NULL COMMENT 'Cliente',
  `client_segment_id` bigint(20) UNSIGNED NOT NULL COMMENT 'Segmento de cliente',
  `sucursale_id` bigint(20) UNSIGNED DEFAULT NULL,
  `subtotal` double NOT NULL DEFAULT 0,
  `discount` double NOT NULL DEFAULT 0,
  `total` double NOT NULL,
  `igv` double NOT NULL,
  `state_proforma` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1 Cotizacion 2 Contrato',
  `state_payment` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1 Pendiente, 2 Parcial, 3 Completo',
  `debt` double NOT NULL DEFAULT 0 COMMENT 'Deuda (puede ser negativa si hay sobrepago)',
  `paid_out` double UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Pagado o cancelado',
  `date_validation` timestamp NULL DEFAULT NULL,
  `date_pay_complete` timestamp NULL DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `proformas`
--

INSERT INTO `proformas` (`id`, `user_id`, `client_id`, `client_segment_id`, `sucursale_id`, `subtotal`, `discount`, `total`, `igv`, `state_proforma`, `state_payment`, `debt`, `paid_out`, `date_validation`, `date_pay_complete`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(8, 1, 1, 1, 1, 4760, 0, 4760, 760, 1, 1, 4760, 0, NULL, NULL, 'null', '2025-10-22 04:00:48', '2025-10-22 05:23:07', NULL),
(9, 1, 1, 1, NULL, 28560, 0, 28560, 2280, 1, 1, 28560, 0, NULL, NULL, NULL, '2025-10-22 05:37:27', '2025-10-22 05:37:27', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `proforma_deliveries`
--

CREATE TABLE `proforma_deliveries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `proforma_id` bigint(20) UNSIGNED NOT NULL,
  `sucursale_deliverie_id` bigint(20) UNSIGNED NOT NULL,
  `date_entrega` timestamp NULL DEFAULT NULL,
  `date_envio` timestamp NULL DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `ubigeo_departamento` varchar(100) DEFAULT NULL,
  `departamento` varchar(100) DEFAULT NULL,
  `ubigeo_municipio` varchar(100) DEFAULT NULL,
  `municipio` varchar(100) DEFAULT NULL,
  `agencia` varchar(150) DEFAULT NULL,
  `full_name_encargado` varchar(150) DEFAULT NULL,
  `documento_encargado` varchar(150) DEFAULT NULL,
  `telefono_encargado` varchar(150) DEFAULT NULL,
  `n_transaccion` varchar(150) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `proforma_deliveries`
--

INSERT INTO `proforma_deliveries` (`id`, `proforma_id`, `sucursale_deliverie_id`, `date_entrega`, `date_envio`, `address`, `ubigeo_departamento`, `departamento`, `ubigeo_municipio`, `municipio`, `agencia`, `full_name_encargado`, `documento_encargado`, `telefono_encargado`, `n_transaccion`, `created_at`, `updated_at`, `deleted_at`) VALUES
(4, 7, 6, '2025-10-24 05:00:00', '2025-10-22 05:00:00', NULL, NULL, NULL, NULL, NULL, 'Servientrega', 'Servicios', '111512512', '32251252', NULL, '2025-10-22 03:41:40', '2025-10-22 03:41:40', NULL),
(5, 8, 4, '2025-10-23 05:00:00', '2025-10-21 05:00:00', NULL, NULL, NULL, NULL, NULL, 'DEPRISA', 'JHOAN MONTES', '213131', '3226479250', NULL, '2025-10-22 04:00:48', '2025-10-22 05:36:49', NULL),
(6, 9, 6, '2025-10-23 05:00:00', '2025-10-21 05:00:00', NULL, '50', 'Meta', '50370', 'URIBE', 'DEPRISA', 'JHOAN MONTES', '213131', '3226479250', NULL, '2025-10-22 05:37:27', '2025-10-22 05:37:27', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `proforma_details`
--

CREATE TABLE `proforma_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `proforma_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `product_categorie_id` bigint(20) UNSIGNED NOT NULL,
  `description` text DEFAULT NULL,
  `unit_id` bigint(20) UNSIGNED DEFAULT NULL,
  `quantity` double UNSIGNED NOT NULL,
  `price_unit` double UNSIGNED NOT NULL,
  `discount` double NOT NULL DEFAULT 0,
  `subtotal` double NOT NULL,
  `impuesto` double DEFAULT NULL COMMENT 'Monto del impuesto para este item',
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `proforma_details`
--

INSERT INTO `proforma_details` (`id`, `proforma_id`, `product_id`, `product_categorie_id`, `description`, `unit_id`, `quantity`, `price_unit`, `discount`, `subtotal`, `impuesto`, `total`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 4, 5, 4, '', 2, 1, 9500, 0, 9500, 1805, 11305, '2025-10-21 04:18:46', '2025-10-21 04:18:46', NULL),
(2, 5, 5, 4, '', 1, 1, 9500, 0, 9500, 1805, 11305, '2025-10-21 05:35:03', '2025-10-21 05:35:03', NULL),
(3, 6, 6, 5, '', 7, 5, 2800, 0, 2800, 0, 14000, '2025-10-21 05:44:38', '2025-10-21 05:44:38', NULL),
(4, 7, 5, 4, '', 1, 1, 9500, 0, 9500, 1805, 11305, '2025-10-22 03:41:40', '2025-10-22 03:41:40', NULL),
(5, 8, 2, 2, '', 5, 1, 4000, 0, 4000, 760, 4760, '2025-10-22 04:00:48', '2025-10-22 04:00:48', NULL),
(6, 9, 3, 3, '', 7, 2, 12000, 0, 12000, 2280, 28560, '2025-10-22 05:37:27', '2025-10-22 05:37:27', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `proforma_payments`
--

CREATE TABLE `proforma_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `proforma_id` bigint(20) UNSIGNED NOT NULL,
  `method_payment_id` bigint(20) UNSIGNED NOT NULL COMMENT 'ID del método de pago',
  `amount` double NOT NULL,
  `vaucher` varchar(250) DEFAULT NULL,
  `banco_id` bigint(20) UNSIGNED DEFAULT NULL,
  `date_validation` timestamp NULL DEFAULT NULL,
  `n_transaccion` varchar(150) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `proforma_payments`
--

INSERT INTO `proforma_payments` (`id`, `proforma_id`, `method_payment_id`, `amount`, `vaucher`, `banco_id`, `date_validation`, `n_transaccion`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 4, 2, 31231231, NULL, 5, NULL, NULL, '2025-10-21 04:18:46', '2025-10-21 04:18:46', NULL),
(2, 5, 3, 1000, NULL, NULL, NULL, NULL, '2025-10-21 05:35:03', '2025-10-21 05:35:03', NULL),
(3, 7, 2, 1000000, NULL, 7, NULL, NULL, '2025-10-22 03:41:41', '2025-10-22 03:41:41', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `providers`
--

CREATE TABLE `providers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `full_name` varchar(250) NOT NULL,
  `nit` varchar(150) NOT NULL,
  `email` varchar(250) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `imagen` varchar(250) DEFAULT NULL,
  `state` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `providers`
--

INSERT INTO `providers` (`id`, `full_name`, `nit`, `email`, `phone`, `address`, `imagen`, `state`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Distribuidora Postobón S.A.', '890.900.161-1', 'ventas@postobon.com', '018000515959', 'Cra 52 # 4-08, Medellín', NULL, 1, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL),
(2, 'Frito Lay Colombia Ltda.', '830.022.209-4', 'contacto@pepsico.com.co', '018000911007', 'Calle 100 # 7A-81, Bogotá', NULL, 1, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL),
(3, 'Procter & Gamble Colombia Ltda.', '860.002.163-4', 'pg.com/contactanos', '018000517517', 'Cra 7 # 114-33, Bogotá', NULL, 1, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL),
(4, 'Johnson & Johnson de Colombia S.A.', '860.000.741-6', 'consumidor@conco.jnj.com', '018000517000', 'Calle 26 # 69-76, Bogotá', NULL, 1, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL),
(5, 'Diana Corporación S.A.S.', '860.000.697-8', 'servicioalcliente@diana.com.co', '018000180202', 'Km 1.5 Vía Espinal - Girardot', NULL, 1, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Super-Admin', 'api', '2025-09-22 07:49:58', '2025-09-22 07:49:58'),
(2, 'asesor comercial', 'api', '2025-09-23 09:08:07', '2025-09-23 09:08:07'),
(3, 'Bodeguero', 'api', '2025-10-21 03:48:06', '2025-10-21 03:48:06');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(7, 2),
(8, 1),
(8, 2),
(9, 1),
(9, 2),
(10, 1),
(11, 1),
(12, 1),
(12, 2),
(13, 1),
(13, 2),
(14, 1),
(14, 2),
(15, 1),
(15, 2),
(16, 1),
(16, 2),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sucursales`
--

CREATE TABLE `sucursales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(250) NOT NULL,
  `address` varchar(250) DEFAULT NULL,
  `state` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sucursales`
--

INSERT INTO `sucursales` (`id`, `name`, `address`, `state`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Pereira Centro', 'Cra 7 #10-20', 1, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL),
(2, 'Dosquebradas La Pradera', 'Av. Simón Bolivar #30-15', 1, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL),
(3, 'Cartago Principal', 'Calle 11 #5-30', 1, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sucursale_deliveries`
--

CREATE TABLE `sucursale_deliveries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(250) NOT NULL,
  `address` varchar(250) DEFAULT NULL,
  `state` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sucursale_deliveries`
--

INSERT INTO `sucursale_deliveries` (`id`, `name`, `address`, `state`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Recoger en Tienda Pereira Centro', 'Cra 7 #10-20', 1, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL),
(2, 'Recoger en Tienda Dosquebradas', 'Av. Simón Bolivar #30-15', 1, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL),
(3, 'Recoger en Bodega Cartago', 'Calle 11 #5-30', 1, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL),
(4, 'Envío Local Pereira/Dosquebradas', NULL, 1, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL),
(5, 'Envío Local Cartago', NULL, 1, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL),
(6, 'Envío Nacional (Transportadora)', NULL, 1, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL),
(7, 'Entrega Domicilio Particular', NULL, 1, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL),
(8, 'Envío Agencia Externa', NULL, 1, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(250) NOT NULL,
  `description` text DEFAULT NULL,
  `state` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `name`, `description`, `state`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Unidad', 'Venta por unidad individual', 1, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL),
(2, 'Caja x6', 'Caja con 6 unidades', 1, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL),
(3, 'Caja x12', 'Caja con 12 unidades', 1, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL),
(4, 'Caja x24', 'Caja con 24 unidades', 1, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL),
(5, 'Paquete x6', 'Paquete con 6 unidades', 1, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL),
(6, 'Paquete x12', 'Paquete con 12 unidades', 1, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL),
(7, 'Kilogramo', 'Venta por peso en Kg', 1, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL),
(8, 'Gramo', 'Venta por peso en gr', 1, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL),
(9, 'Litro', 'Venta por volumen en L', 1, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL),
(10, 'Mililitro', 'Venta por volumen en ml', 1, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `unit_transforms`
--

CREATE TABLE `unit_transforms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `unit_id` bigint(20) UNSIGNED NOT NULL,
  `unit_to_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `unit_transforms`
--

INSERT INTO `unit_transforms` (`id`, `unit_id`, `unit_to_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 1, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL),
(2, 3, 1, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL),
(3, 4, 1, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL),
(4, 5, 1, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL),
(5, 6, 1, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL),
(6, 7, 8, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL),
(7, 9, 10, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `surname` varchar(250) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(25) DEFAULT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  `sucursal_id` bigint(20) UNSIGNED NOT NULL DEFAULT 4,
  `type_document` varchar(35) DEFAULT NULL,
  `n_document` varchar(25) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `gender` varchar(15) DEFAULT NULL,
  `avatar` varchar(250) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `role_id`, `sucursal_id`, `type_document`, `n_document`, `address`, `gender`, `avatar`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Super Admin', '', 'super_admin_crm@gmail.com', '16561', 1, 4, 'cedula de ciudadania', '1234', 'cartago', 'MASCULINO', NULL, '2025-09-22 07:49:58', '$2y$12$IHM99ma/otLRU8zKCnCsdOTgyOMkGV5w94C3RnmybpWxNPpn9Omyy', 'tQ0dy3CcfJ', '2025-09-22 07:49:58', '2025-09-23 09:36:57', NULL),
(7, 'prueba', 'insercion', 'prueba@gmail.com', '151615', 2, 4, 'cedula de ciudadania', '16115', 'la calle 2', 'MASCULINO', 'users/7eB9NmBOvalRZL2Xk6bQh3AYegFQP54GmBs9tcFu.png', NULL, '$2y$12$T3PMuDj7qYLVX4Nh/T5vY.CUjiiFOxRUkVyS9uBuV3T67HQg.5qdC', NULL, '2025-09-23 10:23:16', '2025-10-21 09:24:36', '2025-10-21 09:24:36'),
(8, 'chechin', 'el gay editado', 'chechin@gmail.com', '515161', 2, 4, 'cedula de ciudadania', '651615161', 'pipi', 'MASCULINO', 'users/US3MVj2n0167LQGQhO0Ds08uIqcyXtMqtf6NdJOa.png', NULL, '$2y$12$rAh6EGrIA./koueLt2VUDO1zdtPjSuca9Z.0rtaP0IibMMD4orfhi', NULL, '2025-09-23 23:00:43', '2025-09-23 23:02:36', '2025-09-23 23:02:36'),
(9, 'hola', 'mundo', 'hola@gmail.com', '8151616', 2, 4, 'cedula de ciudadania', '54416515', 'aadsfas', 'MASCULINO', 'users/JiaZRdCTzEbYIC37yfvkKhpNETtVYVDsZcn61ldX.jpg', NULL, '$2y$12$yaMttALBPODdeNkeY//opugYGxUl4IbW5Wch0Gr5hBjsIF4S7P6rO', NULL, '2025-09-23 23:12:34', '2025-09-23 23:24:48', '2025-09-23 23:24:48'),
(10, 'monbo', 'null', 'monbo@gmail.com', '455115615', 1, 4, 'cedula de ciudadania', '819816', 'fddfsg', 'MASCULINO', 'users/fTGvpVQxyVJfaFo6Oraon7WEyf0lYTmUwWF7mifF.jpg', NULL, '$2y$12$QjtwCIowWY5/jJKOqMwtGeAoHGp2pmTFLfh146Da7XKPVl7pS9EHK', NULL, '2025-09-23 23:32:38', '2025-10-21 09:24:38', '2025-10-21 09:24:38'),
(11, 'prueba', 'monbo', 'pruebamonbo@gmail.com', '6156161', 2, 4, 'cedula de ciudadania', '866165', 'la calle', 'MASCULINO', 'users/kAoay5Q2Z78U3FhOFMo1SLBJPfzAxHPOrgV1GhUR.png', NULL, '$2y$12$Y.y4PGAawaizUvemGqUoHOtO4pSXyVy1K3FR5JENZRp8giK428IfW', NULL, '2025-09-24 00:02:03', '2025-09-24 00:02:13', '2025-09-24 00:02:13'),
(12, 'ana sofia agud', '32131', 'montesjhoan17@gmail.com', '12313', 2, 4, 'cedula de ciudadania', '2131231', '313212', 'MASCULINO', 'users/NxnC3XthKxzQvNUNEmYQs5NkH1m09LCct5hVTZPg.jpg', NULL, '$2y$12$h9RSmiBSY3L5zvs7EB.8pu1/wfAOfGeiWcz2733icvaGogwpW/TVq', NULL, '2025-10-21 05:53:38', '2025-10-21 09:24:40', '2025-10-21 09:24:40');

-- --------------------------------------------------------

--
-- Table structure for table `warehouses`
--

CREATE TABLE `warehouses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(250) NOT NULL,
  `address` varchar(250) DEFAULT NULL,
  `sucursale_id` bigint(20) UNSIGNED DEFAULT NULL,
  `state` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `warehouses`
--

INSERT INTO `warehouses` (`id`, `name`, `address`, `sucursale_id`, `state`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Bodega Principal Centro (Pereira)', 'Cra 7 #10-20 Sotano', 1, 1, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL),
(2, 'Almacén La Pradera (Dosquebradas)', 'Av. Simón Bolivar #30-15 Local 1', 2, 1, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL),
(3, 'Bodega Cartago', 'Zona Industrial Mz A Lote 5', 3, 1, '2025-10-21 04:05:14', '2025-10-21 04:05:14', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_id` (`user_id`),
  ADD KEY `fk_client_id` (`client_id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_segments`
--
ALTER TABLE `client_segments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `method_payments`
--
ALTER TABLE `method_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_wallets`
--
ALTER TABLE `product_wallets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_wallets_product_id_foreign` (`product_id`),
  ADD KEY `product_wallets_unit_id_foreign` (`unit_id`),
  ADD KEY `product_wallets_client_segment_id_foreign` (`client_segment_id`),
  ADD KEY `product_wallets_sucursal_id_foreign` (`sucursale_id`);

--
-- Indexes for table `product_warehouses`
--
ALTER TABLE `product_warehouses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_wallets_product_id_foreign` (`product_id`),
  ADD KEY `product_wallets_unit_id_foreign` (`unit_id`);

--
-- Indexes for table `proformas`
--
ALTER TABLE `proformas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `proformas_sucursale_id_foreign` (`sucursale_id`);

--
-- Indexes for table `proforma_deliveries`
--
ALTER TABLE `proforma_deliveries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `proforma_deliveries_agencia_index` (`agencia`),
  ADD KEY `proforma_deliveries_documento_encargado_index` (`documento_encargado`);

--
-- Indexes for table `proforma_details`
--
ALTER TABLE `proforma_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `proforma_details_unit_id_foreign` (`unit_id`),
  ADD KEY `proforma_details_impuesto_index` (`impuesto`);

--
-- Indexes for table `proforma_payments`
--
ALTER TABLE `proforma_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `proforma_payments_method_payment_id_foreign` (`method_payment_id`),
  ADD KEY `proforma_payments_banco_id_foreign` (`banco_id`);

--
-- Indexes for table `providers`
--
ALTER TABLE `providers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sucursales`
--
ALTER TABLE `sucursales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sucursale_deliveries`
--
ALTER TABLE `sucursale_deliveries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `unit_transforms`
--
ALTER TABLE `unit_transforms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `warehouses`
--
ALTER TABLE `warehouses`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activities`
--
ALTER TABLE `activities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `client_segments`
--
ALTER TABLE `client_segments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `method_payments`
--
ALTER TABLE `method_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product_wallets`
--
ALTER TABLE `product_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `product_warehouses`
--
ALTER TABLE `product_warehouses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `proformas`
--
ALTER TABLE `proformas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `proforma_deliveries`
--
ALTER TABLE `proforma_deliveries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `proforma_details`
--
ALTER TABLE `proforma_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `proforma_payments`
--
ALTER TABLE `proforma_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `providers`
--
ALTER TABLE `providers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sucursales`
--
ALTER TABLE `sucursales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sucursale_deliveries`
--
ALTER TABLE `sucursale_deliveries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `unit_transforms`
--
ALTER TABLE `unit_transforms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `warehouses`
--
ALTER TABLE `warehouses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activities`
--
ALTER TABLE `activities`
  ADD CONSTRAINT `fk_client_id` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `proformas`
--
ALTER TABLE `proformas`
  ADD CONSTRAINT `proformas_sucursale_id_foreign` FOREIGN KEY (`sucursale_id`) REFERENCES `sucursales` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `proforma_details`
--
ALTER TABLE `proforma_details`
  ADD CONSTRAINT `proforma_details_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `proforma_payments`
--
ALTER TABLE `proforma_payments`
  ADD CONSTRAINT `proforma_payments_banco_id_foreign` FOREIGN KEY (`banco_id`) REFERENCES `method_payments` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `proforma_payments_method_payment_id_foreign` FOREIGN KEY (`method_payment_id`) REFERENCES `method_payments` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;