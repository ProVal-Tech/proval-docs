---
id: 'baddd511-d11a-4d0e-be88-cd8c942b5e39'
slug: /baddd511-d11a-4d0e-be88-cd8c942b5e39
title: 'Update-AdobeCC'
title_meta: 'Update-AdobeCC'
keywords: ['adobe', 'creativecloud', 'update', 'software']
description: 'Documentation for the Update-AdobeCC command to list or update products for Adobe Creative Cloud.'
tags: ['adobe', 'installation', 'software', 'update']
draft: false
unlisted: false
---

## Description
Lists or updates products for Adobe Creative Cloud.

## Requirements
Must be run as an administrator.

## Usage
The script takes a parameter to determine if it will run in "List" mode or "Update" mode. It will then download the RemoteUpdateManager.exe from Adobe and run it in the applicable mode.

Lists the available updates for Adobe CC.
```powershell
Update-AdobeCC.ps1 -Mode List
```

Lists and updates the applicable products for Adobe CC.
```powershell
Update-AdobeCC.ps1 -Mode Update
```

## Parameters
| Parameter         | Alias | Required  | Default   | Type      | Description                               |
| ----------------- | ----- | --------- | --------- | --------- | ----------------------------------------- |
| `-Mode`           |       | True      | `"List"`  | String    | The mode that the script will run in.    |

## Output
- .\Update-AdobeCC-log.txt
- .\Update-AdobeCC-data.txt
- .\Update-AdobeCC-error.txt