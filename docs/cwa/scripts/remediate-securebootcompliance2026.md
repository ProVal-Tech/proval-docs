---
id: '844a8efb-1f97-437f-add1-f15d0c623f00'
slug: /844a8efb-1f97-437f-add1-f15d0c623f00
title: 'Remediate SecureBootCompliance2026'
title_meta: 'Remediate SecureBootCompliance2026'
keywords: ['secureboot', 'certificates', 'security', 'audit', 'windows', 'compliance', 'windows server 2026', 'autofix', 'script-state']
description: 'This script uses the agnostic script Remediate SecureBootCompliance2026 to run the Automate implementation of the PS1 on Windows 2026 agents. It remediates UEFI Secure Boot compliance for Windows 2026 by ensuring systems have the required 2023 UEFI certificates (KEK and DB), enabling Microsoft-managed certificate updates, reporting remediation status, and writing a script state to prevent repeated execution by the Secure Boot CA2023 autofix monitor.'
tags: ['secureboot', 'certificates', 'security', 'audit', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-08-01
---

## Summary

This script uses the agnostic script [Remediate-SecureBootCompliance2026](/docs/062c5b72-32b5-4fdb-b48c-5f45a19af42c) to run the Automate implementation of the PS1 on Windows 2026 agents.

It remediates UEFI Secure Boot compliance for Windows 2026 by ensuring systems have the required 2023 UEFI certificates, `KEK` and `DB`, enabling Microsoft-managed certificate updates, and reporting the remediation status.

The script validates Secure Boot, configures the required registry keys for automatic certificate updates, monitors the Secure Boot servicing status, logs the results, and writes a script state to prevent the same machine from being repeatedly targeted by the autofix internal monitor.

## Script State

This script writes the following script state after the remediation workflow has been processed:

| Variable | Value | Purpose |
|---|---|---|
| `Boot_Environment_Remediation` | `Applied` | Prevents the [Secure Boot CA2023 Autofix Targets](/docs/adc5c5dd-ef5c-4f8d-a687-e613a4291b2c) internal monitor from repeatedly running the remediation script against the same machine. |

The internal monitor excludes computers where this script state is already present with a value of `Applied`.

If remediation needs to be run again on a device, remove or reset the `Boot_Environment_Remediation` script state for that computer.

## Dependencies

- [Agnostic Script: Remediate-SecureBootCompliance2026](/docs/062c5b72-32b5-4fdb-b48c-5f45a19af42c)
- [Solution: Boot Environment Audit](/docs/539d13a0-9444-4b40-8b09-aebf34ade1f8)

## Sample Run

## Global Parameters

| Name | Required | Example | Description |
|---|---|---|---|
| Debug | False | True/False | If set to True, then it will display the complete log before the script comparator; otherwise, it will return after the script output analysis. |
| ScriptEngineEnableLogger | False | True/False | If set to True, then the script log will show the complete script execution analysis step-by-step; otherwise, the step-by-step analysis will be hidden in the script log. |

## Output

- Script Logs
- Script State

## Changelog

### 2026-08-01

- Added script state `Boot_Environment_Remediation = Applied` to prevent repeated execution by the [Secure Boot CA2023 Autofix Targets](/docs/adc5c5dd-ef5c-4f8d-a687-e613a4291b2c) internal monitor.
- Added dependency on the new Secure Boot CA2023 autofix internal monitor.
- Updated output documentation to include the new script state.
- Corrected the Boot Environment Audit dataview reference.

### 2026-06-19

- Initial version of the document.
