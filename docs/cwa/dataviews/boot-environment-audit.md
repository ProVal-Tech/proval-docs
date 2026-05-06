---
id: '6dae1649-e241-4259-8df9-c19f3a08033a'
slug: /6dae1649-e241-4259-8df9-c19f3a08033a
title: 'Boot Environment Audit'
title_meta: 'Boot Environment Audit'
keywords: ['boot', 'secure-boot', 'telemetry', 'secure-boot-certificates', 'kek', 'db', 'dbdefault', 'boot-environment-audit', 'secure-boot-audit']
description: 'Displays boot environment audit results for managed Windows devices.'
tags: ['secureboot', 'certificates', 'security', 'audit', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-05-06
---

## Summary

Displays boot environment audit results for managed Windows devices, populated from the [pvl_boot_environment_details](/docs/7b36b35a-51ab-4a6d-b129-f1057ef349b9) custom table by the [Boot Environment Audit](/docs/8203c614-47e4-11f1-b8be-92000234cfc2) script. Use this dataview to review Secure Boot status, UEFI CA 2023 certificate enrollment, BIOS firmware readiness, pending driver updates, cumulative update compliance, and boot configuration anomalies across your device fleet.

## Dependencies

- [Custom Table: pvl_boot_environment_details](/docs/7b36b35a-51ab-4a6d-b129-f1057ef349b9)
- [Script: Boot Environment Audit](/docs/8203c614-47e4-11f1-b8be-92000234cfc2)
- [Internal Monitor: Execute Script - Boot Environment Audit](/docs/abf814c3-a689-46db-990f-cbb4342f6be0)
- [Solution: Boot Environment Audit](/docs/539d13a0-9444-4b40-8b09-aebf34ade1f8)

## Columns

| Column | Description |
| ------ | ----------- |
| ClientID | The unique identifier of the client. (Hidden) |
| LocationID | The unique identifier of the location. (Hidden) |
| ComputerID | The unique identifier of the computer. (Hidden) |
| Client | The name of the client for this computer. |
| Location | The name of the location for this computer. |
| Computer | The name of the computer where the audit was performed. |
| OperatingSystem | The OS installed on the endpoint. |
| LastContact | The last check-in date of the agent. |
| LastLoggedInUser | The last user logged into the device. |
| FormFactor | The physical form factor of the machine. |
| Manufacturer | The device manufacturer (e.g., Dell, HP, Lenovo). |
| Model | The device model name. |
| SerialNumber | The device serial number. |
| OEMUpdatesCount | Number of available driver updates from the device manufacturer's tool. |
| SecureBootStatus | Secure Boot state: **Enabled**, **Disabled**, or **Unknown**. |
| TelemetryStatus | Windows telemetry state: **Enabled** or **Disabled**. |
| DBCertificateStatus | Status of the UEFI db certificate for CA 2023: **Updated**, **Out of date**, or **Not present**. |
| KEKCertificateStatus | Status of the UEFI KEK certificate for CA 2023: **Updated**, **Out of date**, or **Not present**. |
| DBDefaultCertificateStatus | Status of the default db certificate for CA 2023: **Updated**, **Out of date**, or **Not present**. |
| CurrentCumulativeUpdate | Name or KB identifier of the most recently installed cumulative update. |
| Nov2025CUInstalled | **Yes** if the November 2025 or newer cumulative update is installed; otherwise **No**. |
| BiosName | BIOS name reported by the device (e.g., Dell Inc. BIOS, HP BIOS). |
| BiosVersion | Raw BIOS version string as reported by the device. |
| BiosVersionNumber | Normalized numeric BIOS version extracted from BiosVersion. |
| CA2023SupportedBIOSVersion | Minimum BIOS version required for CA 2023 Secure Boot certificate support. |
| CA2023SupportedBIOSVersionNumber | Normalized numeric version from CA2023SupportedBIOSVersion. |
| PXE_Present | **Yes** if PXE or network boot options are detected in firmware boot entries; otherwise **No**. |
| DualBootOrNonWindowsEFI | **Yes** if non-Windows EFI boot entries are detected (e.g., Ubuntu, Debian, GRUB); otherwise **No**. |
| WinRE_Enabled | **Yes** if the Windows Recovery Environment is enabled; otherwise **No**. |
| Present | Comma-separated summary of detected conditions (e.g., "PXE, WinREEnabled"). |
| PXE_Evidence | Raw evidence lines from bcdedit output confirming PXE or network boot indicators. |
| DualBoot_Evidence | Raw evidence lines from bcdedit output confirming non-Windows EFI boot entries. |
| Available_Updates | Secure Boot registry value for available updates, or **Not exist** if the key is absent. |
| UEFICA2023_Status | Secure Boot servicing registry status for UEFI CA 2023, or **Not exist** if absent. |
| UEFICA2023_Error | Secure Boot servicing registry error code for UEFI CA 2023, or **Not exist** if absent. |
| WindowsUEFICA2023_Capable | Secure Boot servicing registry value indicating CA 2023 capability, or **Not exist** if absent. |
| ConfidenceLevel | Secure Boot servicing registry confidence level metric, or **Not exist** if absent. |
| ConfidenceUpdateType | Secure Boot servicing registry confidence update type, or **Not exist** if absent. |
| BucketHash | Hash used for telemetry grouping from the Secure Boot servicing registry, or **Not exist** if absent. |
| ScriptRunDate | Timestamp of when the audit script last ran and populated this record. |

## Changelog

### 2026-05-06

- Initial version of the document
