---
id: '4a7c95e2-b83f-4d6c-9b1e-6f2a84d7c3e5'
slug: /4a7c95e2-b83f-4d6c-9b1e-6f2a84d7c3e5
title: 'CrystalDiskInfo Alert'
title_meta: 'CrystalDiskInfo Alert'
keywords: ['crystaldiskinfo', 'disk', 'health', 'monitoring', 'smart', 'ssd', 'hdd']
description: 'Evaluation script for the Proactive Disk Health Monitor solution that reads the alert state and returns a concise plain-text summary to trigger ConnectWise Manage ticketing.'
tags: ['performance', 'report', 'software', 'hardware']
draft: false
unlisted: false
last_update:
  date: 2026-08-06
---

## Overview

This script serves as the evaluation logic for the ticketing component of the [Proactive Disk Health Monitor](/docs/acd55d90-1704-440c-a92e-795c230ecf9a) solution. It is triggered by the [CrystalDiskInfo - Ticket Required](/docs/2d8e63b4-a97c-4f1e-b6d9-5c3f81a7e4d6) compound condition to determine if a ConnectWise Manage ticket should be created.

Because ConnectWise Manage tickets cannot render complex HTML and are limited to roughly 1100 characters, this script does not decode the full WYSIWYG alert payload. Instead, it reads the [cPVAL Crystal Disk Alert Required](/docs/1e6d84a9-b25c-4d7f-a3b6-7f4e92c8d5a1) flag and the [cPVAL Crystal Disk Health Status](/docs/3f8a1c2e-9b47-4d5a-a6e3-1c9d84b2f7a5) field. If an alert is required, it returns a concise plain-text summary directing the technician to review the full HTML report stored in the [cPVAL Crystal Disk Alert Content](/docs/9b3f7c52-d81a-4e6c-b94f-3a8d75e2c6b9) custom field within NinjaOne, and exits with code 1. If no alert is required, it exits silently with code 0.

## Sample Run

> **Note:** This script is specifically engineered to operate as the evaluation script within the [CrystalDiskInfo - Ticket Required](/docs/2d8e63b4-a97c-4f1e-b6d9-5c3f81a7e4d6) compound condition. Manual execution is not recommended, as the script's output and exit code are intended to trigger automated ticketing actions rather than provide direct feedback.

## Dependencies

- [Solution: Proactive Disk Health Monitor](/docs/acd55d90-1704-440c-a92e-795c230ecf9a)
- [Compound Condition: CrystalDiskInfo - Ticket Required](/docs/2d8e63b4-a97c-4f1e-b6d9-5c3f81a7e4d6)
- [Custom Field: cPVAL Crystal Disk Alert Required](/docs/1e6d84a9-b25c-4d7f-a3b6-7f4e92c8d5a1)
- [Custom Field: cPVAL Crystal Disk Health Status](/docs/3f8a1c2e-9b47-4d5a-a6e3-1c9d84b2f7a5)
- [Custom Field: cPVAL Crystal Disk Alert Content](/docs/9b3f7c52-d81a-4e6c-b94f-3a8d75e2c6b9)

## Parameters

This script does not accept any runtime parameters. It relies entirely on reading the device custom fields populated by the [CrystalDiskInfo Audit](/docs/7f4b28d1-c65e-4b9a-a8f2-4d9c73e6b5a8) automation.

## Custom Fields

| Custom Field | Type | Example | Scope | Available Options | Editable | Description |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| [cPVAL Crystal Disk Alert Required](/docs/1e6d84a9-b25c-4d7f-a3b6-7f4e92c8d5a1) | Checkbox | `Checked` | Device | `Checked`, `Unchecked` | No | Evaluated to determine if the ticketing automation should proceed. |
| [cPVAL Crystal Disk Health Status](/docs/3f8a1c2e-9b47-4d5a-a6e3-1c9d84b2f7a5) | Text | `ModelA: Good, ModelB: Caution` | Device | N/A | No | Read by the script to include a brief health summary in the ticket output. |
| [cPVAL Crystal Disk Alert Content](/docs/9b3f7c52-d81a-4e6c-b94f-3a8d75e2c6b9) | WYSIWYG | HTML Payload | Device | N/A | No | Referenced in the output text as the location for the full diagnostic report. |

## Automation Setup/Import

[Automation Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/scripts/crystaldiskinfo-alert.ps1)

## Output

- **Activity Details:** A concise plain-text summary indicating a degraded disk health status, the current health summary, and instructions to review the detailed WYSIWYG custom field in NinjaOne.
- **Exit Code:** Returns `1` when a ticket is required, and `0` when no ticket is needed or if a read error occurs.

## Changelog

### 2026-08-06

- Initial version of the document
