---
id: '56d0b15a-c899-4bc3-9da5-feeb8c061423'
title: 'plugin_proval_ad_pwd_audit'
title_meta: 'plugin_proval_ad_pwd_audit'
keywords: ['active-directory', 'report', 'weak', 'passwords', 'audit']
description: 'This document outlines the structure and purpose of the Active Directory Weak Passwords Report, detailing the results from the RSM scripts that test for weak credentials in Active Directory environments. It includes information on dependencies, table structures, and SQL commands for creating the necessary database tables.'
tags: ['active-directory', 'database', 'report', 'security']
draft: false
unlisted: false
---

## Purpose

This report is used to hold the results of the [RSM - Active Directory - Agnostic - Test-WeakCredentials](<../../powershell/Test-WeakCredentials.md>) script run by the [RSM - Active Directory - Script - Weak Passwords - AD Test](<../scripts/Weak Passwords - AD Test.md>) automate script for reporting purposes.

## Dependencies

- [RSM - Active Directory - Agnostic - Test-WeakCredentials](<../../powershell/Test-WeakCredentials.md>)
- [RSM - Active Directory - Script - Weak Passwords - AD Test](<../scripts/Weak Passwords - AD Test.md>)

## Tables

### plugin_proval_ad_pwd_audit

| Column                          | Type        | Explanation                                                                                  |
|---------------------------------|-------------|----------------------------------------------------------------------------------------------|
| ComputerID                      | INT(16)     | Holds the Computer ID the script was run on.                                               |
| PW_Reversable_Encryption_Enabled | Binary(1)   | Holds a binary value of 1 or 0; 1 being true, 0 being false for reversible encryption being enabled. |
| Misc_Interactive_Logon_Msg_Enabled | Binary(1) | Holds a binary value of 1 or 0; 1 being true, 0 being false for interactive logon message being enabled. |
| DuplicatePasswordAccounts       | Varchar(8000)| Holds the found items for all accounts that have the same password, grouped by a group number. |
| DuplicatePasswordFormatted      | Varchar(4000)| Holds a formatted string of DuplicatePasswordAccounts above for report formatting purposes. |
| WeakAccountPasswords            | Varchar(8000)| Holds the found items for all accounts that have weak passwords assigned.                   |

| Column       | Type     | Explanation                       |
|--------------|----------|-----------------------------------|
| ComputerID   | Int(16)  | Explanation of what the column is for. |

## SQL

Put the SQL to create the custom table here:

```
CREATE TABLE table_name ...
```




