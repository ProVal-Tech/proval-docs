---
id: 'f50c0f90-b8e1-4db9-bbb2-88887d5a21af'
slug: /f50c0f90-b8e1-4db9-bbb2-88887d5a21af
title: 'plugin_proval_computerpatchcompliance'
title_meta: 'plugin_proval_computerpatchcompliance'
keywords: ['patch', 'compliance', 'audit', 'workstations', 'report', 'cumulative', 'update']
description: 'This view provides a detailed, per-computer analysis of patch health. It lists every machine in the environment along with its operating system details, end-of-life status, and a calculated "Compliance Score" based on how recently the last monthly Cumulative Update (CU) was installed. It serves as the main data source for detailed report sections like "Device Patch Status."'
tags: ['compliance', 'performance', 'report', 'update']
draft: false
unlisted: false
---

## Purpose

This view provides a detailed, per-computer analysis of patch health. It lists every machine in the environment along with its operating system details, end-of-life status, and a calculated "Compliance Score" based on how recently the last monthly Cumulative Update (CU) was installed. It serves as the main data source for detailed report sections like "Device Patch Status."

## Dependencies

* [Custom Table - plugin_proval_windows_os_support](/docs/938cd822-f6a3-4ee3-add2-62b407e45622)
* [Custom Table - pvl_win_latest_installed_cu](/docs/c03e4def-7efe-4a8b-99e9-d99ac2c65f5a)
* [Script - MySQL - Views for Cumulative Update reports*](/docs/7174f88a-38fc-4e5a-83cc-1f48a6c29526)
* [Solution - Latest Installed Cumulative Update](/docs/991e926f-dcd2-4be3-9f3a-ea7ee9842da2)
* [Solution - CU Compliance Reporting](/docs/6dd7be85-8983-413b-8f56-1426446f25da)

## Tables Used

* `computers`
* `locations`
* `inv_operatingsystem`
* `hotfix`
* `computerpatchcompliancestats`
* `plugin_proval_windows_os_support` (Custom table for OS lifecycle dates)
* `pvl_win_latest_installed_cu` (Custom table for Audit data)

## Details

| Column | Type | Explanation |
| --- | --- | --- |
| **ClientID** | Integer | The ID of the client the computer belongs to. |
| **LocationID** | Integer | The ID of the location the computer belongs to. |
| **LocationName** | String | The name of the location. |
| **LocationArea** | String | The City and State of the location (e.g., "New York, NY"). |
| **ComputerID** | Integer | The unique system ID of the computer. |
| **ComputerName** | String | The hostname of the computer. |
| **ComputerIsServer** | Boolean | Returns `1` if the device is a server, `0` if it is a workstation. |
| **ComputerIsVirtual** | Boolean | Returns `1` if the device is a virtual machine, `0` if it is physical. |
| **ComputerOS** | String | The cleaned name of the operating system (e.g., "Windows 11"). |
| **FullOSName** | String | The complete operating system name usually found in inventory. |
| **ComputerOSFullVersion** | String | The specific build version of the OS (e.g., "10.0.22631"). |
| **PatchTotalApproved** | Integer | Total number of patches approved for this machine. |
| **PatchCompliance** | Decimal | A calculated score (0 to 1.0) representing patch health. 1.0 is fully patched, 0 is End-of-Life. |
| **PatchDateLastPatched** | Date | The date the last hotfix or patch was successfully installed. |
| **PatchDateLastScanned** | Date | The date the Windows Update agent last scanned for updates. |
| **ComputerDateLastContact** | Date | The last time the agent checked in with the server. |
| **Is EOL** | String | Indicates support status: "In Support", "Out of Support" (End of Life), or "Unknown". |
| **SupportEndDate** | Date | The official date when Microsoft stops supporting this specific OS version. |
| **cu** | String | The KB number of the last installed Cumulative Update. |
| **releasedate** | Date | The date Microsoft released the Cumulative Update currently installed on the device. |
| **Patch[Type]InstallCount** | Integer | Various columns showing the count of installed patches by category (Critical, Important, CVSS High, etc.). |
| **Patch[Type]FailedCount** | Integer | Various columns showing the count of failed patches by category. |
