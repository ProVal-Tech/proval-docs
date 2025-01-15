---
id: '16fd768b-b679-4ad4-92e3-e58e2fb1ed74'
title: 'Patch Audit Data Overview'
title_meta: 'Patch Audit Data Overview'
keywords: ['patch', 'audit', 'data', 'management', 'windows']
description: 'This document provides an overview of the patch audit data stored in the pvl_patch_config table, including details on discrepancies between the values on computers and the defined settings in the Patch Manager - WUA Settings Validation script. It covers dependencies, column explanations, and format control for monitoring patch compliance.'
tags: ['data', 'management', 'windows', 'configuration', 'report', 'update']
draft: false
unlisted: false
---
## Summary

Displays the patch audit data stored in the [pvl_patch_config](https://proval.itglue.com/DOC-5078775-16399975) table.

A red cell in the dataview indicates that the values available on that computer do not match the settings defined by the [Patch Manager - WUA Settings Validation](https://proval.itglue.com/DOC-5078775-9135620) script.

## Dependencies

- [EPM - Data Collection - Script - Get Patch Config](https://proval.itglue.com/DOC-5078775-16399976)
- [EPM - Data Collection - Custom Table - pvl_patch_config](https://proval.itglue.com/DOC-5078775-16399975)

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
| BranchReadinessLevelAllowedValues  | Possible values for the branch readiness level. Data is gathered from the registry. <br> **Path:** `HKLM://SOFTWARE//Microsoft//PolicyManager//default//Update//BranchReadinessLevel` <br> **Name:** `AllowedValues` <br> **Possible values:** <br> - `16` (Semi-Annual Channel) <br> - `8` (Semi-Annual Channel (Targeted)) <br> - `32` (Release Preview) <br> - `48` (Insider Fast) <br> - `64` (Insider Slow) <br> **Example:** `16, 8, 32, 48, 64` |
| BranchReadinessLevelValue         | The current value of the branch readiness level. Data is gathered from the registry. <br> **Path:** `HKLM://SOFTWARE//Microsoft//PolicyManager//default//Update//BranchReadinessLevel` <br> **Name:** `AllowedValues` <br> **Possible values:** <br> - `16` (Semi-Annual Channel) <br> - `8` (Semi-Annual Channel (Targeted)) <br> - `32` (Release Preview) <br> - `48` (Insider Fast) <br> - `64` (Insider Slow) <br> **Example:** `16` |
| UxSettingsBranchReadinessLevel    | The current branch readiness level as stored in UX Settings. Data is gathered from the registry. <br> **Path:** `HKLM://SOFTWARE//Microsoft//WindowsUpdate//UX//Settings` <br> **Name:** `BranchReadinessLevel` <br> **Possible values:** <br> - `16` (Semi-Annual Channel) <br> - `8` (Semi-Annual Channel (Targeted)) <br> - `32` (Release Preview) <br> - `48` (Insider Fast) <br> - `64` (Insider Slow) <br> **Example:** `16` |
| UxSettingsActiveHoursStart        | The start time for active hours. Data is gathered from the registry. <br> **Path:** `HKLM://SOFTWARE//Microsoft//WindowsUpdate//UX//Settings` <br> **Name:** `ActiveHoursStart` <br> **Possible values:** `0-23` <br> **Example:** `6` |
| UxSettingsActiveHoursEnd          | The end time for active hours. Data is gathered from the registry. <br> **Path:** `HKLM://SOFTWARE//Microsoft//WindowsUpdate//UX//Settings` <br> **Name:** `ActiveHoursEnd` <br> **Possible values:** `0-23` <br> **Example:** `18` |
| WindowsUpdateBranchReadinessLevel  | The current branch readiness level as stored in Windows Update Settings. Data is gathered from the registry. <br> **Path:** `HKLM://SOFTWARE//Policies//Microsoft//Windows//WindowsUpdate` <br> **Name:** `BranchReadinessLevel` <br> **Possible values:** <br> - `16` (Semi-Annual Channel) <br> - `8` (Semi-Annual Channel (Targeted)) <br> - `32` (Release Preview) <br> - `48` (Insider Fast) <br> - `64` (Insider Slow) <br> **Example:** `16` |
| WindowsUpdateDeferFeatureUpdates   | Whether feature updates are deferred. Data is gathered from the registry. <br> **Path:** `HKLM://SOFTWARE//Policies//Microsoft//Windows//WindowsUpdate` <br> **Name:** `DeferFeatureUpdates` <br> **Possible values:** `0 (not deferred), 1 (deferred).` <br> **Example:** `1` |
| WindowsUpdateDeferFeatureUpdatesPeriodInDays | Number of days to defer feature updates. Data is gathered from the registry. <br> **Path:** `HKLM://SOFTWARE//Policies//Microsoft//Windows//WindowsUpdate` <br> **Name:** `DeferFeatureUpdatesPeriodInDays` <br> **Possible values:** `0-365(days).` <br> **Example:** `60` |
| WindowsUpdateDeferQualityUpdates   | Whether quality updates are deferred. Data is gathered from the registry. <br> **Path:** `HKLM://SOFTWARE//Policies//Microsoft//Windows//WindowsUpdate` <br> **Name:** `DeferQualityUpdates` <br> **Possible values:** `0 (not deferred), 1 (deferred).` <br> **Example:** `0` |
| WindowsUpdateDeferQualityUpdatesPeriodInDays | Number of days to defer quality updates. Data is gathered from the registry. <br> **Path:** `HKLM://SOFTWARE//Policies//Microsoft//Windows//WindowsUpdate` <br> **Name:** `DeferQualityUpdatesPeriodInDays` <br> **Possible values:** `0-365(days).` <br> **Example:** `0` |
| UpgradeRestricted                  | Indicates whether Windows upgrades or feature updates are restricted from the registry key for Windows 10 and 11. <br> <br> `0` --> Not restricted <br> `1` --> Restricted <br> Data is gathered from the registry. <br> **Path:** `HKLM://SOFTWARE//Policies//Microsoft//Windows//WindowsUpdate` <br> **Name:** `DisableOSUpgrade` <br> **Possible values:** `0 (upgrade not disabled), 1 (upgrade disabled).` <br> **Example:** `0` <br> **Name:** `TargetReleaseVersion` <br> **Possible values:** `0 (Feature update not restricted), 1 (Feature update disabled).` <br> **Example:** `1` <br> **Path:** `HKLM://SOFTWARE//Microsoft//Windows//WindowsUpdate` <br> **Name:** `TargetReleaseVersionInfo` <br> **Possible values:** `22H2, 23H2, 24H2, etc.` <br> **Example:** `22H2` |
| DataCollectionTime                 | Data Collection Time                                                                          |
| Needs Adjustment                   | If any column mentioned in the Format Control section is colored red.                        |

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






