---
id: '046378db-8236-470b-b6d3-dc6955a19e9a'
slug: /046378db-8236-470b-b6d3-dc6955a19e9a
title: 'Windows DB Certificate'
title_meta: 'Windows DB Certificate'
keywords: ['role','audit']
description: 'Automate role to detect if a Windows agent has the updated 2023 DB Certificate'
tags: ['windows','uefi','secureboot','certificates']
draft: false
unlisted: false
---

## Summary

Automate role to detect if a Windows agent has the updated 2023 DB Certificate. If the Windows DB Certificate role is detected, the DB certificate is up to date.

## Settings

### Role Name 

- `Windows DB Certificate`

### Type
- `PowerShell`

### Sub-Type
- `BIOS`

### Detection String

- `{%@powershell.exe -nologo -noprofile -command "[System.Text.Encoding]::ASCII.GetString((Get-SecureBootUEFI db).bytes) -match '(Windows|Microsoft) UEFI CA 2023'"@%}`

### Serial Key

- `{%-HKLM\SYSTEM\CurrentControlSet\Control\SecureBoot\Servicing:WindowsUEFICA2023Capable-%}`

### Comparator

- `Equals`

### Result

- `True`

### Applicable OS

- `Windows`