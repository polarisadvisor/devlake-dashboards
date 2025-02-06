-- MySQL dump 10.13  Distrib 8.4.3, for Linux (aarch64)
--
-- Host: localhost    Database: lake
-- ------------------------------------------------------
-- Server version	8.4.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `_devlake_api_keys`
--

DROP TABLE IF EXISTS `_devlake_api_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_devlake_api_keys` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `creator` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `creator_email` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `updater` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `updater_email` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `api_key` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `expired_at` datetime(3) DEFAULT NULL,
  `allowed_path` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `type` varchar(40) COLLATE utf8mb4_bin DEFAULT NULL,
  `extra` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx__devlake_api_keys_name` (`name`),
  UNIQUE KEY `idx__devlake_api_keys_api_key` (`api_key`),
  KEY `idx__devlake_api_keys_type` (`type`),
  KEY `idx__devlake_api_keys_extra` (`extra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_devlake_blueprint_connections`
--

DROP TABLE IF EXISTS `_devlake_blueprint_connections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_devlake_blueprint_connections` (
  `blueprint_id` bigint unsigned NOT NULL,
  `plugin_name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `connection_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`blueprint_id`,`plugin_name`,`connection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_devlake_blueprint_labels`
--

DROP TABLE IF EXISTS `_devlake_blueprint_labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_devlake_blueprint_labels` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `blueprint_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`blueprint_id`,`name`),
  KEY `idx__devlake_blueprint_labels_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_devlake_blueprint_scopes`
--

DROP TABLE IF EXISTS `_devlake_blueprint_scopes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_devlake_blueprint_scopes` (
  `blueprint_id` bigint unsigned NOT NULL,
  `plugin_name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `connection_id` bigint unsigned NOT NULL,
  `scope_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`blueprint_id`,`plugin_name`,`connection_id`,`scope_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_devlake_blueprints`
--

DROP TABLE IF EXISTS `_devlake_blueprints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_devlake_blueprints` (
  `name` longtext COLLATE utf8mb4_bin,
  `enable` tinyint(1) DEFAULT NULL,
  `cron_config` longtext COLLATE utf8mb4_bin,
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `mode` longtext COLLATE utf8mb4_bin,
  `is_manual` tinyint(1) DEFAULT NULL,
  `plan` longtext COLLATE utf8mb4_bin,
  `skip_on_fail` tinyint(1) DEFAULT NULL,
  `project_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `before_plan` longblob,
  `after_plan` longblob,
  `time_after` datetime(3) DEFAULT NULL,
  `full_sync` tinyint(1) DEFAULT NULL,
  `skip_collectors` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_devlake_collector_latest_state`
--

DROP TABLE IF EXISTS `_devlake_collector_latest_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_devlake_collector_latest_state` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `raw_data_params` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `raw_data_table` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `latest_success_start` datetime(3) DEFAULT NULL,
  `time_after` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`raw_data_params`,`raw_data_table`),
  KEY `idx__devlake_collector_latest_state_raw_data_params` (`raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_devlake_locking_history`
--

DROP TABLE IF EXISTS `_devlake_locking_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_devlake_locking_history` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `host_name` longtext COLLATE utf8mb4_bin,
  `version` longtext COLLATE utf8mb4_bin,
  `succeeded` tinyint(1) DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_devlake_locking_stub`
--

DROP TABLE IF EXISTS `_devlake_locking_stub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_devlake_locking_stub` (
  `stub` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`stub`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_devlake_migration_history`
--

DROP TABLE IF EXISTS `_devlake_migration_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_devlake_migration_history` (
  `created_at` datetime(3) DEFAULT NULL,
  `script_version` bigint unsigned NOT NULL,
  `script_name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `comment` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`script_version`,`script_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_devlake_notifications`
--

DROP TABLE IF EXISTS `_devlake_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_devlake_notifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `type` longtext COLLATE utf8mb4_bin,
  `endpoint` longtext COLLATE utf8mb4_bin,
  `nonce` longtext COLLATE utf8mb4_bin,
  `response_code` bigint DEFAULT NULL,
  `response` longtext COLLATE utf8mb4_bin,
  `data` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_devlake_pipeline_labels`
--

DROP TABLE IF EXISTS `_devlake_pipeline_labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_devlake_pipeline_labels` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `pipeline_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`pipeline_id`,`name`),
  KEY `idx__devlake_pipeline_labels_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_devlake_pipelines`
--

DROP TABLE IF EXISTS `_devlake_pipelines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_devlake_pipelines` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_bin DEFAULT NULL,
  `blueprint_id` bigint unsigned DEFAULT NULL,
  `total_tasks` bigint DEFAULT NULL,
  `finished_tasks` bigint DEFAULT NULL,
  `began_at` datetime(3) DEFAULT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `status` longtext COLLATE utf8mb4_bin,
  `message` longtext COLLATE utf8mb4_bin,
  `spent_seconds` bigint DEFAULT NULL,
  `stage` bigint DEFAULT NULL,
  `plan` longtext COLLATE utf8mb4_bin,
  `skip_on_fail` tinyint(1) DEFAULT NULL,
  `error_name` longtext COLLATE utf8mb4_bin,
  `full_sync` tinyint(1) DEFAULT NULL,
  `skip_collectors` tinyint(1) DEFAULT NULL,
  `time_after` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx__devlake_pipelines_name` (`name`),
  KEY `idx__devlake_pipelines_finished_at` (`finished_at`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_devlake_store`
--

DROP TABLE IF EXISTS `_devlake_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_devlake_store` (
  `store_key` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `store_value` json DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`store_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_devlake_subtask_states`
--

DROP TABLE IF EXISTS `_devlake_subtask_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_devlake_subtask_states` (
  `plugin` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `subtask` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `params` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `prev_config` longtext COLLATE utf8mb4_bin,
  `time_after` datetime(3) DEFAULT NULL,
  `prev_started_at` datetime(3) DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`plugin`,`subtask`,`params`),
  KEY `idx__devlake_subtask_states_params` (`params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_devlake_subtasks`
--

DROP TABLE IF EXISTS `_devlake_subtasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_devlake_subtasks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `task_id` bigint unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_bin DEFAULT NULL,
  `number` bigint DEFAULT NULL,
  `began_at` datetime(3) DEFAULT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `spent_seconds` bigint DEFAULT NULL,
  `finished_records` bigint DEFAULT NULL,
  `sequence` bigint DEFAULT NULL,
  `is_collector` tinyint(1) DEFAULT NULL,
  `is_failed` tinyint(1) DEFAULT NULL,
  `message` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`id`),
  KEY `idx__devlake_subtasks_task_id` (`task_id`),
  KEY `idx__devlake_subtasks_subtask_name` (`name`),
  KEY `idx__devlake_subtasks_finished_at` (`finished_at`)
) ENGINE=InnoDB AUTO_INCREMENT=9590 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_devlake_tasks`
--

DROP TABLE IF EXISTS `_devlake_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_devlake_tasks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `plugin` varchar(191) COLLATE utf8mb4_bin DEFAULT NULL,
  `status` longtext COLLATE utf8mb4_bin,
  `message` longtext COLLATE utf8mb4_bin,
  `progress` float DEFAULT NULL,
  `failed_sub_task` longtext COLLATE utf8mb4_bin,
  `pipeline_id` bigint unsigned DEFAULT NULL,
  `pipeline_row` bigint DEFAULT NULL,
  `pipeline_col` bigint DEFAULT NULL,
  `began_at` datetime(3) DEFAULT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `spent_seconds` bigint DEFAULT NULL,
  `error_name` longtext COLLATE utf8mb4_bin,
  `options` longtext COLLATE utf8mb4_bin,
  `subtasks` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx__devlake_tasks_plugin` (`plugin`),
  KEY `idx__devlake_tasks_pipeline_id` (`pipeline_id`),
  KEY `idx__devlake_tasks_finished_at` (`finished_at`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_raw_github_api_account_orgs`
--

DROP TABLE IF EXISTS `_raw_github_api_account_orgs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_raw_github_api_account_orgs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `data` longblob,
  `url` longtext COLLATE utf8mb4_bin,
  `input` json DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx__raw_github_api_account_orgs_params` (`params`)
) ENGINE=InnoDB AUTO_INCREMENT=11571 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_raw_github_api_accounts`
--

DROP TABLE IF EXISTS `_raw_github_api_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_raw_github_api_accounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `data` longblob,
  `url` longtext COLLATE utf8mb4_bin,
  `input` json DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx__raw_github_api_accounts_params` (`params`)
) ENGINE=InnoDB AUTO_INCREMENT=11936 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_raw_github_api_comments`
--

DROP TABLE IF EXISTS `_raw_github_api_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_raw_github_api_comments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `data` longblob,
  `url` longtext COLLATE utf8mb4_bin,
  `input` json DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx__raw_github_api_comments_params` (`params`)
) ENGINE=InnoDB AUTO_INCREMENT=1779 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_raw_github_api_events`
--

DROP TABLE IF EXISTS `_raw_github_api_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_raw_github_api_events` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `data` longblob,
  `url` longtext COLLATE utf8mb4_bin,
  `input` json DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx__raw_github_api_events_params` (`params`)
) ENGINE=InnoDB AUTO_INCREMENT=11801 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_raw_github_api_issues`
--

DROP TABLE IF EXISTS `_raw_github_api_issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_raw_github_api_issues` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `data` longblob,
  `url` longtext COLLATE utf8mb4_bin,
  `input` json DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx__raw_github_api_issues_params` (`params`)
) ENGINE=InnoDB AUTO_INCREMENT=953 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_raw_github_api_jobs`
--

DROP TABLE IF EXISTS `_raw_github_api_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_raw_github_api_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `data` longblob,
  `url` longtext COLLATE utf8mb4_bin,
  `input` json DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx__raw_github_api_jobs_params` (`params`)
) ENGINE=InnoDB AUTO_INCREMENT=13975 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_raw_github_api_pull_request_commits`
--

DROP TABLE IF EXISTS `_raw_github_api_pull_request_commits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_raw_github_api_pull_request_commits` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `data` longblob,
  `url` longtext COLLATE utf8mb4_bin,
  `input` json DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx__raw_github_api_pull_request_commits_params` (`params`)
) ENGINE=InnoDB AUTO_INCREMENT=1700 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_raw_github_api_pull_request_review_comments`
--

DROP TABLE IF EXISTS `_raw_github_api_pull_request_review_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_raw_github_api_pull_request_review_comments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `data` longblob,
  `url` longtext COLLATE utf8mb4_bin,
  `input` json DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx__raw_github_api_pull_request_review_comments_params` (`params`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_raw_github_api_pull_request_reviews`
--

DROP TABLE IF EXISTS `_raw_github_api_pull_request_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_raw_github_api_pull_request_reviews` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `data` longblob,
  `url` longtext COLLATE utf8mb4_bin,
  `input` json DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx__raw_github_api_pull_request_reviews_params` (`params`)
) ENGINE=InnoDB AUTO_INCREMENT=345 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_raw_github_api_pull_requests`
--

DROP TABLE IF EXISTS `_raw_github_api_pull_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_raw_github_api_pull_requests` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `data` longblob,
  `url` longtext COLLATE utf8mb4_bin,
  `input` json DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx__raw_github_api_pull_requests_params` (`params`)
) ENGINE=InnoDB AUTO_INCREMENT=1391 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_raw_github_api_runs`
--

DROP TABLE IF EXISTS `_raw_github_api_runs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_raw_github_api_runs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `data` longblob,
  `url` longtext COLLATE utf8mb4_bin,
  `input` json DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx__raw_github_api_runs_params` (`params`)
) ENGINE=InnoDB AUTO_INCREMENT=10501 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_raw_github_graphql_issues`
--

DROP TABLE IF EXISTS `_raw_github_graphql_issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_raw_github_graphql_issues` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `data` longblob,
  `url` longtext COLLATE utf8mb4_bin,
  `input` json DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx__raw_github_graphql_issues_params` (`params`)
) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_raw_github_graphql_prs`
--

DROP TABLE IF EXISTS `_raw_github_graphql_prs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_raw_github_graphql_prs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `data` longblob,
  `url` longtext COLLATE utf8mb4_bin,
  `input` json DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx__raw_github_graphql_prs_params` (`params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_raw_github_milestones`
--

DROP TABLE IF EXISTS `_raw_github_milestones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_raw_github_milestones` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `data` longblob,
  `url` longtext COLLATE utf8mb4_bin,
  `input` json DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx__raw_github_milestones_params` (`params`)
) ENGINE=InnoDB AUTO_INCREMENT=932 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_raw_gitlab_api_deployments`
--

DROP TABLE IF EXISTS `_raw_gitlab_api_deployments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_raw_gitlab_api_deployments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `data` longblob,
  `url` longtext COLLATE utf8mb4_bin,
  `input` json DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx__raw_gitlab_api_deployments_params` (`params`)
) ENGINE=InnoDB AUTO_INCREMENT=771 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_raw_gitlab_api_issues`
--

DROP TABLE IF EXISTS `_raw_gitlab_api_issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_raw_gitlab_api_issues` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `data` longblob,
  `url` longtext COLLATE utf8mb4_bin,
  `input` json DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx__raw_gitlab_api_issues_params` (`params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_raw_gitlab_api_job`
--

DROP TABLE IF EXISTS `_raw_gitlab_api_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_raw_gitlab_api_job` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `data` longblob,
  `url` longtext COLLATE utf8mb4_bin,
  `input` json DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx__raw_gitlab_api_job_params` (`params`)
) ENGINE=InnoDB AUTO_INCREMENT=10001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_raw_gitlab_api_merge_request_commits`
--

DROP TABLE IF EXISTS `_raw_gitlab_api_merge_request_commits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_raw_gitlab_api_merge_request_commits` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `data` longblob,
  `url` longtext COLLATE utf8mb4_bin,
  `input` json DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx__raw_gitlab_api_merge_request_commits_params` (`params`)
) ENGINE=InnoDB AUTO_INCREMENT=133701 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_raw_gitlab_api_merge_request_details`
--

DROP TABLE IF EXISTS `_raw_gitlab_api_merge_request_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_raw_gitlab_api_merge_request_details` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `data` longblob,
  `url` longtext COLLATE utf8mb4_bin,
  `input` json DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx__raw_gitlab_api_merge_request_details_params` (`params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_raw_gitlab_api_merge_request_notes`
--

DROP TABLE IF EXISTS `_raw_gitlab_api_merge_request_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_raw_gitlab_api_merge_request_notes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `data` longblob,
  `url` longtext COLLATE utf8mb4_bin,
  `input` json DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx__raw_gitlab_api_merge_request_notes_params` (`params`)
) ENGINE=InnoDB AUTO_INCREMENT=2749 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_raw_gitlab_api_merge_requests`
--

DROP TABLE IF EXISTS `_raw_gitlab_api_merge_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_raw_gitlab_api_merge_requests` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `data` longblob,
  `url` longtext COLLATE utf8mb4_bin,
  `input` json DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx__raw_gitlab_api_merge_requests_params` (`params`)
) ENGINE=InnoDB AUTO_INCREMENT=567 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_raw_gitlab_api_pipeline`
--

DROP TABLE IF EXISTS `_raw_gitlab_api_pipeline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_raw_gitlab_api_pipeline` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `data` longblob,
  `url` longtext COLLATE utf8mb4_bin,
  `input` json DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx__raw_gitlab_api_pipeline_params` (`params`)
) ENGINE=InnoDB AUTO_INCREMENT=4105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_raw_gitlab_api_pipeline_details`
--

DROP TABLE IF EXISTS `_raw_gitlab_api_pipeline_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_raw_gitlab_api_pipeline_details` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `data` longblob,
  `url` longtext COLLATE utf8mb4_bin,
  `input` json DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx__raw_gitlab_api_pipeline_details_params` (`params`)
) ENGINE=InnoDB AUTO_INCREMENT=4105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_raw_gitlab_api_users`
--

DROP TABLE IF EXISTS `_raw_gitlab_api_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_raw_gitlab_api_users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `data` longblob,
  `url` longtext COLLATE utf8mb4_bin,
  `input` json DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx__raw_gitlab_api_users_params` (`params`)
) ENGINE=InnoDB AUTO_INCREMENT=458 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_raw_jira_api_epics`
--

DROP TABLE IF EXISTS `_raw_jira_api_epics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_raw_jira_api_epics` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `data` longblob,
  `url` longtext COLLATE utf8mb4_bin,
  `input` json DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx__raw_jira_api_epics_params` (`params`)
) ENGINE=InnoDB AUTO_INCREMENT=2275 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_raw_jira_api_issue_changelogs`
--

DROP TABLE IF EXISTS `_raw_jira_api_issue_changelogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_raw_jira_api_issue_changelogs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `data` longblob,
  `url` longtext COLLATE utf8mb4_bin,
  `input` json DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx__raw_jira_api_issue_changelogs_params` (`params`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_raw_jira_api_issue_fields`
--

DROP TABLE IF EXISTS `_raw_jira_api_issue_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_raw_jira_api_issue_fields` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `data` longblob,
  `url` longtext COLLATE utf8mb4_bin,
  `input` json DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx__raw_jira_api_issue_fields_params` (`params`)
) ENGINE=InnoDB AUTO_INCREMENT=4803 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_raw_jira_api_issue_types`
--

DROP TABLE IF EXISTS `_raw_jira_api_issue_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_raw_jira_api_issue_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `data` longblob,
  `url` longtext COLLATE utf8mb4_bin,
  `input` json DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx__raw_jira_api_issue_types_params` (`params`)
) ENGINE=InnoDB AUTO_INCREMENT=2136 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_raw_jira_api_issues`
--

DROP TABLE IF EXISTS `_raw_jira_api_issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_raw_jira_api_issues` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `data` longblob,
  `url` longtext COLLATE utf8mb4_bin,
  `input` json DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx__raw_jira_api_issues_params` (`params`)
) ENGINE=InnoDB AUTO_INCREMENT=947 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_raw_jira_api_projects`
--

DROP TABLE IF EXISTS `_raw_jira_api_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_raw_jira_api_projects` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `data` longblob,
  `url` longtext COLLATE utf8mb4_bin,
  `input` json DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx__raw_jira_api_projects_params` (`params`)
) ENGINE=InnoDB AUTO_INCREMENT=701 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_raw_jira_api_remotelinks`
--

DROP TABLE IF EXISTS `_raw_jira_api_remotelinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_raw_jira_api_remotelinks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `data` longblob,
  `url` longtext COLLATE utf8mb4_bin,
  `input` json DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx__raw_jira_api_remotelinks_params` (`params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_raw_jira_api_sprints`
--

DROP TABLE IF EXISTS `_raw_jira_api_sprints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_raw_jira_api_sprints` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `data` longblob,
  `url` longtext COLLATE utf8mb4_bin,
  `input` json DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx__raw_jira_api_sprints_params` (`params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_raw_jira_api_status`
--

DROP TABLE IF EXISTS `_raw_jira_api_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_raw_jira_api_status` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `data` longblob,
  `url` longtext COLLATE utf8mb4_bin,
  `input` json DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx__raw_jira_api_status_params` (`params`)
) ENGINE=InnoDB AUTO_INCREMENT=2465 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_raw_jira_api_users`
--

DROP TABLE IF EXISTS `_raw_jira_api_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_raw_jira_api_users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `data` longblob,
  `url` longtext COLLATE utf8mb4_bin,
  `input` json DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx__raw_jira_api_users_params` (`params`)
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_raw_jira_api_worklogs`
--

DROP TABLE IF EXISTS `_raw_jira_api_worklogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_raw_jira_api_worklogs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `data` longblob,
  `url` longtext COLLATE utf8mb4_bin,
  `input` json DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx__raw_jira_api_worklogs_params` (`params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_ae_commits`
--

DROP TABLE IF EXISTS `_tool_ae_commits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_ae_commits` (
  `hex_sha` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `analysis_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `author_email` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `dev_eq` bigint DEFAULT NULL,
  `ae_project_id` bigint DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`hex_sha`),
  KEY `idx__tool_ae_commits_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_ae_connections`
--

DROP TABLE IF EXISTS `_tool_ae_connections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_ae_connections` (
  `name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `endpoint` longtext COLLATE utf8mb4_bin,
  `proxy` longtext COLLATE utf8mb4_bin,
  `rate_limit_per_hour` bigint DEFAULT NULL,
  `app_id` longtext COLLATE utf8mb4_bin,
  `secret_key` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx__tool_ae_connections_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_ae_projects`
--

DROP TABLE IF EXISTS `_tool_ae_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_ae_projects` (
  `connection_id` bigint unsigned NOT NULL,
  `id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `git_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'url of the repo in github',
  `priority` bigint DEFAULT NULL,
  `ae_create_time` datetime(3) DEFAULT NULL,
  `ae_update_time` datetime(3) DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`id`),
  KEY `idx__tool_ae_projects_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_azuredevops_azuredevopsconnections`
--

DROP TABLE IF EXISTS `_tool_azuredevops_azuredevopsconnections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_azuredevops_azuredevopsconnections` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `token` longtext COLLATE utf8mb4_bin,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `proxy` longtext COLLATE utf8mb4_bin,
  `organization` longtext COLLATE utf8mb4_bin,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `idx__tool_azuredevops_azuredevopsconnections_name` (`name`),
  KEY `idx__tool_azuredevops_azuredevopsconnections_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_azuredevops_builds`
--

DROP TABLE IF EXISTS `_tool_azuredevops_builds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_azuredevops_builds` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `status` text COLLATE utf8mb4_bin,
  `connection_id` bigint NOT NULL,
  `name` text COLLATE utf8mb4_bin,
  `start_time` datetime(3) DEFAULT NULL,
  `result` text COLLATE utf8mb4_bin,
  `source_version` text COLLATE utf8mb4_bin,
  `finish_time` datetime(3) DEFAULT NULL,
  `source_branch` text COLLATE utf8mb4_bin,
  `id` bigint NOT NULL,
  `queue_time` datetime DEFAULT NULL,
  `display_title` text COLLATE utf8mb4_bin,
  `url` text COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`id`),
  KEY `idx__tool_azuredevops_builds_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_azuredevops_gitpullrequestcommits`
--

DROP TABLE IF EXISTS `_tool_azuredevops_gitpullrequestcommits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_azuredevops_gitpullrequestcommits` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `commit_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `pull_request_id` text COLLATE utf8mb4_bin,
  `author_name` text COLLATE utf8mb4_bin,
  `connection_id` bigint NOT NULL,
  `author_email` text COLLATE utf8mb4_bin,
  `author_date` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`commit_id`,`connection_id`),
  KEY `idx__tool_azuredevops_gitpullrequestcommits_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_azuredevops_gitpullrequests`
--

DROP TABLE IF EXISTS `_tool_azuredevops_gitpullrequests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_azuredevops_gitpullrequests` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `target_commit_sha` text COLLATE utf8mb4_bin,
  `fork_repo_id` text COLLATE utf8mb4_bin,
  `pull_request_id` bigint NOT NULL,
  `description` text COLLATE utf8mb4_bin,
  `created_by_id` text COLLATE utf8mb4_bin,
  `merge_commit_sha` text COLLATE utf8mb4_bin,
  `title` text COLLATE utf8mb4_bin,
  `target_ref_name` text COLLATE utf8mb4_bin,
  `status` text COLLATE utf8mb4_bin,
  `source_commit_sha` text COLLATE utf8mb4_bin,
  `source_ref_name` text COLLATE utf8mb4_bin,
  `closed_date` datetime(3) DEFAULT NULL,
  `url` text COLLATE utf8mb4_bin,
  `type` text COLLATE utf8mb4_bin,
  `connection_id` bigint NOT NULL,
  `created_by_name` text COLLATE utf8mb4_bin,
  `creation_date` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`pull_request_id`,`connection_id`),
  KEY `idx__tool_azuredevops_gitpullrequests_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_azuredevops_gitrepositories`
--

DROP TABLE IF EXISTS `_tool_azuredevops_gitrepositories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_azuredevops_gitrepositories` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `org_id` text COLLATE utf8mb4_bin,
  `project_id` text COLLATE utf8mb4_bin,
  `name` text COLLATE utf8mb4_bin,
  `remote_url` text COLLATE utf8mb4_bin,
  `url` text COLLATE utf8mb4_bin,
  `default_branch` text COLLATE utf8mb4_bin,
  `parent_repository_url` text COLLATE utf8mb4_bin,
  `provider` text COLLATE utf8mb4_bin,
  `connection_id` bigint NOT NULL,
  `scope_config_id` bigint DEFAULT NULL,
  `updated_date` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`,`connection_id`),
  KEY `idx__tool_azuredevops_gitrepositories_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_azuredevops_gitrepositoryconfigs`
--

DROP TABLE IF EXISTS `_tool_azuredevops_gitrepositoryconfigs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_azuredevops_gitrepositoryconfigs` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `name` text COLLATE utf8mb4_bin,
  `refdiff` json DEFAULT NULL,
  `deployment_pattern` text COLLATE utf8mb4_bin,
  `production_pattern` text COLLATE utf8mb4_bin,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `entities` json DEFAULT NULL,
  `connection_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx__tool_azuredevops_azuredevopstransformationrules_raw06ce0a6d` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_azuredevops_go_builds`
--

DROP TABLE IF EXISTS `_tool_azuredevops_go_builds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_azuredevops_go_builds` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `connection_id` bigint unsigned NOT NULL,
  `azuredevops_id` bigint NOT NULL,
  `repository_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `result` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `source_branch` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `source_version` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `tags` longtext COLLATE utf8mb4_bin,
  `queue_time` datetime(3) DEFAULT NULL,
  `start_time` datetime(3) DEFAULT NULL,
  `finish_time` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`connection_id`,`azuredevops_id`),
  KEY `idx__tool_azuredevops_go_builds_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_azuredevops_go_commits`
--

DROP TABLE IF EXISTS `_tool_azuredevops_go_commits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_azuredevops_go_commits` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `sha` varchar(40) COLLATE utf8mb4_bin NOT NULL,
  `message` longtext COLLATE utf8mb4_bin,
  `author_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `author_email` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `authored_date` datetime(3) DEFAULT NULL,
  `committer_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `committer_email` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `committed_date` datetime(3) DEFAULT NULL,
  `web_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `additions` bigint DEFAULT NULL,
  `deletions` bigint DEFAULT NULL,
  `edit` bigint DEFAULT NULL,
  PRIMARY KEY (`sha`),
  KEY `idx__tool_azuredevops_go_commits_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_azuredevops_go_connections`
--

DROP TABLE IF EXISTS `_tool_azuredevops_go_connections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_azuredevops_go_connections` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `token` longtext COLLATE utf8mb4_bin,
  `proxy` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `organization` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx__tool_azuredevops_go_connections_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_azuredevops_go_pull_request_commits`
--

DROP TABLE IF EXISTS `_tool_azuredevops_go_pull_request_commits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_azuredevops_go_pull_request_commits` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `commit_sha` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `connection_id` bigint unsigned NOT NULL,
  `pull_request_id` bigint NOT NULL,
  `author_date` datetime(3) DEFAULT NULL,
  `author_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `author_email` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`commit_sha`,`connection_id`,`pull_request_id`),
  KEY `idx__tool_azuredevops_go_pull_request_commits_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_azuredevops_go_pull_request_labels`
--

DROP TABLE IF EXISTS `_tool_azuredevops_go_pull_request_labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_azuredevops_go_pull_request_labels` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `connection_id` bigint unsigned NOT NULL,
  `pull_request_id` bigint NOT NULL,
  `label_name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`connection_id`,`pull_request_id`,`label_name`),
  KEY `idx__tool_azuredevops_go_pull_request_labels_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_azuredevops_go_pull_requests`
--

DROP TABLE IF EXISTS `_tool_azuredevops_go_pull_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_azuredevops_go_pull_requests` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `connection_id` bigint unsigned NOT NULL,
  `azuredevops_id` bigint NOT NULL,
  `repository_id` longtext COLLATE utf8mb4_bin,
  `creation_date` datetime(3) DEFAULT NULL,
  `merge_commit_sha` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `target_ref_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_bin,
  `status` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `source_ref_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `source_commit_sha` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `target_commit_sha` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_by_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `closed_date` datetime(3) DEFAULT NULL,
  `title` longtext COLLATE utf8mb4_bin,
  `fork_repo_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_by_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`connection_id`,`azuredevops_id`),
  KEY `idx__tool_azuredevops_go_pull_requests_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_azuredevops_go_repo_commits`
--

DROP TABLE IF EXISTS `_tool_azuredevops_go_repo_commits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_azuredevops_go_repo_commits` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `connection_id` bigint unsigned NOT NULL,
  `repository_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `commit_sha` varchar(40) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`connection_id`,`repository_id`,`commit_sha`),
  KEY `idx__tool_azuredevops_go_repo_commits_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_azuredevops_go_repos`
--

DROP TABLE IF EXISTS `_tool_azuredevops_go_repos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_azuredevops_go_repos` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `organization_id` longtext COLLATE utf8mb4_bin,
  `project_id` longtext COLLATE utf8mb4_bin,
  `connection_id` bigint unsigned NOT NULL,
  `id` varchar(191) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `remote_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `scope_config_id` bigint DEFAULT NULL,
  `is_fork` tinyint(1) DEFAULT NULL,
  `type` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `is_private` tinyint(1) DEFAULT NULL,
  `external_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`connection_id`,`id`),
  KEY `idx__tool_azuredevops_go_repos_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_azuredevops_go_scope_configs`
--

DROP TABLE IF EXISTS `_tool_azuredevops_go_scope_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_azuredevops_go_scope_configs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `entities` json DEFAULT NULL,
  `connection_id` bigint unsigned DEFAULT NULL,
  `name` longtext COLLATE utf8mb4_bin,
  `deployment_pattern` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `production_pattern` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `refdiff` json DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_azuredevops_go_timeline_records`
--

DROP TABLE IF EXISTS `_tool_azuredevops_go_timeline_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_azuredevops_go_timeline_records` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `connection_id` bigint unsigned NOT NULL,
  `record_id` varchar(191) COLLATE utf8mb4_bin NOT NULL,
  `build_id` bigint NOT NULL,
  `parent_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `start_time` datetime(3) DEFAULT NULL,
  `finish_time` datetime(3) DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `result` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `change_id` bigint DEFAULT NULL,
  `last_modified` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`connection_id`,`record_id`,`build_id`),
  KEY `idx__tool_azuredevops_go_timeline_records_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_azuredevops_go_users`
--

