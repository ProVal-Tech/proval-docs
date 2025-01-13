---
id: ps-install-perchlogshipper
title: 'Install-PerchLogShipper'
title_meta: 'Install-PerchLogShipper Command'
keywords: ['install', 'perch', 'logshipper', 'monitoring']
description: 'Documentation for the Install-PerchLogShipper command to install Perch Log Shipper on Windows computers.'
tags: ['installation', 'software', 'windows']
draft: false
unlisted: false
---
## Description
Installs Perch Log Shipper on the Windows computers.

## Requirements
    Powershell v5+
    Installer Token

## Usage
How does the content operate and accomplish the goal?


Installs Perch Log Shipper. Token is necessary to install it

```powershell
.\Install-PerchLogShipper.ps1 -Token 'hwu76-whduh-hhjdhj'
```

## Parameters
| Parameter         | Alias | Required  | Default   | Type      | Description                                   |
| ----------------- | ----- | --------- | --------- | --------- | ----------------------------------------------|
| `Token`           |       | True      |           | String    |   The Token assigned to install the installer |


## Output
    .\Install-PerchLogShipper-log.txt
    .\Install-PerchLogShipper-Error.txt

