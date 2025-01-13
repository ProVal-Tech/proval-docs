---
id: 'cwa-add-recovery-password-bitlocker'
title: 'Add Recovery Password to BitLocker Drive'
title_meta: 'Add Recovery Password to BitLocker Drive'
keywords: ['bitlocker', 'recovery', 'tpm', 'encryption', 'monitor']
description: 'This document describes a script designed to add a recovery password to a BitLocker-enabled drive that lacks a key protector. The script disables the current BitLocker protection, initializes the TPM if necessary, and re-enables the protection with a Recovery Password protector. It is intended for execution as an Autofix script and not for manual use.'
tags: ['bitlocker', 'encryption', 'security', 'monitoring', 'tpm']
draft: false
unlisted: false
---
## Summary

The script is designed to add a recovery password to a drive where BitLocker is enabled but a key protector is not found. It is a copy of the [SEC - Encryption - Script - Bitlocker - Volume - Initialize](https://proval.itglue.com/DOC-5078775-8934308) script with a hardcoded parameter.

It will disable the currently applied BitLocker protection using [SEC - Encryption - Script - Bitlocker - Remove Volume](https://proval.itglue.com/DOC-5078775-8953686) script before re-enabling it with Recovery Password protector.

The script will initialize the TPM if it is not already initialized, but it will not restart the computer. Please note that this script is not intended for manual execution. It is designed to be executed as an Autofix script from the [SEC - Encryption - Internal Monitor - Bitlocker - Missing Key Protectors](https://proval.itglue.com/DOC-5078775-13808695) monitor set.

## Sample Run

![Sample Run](../../../static/img/Bitlocker---Volume---Add-Recovery-Password-Autofix/image_1.png)

## Dependencies

- [SEC - Encryption - Internal Monitor - Bitlocker - Missing Key Protectors](https://proval.itglue.com/DOC-5078775-13808695)
- [SEC - Encryption - Script - Bitlocker - Audit](https://proval.itglue.com/DOC-5078775-8943478)
- [SEC - Encryption - Script - Bitlocker - Remove Volume](https://proval.itglue.com/DOC-5078775-8953686)

## Variables

| Name       | Description                                                         |
|------------|---------------------------------------------------------------------|
| Parameters | -RecoveryPasswordProtector -AllowTPMInit -MountPoint '@MountPoint@' -SkipHardwareTest |

## User Parameter

| Name       | Example | Required                          | Description                           |
|------------|---------|-----------------------------------|---------------------------------------|
| MountPoint | C:      | True (for manual execution only)  | Drive Letter to add Bitlocker Key Protector |

## Output

- Script logs




