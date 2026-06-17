---
id: '3e2e3b36-3fc9-479d-977b-8ce3c5663a49'
slug: /3e2e3b36-3fc9-479d-977b-8ce3c5663a49
title: 'Remove-O365License'
title_meta: 'Remove-O365License'
keywords: ['office', 'office 365', 'microsoft 365', 'license', 'removal', 'deactivation']
description: 'Removes all Office 365 / Microsoft 365 license activations from the local device and cleans up cached license files and registry keys.'
tags: ['licensing', 'office365']
draft: false
unlisted: false
last_update:
  date: 2026-06-17
---

## Description

Removes all Office 365 / Microsoft 365 license activations from the local device using `ospp.vbs` and `SoftwareLicensingProduct` WMI. Cleans up cached license files and related registry keys.

Supports scheduling the removal for a future date via the `-Days` or `-Minutes` parameter, which creates a Windows Scheduled Task to run the removal automatically.

## Requirements

- PowerShell 5+
- Run as Administrator
- Access to PowerShell Gallery to install or update the `Strapper` module

## Process

1. Sets TLS policy for secure module and web requests.
2. Ensures the `Strapper` module is installed and up to date, then initializes the Strapper environment.
3. Locates `ospp.vbs` from the local Office installation.
4. Queries `SoftwareLicensingProduct` for all Office license activations (ApplicationID matching `0ff1ce`).
5. Prompts the user for confirmation unless `-Force` is specified.
6. If `-Days` or `-Minutes` is specified, creates a Windows Scheduled Task to run the removal after the specified duration and exits.
7. Removes each product key via `ospp.vbs /unpkey` (preferred) or falls back to the `UninstallProductKey` WMI method.
8. Clears cached KMS host information via `ospp.vbs /remhst`.
9. Removes cached license token files from `%LOCALAPPDATA%` and `%ProgramData%`.
10. Removes Office identity and licensing registry keys under `HKCU:\Software\Microsoft\Office\16.0`.

## Usage

```powershell
.\Remove-O365License.ps1
```

Prompts for confirmation before removing all Office 365 licenses.

```powershell
.\Remove-O365License.ps1 -Force
```

Removes all Office 365 licenses without prompting.

```powershell
.\Remove-O365License.ps1 -Days 30
```

Schedules the license removal to run automatically in 30 days via a Scheduled Task.

```powershell
.\Remove-O365License.ps1 -Minutes 5
```

Schedules the license removal to run automatically in 5 minutes via a Scheduled Task.

## Parameters

| Parameter | Alias | Required | Default | Type   | Description                                                                      |
| --------- | ----- | -------- | ------- | ------ | -------------------------------------------------------------------------------- |
| `Force`   |       | False    | False   | Switch | Skips the confirmation prompt and removes licenses immediately.                  |
| `Days`    |       | False    |         | Int    | Number of days to wait before removing the license via a Scheduled Task (1-365). |
| `Minutes` |       | False    |         | Int    | Number of minutes to wait before removing the license via a Scheduled Task.      |

## Output

`.\Remove-O365License-log.txt`

## Changelog

### 2026-06-17

- Initial version of the document
