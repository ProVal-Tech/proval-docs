---
id: 'e0f9ecf2-eac8-4bd1-a269-0dbf7bd0a645'
slug: /e0f9ecf2-eac8-4bd1-a269-0dbf7bd0a645
title: 'Windows 11 Feature Update [Cleanup]'
title_meta: 'Windows 11 Feature Update [Cleanup]'
keywords: ['install', 'feature-update', 'upgrade', 'windows', 'windows-11', 'reboot', 'cleanup']
description: 'This script is an adaptation of the built-in Windows 11 - Cleanup Latest Feature Update script developed by ConnectWise.'
tags: ['installation', 'update', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-07-09
---

## Summary

This script is an adaptation of the built-in `Windows 11 - Cleanup Latest Feature Update` script developed by **ConnectWise**. It is designed to validate a successful upgrade of Windows 11 to the Latest Feature Update.

Additionally, if BitLocker was suspended prior to the upgrade, this script will automatically check the BitLocker status and resume protection on the system drive to ensure the drive remains securely encrypted post-upgrade.

## Sample Run

This script functions as a sub-script for [Install Windows 11 Feature Update [Update Assistant, Reboot]](/docs/50c89c87-2a2c-4ba8-a15b-ac05722a81ec)

## Dependencies

- [Script: Install Windows 11 Feature Update [Update Assistant, Reboot]](/docs/50c89c87-2a2c-4ba8-a15b-ac05722a81ec)
- [Solution : Windows 11 Installation and Feature Update](/docs/00b08a60-f202-42db-9f67-a76ea29289fa)

## Output

- Script Logs

## Changelog

### 2026-07-09

- Added a BitLocker resume check to automatically re-enable BitLocker protection on the system drive if it was left in a suspended state after the upgrade.

### 2026-03-09

- Initial version of the document