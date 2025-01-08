---
id: 'cwa-hybrid-ad-joined-machines'
title: 'Detect Hybrid AD Joined Machines'
title_meta: 'Detect Hybrid AD Joined Machines'
keywords: ['hybrid', 'ad', 'joined', 'machines', 'detection']
description: 'This document provides a method for detecting Hybrid Active Directory Joined Machines using a specific PowerShell command. It includes details on the detection string, comparator, result, and applicable operating systems.'
tags: ['active-directory', 'windows', 'configuration', 'detection']
draft: false
unlisted: false
---
## Summary

The role detects Hybrid AD Joined Machines.

## Settings

| Detection String                                                                                                                                                                              | Comparator | Result | Applicable OS |
|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------|--------|----------------|
| `%{@powershell.exe -nologo -noprofile -command "$ErrorActionPreference='SilentlyContinue';$DSRegStatus = dsregcmd.exe /status;@('False','True')[($DSRegStatus -like '*AzureAdJoined : YES*') -and ($DSRegStatus -like '*EnterpriseJoined : NO*') -and ($DSRegStatus -like '*DomainJoined : YES*')]"}%` | Equals     | True   | Windows        |


