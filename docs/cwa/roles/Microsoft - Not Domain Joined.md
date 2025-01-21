---
id: '366bdd63-2a07-4b15-a030-933ac05024ff'
title: 'Detection on Non-Domain Machines'
title_meta: 'Detection on Non-Domain Machines'
keywords: ['detection', 'non-domain', 'windows', 'status']
description: 'This document provides a detection method for identifying machines that are not joined to a domain using a PowerShell command. It outlines the settings and detection strings necessary for this identification process.'
tags: ['windows']
draft: false
unlisted: false
---

## Summary

This role is detected on machines that are not joined to a domain.

## Settings

| Detection String | Comparator | Result | Applicable OS |
|------------------|------------|--------|----------------|
| See below        | Equals     | True   | Windows        |

```powershell
powershell.exe -nologo -noprofile -command "$ErrorActionPreference='SilentlyContinue';$DSRegStatus = dsregcmd.exe /status;@('False','True')[($DSRegStatus -like '*AzureAdJoined : NO*') -and ($DSRegStatus -like '*EnterpriseJoined : NO*') -and ($DSRegStatus -like '*DomainJoined : NO*')]"
```
