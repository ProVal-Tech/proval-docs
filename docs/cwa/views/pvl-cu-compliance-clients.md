---
id: '965bd890-074b-4217-bba2-e9ddb4a3109d'
slug: /965bd890-074b-4217-bba2-e9ddb4a3109d
title: 'pvl_cu_compliance_clients'
title_meta: 'pvl_cu_compliance_clients'
keywords: ['compliance', 'clients', 'sql', 'cumulative', 'updates', 'windows', 'patching']
description: 'This document outlines the SQL query view designed for the CU compliance metrics, focusing on Windows computers with managed patch policies. It details the data structure, dependencies, and the metrics calculated for clients based on their compliance with cumulative updates over a specified timeframe.'
tags: ['database', 'performance', 'report', 'security', 'update', 'windows']
draft: false
unlisted: false
---

## Purpose

The view is designed to store and execute the SQL query utilized by the `CU Compliance Metrics - Clients` dataview. It contains data exclusively for Windows computers with managed patch policies, which have been online in Automate within the past 30 days and are part of production patching groups.

The data is grouped by client.

## Dependencies

- [CWM - Automate - Script - MySQL - View - Create (pvl_cu_compliance)](/docs/c2b0a6aa-75cd-4711-80b6-de9bcfe8ea33)
- [CWM - Automate - Custom Table - pvl_win_latest_installed_cu](/docs/c03e4def-7efe-4a8b-99e9-d99ac2c65f5a)
- [SEC - Windows Patching - Custom Table - plugin_proval_windows_os_support](/docs/938cd822-f6a3-4ee3-add2-62b407e45622)

## Tables

### pvl_cu_compliance_clients

| Column                          | Explanation                                                                                      |
|---------------------------------|--------------------------------------------------------------------------------------------------|
| Clientid                        | Client ID                                                                                       |
| Client                          | Name of the Client.                                                                             |
| Production Computers            | Online Computers (Past 30 Days) Including EOL with Managed patch policy.                       |
| CU Age - Current                | The count of computers where the installed latest Cumulative Update's release date falls within the last 45 days. |
| CU Age - 46-90                 | The count of computers where the installed latest Cumulative Update's release date falls between 46 to 90 days. |
| CU Age - 91-135                | The count of computers where the installed latest Cumulative Update's release date falls between 91 to 135 days. |
| CU Age - 136+                  | The count of computers where the release date of the installed latest Cumulative Update is at least 136 days ago. |
| EOL Count                       | The count of outdated machines ineligible for cumulative updates.                              |
| CU Score %                     | This scoring system is custom-made, based on the age of the installed Cumulative Update. A score of 100 is assigned if the Cumulative Update is less than 45 days old, 75 if it falls between 46 to 90 days, 50 for updates aged between 91 to 135 days, 25 for updates older than 136 days, and 0 for EOL machines. The formula used for calculation is as follows: `(CU Age - Current) * 100 + (CU Age - 46-90) * 75 + (CU Age - 91-135) * 50 + (CU Age - 136+) * 25) / Production Computers` |
| CU Age - Current %             | Percentage of computers where the installed latest Cumulative Update's release date falls within the last 45 days. (`CU Age - Current` divided by `Production Computers` multiplied by `100`) |
| CU Age - 46-90 %               | Percentage of computers where the installed latest Cumulative Update's release date falls between 46 to 90 days. (`CU Age - 46-90` divided by `Production Computers` multiplied by `100`) |
| CU Age - 91-135 %              | Percentage of computers where the installed latest Cumulative Update's release date falls between 91 to 135 days. (`CU Age - 91-135` divided by `Production Computers` multiplied by `100`) |
| CU Age - 136+ %                | Percentage of computers where the release date of the installed latest Cumulative Update is at least 136 days ago. (`CU Age - 136+` divided by `Production Computers` multiplied by `100`) |
| EOL %                           | Proportion of outdated machines ineligible for cumulative updates.                             |
| Total Eligible Computers - CU   | Total number of supported Windows computers which have been online in Automate within the past 30 days and exist in [pvl_win_latest_installed_cu](/docs/c03e4def-7efe-4a8b-99e9-d99ac2c65f5a) table. |
| Data Missing                    | Total number of supported Windows computers which have been online in Automate within the past 30 days and do not exist in the [pvl_win_latest_installed_cu](/docs/c03e4def-7efe-4a8b-99e9-d99ac2c65f5a) table. |