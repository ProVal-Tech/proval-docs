---
id: 'ea84e90b-2585-47e2-82b2-2f8d1519d079'
slug: /ea84e90b-2585-47e2-82b2-2f8d1519d079
title: 'Install Windows 11 Feature Update [Beta, Reboot]'
title_meta: 'Install Windows 11 Feature Update [Beta, Reboot]'
keywords: ['install', 'featureupdate', 'upgrade', 'windows', 'windows11', 'troubleshooting', 'reboot']
description: 'The script automates the installation of the latest Windows 11 Feature Update. It performs comprehensive pre-checks, maintenance, and validation to ensure a smooth upgrade process. The script can restart the computer up to seven times.'
tags: ['installation', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

This document describes the Ninja RMM implementation of the agnostic script [Install-WindowsFeatureUpdate](/docs/837e00a9-4fde-4457-9516-591da7ba4da0).

The script automates the installation of the latest Windows 11 Feature Update. It performs comprehensive pre-checks, maintenance, and validation to ensure a smooth upgrade process.

The script supports both Windows 10 and Windows 11:

- For Windows 10, it attempts to upgrade to the latest available version of Windows 11.  
- For Windows 11, it ensures the system is updated to the latest available feature update.

**Important Notes:**

1. This script creates and schedules a Windows Scheduled Task to run the agnostic script, then exits immediately. Therefore, any log messages shown by the script—other than incompatibility errors—should not be considered the actual cause of failure. However, the upgrade process continues to run in the background on the machine. The progress can be monitored by reviewing the log files located at `C:\ProgramData\_Automation\Script\Install-Windows11FeatureUpdate`
2. The computer may restart up to seven times during the process. The agnostic script re-schedules itself through a startup scheduled task to continue the process after each reboot.
3. It is recommended to initiate the script after business hours and ensure the computer remains connected to AC power. The entire process may take up to six hours in some cases, though it typically completes within two hours.
4. Be aware of [known issues](https://learn.microsoft.com/en-us/windows/release-health/status-windows-11-24h2) with the feature update 24H2 before using the script.

## Security Application Guidance

For optimal performance and to minimize potential interference, it is recommended to disable or set any active security applications (such as antivirus, endpoint protection, or EDR tools) to "learning" or "detect-only" mode before executing the script.

This helps ensure that the update process runs smoothly without being blocked or slowed down by real-time protection mechanisms. Once the update is complete, security settings can be reverted to their original state.

## Requirements

- Windows 10 or Windows 11
- Administrative privileges
- Internet connectivity
- At least 64GB of free space on the system drive
- [Windows 11 Compatible Machine](https://www.microsoft.com/en-us/windows/windows-11-specifications)
- [Windows 11 upgrade requirements](https://learn.microsoft.com/en-us/windows/whats-new/windows-11-requirements)

## Sample Run

![Image1](../../../static/img/docs/ea84e90b-2585-47e2-82b2-2f8d1519d079/image1.webp)

## Dependencies

[Install-Windows11FeatureUpdate](/docs/837e00a9-4fde-4457-9516-591da7ba4da0)

## Automation Setup/Import

[Automation Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/scripts/install-windows-11-feature-update-beta-reboot.ps1)

## Output

- Activity Details
- C:\ProgramData\_Automation\Script\Install-Windows11FeatureUpdate\Install-Windows11FeatureUpdate-log.txt
