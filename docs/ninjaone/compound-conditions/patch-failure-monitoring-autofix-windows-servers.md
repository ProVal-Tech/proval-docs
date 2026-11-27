---
id: 'ae7d3fd7-d4b4-4e0e-88a4-ed917a5dd402'
slug: /ae7d3fd7-d4b4-4e0e-88a4-ed917a5dd402
title: 'Patch Failure Monitoring - Autofix [Windows Servers]'
title_meta: 'Patch Failure Monitoring - Autofix [Windows Servers]'
keywords: ['patching', 'patch-failure', 'autofix', 'repair-windows-update', 'compound-condition']
description: 'Runs Repair Windows Update on Windows servers whose consecutive failed patch windows reached the autofix threshold, once per failed patch window.'
tags: ['windows']
draft: false
unlisted: false
last_update:
  date: 2026-11-23
---

## Summary

Runs [Patch Failure Monitoring - Detection](/docs/97aa8bfb-f376-4acf-8241-782c364d3d18) every hour, with **Check** set to `Autofix`, on Windows servers that have a value in [cPVAL Patch Failure Last Window](/docs/5b700551-2f69-4ac2-9489-bfa279c8d7ac) and where [cPVAL Patch Failure Monitoring](/docs/b3797751-cb85-4d82-b943-3bde379d6481) is `Windows` or `Windows Servers`. When [cPVAL Patch Failure Count](/docs/02b8e35f-c8dd-4685-a00b-412fd0112c7c) has reached the autofix threshold in [cPVAL Patch Failure Autofix Server](/docs/62bf3875-c734-48e8-b518-b53373a9137e) but not the ticket threshold, and no repair was requested since the latest failed patch window started, the detection script records the time in [cPVAL Patch Failure Autofix Date](/docs/6a454795-0de4-40c9-ab25-d016b42ccd7a), exits with `1` and writes `Failure: Autofix required`. The compound condition then runs [Repair Windows Update](/docs/d7bb77e6-e7b8-45d2-9fa7-f109574aa887) with no options, which resets the Windows Update components and scans for updates again.

The condition resets at the next check, once the repair is recorded, so the repair runs once per failed patch window. It creates no ticket and doesn't affect the device's health status.

## Details

- **Name:** `Patch Failure Monitoring - Autofix [Windows Servers]`
- **Description:** `Runs Repair Windows Update on Windows servers whose consecutive failed patch windows reached the autofix threshold, once per failed patch window.`
- **Recommended Agent Policies:** `Windows Server Policy`

## Dependencies

- [Custom Field: cPVAL Patch Failure Monitoring](/docs/b3797751-cb85-4d82-b943-3bde379d6481)
- [Custom Field: cPVAL Patch Failure Autofix Server](/docs/62bf3875-c734-48e8-b518-b53373a9137e)
- [Custom Field: cPVAL Patch Failure Count](/docs/02b8e35f-c8dd-4685-a00b-412fd0112c7c)
- [Custom Field: cPVAL Patch Failure Last Window](/docs/5b700551-2f69-4ac2-9489-bfa279c8d7ac)
- [Custom Field: cPVAL Patch Failure Autofix Date](/docs/6a454795-0de4-40c9-ab25-d016b42ccd7a)
- [Automation: Patch Failure Monitoring - Detection](/docs/97aa8bfb-f376-4acf-8241-782c364d3d18)
- [Automation: Repair Windows Update](/docs/d7bb77e6-e7b8-45d2-9fa7-f109574aa887)
- [Automation: Patch Failure Monitoring](/docs/28302386-1560-4468-be5c-c9d683b99e65)
- [Solution: Patch Failure Monitoring - NinjaOne](/docs/020ff3c5-06a6-4f98-9eaa-7f7392b2257a)

## Compound Condition Creation

[Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/patch-failure-monitoring-autofix-windows-servers.toml)

## Changelog

### 2026-11-23

- Initial version of the document
