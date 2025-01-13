---
id: 'cwa-disable-bitlocker'
title: 'Disable BitLocker on Volumes'
title_meta: 'Disable BitLocker on Volumes - A Guide'
keywords: ['bitlocker', 'encryption', 'volume', 'disable', 'unprotect']
description: 'This document provides a comprehensive guide on how to disable BitLocker protection on one or all volumes using a PowerShell script. It includes sample runs, user parameters, and dependencies required for execution.'
tags: ['encryption', 'volume', 'windows', 'security', 'configuration']
draft: false
unlisted: false
---
## Summary

Disable Bitlocker protection on one (or all) volumes.

## Sample Run

![Sample Run Image 1](../../../static/img/Bitlocker---Remove-Volume/image_1.png)

![Sample Run Image 2](../../../static/img/Bitlocker---Remove-Volume/image_2.png)

## Dependencies

- [SEC - Encryption - Agnostic - Unprotect-BitLockerVolume](https://proval.itglue.com/DOC-5078775-8952850)
- PowerShell v5

#### User Parameters

| Name       | Example | Required | Description                                   |
|------------|---------|----------|-----------------------------------------------|
| MountPoint | C:      | Semi     | The volume to un-protect.                    |
| All        | 1       | Semi     | Set to 1 to un-protect all applicable volumes.|

## Process

See process information in the document for [SEC - Encryption - Agnostic - Unprotect-BitLockerVolume](https://proval.itglue.com/DOC-5078775-8952850).

## Output

- Script log
- Local file on computer




