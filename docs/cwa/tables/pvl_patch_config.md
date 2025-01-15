---
id: 'c9891eb9-3731-4b0d-9882-dcb4a73229eb'
title: 'Patch Configuration Data Table'
title_meta: 'Patch Configuration Data Table for Windows Update Settings'
keywords: ['patch', 'configuration', 'windows', 'update', 'registry']
description: 'This document provides a detailed overview of the patch configuration data table, including the structure, dependencies, and the specific columns used to store Windows Update settings. It outlines the types and explanations of each column, which include service startup types and branch readiness levels, as well as the data collection methodology from the Windows registry.'
tags: ['configuration', 'windows', 'update', 'database', 'security']
draft: false
unlisted: false
---
## Purpose

The table stores the patch configuration data fetched by the [Get Patch Config](https://proval.itglue.com/DOC-5078775-16399976) script.

## Dependencies

[EPM - Data Collection - Script - Get Patch Config](https://proval.itglue.com/DOC-5078775-16399976)

## Tables

#### pvl_patch_config

| Column                                      | Type      | Explanation                                                                                          |
|---------------------------------------------|-----------|------------------------------------------------------------------------------------------------------|
| computerid                                  | int       | Computerid                                                                                           |
| Wuauserv                                    | Varchar   | Startup type of the `Wuauserv` service.                                                             |
| Cryptsvc                                    | Varchar   | Startup type of the `Cryptsvc` service.                                                             |
| Bits                                        | Varchar   | Startup type of the `Bits` service.                                                                 |
| TrustedInstaller                            | Varchar   | Startup type of the `TrustedInstaller` service.                                                     |
| BranchReadinessLevelAllowedValues           | Int       | Possible values for the branch readiness level. Data is gathered from the registry.<br>**Path:** `HKLM://SOFTWARE//Microsoft//PolicyManager//default//Update//BranchReadinessLevel`<br>**Name:** `AllowedValues`<br>**Possible values:**<br>- `16` (Semi-Annual Channel)<br>- `8` (Semi-Annual Channel (Targeted))<br>- `32` (Release Preview)<br>- `48` (Insider Fast)<br>- `64` (Insider Slow)<br>**Example:** `16, 8, 32, 48, 64` |
| BranchReadinessLevelValue                   | Int       | The current value of the branch readiness level. Data is gathered from the registry.<br>**Path:** `HKLM://SOFTWARE//Microsoft//PolicyManager//default//Update//BranchReadinessLevel`<br>**Name:** `AllowedValues`<br>**Possible values:**<br>- `16` (Semi-Annual Channel)<br>- `8` (Semi-Annual Channel (Targeted))<br>- `32` (Release Preview)<br>- `48` (Insider Fast)<br>- `64` (Insider Slow)<br>**Example:** `16` |
| UxSettingsBranchReadinessLevel              | Int       | The current branch readiness level as stored in UX Settings.<br>Data is gathered from the registry.<br>**Path:** `HKLM://SOFTWARE//Microsoft//WindowsUpdate//UX//Settings`<br>**Name:** `BranchReadinessLevel`<br>**Possible values:**<br>- `16` (Semi-Annual Channel)<br>- `8` (Semi-Annual Channel (Targeted))<br>- `32` (Release Preview)<br>- `48` (Insider Fast)<br>- `64` (Insider Slow)<br>**Example:** `16` |
| UxSettingsActiveHoursStart                  | Int       | The start time for active hours.<br>Data is gathered from the registry.<br>**Path:** `HKLM://SOFTWARE//Microsoft//WindowsUpdate//UX//Settings`<br>**Name:** `ActiveHoursStart`<br>**Possible values:** `0-23`<br>**Example:** `6` |
| UxSettingsActiveHoursEnd                    | Int       | The end time for active hours.<br>Data is gathered from the registry.<br>**Path:** `HKLM://SOFTWARE//Microsoft//WindowsUpdate//UX//Settings`<br>**Name:** `ActiveHoursEnd`<br>**Possible values:** `0-23`<br>**Example:** `18` |
| WindowsUpdateBranchReadinessLevel           | Int       | The current branch readiness level as stored in Windows Update Settings.<br>Data is gathered from the registry.<br>**Path:** `HKLM://SOFTWARE//Microsoft//Windows//WindowsUpdate`<br>**Name:** `BranchReadinessLevel`<br>**Possible values:**<br>- `16` (Semi-Annual Channel)<br>- `8` (Semi-Annual Channel (Targeted))<br>- `32` (Release Preview)<br>- `48` (Insider Fast)<br>- `64` (Insider Slow)<br>**Example:** `16` |
| WindowsUpdateDeferFeatureUpdates            | Int       | Whether feature updates are deferred.<br>Data is gathered from the registry.<br>**Path:** `HKLM://SOFTWARE//Microsoft//Windows//WindowsUpdate`<br>**Name:** `DeferFeatureUpdates`<br>**Possible values:** `0 (not deferred), 1 (deferred)`<br>**Example:** `1` |
| WindowsUpdateDeferFeatureUpdatesPeriodInDays| Int       | Number of days to defer feature updates.<br>Data is gathered from the registry.<br>**Path:** `HKLM://SOFTWARE//Microsoft//Windows//WindowsUpdate`<br>**Name:** `DeferFeatureUpdatesPeriodInDays`<br>**Possible values:** `0-365(days)`<br>**Example:** `60` |
| WindowsUpdateDeferQualityUpdates            | Int       | Whether quality updates are deferred.<br>Data is gathered from the registry.<br>**Path:** `HKLM://SOFTWARE//Microsoft//Windows//WindowsUpdate`<br>**Name:** `DeferQualityUpdates`<br>**Possible values:** `0 (not deferred), 1 (deferred)`<br>**Example:** `0` |
| WindowsUpdateDeferQualityUpdatesPeriodInDays| Int       | Number of days to defer quality updates.<br>Data is gathered from the registry.<br>**Path:** `HKLM://SOFTWARE//Microsoft//Windows//WindowsUpdate`<br>**Name:** `DeferQualityUpdatesPeriodInDays`<br>**Possible values:** `0-365(days)`<br>**Example:** `0` |
| upgradeRestricted                            | Int       | Indicates whether Windows upgrades or feature updates are restricted from the registry key for Windows 10 and 11.<br>Data is gathered from the registry.<br>**Path:** `HKLM://SOFTWARE//Microsoft//Windows//WindowsUpdate`<br>**Name:** `DisableOSUpgrade`<br>**Possible values:** `0 (upgrade not disabled), 1 (upgrade disabled)`<br>**Example:** `0`<br>**Name:** `TargetReleaseVersion`<br>**Possible values:** `0 (Feature update not restricted), 1 (Feature update disabled)`<br>**Example:** `1`<br>**Path:** `HKLM://SOFTWARE//Microsoft//Windows//WindowsUpdate`<br>**Name:** `TargetReleaseVersionInfo`<br>**Possible values:** `22H2, 23H2, 24H2, etc.`<br>**Example:** `22H2` |
| DataCollectionTime                          | DateTime  | Data Collection Time                                                                                  |