DROP TABLE IF EXISTS `_tool_azuredevops_go_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_azuredevops_go_users` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `connection_id` bigint unsigned NOT NULL,
  `azuredevops_id` varchar(191) COLLATE utf8mb4_bin NOT NULL,
  `origin` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `descriptor` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `principal_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `mail_address` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`connection_id`,`azuredevops_id`),
  KEY `idx__tool_azuredevops_go_users_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_azuredevops_jobs`
--

DROP TABLE IF EXISTS `_tool_azuredevops_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_azuredevops_jobs` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `build_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `name` text COLLATE utf8mb4_bin,
  `state` text COLLATE utf8mb4_bin,
  `connection_id` bigint NOT NULL,
  `finish_time` datetime(3) DEFAULT NULL,
  `result` text COLLATE utf8mb4_bin,
  `start_time` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`,`build_id`),
  KEY `idx__tool_azuredevops_jobs_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_bamboo_connections`
--

DROP TABLE IF EXISTS `_tool_bamboo_connections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_bamboo_connections` (
  `name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `endpoint` longtext COLLATE utf8mb4_bin,
  `proxy` longtext COLLATE utf8mb4_bin,
  `rate_limit_per_hour` bigint DEFAULT NULL,
  `username` longtext COLLATE utf8mb4_bin,
  `password` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx__tool_bamboo_connections_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_bamboo_deploy_builds`
--

DROP TABLE IF EXISTS `_tool_bamboo_deploy_builds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_bamboo_deploy_builds` (
  `connection_id` bigint unsigned NOT NULL,
  `deploy_build_id` bigint unsigned NOT NULL,
  `deployment_version_name` longtext COLLATE utf8mb4_bin,
  `deployment_state` longtext COLLATE utf8mb4_bin,
  `life_cycle_state` longtext COLLATE utf8mb4_bin,
  `started_date` datetime(3) DEFAULT NULL,
  `queued_date` datetime(3) DEFAULT NULL,
  `executed_date` datetime(3) DEFAULT NULL,
  `finished_date` datetime(3) DEFAULT NULL,
  `reason_summary` longtext COLLATE utf8mb4_bin,
  `project_key` varchar(191) COLLATE utf8mb4_bin DEFAULT NULL,
  `plan_key` varchar(191) COLLATE utf8mb4_bin DEFAULT NULL,
  `can_view` tinyint(1) DEFAULT NULL,
  `can_edit` tinyint(1) DEFAULT NULL,
  `can_delete` tinyint(1) DEFAULT NULL,
  `allowed_to_execute` tinyint(1) DEFAULT NULL,
  `can_execute` tinyint(1) DEFAULT NULL,
  `allowed_to_create_version` tinyint(1) DEFAULT NULL,
  `allowed_to_set_version_status` tinyint(1) DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `environment` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `plan_result_key` varchar(191) COLLATE utf8mb4_bin DEFAULT NULL,
  `plan_branch_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `env_key` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`deploy_build_id`),
  KEY `idx__tool_bamboo_deploy_build_project_key` (`project_key`),
  KEY `idx__tool_bamboo_deploy_build_plan_key` (`plan_key`),
  KEY `idx__tool_bamboo_deploy_build_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_bamboo_deploy_environments`
--

DROP TABLE IF EXISTS `_tool_bamboo_deploy_environments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_bamboo_deploy_environments` (
  `connection_id` bigint unsigned NOT NULL,
  `env_id` bigint unsigned NOT NULL,
  `env_key` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `plan_key` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `project_key` varchar(191) COLLATE utf8mb4_bin DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_bin,
  `deployment_project_id` bigint unsigned DEFAULT NULL,
  `position` bigint unsigned DEFAULT NULL,
  `configuration_state` longtext COLLATE utf8mb4_bin,
  `can_view` tinyint(1) DEFAULT NULL,
  `can_edit` tinyint(1) DEFAULT NULL,
  `can_delete` tinyint(1) DEFAULT NULL,
  `allowed_to_execute` tinyint(1) DEFAULT NULL,
  `can_execute` tinyint(1) DEFAULT NULL,
  `allowed_to_create_version` tinyint(1) DEFAULT NULL,
  `allowed_to_set_version_status` tinyint(1) DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`env_id`),
  KEY `idx__tool_bamboo_deploy_environment_plan_key` (`plan_key`),
  KEY `idx__tool_bamboo_deploy_environment_project_key` (`project_key`),
  KEY `idx__tool_bamboo_deploy_environment_raw_data_params` (`_raw_data_params`),
  KEY `idx__tool_bamboo_deploy_environment_env_key` (`env_key`),
  KEY `idx__tool_bamboo_deploy_environment_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_bamboo_job_builds`
--

