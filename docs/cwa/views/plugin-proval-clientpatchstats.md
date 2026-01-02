---
id: 'c553d954-7ded-4f34-ab94-91179848a280'
slug: /c553d954-7ded-4f34-ab94-91179848a280
title: 'plugin_proval_clientpatchstats'
title_meta: 'plugin_proval_clientpatchstats'
keywords: ['patch', 'compliance', 'audit', 'workstations', 'report', 'cumulative', 'update']
description: 'This view aggregates patch data to the Client level. It takes the detailed information from individual computers and summarizes it into high-level statistics. It is used to generate the "Environment Summary" and the overall "CU Compliance" percentage found in the headers of the "All Machines" report.'
tags: ['compliance', 'performance', 'report', 'update']
draft: false
unlisted: false
---

## Purpose

This view aggregates patch data to the Client level. It takes the detailed information from individual computers and summarizes it into high-level statistics. It is used to generate the "Environment Summary" and the overall "CU Compliance" percentage found in the headers of the "All Machines" report.

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
| **ClientManagedComputers** | Integer | The total number of managed agents (servers + workstations) for this client. |
| **ClientManagedServers** | Integer | The total number of servers for this client. |
| **ClientManagedWorkstations** | Integer | The total number of workstations for this client. |
| **ClientPatchesApproved** | Integer | The sum of all patches approved for installation across all devices. |
| **ClientPatchesInstalled** | Integer | The sum of all patches successfully installed across all devices. |
| **ClientPatchCompliance** | Decimal | The standard patch success rate (Installed / Approved). This is different from CU Compliance. |
| **Client[Type]Approved** | Integer | Columns summarizing the total count of approved patches by category (Critical, Low, etc.). |
| **Client[Type]Installed** | Integer | Columns summarizing the total count of installed patches by category. |
| **OutOfSupportCount** | Integer | The count of devices running an operating system that is End of Life (EOL). |
| **InSupportCount** | Integer | The count of devices running a supported operating system. |
| **UnknownSupportabilityCount** | Integer | The count of devices where the OS support status could not be determined. |
| **FullyCompliantCount** | Integer | Count of devices with a "perfect" score (Last CU installed within 45 days). |
| **45to90DaysCount** | Integer | Count of devices where the last CU is between 45 and 90 days old. |
| **90to120DaysCount** | Integer | Count of devices where the last CU is between 90 and 120 days old. |
| **120PlusDaysCount** | Integer | Count of devices where the last CU is older than 120 days. |
| **UnknownCompliantCount** | Integer | Count of supported devices where the CU install date is missing or unknown. |
| **CuCompliance** | Decimal | The final weighted "Freshness" score (0-100%) calculated using the logic described in the report summary. |
