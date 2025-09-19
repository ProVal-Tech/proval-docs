---
id: '263a9e69-95ea-4189-b4c7-f2be7f074872'
slug: /263a9e69-95ea-4189-b4c7-f2be7f074872
title: 'Windows Secure Boot'
title_meta: 'Windows Secure Boot'
keywords: ['role','audit','secure boot']
description: 'Automate role to detect if a Windows agent has secure boot enabled'
tags: ['windows','uefi','secureboot']
draft: false
unlisted: false
---

## Summary

Automate role to detect if a Windows agent has secure boot enabled. If the Windows Secure Boot role is detected, secure boot is enabled.

## Settings


### Detection String

- {%@powershell.exe -nologo -noprofile -command "Confirm-SecureBootUEFI"@%}

### Comparator

- Equals

### Result

- True

### Applicable OS

- Windows