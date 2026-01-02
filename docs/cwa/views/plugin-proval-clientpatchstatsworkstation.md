---
id: '56f4fea1-0a77-4014-9f2b-b587712ec308'
slug: /56f4fea1-0a77-4014-9f2b-b587712ec308
title: 'plugin_proval_clientpatchstatsworkstation'
title_meta: 'plugin_proval_clientpatchstatsworkstation'
keywords: ['patch', 'compliance', 'audit', 'workstations', 'report', 'cumulative', 'update']
description: 'This view is a specialized version of the general statistics view, filtered strictly for **Workstations** (laptops and desktops). It aggregates patch health data for non-server operating systems only. It is used to generate the headers and "Environment Summary" for the "CU Compliance - Workstations" report, isolating workstation data to provide a clear view of end-user device health.'
tags: ['compliance', 'performance', 'report', 'update']
draft: false
unlisted: false
---

## Purpose

This view is a specialized version of the general statistics view, filtered strictly for **Workstations** (laptops and desktops). It aggregates patch health data for non-server operating systems only. It is used to generate the headers and "Environment Summary" for the "CU Compliance - Workstations" report, isolating workstation data to provide a clear view of end-user device health.

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
| **ClientManagedWorkstations** | Integer | The total number of managed workstations for this client. |
| **ClientPatchesApproved** | Integer | The sum of all patches approved for installation across all workstations. |
| **ClientPatchesInstalled** | Integer | The sum of all patches successfully installed across all workstations. |
| **ClientPatchCompliance** | Decimal | The standard patch success rate (Installed / Approved) specific to workstations. |
| **Client[Type]Approved** | Integer | Columns summarizing the total count of approved patches on workstations by category (Critical, Low, etc.). |
| **Client[Type]Installed** | Integer | Columns summarizing the total count of installed patches on workstations by category. |
| **OutOfSupportCount** | Integer | The count of workstations running an operating system that is End of Life (EOL). |
| **InSupportCount** | Integer | The count of workstations running a supported operating system. |
| **UnknownSupportabilityCount** | Integer | The count of workstations where the OS support status could not be determined. |
| **FullyCompliantCount** | Integer | Count of workstations with a "perfect" score (Last CU installed within 45 days). |
| **45to90DaysCount** | Integer | Count of workstations where the last CU is between 45 and 90 days old. |
| **90to120DaysCount** | Integer | Count of workstations where the last CU is between 90 and 120 days old. |
| **120PlusDaysCount** | Integer | Count of workstations where the last CU is older than 120 days. |
| **UnknownCompliantCount** | Integer | Count of supported workstations where the CU install date is missing or unknown. |
| **CuCompliance** | Decimal | The final weighted "Freshness" score (0-100%) for workstations, calculated using the logic described in the report summary. |
