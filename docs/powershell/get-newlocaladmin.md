---
id: 'a79af7f1-2ef6-4769-bf7f-b0214e198ac1'
slug: /a79af7f1-2ef6-4769-bf7f-b0214e198ac1
title: 'Get-NewLocalAdmin'
title_meta: 'Get-NewLocalAdmin'
keywords: ['new', 'local', 'admin', 'permissions']
description: 'Documentation for the Get-NewLocalAdmin command to get user accounts that have been granted elevated permissions since the last run of the script.'
tags: ['security', 'windows']
draft: false
unlisted: false
---

## Description

Gets user accounts that have been granted elevated permissions since the last run of the script.

## Requirements

- Run as administrator
- PowerShell v5

If the script has not been run previously, the admin data is saved to the table, and the script exits. If a new admin is detected from a previous run, it returns the newly elevated users (if any).

```powershell
.\Get-NewLocalAdmin.ps1
```

## Output

### Log Files

- `.\Get-NewLocalAdmin-log.txt`

### Tables

- `Get-NewLocalAdmin_log`
- `Get-NewLocalAdmin_admins`

