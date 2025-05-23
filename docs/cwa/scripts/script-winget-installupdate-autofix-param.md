---
id: '3a2f4004-624d-47c4-a5d0-c3c43e103e25'
slug: /3a2f4004-624d-47c4-a5d0-c3c43e103e25
title: 'Script - Winget - InstallUpdate Autofix,Param'
title_meta: 'Script - Winget - InstallUpdate Autofix,Param'
keywords: ['winget', 'install', 'update', 'application', 'script']
description: 'This document provides a comprehensive overview of the Invoke Winget Processor script, designed to install and update applications available in the Winget package manager. It includes details about the script path, file hash, sample run, variables, and parameters utilized within the script.'
tags: ['installation', 'software', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

This script is created to install and update applications whose packages are available in Winget.  
Please find the application package at the following URL:  
[https://winget.run/search](https://winget.run/search)  

**Script Path:** `C:/ProgramData/_automation/script/Invoke-WingetProcessor/Invoke-WingetProcessor.ps1`  
**File Hash:** `606FC62A7E6AD61143B93A6426BAD11F99C05AAD01BDFA0963F6AC83D6935C73`  

## Sample Run

![Sample Run](../../../static/img/docs/3a2f4004-624d-47c4-a5d0-c3c43e103e25/image_1.webp)  

## Variables

Document the various variables in the script. Delete any section that is not relevant to your script.

| Name       | Description                                                                                             |
|------------|---------------------------------------------------------------------------------------------------------|
| LogContent | Agnostic script 'Invoke-WingetProcessor' informational logging is stored in this variable              |
| ErrorLog   | Agnostic script 'Invoke-WingetProcessor' error logging is stored in this variable                      |

#### Global Parameters

| Name         | Example                     | Required | Description                                                                                                   |
|--------------|-----------------------------|----------|---------------------------------------------------------------------------------------------------------------|
| ProjectName  | Invoke-WingetProcessor      | True     | This determines which project to download and execute by the Automate implementation script                   |

#### User Parameters

| Name      | Example                     | Required | Description                                                                                                   |
|-----------|-----------------------------|----------|---------------------------------------------------------------------------------------------------------------|
| PackageID | Microsoft.RemoteDesktopClient| False    | This is needed to install/update the application                                                              |
| Source    | Winget                      | False    | This is needed to determine whether the application PackageID is in Winget search or Microsoft Store          |

## Output

- Script log