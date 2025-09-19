---
id: '22cf1518-f97f-49cd-a95d-7ea1816714a7'
slug: /22cf1518-f97f-49cd-a95d-7ea1816714a7
title: 'Windows KEK Certificate'
title_meta: 'Windows KEK Certificate'
keywords: ['role','audit','secure boot']
description: 'Automate role to detect if a Windows agent has the updated 2023 KEK Certificate'
tags: ['windows','uefi','secureboot','certificates']
draft: false
unlisted: false
---

## Summary

Automate role to detect if a Windows agent has the updated 2023 KEK Certificate. If the Windows KEK Certificate role is detected, then the KEK Certificate is up to date.

## Settings


### Detection String

- {%@powershell.exe -nologo -noprofile -command "[System.Text.Encoding]::ASCII.GetString((Get-SecureBootUEFI KEK).bytes) -match ‘Microsoft Corporation KEK CA 2023’"@%}

### Comparator

- Equals

### Result

- True

### Applicable OS

- Windows