DROP TABLE IF EXISTS `_tool_bamboo_job_builds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_bamboo_job_builds` (
  `connection_id` bigint unsigned NOT NULL,
  `job_build_key` varchar(191) COLLATE utf8mb4_bin NOT NULL,
  `plan_build_key` varchar(191) COLLATE utf8mb4_bin DEFAULT NULL,
  `expand` longtext COLLATE utf8mb4_bin,
  `number` bigint DEFAULT NULL,
  `build_number` bigint DEFAULT NULL,
  `job_name` varchar(191) COLLATE utf8mb4_bin DEFAULT NULL,
  `job_key` varchar(191) COLLATE utf8mb4_bin DEFAULT NULL,
  `plan_name` varchar(191) COLLATE utf8mb4_bin DEFAULT NULL,
  `plan_key` varchar(191) COLLATE utf8mb4_bin DEFAULT NULL,
  `project_name` varchar(191) COLLATE utf8mb4_bin DEFAULT NULL,
  `project_key` varchar(191) COLLATE utf8mb4_bin DEFAULT NULL,
  `build_result_key` longtext COLLATE utf8mb4_bin,
  `life_cycle_state` longtext COLLATE utf8mb4_bin,
  `build_started_time` datetime(3) DEFAULT NULL,
  `pretty_build_started_time` longtext COLLATE utf8mb4_bin,
  `build_completed_time` datetime(3) DEFAULT NULL,
  `build_completed_date` datetime(3) DEFAULT NULL,
  `pretty_build_completed_time` longtext COLLATE utf8mb4_bin,
  `build_duration_in_seconds` bigint DEFAULT NULL,
  `build_duration` bigint DEFAULT NULL,
  `build_duration_description` longtext COLLATE utf8mb4_bin,
  `build_relative_time` longtext COLLATE utf8mb4_bin,
  `vcs_revision_key` longtext COLLATE utf8mb4_bin,
  `build_test_summary` longtext COLLATE utf8mb4_bin,
  `successful_test_count` bigint DEFAULT NULL,
  `failed_test_count` bigint DEFAULT NULL,
  `quarantined_test_count` bigint DEFAULT NULL,
  `skipped_test_count` bigint DEFAULT NULL,
  `continuable` tinyint(1) DEFAULT NULL,
  `once_off` tinyint(1) DEFAULT NULL,
  `restartable` tinyint(1) DEFAULT NULL,
  `not_run_yet` tinyint(1) DEFAULT NULL,
  `finished` tinyint(1) DEFAULT NULL,
  `successful` tinyint(1) DEFAULT NULL,
  `build_reason` longtext COLLATE utf8mb4_bin,
  `reason_summary` longtext COLLATE utf8mb4_bin,
  `state` longtext COLLATE utf8mb4_bin,
  `build_state` longtext COLLATE utf8mb4_bin,
  `job_result_key` longtext COLLATE utf8mb4_bin,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `environment` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `queue_started_time` datetime(3) DEFAULT NULL,
  `queue_duration` bigint DEFAULT NULL,
  `queue_duration_in_seconds` bigint DEFAULT NULL,
  PRIMARY KEY (`connection_id`,`job_build_key`),
  KEY `idx__tool_bamboo_job_builds_job_name` (`job_name`),
  KEY `idx__tool_bamboo_job_builds_job_key` (`job_key`),
  KEY `idx__tool_bamboo_job_builds_plan_name` (`plan_name`),
  KEY `idx__tool_bamboo_job_builds_plan_key` (`plan_key`),
  KEY `idx__tool_bamboo_job_builds_project_name` (`project_name`),
  KEY `idx__tool_bamboo_job_builds_project_key` (`project_key`),
  KEY `idx__tool_bamboo_job_builds_raw_data_params` (`_raw_data_params`),
  KEY `idx__tool_bamboo_job_builds_plan_build_key` (`plan_build_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_bamboo_jobs`
--

DROP TABLE IF EXISTS `_tool_bamboo_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_bamboo_jobs` (
  `connection_id` bigint unsigned NOT NULL,
  `job_key` varchar(191) COLLATE utf8mb4_bin NOT NULL,
  `id` longtext COLLATE utf8mb4_bin,
  `name` longtext COLLATE utf8mb4_bin,
  `plan_key` longtext COLLATE utf8mb4_bin,
  `plan_name` longtext COLLATE utf8mb4_bin,
  `project_key` varchar(191) COLLATE utf8mb4_bin DEFAULT NULL,
  `project_name` longtext COLLATE utf8mb4_bin,
  `description` longtext COLLATE utf8mb4_bin,
  `branch_name` longtext COLLATE utf8mb4_bin,
  `stage_name` longtext COLLATE utf8mb4_bin,
  `type` longtext COLLATE utf8mb4_bin,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`job_key`),
  KEY `idx__tool_bamboo_jobs_project_key` (`project_key`),
  KEY `idx__tool_bamboo_jobs_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_bamboo_plan_build_commits`
--

DROP TABLE IF EXISTS `_tool_bamboo_plan_build_commits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_bamboo_plan_build_commits` (
  `connection_id` bigint unsigned NOT NULL,
  `plan_build_key` varchar(191) COLLATE utf8mb4_bin NOT NULL,
  `plan_result_key` varchar(191) COLLATE utf8mb4_bin NOT NULL,
  `repository_id` bigint DEFAULT NULL,
  `repository_name` longtext COLLATE utf8mb4_bin,
  `vcs_revision_key` varchar(191) COLLATE utf8mb4_bin NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `display_title` longtext COLLATE utf8mb4_bin,
  `url` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`plan_build_key`,`plan_result_key`,`vcs_revision_key`),
  KEY `idx__tool_bamboo_plan_build_commits_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_bamboo_plan_builds`
--

DROP TABLE IF EXISTS `_tool_bamboo_plan_builds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_bamboo_plan_builds` (
  `connection_id` bigint unsigned NOT NULL,
  `plan_build_key` varchar(191) COLLATE utf8mb4_bin NOT NULL,
  `expand` longtext COLLATE utf8mb4_bin,
  `number` bigint DEFAULT NULL,
  `build_number` bigint DEFAULT NULL,
  `plan_name` longtext COLLATE utf8mb4_bin,
  `plan_key` longtext COLLATE utf8mb4_bin,
  `project_name` longtext COLLATE utf8mb4_bin,
  `project_key` longtext COLLATE utf8mb4_bin,
  `build_result_key` longtext COLLATE utf8mb4_bin,
  `life_cycle_state` longtext COLLATE utf8mb4_bin,
  `build_started_time` datetime(3) DEFAULT NULL,
  `pretty_build_started_time` longtext COLLATE utf8mb4_bin,
  `build_completed_time` datetime(3) DEFAULT NULL,
  `build_completed_date` datetime(3) DEFAULT NULL,
  `pretty_build_completed_time` longtext COLLATE utf8mb4_bin,
  `build_duration_in_seconds` bigint DEFAULT NULL,
  `build_duration` bigint DEFAULT NULL,
  `build_duration_description` longtext COLLATE utf8mb4_bin,
  `build_relative_time` longtext COLLATE utf8mb4_bin,
  `vcs_revision_key` longtext COLLATE utf8mb4_bin,
  `build_test_summary` longtext COLLATE utf8mb4_bin,
  `successful_test_count` bigint DEFAULT NULL,
  `failed_test_count` bigint DEFAULT NULL,
  `quarantined_test_count` bigint DEFAULT NULL,
  `skipped_test_count` bigint DEFAULT NULL,
  `continuable` tinyint(1) DEFAULT NULL,
  `once_off` tinyint(1) DEFAULT NULL,
  `restartable` tinyint(1) DEFAULT NULL,
  `not_run_yet` tinyint(1) DEFAULT NULL,
  `finished` tinyint(1) DEFAULT NULL,
  `successful` tinyint(1) DEFAULT NULL,
  `build_reason` longtext COLLATE utf8mb4_bin,
  `reason_summary` longtext COLLATE utf8mb4_bin,
  `state` longtext COLLATE utf8mb4_bin,
  `build_state` longtext COLLATE utf8mb4_bin,
  `plan_result_key` longtext COLLATE utf8mb4_bin,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `environment` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `link_href` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`plan_build_key`),
  KEY `idx__tool_bamboo_plan_builds_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_bamboo_plans`
--

DROP TABLE IF EXISTS `_tool_bamboo_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_bamboo_plans` (
  `connection_id` bigint unsigned NOT NULL,
  `plan_key` varchar(191) COLLATE utf8mb4_bin NOT NULL,
  `name` longtext COLLATE utf8mb4_bin,
  `expand` longtext COLLATE utf8mb4_bin,
  `project_key` varchar(191) COLLATE utf8mb4_bin DEFAULT NULL,
  `project_name` longtext COLLATE utf8mb4_bin,
  `description` longtext COLLATE utf8mb4_bin,
  `short_name` longtext COLLATE utf8mb4_bin,
  `build_name` longtext COLLATE utf8mb4_bin,
  `short_key` longtext COLLATE utf8mb4_bin,
  `type` longtext COLLATE utf8mb4_bin,
  `enabled` tinyint(1) DEFAULT NULL,
  `href` longtext COLLATE utf8mb4_bin,
  `rel` longtext COLLATE utf8mb4_bin,
  `is_favourite` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `is_building` tinyint(1) DEFAULT NULL,
  `average_build_time_in_seconds` double DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `scope_config_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`connection_id`,`plan_key`),
  KEY `idx__tool_bamboo_plans_project_key` (`project_key`),
  KEY `idx__tool_bamboo_plans_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_bamboo_projects`
--

DROP TABLE IF EXISTS `_tool_bamboo_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_bamboo_projects` (
  `connection_id` bigint unsigned NOT NULL,
  `project_key` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `expand` longtext COLLATE utf8mb4_bin,
  `name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_bin,
  `href` longtext COLLATE utf8mb4_bin,
  `rel` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `scope_config_id` bigint unsigned DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`project_key`),
  KEY `idx__tool_bamboo_projects_name` (`name`),
  KEY `idx__tool_bamboo_projects_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_bamboo_scope_configs`
--

DROP TABLE IF EXISTS `_tool_bamboo_scope_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_bamboo_scope_configs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `repo_map` json DEFAULT NULL,
  `deployment_pattern` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `production_pattern` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `connection_id` bigint unsigned DEFAULT NULL,
  `entities` json DEFAULT NULL,
  `env_name_pattern` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_name_gitlab` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_bitbucket_accounts`
--

DROP TABLE IF EXISTS `_tool_bitbucket_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_bitbucket_accounts` (
  `connection_id` bigint unsigned NOT NULL,
  `user_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `account_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `account_status` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `avatar_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `html_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `has2_fa_enabled` tinyint(1) DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`account_id`),
  KEY `idx__tool_bitbucket_accounts_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_bitbucket_commits`
--

DROP TABLE IF EXISTS `_tool_bitbucket_commits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_bitbucket_commits` (
  `sha` varchar(40) COLLATE utf8mb4_bin NOT NULL,
  `author_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `author_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `author_email` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `authored_date` datetime(3) DEFAULT NULL,
  `committed_date` datetime(3) DEFAULT NULL,
  `message` longtext COLLATE utf8mb4_bin,
  `url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `additions` bigint DEFAULT NULL COMMENT 'Added lines of code',
  `deletions` bigint DEFAULT NULL COMMENT 'Deleted lines of code',
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`sha`),
  KEY `idx__tool_bitbucket_commits_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_bitbucket_connections`
--

DROP TABLE IF EXISTS `_tool_bitbucket_connections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_bitbucket_connections` (
  `name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `endpoint` longtext COLLATE utf8mb4_bin,
  `proxy` longtext COLLATE utf8mb4_bin,
  `rate_limit_per_hour` bigint DEFAULT NULL,
  `username` longtext COLLATE utf8mb4_bin,
  `password` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx__tool_bitbucket_connections_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_bitbucket_deployments`
--

DROP TABLE IF EXISTS `_tool_bitbucket_deployments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_bitbucket_deployments` (
  `connection_id` bigint unsigned NOT NULL,
  `bitbucket_id` varchar(191) COLLATE utf8mb4_bin NOT NULL,
  `pipeline_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `key` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `web_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `status` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `state_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `commit_sha` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `commit_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_on` datetime(3) DEFAULT NULL,
  `started_on` datetime(3) DEFAULT NULL,
  `completed_on` datetime(3) DEFAULT NULL,
  `last_update_time` datetime(3) DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `step_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `environment` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `environment_type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`connection_id`,`bitbucket_id`),
  KEY `idx__tool_bitbucket_deployments_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_bitbucket_issue_comments`
--

DROP TABLE IF EXISTS `_tool_bitbucket_issue_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_bitbucket_issue_comments` (
  `connection_id` bigint unsigned NOT NULL,
  `bitbucket_id` bigint NOT NULL,
  `issue_id` bigint DEFAULT NULL COMMENT 'References the Issue',
  `author_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `author_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `bitbucket_created_at` datetime(3) DEFAULT NULL,
  `bitbucket_updated_at` datetime(3) DEFAULT NULL,
  `type` longtext COLLATE utf8mb4_bin,
  `body` longtext COLLATE utf8mb4_bin,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`bitbucket_id`),
  KEY `idx__tool_bitbucket_issue_comments_issue_id` (`issue_id`),
  KEY `idx__tool_bitbucket_issue_comments_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_bitbucket_issues`
--

DROP TABLE IF EXISTS `_tool_bitbucket_issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_bitbucket_issues` (
  `connection_id` bigint unsigned NOT NULL,
  `repo_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `bitbucket_id` bigint NOT NULL,
  `number` bigint DEFAULT NULL COMMENT 'Used in API requests ex. api/issues/<THIS_NUMBER>',
  `state` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `std_state` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `body` longtext COLLATE utf8mb4_bin,
  `priority` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `type` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `author_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `author_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `assignee_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `assignee_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `milestone_id` bigint DEFAULT NULL,
  `lead_time_minutes` bigint unsigned DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `closed_at` datetime(3) DEFAULT NULL,
  `bitbucket_created_at` datetime(3) DEFAULT NULL,
  `bitbucket_updated_at` datetime(3) DEFAULT NULL,
  `severity` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `component` text COLLATE utf8mb4_bin,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`repo_id`,`bitbucket_id`),
  KEY `idx__tool_bitbucket_issues_number` (`number`),
  KEY `idx__tool_bitbucket_issues_milestone_id` (`milestone_id`),
  KEY `idx__tool_bitbucket_issues_bitbucket_updated_at` (`bitbucket_updated_at`),
  KEY `idx__tool_bitbucket_issues_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_bitbucket_pipeline_steps`
--

DROP TABLE IF EXISTS `_tool_bitbucket_pipeline_steps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_bitbucket_pipeline_steps` (
  `connection_id` bigint unsigned NOT NULL,
  `bitbucket_id` varchar(191) COLLATE utf8mb4_bin NOT NULL,
  `pipeline_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `trigger` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `result` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `repo_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `max_time` bigint DEFAULT NULL,
  `started_on` datetime(3) DEFAULT NULL,
  `completed_on` datetime(3) DEFAULT NULL,
  `duration_in_seconds` bigint DEFAULT NULL,
  `build_seconds_used` bigint DEFAULT NULL,
  `run_number` bigint DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `environment` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`bitbucket_id`),
  KEY `idx__tool_bitbucket_pipeline_steps_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_bitbucket_pipelines`
--

DROP TABLE IF EXISTS `_tool_bitbucket_pipelines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_bitbucket_pipelines` (
  `connection_id` bigint unsigned NOT NULL,
  `bitbucket_id` varchar(191) COLLATE utf8mb4_bin NOT NULL,
  `status` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `result` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `ref_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `web_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `duration_in_seconds` bigint unsigned DEFAULT NULL,
  `bitbucket_created_on` datetime(3) DEFAULT NULL,
  `bitbucket_complete_on` datetime(3) DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `repo_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `commit_sha` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `environment` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `build_number` bigint DEFAULT NULL,
  PRIMARY KEY (`connection_id`,`bitbucket_id`),
  KEY `idx__tool_bitbucket_pipelines_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_bitbucket_pull_request_comments`
--

DROP TABLE IF EXISTS `_tool_bitbucket_pull_request_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_bitbucket_pull_request_comments` (
  `connection_id` bigint unsigned NOT NULL,
  `bitbucket_id` bigint NOT NULL,
  `repo_id` varchar(191) COLLATE utf8mb4_bin DEFAULT NULL,
  `pull_request_id` bigint DEFAULT NULL,
  `author_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `author_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `bitbucket_created_at` datetime(3) DEFAULT NULL,
  `bitbucket_updated_at` datetime(3) DEFAULT NULL,
  `type` longtext COLLATE utf8mb4_bin COMMENT 'if type=null, it is normal comment,if type=diffNote,it is diff comment',
  `body` longtext COLLATE utf8mb4_bin,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`bitbucket_id`),
  KEY `pr` (`repo_id`,`pull_request_id`),
  KEY `idx__tool_bitbucket_pull_request_comments_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_bitbucket_pull_request_commits`
--

DROP TABLE IF EXISTS `_tool_bitbucket_pull_request_commits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_bitbucket_pull_request_commits` (
  `connection_id` bigint unsigned NOT NULL,
  `repo_id` varchar(191) COLLATE utf8mb4_bin NOT NULL,
  `pull_request_id` bigint NOT NULL,
  `commit_sha` varchar(40) COLLATE utf8mb4_bin NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `commit_author_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `commit_author_email` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `commit_authored_date` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`connection_id`,`repo_id`,`pull_request_id`,`commit_sha`),
  KEY `idx__tool_bitbucket_pull_request_commits_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_bitbucket_pull_requests`
--

DROP TABLE IF EXISTS `_tool_bitbucket_pull_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_bitbucket_pull_requests` (
  `connection_id` bigint unsigned NOT NULL,
  `repo_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `bitbucket_id` bigint NOT NULL,
  `number` bigint DEFAULT NULL,
  `base_repo_id` longtext COLLATE utf8mb4_bin,
  `head_repo_id` longtext COLLATE utf8mb4_bin,
  `state` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `title` longtext COLLATE utf8mb4_bin,
  `description` longtext COLLATE utf8mb4_bin,
  `bitbucket_created_at` datetime(3) DEFAULT NULL,
  `bitbucket_updated_at` datetime(3) DEFAULT NULL,
  `closed_at` datetime(3) DEFAULT NULL,
  `comment_count` bigint DEFAULT NULL,
  `commits` bigint DEFAULT NULL,
  `merged_at` datetime(3) DEFAULT NULL,
  `body` longtext COLLATE utf8mb4_bin,
  `type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `component` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `merge_commit_sha` varchar(40) COLLATE utf8mb4_bin DEFAULT NULL,
  `head_ref` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `base_ref` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `base_commit_sha` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `head_commit_sha` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `author_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `author_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `merged_by_name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `merged_by_id` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`connection_id`,`repo_id`,`bitbucket_id`),
  KEY `idx__tool_bitbucket_pull_requests_number` (`number`),
  KEY `idx__tool_bitbucket_pull_requests_bitbucket_updated_at` (`bitbucket_updated_at`),
  KEY `idx__tool_bitbucket_pull_requests_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_bitbucket_repo_commits`
--

DROP TABLE IF EXISTS `_tool_bitbucket_repo_commits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_bitbucket_repo_commits` (
  `connection_id` bigint unsigned NOT NULL,
  `repo_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `commit_sha` varchar(40) COLLATE utf8mb4_bin NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`repo_id`,`commit_sha`),
  KEY `idx__tool_bitbucket_repo_commits_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_bitbucket_repos`
--

DROP TABLE IF EXISTS `_tool_bitbucket_repos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_bitbucket_repos` (
  `connection_id` bigint unsigned NOT NULL,
  `bitbucket_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `html_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_bin,
  `owner` longtext COLLATE utf8mb4_bin,
  `language` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_date` datetime(3) DEFAULT NULL,
  `updated_date` datetime(3) DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `scope_config_id` bigint unsigned DEFAULT NULL,
  `clone_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`connection_id`,`bitbucket_id`),
  KEY `idx__tool_bitbucket_repos_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_bitbucket_scope_configs`
--

DROP TABLE IF EXISTS `_tool_bitbucket_scope_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_bitbucket_scope_configs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `deployment_pattern` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `production_pattern` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `refdiff` json DEFAULT NULL,
  `issue_status_todo` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `issue_status_in_progress` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `issue_status_done` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `issue_status_other` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `connection_id` bigint unsigned DEFAULT NULL,
  `entities` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_name_github` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_bitbucket_server_connections`
--

DROP TABLE IF EXISTS `_tool_bitbucket_server_connections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_bitbucket_server_connections` (
  `name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `endpoint` longtext COLLATE utf8mb4_bin,
  `proxy` longtext COLLATE utf8mb4_bin,
  `rate_limit_per_hour` bigint DEFAULT NULL,
  `username` longtext COLLATE utf8mb4_bin,
  `password` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx__tool_bitbucket_server_connections_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_bitbucket_server_pull_request_comments`
--

DROP TABLE IF EXISTS `_tool_bitbucket_server_pull_request_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_bitbucket_server_pull_request_comments` (
  `connection_id` bigint unsigned NOT NULL,
  `bitbucket_id` bigint NOT NULL,
  `repo_id` varchar(191) COLLATE utf8mb4_bin DEFAULT NULL,
  `pull_request_id` bigint DEFAULT NULL,
  `author_id` bigint DEFAULT NULL,
  `author_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `body` longtext COLLATE utf8mb4_bin,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`bitbucket_id`),
  KEY `pr` (`repo_id`,`pull_request_id`),
  KEY `idx__tool_bitbucket_server_pull_request_comments_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_bitbucket_server_pull_request_commits`
--

DROP TABLE IF EXISTS `_tool_bitbucket_server_pull_request_commits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_bitbucket_server_pull_request_commits` (
  `connection_id` bigint unsigned NOT NULL,
  `repo_id` varchar(191) COLLATE utf8mb4_bin NOT NULL,
  `pull_request_id` bigint NOT NULL,
  `commit_sha` varchar(40) COLLATE utf8mb4_bin NOT NULL,
  `commit_author_name` longtext COLLATE utf8mb4_bin,
  `commit_author_email` longtext COLLATE utf8mb4_bin,
  `commit_authored_date` datetime(3) DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`repo_id`,`pull_request_id`,`commit_sha`),
  KEY `idx__tool_bitbucket_server_pull_request_commits_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_bitbucket_server_pull_requests`
--

DROP TABLE IF EXISTS `_tool_bitbucket_server_pull_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_bitbucket_server_pull_requests` (
  `connection_id` bigint unsigned NOT NULL,
  `repo_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `bitbucket_id` bigint NOT NULL,
  `number` bigint DEFAULT NULL,
  `base_repo_id` longtext COLLATE utf8mb4_bin,
  `head_repo_id` longtext COLLATE utf8mb4_bin,
  `state` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `title` longtext COLLATE utf8mb4_bin,
  `description` longtext COLLATE utf8mb4_bin,
  `bitbucket_server_created_at` datetime(3) DEFAULT NULL,
  `bitbucket_server_updated_at` datetime(3) DEFAULT NULL,
  `closed_at` datetime(3) DEFAULT NULL,
  `comment_count` bigint DEFAULT NULL,
  `commits` bigint DEFAULT NULL,
  `merged_at` datetime(3) DEFAULT NULL,
  `body` longtext COLLATE utf8mb4_bin,
  `type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `component` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `merge_commit_sha` varchar(40) COLLATE utf8mb4_bin DEFAULT NULL,
  `head_ref` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `base_ref` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `base_commit_sha` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `head_commit_sha` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `author_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `author_id` bigint DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`repo_id`,`bitbucket_id`),
  KEY `idx__tool_bitbucket_server_pull_requests_number` (`number`),
  KEY `idx__tool_bitbucket_server_pull_requests_bitbucket_serve54980660` (`bitbucket_server_updated_at`),
  KEY `idx__tool_bitbucket_server_pull_requests_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_bitbucket_server_repos`
--

DROP TABLE IF EXISTS `_tool_bitbucket_server_repos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_bitbucket_server_repos` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `connection_id` bigint unsigned NOT NULL,
  `scope_config_id` bigint unsigned DEFAULT NULL,
  `bitbucket_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `html_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_bin,
  `clone_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_date` datetime(3) DEFAULT NULL,
  `updated_date` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`connection_id`,`bitbucket_id`),
  KEY `idx__tool_bitbucket_server_repos_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_bitbucket_server_scope_configs`
--

DROP TABLE IF EXISTS `_tool_bitbucket_server_scope_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_bitbucket_server_scope_configs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `entities` json DEFAULT NULL,
  `connection_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `pr_type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `pr_component` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `pr_body_close_pattern` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `refdiff` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx__tool_bitbucket_server_scope_configs_name` (`name`),
  KEY `idx__tool_bitbucket_server_scope_configs_connection_id` (`connection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_bitbucket_server_users`
--

DROP TABLE IF EXISTS `_tool_bitbucket_server_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_bitbucket_server_users` (
  `connection_id` bigint unsigned NOT NULL,
  `bitbucket_id` bigint NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `email_address` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `account_status` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `html_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`bitbucket_id`),
  KEY `idx__tool_bitbucket_server_users_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_circleci_accounts`
--

DROP TABLE IF EXISTS `_tool_circleci_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_circleci_accounts` (
  `connection_id` bigint NOT NULL,
  `id` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `vcs_type` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `avatar_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`id`),
  KEY `idx__tool_circleci_accounts_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_circleci_connections`
--

DROP TABLE IF EXISTS `_tool_circleci_connections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_circleci_connections` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `endpoint` longtext COLLATE utf8mb4_bin,
  `proxy` longtext COLLATE utf8mb4_bin,
  `rate_limit_per_hour` bigint DEFAULT NULL,
  `token` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx__tool_circleci_connections_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_circleci_jobs`
--

DROP TABLE IF EXISTS `_tool_circleci_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_circleci_jobs` (
  `connection_id` bigint NOT NULL,
  `workflow_id` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `id` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `project_slug` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `canceled_by` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `dependencies` text COLLATE utf8mb4_bin,
  `job_number` bigint DEFAULT NULL,
  `started_at` datetime(3) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `approved_by` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `status` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `type` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `approval_request_id` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `stopped_at` datetime(3) DEFAULT NULL,
  `duration_sec` bigint unsigned DEFAULT NULL,
  `pipeline_id` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `queued_at` datetime(3) DEFAULT NULL,
  `duration` bigint DEFAULT NULL,
  PRIMARY KEY (`connection_id`,`workflow_id`,`id`),
  KEY `idx__tool_circleci_jobs_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_circleci_pipelines`
--

DROP TABLE IF EXISTS `_tool_circleci_pipelines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_circleci_pipelines` (
  `connection_id` bigint NOT NULL,
  `id` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `project_slug` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `number` bigint DEFAULT NULL,
  `trigger_parameters` json DEFAULT NULL,
  `trigger` json DEFAULT NULL,
  `vcs` json DEFAULT NULL,
  `state` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `updated_date` datetime(3) DEFAULT NULL,
  `created_date` datetime(3) DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`id`),
  KEY `idx__tool_circleci_pipelines_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_circleci_projects`
--

DROP TABLE IF EXISTS `_tool_circleci_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_circleci_projects` (
  `connection_id` bigint NOT NULL,
  `id` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `organization_id` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `scope_config_id` bigint unsigned DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`id`),
  KEY `idx__tool_circleci_projects_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_circleci_scope_configs`
--

DROP TABLE IF EXISTS `_tool_circleci_scope_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_circleci_scope_configs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `entities` json DEFAULT NULL,
  `connection_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `deployment_pattern` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `production_pattern` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_name_jenkins` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_circleci_workflows`
--

DROP TABLE IF EXISTS `_tool_circleci_workflows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_circleci_workflows` (
  `connection_id` bigint NOT NULL,
  `id` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `project_slug` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `pipeline_id` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `canceled_by` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `errored_by` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `tag` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `status` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `started_by` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `pipeline_number` bigint DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `stopped_at` datetime(3) DEFAULT NULL,
  `duration_sec` bigint unsigned DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`id`),
  KEY `idx__tool_circleci_workflows_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_customized_fields`
--

DROP TABLE IF EXISTS `_tool_customized_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_customized_fields` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `tb_name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `data_type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`tb_name`,`column_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_feishu_chats`
--

DROP TABLE IF EXISTS `_tool_feishu_chats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_feishu_chats` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `connection_id` bigint unsigned NOT NULL,
  `chat_id` varchar(191) COLLATE utf8mb4_bin NOT NULL,
  `avatar` longtext COLLATE utf8mb4_bin,
  `description` longtext COLLATE utf8mb4_bin,
  `external` tinyint(1) DEFAULT NULL,
  `name` longtext COLLATE utf8mb4_bin,
  `owner_id` longtext COLLATE utf8mb4_bin,
  `owner_id_type` longtext COLLATE utf8mb4_bin,
  `tenant_key` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`chat_id`),
  KEY `idx__tool_feishu_chats_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_feishu_connections`
--

DROP TABLE IF EXISTS `_tool_feishu_connections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_feishu_connections` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `endpoint` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `proxy` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `rate_limit_per_hour` bigint DEFAULT NULL,
  `app_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `secret_key` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx__tool_feishu_connections_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_feishu_meeting_top_user_items`
--

DROP TABLE IF EXISTS `_tool_feishu_meeting_top_user_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_feishu_meeting_top_user_items` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `connection_id` bigint unsigned NOT NULL,
  `start_time` datetime(3) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `meeting_count` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `meeting_duration` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `user_type` bigint DEFAULT NULL,
  PRIMARY KEY (`connection_id`,`start_time`,`name`),
  KEY `idx__tool_feishu_meeting_top_user_items_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_feishu_messages`
--

DROP TABLE IF EXISTS `_tool_feishu_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_feishu_messages` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `connection_id` bigint unsigned NOT NULL,
  `message_id` varchar(191) COLLATE utf8mb4_bin NOT NULL,
  `content` longtext COLLATE utf8mb4_bin,
  `chat_id` longtext COLLATE utf8mb4_bin,
  `msg_type` longtext COLLATE utf8mb4_bin,
  `parent_id` longtext COLLATE utf8mb4_bin,
  `root_id` longtext COLLATE utf8mb4_bin,
  `sender_id` longtext COLLATE utf8mb4_bin,
  `sender_id_type` longtext COLLATE utf8mb4_bin,
  `sender_type` longtext COLLATE utf8mb4_bin,
  `deleted` tinyint(1) DEFAULT NULL,
  `create_time` datetime(3) DEFAULT NULL,
  `update_time` datetime(3) DEFAULT NULL,
  `updated` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`connection_id`,`message_id`),
  KEY `idx__tool_feishu_messages_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_gitee_accounts`
--

DROP TABLE IF EXISTS `_tool_gitee_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_gitee_accounts` (
  `connection_id` bigint unsigned NOT NULL,
  `id` bigint NOT NULL,
  `login` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `avatar_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `events_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `followers_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `following_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `gists_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `html_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `organizations_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `received_events_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `remark` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `repos_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `starred_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `subscriptions_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`id`),
  KEY `idx__tool_gitee_accounts_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_gitee_commit_stats`
--

DROP TABLE IF EXISTS `_tool_gitee_commit_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_gitee_commit_stats` (
  `connection_id` bigint unsigned NOT NULL,
  `sha` varchar(40) COLLATE utf8mb4_bin NOT NULL,
  `additions` bigint DEFAULT NULL COMMENT 'Added lines of code',
  `deletions` bigint DEFAULT NULL COMMENT 'Deleted lines of code',
  `committed_date` datetime(3) DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`sha`),
  KEY `idx__tool_gitee_commit_stats_raw_data_params` (`_raw_data_params`),
  KEY `idx__tool_gitee_commit_stats_committed_date` (`committed_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_gitee_commits`
--

DROP TABLE IF EXISTS `_tool_gitee_commits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_gitee_commits` (
  `sha` varchar(40) COLLATE utf8mb4_bin NOT NULL,
  `comments_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `message` longtext COLLATE utf8mb4_bin,
  `author_id` bigint DEFAULT NULL,
  `author_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `author_email` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `authored_date` datetime(3) DEFAULT NULL,
  `committer_id` bigint DEFAULT NULL,
  `committer_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `committer_email` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `committed_date` datetime(3) DEFAULT NULL,
  `web_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `additions` bigint DEFAULT NULL COMMENT 'Added lines of code',
  `deletions` bigint DEFAULT NULL COMMENT 'Deleted lines of code',
  `total` bigint DEFAULT NULL COMMENT 'Sum of added/deleted lines of code',
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`sha`),
  KEY `idx__tool_gitee_commits_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_gitee_connections`
--

DROP TABLE IF EXISTS `_tool_gitee_connections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_gitee_connections` (
  `name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `endpoint` longtext COLLATE utf8mb4_bin,
  `proxy` longtext COLLATE utf8mb4_bin,
  `rate_limit_per_hour` bigint DEFAULT NULL,
  `token` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx__tool_gitee_connections_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_gitee_issue_comments`
--

DROP TABLE IF EXISTS `_tool_gitee_issue_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_gitee_issue_comments` (
  `connection_id` bigint unsigned NOT NULL,
  `gitee_id` bigint NOT NULL,
  `issue_id` bigint DEFAULT NULL COMMENT 'References the Issue',
  `body` longtext COLLATE utf8mb4_bin,
  `author_username` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `author_user_id` bigint DEFAULT NULL,
  `gitee_created_at` datetime(3) DEFAULT NULL,
  `gitee_updated_at` datetime(3) DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`gitee_id`),
  KEY `idx__tool_gitee_issue_comments_raw_data_params` (`_raw_data_params`),
  KEY `idx__tool_gitee_issue_comments_issue_id` (`issue_id`),
  KEY `idx__tool_gitee_issue_comments_gitee_updated_at` (`gitee_updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_gitee_issue_labels`
--

DROP TABLE IF EXISTS `_tool_gitee_issue_labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_gitee_issue_labels` (
  `connection_id` bigint unsigned NOT NULL,
  `issue_id` bigint NOT NULL,
  `label_name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`issue_id`,`label_name`),
  KEY `idx__tool_gitee_issue_labels_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_gitee_issues`
--

DROP TABLE IF EXISTS `_tool_gitee_issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_gitee_issues` (
  `connection_id` bigint unsigned NOT NULL,
  `gitee_id` bigint NOT NULL,
  `repo_id` bigint DEFAULT NULL,
  `number` varchar(191) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Used in API requests ex. api/repo/1/issue/<THIS_NUMBER>',
  `state` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `title` longtext COLLATE utf8mb4_bin,
  `body` longtext COLLATE utf8mb4_bin,
  `priority` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `type` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `author_id` bigint DEFAULT NULL,
  `author_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `assignee_id` bigint DEFAULT NULL,
  `assignee_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `lead_time_minutes` bigint unsigned DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `closed_at` datetime(3) DEFAULT NULL,
  `gitee_created_at` datetime(3) DEFAULT NULL,
  `gitee_updated_at` datetime(3) DEFAULT NULL,
  `severity` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `component` text COLLATE utf8mb4_bin,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`gitee_id`),
  KEY `idx__tool_gitee_issues_number` (`number`),
  KEY `idx__tool_gitee_issues_gitee_updated_at` (`gitee_updated_at`),
  KEY `idx__tool_gitee_issues_raw_data_params` (`_raw_data_params`),
  KEY `idx__tool_gitee_issues_repo_id` (`repo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_gitee_pull_request_comments`
--

DROP TABLE IF EXISTS `_tool_gitee_pull_request_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_gitee_pull_request_comments` (
  `connection_id` bigint unsigned NOT NULL,
  `gitee_id` bigint NOT NULL,
  `pull_request_id` bigint DEFAULT NULL,
  `body` longtext COLLATE utf8mb4_bin,
  `author_username` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `author_user_id` bigint DEFAULT NULL,
  `gitee_created_at` datetime(3) DEFAULT NULL,
  `gitee_updated_at` datetime(3) DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`gitee_id`),
  KEY `idx__tool_gitee_pull_request_comments_pull_request_id` (`pull_request_id`),
  KEY `idx__tool_gitee_pull_request_comments_gitee_updated_at` (`gitee_updated_at`),
  KEY `idx__tool_gitee_pull_request_comments_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_gitee_pull_request_commits`
--

DROP TABLE IF EXISTS `_tool_gitee_pull_request_commits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_gitee_pull_request_commits` (
  `connection_id` bigint unsigned NOT NULL,
  `commit_sha` varchar(40) COLLATE utf8mb4_bin NOT NULL,
  `pull_request_id` bigint NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `commit_author_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `commit_author_email` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `commit_authored_date` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`connection_id`,`commit_sha`,`pull_request_id`),
  KEY `idx__tool_gitee_pull_request_commits_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_gitee_pull_request_issues`
--

DROP TABLE IF EXISTS `_tool_gitee_pull_request_issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_gitee_pull_request_issues` (
  `connection_id` bigint unsigned NOT NULL,
  `pull_request_id` bigint NOT NULL,
  `issue_id` bigint NOT NULL,
  `pull_request_number` bigint DEFAULT NULL,
  `issue_number` bigint DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`pull_request_id`,`issue_id`),
  KEY `idx__tool_gitee_pull_request_issues_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_gitee_pull_request_labels`
--

DROP TABLE IF EXISTS `_tool_gitee_pull_request_labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_gitee_pull_request_labels` (
  `connection_id` bigint unsigned NOT NULL,
  `pull_id` bigint NOT NULL,
  `label_name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`pull_id`,`label_name`),
  KEY `idx__tool_gitee_pull_request_labels_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_gitee_pull_requests`
--

DROP TABLE IF EXISTS `_tool_gitee_pull_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_gitee_pull_requests` (
  `connection_id` bigint unsigned NOT NULL,
  `gitee_id` bigint NOT NULL,
  `repo_id` bigint DEFAULT NULL,
  `number` bigint DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `gitee_created_at` datetime(3) DEFAULT NULL,
  `gitee_updated_at` datetime(3) DEFAULT NULL,
  `closed_at` datetime(3) DEFAULT NULL,
  `additions` bigint DEFAULT NULL,
  `deletions` bigint DEFAULT NULL,
  `comments` bigint DEFAULT NULL,
  `commits` bigint DEFAULT NULL,
  `review_comments` bigint DEFAULT NULL,
  `merged` tinyint(1) DEFAULT NULL,
  `merged_at` datetime(3) DEFAULT NULL,
  `body` longtext COLLATE utf8mb4_bin,
  `type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `component` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `merge_commit_sha` varchar(40) COLLATE utf8mb4_bin DEFAULT NULL,
  `head_ref` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `base_ref` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `base_commit_sha` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `head_commit_sha` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `author_name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `author_id` bigint DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`gitee_id`),
  KEY `idx__tool_gitee_pull_requests_repo_id` (`repo_id`),
  KEY `idx__tool_gitee_pull_requests_number` (`number`),
  KEY `idx__tool_gitee_pull_requests_gitee_updated_at` (`gitee_updated_at`),
  KEY `idx__tool_gitee_pull_requests_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_gitee_repo_commits`
--

DROP TABLE IF EXISTS `_tool_gitee_repo_commits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_gitee_repo_commits` (
  `connection_id` bigint unsigned NOT NULL,
  `repo_id` bigint NOT NULL,
  `commit_sha` varchar(40) COLLATE utf8mb4_bin NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`repo_id`,`commit_sha`),
  KEY `idx__tool_gitee_repo_commits_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_gitee_repos`
--

DROP TABLE IF EXISTS `_tool_gitee_repos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_gitee_repos` (
  `connection_id` bigint unsigned NOT NULL,
  `gitee_id` bigint NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `html_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_bin,
  `owner_id` bigint DEFAULT NULL,
  `owner_login` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `language` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `parent_gitee_id` bigint DEFAULT NULL,
  `parent_html_url` longtext COLLATE utf8mb4_bin,
  `created_date` datetime(3) DEFAULT NULL,
  `updated_date` datetime(3) DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `scope_config_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`connection_id`,`gitee_id`),
  KEY `idx__tool_gitee_repos_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_gitee_reviewers`
--

DROP TABLE IF EXISTS `_tool_gitee_reviewers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_gitee_reviewers` (
  `connection_id` bigint unsigned NOT NULL,
  `gitee_id` bigint NOT NULL,
  `login` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `pull_request_id` bigint NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`gitee_id`,`pull_request_id`),
  KEY `idx__tool_gitee_reviewers_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_github_account_orgs`
--

DROP TABLE IF EXISTS `_tool_github_account_orgs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_github_account_orgs` (
  `connection_id` bigint unsigned NOT NULL,
  `account_id` bigint NOT NULL,
  `org_id` bigint NOT NULL,
  `org_login` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`account_id`,`org_id`),
  KEY `idx__tool_github_account_orgs_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_github_accounts`
--

DROP TABLE IF EXISTS `_tool_github_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_github_accounts` (
  `connection_id` bigint unsigned NOT NULL,
  `id` bigint NOT NULL,
  `login` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `avatar_url` longtext COLLATE utf8mb4_bin,
  `url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `html_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `company` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`id`),
  KEY `idx__tool_github_accounts_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_github_commit_stats`
--

DROP TABLE IF EXISTS `_tool_github_commit_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_github_commit_stats` (
  `connection_id` bigint unsigned NOT NULL,
  `sha` varchar(40) COLLATE utf8mb4_bin NOT NULL,
  `additions` bigint DEFAULT NULL COMMENT 'Added lines of code',
  `deletions` bigint DEFAULT NULL COMMENT 'Deleted lines of code',
  `committed_date` datetime(3) DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`sha`),
  KEY `idx__tool_github_commit_stats_raw_data_params` (`_raw_data_params`),
  KEY `idx__tool_github_commit_stats_committed_date` (`committed_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_github_commits`
--

DROP TABLE IF EXISTS `_tool_github_commits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_github_commits` (
  `sha` varchar(40) COLLATE utf8mb4_bin NOT NULL,
  `author_id` bigint DEFAULT NULL,
  `author_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `author_email` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `authored_date` datetime(3) DEFAULT NULL,
  `committer_id` bigint DEFAULT NULL,
  `committer_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `committer_email` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `committed_date` datetime(3) DEFAULT NULL,
  `message` longtext COLLATE utf8mb4_bin,
  `url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `additions` bigint DEFAULT NULL COMMENT 'Added lines of code',
  `deletions` bigint DEFAULT NULL COMMENT 'Deleted lines of code',
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`sha`),
  KEY `idx__tool_github_commits_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_github_connections`
--

DROP TABLE IF EXISTS `_tool_github_connections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_github_connections` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `endpoint` longtext COLLATE utf8mb4_bin,
  `proxy` longtext COLLATE utf8mb4_bin,
  `rate_limit_per_hour` bigint DEFAULT NULL,
  `token` longtext COLLATE utf8mb4_bin,
  `enable_graphql` tinyint(1) DEFAULT NULL,
  `app_id` longtext COLLATE utf8mb4_bin,
  `secret_key` longtext COLLATE utf8mb4_bin,
  `auth_method` longtext COLLATE utf8mb4_bin,
  `installation_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx__tool_github_connections_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_github_deployments`
--

DROP TABLE IF EXISTS `_tool_github_deployments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_github_deployments` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `connection_id` bigint unsigned NOT NULL,
  `github_id` bigint DEFAULT NULL,
  `id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `database_id` bigint unsigned DEFAULT NULL,
  `commit_oid` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `environment` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `latest_status_state` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `latest_updated_date` datetime(3) DEFAULT NULL,
  `repository_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `repository_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `repository_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `ref_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `payload` text COLLATE utf8mb4_bin,
  `created_date` datetime(3) DEFAULT NULL,
  `updated_date` datetime(3) DEFAULT NULL,
  `display_title` longtext COLLATE utf8mb4_bin,
  `url` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`id`),
  KEY `idx__tool_github_deployments_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_github_issue_assignees`
--

DROP TABLE IF EXISTS `_tool_github_issue_assignees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_github_issue_assignees` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `connection_id` bigint unsigned NOT NULL,
  `issue_id` bigint NOT NULL,
  `repo_id` bigint NOT NULL,
  `assignee_id` bigint NOT NULL,
  `assignee_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`connection_id`,`issue_id`,`repo_id`,`assignee_id`),
  KEY `idx__tool_github_issue_assignees_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_github_issue_comments`
--

DROP TABLE IF EXISTS `_tool_github_issue_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_github_issue_comments` (
  `connection_id` bigint unsigned NOT NULL,
  `github_id` bigint NOT NULL,
  `issue_id` bigint DEFAULT NULL COMMENT 'References the Issue',
  `body` longtext COLLATE utf8mb4_bin,
  `author_username` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `author_user_id` bigint DEFAULT NULL,
  `github_created_at` datetime(3) DEFAULT NULL,
  `github_updated_at` datetime(3) DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`github_id`),
  KEY `idx__tool_github_issue_comments_issue_id` (`issue_id`),
  KEY `idx__tool_github_issue_comments_github_updated_at` (`github_updated_at`),
  KEY `idx__tool_github_issue_comments_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_github_issue_events`
--

DROP TABLE IF EXISTS `_tool_github_issue_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_github_issue_events` (
  `connection_id` bigint unsigned NOT NULL,
  `github_id` bigint NOT NULL,
  `issue_id` bigint DEFAULT NULL COMMENT 'References the Issue',
  `type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Events that can occur to an issue, ex. assigned, closed, labeled, etc.',
  `author_username` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `github_created_at` datetime(3) DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`github_id`),
  KEY `idx__tool_github_issue_events_issue_id` (`issue_id`),
  KEY `idx__tool_github_issue_events_github_created_at` (`github_created_at`),
  KEY `idx__tool_github_issue_events_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_github_issue_labels`
--

DROP TABLE IF EXISTS `_tool_github_issue_labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_github_issue_labels` (
  `connection_id` bigint unsigned NOT NULL,
  `issue_id` bigint NOT NULL,
  `label_name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`issue_id`,`label_name`),
  KEY `idx__tool_github_issue_labels_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_github_issues`
--

DROP TABLE IF EXISTS `_tool_github_issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_github_issues` (
  `connection_id` bigint unsigned NOT NULL,
  `github_id` bigint NOT NULL,
  `repo_id` bigint DEFAULT NULL,
  `number` bigint DEFAULT NULL COMMENT 'Used in API requests ex. api/repo/1/issue/<THIS_NUMBER>',
  `state` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `title` longtext COLLATE utf8mb4_bin,
  `body` longtext COLLATE utf8mb4_bin,
  `priority` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `type` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL,
  `author_id` bigint DEFAULT NULL,
  `author_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `assignee_id` bigint DEFAULT NULL,
  `assignee_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `milestone_id` bigint DEFAULT NULL,
  `lead_time_minutes` bigint unsigned DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `closed_at` datetime(3) DEFAULT NULL,
  `github_created_at` datetime(3) DEFAULT NULL,
  `github_updated_at` datetime(3) DEFAULT NULL,
  `severity` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `component` text COLLATE utf8mb4_bin,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `std_type` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`connection_id`,`github_id`),
  KEY `idx__tool_github_issues_github_updated_at` (`github_updated_at`),
  KEY `idx__tool_github_issues_raw_data_params` (`_raw_data_params`),
  KEY `idx__tool_github_issues_repo_id` (`repo_id`),
  KEY `idx__tool_github_issues_number` (`number`),
  KEY `idx__tool_github_issues_milestone_id` (`milestone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_github_jobs`
--

DROP TABLE IF EXISTS `_tool_github_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_github_jobs` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `connection_id` bigint unsigned NOT NULL,
  `repo_id` bigint NOT NULL,
  `id` bigint NOT NULL,
  `run_id` bigint DEFAULT NULL,
  `run_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `node_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `head_sha` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `html_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `conclusion` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `started_at` datetime(3) DEFAULT NULL,
  `completed_at` datetime(3) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `steps` json DEFAULT NULL,
  `check_run_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `labels` json DEFAULT NULL,
  `runner_id` bigint DEFAULT NULL,
  `runner_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `runner_group_id` bigint DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `environment` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`connection_id`,`repo_id`,`id`),
  KEY `idx__tool_github_jobs_raw_data_params` (`_raw_data_params`),
  KEY `idx_repo_id_connection_id` (`repo_id`,`connection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_github_milestones`
--

DROP TABLE IF EXISTS `_tool_github_milestones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_github_milestones` (
  `connection_id` bigint unsigned NOT NULL,
  `milestone_id` bigint NOT NULL,
  `repo_id` bigint DEFAULT NULL,
  `number` bigint DEFAULT NULL,
  `url` longtext COLLATE utf8mb4_bin,
  `title` longtext COLLATE utf8mb4_bin,
  `open_issues` bigint DEFAULT NULL,
  `closed_issues` bigint DEFAULT NULL,
  `state` longtext COLLATE utf8mb4_bin,
  `github_created_at` datetime(3) DEFAULT NULL,
  `github_updated_at` datetime(3) DEFAULT NULL,
  `closed_at` datetime(3) DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`milestone_id`),
  KEY `idx__tool_github_milestones_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_github_pull_request_comments`
--

DROP TABLE IF EXISTS `_tool_github_pull_request_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_github_pull_request_comments` (
  `connection_id` bigint unsigned NOT NULL,
  `github_id` bigint NOT NULL,
  `pull_request_id` bigint DEFAULT NULL,
  `body` longtext COLLATE utf8mb4_bin,
  `author_username` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `author_user_id` bigint DEFAULT NULL,
  `commit_sha` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `github_created_at` datetime(3) DEFAULT NULL,
  `github_updated_at` datetime(3) DEFAULT NULL,
  `review_id` bigint DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`github_id`),
  KEY `idx__tool_github_pull_request_comments_pull_request_id` (`pull_request_id`),
  KEY `idx__tool_github_pull_request_comments_github_updated_at` (`github_updated_at`),
  KEY `idx__tool_github_pull_request_comments_type` (`type`),
  KEY `idx__tool_github_pull_request_comments_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_github_pull_request_commits`
--

DROP TABLE IF EXISTS `_tool_github_pull_request_commits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_github_pull_request_commits` (
  `connection_id` bigint unsigned NOT NULL,
  `commit_sha` varchar(40) COLLATE utf8mb4_bin NOT NULL,
  `pull_request_id` bigint NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `commit_author_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `commit_author_email` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `commit_authored_date` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`connection_id`,`commit_sha`,`pull_request_id`),
  KEY `idx__tool_github_pull_request_commits_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_github_pull_request_issues`
--

DROP TABLE IF EXISTS `_tool_github_pull_request_issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_github_pull_request_issues` (
  `connection_id` bigint unsigned NOT NULL,
  `pull_request_id` bigint NOT NULL,
  `issue_id` bigint NOT NULL,
  `pull_request_number` bigint DEFAULT NULL,
  `issue_number` bigint DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`pull_request_id`,`issue_id`),
  KEY `idx__tool_github_pull_request_issues_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_github_pull_request_labels`
--

DROP TABLE IF EXISTS `_tool_github_pull_request_labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_github_pull_request_labels` (
  `connection_id` bigint unsigned NOT NULL,
  `pull_id` bigint NOT NULL,
  `label_name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`pull_id`,`label_name`),
  KEY `idx__tool_github_pull_request_labels_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_github_pull_request_reviews`
--

DROP TABLE IF EXISTS `_tool_github_pull_request_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_github_pull_request_reviews` (
  `connection_id` bigint unsigned NOT NULL,
  `github_id` bigint NOT NULL,
  `pull_request_id` bigint DEFAULT NULL,
  `body` longtext COLLATE utf8mb4_bin,
  `author_username` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `author_user_id` bigint DEFAULT NULL,
  `github_submit_at` datetime(3) DEFAULT NULL,
  `commit_sha` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`github_id`),
  KEY `idx__tool_github_pull_request_reviews_pull_request_id` (`pull_request_id`),
  KEY `idx__tool_github_pull_request_reviews_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_github_pull_requests`
--

DROP TABLE IF EXISTS `_tool_github_pull_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_github_pull_requests` (
  `connection_id` bigint unsigned NOT NULL,
  `github_id` bigint NOT NULL,
  `repo_id` bigint DEFAULT NULL,
  `number` bigint DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `title` longtext COLLATE utf8mb4_bin,
  `github_created_at` datetime(3) DEFAULT NULL,
  `github_updated_at` datetime(3) DEFAULT NULL,
  `closed_at` datetime(3) DEFAULT NULL,
  `additions` bigint DEFAULT NULL,
  `deletions` bigint DEFAULT NULL,
  `comments` bigint DEFAULT NULL,
  `commits` bigint DEFAULT NULL,
  `review_comments` bigint DEFAULT NULL,
  `merged` tinyint(1) DEFAULT NULL,
  `merged_at` datetime(3) DEFAULT NULL,
  `body` longtext COLLATE utf8mb4_bin,
  `type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `component` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `merge_commit_sha` varchar(40) COLLATE utf8mb4_bin DEFAULT NULL,
  `head_ref` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `base_ref` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `base_commit_sha` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `head_commit_sha` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `author_name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `author_id` bigint DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `head_repo_id` bigint DEFAULT NULL,
  `merged_by_name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `merged_by_id` bigint DEFAULT NULL,
  `is_draft` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`connection_id`,`github_id`),
  KEY `idx__tool_github_pull_requests_github_updated_at` (`github_updated_at`),
  KEY `idx__tool_github_pull_requests_raw_data_params` (`_raw_data_params`),
  KEY `idx__tool_github_pull_requests_repo_id` (`repo_id`),
  KEY `idx__tool_github_pull_requests_number` (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_github_releases`
--

DROP TABLE IF EXISTS `_tool_github_releases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_github_releases` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `connection_id` bigint unsigned NOT NULL,
  `github_id` bigint DEFAULT NULL,
  `id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `author_name` longtext COLLATE utf8mb4_bin,
  `author_id` longtext COLLATE utf8mb4_bin,
  `database_id` bigint DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_bin,
  `description_html` longtext COLLATE utf8mb4_bin,
  `is_draft` tinyint(1) DEFAULT NULL,
  `is_latest` tinyint(1) DEFAULT NULL,
  `is_prerelease` tinyint(1) DEFAULT NULL,
  `name` longtext COLLATE utf8mb4_bin,
  `published_at` datetime(3) DEFAULT NULL,
  `resource_path` longtext COLLATE utf8mb4_bin,
  `tag_name` longtext COLLATE utf8mb4_bin,
  `url` longtext COLLATE utf8mb4_bin,
  `commit_sha` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`id`),
  KEY `idx__tool_github_releases_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_github_repo_accounts`
--

DROP TABLE IF EXISTS `_tool_github_repo_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_github_repo_accounts` (
  `connection_id` bigint unsigned NOT NULL,
  `account_id` bigint NOT NULL,
  `repo_github_id` bigint NOT NULL,
  `login` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`account_id`,`repo_github_id`),
  KEY `idx__tool_github_repo_accounts_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_github_repo_commits`
--

DROP TABLE IF EXISTS `_tool_github_repo_commits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_github_repo_commits` (
  `connection_id` bigint unsigned NOT NULL,
  `repo_id` bigint NOT NULL,
  `commit_sha` varchar(40) COLLATE utf8mb4_bin NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`repo_id`,`commit_sha`),
  KEY `idx__tool_github_repo_commits_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_github_repos`
--

DROP TABLE IF EXISTS `_tool_github_repos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_github_repos` (
  `connection_id` bigint unsigned NOT NULL,
  `github_id` bigint NOT NULL,
  `html_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_bin,
  `owner_id` bigint DEFAULT NULL,
  `language` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `parent_github_id` bigint DEFAULT NULL,
  `parent_html_url` longtext COLLATE utf8mb4_bin,
  `created_date` datetime(3) DEFAULT NULL,
  `updated_date` datetime(3) DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `scope_config_id` bigint unsigned DEFAULT NULL,
  `clone_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`connection_id`,`github_id`),
  KEY `idx__tool_github_repos_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_github_reviewers`
--

DROP TABLE IF EXISTS `_tool_github_reviewers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_github_reviewers` (
  `connection_id` bigint unsigned NOT NULL,
  `reviewer_id` bigint NOT NULL,
  `pull_request_id` bigint NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `avatar_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `web_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`reviewer_id`,`pull_request_id`),
  KEY `idx__tool_github_reviewers_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_github_runs`
--

DROP TABLE IF EXISTS `_tool_github_runs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_github_runs` (
  `connection_id` bigint unsigned NOT NULL,
  `repo_id` bigint NOT NULL,
  `id` bigint NOT NULL,
  `node_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `head_branch` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `head_sha` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `path` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `run_number` bigint DEFAULT NULL,
  `event` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `conclusion` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `workflow_id` bigint DEFAULT NULL,
  `check_suite_id` bigint DEFAULT NULL,
  `check_suite_node_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `html_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `github_created_at` datetime(3) DEFAULT NULL,
  `github_updated_at` datetime(3) DEFAULT NULL,
  `run_attempt` bigint DEFAULT NULL,
  `run_started_at` datetime(3) DEFAULT NULL,
  `jobs_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `logs_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `check_suite_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `artifacts_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `cancel_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `rerun_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `workflow_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `environment` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `name` text COLLATE utf8mb4_bin,
  `display_title` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`repo_id`,`id`),
  KEY `idx__tool_github_runs_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_github_scope_configs`
--

DROP TABLE IF EXISTS `_tool_github_scope_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_github_scope_configs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `pr_type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `pr_component` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `pr_body_close_pattern` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `issue_severity` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `issue_priority` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `issue_component` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `issue_type_bug` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `issue_type_incident` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `issue_type_requirement` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `deployment_pattern` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `production_pattern` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `refdiff` json DEFAULT NULL,
  `connection_id` bigint unsigned DEFAULT NULL,
  `entities` json DEFAULT NULL,
  `env_name_pattern` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_name_github` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_gitlab_accounts`
--

DROP TABLE IF EXISTS `_tool_gitlab_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_gitlab_accounts` (
  `connection_id` bigint unsigned NOT NULL,
  `gitlab_id` bigint NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `membership_state` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `avatar_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `web_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `created_user_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`connection_id`,`gitlab_id`),
  KEY `idx__tool_gitlab_accounts_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_gitlab_assignees`
--

DROP TABLE IF EXISTS `_tool_gitlab_assignees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_gitlab_assignees` (
  `connection_id` bigint unsigned NOT NULL,
  `assignee_id` bigint NOT NULL,
  `merge_request_id` bigint NOT NULL,
  `project_id` bigint DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `avatar_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `web_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`assignee_id`,`merge_request_id`),
  KEY `idx__tool_gitlab_assignees_project_id` (`project_id`),
  KEY `idx__tool_gitlab_assignees_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_gitlab_commits`
--

DROP TABLE IF EXISTS `_tool_gitlab_commits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_gitlab_commits` (
  `sha` varchar(40) COLLATE utf8mb4_bin NOT NULL,
  `title` longtext COLLATE utf8mb4_bin,
  `message` longtext COLLATE utf8mb4_bin,
  `short_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `author_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `author_email` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `authored_date` datetime(3) DEFAULT NULL,
  `committer_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `committer_email` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `committed_date` datetime(3) DEFAULT NULL,
  `web_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `additions` bigint DEFAULT NULL COMMENT 'Added lines of code',
  `deletions` bigint DEFAULT NULL COMMENT 'Deleted lines of code',
  `total` bigint DEFAULT NULL COMMENT 'Sum of added/deleted lines of code',
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`sha`),
  KEY `idx__tool_gitlab_commits_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_gitlab_connections`
--

DROP TABLE IF EXISTS `_tool_gitlab_connections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_gitlab_connections` (
  `name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `endpoint` longtext COLLATE utf8mb4_bin,
  `proxy` longtext COLLATE utf8mb4_bin,
  `rate_limit_per_hour` bigint DEFAULT NULL,
  `token` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx__tool_gitlab_connections_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_gitlab_deployments`
--

DROP TABLE IF EXISTS `_tool_gitlab_deployments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_gitlab_deployments` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `connection_id` bigint unsigned NOT NULL,
  `gitlab_id` bigint NOT NULL,
  `created_date` datetime(3) DEFAULT NULL,
  `updated_date` datetime(3) DEFAULT NULL,
  `status` longtext COLLATE utf8mb4_bin,
  `deployment_id` bigint NOT NULL,
  `iid` bigint DEFAULT NULL,
  `ref` longtext COLLATE utf8mb4_bin,
  `sha` longtext COLLATE utf8mb4_bin,
  `environment` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `deployable_commit_author_email` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `deployable_commit_author_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `deployable_commit_created_at` datetime(3) DEFAULT NULL,
  `deployable_commit_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `deployable_commit_message` longtext COLLATE utf8mb4_bin,
  `deployable_commit_short_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `deployable_commit_title` longtext COLLATE utf8mb4_bin,
  `deployable_created_at` datetime(3) DEFAULT NULL,
  `deployable_finished_at` datetime(3) DEFAULT NULL,
  `deployable_id` bigint DEFAULT NULL,
  `deployable_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `deployable_ref` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `deployable_stage` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `deployable_started_at` datetime(3) DEFAULT NULL,
  `deployable_status` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `deployable_tag` tinyint(1) DEFAULT NULL,
  `deployable_duration` double DEFAULT NULL,
  `queued_duration` double DEFAULT NULL,
  `deployable_user_id` bigint DEFAULT NULL,
  `deployable_user_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `deployable_user_username` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `deployable_user_state` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `deployable_user_avatar_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `deployable_user_web_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `deployable_user_created_at` datetime(3) DEFAULT NULL,
  `deployable_user_public_email` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `deployable_user_skype` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `deployable_user_linkedin` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `deployable_user_twitter` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `deployable_user_website_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `deployable_user_organization` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `deployable_pipeline_created_at` datetime(3) DEFAULT NULL,
  `deployable_pipeline_id` bigint DEFAULT NULL,
  `deployable_pipeline_ref` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `deployable_pipeline_sha` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `deployable_pipeline_status` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `deployable_pipeline_updated_at` datetime(3) DEFAULT NULL,
  `deployable_pipeline_web_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `user_avatar_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `user_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `user_state` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `user_username` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `user_web_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`connection_id`,`gitlab_id`,`deployment_id`),
  KEY `idx__tool_gitlab_deployments_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_gitlab_issue_assignees`
--

DROP TABLE IF EXISTS `_tool_gitlab_issue_assignees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_gitlab_issue_assignees` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `connection_id` bigint unsigned NOT NULL,
  `gitlab_id` bigint NOT NULL,
  `project_id` bigint NOT NULL,
  `assignee_id` bigint NOT NULL,
  `assignee_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`connection_id`,`gitlab_id`,`project_id`,`assignee_id`),
  KEY `idx__tool_gitlab_issue_assignees_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_gitlab_issue_labels`
--

DROP TABLE IF EXISTS `_tool_gitlab_issue_labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_gitlab_issue_labels` (
  `connection_id` bigint unsigned NOT NULL,
  `issue_id` bigint NOT NULL,
  `label_name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`issue_id`,`label_name`),
  KEY `idx__tool_gitlab_issue_labels_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_gitlab_issues`
--

DROP TABLE IF EXISTS `_tool_gitlab_issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_gitlab_issues` (
  `connection_id` bigint unsigned NOT NULL,
  `gitlab_id` bigint NOT NULL,
  `project_id` bigint DEFAULT NULL,
  `number` bigint DEFAULT NULL COMMENT 'Used in API requests ex. api/repo/1/issue/<THIS_NUMBER>',
  `state` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `title` longtext COLLATE utf8mb4_bin,
  `body` longtext COLLATE utf8mb4_bin,
  `priority` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `type` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `creator_id` bigint DEFAULT NULL,
  `creator_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `assignee_id` bigint DEFAULT NULL,
  `assignee_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `lead_time_minutes` bigint unsigned DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `closed_at` datetime(3) DEFAULT NULL,
  `gitlab_created_at` datetime(3) DEFAULT NULL,
  `gitlab_updated_at` datetime(3) DEFAULT NULL,
  `severity` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `component` text COLLATE utf8mb4_bin,
  `time_estimate` bigint DEFAULT NULL,
  `total_time_spent` bigint DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `std_type` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`connection_id`,`gitlab_id`),
  KEY `idx__tool_gitlab_issues_project_id` (`project_id`),
  KEY `idx__tool_gitlab_issues_number` (`number`),
  KEY `idx__tool_gitlab_issues_gitlab_updated_at` (`gitlab_updated_at`),
  KEY `idx__tool_gitlab_issues_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_gitlab_jobs`
--

DROP TABLE IF EXISTS `_tool_gitlab_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_gitlab_jobs` (
  `connection_id` bigint unsigned NOT NULL,
  `gitlab_id` bigint NOT NULL,
  `project_id` bigint DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `stage` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `ref` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `tag` tinyint(1) DEFAULT NULL,
  `allow_failure` tinyint(1) DEFAULT NULL,
  `web_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `gitlab_created_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) DEFAULT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `pipeline_id` bigint DEFAULT NULL,
  `duration` double DEFAULT NULL,
  `queued_duration` double DEFAULT NULL,
  PRIMARY KEY (`connection_id`,`gitlab_id`),
  KEY `idx__tool_gitlab_jobs_project_id` (`project_id`),
  KEY `idx__tool_gitlab_jobs_raw_data_params` (`_raw_data_params`),
  KEY `idx__tool_gitlab_jobs_pipeline_id` (`pipeline_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_gitlab_merge_requests`
--

DROP TABLE IF EXISTS `_tool_gitlab_merge_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_gitlab_merge_requests` (
  `connection_id` bigint unsigned NOT NULL,
  `gitlab_id` bigint NOT NULL,
  `iid` bigint DEFAULT NULL,
  `project_id` bigint DEFAULT NULL,
  `source_project_id` bigint DEFAULT NULL,
  `target_project_id` bigint DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `title` longtext COLLATE utf8mb4_bin,
  `web_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `user_notes_count` bigint DEFAULT NULL,
  `work_in_progress` tinyint(1) DEFAULT NULL,
  `source_branch` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `target_branch` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `merge_commit_sha` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `merged_at` datetime(3) DEFAULT NULL,
  `gitlab_created_at` datetime(3) DEFAULT NULL,
  `closed_at` datetime(3) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `merged_by_username` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_bin,
  `author_username` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `author_user_id` bigint DEFAULT NULL,
  `component` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `first_comment_time` datetime(3) DEFAULT NULL COMMENT 'Time when the first comment occurred',
  `review_rounds` bigint DEFAULT NULL COMMENT 'How many rounds of review this MR went through',
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `is_detail_required` tinyint(1) DEFAULT NULL,
  `gitlab_updated_at` datetime(3) DEFAULT NULL,
  `diff_head_sha` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `squash_commit_sha` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`connection_id`,`gitlab_id`),
  KEY `idx__tool_gitlab_merge_requests_iid` (`iid`),
  KEY `idx__tool_gitlab_merge_requests_project_id` (`project_id`),
  KEY `idx__tool_gitlab_merge_requests_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_gitlab_mr_comments`
--

DROP TABLE IF EXISTS `_tool_gitlab_mr_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_gitlab_mr_comments` (
  `connection_id` bigint unsigned NOT NULL,
  `gitlab_id` bigint NOT NULL,
  `merge_request_id` bigint DEFAULT NULL,
  `merge_request_iid` bigint DEFAULT NULL COMMENT 'Used in API requests ex. /api/merge_requests/<THIS_IID>',
  `body` longtext COLLATE utf8mb4_bin,
  `author_username` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `author_user_id` bigint DEFAULT NULL,
  `gitlab_created_at` datetime(3) DEFAULT NULL,
  `resolvable` tinyint(1) DEFAULT NULL COMMENT 'Is or is not review comment',
  `type` longtext COLLATE utf8mb4_bin COMMENT 'if type=null, it is normal comment,if type=diffNote,it is diff comment',
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`gitlab_id`),
  KEY `idx__tool_gitlab_mr_comments_merge_request_id` (`merge_request_id`),
  KEY `idx__tool_gitlab_mr_comments_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_gitlab_mr_commits`
--

DROP TABLE IF EXISTS `_tool_gitlab_mr_commits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_gitlab_mr_commits` (
  `connection_id` bigint unsigned NOT NULL,
  `commit_sha` varchar(40) COLLATE utf8mb4_bin NOT NULL,
  `merge_request_id` bigint NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `commit_author_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `commit_author_email` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `commit_authored_date` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`connection_id`,`commit_sha`,`merge_request_id`),
  KEY `idx__tool_gitlab_mr_commits_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_gitlab_mr_labels`
--

DROP TABLE IF EXISTS `_tool_gitlab_mr_labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_gitlab_mr_labels` (
  `connection_id` bigint unsigned NOT NULL,
  `mr_id` bigint NOT NULL,
  `label_name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`mr_id`,`label_name`),
  KEY `idx__tool_gitlab_mr_labels_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_gitlab_mr_notes`
--

DROP TABLE IF EXISTS `_tool_gitlab_mr_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_gitlab_mr_notes` (
  `connection_id` bigint unsigned NOT NULL,
  `gitlab_id` bigint NOT NULL,
  `merge_request_id` bigint DEFAULT NULL,
  `merge_request_iid` bigint DEFAULT NULL COMMENT 'Used in API requests ex. /api/merge_requests/<THIS_IID>',
  `noteable_type` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `author_user_id` bigint DEFAULT NULL,
  `author_username` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `body` longtext COLLATE utf8mb4_bin,
  `gitlab_created_at` datetime(3) DEFAULT NULL,
  `confidential` tinyint(1) DEFAULT NULL,
  `resolvable` tinyint(1) DEFAULT NULL COMMENT 'Is or is not review comment',
  `is_system` tinyint(1) DEFAULT NULL COMMENT 'Is or is not auto-generated vs. human generated',
  `type` longtext COLLATE utf8mb4_bin COMMENT 'if type=null, it is normal comment,if type=diffNote,it is diff comment',
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`gitlab_id`),
  KEY `idx__tool_gitlab_mr_notes_merge_request_id` (`merge_request_id`),
  KEY `idx__tool_gitlab_mr_notes_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_gitlab_pipeline_projects`
--

DROP TABLE IF EXISTS `_tool_gitlab_pipeline_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_gitlab_pipeline_projects` (
  `connection_id` bigint unsigned NOT NULL,
  `pipeline_id` bigint NOT NULL,
  `project_id` bigint NOT NULL,
  `ref` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `sha` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `gitlab_created_at` datetime(3) DEFAULT NULL,
  `gitlab_updated_at` datetime(3) DEFAULT NULL,
  `web_url` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`pipeline_id`,`project_id`),
  KEY `idx__tool_gitlab_pipeline_projects_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_gitlab_pipelines`
--

DROP TABLE IF EXISTS `_tool_gitlab_pipelines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_gitlab_pipelines` (
  `connection_id` bigint unsigned NOT NULL,
  `gitlab_id` bigint NOT NULL,
  `project_id` bigint DEFAULT NULL,
  `gitlab_created_at` datetime(3) DEFAULT NULL,
  `status` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `ref` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `sha` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `web_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `duration` bigint DEFAULT NULL,
  `started_at` datetime(3) DEFAULT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `coverage` longtext COLLATE utf8mb4_bin,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `gitlab_updated_at` datetime(3) DEFAULT NULL,
  `is_detail_required` tinyint(1) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `environment` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `queued_duration` double DEFAULT NULL,
  PRIMARY KEY (`connection_id`,`gitlab_id`),
  KEY `idx__tool_gitlab_pipelines_project_id` (`project_id`),
  KEY `idx__tool_gitlab_pipelines_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_gitlab_project_commits`
--

DROP TABLE IF EXISTS `_tool_gitlab_project_commits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_gitlab_project_commits` (
  `connection_id` bigint unsigned NOT NULL,
  `gitlab_project_id` bigint NOT NULL,
  `commit_sha` varchar(40) COLLATE utf8mb4_bin NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`gitlab_project_id`,`commit_sha`),
  KEY `idx__tool_gitlab_project_commits_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_gitlab_projects`
--

DROP TABLE IF EXISTS `_tool_gitlab_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_gitlab_projects` (
  `connection_id` bigint unsigned NOT NULL,
  `gitlab_id` bigint NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_bin,
  `default_branch` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `path_with_namespace` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `web_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `creator_id` bigint DEFAULT NULL,
  `visibility` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `open_issues_count` bigint DEFAULT NULL,
  `star_count` bigint DEFAULT NULL,
  `forked_from_project_id` bigint DEFAULT NULL,
  `forked_from_project_web_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_date` datetime(3) DEFAULT NULL,
  `updated_date` datetime(3) DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `scope_config_id` bigint unsigned DEFAULT NULL,
  `http_url_to_repo` longtext COLLATE utf8mb4_bin,
  `archived` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`connection_id`,`gitlab_id`),
  KEY `idx__tool_gitlab_projects_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_gitlab_reviewers`
--

DROP TABLE IF EXISTS `_tool_gitlab_reviewers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_gitlab_reviewers` (
  `connection_id` bigint unsigned NOT NULL,
  `reviewer_id` bigint NOT NULL,
  `merge_request_id` bigint NOT NULL,
  `project_id` bigint DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `avatar_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `web_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`reviewer_id`,`merge_request_id`),
  KEY `idx__tool_gitlab_reviewers_project_id` (`project_id`),
  KEY `idx__tool_gitlab_reviewers_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_gitlab_scope_configs`
--

DROP TABLE IF EXISTS `_tool_gitlab_scope_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_gitlab_scope_configs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `pr_type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `pr_component` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `pr_body_close_pattern` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `issue_severity` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `issue_priority` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `issue_component` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `issue_type_bug` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `issue_type_incident` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `issue_type_requirement` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `deployment_pattern` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `production_pattern` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `refdiff` json DEFAULT NULL,
  `connection_id` bigint unsigned DEFAULT NULL,
  `entities` json DEFAULT NULL,
  `env_name_pattern` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_name_gitlab` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_gitlab_tags`
--

DROP TABLE IF EXISTS `_tool_gitlab_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_gitlab_tags` (
  `connection_id` bigint unsigned NOT NULL,
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `message` longtext COLLATE utf8mb4_bin,
  `target` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `protected` tinyint(1) DEFAULT NULL,
  `release_description` longtext COLLATE utf8mb4_bin,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`name`),
  KEY `idx__tool_gitlab_tags_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_icla_committer`
--

DROP TABLE IF EXISTS `_tool_icla_committer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_icla_committer` (
  `user_name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`user_name`,`name`),
  KEY `idx__tool_icla_committer_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_jenkins_build_commits`
--

DROP TABLE IF EXISTS `_tool_jenkins_build_commits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_jenkins_build_commits` (
  `connection_id` bigint unsigned NOT NULL,
  `build_name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `commit_sha` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `branch` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `repo_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `number` bigint DEFAULT NULL,
  PRIMARY KEY (`connection_id`,`build_name`,`commit_sha`),
  KEY `idx__tool_jenkins_build_repos_raw_data_params` (`_raw_data_params`),
  KEY `idx__tool_jenkins_build_commits_number` (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_jenkins_builds`
--

DROP TABLE IF EXISTS `_tool_jenkins_builds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_jenkins_builds` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `connection_id` bigint unsigned NOT NULL,
  `job_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `job_path` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `duration` double DEFAULT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `estimated_duration` double DEFAULT NULL,
  `number` bigint DEFAULT NULL,
  `result` longtext COLLATE utf8mb4_bin,
  `timestamp` bigint DEFAULT NULL,
  `start_time` datetime(3) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `class` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `triggered_by` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `building` tinyint(1) DEFAULT NULL,
  `has_stages` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`connection_id`,`full_name`),
  KEY `idx__tool_jenkins_builds_class` (`class`),
  KEY `idx__tool_jenkins_builds_raw_data_params` (`_raw_data_params`),
  KEY `idx__tool_jenkins_builds_job_name` (`job_name`),
  KEY `idx__tool_jenkins_builds_job_path` (`job_path`),
  KEY `idx__tool_jenkins_builds_number` (`number`),
  KEY `idx__tool_jenkins_builds_type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_jenkins_connections`
--

DROP TABLE IF EXISTS `_tool_jenkins_connections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_jenkins_connections` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `endpoint` longtext COLLATE utf8mb4_bin,
  `proxy` longtext COLLATE utf8mb4_bin,
  `rate_limit_per_hour` bigint DEFAULT NULL,
  `username` longtext COLLATE utf8mb4_bin,
  `password` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx__tool_jenkins_connections_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_jenkins_job_dags`
--

DROP TABLE IF EXISTS `_tool_jenkins_job_dags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_jenkins_job_dags` (
  `connetion_id` bigint unsigned NOT NULL,
  `upstream_job` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `downstream_job` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connetion_id`,`upstream_job`,`downstream_job`),
  KEY `idx__tool_jenkins_job_dags_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_jenkins_jobs`
--

DROP TABLE IF EXISTS `_tool_jenkins_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_jenkins_jobs` (
  `connection_id` bigint unsigned NOT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `path` varchar(511) COLLATE utf8mb4_bin DEFAULT NULL,
  `class` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `base` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `url` longtext COLLATE utf8mb4_bin,
  `description` longtext COLLATE utf8mb4_bin,
  `primary_view` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `scope_config_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`connection_id`,`full_name`),
  KEY `idx__tool_jenkins_jobs_path` (`path`),
  KEY `idx__tool_jenkins_jobs_raw_data_params` (`_raw_data_params`),
  KEY `idx__tool_jenkins_jobs_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_jenkins_scope_configs`
--

DROP TABLE IF EXISTS `_tool_jenkins_scope_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_jenkins_scope_configs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `deployment_pattern` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `production_pattern` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `connection_id` bigint unsigned DEFAULT NULL,
  `entities` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_name_jenkins` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_jenkins_stages`
--

DROP TABLE IF EXISTS `_tool_jenkins_stages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_jenkins_stages` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `connection_id` bigint unsigned NOT NULL,
  `id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `exec_node` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `start_time_millis` bigint DEFAULT NULL,
  `duration_millis` bigint DEFAULT NULL,
  `pause_duration_millis` bigint DEFAULT NULL,
  `build_name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`connection_id`,`id`,`build_name`),
  KEY `idx__tool_jenkins_stages_raw_data_params` (`_raw_data_params`),
  KEY `idx__tool_jenkins_stages_type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_jira_accounts`
--

DROP TABLE IF EXISTS `_tool_jira_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_jira_accounts` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `connection_id` bigint unsigned NOT NULL,
  `account_id` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `account_type` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `avatar_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `timezone` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`connection_id`,`account_id`),
  KEY `idx__tool_jira_accounts_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_jira_board_issues`
--

DROP TABLE IF EXISTS `_tool_jira_board_issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_jira_board_issues` (
  `connection_id` bigint unsigned NOT NULL,
  `board_id` bigint unsigned NOT NULL,
  `issue_id` bigint unsigned NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`board_id`,`issue_id`),
  KEY `idx__tool_jira_board_issues_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_jira_board_sprints`
--

DROP TABLE IF EXISTS `_tool_jira_board_sprints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_jira_board_sprints` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `connection_id` bigint unsigned NOT NULL,
  `board_id` bigint unsigned NOT NULL,
  `sprint_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`connection_id`,`board_id`,`sprint_id`),
  KEY `idx__tool_jira_board_sprints_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_jira_boards`
--

DROP TABLE IF EXISTS `_tool_jira_boards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_jira_boards` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `connection_id` bigint unsigned NOT NULL,
  `board_id` bigint unsigned NOT NULL,
  `project_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `self` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `type` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `scope_config_id` bigint unsigned DEFAULT NULL,
  `jql` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`board_id`),
  KEY `idx__tool_jira_boards_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_jira_connections`
--

DROP TABLE IF EXISTS `_tool_jira_connections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_jira_connections` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `endpoint` longtext COLLATE utf8mb4_bin,
  `epic_key_field` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `story_point_field` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `remotelink_commit_sha_pattern` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `proxy` longtext COLLATE utf8mb4_bin,
  `rate_limit_per_hour` bigint DEFAULT NULL,
  `username` longtext COLLATE utf8mb4_bin,
  `password` longtext COLLATE utf8mb4_bin,
  `auth_method` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `token` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx__tool_jira_sources_name` (`name`),
  UNIQUE KEY `idx__tool_jira_connections_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_jira_issue_changelog_items`
--

DROP TABLE IF EXISTS `_tool_jira_issue_changelog_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_jira_issue_changelog_items` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `connection_id` bigint unsigned NOT NULL,
  `changelog_id` bigint unsigned NOT NULL,
  `field` varchar(191) COLLATE utf8mb4_bin NOT NULL,
  `field_type` longtext COLLATE utf8mb4_bin,
  `field_id` longtext COLLATE utf8mb4_bin,
  `from_value` longtext COLLATE utf8mb4_bin,
  `from_string` longtext COLLATE utf8mb4_bin,
  `to_value` longtext COLLATE utf8mb4_bin,
  `to_string` longtext COLLATE utf8mb4_bin,
  `tmp_from_account_id` longtext COLLATE utf8mb4_bin,
  `tmp_to_account_id` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`changelog_id`,`field`),
  KEY `idx__tool_jira_issue_changelog_items_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_jira_issue_changelogs`
--

DROP TABLE IF EXISTS `_tool_jira_issue_changelogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_jira_issue_changelogs` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `connection_id` bigint unsigned NOT NULL,
  `changelog_id` bigint unsigned NOT NULL,
  `issue_id` bigint unsigned DEFAULT NULL,
  `author_account_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `author_display_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `author_active` tinyint(1) DEFAULT NULL,
  `created` datetime(3) DEFAULT NULL,
  `issue_updated` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`connection_id`,`changelog_id`),
  KEY `idx__tool_jira_issue_changelogs_raw_data_params` (`_raw_data_params`),
  KEY `idx__tool_jira_issue_changelogs_issue_id` (`issue_id`),
  KEY `idx__tool_jira_issue_changelogs_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_jira_issue_comments`
--

DROP TABLE IF EXISTS `_tool_jira_issue_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_jira_issue_comments` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `connection_id` bigint unsigned NOT NULL,
  `issue_id` bigint unsigned NOT NULL,
  `coment_id` varchar(191) COLLATE utf8mb4_bin NOT NULL,
  `self` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `body` longtext COLLATE utf8mb4_bin,
  `creator_account_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `creator_display_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created` datetime(3) DEFAULT NULL,
  `updated` datetime(3) DEFAULT NULL,
  `issue_updated` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`connection_id`,`issue_id`,`coment_id`),
  KEY `idx__tool_jira_issue_comments_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_jira_issue_commits`
--

DROP TABLE IF EXISTS `_tool_jira_issue_commits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_jira_issue_commits` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `connection_id` bigint unsigned NOT NULL,
  `issue_id` bigint unsigned NOT NULL,
  `commit_sha` varchar(40) COLLATE utf8mb4_bin NOT NULL,
  `commit_url` longtext COLLATE utf8mb4_bin,
  `repo_url` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`issue_id`,`commit_sha`),
  KEY `idx__tool_jira_issue_commits_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_jira_issue_fields`
--

DROP TABLE IF EXISTS `_tool_jira_issue_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_jira_issue_fields` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `connection_id` bigint unsigned NOT NULL,
  `board_id` bigint unsigned NOT NULL,
  `id` varchar(191) COLLATE utf8mb4_bin NOT NULL,
  `name` longtext COLLATE utf8mb4_bin,
  `custom` tinyint(1) DEFAULT NULL,
  `orderable` tinyint(1) DEFAULT NULL,
  `navigable` tinyint(1) DEFAULT NULL,
  `searchable` tinyint(1) DEFAULT NULL,
  `schema_type` longtext COLLATE utf8mb4_bin,
  `schema_items` longtext COLLATE utf8mb4_bin,
  `schema_custom` longtext COLLATE utf8mb4_bin,
  `schema_custom_id` bigint DEFAULT NULL,
  `sche_custom_system` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`board_id`,`id`),
  KEY `idx__tool_jira_issue_fields_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_jira_issue_labels`
--

DROP TABLE IF EXISTS `_tool_jira_issue_labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_jira_issue_labels` (
  `connection_id` bigint unsigned NOT NULL,
  `issue_id` bigint unsigned NOT NULL,
  `label_name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`issue_id`,`label_name`),
  KEY `idx__tool_jira_issue_labels_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_jira_issue_relationships`
