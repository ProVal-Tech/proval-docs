---
id: '4da626c5-0cec-454e-a517-fc7bf22f80f2'
slug: /4da626c5-0cec-454e-a517-fc7bf22f80f2
title: 'Microsoft - Entra Joined'
title_meta: 'Microsoft - Entra Joined'
keywords: ['azure', 'ad', 'detection', 'joined', 'status']
description: 'This document provides details on detecting Entra joined machines using a specific PowerShell command. It includes the detection string, the comparator used, and the applicable operating systems. Understanding this detection mechanism is essential for managing Azure AD (Entra) environments effectively.'
tags: ['security', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-10-27
---

## Summary

This role assist on detecting Entra joined machines using a specific PowerShell command. It includes the detection string, the comparator used, and the applicable operating systems. Understanding this detection mechanism is essential for managing Azure AD (Entra) environments effectively.

## Dependencies

- [Solution: Intune Enrollment for Entra Joined Devices](/docs/7446369f-7970-49d6-9edd-ac68378165b6)

## Settings

### Role Name 

- `Microsoft - Entra Joined`

### Type

- `PowerShell`

### Sub-Type

- `Role`

### Detection String

- `{%@powershell.exe -nologo -noprofile -command "$ErrorActionPreference='SilentlyContinue';$DSRegStatus = dsregcmd.exe /status;@('False','True')[($DSRegStatus -like '*AzureAdJoined : YES*') -and ($DSRegStatus -like '*EnterpriseJoined : NO*') -and ($DSRegStatus -like '*DomainJoined : NO*')]"@%}`

### Comparator

- `Equals`

### Result

- `True`

### Applicable OS

- `Windows`

## Changelog

### 2026-10-27

- Followed the latest template format and adjusted the name.

### 2025-04-10

- Initial version of the document
