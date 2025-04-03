---
id: 'd5ea54f9-07c9-443b-acc2-411401cfbe91'
title: 'Winget App Audit'
title_meta: 'Winget App Audit'
keywords: ['audit', 'winget', 'applications', 'report', 'script']
description: 'This document provides an overview of the Get Winget Report script, which audits applications supported by Winget and stores the results in a custom database table. It details the file paths, hash values, sample runs, dependencies, variables, user parameters, and expected output.'
tags: ['database', 'report', 'setup']
draft: false
unlisted: false
---

## Summary

The script conducts an audit of the computer for applications supported by Winget and stores the information in a custom table called [pvl_winget_audit](<../tables/pvl_winget_audit.md>). It retrieves data for both system-level and user-level applications. However, user-level application data will not be retrieved if there are no logged-in users on the computer.

## File Hash

**File Path:** `C:\ProgramData\_automation\Script\get-WingetReport\Get-WingetReport.ps1`  
**File Hash (Sha256):** `F25C9E57E5088BB6CCEEB320A1700063D47CD9EE5FB279FB31E7914A3B49F014`  
**File Hash (MD5):** `69F18BAD33E40B30EAC922BA87DF7752`  

**File Path:** `C:\ProgramData\_automation\Script\get-WingetReport\Manage-OverFlowedVariable.ps1`  
**File Hash (Sha256):** `79B76E6780B61ED657C7FC07C5C0D9A0662165066D5BAD95D9D672513BADD674`  
**File Hash (MD5):** `12B41CDBC04010E638D3FFB8A4BDB1D6`

## Update Notice: 02-April-2025

A new column has been introduced to [pvl_winget_audit](<../tables/pvl_winget_audit.md>) table. To update the table's structure, run the script with the Set_Environment parameter set to 1 after importing it.  
![First Run](../../../static/img/Winget-App-Audit/image_1.png)

## Sample Run

**First Run:** Run the script with the `Set_Environment` parameter set to `1` for the first run to create the [pvl_winget_audit](<../tables/pvl_winget_audit.md>) table used by the solution.  
![First Run](../../../static/img/Winget-App-Audit/image_1.png)

**Regular Execution:**  
![Regular Execution](../../../static/img/Winget-App-Audit/image_2.png)

## Dependencies

- [Execute Script - Winget App Audit](<../monitors/Execute Script - Winget App Audit.md>)
- [OverFlowedVariable - SQL Insert - Execute](<./OverFlowedVariable - SQL Insert - Execute.md>)

## Variables

| Name              | Description                       |
|-------------------|-----------------------------------|
| projectName       | Get-WingetReport                  |
| workingDirectory   | C:/ProgramData/_automation/script/Get-WingetReport |
| scriptPath        | C:/ProgramData/_automation/script/Get-WingetReport/Get-WingetReport.ps1 |
| jsonPath          | C:/ProgramData/_automation/script/Get-WingetReport/Get-WingetReport.json |
| tableName         | [pvl_winget_audit](<../tables/pvl_winget_audit.md>) |

## User Parameters

| Name              | Example | Required                      | Description                                                                                          |
|-------------------|---------|-------------------------------|------------------------------------------------------------------------------------------------------|
| Set_Environment    | 1       | True (for first execution)    | Run the script with the `Set_Environment` parameter set to `1` for the first run to create the [pvl_winget_audit](<../tables/pvl_winget_audit.md>) table used by the solution. |

## Output

- Script log
- Custom table
- Dataview



