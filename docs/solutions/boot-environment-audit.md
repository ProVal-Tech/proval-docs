---
id: '539d13a0-9444-4b40-8b09-aebf34ade1f8'
slug: /539d13a0-9444-4b40-8b09-aebf34ade1f8
title: 'Boot Environment Audit'
title_meta: 'Boot Environment Audit'
keywords: ['boot', 'secure-boot', 'telemetry', 'secure-boot-certificates', 'kek', 'db', 'dbdefault', 'boot-environment-audit', 'secure-boot-audit', 'remediation', 'autofix', 'ca2023']
description: 'Audits the boot environment, Secure Boot certificates, OEM updates, telemetry, and cumulative update status across Windows devices, stores the results for fleet-wide reporting, and optionally automates Secure Boot CA2023 remediation.'
tags: ['secureboot', 'certificates', 'security', 'audit', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-08-04
---

## Purpose

The goal of this solution is to audit the boot environment and security posture of Windows Workstations and Servers.

It collects data on:

- Secure Boot status
- UEFI CA 2023 certificate enrollment
- BIOS firmware readiness
- Pending OEM driver updates
- Cumulative update compliance
- Boot configuration anomalies
- Telemetry settings

The audit results are stored in a custom table for fleet-wide reporting and compliance tracking.

This solution also supports optional automated remediation for Secure Boot CA2023 compliance. The [Boot Environment Audit](/docs/6dae1649-e241-4259-8df9-c19f3a08033a) dataview exposes computed remediation columns, and the [Secure Boot CA2023 Autofix Targets](/docs/adc5c5dd-ef5c-4f8d-a687-e613a4291b2c) internal monitor can automatically target problematic devices for remediation using the [Remediate SecureBootCompliance2026](/docs/844a8efb-1f97-437f-add1-f15d0c623f00) script.

## Associated Content

Alert Templates are documented as part of this solution. Standalone Alert Template documents are not created.

### Auditing

| Content | Type | Function |
|---|---|---|
| [Boot Environment Audit](/docs/8203c614-47e4-11f1-b8be-92000234cfc2) | Script | Runs the audit against each device, collects boot environment and Secure Boot compliance data, and stages the results for database import. |
| [OverFlowedVariable - SQL Insert - Execute](/docs/34cee8fe-1b6b-4558-a890-2face427ceb8) | Script | Helper script used to handle and insert overflowed audit data into the custom database table. |
| [Execute Script - Boot Environment Audit](/docs/abf814c3-a689-46db-990f-cbb4342f6be0) | Internal Monitor | Executes the audit script on a scheduled basis against Windows Workstations and Servers. |
| **△ Custom - Execute Script - Boot Environment Audit** | Alert Template | Executes the [Boot Environment Audit](/docs/8203c614-47e4-11f1-b8be-92000234cfc2) script against machines detected by the audit internal monitor. |
| [pvl_boot_environment_details](/docs/7b36b35a-51ab-4a6d-b129-f1057ef349b9) | Custom Table | Stores the boot environment audit data collected from each device. |
| [Boot Environment Audit](/docs/6dae1649-e241-4259-8df9-c19f3a08033a) | Dataview | Displays audit results for fleet-wide review and compliance reporting. Includes computed `Problematic`, `RemediationAction`, and `RemediationReason` columns for Secure Boot CA2023 remediation targeting. |

### Automation

> Import the Automation content only when automated remediation is required or has been explicitly requested.

| Content | Type | Function |
|---|---|---|
| [Remediate SecureBootCompliance2026](/docs/844a8efb-1f97-437f-add1-f15d0c623f00) | Script | Uses the agnostic script [Remediate-SecureBootCompliance2026](/docs/062c5b72-32b5-4fdb-b48c-5f45a19af42c) to remediate UEFI Secure Boot compliance for Windows 2026. It validates Secure Boot, checks KEK and DB certificate enrollment, configures Microsoft-managed certificate updates, monitors servicing status, and writes the `Boot_Environment_Remediation` script state to prevent repeated execution. |
| [Secure Boot CA2023 Autofix Targets](/docs/adc5c5dd-ef5c-4f8d-a687-e613a4291b2c) | Internal Monitor | Identifies Windows devices that require Secure Boot CA2023 remediation and are eligible for automated remediation. It excludes devices that are already compliant, have Secure Boot disabled, are in a reboot-required servicing state, have recently received remediation, or already have the `Boot_Environment_Remediation` script state set to `Applied`. |
| **△ Custom - Autofix - Secure Boot CA2023 Autofix Targets** | Alert Template | Executes the [Remediate SecureBootCompliance2026](/docs/844a8efb-1f97-437f-add1-f15d0c623f00) script against machines detected by the Secure Boot CA2023 autofix internal monitor. |

## Implementation

### Auditing

1. Import the associated auditing scripts, internal monitor, dataview, and alert template from the ProSync plugin.
2. Execute the [Boot Environment Audit](/docs/8203c614-47e4-11f1-b8be-92000234cfc2) script on any online Windows device with the `SetEnvironment` parameter set to `1`. This creates the required [pvl_boot_environment_details](/docs/7b36b35a-51ab-4a6d-b129-f1057ef349b9) custom table.
3. Reload the system cache, `Ctrl + R`, and verify the custom table was created successfully.
4. Navigate to `Automation` → `Monitors` within the CWA Control Center and configure the following monitor:
   - [Execute Script - Boot Environment Audit](/docs/abf814c3-a689-46db-990f-cbb4342f6be0)
5. Configure the monitor with the alert template:
   - `△ Custom - Execute Script - Boot Environment Audit`
6. Right-click the monitor and select `Run Now` to start the audit cycle.

### Automation

> Import and enable the Automation content only when automated remediation is required or has been explicitly requested.

1. Import the automation script, internal monitor, and alert template from the ProSync plugin.
2. Navigate to `Automation` → `Monitors` within the CWA Control Center and configure the following monitor:
   - [Secure Boot CA2023 Autofix Targets](/docs/adc5c5dd-ef5c-4f8d-a687-e613a4291b2c)
3. Configure the monitor with the alert template:
   - `△ Custom - Autofix - Secure Boot CA2023 Autofix Targets`
4. Right-click the monitor and select `Run Now` to begin targeting problematic devices.
5. The monitor uses audit data stored in [pvl_boot_environment_details](/docs/7b36b35a-51ab-4a6d-b129-f1057ef349b9) and the remediation logic exposed by the [Boot Environment Audit](/docs/6dae1649-e241-4259-8df9-c19f3a08033a) dataview to identify devices requiring Secure Boot CA2023 remediation.
6. The [Remediate SecureBootCompliance2026](/docs/844a8efb-1f97-437f-add1-f15d0c623f00) script writes the following script state after remediation has been processed:

   | Variable | Value |
   |---|---|
   | `Boot_Environment_Remediation` | `Applied` |

7. This script state prevents the autofix monitor from repeatedly running remediation against the same device.
8. If remediation needs to be run again on a device, remove or reset the `Boot_Environment_Remediation` script state for that computer.

## Changelog

### 2026-08-04

- Added Secure Boot CA2023 autofix automation components.
- Added internal monitor: [Secure Boot CA2023 Autofix Targets](/docs/adc5c5dd-ef5c-4f8d-a687-e613a4291b2c).
- Added alert template: `△ Custom - Autofix - Secure Boot CA2023 Autofix Targets`.
- Updated [Remediate SecureBootCompliance2026](/docs/844a8efb-1f97-437f-add1-f15d0c623f00) to write the `Boot_Environment_Remediation` script state.
- Updated [Boot Environment Audit](/docs/6dae1649-e241-4259-8df9-c19f3a08033a) dataview with `Problematic`, `RemediationAction`, and `RemediationReason` columns.
- Reorganized Associated Content into `Auditing` and `Automation` tables.
- Added note that Automation content should be imported only when required or explicitly requested.

### 2026-06-19

- Added the remediation for the secure boot compliance in it, as it can change the audit data and is completely related to this solution.

### 2026-05-06

- Initial version of the document.

Deprecated content:

- Solution: Windows Secure boot Audit
- Role: Windows Secure Boot
- Role: Windows Telemetry
- Role: Windows DB Certificate
- Role: Windows KEK Certificate
- Dataview: Windows Secure Boot Audit [Role]
