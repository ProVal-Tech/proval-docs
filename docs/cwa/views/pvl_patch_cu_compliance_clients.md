---
id: '2edcd22b-ef08-4877-b5aa-9c9b30c2bcb6'
title: 'Patching and CU Compliance Metrics - Clients'
title_meta: 'Patching and CU Compliance Metrics - Clients Overview'
keywords: ['patching', 'compliance', 'windows', 'metrics', 'clients', 'cumulative', 'update']
description: 'This document outlines the SQL query used for the Patching and CU compliance metrics dataview, focusing on supported Windows computers with managed patch policies. It details the data structure, dependencies, and compliance metrics relevant to production patching groups, providing insights into patching status and cumulative updates across clients.'
tags: ['database', 'performance', 'report', 'update', 'windows']
draft: false
unlisted: false
---

## Purpose

The view is designed to store and execute the SQL query utilized by the 'Patching and CU Compliance Metrics - Clients' dataview. It contains data exclusively for supported Windows computers with managed patch policies that have been online in Automate within the past 30 days and are part of production patching groups.

The data is grouped by client.

## Dependencies

- [CWM - Automate - Custom Table - pvl_win_latest_installed_cu](<../tables/pvl_win_latest_installed_cu.md>)
- [EPM - Windows Update - Script - Get Latest Installed Cumulative Update](https://proval.itglue.com/DOC-5078775-12849478)
- [CWM - Automate - Solution - Latest Installed Cumulative Update](https://proval.itglue.com/DOC-5078775-12850104)
- [SEC - Windows Patching - Custom Table - plugin_proval_windows_os_support](<../tables/plugin_proval_windows_os_support.md>)
- [CWM - Automate - Script - MySQL - Table - Create (plugin_proval_windows_os_support)](<../scripts/MySQL - Table - Create (plugin_proval_windows_os_support).md>)

## Tables

#### pvl_patch_cu_compliance_clients

| Column                         | Explanation                                                                                                                                                                                                 |
|--------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| clientid                       | Client ID                                                                                                                                                                                                     |
| Client                         | Name of the Client                                                                                                                                                                                          |
| Approved Prod. Patches         | Number of approved production patches                                                                                                                                                                       |
| Installed Prod. Patches        | Number of installed production patches                                                                                                                                                                      |
| Failed Prod. Patches           | Number of failed production patches                                                                                                                                                                         |
| Missing Prod. Patches          | Number of missing production patches                                                                                                                                                                        |
| Prod. Patch Compliance %       | Patch compliance of the whole environment for the production patches ( `Number of installed production patches` divided by `Number of approved production patches` multiplied by `100`)                      |
| Supported Prod. Computers      | Number of active Windows machines with managed patch policies that are part of production patching groups.                                                                                                  |
| CU Age - Current               | The count of computers where the installed latest cumulative update's release date falls within the last 45 days.                                                                                         |
| CU Age - 46-90                | The count of computers where the installed latest cumulative update's release date falls between 46 to 90 days.                                                                                          |
| CU Age - 91-135               | The count of computers where the installed latest cumulative update's release date falls between 91 to 135 days.                                                                                         |
| CU Age - 136+                 | The number of computers where the release date of the installed latest cumulative update is at least 136 days ago.                                                                                       |
| CU Score %                    | This scoring system is custom-made, based on the age of the installed cumulative update. A score of 100 is assigned if the cumulative update is less than 45 days old, 75 if it falls between 46 to 90 days, 50 for updates aged between 91 to 135 days, and 25 for updates older than 136 days. The formula used for calculation is as follows: `(CU Age - Current) * 100 + (CU Age - 46-90) * 75 + (CU Age - 91-135) * 50 + (CU Age - 136+) * 25) / Supported CU Eligible Computers` |
| CU Age - Current %            | Percentage of computers where the installed latest cumulative update's release date falls within the last 45 days. ( `CU Age - Current` divided by `Supported CU Eligible Computers` multiplied by `100`) |
| CU Age - 46-90 %              | Percentage of computers where the installed latest cumulative update's release date falls between 46 to 90 days. ( `CU Age - 46-90` divided by `Supported CU Eligible Computers` multiplied by `100`)    |
| CU Age - 91-135 %             | Percentage of computers where the installed latest cumulative update's release date falls between 91 to 135 days. ( `CU Age - 91-135` divided by `Supported CU Eligible Computers` multiplied by `100`)  |
| CU Age - 136+ %               | Percentage of computers where the release date of the installed latest cumulative update is at least 136 days ago. ( `CU Age - 136+` divided by `Supported CU Eligible Computers` multiplied by `100`)  |
| Total Eligible Computers - CU  | Total number of supported Windows computers that have been online in Automate within the past 30 days and exist in the [pvl_win_latest_installed_cu](<../tables/pvl_win_latest_installed_cu.md>) table. |

