---
id: '41ccbc86-b7f0-4674-9c7c-f765a0e0df01'
slug: /41ccbc86-b7f0-4674-9c7c-f765a0e0df01
title: 'Auto Reboot Management - Reboot Trigger [Windows Servers]'
title_meta: 'Auto Reboot Management - Reboot Trigger [Windows Servers]'
keywords: ['reboot', 'trigger', 'auto-reboot', 'compound-condition']
description: 'Runs Auto Reboot Management - Reboot Detection every 6 minutes on Windows servers with a reboot request, and Auto Reboot Management - Reboot Machine when the request is pending.'
tags: ['windows']
draft: false
unlisted: false
last_update:
  date: 2026-11-11
---

## Summary

Runs [Auto Reboot Management - Reboot Detection](/docs/43641711-d392-4d1e-af16-991a71b6536a) every 6 minutes on Windows servers that have a value in [cPVAL Auto Reboot Scheduled For](/docs/e66d4978-0402-4f68-bc8d-af7d32dafce6). When the detection script finds a pending restart request, it exits with `1` and writes `Detected:`, and the compound condition runs [Auto Reboot Management - Reboot Machine](/docs/585400cb-52f4-4432-84b7-a57569a3dc39), which schedules the restart for the requested time.

The condition resets 3 minutes after it triggers, so a new request is picked up at the next check. It creates no ticket and doesn't affect the device's health status.

## Details

- **Name:** `Auto Reboot Management - Reboot Trigger [Windows Servers]`
- **Description:** `Runs Auto Reboot Management - Reboot Detection every 6 minutes on Windows servers with a reboot request, and Auto Reboot Management - Reboot Machine when the request is pending.`
- **Recommended Agent Policies:** `Windows Server Policy`

## Dependencies

- [Custom Field: cPVAL Auto Reboot Scheduled For](/docs/e66d4978-0402-4f68-bc8d-af7d32dafce6)
- [Automation: Auto Reboot Management - Reboot Detection](/docs/43641711-d392-4d1e-af16-991a71b6536a)
- [Automation: Auto Reboot Management - Reboot Machine](/docs/585400cb-52f4-4432-84b7-a57569a3dc39)
- [Automation: Auto Reboot Management](/docs/15697579-8f51-4c51-9812-d909edebfc8b)
- [Solution: Auto Reboot Management - NinjaOne](/docs/52091463-99b7-4a21-8ad0-7ade5b8212e7)

## Compound Condition Creation

[Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/auto-reboot-management-reboot-trigger-windows-servers.toml)

## Changelog

### 2026-11-11

- Initial version of the document
