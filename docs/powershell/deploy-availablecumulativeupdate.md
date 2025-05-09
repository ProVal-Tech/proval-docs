---
id: '080f6d84-4eaf-40ed-8305-1d5d9341dcb0'
slug: /080f6d84-4eaf-40ed-8305-1d5d9341dcb0
title: 'Deploy-AvailableCumulativeUpdate'
title_meta: 'Deploy-AvailableCumulativeUpdate'
keywords: ['cumulative', 'update', 'windows', 'patch', 'reboot', 'repair']
description: 'Automates the process of ensuring a Windows system is running the latest cumulative update (CU).'
tags: ['update', 'windows']
draft: false
unlisted: false
---

## Overview

The `Deploy-AvailableCumulativeUpdate.ps1` script automates the process of ensuring a Windows system is running the latest cumulative update (CU). It performs compatibility checks, repairs Windows Update functionality if necessary, and installs the latest CU while adhering to support lifecycle policies. This script is particularly useful for maintaining system security and stability by keeping Windows systems up-to-date.

## Requirements

- **PowerShell Version**: Requires PowerShell 5.0 or later.
- **Operating System**: Windows 10 or higher.
- **Administrative Privileges**: The script must be run as an administrator.
- **Internet Access**: Required to download additional scripts and OS lifecycle information from remote repositories.
- **Modules**: The `Strapper` and `PSWindowsUpdate` modules are required. The script ensures these are installed and up-to-date.

## Dependencies

- [Get-LatestCumulativeUpdate](/docs/81d82975-889b-49e4-b229-36d4f162a4ff)
- [Repair-WindowsUpdate](/docs/39345bfd-d9e2-4e68-9d7a-3e8b443140cc)

## Process

1. **Compatibility Check**: Verifies that the operating system is Windows 10 or higher.
2. **Preferences Configuration**: Configures PowerShell preferences for silent operation and secure communication.
3. **Strapper Module Management**: Ensures the `Strapper` module is installed and up-to-date.
4. **Retrieve Latest Installed CU**: Downloads and executes a script to retrieve information about the latest installed cumulative update.
5. **Retrieve OS Support End Date**: Fetches OS lifecycle data to determine if the system is still supported.
6. **Windows Update Repair**: Repairs Windows Update functionality if necessary.
7. **Install Latest CU**: Checks for available cumulative updates and installs them if found.
8. **Reboot Handling**: Reboots the system if the `-Reboot` parameter is specified or logs a message advising a manual reboot.

## Payload Usage

The script can be executed with or without parameters depending on the desired functionality.

### Example 1

Retrieve detailed information about the operating system and the latest installed cumulative update without performing any updates or repairs.

```PowerShell
.\Deploy-AvailableCumulativeUpdate.ps1 -Get
```

### Example 2

Install the latest cumulative update and reboot the system to complete the installation.

```PowerShell
.\Deploy-AvailableCumulativeUpdate.ps1 -Reboot
```

### Example 3

Install the latest cumulative update without rebooting the system.

```PowerShell
.\Deploy-AvailableCumulativeUpdate.ps1
```

## Parameters

| Parameter | Alias | Required | Default | Type   | Description                                                              |
| --------- | ----- | -------- | ------- | ------ | ------------------------------------------------------------------------ |
| `Get`     |       | False    |         | Switch | Retrieves detailed information about the OS and the latest installed CU. |
| `Reboot`  |       | False    |         | Switch | Reboots the system after installing the latest cumulative update.        |

## Output

- Deploy-AvailableCumulativeUpdate-log.txt  
- Deploy-AvailableCumulativeUpdate-error.txt