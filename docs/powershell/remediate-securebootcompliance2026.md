---
id: '062c5b72-32b5-4fdb-b48c-5f45a19af42c'
slug: /062c5b72-32b5-4fdb-b48c-5f45a19af42c
title: 'Remediate-SecureBootCompliance2026'
title_meta: 'Remediate-SecureBootCompliance2026'
keywords: ['secureboot','compliance','certificates']
description: 'This script remediates UEFI Secure Boot compliance for Windows 2026 by ensuring systems have the required 2023 UEFI certificates (KEK and db), enabling Microsoft-managed certificate updates, and reporting the remediation status. It validates Secure Boot, configures registry keys for automatic updates, monitors servicing status, and logs results.'
tags: ['secureboot','compliance','certificates']
draft: false
unlisted: false
---

## Overview

This script remediates UEFI Secure Boot compliance for Windows 2026 by ensuring systems have the required 2023 UEFI certificates (KEK and db), enabling Microsoft-managed certificate updates, and reporting the remediation status. It validates Secure Boot, configures registry keys for automatic updates, monitors servicing status, and logs results.

## Requirements

- Administrative privileges (must run elevated).
- PowerShell 5.0 or newer.
- UEFI firmware with Secure Boot capability and Secure Boot enabled in BIOS/UEFI.
- Windows Update service accessible (internet or WSUS as appropriate).
- Network access to PSGallery if the `Strapper` module needs to be installed.

## Process

1. Validates that Secure Boot is supported and enabled.
2. Reads current UEFI KEK and `db` certificate bytes and checks for the 2023 certificates (`Microsoft Corporation KEK 2K CA 2023` and `Windows UEFI CA 2023`).
3. If both 2023 certificates are present, the script exits as the system is already compliant.
4. Runs prerequisite checks (Windows Update service, diagnostic service) and attempts to start Windows Update if stopped.
5. Installs or updates the `Strapper` PowerShell module (used for consistent logging) from PSGallery if required.
6. Creates/updates `HKLM:\SYSTEM\CurrentControlSet\Control\SecureBoot` registry values (`MicrosoftUpdateManagedOptIn` and `AvailableUpdates`) to enable Microsoft-managed UEFI certificate updates.
7. Waits briefly and reads servicing status from `HKLM:\SYSTEM\CurrentControlSet\Control\SecureBoot\Servicing` to report update progress and errors.
8. Provides final status report and actionable guidance (e.g., reboot required, BIOS/UEFI action required, or that updates will be delivered via Windows Update).

## Payload Usage

This script does not use a separate payload; it is a self-contained remediation script. Invoke it directly from an elevated PowerShell session.

Example usage:

```powershell
.\Remediate-SecureBootCompliance2026.ps1
```

## Output

The script writes logs and error files next to the script by default:

    .\Remediate-SecureBootCompliance2026-log.txt
    .\Remediate-SecureBootCompliance2026-error.txt