--

DROP TABLE IF EXISTS `_tool_jira_issue_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_jira_issue_relationships` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `connection_id` bigint unsigned NOT NULL,
  `issue_id` bigint unsigned NOT NULL,
  `issue_key` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `type_id` bigint unsigned DEFAULT NULL,
  `type_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `inward` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `outward` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `inward_issue_id` bigint unsigned NOT NULL,
  `inward_issue_key` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `outward_issue_id` bigint unsigned NOT NULL,
  `outward_issue_key` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`connection_id`,`issue_id`,`inward_issue_id`,`outward_issue_id`),
  KEY `idx__tool_jira_issue_relationships_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_jira_issue_types`
--

DROP TABLE IF EXISTS `_tool_jira_issue_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_jira_issue_types` (
  `connection_id` bigint unsigned NOT NULL,
  `self` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `description` longtext COLLATE utf8mb4_bin,
  `icon_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `untranslated_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `subtask` tinyint(1) DEFAULT NULL,
  `avatar_id` bigint unsigned DEFAULT NULL,
  `hierarchy_level` bigint DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`id`),
  KEY `idx__tool_jira_issue_types_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_jira_issues`
--

DROP TABLE IF EXISTS `_tool_jira_issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_jira_issues` (
  `connection_id` bigint unsigned NOT NULL,
  `issue_id` bigint unsigned NOT NULL,
  `project_id` bigint unsigned DEFAULT NULL,
  `self` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `icon_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `issue_key` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `summary` longtext COLLATE utf8mb4_bin,
  `type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `epic_key` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `status_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `status_key` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `story_point` double DEFAULT NULL,
  `original_estimate_minutes` bigint DEFAULT NULL,
  `aggregate_estimate_minutes` bigint DEFAULT NULL,
  `remaining_estimate_minutes` bigint DEFAULT NULL,
  `creator_account_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `creator_account_type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `creator_display_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `assignee_account_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'latest assignee',
  `assignee_account_type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `assignee_display_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `priority_id` bigint unsigned DEFAULT NULL,
  `priority_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `parent_id` bigint unsigned DEFAULT NULL,
  `parent_key` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `sprint_id` bigint unsigned DEFAULT NULL,
  `sprint_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `resolution_date` datetime(3) DEFAULT NULL,
  `created` datetime(3) DEFAULT NULL,
  `updated` datetime(3) DEFAULT NULL,
  `spent_minutes` bigint DEFAULT NULL,
  `lead_time_minutes` bigint unsigned DEFAULT NULL,
  `std_type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `std_status` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `project_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_bin,
  `comment_total` bigint DEFAULT NULL,
  `changelog_total` bigint DEFAULT NULL,
  `components` text COLLATE utf8mb4_bin,
  `worklog_total` bigint DEFAULT NULL,
  `subtask` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`connection_id`,`issue_id`),
  KEY `idx__tool_jira_issues_updated` (`updated`),
  KEY `idx__tool_jira_issues_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_jira_projects`
