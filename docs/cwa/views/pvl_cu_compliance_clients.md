---
id: 'cwa-cu-compliance-metrics-clients'
title: 'CU Compliance Metrics - Clients'
title_meta: 'CU Compliance Metrics - Clients'
keywords: ['compliance', 'clients', 'sql', 'cumulative', 'updates', 'windows', 'patching']
description: 'This document outlines the SQL query view designed for the CU compliance metrics, focusing on Windows computers with managed patch policies. It details the data structure, dependencies, and the metrics calculated for clients based on their compliance with cumulative updates over a specified timeframe.'
tags: ['database', 'report', 'windows', 'update', 'performance', 'security']
draft: false
unlisted: false
---
## Purpose

The view is designed to store and execute the SQL query utilized by the `CU compliance Metrics - Clients` dataview. It contains data exclusively for the windows computers with managed patch policies, which have been online in Automate within the past 30 days and are part of production patching groups.

The data is grouped by client.

## Dependencies

- [CWM - Automate - Script - MySQL - View - Create (pvl_cu_compliance)](https://proval.itglue.com/DOC-5078775-16192865)
- [CWM - Automate - Custom Table - pvl_win_latest_installed_cu](https://proval.itglue.com/DOC-5078775-12929648)
- [SEC - Windows Patching - Custom Table - plugin_proval_windows_os_support](https://proval.itglue.com/DOC-5078775-7780690)

## Tables

### pvl_cu_compliance_clients

| Column                          | Explanation                                                                                      |
|---------------------------------|--------------------------------------------------------------------------------------------------|
| Clientid                        | Clientid                                                                                         |
| Client                          | Name of the Client.                                                                              |
| Production Computers            | Online Computers (Past 30 Days) Including EOL with Managed patch policy.                       |
| CU Age - Current                | The count of computers where the installed latest Cumulative Update's release date falls within the last 45 days. |
| CU Age - 46-90                 | The count of computers where the installed latest Cumulative Update's release date falls between 46 to 90 days. |
| CU Age - 91-135                | The count of computers where the installed latest Cumulative Update's release date falls between 91 to 135 days. |
| CU Age - 136+                  | The count of computers where the release date of the installed latest Cumulative Update is at least 136 days ago. |
| Eol Count                       | The count of Outdated Machines Ineligible for Cumulative Updates.                              |
| CU Score %                     | This scoring system is custom-made, based on the age of the installed Cumulative Update. A score of 100 is assigned if the Cumulative Update is less than 45 days old, 75 if it falls between 46 to 90 days, 50 for updates aged between 91 to 135 days, 25 for updates older than 136 days, and 0 for EOL machines. The formula used for calculation is as follows:  <br> `(CU Age - Current) * 100 + (CU Age - 46-90) * 75 + (CU Age - 91-135) * 50 + (CU Age - 136+) * 25) / Production Computers` |
| CU Age - Current %             | Percentage of computers where the installed latest Cumulative Update's release date falls within the last 45 days. ( `CU Age - Current` divided by `Production Computers` multiplied by `100`) |
| CU Age - 46-90 %               | Percentage of computers where the installed latest Cumulative Update's release date falls between 46 to 90 days. ( `CU Age - 46-90` divided by `Production Computers` multiplied by `100`) |
| CU Age - 91-135 %              | Percentage of computers where the installed latest Cumulative Update's release date falls between 91 to 135 days. ( `CU Age - 91-135` divided by `Production Computers` multiplied by `100`) |
| CU Age - 136+ %                | Percentage of computers where the release date of the installed latest Cumulative Update is at least 136 days ago. ( `CU Age - 136+` divided by `Production Computers` multiplied by `100`) |
| Eol %                           | Proportion of Outdated Machines Ineligible for Cumulative Updates.                             |
| Total Eligible Computers - CU   | Total number of supported Windows computers which have been online in Automate within the past 30 days and exist in [pvl_win_latest_installed_cu](https://proval.itglue.com/DOC-5078775-12929648) table. |
| Data Missing                    | Total number of supported Windows computers which have been online in Automate within the past 30 days and do not exist in the [pvl_win_latest_installed_cu](https://proval.itglue.com/DOC-5078775-12929648) table. |



