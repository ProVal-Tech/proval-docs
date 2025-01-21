---
id: 'fbd4b655-562a-4ff1-aea7-be27b9a77421'
title: 'pvl_cu_compliance'
title_meta: 'pvl_cu_compliance'
keywords: ['compliance', 'dataview', 'sql', 'windows', 'patching', 'cumulative', 'update']
description: 'This document outlines the CU Compliance Metrics Dataview designed for Windows computers with managed patch policies. It details the SQL query utilized, dependencies, and the structure of the data stored, focusing on computers that have been online in Automate within the past 30 days and are part of production patching groups.'
tags: ['database', 'report', 'security', 'update', 'windows']
draft: false
unlisted: false
---

## Purpose

The view is designed to store and execute the SQL query utilized by the 'CU Compliance Metrics' dataview. It contains data exclusively for Windows computers with managed patch policies that have been online in Automate within the past 30 days and are part of production patching groups.

## Dependencies

- [CWM - Automate - Script - MySQL - View - Create (pvl_cu_compliance)](<../scripts/MySQL - View - Create (pvl_cu_compliance).md>)
- [CWM - Automate - Custom Table - pvl_win_latest_installed_cu](<../tables/pvl_win_latest_installed_cu.md>)
- [SEC - Windows Patching - Custom Table - plugin_proval_windows_os_support](<../tables/plugin_proval_windows_os_support.md>)

## Tables

#### pvl_patch_compliance

| Column                       | Explanation                                                                                                                       |
|------------------------------|-----------------------------------------------------------------------------------------------------------------------------------|
| Production Computers         | Online computers (past 30 days) including EOL with managed patch policy.                                                         |
| CU Age - Current             | The count of computers where the installed latest Cumulative Update's release date falls within the last 45 days.                |
| CU Age - 46-90              | The count of computers where the installed latest Cumulative Update's release date falls between 46 to 90 days.                  |
| CU Age - 91-135             | The count of computers where the installed latest Cumulative Update's release date falls between 91 to 135 days.                 |
| CU Age - 136+               | The count of computers where the release date of the installed latest Cumulative Update is at least 136 days ago.                |
| EOL Count                   | The count of outdated machines ineligible for Cumulative Updates.                                                                |
| CU Score %                  | This scoring system is custom-made based on the age of the installed Cumulative Update. A score of 100 is assigned if the Cumulative Update is less than 45 days old, 75 if it falls between 46 to 90 days, 50 for updates aged between 91 to 135 days, 25 for updates older than 136 days, and 0 for EOL machines. The formula used for calculation is as follows: `(CU Age - Current) * 100 + (CU Age - 46-90) * 75 + (CU Age - 91-135) * 50 + (CU Age - 136+) * 25) / Production Computers` |
| CU Age - Current %          | Percentage of computers where the installed latest Cumulative Update's release date falls within the last 45 days. (`CU Age - Current` divided by `Production Computers` multiplied by `100`) |
| CU Age - 46-90 %            | Percentage of computers where the installed latest Cumulative Update's release date falls between 46 to 90 days. (`CU Age - 46-90` divided by `Production Computers` multiplied by `100`) |
| CU Age - 91-135 %           | Percentage of computers where the installed latest Cumulative Update's release date falls between 91 to 135 days. (`CU Age - 91-135` divided by `Production Computers` multiplied by `100`) |
| CU Age - 136+ %             | Percentage of computers where the release date of the installed latest Cumulative Update is at least 136 days ago. (`CU Age - 136+` divided by `Production Computers` multiplied by `100`) |
| EOL %                       | Proportion of outdated machines ineligible for Cumulative Updates.                                                               |
| Total Eligible Computers - CU | Total number of supported Windows computers which have been online in Automate within the past 30 days and exist in [pvl_win_latest_installed_cu](<../tables/pvl_win_latest_installed_cu.md>) table. |
| Total Eligible Clients - CU   | Total number of clients with supported Windows computers which have been online in Automate within the past 30 days and exist in [pvl_win_latest_installed_cu](<../tables/pvl_win_latest_installed_cu.md>) table. |
| Compliant Clients - CU       | Total number of individual clients where `CU Score %` is greater than or equal to 75.                                            |
| Non-Compliant Clients - CU    | Total number of individual clients where `CU Score %` is less than 75.                                                          |
| Compliant Clients - CU %     | Percentage of compliant clients based on `CU Score %`. (`Compliant Clients - CU` divided by `Total Eligible Clients - CU` multiplied by `100`) |
| Data Missing                 | Total number of supported Windows computers which have been online in Automate within the past 30 days and do not exist in the [pvl_win_latest_installed_cu](<../tables/pvl_win_latest_installed_cu.md>) table. |



