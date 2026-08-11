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

When the monitor issues the remediation, the script reports the outcome as a ConnectWise ticket according to its ticketing configuration. See the ticketing section of the [Remediate SecureBootCompliance2026](/docs/844a8efb-1f97-437f-add1-f15d0c623f00#ticketing) document for the tickets your board can receive.

## Dependencies

- [Custom Table: pvl_boot_environment_details](/docs/7b36b35a-51ab-4a6d-b129-f1057ef349b9)
- [Script: Boot Environment Audit](/docs/8203c614-47e4-11f1-b8be-92000234cfc2)
- [Dataview: Boot Environment Audit](/docs/6dae1649-e241-4259-8df9-c19f3a08033a)
- [Script: Remediate SecureBootCompliance2026](/docs/844a8efb-1f97-437f-add1-f15d0c623f00)
- [Solution: Boot Environment Audit](/docs/539d13a0-9444-4b40-8b09-aebf34ade1f8)

## Suppression

The monitor uses the script state written by the [Remediate SecureBootCompliance2026](/docs/844a8efb-1f97-437f-add1-f15d0c623f00) script to avoid repeatedly targeting the same device.

| Script State Variable | Value | Effect |
|---|---|---|
| `Boot_Environment_Remediation` | `Applied` | Excludes the device from this monitor. |

If remediation needs to be run again on a device, remove or reset the `Boot_Environment_Remediation` script state for that computer.

The script state is written after a successful run. If a run fails, the state is not written and the device stays eligible, so the monitor retries it on a later cycle.

## Target

Global

## Alert Template

`△ Custom - Autofix - Secure Boot CA2023 Autofix Targets`

This alert template executes the [Remediate SecureBootCompliance2026](/docs/844a8efb-1f97-437f-add1-f15d0c623f00) script against devices detected by the monitor.

## Changelog

### 2026-08-04

- Initial version of the document.