--

DROP TABLE IF EXISTS `_tool_jira_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_jira_projects` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `connection_id` bigint unsigned NOT NULL,
  `id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `project_key` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`connection_id`,`id`),
  KEY `idx__tool_jira_projects_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_jira_remotelinks`
--

DROP TABLE IF EXISTS `_tool_jira_remotelinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_jira_remotelinks` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `connection_id` bigint unsigned NOT NULL,
  `remotelink_id` bigint unsigned NOT NULL,
  `issue_id` bigint unsigned DEFAULT NULL,
  `raw_json` json DEFAULT NULL,
  `title` longtext COLLATE utf8mb4_bin,
  `issue_updated` datetime(3) DEFAULT NULL,
  `url` longtext COLLATE utf8mb4_bin,
  `self` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`remotelink_id`),
  KEY `idx__tool_jira_remotelinks_issue_id` (`issue_id`),
  KEY `idx__tool_jira_remotelinks_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_jira_scope_configs`
--

DROP TABLE IF EXISTS `_tool_jira_scope_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_jira_scope_configs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `epic_key_field` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `story_point_field` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `remotelink_commit_sha_pattern` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `type_mappings` longblob,
  `remotelink_repo_pattern` longblob,
  `connection_id` bigint unsigned DEFAULT NULL,
  `entities` json DEFAULT NULL,
  `application_type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_name_jira` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_jira_sprint_issues`
--

DROP TABLE IF EXISTS `_tool_jira_sprint_issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_jira_sprint_issues` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `connection_id` bigint unsigned NOT NULL,
  `sprint_id` bigint unsigned NOT NULL,
  `issue_id` bigint unsigned NOT NULL,
  `resolution_date` datetime(3) DEFAULT NULL,
  `issue_created_date` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`connection_id`,`sprint_id`,`issue_id`),
  KEY `idx__tool_jira_sprint_issues_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_jira_sprints`
--

DROP TABLE IF EXISTS `_tool_jira_sprints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_jira_sprints` (
  `connection_id` bigint unsigned NOT NULL,
  `sprint_id` bigint unsigned NOT NULL,
  `self` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `start_date` datetime(3) DEFAULT NULL,
  `end_date` datetime(3) DEFAULT NULL,
  `complete_date` datetime(3) DEFAULT NULL,
  `origin_board_id` bigint unsigned DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`sprint_id`),
  KEY `idx__tool_jira_sprints_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_jira_statuses`
--

DROP TABLE IF EXISTS `_tool_jira_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_jira_statuses` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `connection_id` bigint unsigned NOT NULL,
  `id` varchar(191) COLLATE utf8mb4_bin NOT NULL,
  `name` longtext COLLATE utf8mb4_bin,
  `self` longtext COLLATE utf8mb4_bin,
  `status_category` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`id`),
  KEY `idx__tool_jira_statuses_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_jira_worklogs`
--

DROP TABLE IF EXISTS `_tool_jira_worklogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_jira_worklogs` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `connection_id` bigint unsigned NOT NULL,
  `issue_id` bigint unsigned NOT NULL,
  `worklog_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `author_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `update_author_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `time_spent` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `time_spent_seconds` bigint DEFAULT NULL,
  `updated` datetime(3) DEFAULT NULL,
  `started` datetime(3) DEFAULT NULL,
  `issue_updated` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`connection_id`,`issue_id`,`worklog_id`),
  KEY `idx__tool_jira_worklogs_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_opsgenie_assignments`
--

DROP TABLE IF EXISTS `_tool_opsgenie_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_opsgenie_assignments` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `connection_id` bigint unsigned DEFAULT NULL,
  `responder_id` varchar(191) COLLATE utf8mb4_bin NOT NULL,
  `incident_id` varchar(191) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`responder_id`,`incident_id`),
  KEY `idx__tool_opsgenie_assignments_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_opsgenie_connections`
--

DROP TABLE IF EXISTS `_tool_opsgenie_connections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_opsgenie_connections` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `token` longtext COLLATE utf8mb4_bin,
  `endpoint` longtext COLLATE utf8mb4_bin,
  `proxy` longtext COLLATE utf8mb4_bin,
  `rate_limit_per_hour` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx__tool_opsgenie_connections_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_opsgenie_incidents`
--

DROP TABLE IF EXISTS `_tool_opsgenie_incidents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_opsgenie_incidents` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `connection_id` bigint unsigned NOT NULL,
  `id` varchar(191) COLLATE utf8mb4_bin NOT NULL,
  `url` longtext COLLATE utf8mb4_bin,
  `service_id` longtext COLLATE utf8mb4_bin,
  `service_name` longtext COLLATE utf8mb4_bin,
  `description` longtext COLLATE utf8mb4_bin,
  `message` longtext COLLATE utf8mb4_bin,
  `owner_team` longtext COLLATE utf8mb4_bin,
  `priority` longtext COLLATE utf8mb4_bin,
  `status` longtext COLLATE utf8mb4_bin,
  `created_date` datetime(3) DEFAULT NULL,
  `updated_date` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`connection_id`,`id`),
  KEY `idx__tool_opsgenie_incidents_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_opsgenie_responders`
--

DROP TABLE IF EXISTS `_tool_opsgenie_responders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_opsgenie_responders` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `connection_id` bigint unsigned NOT NULL,
  `id` varchar(191) COLLATE utf8mb4_bin NOT NULL,
  `type` longtext COLLATE utf8mb4_bin,
  `full_name` longtext COLLATE utf8mb4_bin,
  `name` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`id`),
  KEY `idx__tool_opsgenie_responders_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_opsgenie_scope_configs`
--

DROP TABLE IF EXISTS `_tool_opsgenie_scope_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_opsgenie_scope_configs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `entities` json DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `connection_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_name_opsgenie` (`name`),
  KEY `idx__tool_opsgenie_scope_configs_connection_id` (`connection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_opsgenie_services`
--

DROP TABLE IF EXISTS `_tool_opsgenie_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_opsgenie_services` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `connection_id` bigint unsigned NOT NULL,
  `id` varchar(191) COLLATE utf8mb4_bin NOT NULL,
  `url` longtext COLLATE utf8mb4_bin,
  `name` longtext COLLATE utf8mb4_bin,
  `team_id` longtext COLLATE utf8mb4_bin,
  `scope_config_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`connection_id`,`id`),
  KEY `idx__tool_opsgenie_services_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_opsgenie_teams`
--

DROP TABLE IF EXISTS `_tool_opsgenie_teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_opsgenie_teams` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `connection_id` bigint unsigned NOT NULL,
  `id` varchar(191) COLLATE utf8mb4_bin NOT NULL,
  `name` longtext COLLATE utf8mb4_bin,
  `description` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`id`),
  KEY `idx__tool_opsgenie_teams_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_opsgenie_users`
--

DROP TABLE IF EXISTS `_tool_opsgenie_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_opsgenie_users` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `connection_id` bigint unsigned NOT NULL,
  `id` varchar(191) COLLATE utf8mb4_bin NOT NULL,
  `username` longtext COLLATE utf8mb4_bin,
  `full_name` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`id`),
  KEY `idx__tool_opsgenie_users_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_pagerduty_assignments`
--

DROP TABLE IF EXISTS `_tool_pagerduty_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_pagerduty_assignments` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `connection_id` bigint unsigned DEFAULT NULL,
  `incident_number` bigint NOT NULL,
  `user_id` varchar(191) COLLATE utf8mb4_bin NOT NULL,
  `assigned_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`incident_number`,`user_id`),
  KEY `idx__tool_pagerduty_assignments_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_pagerduty_connections`
--

DROP TABLE IF EXISTS `_tool_pagerduty_connections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_pagerduty_connections` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `token` longtext COLLATE utf8mb4_bin,
  `endpoint` longtext COLLATE utf8mb4_bin,
  `proxy` longtext COLLATE utf8mb4_bin,
  `rate_limit_per_hour` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx__tool_pagerduty_connections_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_pagerduty_incidents`
--

DROP TABLE IF EXISTS `_tool_pagerduty_incidents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_pagerduty_incidents` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `connection_id` bigint unsigned NOT NULL,
  `number` bigint NOT NULL,
  `url` longtext COLLATE utf8mb4_bin,
  `service_id` longtext COLLATE utf8mb4_bin,
  `summary` longtext COLLATE utf8mb4_bin,
  `status` longtext COLLATE utf8mb4_bin,
  `urgency` longtext COLLATE utf8mb4_bin,
  `created_date` datetime(3) DEFAULT NULL,
  `updated_date` datetime(3) DEFAULT NULL,
  `priority` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`connection_id`,`number`),
  KEY `idx__tool_pagerduty_incidents_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_pagerduty_scope_configs`
--

DROP TABLE IF EXISTS `_tool_pagerduty_scope_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_pagerduty_scope_configs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `entities` json DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `connection_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_name_pagerduty` (`name`),
  KEY `idx__tool_pagerduty_scope_configs_connection_id` (`connection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_pagerduty_services`
--

DROP TABLE IF EXISTS `_tool_pagerduty_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_pagerduty_services` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `connection_id` bigint unsigned NOT NULL,
  `id` varchar(191) COLLATE utf8mb4_bin NOT NULL,
  `url` longtext COLLATE utf8mb4_bin,
  `name` longtext COLLATE utf8mb4_bin,
  `scope_config_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`connection_id`,`id`),
  KEY `idx__tool_pagerduty_services_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_pagerduty_users`
--

DROP TABLE IF EXISTS `_tool_pagerduty_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_pagerduty_users` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `connection_id` bigint unsigned NOT NULL,
  `id` varchar(191) COLLATE utf8mb4_bin NOT NULL,
  `url` longtext COLLATE utf8mb4_bin,
  `name` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`id`),
  KEY `idx__tool_pagerduty_users_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_refdiff_finished_commits_diffs`
--

DROP TABLE IF EXISTS `_tool_refdiff_finished_commits_diffs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_refdiff_finished_commits_diffs` (
  `new_commit_sha` varchar(40) COLLATE utf8mb4_bin NOT NULL,
  `old_commit_sha` varchar(40) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`new_commit_sha`,`old_commit_sha`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_slack_channel_messages`
--

DROP TABLE IF EXISTS `_tool_slack_channel_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_slack_channel_messages` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `connection_id` bigint unsigned NOT NULL,
  `channel_id` varchar(191) COLLATE utf8mb4_bin NOT NULL,
  `ts` varchar(191) COLLATE utf8mb4_bin NOT NULL,
  `client_msg_id` longtext COLLATE utf8mb4_bin,
  `type` longtext COLLATE utf8mb4_bin,
  `subtype` longtext COLLATE utf8mb4_bin,
  `thread_ts` longtext COLLATE utf8mb4_bin,
  `user` longtext COLLATE utf8mb4_bin,
  `text` longtext COLLATE utf8mb4_bin,
  `team` longtext COLLATE utf8mb4_bin,
  `reply_count` bigint DEFAULT NULL,
  `reply_users_count` bigint DEFAULT NULL,
  `latest_reply` longtext COLLATE utf8mb4_bin,
  `is_locked` tinyint(1) DEFAULT NULL,
  `subscribed` tinyint(1) DEFAULT NULL,
  `parent_user_id` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`channel_id`,`ts`),
  KEY `idx__tool_slack_channel_messages_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_slack_channels`
--

DROP TABLE IF EXISTS `_tool_slack_channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_slack_channels` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `connection_id` bigint unsigned NOT NULL,
  `id` varchar(191) COLLATE utf8mb4_bin NOT NULL,
  `name` longtext COLLATE utf8mb4_bin,
  `is_channel` tinyint(1) DEFAULT NULL,
  `is_group` tinyint(1) DEFAULT NULL,
  `is_im` tinyint(1) DEFAULT NULL,
  `is_mpim` tinyint(1) DEFAULT NULL,
  `is_private` tinyint(1) DEFAULT NULL,
  `created` bigint DEFAULT NULL,
  `is_archived` tinyint(1) DEFAULT NULL,
  `is_general` tinyint(1) DEFAULT NULL,
  `unlinked` bigint DEFAULT NULL,
  `name_normalized` longtext COLLATE utf8mb4_bin,
  `is_shared` tinyint(1) DEFAULT NULL,
  `is_org_shared` tinyint(1) DEFAULT NULL,
  `is_pending_ext_shared` tinyint(1) DEFAULT NULL,
  `context_team_id` longtext COLLATE utf8mb4_bin,
  `updated` bigint DEFAULT NULL,
  `creator` longtext COLLATE utf8mb4_bin,
  `is_ext_shared` tinyint(1) DEFAULT NULL,
  `is_member` tinyint(1) DEFAULT NULL,
  `num_members` bigint DEFAULT NULL,
  PRIMARY KEY (`connection_id`,`id`),
  KEY `idx__tool_slack_channels_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_slack_connections`
--

DROP TABLE IF EXISTS `_tool_slack_connections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_slack_connections` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `endpoint` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `proxy` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `rate_limit_per_hour` bigint DEFAULT NULL,
  `token` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx__tool_slack_connections_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_sonarqube_accounts`
--

DROP TABLE IF EXISTS `_tool_sonarqube_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_sonarqube_accounts` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `connection_id` bigint unsigned NOT NULL,
  `login` varchar(191) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `local` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`connection_id`,`login`),
  KEY `idx__tool_sonarqube_accounts_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_sonarqube_connections`
--

DROP TABLE IF EXISTS `_tool_sonarqube_connections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_sonarqube_connections` (
  `name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `endpoint` longtext COLLATE utf8mb4_bin,
  `proxy` longtext COLLATE utf8mb4_bin,
  `rate_limit_per_hour` bigint DEFAULT NULL,
  `token` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx__tool_sonarqube_connections_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_sonarqube_file_metrics`
--

DROP TABLE IF EXISTS `_tool_sonarqube_file_metrics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_sonarqube_file_metrics` (
  `connection_id` bigint unsigned NOT NULL,
  `project_key` varchar(191) COLLATE utf8mb4_bin DEFAULT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `file_path` longtext COLLATE utf8mb4_bin,
  `file_language` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `code_smells` bigint DEFAULT NULL,
  `sqale_index` bigint DEFAULT NULL,
  `sqale_rating` double DEFAULT NULL,
  `bugs` bigint DEFAULT NULL,
  `reliability_rating` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `vulnerabilities` bigint DEFAULT NULL,
  `security_rating` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `security_hotspots` bigint DEFAULT NULL,
  `security_hotspots_reviewed` double DEFAULT NULL,
  `security_review_rating` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `ncloc` bigint DEFAULT NULL,
  `coverage` double DEFAULT NULL,
  `uncovered_lines` bigint DEFAULT NULL,
  `lines_to_cover` bigint DEFAULT NULL,
  `duplicated_lines_density` double DEFAULT NULL,
  `duplicated_blocks` bigint DEFAULT NULL,
  `duplicated_files` bigint DEFAULT NULL,
  `duplicated_lines` bigint DEFAULT NULL,
  `effort_to_reach_maintainability_rating_a` bigint DEFAULT NULL,
  `complexity` bigint DEFAULT NULL,
  `cognitive_complexity` bigint DEFAULT NULL,
  `num_of_lines` bigint DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `file_metrics_key` varchar(500) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`connection_id`,`file_metrics_key`),
  KEY `idx__tool_sonarqube_file_metrics_project_key` (`project_key`),
  KEY `idx__tool_sonarqube_file_metrics_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_sonarqube_hotspots`
--

DROP TABLE IF EXISTS `_tool_sonarqube_hotspots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_sonarqube_hotspots` (
  `connection_id` bigint unsigned NOT NULL,
  `hotspot_key` varchar(191) COLLATE utf8mb4_bin NOT NULL,
  `rule_key` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `project_key` varchar(191) COLLATE utf8mb4_bin DEFAULT NULL,
  `line` bigint DEFAULT NULL,
  `status` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `message` longtext COLLATE utf8mb4_bin,
  `author` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `assignee` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `security_category` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `vulnerability_probability` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `creation_date` datetime(3) DEFAULT NULL,
  `update_date` datetime(3) DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `component` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`connection_id`,`hotspot_key`),
  KEY `idx__tool_sonarqube_hotspots_project_key` (`project_key`),
  KEY `idx__tool_sonarqube_hotspots_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_sonarqube_issue_code_blocks`
--

DROP TABLE IF EXISTS `_tool_sonarqube_issue_code_blocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_sonarqube_issue_code_blocks` (
  `connection_id` bigint unsigned NOT NULL,
  `id` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `issue_key` varchar(191) COLLATE utf8mb4_bin DEFAULT NULL,
  `start_line` bigint DEFAULT NULL,
  `end_line` bigint DEFAULT NULL,
  `start_offset` bigint DEFAULT NULL,
  `end_offset` bigint DEFAULT NULL,
  `msg` longtext COLLATE utf8mb4_bin,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `component` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`connection_id`,`id`),
  KEY `idx__tool_sonarqube_issue_code_blocks_raw_data_params` (`_raw_data_params`),
  KEY `idx__tool_sonarqube_issue_code_blocks_issue_key` (`issue_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_sonarqube_issues`
--

DROP TABLE IF EXISTS `_tool_sonarqube_issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_sonarqube_issues` (
  `connection_id` bigint unsigned NOT NULL,
  `issue_key` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `rule` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `severity` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `project_key` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `line` bigint DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `message` longtext COLLATE utf8mb4_bin,
  `debt` bigint DEFAULT NULL,
  `effort` bigint DEFAULT NULL,
  `author` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `hash` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `tags` longtext COLLATE utf8mb4_bin,
  `type` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `scope` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `start_line` bigint DEFAULT NULL,
  `end_line` bigint DEFAULT NULL,
  `start_offset` bigint DEFAULT NULL,
  `end_offset` bigint DEFAULT NULL,
  `creation_date` datetime(3) DEFAULT NULL,
  `update_date` datetime(3) DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `component` text COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`issue_key`),
  KEY `idx__tool_sonarqube_issues_project_key` (`project_key`),
  KEY `idx__tool_sonarqube_issues_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_sonarqube_projects`
--

DROP TABLE IF EXISTS `_tool_sonarqube_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_sonarqube_projects` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `connection_id` bigint unsigned NOT NULL,
  `project_key` varchar(500) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL,
  `qualifier` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `visibility` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `last_analysis_date` datetime(3) DEFAULT NULL,
  `revision` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL,
  `scope_config_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`connection_id`,`project_key`),
  KEY `idx__tool_sonarqube_projects_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_sonarqube_scope_configs`
--

DROP TABLE IF EXISTS `_tool_sonarqube_scope_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_sonarqube_scope_configs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `entities` json DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `connection_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_name_sonarqube` (`name`),
  KEY `idx__tool_sonarqube_scope_configs_connection_id` (`connection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_tapd_accounts`
--

DROP TABLE IF EXISTS `_tool_tapd_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_tapd_accounts` (
  `connection_id` bigint NOT NULL,
  `user` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`user`),
  KEY `idx__tool_tapd_accounts_name` (`name`),
  KEY `idx__tool_tapd_accounts_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_tapd_bug_changelog_items`
--

DROP TABLE IF EXISTS `_tool_tapd_bug_changelog_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_tapd_bug_changelog_items` (
  `connection_id` bigint NOT NULL,
  `changelog_id` bigint NOT NULL,
  `field` varchar(191) COLLATE utf8mb4_bin NOT NULL,
  `value_before_parsed` longtext COLLATE utf8mb4_bin,
  `value_after_parsed` longtext COLLATE utf8mb4_bin,
  `iteration_id_from` bigint unsigned DEFAULT NULL,
  `iteration_id_to` bigint unsigned DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`changelog_id`,`field`),
  KEY `idx__tool_tapd_bug_changelog_items_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_tapd_bug_changelogs`
--

DROP TABLE IF EXISTS `_tool_tapd_bug_changelogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_tapd_bug_changelogs` (
  `connection_id` bigint NOT NULL,
  `workspace_id` bigint NOT NULL,
  `id` bigint NOT NULL,
  `bug_id` bigint unsigned DEFAULT NULL,
  `author` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `field` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `old_value` longtext COLLATE utf8mb4_bin,
  `new_value` longtext COLLATE utf8mb4_bin,
  `memo` text COLLATE utf8mb4_bin,
  `created` datetime(3) DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`id`,`field`),
  KEY `idx__tool_tapd_bug_changelogs_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_tapd_bug_commits`
--

DROP TABLE IF EXISTS `_tool_tapd_bug_commits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_tapd_bug_commits` (
  `connection_id` bigint unsigned NOT NULL,
  `id` bigint NOT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `hook_user_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `commit_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `workspace_id` bigint DEFAULT NULL,
  `message` text COLLATE utf8mb4_bin,
  `path` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `web_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `hook_project_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `ref` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `ref_status` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `git_env` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `file_commit` longtext COLLATE utf8mb4_bin,
  `commit_time` datetime(3) DEFAULT NULL,
  `created` datetime(3) DEFAULT NULL,
  `issue_updated` datetime(3) DEFAULT NULL,
  `bug_id` bigint unsigned DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`id`),
  KEY `idx__tool_tapd_bug_commits_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_tapd_bug_custom_field_value`
--

DROP TABLE IF EXISTS `_tool_tapd_bug_custom_field_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_tapd_bug_custom_field_value` (
  `connection_id` bigint NOT NULL,
  `workspace_id` bigint unsigned DEFAULT NULL,
  `bug_id` bigint NOT NULL,
  `custom_field` varchar(40) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `custom_value` longtext COLLATE utf8mb4_bin,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`bug_id`,`custom_field`),
  KEY `idx__tool_tapd_bug_custom_field_value_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_tapd_bug_custom_fields`
--

DROP TABLE IF EXISTS `_tool_tapd_bug_custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_tapd_bug_custom_fields` (
  `connection_id` bigint NOT NULL,
  `id` bigint NOT NULL,
  `workspace_id` bigint unsigned DEFAULT NULL,
  `entry_type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `custom_field` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `options` text COLLATE utf8mb4_bin,
  `enabled` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `sort` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`id`),
  KEY `idx__tool_tapd_bug_custom_fields_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_tapd_bug_labels`
--

DROP TABLE IF EXISTS `_tool_tapd_bug_labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_tapd_bug_labels` (
  `connection_id` bigint unsigned NOT NULL,
  `bug_id` bigint unsigned NOT NULL,
  `label_name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`bug_id`,`label_name`),
  KEY `idx__tool_tapd_bug_labels_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_tapd_bug_statuses`
--

DROP TABLE IF EXISTS `_tool_tapd_bug_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_tapd_bug_statuses` (
  `connection_id` bigint unsigned NOT NULL,
  `workspace_id` bigint unsigned NOT NULL,
  `english_name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `chinese_name` longtext COLLATE utf8mb4_bin,
  `is_last_step` tinyint(1) DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`workspace_id`,`english_name`),
  KEY `idx__tool_tapd_bug_statuses_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_tapd_bugs`
--

DROP TABLE IF EXISTS `_tool_tapd_bugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_tapd_bugs` (
  `connection_id` bigint unsigned NOT NULL,
  `id` bigint NOT NULL,
  `epic_key` longtext COLLATE utf8mb4_bin,
  `title` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_bin,
  `workspace_id` bigint unsigned DEFAULT NULL,
  `created` datetime(3) DEFAULT NULL,
  `modified` datetime(3) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `cc` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `begin` datetime(3) DEFAULT NULL,
  `due` datetime(3) DEFAULT NULL,
  `priority` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `iteration_id` bigint unsigned DEFAULT NULL,
  `source` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `module` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `release_id` bigint unsigned DEFAULT NULL,
  `created_from` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `feature` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `severity` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `reporter` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `resolved` datetime(3) DEFAULT NULL,
  `closed` datetime(3) DEFAULT NULL,
  `lastmodify` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `auditer` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `de` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'developer',
  `fixer` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `version_test` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `version_report` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `version_close` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `version_fix` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `baseline_find` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `baseline_join` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `baseline_close` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `baseline_test` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `sourcephase` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `te` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `current_owner` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `resolution` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `originphase` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `confirmer` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `participator` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `closer` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `platform` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `os` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `testtype` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `testphase` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `frequency` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `regression_number` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `flows` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `testmode` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `issue_id` bigint unsigned DEFAULT NULL,
  `verify_time` datetime(3) DEFAULT NULL,
  `reject_time` datetime(3) DEFAULT NULL,
  `reopen_time` datetime(3) DEFAULT NULL,
  `audit_time` datetime(3) DEFAULT NULL,
  `suspend_time` datetime(3) DEFAULT NULL,
  `deadline` datetime(3) DEFAULT NULL,
  `in_progress_time` datetime(3) DEFAULT NULL,
  `assigned_time` datetime(3) DEFAULT NULL,
  `template_id` bigint unsigned DEFAULT NULL,
  `story_id` bigint unsigned DEFAULT NULL,
  `std_status` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `std_type` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `support_id` bigint unsigned DEFAULT NULL,
  `support_forum_id` bigint unsigned DEFAULT NULL,
  `ticket_id` bigint unsigned DEFAULT NULL,
  `follower` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `sync_type` text COLLATE utf8mb4_bin,
  `label` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `effort` float DEFAULT NULL,
  `effort_completed` float DEFAULT NULL,
  `exceed` float DEFAULT NULL,
  `remain` float DEFAULT NULL,
  `progress` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `estimate` float DEFAULT NULL,
  `bugtype` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `milestone` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `custom_field_one` text COLLATE utf8mb4_bin,
  `custom_field_two` text COLLATE utf8mb4_bin,
  `custom_field_three` text COLLATE utf8mb4_bin,
  `custom_field_four` text COLLATE utf8mb4_bin,
  `custom_field_five` text COLLATE utf8mb4_bin,
  `custom_field_6` text COLLATE utf8mb4_bin,
  `custom_field_7` text COLLATE utf8mb4_bin,
  `custom_field_8` text COLLATE utf8mb4_bin,
  `custom_field_9` text COLLATE utf8mb4_bin,
  `custom_field_10` text COLLATE utf8mb4_bin,
  `custom_field_11` text COLLATE utf8mb4_bin,
  `custom_field_12` text COLLATE utf8mb4_bin,
  `custom_field_13` text COLLATE utf8mb4_bin,
  `custom_field_14` text COLLATE utf8mb4_bin,
  `custom_field_15` text COLLATE utf8mb4_bin,
  `custom_field_16` text COLLATE utf8mb4_bin,
  `custom_field_17` text COLLATE utf8mb4_bin,
  `custom_field_18` text COLLATE utf8mb4_bin,
  `custom_field_19` text COLLATE utf8mb4_bin,
  `custom_field_20` text COLLATE utf8mb4_bin,
  `custom_field_21` text COLLATE utf8mb4_bin,
  `custom_field_22` text COLLATE utf8mb4_bin,
  `custom_field_23` text COLLATE utf8mb4_bin,
  `custom_field_24` text COLLATE utf8mb4_bin,
  `custom_field_25` text COLLATE utf8mb4_bin,
  `custom_field_26` text COLLATE utf8mb4_bin,
  `custom_field_27` text COLLATE utf8mb4_bin,
  `custom_field_28` text COLLATE utf8mb4_bin,
  `custom_field_29` text COLLATE utf8mb4_bin,
  `custom_field_30` text COLLATE utf8mb4_bin,
  `custom_field_31` text COLLATE utf8mb4_bin,
  `custom_field_32` text COLLATE utf8mb4_bin,
  `custom_field_33` text COLLATE utf8mb4_bin,
  `custom_field_34` text COLLATE utf8mb4_bin,
  `custom_field_35` text COLLATE utf8mb4_bin,
  `custom_field_36` text COLLATE utf8mb4_bin,
  `custom_field_37` text COLLATE utf8mb4_bin,
  `custom_field_38` text COLLATE utf8mb4_bin,
  `custom_field_39` text COLLATE utf8mb4_bin,
  `custom_field_40` text COLLATE utf8mb4_bin,
  `custom_field_41` text COLLATE utf8mb4_bin,
  `custom_field_42` text COLLATE utf8mb4_bin,
  `custom_field_43` text COLLATE utf8mb4_bin,
  `custom_field_44` text COLLATE utf8mb4_bin,
  `custom_field_45` text COLLATE utf8mb4_bin,
  `custom_field_46` text COLLATE utf8mb4_bin,
  `custom_field_47` text COLLATE utf8mb4_bin,
  `custom_field_48` text COLLATE utf8mb4_bin,
  `custom_field_49` text COLLATE utf8mb4_bin,
  `custom_field_50` text COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`id`),
  KEY `idx__tool_tapd_bugs_modified` (`modified`),
  KEY `idx__tool_tapd_bugs_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_tapd_connections`
--

DROP TABLE IF EXISTS `_tool_tapd_connections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_tapd_connections` (
  `name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `endpoint` longtext COLLATE utf8mb4_bin,
  `proxy` longtext COLLATE utf8mb4_bin,
  `rate_limit_per_hour` bigint DEFAULT NULL,
  `username` longtext COLLATE utf8mb4_bin,
  `password` longtext COLLATE utf8mb4_bin,
  `company_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx__tool_tapd_connections_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_tapd_iteration_bugs`
--

DROP TABLE IF EXISTS `_tool_tapd_iteration_bugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_tapd_iteration_bugs` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `connection_id` bigint unsigned NOT NULL,
  `iteration_id` bigint unsigned NOT NULL,
  `workspace_id` bigint unsigned NOT NULL,
  `bug_id` bigint unsigned NOT NULL,
  `resolution_date` datetime(3) DEFAULT NULL,
  `bug_created_date` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`connection_id`,`iteration_id`,`workspace_id`,`bug_id`),
  KEY `idx__tool_tapd_iteration_bugs_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_tapd_iteration_stories`
--

DROP TABLE IF EXISTS `_tool_tapd_iteration_stories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_tapd_iteration_stories` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `connection_id` bigint unsigned NOT NULL,
  `iteration_id` bigint unsigned NOT NULL,
  `workspace_id` bigint unsigned NOT NULL,
  `story_id` bigint unsigned NOT NULL,
  `resolution_date` datetime(3) DEFAULT NULL,
  `story_created_date` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`connection_id`,`iteration_id`,`workspace_id`,`story_id`),
  KEY `idx__tool_tapd_iteration_stories_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_tapd_iteration_tasks`
--

DROP TABLE IF EXISTS `_tool_tapd_iteration_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_tapd_iteration_tasks` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `connection_id` bigint unsigned NOT NULL,
  `iteration_id` bigint unsigned NOT NULL,
  `task_id` bigint unsigned NOT NULL,
  `workspace_id` bigint unsigned NOT NULL,
  `resolution_date` datetime(3) DEFAULT NULL,
  `task_created_date` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`connection_id`,`iteration_id`,`task_id`,`workspace_id`),
  KEY `idx__tool_tapd_iteration_tasks_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_tapd_iterations`
--

DROP TABLE IF EXISTS `_tool_tapd_iterations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_tapd_iterations` (
  `connection_id` bigint NOT NULL,
  `id` bigint NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `workspace_id` bigint unsigned DEFAULT NULL,
  `startdate` datetime(3) DEFAULT NULL,
  `enddate` datetime(3) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `release_id` bigint DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_bin,
  `creator` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created` datetime(3) DEFAULT NULL,
  `modified` datetime(3) DEFAULT NULL,
  `completed` datetime(3) DEFAULT NULL,
  `releaseowner` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `launchdate` datetime(3) DEFAULT NULL,
  `notice` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `releasename` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`id`),
  KEY `idx__tool_tapd_iterations_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_tapd_scope_configs`
