---
id: 'a9db2857-d76e-4c63-8916-80ed141dc5b5'
slug: /a9db2857-d76e-4c63-8916-80ed141dc5b5
title: 'Import-Log4JTable'
title_meta: 'Import-Log4JTable'
keywords: ['import', 'log4j', 'mysql', 'database']
description: 'Documentation for the Import-Log4JTable command to install and populate a MySQL table with a list of potential Log4Shell affected software.'
tags: ['setup', 'software']
draft: false
unlisted: false
---

## Description
Installs and populates a table in MySQL with a list of potential Log4Shell affected software.

## Requirements
- PowerShell v5
- `mysql.exe` located in any subdirectory of `$env:ProgramFiles\MySQL`
- Must be run directly on the MySQL server

## Usage
Parses the list of applications from a GitHub repo and returns them as PowerShell objects. The objects are then translated into an INSERT statement for MySQL and written to `.\log4jquery.sql`. `mysql.exe` is then invoked to execute the query.

### Example 1
Gets a credential object to authenticate with MySQL and imports the data into the `labtech` database with the table name `plugin_proval_log4jsoftwarelist`.

```powershell
$cred = Get-Credential
.\Import-Log4JTable.ps1 -Credential $cred
```

### Example 2
Creates a credential object to authenticate with MySQL and imports the data into the `labtech2` database with the table name `plugin_mytable_log4j`.

```powershell
$cred = New-Object System.Management.Automation.PSCredential("MyUsername", (ConvertTo-SecureString -String "p@ssw0Rd" -AsPlainText -Force))
.\Import-Log4JTable.ps1 -Credential $cred -Database labtech2 -TableName plugin_mytable_log4j
```

## Parameters
| Parameter         | Required  | Default                             | Type         | Description                                   |
| ----------------- | --------- | ----------------------------------- | ------------ | --------------------------------------------- |
| `Credential`      | True      |                                     | PSCredential | Credential object to authenticate with MySQL. |
| `Database`        | False     | `"labtech"`                         | String       | The database to import the data into.        |
| `TableName`       | False     | `"plugin_proval_log4jsoftwarelist"`| String       | The table to import the data into.           |

## Output
- `.\Import-Log4JTable-log.txt`
- `.\Import-Log4JTable-data.txt`
- `.\Import-Log4JTable-error.txt`
- `.\log4jquery.sql`

