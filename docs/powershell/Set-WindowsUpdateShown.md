---
id: ps-set-windowsupdateshown
title: 'Set-WindowsUpdateShown'
title_meta: 'Set-WindowsUpdateShown Command'
keywords: ['windows', 'update', 'unhide', 'kbarticles']
description: 'Documentation for the Set-WindowsUpdateShown command to manually unhide provided KB articles from Windows Update using the PSWindowsUpdate module.'
tags: ['windows', 'update', 'configuration']
draft: false
unlisted: false
---

## Description
Manually unhides provided KB articles from Windows Update using the PSWindowsUpdate nuget module

## Requirements
None

## Usage
Takes an array of KBArticles and unides them using 
```powershell
Get-WindowsUpdate -Show
Set-WindowsUpdateHidden -KBArticles "KB12345667","KB123456334"
```

## Parameters
| Parameter         | Alias | Required  | Default   | Type      | Description                               |
| ----------------- | ----- | --------- | --------- | --------- | ----------------------------------------- |
| -KBArticles       |       | True      |           | String    |   List of KBArticles to Unhide            |

## Output
Location of output for log, result, and error files.

    .\Set-WindowsUpdateShown-log.txt
    .\Set-WindowsUpdateShown-data.txt
    .\Set-WindowsUpdateShown-error.txt