--

DROP TABLE IF EXISTS `_tool_tapd_scope_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_tapd_scope_configs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `connection_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `type_mappings` longblob,
  `status_mappings` longblob,
  `entities` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_name_tapd` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_tapd_stories`
--

DROP TABLE IF EXISTS `_tool_tapd_stories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_tapd_stories` (
  `connection_id` bigint unsigned NOT NULL,
  `id` bigint NOT NULL,
  `workitem_type_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_bin,
  `workspace_id` bigint unsigned DEFAULT NULL,
  `creator` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created` datetime(3) DEFAULT NULL,
  `modified` datetime(3) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `owner` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `cc` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `begin` datetime(3) DEFAULT NULL,
  `due` datetime(3) DEFAULT NULL,
  `size` smallint DEFAULT NULL,
  `priority` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `developer` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `iteration_id` bigint unsigned DEFAULT NULL,
  `test_focus` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `source` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `module` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `version` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `completed` datetime(3) DEFAULT NULL,
  `category_id` bigint DEFAULT NULL,
  `path` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `parent_id` bigint unsigned DEFAULT NULL,
  `children_id` text COLLATE utf8mb4_bin,
  `ancestor_id` bigint unsigned DEFAULT NULL,
  `business_value` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `effort` float DEFAULT NULL,
  `effort_completed` float DEFAULT NULL,
  `exceed` float DEFAULT NULL,
  `remain` float DEFAULT NULL,
  `release_id` bigint unsigned DEFAULT NULL,
  `confidential` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `templated_id` bigint unsigned DEFAULT NULL,
  `created_from` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `feature` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `std_status` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `std_type` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `attachment_count` smallint DEFAULT NULL,
  `has_attachment` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `bug_id` bigint unsigned DEFAULT NULL,
  `follower` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `sync_type` text COLLATE utf8mb4_bin,
  `predecessor_count` smallint DEFAULT NULL,
  `is_archived` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `modifier` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `progress_manual` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `successor_count` smallint DEFAULT NULL,
  `label` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `custom_field_one` text COLLATE utf8mb4_bin,
  `custom_field_two` text COLLATE utf8mb4_bin,
  `custom_field_three` text COLLATE utf8mb4_bin,
  `custom_field_four` text COLLATE utf8mb4_bin,
  `custom_field_five` text COLLATE utf8mb4_bin,
  `custom_field_six` text COLLATE utf8mb4_bin,
  `custom_field_seven` text COLLATE utf8mb4_bin,
  `custom_field_eight` text COLLATE utf8mb4_bin,
  `custom_field_9` text COLLATE utf8mb4_bin,
  `custom_field_10` text COLLATE utf8mb4_bin,
  `custom_field_11` text COLLATE utf8mb4_bin,
  `custom_field_12` text COLLATE utf8mb4_bin,
  `custom_field_13` text COLLATE utf8mb4_bin,
  `custom_field_14` text COLLATE utf8mb4_bin,
  `custom_field_15` text COLLATE utf8mb4_bin,
  `custom_field_16` text COLLATE utf8mb4_bin,
  `custom_field_17` text COLLATE utf8mb4_bin,
  `custom_field_18` text COLLATE utf8mb4_bin,
  `custom_field_19` text COLLATE utf8mb4_bin,
  `custom_field_20` text COLLATE utf8mb4_bin,
  `custom_field_21` text COLLATE utf8mb4_bin,
  `custom_field_22` text COLLATE utf8mb4_bin,
  `custom_field_23` text COLLATE utf8mb4_bin,
  `custom_field_24` text COLLATE utf8mb4_bin,
  `custom_field_25` text COLLATE utf8mb4_bin,
  `custom_field_26` text COLLATE utf8mb4_bin,
  `custom_field_27` text COLLATE utf8mb4_bin,
  `custom_field_28` text COLLATE utf8mb4_bin,
  `custom_field_29` text COLLATE utf8mb4_bin,
  `custom_field_30` text COLLATE utf8mb4_bin,
  `custom_field_31` text COLLATE utf8mb4_bin,
  `custom_field_32` text COLLATE utf8mb4_bin,
  `custom_field_33` text COLLATE utf8mb4_bin,
  `custom_field_34` text COLLATE utf8mb4_bin,
  `custom_field_35` text COLLATE utf8mb4_bin,
  `custom_field_36` text COLLATE utf8mb4_bin,
  `custom_field_37` text COLLATE utf8mb4_bin,
  `custom_field_38` text COLLATE utf8mb4_bin,
  `custom_field_39` text COLLATE utf8mb4_bin,
  `custom_field_40` text COLLATE utf8mb4_bin,
  `custom_field_41` text COLLATE utf8mb4_bin,
  `custom_field_42` text COLLATE utf8mb4_bin,
  `custom_field_43` text COLLATE utf8mb4_bin,
  `custom_field_44` text COLLATE utf8mb4_bin,
  `custom_field_45` text COLLATE utf8mb4_bin,
  `custom_field_46` text COLLATE utf8mb4_bin,
  `custom_field_47` text COLLATE utf8mb4_bin,
  `custom_field_48` text COLLATE utf8mb4_bin,
  `custom_field_49` text COLLATE utf8mb4_bin,
  `custom_field_50` text COLLATE utf8mb4_bin,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`id`),
  KEY `idx__tool_tapd_stories_raw_data_params` (`_raw_data_params`),
  KEY `idx__tool_tapd_stories_modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_tapd_story_bugs`
--

DROP TABLE IF EXISTS `_tool_tapd_story_bugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_tapd_story_bugs` (
  `connection_id` bigint unsigned NOT NULL,
  `workspace_id` bigint unsigned NOT NULL,
  `story_id` bigint unsigned NOT NULL,
  `bug_id` bigint unsigned NOT NULL,
  `issue_updated` datetime(3) DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`workspace_id`,`story_id`,`bug_id`),
  KEY `idx__tool_tapd_story_bugs_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_tapd_story_categories`
--

DROP TABLE IF EXISTS `_tool_tapd_story_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_tapd_story_categories` (
  `connection_id` bigint unsigned NOT NULL,
  `id` bigint NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_bin,
  `parent_id` bigint unsigned DEFAULT NULL,
  `created` datetime(3) DEFAULT NULL,
  `modified` datetime(3) DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`id`),
  KEY `idx__tool_tapd_story_categories_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_tapd_story_changelog_items`
--

DROP TABLE IF EXISTS `_tool_tapd_story_changelog_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_tapd_story_changelog_items` (
  `connection_id` bigint NOT NULL,
  `changelog_id` bigint NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `value_before_parsed` longtext COLLATE utf8mb4_bin,
  `value_after_parsed` longtext COLLATE utf8mb4_bin,
  `iteration_id_from` bigint unsigned DEFAULT NULL,
  `iteration_id_to` bigint unsigned DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`changelog_id`,`field`),
  KEY `idx__tool_tapd_story_changelog_items_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_tapd_story_changelogs`
--

DROP TABLE IF EXISTS `_tool_tapd_story_changelogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_tapd_story_changelogs` (
  `connection_id` bigint NOT NULL,
  `id` bigint NOT NULL,
  `workspace_id` bigint unsigned DEFAULT NULL,
  `workitem_type_id` bigint unsigned DEFAULT NULL,
  `creator` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created` datetime(3) DEFAULT NULL,
  `change_summary` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `comment` longtext COLLATE utf8mb4_bin,
  `entity_type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `change_type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `story_id` bigint unsigned DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`id`),
  KEY `idx__tool_tapd_story_changelogs_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_tapd_story_commits`
--

DROP TABLE IF EXISTS `_tool_tapd_story_commits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_tapd_story_commits` (
  `connection_id` bigint unsigned NOT NULL,
  `id` bigint NOT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `hook_user_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `commit_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `workspace_id` bigint DEFAULT NULL,
  `message` text COLLATE utf8mb4_bin,
  `path` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `web_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `hook_project_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `ref` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `ref_status` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `git_env` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `file_commit` longtext COLLATE utf8mb4_bin,
  `commit_time` datetime(3) DEFAULT NULL,
  `created` datetime(3) DEFAULT NULL,
  `issue_updated` datetime(3) DEFAULT NULL,
  `story_id` bigint unsigned DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`id`),
  KEY `idx__tool_tapd_story_commits_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_tapd_story_custom_field_value`
--

DROP TABLE IF EXISTS `_tool_tapd_story_custom_field_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_tapd_story_custom_field_value` (
  `connection_id` bigint NOT NULL,
  `workspace_id` bigint unsigned DEFAULT NULL,
  `story_id` bigint NOT NULL,
  `custom_field` varchar(40) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `custom_value` longtext COLLATE utf8mb4_bin,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`story_id`,`custom_field`),
  KEY `idx__tool_tapd_story_custom_field_value_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_tapd_story_custom_fields`
--

DROP TABLE IF EXISTS `_tool_tapd_story_custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_tapd_story_custom_fields` (
  `connection_id` bigint NOT NULL,
  `id` bigint NOT NULL,
  `workspace_id` bigint unsigned DEFAULT NULL,
  `entry_type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `custom_field` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `options` text COLLATE utf8mb4_bin,
  `enabled` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `sort` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`id`),
  KEY `idx__tool_tapd_story_custom_fields_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_tapd_story_labels`
--

DROP TABLE IF EXISTS `_tool_tapd_story_labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_tapd_story_labels` (
  `connection_id` bigint unsigned NOT NULL,
  `story_id` bigint unsigned NOT NULL,
  `label_name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`story_id`,`label_name`),
  KEY `idx__tool_tapd_story_labels_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_tapd_story_statuses`
--

DROP TABLE IF EXISTS `_tool_tapd_story_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_tapd_story_statuses` (
  `connection_id` bigint unsigned NOT NULL,
  `workspace_id` bigint unsigned NOT NULL,
  `english_name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `chinese_name` longtext COLLATE utf8mb4_bin,
  `is_last_step` tinyint(1) DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`workspace_id`,`english_name`),
  KEY `idx__tool_tapd_story_statuses_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_tapd_task_changelog_items`
--

DROP TABLE IF EXISTS `_tool_tapd_task_changelog_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_tapd_task_changelog_items` (
  `connection_id` bigint NOT NULL,
  `changelog_id` bigint NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `value_before_parsed` longtext COLLATE utf8mb4_bin,
  `value_after_parsed` longtext COLLATE utf8mb4_bin,
  `iteration_id_from` bigint unsigned DEFAULT NULL,
  `iteration_id_to` bigint unsigned DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`changelog_id`,`field`),
  KEY `idx__tool_tapd_task_changelog_items_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_tapd_task_changelogs`
--

DROP TABLE IF EXISTS `_tool_tapd_task_changelogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_tapd_task_changelogs` (
  `connection_id` bigint NOT NULL,
  `id` bigint NOT NULL,
  `workspace_id` bigint unsigned DEFAULT NULL,
  `workitem_type_id` bigint unsigned DEFAULT NULL,
  `creator` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created` datetime(3) DEFAULT NULL,
  `change_summary` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `comment` longtext COLLATE utf8mb4_bin,
  `entity_type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `change_type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `change_type_text` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `task_id` bigint unsigned DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`id`),
  KEY `idx__tool_tapd_task_changelogs_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_tapd_task_commits`
--

DROP TABLE IF EXISTS `_tool_tapd_task_commits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_tapd_task_commits` (
  `connection_id` bigint unsigned NOT NULL,
  `id` bigint NOT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `hook_user_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `commit_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `workspace_id` bigint DEFAULT NULL,
  `message` text COLLATE utf8mb4_bin,
  `path` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `web_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `hook_project_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `ref` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `ref_status` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `git_env` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `file_commit` longtext COLLATE utf8mb4_bin,
  `commit_time` datetime(3) DEFAULT NULL,
  `created` datetime(3) DEFAULT NULL,
  `issue_updated` datetime(3) DEFAULT NULL,
  `task_id` bigint unsigned DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`id`),
  KEY `idx__tool_tapd_task_commits_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_tapd_task_custom_field_value`
--

DROP TABLE IF EXISTS `_tool_tapd_task_custom_field_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_tapd_task_custom_field_value` (
  `connection_id` bigint NOT NULL,
  `workspace_id` bigint unsigned DEFAULT NULL,
  `task_id` bigint NOT NULL,
  `custom_field` varchar(40) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `custom_value` longtext COLLATE utf8mb4_bin,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`task_id`,`custom_field`),
  KEY `idx__tool_tapd_task_custom_field_value_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_tapd_task_custom_fields`
--

DROP TABLE IF EXISTS `_tool_tapd_task_custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_tapd_task_custom_fields` (
  `connection_id` bigint NOT NULL,
  `id` bigint NOT NULL,
  `workspace_id` bigint unsigned DEFAULT NULL,
  `entry_type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `custom_field` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `options` text COLLATE utf8mb4_bin,
  `enabled` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `sort` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`id`),
  KEY `idx__tool_tapd_task_custom_fields_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_tapd_task_labels`
--

DROP TABLE IF EXISTS `_tool_tapd_task_labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_tapd_task_labels` (
  `connection_id` bigint unsigned NOT NULL,
  `task_id` bigint unsigned NOT NULL,
  `label_name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`task_id`,`label_name`),
  KEY `idx__tool_tapd_task_labels_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_tapd_tasks`
--

DROP TABLE IF EXISTS `_tool_tapd_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_tapd_tasks` (
  `connection_id` bigint unsigned NOT NULL,
  `id` bigint NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_bin,
  `workspace_id` bigint unsigned DEFAULT NULL,
  `creator` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created` datetime(3) DEFAULT NULL,
  `modified` datetime(3) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `owner` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `cc` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `begin` datetime(3) DEFAULT NULL,
  `due` datetime(3) DEFAULT NULL,
  `priority` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `iteration_id` bigint unsigned DEFAULT NULL,
  `completed` datetime(3) DEFAULT NULL,
  `effort` float DEFAULT NULL,
  `effort_completed` float DEFAULT NULL,
  `exceed` float DEFAULT NULL,
  `remain` float DEFAULT NULL,
  `std_status` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `std_type` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `story_id` bigint unsigned DEFAULT NULL,
  `progress` smallint DEFAULT NULL,
  `has_attachment` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `attachment_count` smallint DEFAULT NULL,
  `follower` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_from` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `predecessor_count` smallint DEFAULT NULL,
  `successor_count` smallint DEFAULT NULL,
  `release_id` bigint unsigned DEFAULT NULL,
  `label` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `new_story_id` bigint unsigned DEFAULT NULL,
  `custom_field_one` text COLLATE utf8mb4_bin,
  `custom_field_two` text COLLATE utf8mb4_bin,
  `custom_field_three` text COLLATE utf8mb4_bin,
  `custom_field_four` text COLLATE utf8mb4_bin,
  `custom_field_five` text COLLATE utf8mb4_bin,
  `custom_field_six` text COLLATE utf8mb4_bin,
  `custom_field_seven` text COLLATE utf8mb4_bin,
  `custom_field_eight` text COLLATE utf8mb4_bin,
  `custom_field_9` text COLLATE utf8mb4_bin,
  `custom_field_10` text COLLATE utf8mb4_bin,
  `custom_field_11` text COLLATE utf8mb4_bin,
  `custom_field_12` text COLLATE utf8mb4_bin,
  `custom_field_13` text COLLATE utf8mb4_bin,
  `custom_field_14` text COLLATE utf8mb4_bin,
  `custom_field_15` text COLLATE utf8mb4_bin,
  `custom_field_16` text COLLATE utf8mb4_bin,
  `custom_field_17` text COLLATE utf8mb4_bin,
  `custom_field_18` text COLLATE utf8mb4_bin,
  `custom_field_19` text COLLATE utf8mb4_bin,
  `custom_field_20` text COLLATE utf8mb4_bin,
  `custom_field_21` text COLLATE utf8mb4_bin,
  `custom_field_22` text COLLATE utf8mb4_bin,
  `custom_field_23` text COLLATE utf8mb4_bin,
  `custom_field_24` text COLLATE utf8mb4_bin,
  `custom_field_25` text COLLATE utf8mb4_bin,
  `custom_field_26` text COLLATE utf8mb4_bin,
  `custom_field_27` text COLLATE utf8mb4_bin,
  `custom_field_28` text COLLATE utf8mb4_bin,
  `custom_field_29` text COLLATE utf8mb4_bin,
  `custom_field_30` text COLLATE utf8mb4_bin,
  `custom_field_31` text COLLATE utf8mb4_bin,
  `custom_field_32` text COLLATE utf8mb4_bin,
  `custom_field_33` text COLLATE utf8mb4_bin,
  `custom_field_34` text COLLATE utf8mb4_bin,
  `custom_field_35` text COLLATE utf8mb4_bin,
  `custom_field_36` text COLLATE utf8mb4_bin,
  `custom_field_37` text COLLATE utf8mb4_bin,
  `custom_field_38` text COLLATE utf8mb4_bin,
  `custom_field_39` text COLLATE utf8mb4_bin,
  `custom_field_40` text COLLATE utf8mb4_bin,
  `custom_field_41` text COLLATE utf8mb4_bin,
  `custom_field_42` text COLLATE utf8mb4_bin,
  `custom_field_43` text COLLATE utf8mb4_bin,
  `custom_field_44` text COLLATE utf8mb4_bin,
  `custom_field_45` text COLLATE utf8mb4_bin,
  `custom_field_46` text COLLATE utf8mb4_bin,
  `custom_field_47` text COLLATE utf8mb4_bin,
  `custom_field_48` text COLLATE utf8mb4_bin,
  `custom_field_49` text COLLATE utf8mb4_bin,
  `custom_field_50` text COLLATE utf8mb4_bin,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`id`),
  KEY `idx__tool_tapd_tasks_modified` (`modified`),
  KEY `idx__tool_tapd_tasks_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_tapd_workitem_types`
--

DROP TABLE IF EXISTS `_tool_tapd_workitem_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_tapd_workitem_types` (
  `connection_id` bigint NOT NULL,
  `id` bigint NOT NULL,
  `workspace_id` bigint unsigned DEFAULT NULL,
  `entity_type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `english_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `workflow_id` bigint unsigned DEFAULT NULL,
  `icon` longtext COLLATE utf8mb4_bin,
  `icon_small` longtext COLLATE utf8mb4_bin,
  `creator` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created` datetime(3) DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `modified` datetime(3) DEFAULT NULL,
  `icon_viper` longtext COLLATE utf8mb4_bin,
  `icon_small_viper` longtext COLLATE utf8mb4_bin,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`id`),
  KEY `idx__tool_tapd_workitem_types_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_tapd_worklogs`
--

DROP TABLE IF EXISTS `_tool_tapd_worklogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_tapd_worklogs` (
  `connection_id` bigint NOT NULL,
  `id` bigint NOT NULL,
  `workspace_id` bigint unsigned DEFAULT NULL,
  `entity_type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `entity_id` bigint unsigned DEFAULT NULL,
  `timespent` float DEFAULT NULL,
  `spentdate` datetime(3) DEFAULT NULL,
  `owner` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created` datetime(3) DEFAULT NULL,
  `memo` text COLLATE utf8mb4_bin,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`id`),
  KEY `idx__tool_tapd_worklogs_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_tapd_workspace_bugs`
--

DROP TABLE IF EXISTS `_tool_tapd_workspace_bugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_tapd_workspace_bugs` (
  `connection_id` bigint unsigned NOT NULL,
  `workspace_id` bigint unsigned NOT NULL,
  `bug_id` bigint unsigned NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`workspace_id`,`bug_id`),
  KEY `idx__tool_tapd_workspace_bugs_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_tapd_workspace_iterations`
--

DROP TABLE IF EXISTS `_tool_tapd_workspace_iterations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_tapd_workspace_iterations` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `connection_id` bigint unsigned NOT NULL,
  `workspace_id` bigint unsigned NOT NULL,
  `iteration_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`connection_id`,`workspace_id`,`iteration_id`),
  KEY `idx__tool_tapd_workspace_iterations_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_tapd_workspace_stories`
--

DROP TABLE IF EXISTS `_tool_tapd_workspace_stories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_tapd_workspace_stories` (
  `connection_id` bigint unsigned NOT NULL,
  `workspace_id` bigint unsigned NOT NULL,
  `story_id` bigint unsigned NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`workspace_id`,`story_id`),
  KEY `idx__tool_tapd_workspace_stories_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_tapd_workspace_tasks`
--

DROP TABLE IF EXISTS `_tool_tapd_workspace_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_tapd_workspace_tasks` (
  `connection_id` bigint unsigned NOT NULL,
  `workspace_id` bigint unsigned NOT NULL,
  `task_id` bigint unsigned NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`workspace_id`,`task_id`),
  KEY `idx__tool_tapd_workspace_tasks_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_tapd_workspaces`
--

DROP TABLE IF EXISTS `_tool_tapd_workspaces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_tapd_workspaces` (
  `connection_id` bigint NOT NULL,
  `id` bigint NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `pretty_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `category` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_bin,
  `begin_date` datetime(3) DEFAULT NULL,
  `end_date` datetime(3) DEFAULT NULL,
  `external_on` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `parent_id` bigint DEFAULT NULL,
  `creator` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created` datetime(3) DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `scope_config_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`connection_id`,`id`),
  KEY `idx__tool_tapd_workspaces_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_teambition_accounts`
--

DROP TABLE IF EXISTS `_tool_teambition_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_teambition_accounts` (
  `connection_id` bigint NOT NULL,
  `user_id` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `member_id` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `is_disabled` bigint DEFAULT NULL,
  `role` bigint unsigned DEFAULT NULL,
  `avatar_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `birthday` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `city` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `province` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `country` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `entry_time` datetime(3) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `phone` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `pinyin` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `py` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `staff_type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `employee_number` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`user_id`),
  KEY `idx__tool_teambition_accounts_name` (`name`),
  KEY `idx__tool_teambition_accounts_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_teambition_connections`
--

