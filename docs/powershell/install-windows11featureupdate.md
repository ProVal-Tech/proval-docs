---
id: '837e00a9-4fde-4457-9516-591da7ba4da0'
slug: /837e00a9-4fde-4457-9516-591da7ba4da0
title: 'Install-Windows11FeatureUpdate'
title_meta: 'Install-Windows11FeatureUpdate'
keywords: ['install', 'featureupdate', 'upgrade', 'windows', 'windows11', 'troubleshooting', 'reboot']
description: 'The script automates the installation of the Windows 11 Feature Update. It performs comprehensive pre-checks, maintenance, and validation to ensure a smooth upgrade process.'
tags: ['installation', 'update', 'windows']
draft: false
unlisted: false
---

## Overview

The script automates the installation of the latest Windows 11 Feature Update. It performs comprehensive pre-checks, maintenance, and validation to ensure a smooth upgrade process.

The script supports both Windows 10 and Windows 11:

- For Windows 10, it attempts to upgrade to the latest available version of Windows 11.  
- For Windows 11, it ensures the system is updated to the latest available feature update.

## Security Application Guidance

For optimal performance and to minimize potential interference, it is recommended to disable or set any active security applications (such as antivirus, endpoint protection, or EDR tools) to "learning" or "detect-only" mode before executing the script.

This helps ensure that the update process runs smoothly without being blocked or slowed down by real-time protection mechanisms. Once the update is complete, security settings can be reverted to their original state.

## Requirements

- Windows 10 or Windows 11
- Administrative privileges
- Internet connectivity
- 64GB+ free space on the system drive
- [Windows 11 Compatible Machine](https://www.microsoft.com/en-us/windows/windows-11-specifications)

## Change Log (2025-05-07)

- Added a 60-second delay after the `Restart-Computer -Force` command to ensure the script doesn't proceed to the next step too soon.
- Removed unnecessary `/Scan` commands from the Dell Command Update section.
- Modified the handling of exit codes 3000 and 3005 in Dell Command Update to generate warnings instead.
- Added a check to limit driver update attempts to a maximum of three times or three reboots.
- Included a check to reset the `Windows11LatestFeatureUpdate` table if the `$workingDirectory` does not exist. This indicates that the script might have previously executed but failed, and if someone is trying to re-run it, they just need to remove the `$workingDirectory`.

## Change Log (2025-07-03)

- `Dell Command | Update Universal for Windows` will now only be updated if it is already installed; otherwise, `Dell Command | Update` will be used.
- The uninstall process for `Dell Command | Update` has been removed. Winget will now update the application in place if an older version is detected, without uninstalling it first.
- Firmware and BIOS update logic for Dell machines has been removed.
- Removed unnecessary `return` statement from the Dell drivers installation section.
- Driver updates will no longer be attempted after every reboot if they have already been completed.
- Initial verification, registry updates, and Windows Update reset will not be repeated after every reboot if they have already been performed.
- The `Reset-WUComponents` command is now executed in a background job, and the script will wait up to 10 minutes for its completion before proceeding.
- The `Restart-Computer -Force` command has been replaced with `Shutdown -f -r -t 10`.
- The sleep time after issuing a restart command has been reduced to 10 seconds.

## Change Log (2025-07-10)

- If the vendor tool fails to install driver updates, the script will attempt to install drivers using Windows Update.
- The script will proceed to run the Windows 11 Installer even if troubleshooting steps do not

## Change Log (2025-07-15)

- The script no longer forces a restart after the primary process finishes; instead, it allows the computer to restart on its own as needed.
- If the system does not restart within one hour, the script will run the SetupDiag tool to check for any errors.
- If SetupDiag indicates that a reboot is required to complete the upgrade and the `$NoReboot` switch is not used, the computer will be forcefully restarted.

## Change Log (2025-07-31)

- The script will attempt to set the 'TrustedInstaller' service (Windows Modules Installer) to Automatic startup and ensure it is running before starting the upgrade process.
- This change addresses upgrade failures caused by error code 0x8007001F.

## Process

The script operates in multiple phases to accomplish the upgrade:

1. **System Validation**:
   - **OS Compatibility**: Verifies the system is running Windows 10 or Windows 11.
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
2. **Post-Reboot Task**: Resumes the upgrade process after restarting the system.

### Points Where the Computer Can Be Restarted

- **Driver Updates**: If driver updates require a reboot, the script will restart the computer unless the `-NoReboot` parameter is used. The computer might be restarted multiple times during the driver updates.
- **System Health Check**: The script will reboot the computer following the Health Check Scan and Repair process, unless the `-NoReboot` parameter is specified.
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