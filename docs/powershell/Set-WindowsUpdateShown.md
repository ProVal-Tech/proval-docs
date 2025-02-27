---
id: '4dc89662-df52-441a-ae1f-e7482949f566'
title: 'Set-WindowsUpdateShown'
title_meta: 'Set-WindowsUpdateShown'
keywords: ['windows', 'update', 'unhide', 'kbarticles']
description: 'Documentation for the Set-WindowsUpdateShown command to manually unhide provided KB articles from Windows Update using the PSWindowsUpdate module.'
tags: ['update', 'windows']
draft: false
unlisted: false
---

## Description
The `Set-WindowsUpdateShown` command manually unhides provided KB articles from Windows Update using the PSWindowsUpdate module.

## Requirements
None

## Usage
This command takes an array of KB articles and unhides them using the following PowerShell commands:

```powershell
Get-WindowsUpdate -Show
Set-WindowsUpdateHidden -KBArticles "KB12345667", "KB123456334"
```

## Parameters
| Parameter         | Alias | Required  | Default   | Type      | Description                               |
| ----------------- | ----- | --------- | --------- | --------- | ----------------------------------------- |
| -KBArticles       |       | True      |           | String    | List of KB articles to unhide            |

## Output
The location of output for log, result, and error files:

```
.\Set-WindowsUpdateShown-log.txt
.\Set-WindowsUpdateShown-data.txt
.\Set-WindowsUpdateShown-error.txt
```



