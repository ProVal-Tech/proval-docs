---
id: ps-invoke-setupdiag
title: 'Invoke-SetupDiag'
title_meta: 'Invoke-SetupDiag Command'
keywords: ['setupdiag', 'diagnostics', 'windows', 'troubleshoot']
description: 'Documentation for the Invoke-SetupDiag command to download and execute SetupDiag.exe for diagnosing Windows setup issues.'
tags: ['windows', 'update']
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
    .\Invoke-SetupDiag-log.txt
    .\Invoke-SetupDiag-error.txt

### Tables
    Invoke-SetupDiag_logs
    Invoke-SetupDiag_data