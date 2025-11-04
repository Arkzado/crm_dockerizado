-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 30, 2025 at 10:28 AM
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
-- Table structure for table `clientes`
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
(1, 'App\\Models\\User', 9),
(2, 'App\\Models\\User', 7),
(2, 'App\\Models\\User', 8);

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
(2, 'Asesor Comercial', 'api', '2025-09-23 09:08:07', '2025-09-24 00:04:31');

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
(1, 2),
(2, 2),
(3, 2),
(4, 2),
(5, 2),
(28, 2),
(39, 2);

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
(7, 'prueba', 'insercion', 'prueba@gmail.com', '151615', 2, 4, 'cedula de ciudadania', '16115', 'la calle 2', 'MASCULINO', 'users/WCRe4EA4rnBpKgQC7N6HZnKth8BW9nIOAwktbd0U.png', NULL, '$2y$12$T3PMuDj7qYLVX4Nh/T5vY.CUjiiFOxRUkVyS9uBuV3T67HQg.5qdC', NULL, '2025-09-23 10:23:16', '2025-09-23 23:33:14', '2025-09-23 23:33:14'),
(8, 'John Doe', 'daada', 'john@example.com', '3132131', 2, 4, 'cedula de ciudadania', '13123131', 'adad', 'FEMENINO', 'users/SOS5e4RirI7O8pLYQc8GgtaO2TwK21MSaZnBdCDo.png', NULL, '$2y$12$OVY7oqtoOBtpu7GTHVTXDuGf5sOVjD8vE07YDIT5HsUrkEW7X.NkC', NULL, '2025-09-23 23:28:07', '2025-09-23 23:32:52', '2025-09-23 23:32:52'),
(9, 'adE', 'ad', 'ad@gmail.com', '321312', 1, 4, 'carnet de extranjeria', '31231', '32131', 'MASCULINO', 'users/tPrnDcauW0kPt74ShT7nfsnwnmes18JQiMFLu9B8.png', NULL, '$2y$12$40UKs5BO9lFA/Oc1eQexHOl2T57iYI3zWSseSwtptnUMB1WtNGwyu', NULL, '2025-09-23 23:36:56', '2025-09-24 00:05:03', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clientes`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

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
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `clientes`
--
ALTER TABLE `clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_wallets`
--
ALTER TABLE `product_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_warehouses`
--
ALTER TABLE `product_warehouses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

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
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
