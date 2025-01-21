---
id: ps-install-perchlogshipper
title: 'Install-PerchLogShipper'
title_meta: 'Install-PerchLogShipper'
keywords: ['install', 'perch', 'logshipper', 'monitoring']
description: 'Documentation for the Install-PerchLogShipper command to install Perch Log Shipper on Windows computers.'
tags: ['installation', 'software', 'windows']
draft: false
unlisted: false
---

## Description
Installs Perch Log Shipper on Windows computers.

## Requirements
- PowerShell v5+
- Installer Token

## Usage
This command installs Perch Log Shipper. A token is necessary to complete the installation.

```powershell
.\Install-PerchLogShipper.ps1 -Token 'hwu76-whduh-hhjdhj'
```

## Parameters
| Parameter         | Alias | Required  | Default   | Type      | Description                                   |
| ----------------- | ----- | --------- | --------- | --------- | ---------------------------------------------- |
| `Token`           |       | True      |           | String    | The token assigned to install the software    |

## Output
- .\Install-PerchLogShipper-log.txt
- .\Install-PerchLogShipper-Error.txt



