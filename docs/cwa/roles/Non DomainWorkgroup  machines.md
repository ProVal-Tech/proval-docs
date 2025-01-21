---
id: '00bd8c59-9411-4767-8ac7-348b9115fff5'
title: 'Non DomainWorkgroup  machines'
title_meta: 'Non DomainWorkgroup  machines'
keywords: ['detection', 'domain', 'windows', 'status', 'machine']
description: 'This document outlines a PowerShell script that detects machines that are not joined to a domain. It includes a detection string and settings relevant for Windows operating systems, providing a clear method to verify domain status.'
tags: ['security', 'windows']
draft: false
unlisted: false
---

## Summary

This role will detect machines that are not joined to a domain.

## Settings

| Detection String | Comparator | Result | Applicable OS |
|------------------|------------|--------|----------------|
|                  | Equals     | True   | Windows        |

```powershell
$ErrorActionPreference='SilentlyContinue'; $DSRegStatus = dsregcmd.exe /status; @('False','True')[($DSRegStatus -like '*AzureAdJoined : NO*') -and ($DSRegStatus -like '*EnterpriseJoined : NO*') -and ($DSRegStatus -like '*DomainJoined : NO*')]
```




