---
id: ps-get-newdomainadmin
title: 'Get-NewDomainAdmin'
title_meta: 'Get-NewDomainAdmin Command'
keywords: ['new', 'domain', 'admin', 'permissions']
description: 'Documentation for the Get-NewDomainAdmin command to get domain users that have been granted elevated permissions since the last run of the script.'
tags: ['active-directory', 'security', 'configuration']
draft: false
unlisted: false
---
## Description
Gets domain users that have been granted elevated permissions since the last run of the script.

## Requirements
- Run as administrator
- PowerShell v5
- Domain Controller


If the script has not been run previously, then the admin data is saved to the table and the script exits. If a new domain admin is detected from a previous run, then it returns the newly elevated users (if any).

```powershell
.\Get-NewDomainAdmin.ps1
```

## Output

## Log Files
    .\Get-NewDomainAdmin-log.txt
    
## Tables
    Get-NewDomainAdmin_log
    Get-NewDomainAdmin_admins
