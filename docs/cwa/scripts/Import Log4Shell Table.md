---
id: 'c3342117-53c8-48de-9831-27cd7da77c00'
title: 'Import Log4Shell Table'
title_meta: 'Import Log4Shell Table'
keywords: ['log4shell', 'mysql', 'software', 'installation', 'database']
description: 'This document outlines the installation process for populating a MySQL database with a list of potential Log4Shell affected software. It includes instructions for both on-prem and hosted partners, detailing necessary parameters, dependencies, and expected outputs.'
tags: ['database', 'installation', 'security', 'software']
draft: false
unlisted: false
---

## Summary

This document installs and populates a table in MySQL with a list of potential Log4Shell affected software. On-prem partners must enter a MySQL username and password. Hosted partners will need to set the Hosted parameter to 1. Hosted partners may not have the most up-to-date data compared to on-prem.

## Sample Run

![Sample Run](../../../static/img/Import-Log4Shell-Table/image_1.png)

## Dependencies

- [SEC - Endpoint Protection - Agnostic - Import-Log4JTable](<../../powershell/Import-Log4JTable.md>)
- Must be run on the Automate database server.
- PowerShell v5
- `mysql.exe` located in any subdirectory of `$env:ProgramFiles/MySQL`

#### User Parameters

| Name         | Example    | Required | Description                                                                                               |
|--------------|------------|----------|-----------------------------------------------------------------------------------------------------------|
| SQLUsername   | user_sql   | True     | The username of a SQL user with access to CREATE TABLE and INSERT on the labtech database. Not needed when hosted. |
| SQLPassword   | P@ssw0Rd   | True     | The password of a SQL user with access to CREATE TABLE and INSERT on the labtech database. Not needed when hosted. |
| Hosted        | 1          | False    | Use for hosted partners only. Set to 1 and run against any machine to import a hard-coded version of the table. This will not be frequently updated. |

## Process

See [SEC - Endpoint Protection - Agnostic - Import-Log4JTable](<../../powershell/Import-Log4JTable.md>) for process information.

## Output

- Script log
- Local file on computer
- Dataview
- Custom Table



