---
id: ps-set-displayscaling
title: 'Set-DisplayScaling'
title_meta: 'Set-DisplayScaling Command'
keywords: ['display', 'scaling', 'resolution', 'windows']
description: 'Documentation for the Set-DisplayScaling command to set custom display scaling for Windows machines.'
tags: ['windows']
draft: false
unlisted: false
---

## Description
Set custom display scaling for Windows machines.

## Requirements
- Windows OS
- PowerShell 5

## Usage
1. Set the registry path.
2. Calculate the display scale value.
3. Modify the `LogPixels` and `Win8DpiScaling` registry keys with the calculated value and enable DPI scaling.

To set the custom display scaling, use the following command:

```powershell
.\Set-DisplayScaling.ps1 -Scale '150'
```

## Parameters

| Parameter         | Alias | Required | Validate Set        | Type  | Description                         |
| ----------------- | ----- | -------- | ------------------- | ----- | ------------------------------------|
| `Scale`           |       | True     | 100, 125, 150, 175, 200 | Int32 | Percentage to set the display scale |

## Output
- `.\Set-DisplayScaling-log.txt`
- `.\Set-DisplayScaling-Error.txt`
