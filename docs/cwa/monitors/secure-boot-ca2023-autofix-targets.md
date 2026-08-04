---
id: 'adc5c5dd-ef5c-4f8d-a687-e613a4291b2c'
slug: /adc5c5dd-ef5c-4f8d-a687-e613a4291b2c
title: 'Secure Boot CA2023 Autofix Targets'
title_meta: 'Secure Boot CA2023 Autofix Targets'
keywords: ['secure-boot', 'secure-boot-ca2023', 'autofix', 'remediation', 'internal-monitor', 'windows', 'uefi', 'certificates']
description: 'Identifies Windows devices that require Secure Boot CA2023 remediation and are eligible for automated remediation using the Remediate SecureBootCompliance2026 script.'
tags: ['secureboot', 'certificates', 'security', 'audit', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-08-04
---

## Summary

This monitor identifies Windows devices that require Secure Boot CA2023 remediation and are eligible for automated remediation.

It uses audit data stored in the [pvl_boot_environment_details](/docs/7b36b35a-51ab-4a6d-b129-f1057ef349b9) custom table to find devices where Secure Boot is enabled but the required 2023 UEFI certificates are not yet enrolled.

The monitor triggers the [Remediate SecureBootCompliance2026](/docs/844a8efb-1f97-437f-add1-f15d0c623f00) script through the `△ Custom - Autofix - Secure Boot CA2023 Autofix Targets` alert template.

## Dependencies

- [Custom Table: pvl_boot_environment_details](/docs/7b36b35a-51ab-4a6d-b129-f1057ef349b9)
- [Script: Boot Environment Audit](/docs/8203c614-47e4-11f1-b8be-92000234cfc2)
- [Dataview: Boot Environment Audit](/docs/6dae1649-e241-4259-8df9-c19f3a08033a)
- [Script: Remediate SecureBootCompliance2026](/docs/844a8efb-1f97-437f-add1-f15d0c623f00)
- [Solution: Boot Environment Audit](/docs/539d13a0-9444-4b40-8b09-aebf34ade1f8)

## Selection Logic

The monitor selects a device when all of the following are true:

- The device has agent data available.
- The device is running Windows.
- Boot environment audit data exists in the [pvl_boot_environment_details](/docs/7b36b35a-51ab-4a6d-b129-f1057ef349b9) custom table.
- `SecureBootStatus` is `Enabled`.
- Either of the following certificate states is true:
  - `DBCertificateStatus` is `Out of date` or `Not present`
  - `KEKCertificateStatus` is `Out of date` or `Not present`
- `UEFICA2023_Status` is not `1` or `2`.
- The device does not already have the script state `Boot_Environment_Remediation` set to `Applied`.
- The device has not recently had the remediation script issued.

Devices with Secure Boot disabled are not selected because they require manual BIOS/UEFI intervention before remediation can be applied.

Devices with `UEFICA2023_Status` set to `1` or `2` are not selected because those states indicate that the device is already in a reboot-required servicing state.

## Suppression

The monitor uses the script state written by the [Remediate SecureBootCompliance2026](/docs/844a8efb-1f97-437f-add1-f15d0c623f00) script to avoid repeatedly targeting the same device.

| Script State Variable | Value | Effect |
|---|---|---|
| `Boot_Environment_Remediation` | `Applied` | Excludes the device from this monitor. |

If remediation needs to be run again on a device, remove or reset the `Boot_Environment_Remediation` script state for that computer.

## Monitor Output

The monitor returns the following fields:

| Field | Description |
|---|---|
| `TestValue` | Indicates that the device matched the autofix selection logic. |
| `IdentityField` | Human-readable reason explaining why the device was selected. |
| `ComputerID` | The Automate computer identifier for the selected device. |
| `uptimestart` | Agent uptime start information used by the monitor framework. |
| `uptimeend` | Agent uptime end information used by the monitor framework. |
| `noalerts` | Monitor alert suppression flag used by the monitor framework. |

## Target

Global

## Alert Template

`△ Custom - Autofix - Secure Boot CA2023 Autofix Targets`

This alert template executes the [Remediate SecureBootCompliance2026](/docs/844a8efb-1f97-437f-add1-f15d0c623f00) script against devices detected by the monitor.

## Changelog

### 2026-08-04

- Initial version of the document.
