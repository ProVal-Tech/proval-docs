---
id: '478c4a27-9722-4175-819d-fd4ed1f481f2'
title: 'Patch and Cumulative Update Compliance Overview'
title_meta: 'Patch and Cumulative Update Compliance Overview'
keywords: ['patch', 'compliance', 'update', 'windows', 'cumulative', 'score']
description: 'This document provides an overview of the patch and Cumulative Update compliance score for supported Windows computers in the environment, detailing the compliance metrics, dependencies, and scoring system used to assess the patch management effectiveness.'
tags: ['compliance', 'update', 'patch', 'windows', 'score']
draft: false
unlisted: false
---
## Summary

The dataview is designed to display the patch and Cumulative Update compliance score for the whole environment. It displays data exclusively for supported Windows computers with managed patch policies, which have been online in Automate within the past 30 days and are part of production patching groups.

## Dependencies

- [CWM - Automate - Custom Table - pvl_win_latest_installed_cu](https://proval.itglue.com/DOC-5078775-12929648)
- [EPM - Windows Update - Script - Get Latest Installed Cumulative Update](https://proval.itglue.com/DOC-5078775-12849478)
- [CWM - Automate - Solution - Latest Installed Cumulative Update](https://proval.itglue.com/DOC-5078775-12850104)
- [SEC - Windows Patching - Custom Table - plugin_proval_windows_os_support](https://proval.itglue.com/DOC-5078775-7780690)
- [CWM - Automate - Script - MySQL - Table - Create (plugin_proval_windows_os_support)](https://proval.itglue.com/DOC-5078775-11564131)
- [CWM - Automate - View - pvl_patch_cu_compliance](https://proval.itglue.com/DOC-5078775-15390697)
- [CWM - Automate - Script - MySQL - View - Create (pvl_patch_cu_compliance)](https://proval.itglue.com/DOC-5078775-15392208)

## Columns

| Column                               | Explanation                                                                                                                                                       |
|--------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Approved Prod. Patches               | Number of approved production patches                                                                                                                            |
| Installed Prod. Patches              | Number of Installed Production Patches                                                                                                                           |
| Failed Prod. Patches                 | Number of Failed Production Patches                                                                                                                                 |
| Missing Prod. Patches                | Number of Missing Production Patches                                                                                                                                 |
| Prod. Patch Compliance %             | Patch Compliance of the whole environment for the production patches ( `Number of installed production patches` divided by `Number of approved production patches` multiplied by `100`) |
| Supported Prod. Computers            | Number of active Windows machines with managed patch policies and are part of production patching groups.                                                          |
| Patch Managed Clients                | Total number of patch-managed clients                                                                                                                                 |
| Compliant Clients - Prod. Patching   | Total number of compliant clients. A client is considered compliant if the patch compliance of the client is greater than 75%.                                      |
| Non Compliant Clients - Prod. Patching| Total number of non-compliant clients. Clients with the patch compliance score less than 75%.                                                                       |
| Compliant Clients - Prod. Patching % | Percentage of the compliant client. (`Compliant Clients - Production Patching` divided by `Patch Managed Clients` multiplied by `100`)                              |
| CU Age - Current                     | The count of computers where the installed latest Cumulative Update's release date falls within the last 45 days.                                                |
| CU Age - 46-90                       | The count of computers where the installed latest Cumulative Update's release date falls between 46 to 90 days.                                                  |
| CU Age - 91-135                      | The count of computers where the installed latest Cumulative Update's release date falls between 91 to 135 days.                                                 |
| CU Age - 136+                        | The number of computers where the release date of the installed latest Cumulative Update is at least 136 days ago.                                               |
| CU Score %                           | This scoring system is custom-made, based on the age of the installed Cumulative Update. A score of 100 is assigned if the Cumulative Update is less than 45 days old, 75 if it falls between 46 to 90 days, 50 for updates aged between 91 to 135 days, and 25 for updates older than 136 days. The formula used for calculation is as follows: <br>`(CU Age - Current) * 100 + (CU Age - 46-90) * 75 + (CU Age - 91-135) * 50 + (CU Age - 136+) * 25) / Supported CU Eligible Computers` |
| CU Age - Current %                  | Percentage of computers where the installed latest Cumulative Update's release date falls within the last 45 days. ( `CU Age - Current` divided by `Total Eligible Computers - CU` multiplied by `100`) |
| CU Age - 46-90 %                    | Percentage of computers where the installed latest Cumulative Update's release date falls between 46 to 90 days. ( `CU Age - 46-90` divided by `Total Eligible Computers - CU` multiplied by `100`) |
| CU Age - 91-135 %                   | Percentage of computers where the installed latest Cumulative Update's release date falls between 91 to 135 days. ( `CU Age - 91-135` divided by `Total Eligible Computers - CU` multiplied by `100`) |
| CU Age - 136+ %                     | Percentage of computers where the release date of the installed latest Cumulative Update is at least 136 days ago. ( `CU Age - 136+` divided by `Total Eligible Computers - CU` multiplied by `100`) |
| Total Eligible Computers - CU        | Total number of supported Windows computers which have been online in Automate within the past 30 days and exist in [pvl_win_latest_installed_cu](https://proval.itglue.com/DOC-5078775-12929648) table. |
| Total Eligible Clients - CU          | Total number of clients with supported Windows computers which have been online in Automate within the past 30 days and exist in [pvl_win_latest_installed_cu](https://proval.itglue.com/DOC-5078775-12929648) table. |
| Compliant Clients - CU               | Total number of individual clients where `CU Score %` is greater than equal to 75.                                                                                 |
| Non-Compliant Clients - CU           | Total number of individual clients where `CU Score %` is less than 75.                                                                                             |
| Compliant Clients - CU %             | Percentage of the compliant client based on `CU Score %`. (`Compliant Clients - CU` divided by `Total Eligible Clients - CU` multiplied by `100`)                |

## Format Control

| Column                               | Colour | Description                          |
|--------------------------------------|--------|--------------------------------------|
| Prod. Patch Compliance %             | Red    | less than 75                         |
| Prod. Patch Compliance %             | Green  | greater than or equal to 75         |
| Compliant Clients - Prod. Patching % | Red    | less than 75                         |
| Compliant Clients - Prod. Patching % | Green  | greater than or equal to 75         |
| CU Score %                           | Red    | less than 75                         |
| CU Score %                           | Green  | greater than or equal to 75         |
| Compliant Clients - CU %             | Red    | less than 75                         |
| Compliant Clients - CU %             | Green  | greater than or equal to 75         |






