---
id: 'fda5f79b-3e83-4561-af2b-2533f41c7443'
title: 'Remove-PUA'
title_meta: 'Remove-PUA'
keywords: ['remove', 'bloatware', 'pua', 'appxpackage', 'appxprovisionedpackage']
description: 'The Remove-PUA.ps1 script is designed to manage and remove bloatware packages on Windows systems.'
tags: ['windows', 'uninstallation', 'application']
draft: false
unlisted: false
---

## Overview

The Remove-PUA.ps1 script is designed to manage and remove bloatware packages on Windows systems. It provides functionality to list and remove pre-installed packages using curated lists from a [trusted repository](https://content.provaltech.com/attachments/potentially-unwanted-applications.json).

 <span style={{color:'red'}}>**EXERCISE EXTREME CAUTION - Removing system components may cause system instability.**</span>

## Requirements

This script requires an internet connection to fetch the list of potentially unwanted applications (PUA) from a remote repository. It also requires the `Strapper` module, which will be installed and updated automatically if not already present.

## Process

The script operates by first setting up the necessary environment and fetching the list of PUAs from a [remote URL](https://content.provaltech.com/attachments/potentially-unwanted-applications.json). It then processes the installed packages on the system and performs actions based on the provided parameters. The script can list installed packages, remove all packages from specified categories, exclude specific packages from removal, or remove specific packages by name.

## Payload Usage

The script is executed using PowerShell and requires specific parameters to perform its operations. Below are examples of how to use the script:

```powershell
# List all installed Appx packages
.\Remove-PUA.ps1 -ListBloatware

# Remove all Microsoft bloatware packages
.\Remove-PUA.ps1 -RemoveAll -Category MsftBloatApps

# Remove all bloatware except Solitaire
.\Remove-PUA.ps1 -RemoveAll -Except 'Microsoft.SolitaireCollection'

# Remove specific packages by name
.\Remove-PUA.ps1 -Remove 'Microsoft.BingWeather', 'Microsoft.GetHelp'
```

## Parameters

| Parameter         | Alias | Required  | Default   | Type      | Description                               |
| ----------------- | ----- | --------- | --------- | --------- | ----------------------------------------- |
| `RemoveAll`       |       | True      |           | Switch    | Remove all packages from specified categories (default: both Microsoft and ThirdParty). |
| `Category`        |       | False     |           | String    | Filter removal to specific categories (`MsftBloatApps`/`ThirdPartyBloatApps`). |
| `Except`          |       | False     |           | String[]  | Exclude specific packages from removal operations. |
| `Remove`          |       | True      |           | String[]  | Remove specific packages by name (bypasses category filters). |
| `ListBloatware`   |       | True      |           | Switch    | List installed packages without making changes. |

## Output

- `.\Remove-PUA-log.txt`
- `.\Remove-PUA-error.txt`

## PUA List

[PUA List](https://content.provaltech.com/attachments/potentially-unwanted-applications.json)
