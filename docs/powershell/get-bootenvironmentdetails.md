---
id: '5ecf76fb-1516-4c17-9ec9-937762c3ded6'
slug: /5ecf76fb-1516-4c17-9ec9-937762c3ded6
title: 'Get-BootEnvironmentDetails'
title_meta: 'Get-BootEnvironmentDetails'
keywords: ['boot', 'secure-boot', 'telemetry', 'secure-boot-certificates', 'kek', 'db', 'dbdefault', 'boot-environment-audit', 'secure-boot-audit']
description: 'Audits the boot environment, Secure Boot certificates, OEM updates, telemetry, and cumulative update status on a Windows device and returns the results as an object.'
tags: ['secureboot', 'certificates', 'security', 'audit', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-05-06
---

## Overview

This script provides comprehensive auditing of a Windows device's boot environment and security posture. It collects detailed information about:

- **Firmware and Boot Configuration**: Detects PXE/network boot entries and non-Windows EFI boot loaders
- **Secure Boot Status**: Verifies Secure Boot enablement and certificate enrollment (Windows UEFI CA 2023)
- **Windows Recovery Environment**: Confirms WinRE status
- **Telemetry Settings**: Determines if Windows telemetry is enabled
- **OEM Driver Updates**: Counts available driver updates from the device manufacturer (Dell, HP, Lenovo)
- **BIOS/Firmware Readiness**: Compares current BIOS version against minimum version required for CA2023 support
- **Windows Cumulative Updates**: Identifies the latest installed update and verifies November 2025 or newer CU status

The script is designed for IT auditing workflows to assess Windows security configurations and update readiness.

## Requirements

- **Administrator privileges** (required to run the script)
- **UEFI-based Windows system** (Windows 10/11 with UEFI firmware)
- **System binaries**: bcdedit.exe and reagentc.exe must be in the system PATH
- **Internet connectivity**: Required to download dependency scripts and lookup data from the content repository
- **PowerShell 5.1 or higher**

## Process

The script performs the following steps in sequence:

1. **Downloads and Loads Dependencies**: Automatically downloads the Strapper module and required helper scripts from the content repository.

2. **Collects BIOS Information**: Retrieves BIOS name and version from Win32_BIOS and compares against the CA2023 BIOS lookup table to determine firmware readiness.

3. **Checks Secure Boot Status**: Uses Confirm-SecureBootUEFI to verify Secure Boot state and parses X.509 certificates from UEFI variables (db, KEK, dbDefault) to check for Windows UEFI CA 2023 enrollment.

4. **Analyzes Firmware Boot Entries**: Runs bcdedit to scan for PXE/network boot options and non-Windows EFI loaders (Ubuntu, Debian, Fedora, GRUB, rEFInd, systemd-boot, shim).

5. **Verifies Windows Recovery Environment**: Uses reagentc to confirm WinRE enablement status.

6. **Assesses Telemetry Configuration**: Checks AllowTelemetry registry values and DiagTrack service startup type across multiple policy locations.

7. **Counts Available Driver Updates**: Based on device manufacturer (Dell, HP, Lenovo), runs the appropriate OEM update tool to count available driver updates. Falls back to PSWindowsUpdate for other vendors.

8. **Retrieves Cumulative Update Information**: Downloads and executes Get-LatestInstalledCU.ps1 to identify the latest installed CU and release date.

9. **Reads Secure Boot Registry Settings**: Queries HKLM:\SYSTEM\CurrentControlSet\Control\SecureBoot for CA2023 status and confidence metrics.

10. **Returns Structured Output**: Compiles all findings into a BootEnvironmentStatus object and logs results to local files.

## Payload Usage

This script does not use parameters. Simply execute it without arguments:

```powershell
.\Get-BootEnvironmentDetails.ps1
```

The script will automatically detect device configuration and collect all audit data.

## Output

The script returns a **BootEnvironmentStatus** object containing 27 properties with boot and security audit information:

| Property | Type | Description |
| -------- | ---- | ----------- |
| `OEMUpdatesCount` | Int32 | Number of available OEM driver updates from the device manufacturer tool. |
| `SecureBootStatus` | String | Secure Boot state: **Enabled**, **Disabled**, or **Unknown**. |
| `TelemetryStatus` | String | Windows telemetry state: **Enabled** or **Disabled**. |
| `DBCertificateStatus` | String | Status of UEFI db certificate for CA 2023: **Updated**, **Out of date**, or **Not present**. |
| `KEKCertificateStatus` | String | Status of UEFI KEK certificate for CA 2023: **Updated**, **Out of date**, or **Not present**. |
| `DBDefaultCertificateStatus` | String | Status of default db certificate for CA 2023: **Updated**, **Out of date**, or **Not present**. |
| `CurrentCumulativeUpdate` | String | Name/KB identifier of the most recently installed cumulative update. |
| `Nov2025CUInstalled` | Boolean | **True** if November 2025 or newer cumulative update is installed. |
| `BiosName` | String | BIOS name from Win32_BIOS (e.g., Dell Inc. BIOS, HP BIOS). |
| `BiosVersion` | String | Raw BIOS version string from Win32_BIOS. |
| `BiosVersionNumber` | String | Normalized numeric BIOS version extracted from BiosVersion. |
| `CA2023SupportedBIOSVersion` | String | Minimum BIOS version required for CA2023 support (from lookup data). |
| `CA2023SupportedBIOSVersionNumber` | String | Normalized numeric version from CA2023SupportedBIOSVersion. |
| `PXE_Present` | Boolean | **True** if firmware boot entries indicate PXE or network boot options. |
| `DualBootOrNonWindowsEFI` | Boolean | **True** if non-Windows EFI boot entries are detected (Ubuntu, Debian, GRUB, etc.). |
| `WinRE_Enabled` | Boolean | **True** if Windows Recovery Environment is enabled. |
| `Present` | String | Comma-separated summary of detected conditions (e.g., "PXE, WinREEnabled"). |
| `PXE_Evidence` | String | Detailed evidence lines from bcdedit output showing PXE/network boot indicators. |
| `DualBoot_Evidence` | String | Detailed evidence lines from bcdedit output showing non-Windows EFI boot indicators. |
| `Available_Updates` | String | Value of Secure Boot registry AvailableUpdates or **Not exist** if not present. |
| `UEFICA2023_Status` | String | Secure Boot servicing registry UEFICA2023Status value or **Not exist**. |
| `UEFICA2023_Error` | String | Secure Boot servicing registry UEFICA2023Error value or **Not exist**. |
| `WindowsUEFICA2023_Capable` | Boolean | Secure Boot servicing registry WindowsUEFICA2023Capable value or **Not exist**. |
| `ConfidenceLevel` | String | Secure Boot servicing registry ConfidenceLevel value or **Not exist**. |
| `ConfidenceUpdateType` | String | Secure Boot servicing registry ConfidenceUpdateType value or **Not exist**. |
| `BucketHash` | String | Secure Boot servicing registry BucketHash value or **Not exist** (hash for telemetry grouping). |

### Log Files

The script creates the following log files in the working directory:

- `Get-BootEnvironmentDetails-log.txt` — Information and warning messages during execution
- `Get-BootEnvironmentDetails-error.txt` — Error messages (if any errors occur)

## Dependencies

The script automatically downloads and manages the following dependencies from ProVal's content repository (https://contentrepo.net/repo):

### Modules

| Dependency | Purpose |
| ---------- | ------- |
| **Strapper** | Provides environment setup and logging utilities used throughout the script. |
| **PSWindowsUpdate** | Fallback method to retrieve available driver updates for non-OEM vendors. |

### Helper Scripts

| Script | Purpose | OEM |
| ------ | ------- | --- |
| [Initialize-DellCommandUpdate.ps1](/docs/aa963f3d-f149-4bfa-8fdc-30f12c21ce7f) | Counts available Dell driver updates | Dell |
| [Initialize-HPImageAssistant.ps1](/docs/92b749f0-2e30-4d4d-8916-fb5f30d85bff) | Counts available HP driver updates | HP |
| [Install-LenovoUpdates.ps1](/docs/3640e534-d089-4304-89ba-68d3bc113978) | Counts available Lenovo driver updates | Lenovo |
| [Get-LatestInstalledCU.ps1](/docs/81d82975-889b-49e4-b229-36d4f162a4ff) | Retrieves latest installed cumulative update information | All vendors |

### Lookup Data

| File | Purpose | Source |
| ---- | ------- | ------ |
| [CA2023-BIOSLookup.json](https://contentrepo.net/repo/app/CA2023-BIOSLookup.json) | Maps device models to minimum BIOS versions for CA2023 support | Content repository |

### Reference Documentation

The CA2023 BIOS lookup data is sourced from official manufacturer support articles:

- **Dell**: [Dell Support KB 000227537](https://www.dell.com/support/kbdoc/en-us/000227537)
- **HP**: [HP Support Document ish_13070353-13070429-16](https://support.hp.com/us-en/document/ish_13070353-13070429-16)
- **Lenovo**: [Lenovo Support Solution HT518129](https://support.lenovo.com/us/en/solutions/ht518129)

## Common Use Cases

- **Security Compliance Audit**: Verify that all devices have Secure Boot enabled and CA2023 certificates installed
- **Firmware Readiness Assessment**: Identify devices with BIOS versions below the minimum required for CA2023 support
- **Boot Configuration Review**: Detect unauthorized boot loaders or network boot options
- **Update Status Check**: Ensure devices are running current cumulative updates
- **Telemetry Reporting**: Audit telemetry enablement across the device fleet

## Changelog

### 2026-05-06

- Initial version of the document
