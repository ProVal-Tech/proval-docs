---
id: '3ebaee48-b9a2-4d7b-b0ba-5b3003c97633'
title: 'plugin_proval_ini_settings (View)'
title_meta: 'plugin_proval_ini_settings (View)'
keywords: ['ini', 'settings', 'cwa', 'proval', 'database']
description: 'This document provides a detailed overview of the current and ProVal recommended INI settings for ConnectWise Automate (CWA). It includes a table that outlines the variable names, their current values, and the recommended values as per ProVal guidelines, ensuring optimal configuration for database performance.'
tags: ['database', 'performance']
draft: false
unlisted: false
---

## Purpose

Displays the current and ProVal recommended INI settings for CWA.

## Table

#### plugin_proval_ini_settings

| Column                     | Type    | Explanation                                  |
|---------------------------|---------|----------------------------------------------|
| Variable_name             | VARCHAR | The name of the INI variable.                |
| Variable_Value            | VARCHAR | The currently set value for the variable.    |
| Recommended_Value         | VARCHAR | The ProVal recommendations for this variable. |

| Variable_name                     | Variable_Value                  | Recommended_Value               |
|-----------------------------------|---------------------------------|--------------------------------|
| datadir                           | C://ProgramData//MySQL//MySQL Server 5.7//Data// | NA                             |
| innodb_autoinc_lock_mode         | 1                               | 2                              |
| innodb_buffer_pool_instances      | 8                               | 8                              |
| innodb_buffer_pool_size           | 3221225472                      | 2                              |
| innodb_doublewrite                | ON                              | ON                             |
| innodb_file_per_table             | ON                              | ON                             |
| innodb_flush_log_at_trx_commit    | 0                               | 0                              |
| innodb_log_buffer_size            | 1048576                         | 1048576                        |
| innodb_log_file_size              | 536870912                       | 1                              |
| innodb_strict_mode                | OFF                             | OFF                            |
| innodb_support_xa                 | ON                              | OFF                            |
| innodb_thread_concurrency         | 0                               | 0                              |
| key_buffer_size                   | 8388608                         | 1048576                        |
| long_query_time                   | 10                              | 10                             |
| max_allowed_packet                | 536870912                       | 536870912                      |
| max_connect_errors                | 100                             | 1                              |
| max_connections                   | 3000                            | 10000                          |
| max_heap_table_size              | 100663296                       | 100663296                      |
| myisam_max_sort_file_size        | 1.07374E+11                    | 1.07374E+11                   |
| myisam_sort_buffer_size           | 291504128                       | 70254592                       |
| open_files_limit                  | 17048                           | 114756                         |
| port                              | 3306                            | 3306                           |
| query_cache_size                  | 1048576                         | 0                              |
| query_cache_type                  | OFF                             | OFF                            |
| read_buffer_size                  | 65536                           | 65536                          |
| read_rnd_buffer_size              | 262144                          | 262144                         |
| slow_query_log                    | ON                              | ON                             |
| slow_query_log_file               | CW-AUTOMATE-slow.log           | NA                             |
| sort_buffer_size                  | 262144                          | 262144                         |
| table_open_cache                  | 4500                            | 57378                          |
| thread_cache_size                 | 38                              | 100                            |
| tmp_table_size                    | 100663296                       | 100663296                      |
| wait_timeout                      | 28800                           | 900                            |