DROP TABLE IF EXISTS `_tool_teambition_connections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_teambition_connections` (
  `name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `endpoint` longtext COLLATE utf8mb4_bin,
  `proxy` longtext COLLATE utf8mb4_bin,
  `rate_limit_per_hour` bigint DEFAULT NULL,
  `tenant_id` longtext COLLATE utf8mb4_bin,
  `tenant_type` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx__tool_teambition_connections_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_teambition_projects`
--

DROP TABLE IF EXISTS `_tool_teambition_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_teambition_projects` (
  `connection_id` bigint NOT NULL,
  `id` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `description` text COLLATE utf8mb4_bin,
  `organization_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `visibility` longtext COLLATE utf8mb4_bin,
  `is_template` tinyint(1) DEFAULT NULL,
  `creator_id` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `is_archived` tinyint(1) DEFAULT NULL,
  `is_suspended` tinyint(1) DEFAULT NULL,
  `unique_id_prefix` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created` datetime(3) DEFAULT NULL,
  `updated` datetime(3) DEFAULT NULL,
  `start_date` datetime(3) DEFAULT NULL,
  `end_date` datetime(3) DEFAULT NULL,
  `customfields` text COLLATE utf8mb4_bin,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `scope_config_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`connection_id`,`id`),
  KEY `idx__tool_teambition_projects_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_teambition_sprints`
--

DROP TABLE IF EXISTS `_tool_teambition_sprints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_teambition_sprints` (
  `connection_id` bigint NOT NULL,
  `id` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `executor_id` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `description` text COLLATE utf8mb4_bin,
  `status` longtext COLLATE utf8mb4_bin,
  `project_id` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `creator_id` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `start_date` datetime(3) DEFAULT NULL,
  `due_date` datetime(3) DEFAULT NULL,
  `accomplished` datetime(3) DEFAULT NULL,
  `created` datetime(3) DEFAULT NULL,
  `updated` datetime(3) DEFAULT NULL,
  `payload` text COLLATE utf8mb4_bin,
  `labels` text COLLATE utf8mb4_bin,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`id`),
  KEY `idx__tool_teambition_sprints_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_teambition_task_activities`
--

DROP TABLE IF EXISTS `_tool_teambition_task_activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_teambition_task_activities` (
  `connection_id` bigint NOT NULL,
  `id` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `project_id` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `task_id` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `creator_id` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `action` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `bound_to_object_id` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `bound_to_object_type` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `create_time` datetime(3) DEFAULT NULL,
  `update_time` datetime(3) DEFAULT NULL,
  `content` text COLLATE utf8mb4_bin,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`id`,`project_id`,`task_id`),
  KEY `idx__tool_teambition_task_activities_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_teambition_task_flow_status`
--

DROP TABLE IF EXISTS `_tool_teambition_task_flow_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_teambition_task_flow_status` (
  `connection_id` bigint NOT NULL,
  `project_id` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `id` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `pos` bigint DEFAULT NULL,
  `taskflow_id` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `reject_status_ids` text COLLATE utf8mb4_bin,
  `kind` longtext COLLATE utf8mb4_bin,
  `creator_id` longtext COLLATE utf8mb4_bin,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `is_taskflowstatusruleexector` tinyint(1) DEFAULT NULL,
  `created` datetime(3) DEFAULT NULL,
  `updated` datetime(3) DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`project_id`,`id`),
  KEY `idx__tool_teambition_task_flow_status_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_teambition_task_scenarios`
--

DROP TABLE IF EXISTS `_tool_teambition_task_scenarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_teambition_task_scenarios` (
  `connection_id` bigint NOT NULL,
  `project_id` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `id` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `icon` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `type` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `scenariofields` text COLLATE utf8mb4_bin,
  `creator_id` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `source` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `bound_to_object_id` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `bound_to_object_type` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `taskflow_id` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `is_archived` tinyint(1) DEFAULT NULL,
  `created` datetime(3) DEFAULT NULL,
  `updated` datetime(3) DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`project_id`,`id`),
  KEY `idx__tool_teambition_task_scenarios_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_teambition_task_tag_tasks`
--

DROP TABLE IF EXISTS `_tool_teambition_task_tag_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_teambition_task_tag_tasks` (
  `connection_id` bigint NOT NULL,
  `project_id` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `task_id` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `task_tag_id` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`project_id`,`task_id`,`task_tag_id`),
  KEY `idx__tool_teambition_task_tag_tasks_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_teambition_task_tags`
--

DROP TABLE IF EXISTS `_tool_teambition_task_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_teambition_task_tags` (
  `connection_id` bigint NOT NULL,
  `id` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `creator_id` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `project_id` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `organization_id` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `color` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `is_archived` tinyint(1) DEFAULT NULL,
  `created` datetime(3) DEFAULT NULL,
  `updated` datetime(3) DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`id`),
  KEY `idx__tool_teambition_task_tags_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_teambition_task_worktime`
--

DROP TABLE IF EXISTS `_tool_teambition_task_worktime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_teambition_task_worktime` (
  `connection_id` bigint NOT NULL,
  `project_id` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `task_id` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `worktime_id` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `object_type` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `object_id` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `worktime` bigint unsigned DEFAULT NULL,
  `user_id` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `date` datetime(3) DEFAULT NULL,
  `description` text COLLATE utf8mb4_bin,
  `org_id` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `submitter_id` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`project_id`,`task_id`,`worktime_id`),
  KEY `idx__tool_teambition_task_worktime_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_teambition_tasks`
--

DROP TABLE IF EXISTS `_tool_teambition_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_teambition_tasks` (
  `connection_id` bigint NOT NULL,
  `project_id` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `id` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `content` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `note` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `ancestor_ids` text COLLATE utf8mb4_bin,
  `parent_task_id` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `tfs_id` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `tasklist_id` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `stage_id` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `tag_ids` text COLLATE utf8mb4_bin,
  `creator_id` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `executor_id` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `involve_members` text COLLATE utf8mb4_bin,
  `priority` bigint DEFAULT NULL,
  `story_point` longtext COLLATE utf8mb4_bin,
  `recurrence` text COLLATE utf8mb4_bin,
  `is_done` tinyint(1) DEFAULT NULL,
  `is_archived` tinyint(1) DEFAULT NULL,
  `visible` longtext COLLATE utf8mb4_bin,
  `unique_id` bigint DEFAULT NULL,
  `start_date` datetime(3) DEFAULT NULL,
  `due_date` datetime(3) DEFAULT NULL,
  `accomplish_time` datetime(3) DEFAULT NULL,
  `created` datetime(3) DEFAULT NULL,
  `updated` datetime(3) DEFAULT NULL,
  `sfc_id` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `sprint_id` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `customfields` text COLLATE utf8mb4_bin,
  `std_type` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `std_status` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`project_id`,`id`),
  KEY `idx__tool_teambition_tasks_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_trello_boards`
--

DROP TABLE IF EXISTS `_tool_trello_boards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_trello_boards` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `connection_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `board_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `scope_config_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`connection_id`),
  KEY `idx__tool_trello_boards_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_trello_cards`
--

DROP TABLE IF EXISTS `_tool_trello_cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_trello_cards` (
  `id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `closed` tinyint(1) DEFAULT NULL,
  `due_complete` tinyint(1) DEFAULT NULL,
  `date_last_activity` datetime(3) DEFAULT NULL,
  `id_board` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `id_list` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `id_short` bigint DEFAULT NULL,
  `pos` double DEFAULT NULL,
  `short_link` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `short_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `subscribed` tinyint(1) DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`id`),
  KEY `idx__tool_trello_cards_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_trello_check_items`
--

DROP TABLE IF EXISTS `_tool_trello_check_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_trello_check_items` (
  `id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `id_checklist` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `checklist_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `id_board` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `id_card` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `pos` double DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`id`),
  KEY `idx__tool_trello_check_items_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_trello_connections`
--

DROP TABLE IF EXISTS `_tool_trello_connections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_trello_connections` (
  `name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `endpoint` longtext COLLATE utf8mb4_bin,
  `proxy` longtext COLLATE utf8mb4_bin,
  `rate_limit_per_hour` bigint DEFAULT NULL,
  `app_id` longtext COLLATE utf8mb4_bin,
  `secret_key` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx__tool_trello_connections_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_trello_labels`
--

DROP TABLE IF EXISTS `_tool_trello_labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_trello_labels` (
  `id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `id_board` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`id`),
  KEY `idx__tool_trello_labels_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_trello_lists`
--

DROP TABLE IF EXISTS `_tool_trello_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_trello_lists` (
  `id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `id_board` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `subscribed` tinyint(1) DEFAULT NULL,
  `pos` double DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`id`),
  KEY `idx__tool_trello_lists_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_trello_members`
--

DROP TABLE IF EXISTS `_tool_trello_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_trello_members` (
  `id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`id`),
  KEY `idx__tool_trello_members_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_trello_scope_configs`
--

DROP TABLE IF EXISTS `_tool_trello_scope_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_trello_scope_configs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `connection_id` bigint unsigned DEFAULT NULL,
  `entities` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_name_trello` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_webhook_connections`
--

DROP TABLE IF EXISTS `_tool_webhook_connections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_webhook_connections` (
  `name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx__tool_webhook_connections_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_zentao_accounts`
--

DROP TABLE IF EXISTS `_tool_zentao_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_zentao_accounts` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `connection_id` bigint NOT NULL,
  `id` bigint NOT NULL,
  `account` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `realname` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `role` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `dept` bigint NOT NULL,
  PRIMARY KEY (`connection_id`,`id`),
  KEY `idx__tool_zentao_accounts_raw_data_params` (`_raw_data_params`),
  KEY `idx__tool_zentao_accounts_account` (`account`),
  KEY `idx__tool_zentao_accounts_realname` (`realname`),
  KEY `idx__tool_zentao_accounts_role` (`role`),
  KEY `idx__tool_zentao_accounts_dept` (`dept`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_zentao_bug_commits`
--

DROP TABLE IF EXISTS `_tool_zentao_bug_commits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_zentao_bug_commits` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `connection_id` bigint NOT NULL,
  `id` bigint NOT NULL,
  `object_type` longtext COLLATE utf8mb4_bin,
  `object_id` bigint DEFAULT NULL,
  `product` bigint DEFAULT NULL,
  `project` bigint DEFAULT NULL,
  `execution` bigint DEFAULT NULL,
  `actor` longtext COLLATE utf8mb4_bin,
  `action` longtext COLLATE utf8mb4_bin,
  `date` longtext COLLATE utf8mb4_bin,
  `comment` longtext COLLATE utf8mb4_bin,
  `extra` longtext COLLATE utf8mb4_bin,
  `host` longtext COLLATE utf8mb4_bin,
  `repo_revision` longtext COLLATE utf8mb4_bin,
  `action_read` longtext COLLATE utf8mb4_bin,
  `vision` longtext COLLATE utf8mb4_bin,
  `efforted` bigint DEFAULT NULL,
  `action_desc` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`id`),
  KEY `idx__tool_zentao_bug_commits_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_zentao_bug_repo_commits`
--

DROP TABLE IF EXISTS `_tool_zentao_bug_repo_commits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_zentao_bug_repo_commits` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `connection_id` bigint NOT NULL,
  `product` bigint DEFAULT NULL,
  `project` bigint DEFAULT NULL,
  `issue_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `repo_url` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `commit_sha` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`connection_id`,`issue_id`,`repo_url`,`commit_sha`),
  KEY `idx__tool_zentao_bug_repo_commits_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_zentao_bugs`
--

DROP TABLE IF EXISTS `_tool_zentao_bugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_zentao_bugs` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `connection_id` bigint NOT NULL,
  `id` bigint NOT NULL,
  `project` bigint DEFAULT NULL,
  `product` bigint DEFAULT NULL,
  `injection` bigint DEFAULT NULL,
  `identify` bigint DEFAULT NULL,
  `branch` bigint DEFAULT NULL,
  `module` bigint DEFAULT NULL,
  `execution` bigint DEFAULT NULL,
  `plan` bigint DEFAULT NULL,
  `story` bigint DEFAULT NULL,
  `story_version` bigint DEFAULT NULL,
  `task` bigint DEFAULT NULL,
  `to_task` bigint DEFAULT NULL,
  `to_story` bigint DEFAULT NULL,
  `title` longtext COLLATE utf8mb4_bin,
  `keywords` longtext COLLATE utf8mb4_bin,
  `severity` bigint DEFAULT NULL,
  `pri` bigint DEFAULT NULL,
  `type` longtext COLLATE utf8mb4_bin,
  `os` longtext COLLATE utf8mb4_bin,
  `browser` longtext COLLATE utf8mb4_bin,
  `hardware` longtext COLLATE utf8mb4_bin,
  `found` longtext COLLATE utf8mb4_bin,
  `steps` longtext COLLATE utf8mb4_bin,
  `status` longtext COLLATE utf8mb4_bin,
  `sub_status` longtext COLLATE utf8mb4_bin,
  `color` longtext COLLATE utf8mb4_bin,
  `confirmed` bigint DEFAULT NULL,
  `activated_count` bigint DEFAULT NULL,
  `activated_date` datetime(3) DEFAULT NULL,
  `feedback_by` longtext COLLATE utf8mb4_bin,
  `notify_email` longtext COLLATE utf8mb4_bin,
  `opened_by_id` bigint DEFAULT NULL,
  `opened_by_name` longtext COLLATE utf8mb4_bin,
  `opened_date` datetime(3) DEFAULT NULL,
  `opened_build` longtext COLLATE utf8mb4_bin,
  `assigned_to_id` bigint DEFAULT NULL,
  `assigned_to_name` longtext COLLATE utf8mb4_bin,
  `assigned_date` datetime(3) DEFAULT NULL,
  `deadline` longtext COLLATE utf8mb4_bin,
  `resolved_by_id` bigint DEFAULT NULL,
  `resolution` longtext COLLATE utf8mb4_bin,
  `resolved_build` longtext COLLATE utf8mb4_bin,
  `resolved_date` datetime(3) DEFAULT NULL,
  `closed_by_id` bigint DEFAULT NULL,
  `closed_date` datetime(3) DEFAULT NULL,
  `duplicate_bug` bigint DEFAULT NULL,
  `link_bug` longtext COLLATE utf8mb4_bin,
  `feedback` bigint DEFAULT NULL,
  `result` bigint DEFAULT NULL,
  `repo` bigint DEFAULT NULL,
  `mr` bigint DEFAULT NULL,
  `entry` longtext COLLATE utf8mb4_bin,
  `num_of_line` longtext COLLATE utf8mb4_bin,
  `v1` longtext COLLATE utf8mb4_bin,
  `v2` longtext COLLATE utf8mb4_bin,
  `repo_type` longtext COLLATE utf8mb4_bin,
  `issue_key` longtext COLLATE utf8mb4_bin,
  `testtask` bigint DEFAULT NULL,
  `last_edited_by_id` bigint DEFAULT NULL,
  `last_edited_date` datetime(3) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `pri_order` longtext COLLATE utf8mb4_bin,
  `severity_order` bigint DEFAULT NULL,
  `needconfirm` tinyint(1) DEFAULT NULL,
  `status_name` longtext COLLATE utf8mb4_bin,
  `product_status` longtext COLLATE utf8mb4_bin,
  `url` longtext COLLATE utf8mb4_bin,
  `std_status` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `std_type` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`connection_id`,`id`),
  KEY `idx__tool_zentao_bugs_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_zentao_changelog`
--

DROP TABLE IF EXISTS `_tool_zentao_changelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_zentao_changelog` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `connection_id` bigint NOT NULL,
  `id` bigint NOT NULL,
  `object_id` bigint NOT NULL,
  `execution` bigint DEFAULT NULL,
  `actor` longtext COLLATE utf8mb4_bin,
  `action` longtext COLLATE utf8mb4_bin,
  `extra` longtext COLLATE utf8mb4_bin,
  `object_type` longtext COLLATE utf8mb4_bin,
  `project` bigint DEFAULT NULL,
  `product` bigint DEFAULT NULL,
  `vision` longtext COLLATE utf8mb4_bin,
  `comment` longtext COLLATE utf8mb4_bin,
  `efforted` longtext COLLATE utf8mb4_bin,
  `date` datetime(3) DEFAULT NULL,
  `read` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`id`),
  KEY `idx__tool_zentao_changelog_raw_data_params` (`_raw_data_params`),
  KEY `idx__tool_zentao_changelog_object_id` (`object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_zentao_changelog_detail`
--

DROP TABLE IF EXISTS `_tool_zentao_changelog_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_zentao_changelog_detail` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `connection_id` bigint NOT NULL,
  `id` bigint NOT NULL,
  `changelog_id` bigint NOT NULL,
  `field` longtext COLLATE utf8mb4_bin,
  `old` longtext COLLATE utf8mb4_bin,
  `new` longtext COLLATE utf8mb4_bin,
  `diff` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`id`,`changelog_id`),
  KEY `idx__tool_zentao_changelog_detail_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_zentao_connections`
--

DROP TABLE IF EXISTS `_tool_zentao_connections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_zentao_connections` (
  `name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `endpoint` longtext COLLATE utf8mb4_bin,
  `proxy` longtext COLLATE utf8mb4_bin,
  `rate_limit_per_hour` bigint DEFAULT NULL,
  `username` longtext COLLATE utf8mb4_bin,
  `password` longtext COLLATE utf8mb4_bin,
  `db_url` longtext COLLATE utf8mb4_bin,
  `db_idle_conns` bigint DEFAULT NULL,
  `db_logging_level` longtext COLLATE utf8mb4_bin,
  `db_max_conns` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx__tool_zentao_connections_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_zentao_departments`
--

DROP TABLE IF EXISTS `_tool_zentao_departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_zentao_departments` (
  `connection_id` bigint NOT NULL,
  `id` bigint NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `parent` bigint NOT NULL,
  `path` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `grade` bigint DEFAULT NULL,
  `order_in` bigint DEFAULT NULL,
  `position` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `dept_function` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `manager` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `manager_name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`id`),
  KEY `idx__tool_zentao_departments_name` (`name`),
  KEY `idx__tool_zentao_departments_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_zentao_execution_stories`
--

DROP TABLE IF EXISTS `_tool_zentao_execution_stories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_zentao_execution_stories` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `connection_id` bigint unsigned NOT NULL,
  `project_id` bigint NOT NULL,
  `execution_id` bigint NOT NULL,
  `story_id` bigint NOT NULL,
  PRIMARY KEY (`connection_id`,`project_id`,`execution_id`,`story_id`),
  KEY `idx__tool_zentao_execution_stories_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_zentao_execution_summary`
--

DROP TABLE IF EXISTS `_tool_zentao_execution_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_zentao_execution_summary` (
  `connection_id` bigint NOT NULL,
  `id` bigint NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `project` bigint DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`id`),
  KEY `idx__tool_zentao_execution_summary_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_zentao_executions`
--

DROP TABLE IF EXISTS `_tool_zentao_executions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_zentao_executions` (
  `connection_id` bigint NOT NULL,
  `id` bigint NOT NULL,
  `project` bigint DEFAULT NULL,
  `model` longtext COLLATE utf8mb4_bin,
  `type` longtext COLLATE utf8mb4_bin,
  `lifetime` longtext COLLATE utf8mb4_bin,
  `budget` longtext COLLATE utf8mb4_bin,
  `budget_unit` longtext COLLATE utf8mb4_bin,
  `attribute` longtext COLLATE utf8mb4_bin,
  `percent` bigint DEFAULT NULL,
  `milestone` longtext COLLATE utf8mb4_bin,
  `output` longtext COLLATE utf8mb4_bin,
  `auth` longtext COLLATE utf8mb4_bin,
  `parent` bigint DEFAULT NULL,
  `path` longtext COLLATE utf8mb4_bin,
  `grade` bigint DEFAULT NULL,
  `name` longtext COLLATE utf8mb4_bin,
  `code` longtext COLLATE utf8mb4_bin,
  `plan_begin` datetime(3) DEFAULT NULL,
  `plan_end` datetime(3) DEFAULT NULL,
  `real_began` datetime(3) DEFAULT NULL,
  `real_end` datetime(3) DEFAULT NULL,
  `status` longtext COLLATE utf8mb4_bin,
  `sub_status` longtext COLLATE utf8mb4_bin,
  `pri` longtext COLLATE utf8mb4_bin,
  `description` longtext COLLATE utf8mb4_bin,
  `version` bigint DEFAULT NULL,
  `parent_version` bigint DEFAULT NULL,
  `plan_duration` bigint DEFAULT NULL,
  `real_duration` bigint DEFAULT NULL,
  `opened_by_id` bigint DEFAULT NULL,
  `opened_date` datetime(3) DEFAULT NULL,
  `opened_version` longtext COLLATE utf8mb4_bin,
  `last_edited_by_id` bigint DEFAULT NULL,
  `last_edited_date` datetime(3) DEFAULT NULL,
  `closed_by_id` bigint DEFAULT NULL,
  `closed_date` datetime(3) DEFAULT NULL,
  `canceled_by_id` bigint DEFAULT NULL,
  `canceled_date` datetime(3) DEFAULT NULL,
  `suspended_date` datetime(3) DEFAULT NULL,
  `po_id` bigint DEFAULT NULL,
  `pm_id` bigint DEFAULT NULL,
  `qd_id` bigint DEFAULT NULL,
  `rd_id` bigint DEFAULT NULL,
  `team` longtext COLLATE utf8mb4_bin,
  `acl` longtext COLLATE utf8mb4_bin,
  `order_in` bigint DEFAULT NULL,
  `vision` longtext COLLATE utf8mb4_bin,
  `display_cards` bigint DEFAULT NULL,
  `fluid_board` longtext COLLATE utf8mb4_bin,
  `deleted` tinyint(1) DEFAULT NULL,
  `total_hours` double DEFAULT NULL,
  `total_estimate` double DEFAULT NULL,
  `total_consumed` double DEFAULT NULL,
  `total_left` double DEFAULT NULL,
  `project_id` bigint DEFAULT NULL,
  `progress` double DEFAULT NULL,
  `case_review` tinyint(1) DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`id`),
  KEY `idx__tool_zentao_executions_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_zentao_product_summary`
--

DROP TABLE IF EXISTS `_tool_zentao_product_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_zentao_product_summary` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `connection_id` bigint unsigned NOT NULL,
  `project_id` bigint NOT NULL,
  `id` bigint NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`connection_id`,`project_id`,`id`),
  KEY `idx__tool_zentao_product_summary_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_zentao_products`
--

DROP TABLE IF EXISTS `_tool_zentao_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_zentao_products` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `connection_id` bigint NOT NULL,
  `id` bigint NOT NULL,
  `program` bigint DEFAULT NULL,
  `name` longtext COLLATE utf8mb4_bin,
  `code` longtext COLLATE utf8mb4_bin,
  `bind` longtext COLLATE utf8mb4_bin,
  `line` bigint DEFAULT NULL,
  `type` longtext COLLATE utf8mb4_bin,
  `product_type` longtext COLLATE utf8mb4_bin,
  `status` longtext COLLATE utf8mb4_bin,
  `sub_status` longtext COLLATE utf8mb4_bin,
  `description` longtext COLLATE utf8mb4_bin,
  `po_id` bigint DEFAULT NULL,
  `qd_id` bigint DEFAULT NULL,
  `rd_id` bigint DEFAULT NULL,
  `acl` longtext COLLATE utf8mb4_bin,
  `reviewer` longtext COLLATE utf8mb4_bin,
  `created_by_id` bigint DEFAULT NULL,
  `created_date` datetime(3) DEFAULT NULL,
  `created_version` longtext COLLATE utf8mb4_bin,
  `order_in` bigint DEFAULT NULL,
  `deleted` longtext COLLATE utf8mb4_bin,
  `plans` bigint DEFAULT NULL,
  `releases` bigint DEFAULT NULL,
  `builds` bigint DEFAULT NULL,
  `cases` bigint DEFAULT NULL,
  `projects` bigint DEFAULT NULL,
  `executions` bigint DEFAULT NULL,
  `bugs` bigint DEFAULT NULL,
  `docs` bigint DEFAULT NULL,
  `progress` double DEFAULT NULL,
  `case_review` tinyint(1) DEFAULT NULL,
  `scope_config_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`connection_id`,`id`),
  KEY `idx__tool_zentao_products_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_zentao_project_stories`
--

DROP TABLE IF EXISTS `_tool_zentao_project_stories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_zentao_project_stories` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `connection_id` bigint NOT NULL,
  `project_id` bigint NOT NULL,
  `story_id` bigint NOT NULL,
  PRIMARY KEY (`connection_id`,`project_id`,`story_id`),
  KEY `idx__tool_zentao_project_stories_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_zentao_projects`
--

DROP TABLE IF EXISTS `_tool_zentao_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_zentao_projects` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `connection_id` bigint NOT NULL,
  `id` bigint NOT NULL,
  `project` bigint DEFAULT NULL,
  `model` longtext COLLATE utf8mb4_bin,
  `type` longtext COLLATE utf8mb4_bin,
  `project_type` longtext COLLATE utf8mb4_bin,
  `lifetime` longtext COLLATE utf8mb4_bin,
  `budget` longtext COLLATE utf8mb4_bin,
  `budget_unit` longtext COLLATE utf8mb4_bin,
  `attribute` longtext COLLATE utf8mb4_bin,
  `percent` bigint DEFAULT NULL,
  `milestone` longtext COLLATE utf8mb4_bin,
  `output` longtext COLLATE utf8mb4_bin,
  `auth` longtext COLLATE utf8mb4_bin,
  `parent` bigint DEFAULT NULL,
  `path` longtext COLLATE utf8mb4_bin,
  `grade` bigint DEFAULT NULL,
  `name` longtext COLLATE utf8mb4_bin,
  `code` longtext COLLATE utf8mb4_bin,
  `plan_begin` datetime(3) DEFAULT NULL,
  `plan_end` datetime(3) DEFAULT NULL,
  `real_began` datetime(3) DEFAULT NULL,
  `real_end` datetime(3) DEFAULT NULL,
  `days` bigint DEFAULT NULL,
  `status` longtext COLLATE utf8mb4_bin,
  `sub_status` longtext COLLATE utf8mb4_bin,
  `pri` longtext COLLATE utf8mb4_bin,
  `description` longtext COLLATE utf8mb4_bin,
  `version` bigint DEFAULT NULL,
  `parent_version` bigint DEFAULT NULL,
  `plan_duration` bigint DEFAULT NULL,
  `real_duration` bigint DEFAULT NULL,
  `opened_date` datetime(3) DEFAULT NULL,
  `opened_version` longtext COLLATE utf8mb4_bin,
  `last_edited_date` datetime(3) DEFAULT NULL,
  `closed_by` longtext COLLATE utf8mb4_bin,
  `closed_date` datetime(3) DEFAULT NULL,
  `canceled_by` longtext COLLATE utf8mb4_bin,
  `canceled_date` datetime(3) DEFAULT NULL,
  `suspended_date` datetime(3) DEFAULT NULL,
  `po` longtext COLLATE utf8mb4_bin,
  `pm_id` bigint DEFAULT NULL,
  `pm_account` longtext COLLATE utf8mb4_bin,
  `pm_avatar` longtext COLLATE utf8mb4_bin,
  `pm_realname` longtext COLLATE utf8mb4_bin,
  `qd` longtext COLLATE utf8mb4_bin,
  `rd` longtext COLLATE utf8mb4_bin,
  `team` longtext COLLATE utf8mb4_bin,
  `acl` longtext COLLATE utf8mb4_bin,
  `order_in` bigint DEFAULT NULL,
  `vision` longtext COLLATE utf8mb4_bin,
  `display_cards` bigint DEFAULT NULL,
  `fluid_board` longtext COLLATE utf8mb4_bin,
  `deleted` tinyint(1) DEFAULT NULL,
  `delay` bigint DEFAULT NULL,
  `hours_total_estimate` double DEFAULT NULL,
  `hours_total_consumed` double DEFAULT NULL,
  `hours_total_left` double DEFAULT NULL,
  `hours_progress` double DEFAULT NULL,
  `hours_total_real` bigint DEFAULT NULL,
  `team_count` bigint DEFAULT NULL,
  `left_tasks` longtext COLLATE utf8mb4_bin,
  `total_estimate` double DEFAULT NULL,
  `total_consumed` double DEFAULT NULL,
  `total_left` double DEFAULT NULL,
  `progress` double DEFAULT NULL,
  `scope_config_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`connection_id`,`id`),
  KEY `idx__tool_zentao_projects_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_zentao_scope_configs`
--

DROP TABLE IF EXISTS `_tool_zentao_scope_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_zentao_scope_configs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `entities` json DEFAULT NULL,
  `connection_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `type_mappings` longblob,
  `bug_status_mappings` longblob,
  `story_status_mappings` longblob,
  `task_status_mappings` longblob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_name_tapd` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_zentao_stories`
--

DROP TABLE IF EXISTS `_tool_zentao_stories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_zentao_stories` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `connection_id` bigint NOT NULL,
  `id` bigint NOT NULL,
  `project` bigint DEFAULT NULL,
  `product` bigint DEFAULT NULL,
  `branch` bigint DEFAULT NULL,
  `version` bigint DEFAULT NULL,
  `order_in` bigint DEFAULT NULL,
  `vision` longtext COLLATE utf8mb4_bin,
  `parent` bigint DEFAULT NULL,
  `module` bigint DEFAULT NULL,
  `plan` longtext COLLATE utf8mb4_bin,
  `source` longtext COLLATE utf8mb4_bin,
  `source_note` longtext COLLATE utf8mb4_bin,
  `from_bug` bigint DEFAULT NULL,
  `feedback` bigint DEFAULT NULL,
  `feedback_by` longtext COLLATE utf8mb4_bin,
  `title` longtext COLLATE utf8mb4_bin,
  `keywords` longtext COLLATE utf8mb4_bin,
  `type` longtext COLLATE utf8mb4_bin,
  `category` longtext COLLATE utf8mb4_bin,
  `pri` bigint DEFAULT NULL,
  `estimate` double DEFAULT NULL,
  `status` longtext COLLATE utf8mb4_bin,
  `sub_status` longtext COLLATE utf8mb4_bin,
  `color` longtext COLLATE utf8mb4_bin,
  `stage` longtext COLLATE utf8mb4_bin,
  `staged_by_id` bigint DEFAULT NULL,
  `lib` bigint DEFAULT NULL,
  `from_story` bigint DEFAULT NULL,
  `from_version` bigint DEFAULT NULL,
  `opened_by_id` bigint DEFAULT NULL,
  `opened_by_name` longtext COLLATE utf8mb4_bin,
  `opened_date` datetime(3) DEFAULT NULL,
  `assigned_to_id` bigint DEFAULT NULL,
  `assigned_to_name` longtext COLLATE utf8mb4_bin,
  `assigned_date` datetime(3) DEFAULT NULL,
  `approved_date` datetime(3) DEFAULT NULL,
  `last_edited_id` bigint DEFAULT NULL,
  `last_edited_date` datetime(3) DEFAULT NULL,
  `changed_date` datetime(3) DEFAULT NULL,
  `reviewed_by_id` bigint DEFAULT NULL,
  `reviewed_date` datetime(3) DEFAULT NULL,
  `closed_id` bigint DEFAULT NULL,
  `closed_date` datetime(3) DEFAULT NULL,
  `closed_reason` longtext COLLATE utf8mb4_bin,
  `activated_date` datetime(3) DEFAULT NULL,
  `to_bug` bigint DEFAULT NULL,
  `child_stories` longtext COLLATE utf8mb4_bin,
  `link_stories` longtext COLLATE utf8mb4_bin,
  `link_requirements` longtext COLLATE utf8mb4_bin,
  `duplicate_story` bigint DEFAULT NULL,
  `story_changed` longtext COLLATE utf8mb4_bin,
  `notify_email` longtext COLLATE utf8mb4_bin,
  `ur_changed` longtext COLLATE utf8mb4_bin,
  `deleted` tinyint(1) DEFAULT NULL,
  `pri_order` longtext COLLATE utf8mb4_bin,
  `plan_title` longtext COLLATE utf8mb4_bin,
  `url` longtext COLLATE utf8mb4_bin,
  `std_status` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `std_type` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`connection_id`,`id`),
  KEY `idx__tool_zentao_stories_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_zentao_story_commits`
--

DROP TABLE IF EXISTS `_tool_zentao_story_commits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_zentao_story_commits` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `connection_id` bigint NOT NULL,
  `id` bigint NOT NULL,
  `object_type` longtext COLLATE utf8mb4_bin,
  `object_id` bigint DEFAULT NULL,
  `product` bigint DEFAULT NULL,
  `project` bigint DEFAULT NULL,
  `execution` bigint DEFAULT NULL,
  `actor` longtext COLLATE utf8mb4_bin,
  `action` longtext COLLATE utf8mb4_bin,
  `date` longtext COLLATE utf8mb4_bin,
  `comment` longtext COLLATE utf8mb4_bin,
  `extra` longtext COLLATE utf8mb4_bin,
  `host` longtext COLLATE utf8mb4_bin,
  `repo_revision` longtext COLLATE utf8mb4_bin,
  `action_read` longtext COLLATE utf8mb4_bin,
  `vision` longtext COLLATE utf8mb4_bin,
  `efforted` bigint DEFAULT NULL,
  `action_desc` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`id`),
  KEY `idx__tool_zentao_story_commits_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_zentao_story_repo_commits`
--

DROP TABLE IF EXISTS `_tool_zentao_story_repo_commits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_zentao_story_repo_commits` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `connection_id` bigint NOT NULL,
  `product` bigint DEFAULT NULL,
  `project` bigint DEFAULT NULL,
  `issue_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `repo_url` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `commit_sha` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`connection_id`,`issue_id`,`repo_url`,`commit_sha`),
  KEY `idx__tool_zentao_story_repo_commits_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_zentao_task_commits`
--

DROP TABLE IF EXISTS `_tool_zentao_task_commits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_zentao_task_commits` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `connection_id` bigint NOT NULL,
  `id` bigint NOT NULL,
  `object_type` longtext COLLATE utf8mb4_bin,
  `object_id` bigint DEFAULT NULL,
  `product` bigint DEFAULT NULL,
  `project` bigint DEFAULT NULL,
  `execution` bigint DEFAULT NULL,
  `actor` longtext COLLATE utf8mb4_bin,
  `action` longtext COLLATE utf8mb4_bin,
  `date` longtext COLLATE utf8mb4_bin,
  `comment` longtext COLLATE utf8mb4_bin,
  `extra` longtext COLLATE utf8mb4_bin,
  `host` longtext COLLATE utf8mb4_bin,
  `repo_revision` longtext COLLATE utf8mb4_bin,
  `action_read` longtext COLLATE utf8mb4_bin,
  `vision` longtext COLLATE utf8mb4_bin,
  `efforted` bigint DEFAULT NULL,
  `action_desc` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`connection_id`,`id`),
  KEY `idx__tool_zentao_task_commits_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_zentao_task_repo_commits`
--

DROP TABLE IF EXISTS `_tool_zentao_task_repo_commits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_zentao_task_repo_commits` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `connection_id` bigint NOT NULL,
  `product` bigint DEFAULT NULL,
  `project` bigint DEFAULT NULL,
  `issue_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `repo_url` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `commit_sha` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`connection_id`,`issue_id`,`repo_url`,`commit_sha`),
  KEY `idx__tool_zentao_task_repo_commits_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_tool_zentao_tasks`
--

DROP TABLE IF EXISTS `_tool_zentao_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tool_zentao_tasks` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `connection_id` bigint NOT NULL,
  `id` bigint NOT NULL,
  `project` bigint DEFAULT NULL,
  `parent` bigint DEFAULT NULL,
  `execution` bigint DEFAULT NULL,
  `module` bigint DEFAULT NULL,
  `design` bigint DEFAULT NULL,
  `story` bigint DEFAULT NULL,
  `story_version` bigint DEFAULT NULL,
  `design_version` bigint DEFAULT NULL,
  `from_bug` bigint DEFAULT NULL,
  `feedback` bigint DEFAULT NULL,
  `from_issue` bigint DEFAULT NULL,
  `name` longtext COLLATE utf8mb4_bin,
  `type` longtext COLLATE utf8mb4_bin,
  `mode` longtext COLLATE utf8mb4_bin,
  `pri` bigint DEFAULT NULL,
  `estimate` double DEFAULT NULL,
  `consumed` double DEFAULT NULL,
  `deadline` longtext COLLATE utf8mb4_bin,
  `status` longtext COLLATE utf8mb4_bin,
  `sub_status` longtext COLLATE utf8mb4_bin,
  `color` longtext COLLATE utf8mb4_bin,
  `description` longtext COLLATE utf8mb4_bin,
  `version` bigint DEFAULT NULL,
  `opened_by_id` bigint DEFAULT NULL,
  `opened_by_name` longtext COLLATE utf8mb4_bin,
  `opened_date` datetime(3) DEFAULT NULL,
  `assigned_to_id` bigint DEFAULT NULL,
  `assigned_to_name` longtext COLLATE utf8mb4_bin,
  `assigned_date` datetime(3) DEFAULT NULL,
  `est_started` longtext COLLATE utf8mb4_bin,
  `real_started` datetime(3) DEFAULT NULL,
  `finished_id` bigint DEFAULT NULL,
  `finished_date` datetime(3) DEFAULT NULL,
  `finished_list` longtext COLLATE utf8mb4_bin,
  `canceled_id` bigint DEFAULT NULL,
  `canceled_date` datetime(3) DEFAULT NULL,
  `closed_by_id` bigint DEFAULT NULL,
  `closed_date` datetime(3) DEFAULT NULL,
  `plan_duration` bigint DEFAULT NULL,
  `real_duration` bigint DEFAULT NULL,
  `closed_reason` longtext COLLATE utf8mb4_bin,
  `last_edited_id` bigint DEFAULT NULL,
  `last_edited_date` datetime(3) DEFAULT NULL,
  `activated_date` datetime(3) DEFAULT NULL,
  `order_in` bigint DEFAULT NULL,
  `repo` bigint DEFAULT NULL,
  `mr` bigint DEFAULT NULL,
  `entry` longtext COLLATE utf8mb4_bin,
  `num_of_line` longtext COLLATE utf8mb4_bin,
  `v1` longtext COLLATE utf8mb4_bin,
  `v2` longtext COLLATE utf8mb4_bin,
  `deleted` tinyint(1) DEFAULT NULL,
  `vision` longtext COLLATE utf8mb4_bin,
  `story_id` bigint DEFAULT NULL,
  `story_title` longtext COLLATE utf8mb4_bin,
  `branch` bigint DEFAULT NULL,
  `latest_story_version` bigint DEFAULT NULL,
  `story_status` longtext COLLATE utf8mb4_bin,
  `assigned_to_real_name` longtext COLLATE utf8mb4_bin,
  `pri_order` longtext COLLATE utf8mb4_bin,
  `need_confirm` tinyint(1) DEFAULT NULL,
  `progress` double DEFAULT NULL,
  `url` longtext COLLATE utf8mb4_bin,
  `std_status` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `std_type` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `db_left` double DEFAULT NULL,
  PRIMARY KEY (`connection_id`,`id`),
  KEY `idx__tool_zentao_tasks_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts` (
  `id` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT 'This key is generated based on details from the original plugin',
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `email` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `user_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `avatar_url` longtext COLLATE utf8mb4_bin,
  `organization` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_date` datetime(3) DEFAULT NULL,
  `status` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_accounts_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `board_issues`
--

DROP TABLE IF EXISTS `board_issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board_issues` (
  `board_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `issue_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`board_id`,`issue_id`),
  KEY `idx_board_issues_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `board_repos`
--

DROP TABLE IF EXISTS `board_repos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board_repos` (
  `board_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `repo_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`board_id`,`repo_id`),
  KEY `idx_board_repos_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `board_sprints`
--

DROP TABLE IF EXISTS `board_sprints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board_sprints` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `board_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `sprint_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`board_id`,`sprint_id`),
  KEY `idx_board_sprints_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `boards`
--

DROP TABLE IF EXISTS `boards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boards` (
  `id` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT 'This key is generated based on details from the original plugin',
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_bin,
  `url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_date` datetime(3) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_boards_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `calendar_months`
--

DROP TABLE IF EXISTS `calendar_months`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calendar_months` (
  `month` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  `month_timestamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`month`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cicd_deployment_commits`
--

DROP TABLE IF EXISTS `cicd_deployment_commits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cicd_deployment_commits` (
  `id` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT 'This key is generated based on details from the original plugin',
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `cicd_scope_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `cicd_deployment_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `result` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `original_result` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `status` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `original_status` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `environment` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `original_environment` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_date` datetime(3) DEFAULT NULL,
  `queued_date` datetime(3) DEFAULT NULL,
  `queued_duration_sec` double DEFAULT NULL,
  `started_date` datetime(3) DEFAULT NULL,
  `finished_date` datetime(3) DEFAULT NULL,
  `duration_sec` double DEFAULT NULL,
  `commit_sha` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `ref_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `repo_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `repo_url` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL,
  `prev_success_deployment_commit_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `commit_msg` longtext COLLATE utf8mb4_bin,
  `subtask_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `display_title` longtext COLLATE utf8mb4_bin,
  `url` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`id`,`commit_sha`),
  KEY `idx_cicd_deployment_commits_cicd_scope_id` (`cicd_scope_id`),
  KEY `idx_cicd_deployment_commits_repo_url` (`repo_url`),
  KEY `idx_cicd_deployment_commits_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cicd_deployments`
--

DROP TABLE IF EXISTS `cicd_deployments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cicd_deployments` (
  `id` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT 'This key is generated based on details from the original plugin',
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `cicd_scope_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `result` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `original_result` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `status` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `original_status` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `environment` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `original_environment` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_date` datetime(3) DEFAULT NULL,
  `queued_date` datetime(3) DEFAULT NULL,
  `queued_duration_sec` double DEFAULT NULL,
  `started_date` datetime(3) DEFAULT NULL,
  `finished_date` datetime(3) DEFAULT NULL,
  `duration_sec` double DEFAULT NULL,
  `subtask_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `display_title` longtext COLLATE utf8mb4_bin,
  `url` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`id`),
  KEY `idx_cicd_deployments_raw_data_params` (`_raw_data_params`),
  KEY `idx_cicd_deployments_cicd_scope_id` (`cicd_scope_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cicd_pipeline_commits`
--

DROP TABLE IF EXISTS `cicd_pipeline_commits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cicd_pipeline_commits` (
  `pipeline_id` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT 'This key is generated based on details from the original plugin',
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `commit_sha` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `branch` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `repo_url` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL,
  `repo_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `commit_msg` longtext COLLATE utf8mb4_bin,
  `display_title` longtext COLLATE utf8mb4_bin,
  `url` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`pipeline_id`,`commit_sha`),
  KEY `idx_cicd_pipeline_repos_raw_data_params` (`_raw_data_params`),
  KEY `idx_cicd_pipeline_commits_raw_data_params` (`_raw_data_params`),
  KEY `idx_cicd_pipeline_commits_repo_id` (`repo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cicd_pipelines`
--

DROP TABLE IF EXISTS `cicd_pipelines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cicd_pipelines` (
  `id` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT 'This key is generated based on details from the original plugin',
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `result` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `original_result` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `status` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `original_status` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `type` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT ' to indicate this is CI or CD',
  `created_date` datetime(3) DEFAULT NULL,
  `queued_date` datetime(3) DEFAULT NULL,
  `queued_duration_sec` double DEFAULT NULL,
  `started_date` datetime(3) DEFAULT NULL,
  `finished_date` datetime(3) DEFAULT NULL,
  `duration_sec` double DEFAULT NULL,
  `environment` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `cicd_scope_id` longtext COLLATE utf8mb4_bin,
  `name` longtext COLLATE utf8mb4_bin,
  `display_title` longtext COLLATE utf8mb4_bin,
  `url` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`id`),
  KEY `idx_cicd_pipelines_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cicd_releases`
--

DROP TABLE IF EXISTS `cicd_releases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cicd_releases` (
  `id` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT 'This key is generated based on details from the original plugin',
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `published_at` datetime(3) DEFAULT NULL,
  `cicd_scope_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `display_title` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_bin,
  `url` longtext COLLATE utf8mb4_bin,
  `is_draft` tinyint(1) DEFAULT NULL,
  `is_latest` tinyint(1) DEFAULT NULL,
  `is_prerelease` tinyint(1) DEFAULT NULL,
  `author_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `repo_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `tag_name` longtext COLLATE utf8mb4_bin,
  `commit_sha` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`id`),
  KEY `idx_cicd_releases_raw_data_params` (`_raw_data_params`),
  KEY `idx_cicd_releases_cicd_scope_id` (`cicd_scope_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cicd_scopes`
--

DROP TABLE IF EXISTS `cicd_scopes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cicd_scopes` (
  `id` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT 'This key is generated based on details from the original plugin',
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_bin,
  `url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_date` datetime(3) DEFAULT NULL,
  `updated_date` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_cicd_scopes_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cicd_tasks`
--

DROP TABLE IF EXISTS `cicd_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cicd_tasks` (
  `id` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT 'This key is generated based on details from the original plugin',
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `pipeline_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `result` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `original_result` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `status` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `original_status` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `type` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT ' to indicate this is CI or CD',
  `created_date` datetime(3) DEFAULT NULL,
  `queued_date` datetime(3) DEFAULT NULL,
  `queued_duration_sec` double DEFAULT NULL,
  `started_date` datetime(3) DEFAULT NULL,
  `finished_date` datetime(3) DEFAULT NULL,
  `duration_sec` double DEFAULT NULL,
  `environment` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `cicd_scope_id` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`id`),
  KEY `idx_cicd_tasks_raw_data_params` (`_raw_data_params`),
  KEY `idx_cicd_tasks_pipeline_id` (`pipeline_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commit_file_components`
--

DROP TABLE IF EXISTS `commit_file_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commit_file_components` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `commit_file_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `component_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`commit_file_id`),
  KEY `idx_commit_file_components_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commit_files`
--

DROP TABLE IF EXISTS `commit_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commit_files` (
  `id` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT 'This key is generated based on details from the original plugin',
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `commit_sha` varchar(40) COLLATE utf8mb4_bin DEFAULT NULL,
  `file_path` varbinary(1024) DEFAULT NULL,
  `additions` bigint DEFAULT NULL,
  `deletions` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_commit_files_raw_data_params` (`_raw_data_params`),
  KEY `idx_commit_files_commit_sha` (`commit_sha`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commit_line_change`
--

DROP TABLE IF EXISTS `commit_line_change`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commit_line_change` (
  `id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `commit_sha` varchar(40) COLLATE utf8mb4_bin DEFAULT NULL,
  `new_file_path` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `line_no_new` bigint DEFAULT NULL,
  `line_no_old` bigint DEFAULT NULL,
  `old_file_path` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `hunk_num` bigint DEFAULT NULL,
  `changed_type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `prev_commit` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_commit_line_change_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commit_parents`
--

DROP TABLE IF EXISTS `commit_parents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commit_parents` (
  `commit_sha` varchar(40) COLLATE utf8mb4_bin NOT NULL COMMENT 'commit hash',
  `parent_commit_sha` varchar(40) COLLATE utf8mb4_bin NOT NULL COMMENT 'parent commit hash',
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`commit_sha`,`parent_commit_sha`),
  KEY `idx_commit_parents_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commits`
--

DROP TABLE IF EXISTS `commits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commits` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `sha` varchar(40) COLLATE utf8mb4_bin NOT NULL COMMENT 'commit hash',
  `additions` bigint DEFAULT NULL COMMENT 'Added lines of code',
  `deletions` bigint DEFAULT NULL COMMENT 'Deleted lines of code',
  `dev_eq` bigint DEFAULT NULL COMMENT 'Merico developer equivalent from analysis engine',
  `message` longblob,
  `author_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `author_email` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `authored_date` datetime(3) DEFAULT NULL,
  `author_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `committer_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `committer_email` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `committed_date` datetime(3) DEFAULT NULL,
  `committer_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`sha`),
  KEY `idx_commits_raw_data_params` (`_raw_data_params`),
  KEY `idx_commits_committer_id` (`committer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commits_diffs`
--

DROP TABLE IF EXISTS `commits_diffs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commits_diffs` (
  `new_commit_sha` varchar(40) COLLATE utf8mb4_bin NOT NULL,
  `old_commit_sha` varchar(40) COLLATE utf8mb4_bin NOT NULL,
  `commit_sha` varchar(40) COLLATE utf8mb4_bin NOT NULL,
  `sorting_index` bigint DEFAULT NULL,
  PRIMARY KEY (`new_commit_sha`,`old_commit_sha`,`commit_sha`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `components`
--

DROP TABLE IF EXISTS `components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components` (
  `repo_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `path_regex` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_file_metrics`
--

DROP TABLE IF EXISTS `cq_file_metrics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_file_metrics` (
  `id` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT 'This key is generated based on details from the original plugin',
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `project_key` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `file_path` longtext COLLATE utf8mb4_bin,
  `file_language` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `code_smells` bigint DEFAULT NULL,
  `sqale_index` bigint DEFAULT NULL,
  `sqale_rating` double DEFAULT NULL,
  `bugs` bigint DEFAULT NULL,
  `reliability_rating` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `vulnerabilities` bigint DEFAULT NULL,
  `security_rating` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `security_hotspots` bigint DEFAULT NULL,
  `security_hotspots_reviewed` double DEFAULT NULL,
  `security_review_rating` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `ncloc` bigint DEFAULT NULL,
  `coverage` double DEFAULT NULL,
  `uncovered_lines` bigint DEFAULT NULL,
  `lines_to_cover` bigint DEFAULT NULL,
  `duplicated_lines_density` double DEFAULT NULL,
  `duplicated_blocks` bigint DEFAULT NULL,
  `duplicated_files` bigint DEFAULT NULL,
  `duplicated_lines` bigint DEFAULT NULL,
  `effort_to_reach_maintainability_rating_a` bigint DEFAULT NULL,
  `complexity` bigint DEFAULT NULL,
  `cognitive_complexity` bigint DEFAULT NULL,
  `num_of_lines` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_cq_file_metrics_raw_data_params` (`_raw_data_params`),
  KEY `idx_cq_file_metrics_project_key` (`project_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_issue_code_blocks`
--

DROP TABLE IF EXISTS `cq_issue_code_blocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_issue_code_blocks` (
  `id` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT 'This key is generated based on details from the original plugin',
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `issue_key` varchar(191) COLLATE utf8mb4_bin DEFAULT NULL,
  `component` varchar(191) COLLATE utf8mb4_bin DEFAULT NULL,
  `start_line` bigint DEFAULT NULL,
  `end_line` bigint DEFAULT NULL,
  `start_offset` bigint DEFAULT NULL,
  `end_offset` bigint DEFAULT NULL,
  `msg` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`id`),
  KEY `idx_cq_issue_code_blocks_component` (`component`),
  KEY `idx_cq_issue_code_blocks_raw_data_params` (`_raw_data_params`),
  KEY `idx_cq_issue_code_blocks_issue_key` (`issue_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_issues`
--

DROP TABLE IF EXISTS `cq_issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_issues` (
  `id` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT 'This key is generated based on details from the original plugin',
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `rule` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `severity` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `component` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `project_key` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `line` bigint DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `message` longtext COLLATE utf8mb4_bin,
  `debt` bigint DEFAULT NULL,
  `effort` bigint DEFAULT NULL,
  `commit_author_email` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `assignee` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `hash` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `tags` longtext COLLATE utf8mb4_bin,
  `type` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `scope` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `start_line` bigint DEFAULT NULL,
  `end_line` bigint DEFAULT NULL,
  `start_offset` bigint DEFAULT NULL,
  `end_offset` bigint DEFAULT NULL,
  `vulnerability_probability` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `security_category` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_date` datetime(3) DEFAULT NULL,
  `updated_date` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_cq_issues_project_key` (`project_key`),
  KEY `idx_cq_issues_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_projects`
--

DROP TABLE IF EXISTS `cq_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_projects` (
  `id` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT 'This key is generated based on details from the original plugin',
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `qualifier` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `visibility` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `last_analysis_date` datetime(3) DEFAULT NULL,
  `commit_sha` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_cq_projects_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dora_benchmarks`
--

DROP TABLE IF EXISTS `dora_benchmarks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dora_benchmarks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `metric` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `low` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `medium` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `high` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `elite` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `dora_report` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `incident_assignees`
--

DROP TABLE IF EXISTS `incident_assignees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `incident_assignees` (
  `incident_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `assignee_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `assignee_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`incident_id`,`assignee_id`),
  KEY `idx_incident_assignees_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `incidents`
--

DROP TABLE IF EXISTS `incidents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `incidents` (
  `id` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT 'This key is generated based on details from the original plugin',
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `incident_key` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `title` longtext COLLATE utf8mb4_bin,
  `description` longtext COLLATE utf8mb4_bin,
  `status` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `original_status` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `resolution_date` datetime(3) DEFAULT NULL,
  `created_date` datetime(3) DEFAULT NULL,
  `updated_date` datetime(3) DEFAULT NULL,
  `lead_time_minutes` bigint unsigned DEFAULT NULL,
  `original_estimate_minutes` bigint DEFAULT NULL,
  `time_spent_minutes` bigint DEFAULT NULL,
  `time_remaining_minutes` bigint DEFAULT NULL,
  `creator_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `creator_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `parent_incident_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `priority` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `severity` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `urgency` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `component` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `original_project` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `scope_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `assignee_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `assignee_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_incidents_raw_data_params` (`_raw_data_params`),
  KEY `idx_table_scope_id` (`table`,`scope_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `issue_assignee_history`
--

DROP TABLE IF EXISTS `issue_assignee_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `issue_assignee_history` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `issue_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `assignee` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `start_date` datetime(3) NOT NULL,
  `end_date` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`issue_id`,`assignee`,`start_date`),
  KEY `idx_issue_assignee_history_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `issue_assignees`
--

DROP TABLE IF EXISTS `issue_assignees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `issue_assignees` (
  `issue_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `assignee_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `assignee_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`issue_id`,`assignee_id`),
  KEY `idx_issue_assignees_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `issue_changelogs`
--

DROP TABLE IF EXISTS `issue_changelogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `issue_changelogs` (
  `id` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT 'This key is generated based on details from the original plugin',
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `issue_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `author_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `author_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `field_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `field_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `original_from_value` longtext COLLATE utf8mb4_bin,
  `original_to_value` longtext COLLATE utf8mb4_bin,
  `from_value` longtext COLLATE utf8mb4_bin,
  `to_value` longtext COLLATE utf8mb4_bin,
  `created_date` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_issue_changelogs_raw_data_params` (`_raw_data_params`),
  KEY `idx_issue_changelogs_issue_id` (`issue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `issue_comments`
--

DROP TABLE IF EXISTS `issue_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `issue_comments` (
  `id` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT 'This key is generated based on details from the original plugin',
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `issue_id` varchar(191) COLLATE utf8mb4_bin DEFAULT NULL,
  `body` longtext COLLATE utf8mb4_bin,
  `account_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_date` datetime(3) DEFAULT NULL,
  `updated_date` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_issue_comments_issue_id` (`issue_id`),
  KEY `idx_issue_comments_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `issue_commits`
--

DROP TABLE IF EXISTS `issue_commits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `issue_commits` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `issue_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `commit_sha` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`issue_id`,`commit_sha`),
  KEY `idx_issue_commits_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `issue_custom_array_fields`
--

DROP TABLE IF EXISTS `issue_custom_array_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `issue_custom_array_fields` (
  `issue_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `field_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `field_value` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`issue_id`,`field_id`,`field_value`),
  KEY `idx_issue_custom_array_fields_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `issue_labels`
--

DROP TABLE IF EXISTS `issue_labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `issue_labels` (
  `issue_id` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT 'This key is generated based on details from the original plugin',
  `label_name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`issue_id`,`label_name`),
  KEY `idx_issue_labels_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `issue_relationships`
--

DROP TABLE IF EXISTS `issue_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `issue_relationships` (
  `source_issue_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `target_issue_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `original_type` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`source_issue_id`,`target_issue_id`,`original_type`),
  KEY `idx_issue_relationships_source_issue_id` (`source_issue_id`),
  KEY `idx_issue_relationships_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `issue_repo_commits`
--

DROP TABLE IF EXISTS `issue_repo_commits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `issue_repo_commits` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `issue_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `repo_url` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `commit_sha` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `host` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `namespace` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `repo_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`issue_id`,`repo_url`,`commit_sha`),
  KEY `idx_issue_repo_commits_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `issue_status_history`
--

DROP TABLE IF EXISTS `issue_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `issue_status_history` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `issue_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `status` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `original_status` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `start_date` datetime(3) NOT NULL,
  `end_date` datetime(3) DEFAULT NULL,
  `is_current_status` tinyint(1) DEFAULT NULL,
  `is_first_status` tinyint(1) DEFAULT NULL,
  `status_time_minutes` int DEFAULT NULL,
  PRIMARY KEY (`issue_id`,`original_status`,`start_date`),
  KEY `idx_issue_status_history_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `issue_worklogs`
--

DROP TABLE IF EXISTS `issue_worklogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `issue_worklogs` (
  `id` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT 'This key is generated based on details from the original plugin',
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `author_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `comment` longtext COLLATE utf8mb4_bin,
  `time_spent_minutes` bigint DEFAULT NULL,
  `logged_date` datetime(3) DEFAULT NULL,
  `started_date` datetime(3) DEFAULT NULL,
  `issue_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_issue_worklogs_raw_data_params` (`_raw_data_params`),
  KEY `idx_issue_worklogs_issue_id` (`issue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `issues`
--

DROP TABLE IF EXISTS `issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `issues` (
  `id` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT 'This key is generated based on details from the original plugin',
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `icon_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `issue_key` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `title` longtext COLLATE utf8mb4_bin,
  `description` longtext COLLATE utf8mb4_bin,
  `epic_key` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `type` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `original_type` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL,
  `status` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `original_status` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `resolution_date` datetime(3) DEFAULT NULL,
  `created_date` datetime(3) DEFAULT NULL,
  `updated_date` datetime(3) DEFAULT NULL,
  `lead_time_minutes` bigint DEFAULT NULL,
  `parent_issue_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `priority` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `story_point` double DEFAULT NULL,
  `original_estimate_minutes` bigint DEFAULT NULL,
  `time_spent_minutes` bigint DEFAULT NULL,
  `time_remaining_minutes` bigint DEFAULT NULL,
  `creator_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `creator_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `assignee_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `assignee_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `severity` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `component` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `original_project` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `urgency` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `is_subtask` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_issues_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_incident_deployment_relationships`
--

DROP TABLE IF EXISTS `project_incident_deployment_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_incident_deployment_relationships` (
  `id` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT 'This key is generated based on details from the original plugin',
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `project_name` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `deployment_id` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`id`,`project_name`),
  KEY `idx_project_issue_metrics_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_mapping`
--

DROP TABLE IF EXISTS `project_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_mapping` (
  `project_name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `table` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `row_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`project_name`,`table`,`row_id`),
  KEY `idx_project_mapping_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_metric_settings`
--

DROP TABLE IF EXISTS `project_metric_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_metric_settings` (
  `project_name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `plugin_name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `enable` tinyint(1) DEFAULT NULL,
  `plugin_option` json DEFAULT NULL,
  PRIMARY KEY (`project_name`,`plugin_name`),
  KEY `idx_project_metrics_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_pr_metrics`
--

DROP TABLE IF EXISTS `project_pr_metrics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_pr_metrics` (
  `id` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT 'This key is generated based on details from the original plugin',
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `project_name` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `first_commit_sha` longtext COLLATE utf8mb4_bin,
  `pr_coding_time` bigint DEFAULT NULL,
  `first_review_id` longtext COLLATE utf8mb4_bin,
  `pr_pickup_time` bigint DEFAULT NULL,
  `pr_review_time` bigint DEFAULT NULL,
  `deployment_commit_id` longtext COLLATE utf8mb4_bin,
  `pr_deploy_time` bigint DEFAULT NULL,
  `pr_cycle_time` bigint DEFAULT NULL,
  `first_commit_authored_date` datetime(3) DEFAULT NULL,
  `pr_created_date` datetime(3) DEFAULT NULL,
  `first_comment_date` datetime(3) DEFAULT NULL,
  `pr_merged_date` datetime(3) DEFAULT NULL,
  `pr_deployed_date` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`,`project_name`),
  KEY `idx_project_pr_metrics_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects` (
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `description` text COLLATE utf8mb4_bin,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`name`),
  KEY `idx_projects_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pull_request_assignees`
--

DROP TABLE IF EXISTS `pull_request_assignees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pull_request_assignees` (
  `pull_request_id` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT 'This key is generated based on details from the original plugin',
  `assignee_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `user_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`pull_request_id`,`assignee_id`),
  KEY `idx_pull_request_assignees_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pull_request_comments`
--

DROP TABLE IF EXISTS `pull_request_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pull_request_comments` (
  `id` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT 'This key is generated based on details from the original plugin',
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `body` longtext COLLATE utf8mb4_bin,
  `account_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_date` datetime(3) DEFAULT NULL,
  `commit_sha` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `review_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `pull_request_id` varchar(191) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_pull_request_comments_raw_data_params` (`_raw_data_params`),
  KEY `idx_pull_request_comments_pull_request_id` (`pull_request_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pull_request_commits`
--

DROP TABLE IF EXISTS `pull_request_commits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pull_request_commits` (
  `commit_sha` varchar(40) COLLATE utf8mb4_bin NOT NULL,
  `pull_request_id` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT 'This key is generated based on details from the original plugin',
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `commit_author_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `commit_author_email` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `commit_authored_date` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`pull_request_id`,`commit_sha`),
  KEY `idx_pull_request_commits_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pull_request_issues`
--

DROP TABLE IF EXISTS `pull_request_issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pull_request_issues` (
  `pull_request_id` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT 'This key is generated based on details from the original plugin',
  `issue_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `pull_request_key` bigint DEFAULT NULL,
  `issue_key` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`pull_request_id`,`issue_id`),
  KEY `idx_pull_request_issues_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pull_request_labels`
--

DROP TABLE IF EXISTS `pull_request_labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pull_request_labels` (
  `pull_request_id` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT 'This key is generated based on details from the original plugin',
  `label_name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`pull_request_id`,`label_name`),
  KEY `idx_pull_request_labels_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pull_request_reviewers`
--

DROP TABLE IF EXISTS `pull_request_reviewers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pull_request_reviewers` (
  `pull_request_id` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT 'This key is generated based on details from the original plugin',
  `reviewer_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `user_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`pull_request_id`,`reviewer_id`),
  KEY `idx_pull_request_reviewers_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pull_requests`
--

DROP TABLE IF EXISTS `pull_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pull_requests` (
  `id` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT 'This key is generated based on details from the original plugin',
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `base_repo_id` varchar(191) COLLATE utf8mb4_bin DEFAULT NULL,
  `base_ref` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `base_commit_sha` varchar(40) COLLATE utf8mb4_bin DEFAULT NULL,
  `head_repo_id` varchar(191) COLLATE utf8mb4_bin DEFAULT NULL,
  `head_ref` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `head_commit_sha` varchar(40) COLLATE utf8mb4_bin DEFAULT NULL,
  `merge_commit_sha` varchar(40) COLLATE utf8mb4_bin DEFAULT NULL,
  `status` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'open/closed or other',
  `original_status` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `type` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `component` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `title` longtext COLLATE utf8mb4_bin,
  `description` longtext COLLATE utf8mb4_bin,
  `url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `author_name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `author_id` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `parent_pr_id` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `pull_request_key` bigint DEFAULT NULL,
  `created_date` datetime(3) DEFAULT NULL,
  `merged_date` datetime(3) DEFAULT NULL,
  `closed_date` datetime(3) DEFAULT NULL,
  `additions` bigint DEFAULT NULL,
  `deletions` bigint DEFAULT NULL,
  `merged_by_name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `merged_by_id` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `is_draft` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_pull_requests_raw_data_params` (`_raw_data_params`),
  KEY `idx_pull_requests_base_repo_id` (`base_repo_id`),
  KEY `idx_pull_requests_head_repo_id` (`head_repo_id`),
  KEY `idx_pull_requests_parent_pr_id` (`parent_pr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ref_commits`
--

DROP TABLE IF EXISTS `ref_commits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ref_commits` (
  `new_ref_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `old_ref_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `new_commit_sha` varchar(40) COLLATE utf8mb4_bin DEFAULT NULL,
  `old_commit_sha` varchar(40) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`new_ref_id`,`old_ref_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `refs`
--

DROP TABLE IF EXISTS `refs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `refs` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `repo_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `commit_sha` varchar(40) COLLATE utf8mb4_bin DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT NULL,
  `ref_type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_date` datetime(3) DEFAULT NULL,
  `id` varchar(500) COLLATE utf8mb4_bin NOT NULL COMMENT 'This key is generated based on details from the original plugin',
  PRIMARY KEY (`id`),
  KEY `idx_refs_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `refs_issues_diffs`
--

DROP TABLE IF EXISTS `refs_issues_diffs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `refs_issues_diffs` (
  `new_ref_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `old_ref_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `new_ref_commit_sha` varchar(40) COLLATE utf8mb4_bin DEFAULT NULL,
  `old_ref_commit_sha` varchar(40) COLLATE utf8mb4_bin DEFAULT NULL,
  `issue_number` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `issue_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`new_ref_id`,`old_ref_id`,`issue_id`),
  KEY `idx_refs_issues_diffs_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `refs_pr_cherrypicks`
--

DROP TABLE IF EXISTS `refs_pr_cherrypicks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `refs_pr_cherrypicks` (
  `repo_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `parent_pr_key` bigint DEFAULT NULL,
  `cherrypick_base_branches` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `cherrypick_pr_keys` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `parent_pr_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `parent_pr_id` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT 'This key is generated based on details from the original plugin',
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`parent_pr_id`),
  KEY `idx_refs_pr_cherrypicks_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `repo_commits`
--

DROP TABLE IF EXISTS `repo_commits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repo_commits` (
  `repo_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `commit_sha` varchar(40) COLLATE utf8mb4_bin NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`repo_id`,`commit_sha`),
  KEY `idx_repo_commits_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `repo_snapshot`
--

DROP TABLE IF EXISTS `repo_snapshot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repo_snapshot` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `repo_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `commit_sha` varchar(40) COLLATE utf8mb4_bin NOT NULL,
  `file_path` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `line_no` bigint NOT NULL,
  PRIMARY KEY (`repo_id`,`commit_sha`,`file_path`,`line_no`),
  KEY `idx_repo_snapshot_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `repos`
--

DROP TABLE IF EXISTS `repos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repos` (
  `id` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT 'This key is generated based on details from the original plugin',
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `name` longtext COLLATE utf8mb4_bin,
  `url` longtext COLLATE utf8mb4_bin,
  `description` longtext COLLATE utf8mb4_bin,
  `owner_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `language` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `forked_from` longtext COLLATE utf8mb4_bin,
  `created_date` datetime(3) DEFAULT NULL,
  `updated_date` datetime(3) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_repos_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sprint_issues`
--

DROP TABLE IF EXISTS `sprint_issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sprint_issues` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `sprint_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `issue_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`sprint_id`,`issue_id`),
  KEY `idx_sprint_issues_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sprints`
--

DROP TABLE IF EXISTS `sprints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sprints` (
  `id` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT 'This key is generated based on details from the original plugin',
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `status` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `started_date` datetime(3) DEFAULT NULL,
  `ended_date` datetime(3) DEFAULT NULL,
  `completed_date` datetime(3) DEFAULT NULL,
  `original_board_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_sprints_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `team_users`
--

DROP TABLE IF EXISTS `team_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team_users` (
  `team_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`team_id`,`user_id`),
  KEY `idx_team_users_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams` (
  `id` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT 'This key is generated based on details from the original plugin',
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `alias` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `parent_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `sorting_index` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_teams_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_accounts`
--

DROP TABLE IF EXISTS `user_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_accounts` (
  `user_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `account_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`account_id`),
  KEY `idx_user_accounts_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT 'This key is generated based on details from the original plugin',
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `_raw_data_params` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `_raw_data_id` bigint unsigned DEFAULT NULL,
  `_raw_data_remark` longtext COLLATE utf8mb4_bin,
  `email` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_users_raw_data_params` (`_raw_data_params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-06  1:32:16
