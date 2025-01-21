---
id: '710777f0-5c3f-4582-96e9-3beacaf085eb'
title: 'Bitlocker - Remove Volume'
title_meta: 'Bitlocker - Remove Volume'
keywords: ['bitlocker', 'encryption', 'volume', 'disable', 'unprotect']
description: 'This document provides a comprehensive guide on how to disable BitLocker protection on one or all volumes using a PowerShell script. It includes sample runs, user parameters, and dependencies required for execution.'
tags: ['encryption', 'security', 'windows']
draft: false
unlisted: false
---

## Summary

Disable BitLocker protection on one (or all) volumes.

## Sample Run

![Sample Run Image 1](../../../static/img/Bitlocker---Remove-Volume/image_1.png)

![Sample Run Image 2](../../../static/img/Bitlocker---Remove-Volume/image_2.png)

## Dependencies

- [SEC - Encryption - Agnostic - Unprotect-BitLockerVolume](<../../powershell/Unprotect-BitLockerVolume.md>)
- PowerShell v5

### User Parameters

| Name       | Example | Required | Description                                   |
|------------|---------|----------|-----------------------------------------------|
| MountPoint | C:      | Semi     | The volume to unprotect.                     |
| All        | 1       | Semi     | Set to 1 to unprotect all applicable volumes. |

## Process

See process information in the document for [SEC - Encryption - Agnostic - Unprotect-BitLockerVolume](<../../powershell/Unprotect-BitLockerVolume.md>).

## Output

- Script log
- Local file on computer



