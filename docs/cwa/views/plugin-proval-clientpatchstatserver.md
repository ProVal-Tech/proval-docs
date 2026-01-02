---
id: '9ead43e2-1786-475d-b65b-ee600dc12c72'
slug: /9ead43e2-1786-475d-b65b-ee600dc12c72
title: 'plugin_proval_clientpatchstatsserver'
title_meta: 'plugin_proval_clientpatchstatsserver'
keywords: ['patch', 'compliance', 'audit', 'workstations', 'report', 'cumulative', 'update']
description: 'This view is a specialized version of the general statistics view, filtered strictly for **Servers**. It aggregates patch health data for server operating systems only. It is used to generate the headers and "Environment Summary" for the "CU Compliance - Servers" report, separating server data from workstations to provide a clearer picture of critical infrastructure health.'
tags: ['compliance', 'performance', 'report', 'update']
draft: false
unlisted: false
---

## Purpose

This view is a specialized version of the general statistics view, filtered strictly for **Servers**. It aggregates patch health data for server operating systems only. It is used to generate the headers and "Environment Summary" for the "CU Compliance - Servers" report, separating server data from workstations to provide a clearer picture of critical infrastructure health.

## Dependencies

* [Custom Table - plugin_proval_windows_os_support](/docs/938cd822-f6a3-4ee3-add2-62b407e45622)
* [Custom Table - pvl_win_latest_installed_cu](/docs/c03e4def-7efe-4a8b-99e9-d99ac2c65f5a)
* [View - plugin_proval_computerpatchcompliance](/docs/f50c0f90-b8e1-4db9-bbb2-88887d5a21af)
* [Script - MySQL - Views for Cumulative Update reports*](/docs/7174f88a-38fc-4e5a-83cc-1f48a6c29526)
* [Solution - Latest Installed Cumulative Update](/docs/991e926f-dcd2-4be3-9f3a-ea7ee9842da2)
* [Solution - CU Compliance Reporting](/docs/6dd7be85-8983-413b-8f56-1426446f25da)

## Tables Used

* `computers`
* `inv_operatingsystem`
* `computerpatchcompliancestats`
* `plugin_proval_computerpatchcompliance` (The detail view)

## Details

| Column | Type | Explanation |
| --- | --- | --- |
| **ClientID** | Integer | The unique ID of the client these statistics belong to. |
| **ClientManagedServers** | Integer | The total number of managed servers for this client. |
| **ClientPatchesApproved** | Integer | The sum of all patches approved for installation across all servers. |
| **ClientPatchesInstalled** | Integer | The sum of all patches successfully installed across all servers. |
| **ClientPatchCompliance** | Decimal | The standard patch success rate (Installed / Approved) specific to servers. |
| **Client[Type]Approved** | Integer | Columns summarizing the total count of approved patches on servers by category (Critical, Low, etc.). |
| **Client[Type]Installed** | Integer | Columns summarizing the total count of installed patches on servers by category. |
| **OutOfSupportCount** | Integer | The count of servers running an operating system that is End of Life (EOL). |
| **InSupportCount** | Integer | The count of servers running a supported operating system. |
| **UnknownSupportabilityCount** | Integer | The count of servers where the OS support status could not be determined. |
| **FullyCompliantCount** | Integer | Count of servers with a "perfect" score (Last CU installed within 45 days). |
| **45to90DaysCount** | Integer | Count of servers where the last CU is between 45 and 90 days old. |
| **90to120DaysCount** | Integer | Count of servers where the last CU is between 90 and 120 days old. |
| **120PlusDaysCount** | Integer | Count of servers where the last CU is older than 120 days. |
| **UnknownCompliantCount** | Integer | Count of supported servers where the CU install date is missing or unknown. |
| **CuCompliance** | Decimal | The final weighted "Freshness" score (0-100%) for servers, calculated using the logic described in the report summary. |
