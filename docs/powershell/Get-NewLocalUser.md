---
id: ps-get-newlocaluser
title: 'Get-NewLocalUser'
title_meta: 'Get-NewLocalUser Command'
keywords: ['new', 'local', 'user', 'account']
description: 'Documentation for the Get-NewLocalUser command to get newly added local users since the last run of the script.'
tags: ['windows', 'security', 'configuration']
draft: false
unlisted: false
---
## Description
Gets newly added users since the last run of the script.

## Requirements
- Run as administrator
- PowerShell v5


If the script has not been run previously, then the user data is saved to the table and the script exits. If a new user is detected from a previous run, then it returns the new users (if any).

```powershell
.\Get-NewLocalUser.ps1
```

## Output

### Log Files
    .\Get-NewLocalUser-log.txt
    
### Tables
    Get-NewLocalUser_log
    Get-NewLocalUser_users

