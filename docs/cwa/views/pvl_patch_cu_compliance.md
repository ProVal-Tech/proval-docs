---
id: '8a713392-a671-4af3-8cbe-ff04199e2f3b'
title: 'Patching and CU Compliance Metrics'
title_meta: 'Patching and CU Compliance Metrics'
keywords: ['patching', 'compliance', 'windows', 'cumulative', 'update', 'metrics']
description: 'This document outlines the SQL query used for the Patching and CU Compliance Metrics dataview, focusing on supported Windows computers with managed patch policies. It details dependencies, tables, and various metrics related to patch compliance and cumulative updates.'
tags: ['compliance', 'database', 'patching', 'report', 'windows']
draft: false
unlisted: false
---

## Purpose

The view is designed to store and execute the SQL query utilized by the 'Patching and CU Compliance Metrics' dataview. It contains data exclusively for supported Windows computers with managed patch policies that have been online in Automate within the past 30 days and are part of production patching groups.

## Dependencies

- [CWM - Automate - Custom Table - pvl_win_latest_installed_cu](<../tables/pvl_win_latest_installed_cu.md>)
- [EPM - Windows Update - Script - Get Latest Installed Cumulative Update](https://proval.itglue.com/DOC-5078775-12849478)
- [CWM - Automate - Solution - Latest Installed Cumulative Update](https://proval.itglue.com/DOC-5078775-12850104)
- [SEC - Windows Patching - Custom Table - plugin_proval_windows_os_support](<../tables/plugin_proval_windows_os_support.md>)
- [CWM - Automate - Script - MySQL - Table - Create (plugin_proval_windows_os_support)](<../scripts/MySQL - Table - Create (plugin_proval_windows_os_support).md>)

## Tables

### pvl_patch_cu_compliance

| Column                                   | Explanation                                                                                                                                                                                                                   |
|------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Approved Prod. Patches                  | Number of approved production patches                                                                                                                                                                                       |
| Installed Prod. Patches                  | Number of installed production patches                                                                                                                                                                                      |
| Failed Prod. Patches                     | Number of failed production patches                                                                                                                                                                                         |
| Missing Prod. Patches                    | Number of missing production patches                                                                                                                                                                                        |
| Prod. Patch Compliance %                 | Patch compliance of the whole environment for the production patches (`Number of installed production patches` divided by `Number of approved production patches` multiplied by `100`)                                       |
| Supported Prod. Computers                | Number of active Windows machines with managed patch policies that are part of production patching groups.                                                                                                                  |
| Patch Managed Clients                    | Total number of patch-managed clients                                                                                                                                                                                      |
| Compliant Clients - Prod. Patching       | Total number of compliant clients. A client is considered compliant if the patch compliance of the client is greater than 75%.                                                                                              |
| Non-Compliant Clients - Prod. Patching   | Total number of non-compliant clients. Clients with the patch compliance score less than 75%.                                                                                                                               |
| Compliant Clients - Prod. Patching %     | Percentage of compliant clients. (`Compliant Clients - Production Patching` divided by `Patch Managed Clients` multiplied by `100`)                                                                                      |
| CU Age - Current                         | The count of computers where the installed latest cumulative update's release date falls within the last 45 days.                                                                                                          |
| CU Age - 46-90                          | The count of computers where the installed latest cumulative update's release date falls between 46 to 90 days.                                                                                                           |
| CU Age - 91-135                         | The count of computers where the installed latest cumulative update's release date falls between 91 to 135 days.                                                                                                          |
| CU Age - 136+                           | The number of computers where the release date of the installed latest cumulative update is at least 136 days ago.                                                                                                         |
| CU Score %                              | This scoring system is custom-made, based on the age of the installed cumulative update. A score of 100 is assigned if the cumulative update is less than 45 days old, 75 if it falls between 46 to 90 days, 50 for updates aged between 91 to 135 days, and 25 for updates older than 136 days. The formula used for calculation is as follows: `(CU Age - Current) * 100 + (CU Age - 46-90) * 75 + (CU Age - 91-135) * 50 + (CU Age - 136+) * 25) / Supported CU Eligible Computers` |
| CU Age - Current %                      | Percentage of computers where the installed latest cumulative update's release date falls within the last 45 days. (`CU Age - Current` divided by `Total Eligible Computers - CU` multiplied by `100`)                     |
| CU Age - 46-90 %                        | Percentage of computers where the installed latest cumulative update's release date falls between 46 to 90 days. (`CU Age - 46-90` divided by `Total Eligible Computers - CU` multiplied by `100`)                          |
| CU Age - 91-135 %                       | Percentage of computers where the installed latest cumulative update's release date falls between 91 to 135 days. (`CU Age - 91-135` divided by `Total Eligible Computers - CU` multiplied by `100`)                        |
| CU Age - 136+ %                         | Percentage of computers where the release date of the installed latest cumulative update is at least 136 days ago. (`CU Age - 136+` divided by `Total Eligible Computers - CU` multiplied by `100`)                        |
| Total Eligible Computers - CU            | Total number of supported Windows computers that have been online in Automate within the past 30 days and exist in [pvl_win_latest_installed_cu](<../tables/pvl_win_latest_installed_cu.md>) table.                   |
| Total Eligible Clients - CU              | Total number of clients with supported Windows computers that have been online in Automate within the past 30 days and exist in [pvl_win_latest_installed_cu](<../tables/pvl_win_latest_installed_cu.md>) table.     |
| Compliant Clients - CU                   | Total number of individual clients where `CU Score %` is greater than or equal to 75.                                                                                                                                     |
| Non-Compliant Clients - CU               | Total number of individual clients where `CU Score %` is less than 75.                                                                                                                                                    |
| Compliant Clients - CU %                 | Percentage of compliant clients based on `CU Score %`. (`Compliant Clients - CU` divided by `Total Eligible Clients - CU` multiplied by `100`)                                                                          |

