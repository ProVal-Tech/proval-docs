---
id: 'cwa_patch_compliance_overview'
title: 'Patch Compliance Overview for Windows Environment'
title_meta: 'Patch Compliance Overview for Windows Environment'
keywords: ['patch', 'compliance', 'windows', 'update', 'cumulative']
description: 'This document provides a comprehensive overview of the patch and Cumulative Update compliance scores for Windows environments using ConnectWise Automate. It details the metrics for supported Windows computers, including compliance percentages, age of updates, and validation data, grouped by client for better clarity and management.'
tags: ['compliance', 'windows', 'update', 'cumulative', 'management']
draft: false
unlisted: false
---
## Summary

The dataview is designed to display the patch and Cumulative Update compliance score for the whole environment. It displays data exclusively for supported Windows computers with managed patch policies, which have been online in Automate within the past 30 days and are part of production patching groups.

The data is grouped by client.

## Dependencies

- [CWM - Automate - Custom Table - pvl_win_latest_installed_cu](https://proval.itglue.com/DOC-5078775-12929648)
- [EPM - Windows Update - Script - Get Latest Installed Cumulative Update](https://proval.itglue.com/DOC-5078775-12849478)
- [CWM - Automate - Solution - Latest Installed Cumulative Update](https://proval.itglue.com/DOC-5078775-12850104)
- [SEC - Windows Patching - Custom Table - plugin_proval_windows_os_support](https://proval.itglue.com/DOC-5078775-7780690)
- [CWM - Automate - Script - MySQL - Table - Create (plugin_proval_windows_os_support)](https://proval.itglue.com/DOC-5078775-11564131)
- [CWM - Automate - View - pvl_patch_cu_compliance_clients](https://proval.itglue.com/DOC-5078775-15390696)
- [CWM - Automate - Script - MySQL - View - Create (pvl_patch_cu_compliance)](https://proval.itglue.com/DOC-5078775-15392208)

## Columns

| Column                       | Explanation                                                                                                         |
|------------------------------|---------------------------------------------------------------------------------------------------------------------|
| clientid                     | Clientid                                                                                                           |
| Client                       | Name of the Client                                                                                                |
| Approved Prod. Patches       | Number of approved production patches                                                                              |
| Installed Prod. Patches      | Number of Installed Production Patches                                                                             |
| Failed Prod. Patches         | Number of Failed Production Patches                                                                                |
| Missing Prod. Patches        | Number of Missing Production Patches                                                                               |
| Prod. Patch Compliance %     | Patch Compliance of the whole environment for the production patches ( `Number of installed production patches` divided by `Number of approved production patches` multiplied by `100`) |
| Supported Prod. Computers     | Number of active Windows machines with managed patch policies and are part of production patching groups.         |
| CU Age - Current             | The count of computers where the installed latest Cumulative Update's release date falls within the last 45 days. |
| CU Age - 46-90               | The count of computers where the installed latest Cumulative Update's release date falls between 46 to 90 days.    |
| CU Age - 91-135              | The count of computers where the installed latest Cumulative Update's release date falls between 91 to 135 days.   |
| CU Age - 136+                | The number of computers where the release date of the installed latest Cumulative Update is at least 136 days ago. |
| CU Score %                   | This scoring system is custom-made, based on the age of the installed Cumulative Update. A score of 100 is assigned if the Cumulative Update is less than 45 days old, 75 if it falls between 46 to 90 days, 50 for updates aged between 91 to 135 days, and 25 for updates older than 136 days. The formula used for calculation is as follows: <br> `(CU Age - Current) * 100 + (CU Age - 46-90) * 75 + (CU Age - 91-135) * 50 + (CU Age - 136+) * 25) / Supported CU Eligible Computers` |
| CU Age - Current %           | Percentage of computers where the installed latest Cumulative Update's release date falls within the last 45 days. ( `CU Age - Current` divided by `Supported CU Eligible Computers` multiplied by `100`) |
| CU Age - 46-90 %             | Percentage of computers where the installed latest Cumulative Update's release date falls between 46 to 90 days. ( `CU Age - 46-90` divided by `Supported CU Eligible Computers` multiplied by `100`) |
| CU Age - 91-135 %            | Percentage of computers where the installed latest Cumulative Update's release date falls between 91 to 135 days. ( `CU Age - 91-135` divided by `Supported CU Eligible Computers` multiplied by `100`) |
| CU Age - 136+ %              | Percentage of computers where the release date of the installed latest Cumulative Update is at least 136 days ago. ( `CU Age - 136+` divided by `Supported CU Eligible Computers` multiplied by `100`) |
| Total Eligible Computers - CU | Total number of supported Windows computers which have been online in Automate within the past 30 days and exist in [pvl_win_latest_installed_cu](https://proval.itglue.com/DOC-5078775-12929648) table. |
| Validation                   | This is a hidden column which displays the concatenated data for the client in the following format: `<code>Total Wks: X | Total Svrs: X | Wks Online > 30d: X | Online Patch Managed Wks: X | Patch Managed Wks: X | Patch Managed Svrs: X | Wks in CU Table: X | Svrs in CU Table: X | Unsupported Svrs: X | Unsupported Wks: X</code>` <br> **Total Wks** - Total number of workstations unfiltered. <br> **Total Svrs** - Total number of servers unfiltered. <br> **Wks Online > 30 days** - Workstations that have been online in the past 30 days, including non-patch-managed and EOL systems. <br> **Online Patch Managed Wks** - Workstations that have been online in the past 30 days and are patch-managed, including EOL systems. <br> **Patch Managed Wks** - Workstations that are patch managed, including offline agents and EOL systems. <br> **Patch Managed Svrs** - Servers that are patch managed, including offline agents and EOL systems. <br> **Wks in CU table** - Workstations that are in the [pvl_win_latest_installed_cu](https://proval.itglue.com/DOC-5078775-12929648) table. <br> **Svrs in CU table** - Servers that are in the [pvl_win_latest_installed_cu](https://proval.itglue.com/DOC-5078775-12929648) table. <br> **Unsupported Svrs** - Servers that are EOL. <br> **Unsupported Wks** - Workstations that are EOL. <br> This column is independent of the [pvl_patch_cu_compliance_clients](https://proval.itglue.com/DOC-5078775-15390696) table and displays the count of all machines regardless of them being supported or end of life. |

## Format Control

| Column                     | Colour | Description                      |
|----------------------------|--------|----------------------------------|
| Prod. Patch Compliance %   | Red    | less than 75                     |
| Prod. Patch Compliance %   | Green  | greater than or equal to 75      |
| CU Score %                 | Red    | less than 75                     |
| CU Score %                 | Green  | greater than or equal to 75      |


