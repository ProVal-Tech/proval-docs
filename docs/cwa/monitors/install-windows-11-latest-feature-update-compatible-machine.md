---
id: '0a6c0ea2-f1d1-4e29-bcc5-954341d10baa'
slug: /0a6c0ea2-f1d1-4e29-bcc5-954341d10baa
title: 'Install Windows 11 Latest Feature Update - Compatible Machines'
title_meta: 'Install Windows 11 Latest Feature Update - Compatible Machines'
keywords: ['windows','monitor', 'readiness','compatibility', 'upgrade']
description: 'It executes Windows 11 Feature Update script on Compatible Windows 11 24H2+ script.'
tags:  ['database', 'report', 'setup', 'update', 'windows']
draft: False
unlisted: false
last_update:
  date: 2026-03-09
---

## Summary

This monitor set executes the **[Install Windows 11 Feature Update [Update Assistant, Reboot]](/docs/50c89c87-2a2c-4ba8-a15b-ac05722a81ec)** script on compatible machines to install the latest Windows 11 feature update (24H2+). To prevent disruption during the workday, a time-gate restricts execution to off-hours (**6:00 PM to 6:00 AM**), as the process involves a forced reboot.

To ensure a controlled rollout, the monitor selects a randomized batch of machines per client each night. The default limit is four machines, unless a custom limit is defined. If the execution fails, the script retries every 48 hours, making a maximum of three attempts before excluding the machine from future runs.

> This monitor set is controlled by EDFs. Refer to the [EDFs section in the solution's document](/docs/00b08a60-f202-42db-9f67-a76ea29289fa#edfs) for detailed information.

## Dependencies

- [Custom Field: plugin_proval_windows_os_support](/docs/938cd822-f6a3-4ee3-add2-62b407e45622)
- [Solution: Windows 11 Compatibility Audit](/docs/f0bb3ffc-60cb-484c-b7fa-27a386ac664c)
- [Script: Install Windows 11 Feature Update [Update Assistant, Reboot]](/docs/50c89c87-2a2c-4ba8-a15b-ac05722a81ec)
- [Script: Windows 11 Feature Update [Cleanup]](/docs/e0f9ecf2-eac8-4bd1-a269-0dbf7bd0a645)
- [Solution : Windows 11 Installation and Feature Update](/docs/00b08a60-f202-42db-9f67-a76ea29289fa)
- Alert Template: △ Custom - Install Windows 11 Feature Update - Compatible Machines

## Target

Global

## Changelog

### 2026-03-09

- Initial version of the document
