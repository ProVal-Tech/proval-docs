---
id: '16fd768b-b679-4ad4-92e3-e58e2fb1ed74'
slug: /16fd768b-b679-4ad4-92e3-e58e2fb1ed74
title: 'Patch Config Audit'
title_meta: 'Patch Config Audit'
keywords: ['patch', 'audit', 'data', 'management', 'windows']
description: 'This document provides an overview of the patch audit data stored in the pvl_patch_config table, including details on discrepancies between the values on computers and the defined settings in the Patch Manager - WUA Settings Validation script. It covers dependencies, column explanations, and format control for monitoring patch compliance.'
tags: ['report', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

This document displays the patch audit data stored in the [pvl_patch_config](/docs/c9891eb9-3731-4b0d-9882-dcb4a73229eb) table.

A red cell in the dataview indicates that the values available on that computer do not match the settings defined by the [Patch Manager - WUA Settings Validation](/docs/1f78325c-968a-4a73-ba85-2a18c061063e) script.

## Dependencies

- [EPM - Data Collection - Script - Get Patch Config](/docs/c1b906ec-7aea-41f3-8241-358d3d644900)
- [EPM - Data Collection - Custom Table - pvl_patch_config](/docs/c9891eb9-3731-4b0d-9882-dcb4a73229eb)

## Columns

| Column                             | Explanation                                                                                   |
|------------------------------------|-----------------------------------------------------------------------------------------------|
| clientid                           | clientid (Hidden)                                                                            |
| locationid                         | locationid (Hidden)                                                                          |
| Client                             | Client Name                                                                                  |
| Location                           | Location Name                                                                                |
| Computer                           | Computer Name                                                                                |
| Operating System                   | Operating System                                                                              |
| Last Contact                       | Last Contact with RMM                                                                        |
| Last Logged In User                | Last Logged In User on the Computer                                                           |
| Form Factor                        | Form Factor (Virtual Server/Physical Server/HyperV Host/Laptop/Desktop/Virtual Workstation) |
| Wuauserv                           | Startup type of the `Wuauserv` service.                                                     |
| Cryptsvc                           | Startup type of the `Cryptsvc` service.                                                     |
| Bits                               | Startup type of the `Bits` service.                                                         |
| TrustedInstaller                   | Startup type of the `TrustedInstaller` service.                                             |
| BranchReadinessLevelAllowedValues  | Possible values for the branch readiness level. Data is gathered from the registry.  **Path:** `HKLM://SOFTWARE//Microsoft//PolicyManager//default//Update//BranchReadinessLevel`  **Name:** `AllowedValues`  **Possible values:**  - `16` (Semi-Annual Channel)  - `8` (Semi-Annual Channel (Targeted))  - `32` (Release Preview)  - `48` (Insider Fast)  - `64` (Insider Slow)  **Example:** `16, 8, 32, 48, 64` |
| BranchReadinessLevelValue         | The current value of the branch readiness level. Data is gathered from the registry.  **Path:** `HKLM://SOFTWARE//Microsoft//PolicyManager//default//Update//BranchReadinessLevel`  **Name:** `AllowedValues`  **Possible values:**  - `16` (Semi-Annual Channel)  - `8` (Semi-Annual Channel (Targeted))  - `32` (Release Preview)  - `48` (Insider Fast)  - `64` (Insider Slow)  **Example:** `16` |
| UxSettingsBranchReadinessLevel    | The current branch readiness level as stored in UX Settings. Data is gathered from the registry.  **Path:** `HKLM://SOFTWARE//Microsoft//WindowsUpdate//UX//Settings`  **Name:** `BranchReadinessLevel`  **Possible values:**  - `16` (Semi-Annual Channel)  - `8` (Semi-Annual Channel (Targeted))  - `32` (Release Preview)  - `48` (Insider Fast)  - `64` (Insider Slow)  **Example:** `16` |
| UxSettingsActiveHoursStart        | The start time for active hours. Data is gathered from the registry.  **Path:** `HKLM://SOFTWARE//Microsoft//WindowsUpdate//UX//Settings`  **Name:** `ActiveHoursStart`  **Possible values:** `0-23`  **Example:** `6` |
| UxSettingsActiveHoursEnd          | The end time for active hours. Data is gathered from the registry.  **Path:** `HKLM://SOFTWARE//Microsoft//WindowsUpdate//UX//Settings`  **Name:** `ActiveHoursEnd`  **Possible values:** `0-23`  **Example:** `18` |
| WindowsUpdateBranchReadinessLevel  | The current branch readiness level as stored in Windows Update Settings. Data is gathered from the registry.  **Path:** `HKLM://SOFTWARE//Policies//Microsoft//Windows//WindowsUpdate`  **Name:** `BranchReadinessLevel`  **Possible values:**  - `16` (Semi-Annual Channel)  - `8` (Semi-Annual Channel (Targeted))  - `32` (Release Preview)  - `48` (Insider Fast)  - `64` (Insider Slow)  **Example:** `16` |
| WindowsUpdateDeferFeatureUpdates   | Whether feature updates are deferred. Data is gathered from the registry.  **Path:** `HKLM://SOFTWARE//Policies//Microsoft//Windows//WindowsUpdate`  **Name:** `DeferFeatureUpdates`  **Possible values:** `0 (not deferred), 1 (deferred).`  **Example:** `1` |
| WindowsUpdateDeferFeatureUpdatesPeriodInDays | Number of days to defer feature updates. Data is gathered from the registry.  **Path:** `HKLM://SOFTWARE//Policies//Microsoft//Windows//WindowsUpdate`  **Name:** `DeferFeatureUpdatesPeriodInDays`  **Possible values:** `0-365(days).`  **Example:** `60` |
| WindowsUpdateDeferQualityUpdates   | Whether quality updates are deferred. Data is gathered from the registry.  **Path:** `HKLM://SOFTWARE//Policies//Microsoft//Windows//WindowsUpdate`  **Name:** `DeferQualityUpdates`  **Possible values:** `0 (not deferred), 1 (deferred).`  **Example:** `0` |
| WindowsUpdateDeferQualityUpdatesPeriodInDays | Number of days to defer quality updates. Data is gathered from the registry.  **Path:** `HKLM://SOFTWARE//Policies//Microsoft//Windows//WindowsUpdate`  **Name:** `DeferQualityUpdatesPeriodInDays`  **Possible values:** `0-365(days).`  **Example:** `0` |
| UpgradeRestricted                  | Indicates whether Windows upgrades or feature updates are restricted from the registry key for Windows 10 and 11.   `0` --> Not restricted  `1` --> Restricted  Data is gathered from the registry.  **Path:** `HKLM://SOFTWARE//Policies//Microsoft//Windows//WindowsUpdate`  **Name:** `DisableOSUpgrade`  **Possible values:** `0 (upgrade not disabled), 1 (upgrade disabled).`  **Example:** `0`  **Name:** `TargetReleaseVersion`  **Possible values:** `0 (Feature update not restricted), 1 (Feature update disabled).`  **Example:** `1`  **Path:** `HKLM://SOFTWARE//Microsoft//Windows//WindowsUpdate`  **Name:** `TargetReleaseVersionInfo`  **Possible values:** `22H2, 23H2, 24H2, etc.`  **Example:** `22H2` |
| DataCollectionTime                 | Data Collection Time                                                                          |
| Needs Adjustment                   | Indicates if any column mentioned in the Format Control section is colored red.              |

## Format Control

| Column                             | Operator | Comparator | Color |
|------------------------------------|----------|------------|-------|
| wuauserv                           | Equals   | Disabled   | Red   |
| Cryptsvc                           | Equals   | Disabled   | Red   |
| Bits                               | Equals   | Disabled   | Red   |
| TrustedInstaller                   | Equals   | Disabled   | Red   |
| BranchReadinessLevelAllowedValues  | Not Contains | 16      | Red   |
| BranchReadinessLevelValue         | Not Equal | 16        | Red   |
| UxSettingsBranchReadinessLevel    | Not Equal | 16        | Red   |
| UxSettingsActiveHoursStart        | Not Equal | 5         | Red   |
| UxSettingsActiveHoursEnd          | Not Equal | 23        | Red   |
| WindowsUpdateBranchReadinessLevel  | Not Equal | 16        | Red   |
| WindowsUpdateDeferFeatureUpdates   | Not Equal | 1         | Red   |
| WindowsUpdateDeferFeatureUpdatesPeriodInDays | Not Equal | 365 | Red   |
| WindowsUpdateDeferQualityUpdates   | Not Equal | 0         | Red   |
| WindowsUpdateDeferQualityUpdatesPeriodInDays | Not Equal | 0 | Red   |
| UpgradeDisabled                    | Not Equal | 0         | Red   |
| Needs Adjustment                   | Equals   | 1         | Red   |
