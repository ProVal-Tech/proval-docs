---
id: '3ccc8542-1961-4d3f-a54b-4a1bb9a78edd'
slug: /3ccc8542-1961-4d3f-a54b-4a1bb9a78edd
title: 'Install-WindowsUpdates'
title_meta: 'Install-WindowsUpdates'
keywords: ['windows-updates', 'reboot', 'pswindowsupdate', 'kbid', 'category', 'severity', 'drivers']
description: 'This script automates the discovery and installation of Windows Updates on the local computer using the PSWindowsUpdate module. It provides advanced filtering options, logging, and supports automatic or manual reboot handling. The script is designed to simplify patch management by allowing administrators to select updates by category, severity, KB article ID, or title, and to exclude specific drivers or KB articles as needed. By default, preview patches are excluded unless the KBArticleID parameter is used.'
tags: ['windows', 'patching']
draft: false
unlisted: false
---

## Description

This script automates the discovery and installation of Windows Updates on the local computer using the PSWindowsUpdate module. It provides advanced filtering options, logging, and supports automatic or manual reboot handling. The script is designed to simplify patch management by allowing administrators to select updates by category, severity, KB article ID, or title, and to exclude specific drivers or KB articles as needed. By default, preview patches are excluded unless the KBArticleID parameter is used.

## Requirements

- Windows PowerShell 5 or higher
- Administrator privileges
- Internet access to download and update modules
- The script will automatically install or update the required `PSWindowsUpdate` and `Strapper` modules if they are not present

## Payload Usage

Below are usage examples for running the script with different parameter combinations.

### Example 1

Installs all available security updates and allows the system to reboot automatically if required.

```powershell
.\Install-WindowsUpdates.ps1 -Category 'Security Updates' -AllowReboot
```

### Example 2

Installs all critical updates except for drivers.

```powershell
.\Install-WindowsUpdates.ps1 -Severity Critical -ExcludeDrivers
```

### Example 3

Installs all important updates in the 'Feature Packs' and 'Service Packs' categories.

```powershell
.\Install-WindowsUpdates.ps1 -Category 'Feature Packs','Service Packs' -Severity Important
```

### Example 4

Installs updates with the specified KB article IDs.

```powershell
.\Install-WindowsUpdates.ps1 -KBArticleID KB5005565,KB5006670
```

### Example 5

Installs updates with the specified title and allows automatic reboot if required.

```powershell
.\Install-WindowsUpdates.ps1 -Title '2024-06 Cumulative Update' -AllowReboot
```

### Example 6

Installs all driver updates except the one with KB5005565.

```powershell
.\Install-WindowsUpdates.ps1 -Category 'Drivers' -ExcludeKBArticleID KB5005565
```

### Example 7

Installs all critical and important security updates and allows automatic reboot.

```powershell
.\Install-WindowsUpdates.ps1 -Category 'Security Updates' -Severity Critical,Important -AllowReboot
```

### Example 8

Installs all updates and update rollups, excluding drivers.

```powershell
.\Install-WindowsUpdates.ps1 -Category 'Updates','Update Rollups' -ExcludeDrivers
```

### Example 9

Installs all moderate severity updates with 'Net' in the title.

```powershell
.\Install-WindowsUpdates.ps1 -Severity Moderate -Title 'Net'
```

### Example 10

Installs all definition updates except those with the specified KB article IDs and allows automatic reboot.

```powershell
.\Install-WindowsUpdates.ps1 -Category 'Definition Updates' -AllowReboot -ExcludeKBArticleID KB1234567,KB7654321
```

### Example 11

Installs the critical security update with KB5005565 and allows automatic reboot.

```powershell
.\Install-WindowsUpdates.ps1 -Category 'Critical Updates','Security Updates' -Severity Critical -KBArticleID KB5005565 -AllowReboot
```

### Example 12

Installs all available updates except preview patches. No filters are applied, so every applicable update (excluding previews) will be installed.

```powershell
.\Install-WindowsUpdates.ps1
```

### Example 13

Installs all available updates except preview patches and allows the system to reboot automatically if required.

```powershell
.\Install-WindowsUpdates.ps1 -AllowReboot
```

### Example 14

Installs all available updates except preview patches and drivers.

```powershell
.\Install-WindowsUpdates.ps1 -ExcludeDrivers
```

### Example 15

Installs all available updates except preview patches and the updates with the specified KB article IDs.

```powershell
.\Install-WindowsUpdates.ps1 -ExcludeKBArticleID KB1234567,KB7654321
```

### Example 16

Installs all available updates except preview patches, drivers, and the updates with the specified KB article IDs.

```powershell
.\Install-WindowsUpdates.ps1 -ExcludeDrivers -ExcludeKBArticleID KB1234567,KB7654321
```

## Parameters

| Parameter           | Validate Set                                                                                      | Parameter Set Name      | Required | Default | Type      | Description                                                                 |
|---------------------|--------------------------------------------------------------------------------------------------|------------------------|----------|---------|-----------|-----------------------------------------------------------------------------|
| `Category`          | 'Critical Updates', 'Security Updates', 'Update Rollups', 'Feature Packs', 'Service Packs', 'Definition Updates', 'Drivers', 'Tools', 'Updates' | Category               | No       |         | String[]   | One or more update categories to include                                    |
| `Severity`          | 'Critical', 'Important', 'Low', 'Moderate', 'Unspecified'                                        | Severity               | No       |         | String[]   | One or more update severities to include                                    |
| `KBArticleID`       |                                                                                                  | KBArticleID            | No       |         | String[]   | One or more KB article IDs to include                                       |
| `Title`             |                                                                                                  | Title                  | No       |         | String  | Update titles to include                                        |
| `ExcludeDrivers`    |                                                                                                  | All, Severity          | No       | False   | Switch     | Excludes updates in the 'Drivers' category                                  |
| `ExcludeKBArticleID`|                                                                                                  | All, Category, Severity, Title| No       |         | String[]   | One or more KB article IDs to exclude from installation                     |
| `AllowReboot`       |                                                                                                  | All, Category, Severity, KBArticleID, Title | No       | False   | Switch     | Allows the computer to reboot automatically if required after updates        |

## Output

Log and error files are generated in the script's directory:

- .\Install-WindowsUpdates-log.txt  
- .\Install-WindowsUpdates-error.txt
