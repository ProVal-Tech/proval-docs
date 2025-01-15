---
id: ps-invoke-uninstallhideupdate
title: 'Invoke-UninstallHideUpdate'
title_meta: 'Invoke-UninstallHideUpdate Command'
keywords: ['uninstall', 'hide', 'update', 'kbarticles']
description: 'Documentation for the Invoke-UninstallHideUpdate command to uninstall and hide specified KB articles using the PSWindowsUpdate module.'
tags: ['update', 'windows', 'configuration']
draft: false
unlisted: false
---
## Description
Uninstalls, then hides, a specified list of KB articles

## Requirements
Requires manual reboot if necesarry

## Usage
Uses PSWindowsUpdate module to hide and uninstall the provided KB



```powershell
C:> ./Invoke-UninstallHideUpdate -KBArticles "KB100000","KB200000"
```

## Parameters
| Parameter         | Alias | Required  | Default   | Type      | Description                               |
| ----------------- | ----- | --------- | --------- | --------- | ----------------------------------------- |
| $KBArticles       |       | True      |           | String    |Accepts a string array seperated by commas |


## Output
Location of output for log, result, and error files.

    .\Invoke-UninstallHideUpdate-log.txt
    .\Invoke-UninstallHideUpdate-error.txt




