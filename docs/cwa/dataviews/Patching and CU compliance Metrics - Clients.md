---
id: 'd7c2fb39-45e1-482f-b58d-5397cbbec1da'
slug: /d7c2fb39-45e1-482f-b58d-5397cbbec1da
title: 'Patching and CU compliance Metrics - Clients'
title_meta: 'Patching and CU compliance Metrics - Clients'
keywords: ['patch', 'compliance', 'windows', 'update', 'cumulative']
description: 'This document provides a comprehensive overview of the patch and Cumulative Update compliance scores for Windows environments using ConnectWise Automate. It details the metrics for supported Windows computers, including compliance percentages, age of updates, and validation data, grouped by client for better clarity and management.'
tags: ['compliance', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

The dataview is designed to display the patch and Cumulative Update compliance score for the entire environment. It displays data exclusively for supported Windows computers with managed patch policies, which have been online in Automate within the past 30 days and are part of production patching groups.

The data is grouped by client.

## Dependencies

- [CWM - Automate - Custom Table - pvl_win_latest_installed_cu](<../tables/pvl_win_latest_installed_cu.md>)
- [EPM - Windows Update - Script - Get Latest Installed Cumulative Update](<../scripts/Get Latest Installed Cumulative Update.md>)
- [CWM - Automate - Solution - Latest Installed Cumulative Update](<../../solutions/Latest Installed Cumulative Update.md>)
- [SEC - Windows Patching - Custom Table - plugin_proval_windows_os_support](<../tables/plugin_proval_windows_os_support.md>)
- [CWM - Automate - Script - MySQL - Table - Create (plugin_proval_windows_os_support)](<../scripts/MySQL - Table - Create (plugin_proval_windows_os_support).md>)
- [CWM - Automate - View - pvl_patch_cu_compliance_clients](<../views/pvl_patch_cu_compliance_clients.md>)
- [CWM - Automate - Script - MySQL - View - Create (pvl_patch_cu_compliance)](<../scripts/MySQL - View - Create (pvl_patch_cu_compliance).md>)

## Columns

| Column                       | Explanation                                                                                                         |
|------------------------------|---------------------------------------------------------------------------------------------------------------------|
| clientid                     | Client ID                                                                                                          |
| Client                       | Name of the Client                                                                                                |
| Approved Prod. Patches       | Number of approved production patches                                                                              |
| Installed Prod. Patches      | Number of installed production patches                                                                             |
| Failed Prod. Patches         | Number of failed production patches                                                                                |
| Missing Prod. Patches        | Number of missing production patches                                                                               |
| Prod. Patch Compliance %     | Patch compliance of the entire environment for the production patches ( `Number of installed production patches` divided by `Number of approved production patches` multiplied by `100`) |
| Supported Prod. Computers     | Number of active Windows machines with managed patch policies that are part of production patching groups.         |
| CU Age - Current             | The count of computers where the installed latest Cumulative Update's release date falls within the last 45 days. |
| CU Age - 46-90               | The count of computers where the installed latest Cumulative Update's release date falls between 46 and 90 days.   |
| CU Age - 91-135              | The count of computers where the installed latest Cumulative Update's release date falls between 91 and 135 days.  |
| CU Age - 136+                | The number of computers where the release date of the installed latest Cumulative Update is at least 136 days ago. |
| CU Score %                   | This scoring system is custom-made, based on the age of the installed Cumulative Update. A score of 100 is assigned if the Cumulative Update is less than 45 days old, 75 if it falls between 46 and 90 days, 50 for updates aged between 91 and 135 days, and 25 for updates older than 136 days. The formula used for calculation is as follows: `(CU Age - Current) * 100 + (CU Age - 46-90) * 75 + (CU Age - 91-135) * 50 + (CU Age - 136+) * 25) / Supported CU Eligible Computers` |
| CU Age - Current %           | Percentage of computers where the installed latest Cumulative Update's release date falls within the last 45 days. ( `CU Age - Current` divided by `Supported CU Eligible Computers` multiplied by `100`) |
| CU Age - 46-90 %             | Percentage of computers where the installed latest Cumulative Update's release date falls between 46 and 90 days. ( `CU Age - 46-90` divided by `Supported CU Eligible Computers` multiplied by `100`) |
| CU Age - 91-135 %            | Percentage of computers where the installed latest Cumulative Update's release date falls between 91 and 135 days. ( `CU Age - 91-135` divided by `Supported CU Eligible Computers` multiplied by `100`) |
| CU Age - 136+ %              | Percentage of computers where the release date of the installed latest Cumulative Update is at least 136 days ago. ( `CU Age - 136+` divided by `Supported CU Eligible Computers` multiplied by `100`) |
| Total Eligible Computers - CU | Total number of supported Windows computers that have been online in Automate within the past 30 days and exist in [pvl_win_latest_installed_cu](<../tables/pvl_win_latest_installed_cu.md>) table. |
| Validation                   | This is a hidden column that displays the concatenated data for the client in the following format: `Total Wks: X | Total Svrs: X | Wks Online > 30d: X | Online Patch Managed Wks: X | Patch Managed Wks: X | Patch Managed Svrs: X | Wks in CU Table: X | Svrs in CU Table: X | Unsupported Svrs: X | Unsupported Wks: X`.  **Total Wks** - Total number of workstations unfiltered.  **Total Svrs** - Total number of servers unfiltered.  **Wks Online > 30 days** - Workstations that have been online in the past 30 days, including non-patch-managed and EOL systems.  **Online Patch Managed Wks** - Workstations that have been online in the past 30 days and are patch-managed, including EOL systems.  **Patch Managed Wks** - Workstations that are patch managed, including offline agents and EOL systems.  **Patch Managed Svrs** - Servers that are patch managed, including offline agents and EOL systems.  **Wks in CU table** - Workstations that are in the [pvl_win_latest_installed_cu](<../tables/pvl_win_latest_installed_cu.md>) table.  **Svrs in CU table** - Servers that are in the [pvl_win_latest_installed_cu](<../tables/pvl_win_latest_installed_cu.md>) table.  **Unsupported Svrs** - Servers that are EOL.  **Unsupported Wks** - Workstations that are EOL.  This column is independent of the [pvl_patch_cu_compliance_clients](<../views/pvl_patch_cu_compliance_clients.md>) table and displays the count of all machines regardless of them being supported or end of life. |

## Format Control

| Column                     | Colour | Description                      |
|----------------------------|--------|----------------------------------|
| Prod. Patch Compliance %   | Red    | Less than 75                     |
| Prod. Patch Compliance %   | Green  | Greater than or equal to 75      |
| CU Score %                 | Red    | Less than 75                     |
| CU Score %                 | Green  | Greater than or equal to 75      |



