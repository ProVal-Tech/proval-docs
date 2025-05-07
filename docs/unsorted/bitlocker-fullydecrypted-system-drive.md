---
id: '7bd935f9-13db-4189-b119-276635e4d5cb'
slug: /7bd935f9-13db-4189-b119-276635e4d5cb
title: 'Bitlocker FullyDecrypted - System Drive'
title_meta: 'Bitlocker FullyDecrypted - System Drive'
keywords: ['bitlocker', 'decrypt', 'windows', 'security']
description: 'This document provides a summary and settings for fully decrypting machines using BitLocker. It includes a detection string and applicable operating system information.'
tags: ['bitlocker', 'security', 'windows']
draft: false
unlisted: true
---

## Summary

This document provides information on fully decrypting machines using BitLocker.

## Settings

| Detection String                                                                                                                                       | Comparator | Result        | Applicable OS |
|-------------------------------------------------------------------------------------------------------------------------------------------------------|------------|---------------|----------------|
| `%@powershell.exe -nologo -noprofile -command "Get-BitLockerVolume -MountPoint "C:" | Select-Object -ExpandProperty VolumeStatus"@% | Contains    | FullyDecrypted | Windows        |
