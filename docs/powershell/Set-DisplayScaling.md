---
id: ps-set-displayscaling
title: 'Set-DisplayScaling'
title_meta: 'Set-DisplayScaling Command'
keywords: ['display', 'scaling', 'resolution', 'windows']
description: 'Documentation for the Set-DisplayScaling command to set custom display scaling for Windows machines.'
tags: ['configuration', 'windows']
draft: false
unlisted: false
---

## Description
Set Custom Display Scaling for Windows Machines

## Requirements
Windows OS, Powershell 5

## Usage
- Set the registry path 
- Calculate the display scale value
- Modify the LogPixels and Win8DpiScaling registry keys with the calculated value and enable DPI scaling


Set Custom Display Scaling for Windows Machines

```powershell
.\Set-DisplayScaling.ps1 -Scale '150'
```

## Parameters
| Parameter         | Alias | Required  | Validate Set        | Type  | Description                         |
| ----------------- | ----- | --------- | ------------------- | ----- | ------------------------------------|
| `Scale`           |       | True      | 100 125,150,175,200 | Int32 | Percentage to set the Display scale |

## Output
    .\Set-DisplayScaling-log.txt
    .\Set-DisplayScaling-Error.txt
