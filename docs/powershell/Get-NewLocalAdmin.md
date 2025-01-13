---
id: ps-get-newlocaladmin
title: 'Get-NewLocalAdmin'
title_meta: 'Get-NewLocalAdmin Command'
keywords: ['new', 'local', 'admin', 'permissions']
description: 'Documentation for the Get-NewLocalAdmin command to get user accounts that have been granted elevated permissions since the last run of the script.'
tags: ['windows', 'security', 'configuration']
draft: false
unlisted: false
---
## Description
Gets user accounts that have been granted elevated permissions since the last run of the script.

## Requirements
- Run as administrator
- PowerShell v5


If the script has not been run previously, then the admin data is saved to the table and the script exits. If a new admin is detected from a previous run, then it returns the newly elevated users (if any).

```powershell
.\Get-NewLocalAdmin.ps1
```

## Output

### Log Files
    .\Get-NewLocalAdmin-log.txt
    
### Tables
    Get-NewLocalAdmin_log
    Get-NewLocalAdmin_admins

