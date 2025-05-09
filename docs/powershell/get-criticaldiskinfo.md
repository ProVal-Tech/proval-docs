---
id: '880d2a63-b304-40a3-8ec3-1fb13b272fa7'
slug: /880d2a63-b304-40a3-8ec3-1fb13b272fa7
title: 'Get-CriticalDiskInfo'
title_meta: 'Get-CriticalDiskInfo'
keywords: ['disk', 'health', 'monitoring', 'performance']
description: 'Documentation for the Get-CriticalDiskInfo command to gather data pulled from the CrystalDiskInfo application and return it to RMM.'
tags: ['performance', 'report', 'software']
draft: false
unlisted: false
---

## Description
Gathers data pulled from the CrystalDiskInfo application and imports that data into RMM.

## Requirements
- PowerShell V5

## Usage
1. Downloads CrystalDiskInfo.
2. Runs the executable silently.
3. Parses the created `.txt` file.
4. Generates objects based on the output.
5. Returns the objects.

```powershell
$GetDiskInfo = .\Get-CriticalDiskInfo.ps1
```

## Output
Location of output for log, result, and error files:

- `.\\Get-CriticalDiskInfo-log.txt`
- `.\\Get-CriticalDiskInfo-error.txt`
