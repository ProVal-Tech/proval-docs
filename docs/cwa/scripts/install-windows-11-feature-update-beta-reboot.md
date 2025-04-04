---
id: '27f8240b-603a-4af2-b9d9-480a560f8747'
title: 'Install Windows 11 Feature Update [Beta, Reboot]'
title_meta: 'Install Windows 11 Feature Update [Beta, Reboot]'
keywords: ['install', 'feature update', 'upgrade', 'windows', 'windows 11', 'troubleshooting', 'reboot']
description: 'This document outlines the script that automates the installation of the Windows 11 Feature Update. It includes comprehensive pre-checks, maintenance, and validation to ensure a seamless upgrade process.'
tags: ['installation', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

This document describes the Automate implementation of the agnostic script [Install-WindowsFeatureUpdate](../../powershell/Install-Windows11FeatureUpdate.md).

**Important Notes:**

1. The script does not track progress or results. It simply initiates the agnostic script.
2. The computer may restart up to seven times during the process. The agnostic script re-schedules itself through a startup scheduled task to continue the process after each reboot.
3. The `NoReboot` parameter may not reliably prevent reboots. The script attempts to install missing drivers, firmware, and BIOS updates, which may force a restart regardless of this parameter. Use this parameter with caution.
4. It is recommended to initiate the script after business hours and ensure the computer remains connected to AC power. The entire process may take up to six hours in some cases, though it typically completes within two hours.
5. Be aware of [known issues](https://learn.microsoft.com/en-us/windows/release-health/status-windows-11-24h2) with the feature update 24H2 before using the script.

## Requirements

- Windows 11
- Administrative privileges
- Internet connectivity
- At least 64GB of free space on the system drive
- [Windows 11 Compatible Machine](https://www.microsoft.com/en-us/windows/windows-11-specifications)

## Sample Run

![Image1](../../../static/img/install-windows-11-feature-update-beta-reboot/image1.png)

## Dependencies

[Install-WindowsFeatureUpdate](../../powershell/Install-Windows11FeatureUpdate.md).

## User Parameters

| Name       | Example | Required | Description                                                                                     |
|------------|---------|----------|-------------------------------------------------------------------------------------------------|
| `NoReboot` | 1       | False    | If set to `1`, the script will attempt to suppress reboots. However, reboots may still occur due to driver, firmware, or feature update requirements. Use this parameter judiciously. |

## Output

- Script Logs