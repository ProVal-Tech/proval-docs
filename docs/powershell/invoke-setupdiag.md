---
id: '43e03fcc-e736-4d19-b231-76403f71c4e2'
slug: /43e03fcc-e736-4d19-b231-76403f71c4e2
title: 'Invoke-SetupDiag'
title_meta: 'Invoke-SetupDiag'
keywords: ['setupdiag', 'diagnostics', 'windows', 'troubleshoot']
description: 'Documentation for the Invoke-SetupDiag command to download and execute SetupDiag.exe for diagnosing Windows setup issues.'
tags: ['update', 'windows']
draft: false
unlisted: false
---

## Description
Download (if necessary) and execute [SetupDiag.exe](https://learn.microsoft.com/en-us/windows/deployment/upgrade/setupdiag) and return the results.

## Requirements
- PowerShell 5+
- Windows OS
- Must be run as an Administrator

Runs SetupDiag.exe and saves the resulting object to a variable.
```powershell
$setupDiagResults = .\Invoke-SetupDiag.ps1
$setupDiagResults.ProfileName
```

## Output
### Log Files
- .\Invoke-SetupDiag-log.txt
- .\Invoke-SetupDiag-error.txt

### Tables
- Invoke-SetupDiag_logs
- Invoke-SetupDiag_data