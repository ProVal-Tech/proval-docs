---
id: '837e00a9-4fde-4457-9516-591da7ba4da0'
title: 'Install-Windows11FeatureUpdate'
title_meta: 'Install-Windows11FeatureUpdate'
keywords: ['install', 'featureupdate', 'upgrade', 'windows', 'windows11', 'troubleshooting', 'reboot']
description: 'The script automates the installation of the Windows 11 Feature Update. It performs comprehensive pre-checks, maintenance, and validation to ensure a smooth upgrade process.'
tags: ['installation', 'update', 'windows']
draft: false
unlisted: false
---

## Overview

The script automates the installation of the Windows 11 Feature Update. It performs comprehensive pre-checks, maintenance, and validation to ensure a smooth upgrade process.

## Requirements

- Windows 11
- Administrative privileges
- Internet connectivity
- 64GB+ free space on the system drive
- [Windows 11 Compatible Machine](https://www.microsoft.com/en-us/windows/windows-11-specifications)

## Process

The script operates in multiple phases to accomplish the upgrade:

1. **System Validation**:
   - **OS Compatibility**: Verifies the system is running Windows 11.
   - **Internet Connectivity**: Checks for an active internet connection.
   - **Power Status**: Ensures laptops are connected to power.
   - **Disk Space**: Confirms at least 64GB of free space on the system drive.
   - **Hardware Readiness**: Uses Microsoft's HardwareReadiness script to check TPM 2.0, Secure Boot, and other system requirements.
   - **Windows Update Health**: Validates Windows Update health and repairs system files via SFC/DISM.

2. **Driver Maintenance**:
   - **Manufacturer-Specific Updates**: Updates drivers using tools specific to Lenovo, Dell, and HP.
   - **Generic Updates**: Applies generic driver updates via Windows Update for other manufacturers.

3. **Upgrade Execution**:
   - **Windows Update Policies**: Configures Windows Update policies for feature updates.
   - **Installation Assistant**: Downloads and runs the Windows 11 Installation Assistant via scheduled tasks.

4. **Post-Install Validation**:
   - **SetupDiag Analysis**: Uses Microsoft SetupDiag to analyze installation success or failure.
   - **Cleanup**: Performs automatic cleanup and logs results.

The script also schedules tasks to run itself after restarting the system to complete the upgrade process. It creates two scheduled tasks:

1. **Primary Task**: Initiates the upgrade process.
2. **Post-Reboot Task**: Handles post-install cleanup and validation after the system restarts.

### Points Where the Computer Can Be Restarted

- **Driver Updates**: If driver updates require a reboot, the script will restart the computer unless the `-NoReboot` parameter is used. The computer might be restarted multiple times during the driver updates.
- **System Health Check**: If the SFC scan finds and repairs issues, the script will restart the computer unless the `-NoReboot` parameter is used.
- **Primary Task Execution**: After initiating the upgrade process, the script may restart the computer to complete the installation. The computer can be restarted multiple times during the upgrade process.

## Payload Usage

To execute the script, use the following command:

```powershell
.\Install-Windows11FeatureUpdate.ps1
```

To run the script without automatic reboots, use the `-NoReboot` parameter:

```powershell
.\Install-Windows11FeatureUpdate.ps1 -NoReboot
```

## Parameters

| Parameter  | Alias | Required | Default | Type   | Description                                                                 |
|------------|-------|----------|---------|--------|-----------------------------------------------------------------------------|
| `NoReboot` |       | False    |         | Switch | Prevents automatic reboots, allowing manual control over restarts.          |

## Output

The script generates the following output files:

- `.\Install-Windows11FeatureUpdate-log.txt`
- `.\Install-Windows11FeatureUpdate-Error.txt`

## Cautions

- The machine may restart up to 7 times to complete the upgrade process.
- Be aware of [known issues](https://learn.microsoft.com/en-us/windows/release-health/status-windows-11-24h2) with the feature update 24H2 before using the script.
- Even with the `-NoReboot` parameter, the computer may still restart due to firmware, BIOS, driver updates, or the feature update itself.

## Dependencies

- [Windows OS Support](../../static/attachments/windows-os-support.json)
- [Invoke-WingetProcessor](/docs/8496c2e9-0e52-4961-a1f1-4a95296e8cf7)
