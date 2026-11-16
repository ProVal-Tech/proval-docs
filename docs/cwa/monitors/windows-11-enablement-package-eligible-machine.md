---
id: '475a45ea-c16f-4772-bb15-868d5a51fe6f'
slug: /475a45ea-c16f-4772-bb15-868d5a51fe6f
title: 'Windows 11 Enablement Package Eligible Machine'
title_meta: 'Windows 11 Enablement Package Eligible Machine'
keywords: ['windows-11', '25h2', '26h2', 'enablement-package', 'feature-update', 'monitor', 'upgrade']
description: 'This internal monitor detects Windows 11 24H2 and 25H2 devices that are ready for an enablement package upgrade and runs the Update Windows 11 [Enablement Package] [Autofix] script on them during their installation window.'
tags: ['update', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-11-09
---

## Summary

This internal monitor finds Windows 11 devices that are ready for their next enablement package upgrade. It runs the [Update Windows 11 [Enablement Package] [Autofix]](/docs/451e5dc2-dc40-11f1-90d7-92000234cfc2) script on them through its alert template. The monitor runs every hour.

A device is detected when all of these are true:

- It runs Windows 11 24H2 or 25H2. LTSC editions are not included.
- The [Windows 11 Compatibility Audit](/docs/f0bb3ffc-60cb-484c-b7fa-27a386ac664c) solution marks it as compatible.
- It contacted Automate in the last 15 minutes.
- The upgrade to its next version is turned on, and no Disable EDF blocks it.
- The current time is inside its installation window.
- The script has not run on it in the last 7 days. A device that has moved from 24H2 to 25H2 since its last run is the exception.
- Its client is still under its limit of devices upgraded in the last 24 hours.

The monitor also passes each device's settings to the script: the target version, the restart settings, the safeguard hold override, failure tickets, and reboot prompts. See [How Settings Are Applied](/docs/451e5dc2-dc40-11f1-90d7-92000234cfc2#how-settings-are-applied) for how these settings are worked out.

## Dependencies

- [Script: Update Windows 11 [Enablement Package] [Autofix]](/docs/451e5dc2-dc40-11f1-90d7-92000234cfc2)
- [Solution: Windows 11 Compatibility Audit](/docs/f0bb3ffc-60cb-484c-b7fa-27a386ac664c)
- [Custom Table: plugin_proval_windows11_readiness](/docs/74cca89e-effd-4af7-a73a-53a30b91c8a7)
- [Solution: Windows 11 Enablement Package Upgrade](/docs/b3a6abf9-10cd-40fe-a628-d736665b8963)

## Target

Global

## Alert Template

`△ Custom - Execute Script - Update Windows 11 [Enablement Package] [Autofix]`

## Ticket Category

Failure tickets created by the script use the Ticket Category set on this monitor's **Alerting** tab. Set it to control the board and priority of those tickets.

## Changelog

### 2026-11-09

- Initial version of the document.
