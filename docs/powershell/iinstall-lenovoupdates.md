---
id: '3640e534-d089-4304-89ba-68d3bc113978'
slug: /3640e534-d089-4304-89ba-68d3bc113978
title: 'Install-LenovoUpdates'
title_meta: 'Install-LenovoUpdates'
keywords: ['lenovo', 'bios', 'firmware', 'drivers', 'vendor-specific', 'driver-updates', 'lenovo-workstations']
description: 'Automates the discovery and installation of Lenovo-specific updates (BIOS, drivers, firmware, applications) on supported workstations.'
tags: ['lenovo', 'drivers', 'bios', 'firmware']
draft: false
unlisted: false
---

## Overview

This PowerShell script automates the discovery and installation of Lenovo-specific updates (BIOS, drivers, firmware, applications) on supported workstations. It solves the problem of manually managing Lenovo system updates in enterprise environments by providing a standardized, automated approach with comprehensive logging and reboot control.

## Important Notes

- **Forceful reboots**: BIOS/firmware updates initiate hardware-level restarts that bypass `-NoReboot` parameter controls
- **Maintenance windows**: Schedule updates during planned downtime to avoid disruption
- **Power continuity**: Ensure uninterrupted power supply during firmware updates
- **Unattended requirement**: Type-based installations only process updates supporting silent installation
- **ID exceptions**: Updates installed by ID ignore unattended installation requirements

## Requirements

- **Administrative privileges**: Must be run as administrator
- **Lenovo hardware**: Designed exclusively for Lenovo workstations
- **Supported OS**: Windows 10 or Windows 11
- **PowerShell 5.1+**: Minimum required PowerShell version
- **Internet connectivity**: Required for module installation and update downloads

## Process

The script executes through these stages:

1. **Environment Setup**:
   - Configures TLS 1.2 security protocol
   - Bootstraps NuGet package provider
   - Installs/updates Strapper logging module

2. **System Validation**:
   - Confirms Lenovo hardware manufacturer
   - Verifies Windows 10/11 operating system

3. **Update Management**:
   - Installs/updates LSUClient module
   - Discovers available Lenovo updates
   - Filters updates based on parameters:
     - By type (only unattended installable)
     - By specific IDs
   - Downloads and installs selected updates

4. **Post-Installation**:
   - Checks for required reboots
   - Handles reboot suppression
   - Logs installation results

## Payload Usage

Execute the script with optional parameters to control update behavior:

```powershell
# List available updates (no installation)
.\Install-LenovoUpdates.ps1

# Install all applicable updates
.\Install-LenovoUpdates.ps1 -Type All

# Install specific update types without reboot
.\Install-LenovoUpdates.ps1 -Type BIOS,Driver -NoReboot

# Install updates by specific IDs
.\Install-LenovoUpdates.ps1 -Id 'n3ch101w_bisbnk919kse', 'pcieeth06w_w11'
```

## Parameters

| Parameter | Alias | Required | Default | Type | Description |
|-----------|-------|----------|---------|------|-------------|
| `Type` | - | False | None | String[] | Specifies update types to install. Updates must support unattended installation. Valid values: `All`, `Application`, `BIOS`, `Driver`, `Firmware` |
| `Id` | - | False | None | String[] | Specifies specific update IDs to install |
| `NoReboot` | - | False | False | Switch | Suppresses automatic reboot after installation |

## Output

- Install-LenovoUpdates-log.txt
- Install-LenovoUpdates-error.txt

**Sample output snippet:**

```PlainText
    ID           : pcieeth06w_w11
    Title        : ThinkPad Thunderbolt 4 Dock Driver - 11 (21H2 or Later)
    Type         : Driver
    Category     : Networking LAN Ethernet
    Version      : 1.1.4.43
    Severity     : Recommended
    ReleaseDate  : 6/23/2025 12:00:00 AM
    RebootType   : 3
    Vendor       : Lenovo
    Size         : 1733989
    URL          : https://download.lenovo.com/pccbbs/mobiles/pcieeth06w_w11_2_.xml
    Installer    : PackageInstallInfo
    IsApplicable : True
    IsInstalled  : False
```

## Documentation Links

- [LSUClient Module Documentation](https://jantari.github.io/LSUClient-docs)
