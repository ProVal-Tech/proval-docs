---
id: 'c9891eb9-3731-4b0d-9882-dcb4a73229eb'
title: 'Patch Configuration Data Table'
title_meta: 'Patch Configuration Data Table for Windows Update Settings'
keywords: ['patch', 'configuration', 'windows', 'update', 'registry']
description: 'This document provides a detailed overview of the patch configuration data table, including the structure, dependencies, and the specific columns used to store Windows Update settings. It outlines the types and explanations of each column, which include service startup types and branch readiness levels, as well as the data collection methodology from the Windows registry.'
tags: ['database', 'security', 'update', 'windows']
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
| BranchReadinessLevelAllowedValues           | Int       | Possible values for the branch readiness level. Data is gathered from the registry.**Path:** `HKLM://SOFTWARE//Microsoft//PolicyManager//default//Update//BranchReadinessLevel`**Name:** `AllowedValues`**Possible values:**- `16` (Semi-Annual Channel)- `8` (Semi-Annual Channel (Targeted))- `32` (Release Preview)- `48` (Insider Fast)- `64` (Insider Slow)**Example:** `16, 8, 32, 48, 64` |
| BranchReadinessLevelValue                   | Int       | The current value of the branch readiness level. Data is gathered from the registry.**Path:** `HKLM://SOFTWARE//Microsoft//PolicyManager//default//Update//BranchReadinessLevel`**Name:** `AllowedValues`**Possible values:**- `16` (Semi-Annual Channel)- `8` (Semi-Annual Channel (Targeted))- `32` (Release Preview)- `48` (Insider Fast)- `64` (Insider Slow)**Example:** `16` |
| UxSettingsBranchReadinessLevel              | Int       | The current branch readiness level as stored in UX Settings.Data is gathered from the registry.**Path:** `HKLM://SOFTWARE//Microsoft//WindowsUpdate//UX//Settings`**Name:** `BranchReadinessLevel`**Possible values:**- `16` (Semi-Annual Channel)- `8` (Semi-Annual Channel (Targeted))- `32` (Release Preview)- `48` (Insider Fast)- `64` (Insider Slow)**Example:** `16` |
| UxSettingsActiveHoursStart                  | Int       | The start time for active hours.Data is gathered from the registry.**Path:** `HKLM://SOFTWARE//Microsoft//WindowsUpdate//UX//Settings`**Name:** `ActiveHoursStart`**Possible values:** `0-23`**Example:** `6` |
| UxSettingsActiveHoursEnd                    | Int       | The end time for active hours.Data is gathered from the registry.**Path:** `HKLM://SOFTWARE//Microsoft//WindowsUpdate//UX//Settings`**Name:** `ActiveHoursEnd`**Possible values:** `0-23`**Example:** `18` |
| WindowsUpdateBranchReadinessLevel           | Int       | The current branch readiness level as stored in Windows Update Settings.Data is gathered from the registry.**Path:** `HKLM://SOFTWARE//Microsoft//Windows//WindowsUpdate`**Name:** `BranchReadinessLevel`**Possible values:**- `16` (Semi-Annual Channel)- `8` (Semi-Annual Channel (Targeted))- `32` (Release Preview)- `48` (Insider Fast)- `64` (Insider Slow)**Example:** `16` |
| WindowsUpdateDeferFeatureUpdates            | Int       | Whether feature updates are deferred.Data is gathered from the registry.**Path:** `HKLM://SOFTWARE//Microsoft//Windows//WindowsUpdate`**Name:** `DeferFeatureUpdates`**Possible values:** `0 (not deferred), 1 (deferred)`**Example:** `1` |
| WindowsUpdateDeferFeatureUpdatesPeriodInDays| Int       | Number of days to defer feature updates.Data is gathered from the registry.**Path:** `HKLM://SOFTWARE//Microsoft//Windows//WindowsUpdate`**Name:** `DeferFeatureUpdatesPeriodInDays`**Possible values:** `0-365(days)`**Example:** `60` |
| WindowsUpdateDeferQualityUpdates            | Int       | Whether quality updates are deferred.Data is gathered from the registry.**Path:** `HKLM://SOFTWARE//Microsoft//Windows//WindowsUpdate`**Name:** `DeferQualityUpdates`**Possible values:** `0 (not deferred), 1 (deferred)`**Example:** `0` |
| WindowsUpdateDeferQualityUpdatesPeriodInDays| Int       | Number of days to defer quality updates.Data is gathered from the registry.**Path:** `HKLM://SOFTWARE//Microsoft//Windows//WindowsUpdate`**Name:** `DeferQualityUpdatesPeriodInDays`**Possible values:** `0-365(days)`**Example:** `0` |
| upgradeRestricted                            | Int       | Indicates whether Windows upgrades or feature updates are restricted from the registry key for Windows 10 and 11.Data is gathered from the registry.**Path:** `HKLM://SOFTWARE//Microsoft//Windows//WindowsUpdate`**Name:** `DisableOSUpgrade`**Possible values:** `0 (upgrade not disabled), 1 (upgrade disabled)`**Example:** `0`**Name:** `TargetReleaseVersion`**Possible values:** `0 (Feature update not restricted), 1 (Feature update disabled)`**Example:** `1`**Path:** `HKLM://SOFTWARE//Microsoft//Windows//WindowsUpdate`**Name:** `TargetReleaseVersionInfo`**Possible values:** `22H2, 23H2, 24H2, etc.`**Example:** `22H2` |
| DataCollectionTime                          | DateTime  | Data Collection Time                                                                                  |











