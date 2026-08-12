---
id: 'fda5f79b-3e83-4561-af2b-2533f41c7443'
slug: /fda5f79b-3e83-4561-af2b-2533f41c7443
title: 'Remove-PUA'
title_meta: 'Remove-PUA'
keywords: ['remove', 'bloatware', 'pua', 'appxpackage', 'appxprovisionedpackage']
description: 'The Remove-PUA.ps1 script is designed to manage and remove bloatware packages on Windows systems.'
tags: ['windows', 'uninstallation', 'application']
draft: false
unlisted: false
last_update:
  date: 2026-08-12
---

## Overview

The Remove-PUA.ps1 script is designed to manage and remove bloatware packages on Windows systems. It provides functionality to list and remove pre-installed packages using curated lists from a [trusted repository](https://content.provaltech.com/attachments/potentially-unwanted-applications.json).

 <span style={{color:'red'}}>**EXERCISE EXTREME CAUTION - Removing system components may cause system instability.**</span>

## Requirements

This script requires an internet connection to fetch the list of potentially unwanted applications (PUA) from a remote repository. It also requires the `Strapper` module, which will be installed and updated automatically if not already present.

# Process

The script operates by first setting up the necessary environment and fetching the list of PUAs from a [remote URL](https://content.provaltech.com/attachments/potentially-unwanted-applications.json) or the -PuaListSource you provide. It then processes the installed packages on the system and performs actions based on the provided parameters. The script can list installed packages, remove all packages from specified categories, exclude specific packages from removal, or remove specific packages by name.

# Payload Usage

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

# Using a downloadable JSON URL:
.\Remove-PUA.ps1 -PuaListSource 'https://my.cdn.example/pua.json' -ListBloatware

# Using a local JSON file:
.\Remove-PUA.ps1 -PuaListSource 'C:\ProgramData\_Automation\Script\PUA\pua.json' -ListBloatware
```

# Parameters

| Parameter         | Alias | Required  | Default   | Type      | Description                               |
| ----------------- | ----- | --------- | --------- | --------- | ----------------------------------------- |
| `RemoveAll`       |       | True      |           | Switch    | Remove all packages from specified categories (default: both Microsoft and ThirdParty). |
| `Category`        |       | False     |           | String    | Filter removal to specific categories (`MsftBloatApps`/`ThirdPartyBloatApps`). |
| `Except`          |       | False     |           | String[]  | Exclude specific packages from removal operations. |
| `Remove`          |       | True      |           | String[]  | Remove specific packages by name (bypasses category filters). |
| `ListBloatware`   |       | True      |           | Switch    | List installed packages without making changes. |
| `PuaListSource`   |       | False     | [remote URL](https://content.provaltech.com/attachments/potentially-unwanted-applications.json)          | String    | Optional source for an alternate PUA list JSON. When provided, the script will use the specified local JSON file or downloadable URL instead of the default PUA list. | 

**Note** : `The optional JSON file must contain only the following two supported categories: "MsftBloatApps" and "ThirdPartyBloatApps". All bloatware package names must be listed under one of these categories, as the script only processes these two categories. Any other categories included in the JSON file will not be recognized or processed by the script. `

# Output

- `.\Remove-PUA-log.txt`
- `.\Remove-PUA-error.txt`

# PUA List

[PUA List](https://content.provaltech.com/attachments/potentially-unwanted-applications.json)


## Changelog

### 2026-08-12

- Added another parameter `PuaListSource`. Its an Optional source for an alternate PUA list JSON. When provided, the script will use the specified local JSON file or downloadable URL instead of the default PUA list.
- Updated the ListBloatware parameter to list only the packages matching the PUA list provided through the optional JSON file or, if not specified, the default PUA list.

### 2025-04-10

- Initial version of the document
