---
id: '7b36b35a-51ab-4a6d-b129-f1057ef349b9'
slug: /7b36b35a-51ab-4a6d-b129-f1057ef349b9
title: 'pvl_boot_environment_details'
title_meta: 'pvl_boot_environment_details'
keywords: ['boot', 'secure-boot', 'telemetry', 'secure-boot-certificates', 'kek', 'db', 'dbdefault', 'boot-environment-audit', 'secure-boot-audit']
description: 'Stores the boot environment details of windows machines returned by the Boot Environment Audit script.'
tags: ['secureboot', 'certificates', 'security', 'audit', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-05-06
---

## Purpose

Stores boot environment audit results collected by the [Boot Environment Audit](/docs/8203c614-47e4-11f1-b8be-92000234cfc2) script. Each row represents the latest audit data for a managed Windows device, covering Secure Boot status, UEFI CA 2023 certificate enrollment, BIOS firmware readiness, available driver updates, cumulative update status, boot configuration anomalies, and telemetry settings. This data powers the [Boot Environment Audit](/docs/6dae1649-e241-4259-8df9-c19f3a08033a) dataview for fleet-wide reporting and compliance review.

## Dependencies

- [Script: Boot Environment Audit](/docs/8203c614-47e4-11f1-b8be-92000234cfc2)
- [Solution: Boot Environment Audit](/docs/539d13a0-9444-4b40-8b09-aebf34ade1f8)

## Tables

### pvl_boot_environment_details

| Property | Type | Description |
| -------- | ---- | ----------- |
| `ComputerID` | Int | The unique identifier of the client. |
| `OEMUpdatesCount` | Int | Number of available OEM driver updates from the device manufacturer tool. |
| `SecureBootStatus` | Varchar | Secure Boot state: **Enabled**, **Disabled**, or **Unknown**. |
| `TelemetryStatus` | Varchar | Windows telemetry state: **Enabled** or **Disabled**. |
| `DBCertificateStatus` | Varchar | Status of UEFI db certificate for CA 2023: **Updated**, **Out of date**, or **Not present**. |
| `KEKCertificateStatus` | Varchar | Status of UEFI KEK certificate for CA 2023: **Updated**, **Out of date**, or **Not present**. |
| `DBDefaultCertificateStatus` | Varchar | Status of default db certificate for CA 2023: **Updated**, **Out of date**, or **Not present**. |
| `CurrentCumulativeUpdate` | Varchar | Name/KB identifier of the most recently installed cumulative update. |
| `Nov2025CUInstalled` | Int | **1** if November 2025 or newer cumulative update is installed. |
| `BiosName` | Varchar | BIOS name from Win32_BIOS (e.g., Dell Inc. BIOS, HP BIOS). |
| `BiosVersion` | Varchar | Raw BIOS version Varchar from Win32_BIOS. |
| `BiosVersionNumber` | Varchar | Normalized numeric BIOS version extracted from BiosVersion. |
| `CA2023SupportedBIOSVersion` | Varchar | Minimum BIOS version required for CA2023 support (from lookup data). |
| `CA2023SupportedBIOSVersionNumber` | Varchar | Normalized numeric version from CA2023SupportedBIOSVersion. |
| `PXE_Present` | Int | **1** if firmware boot entries indicate PXE or network boot options. |
| `DualBootOrNonWindowsEFI` | Int | **1** if non-Windows EFI boot entries are detected (Ubuntu, Debian, GRUB, etc.). |
| `WinRE_Enabled` | Int | **1** if Windows Recovery Environment is enabled. |
| `Present` | Varchar | Comma-separated summary of detected conditions (e.g., "PXE, WinREEnabled"). |
| `PXE_Evidence` | Varchar | Detailed evidence lines from bcdedit output showing PXE/network boot indicators. |
| `DualBoot_Evidence` | Varchar | Detailed evidence lines from bcdedit output showing non-Windows EFI boot indicators. |
| `Available_Updates` | Varchar | Value of Secure Boot registry AvailableUpdates or **Not exist** if not present. |
| `UEFICA2023_Status` | Varchar | Secure Boot servicing registry UEFICA2023Status value or **Not exist**. |
| `UEFICA2023_Error` | Varchar | Secure Boot servicing registry UEFICA2023Error value or **Not exist**. |
| `WindowsUEFICA2023_Capable` | Varchar | Secure Boot servicing registry WindowsUEFICA2023Capable value or **Not exist**. |
| `ConfidenceLevel` | Varchar | Secure Boot servicing registry ConfidenceLevel value or **Not exist**. |
| `ConfidenceUpdateType` | Varchar | Secure Boot servicing registry ConfidenceUpdateType value or **Not exist**. |
| `BucketHash` | Varchar | Secure Boot servicing registry BucketHash value or **Not exist** (hash for telemetry grouping). |
| `Date` | DateTime | Timestamp of when the audit script last ran and populated this record. |

## Changelog

### 2026-05-06

- Initial version of the document
