---
id: 'ps-bitlocker-fully-decrypt-machines'
title: 'BitLocker Fully Decrypt Machines'
title_meta: 'BitLocker Fully Decrypt Machines'
keywords: ['bitlocker', 'decrypt', 'windows', 'security']
description: 'This document provides a summary and settings for fully decrypting machines using BitLocker. It includes a detection string and applicable operating system information.'
tags: ['bitlocker', 'security', 'windows', 'configuration']
draft: true
unlisted: true
---
## Summary

This contains BitLocker fully decrypt machines

## Settings

| Detection String                                                                                                                                       | Comparator | Result        | Applicable OS |
|-------------------------------------------------------------------------------------------------------------------------------------------------------|------------|---------------|----------------|
| %@powershell.exe -nologo -noprofile -command "Get-BitLockerVolume -MountPoint "C:" | Select-Object -ExpandProperty VolumeStatus"@% | Contains    | FullyDecrypted | Windows        |



