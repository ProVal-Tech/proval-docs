---
id: 'd4488df1-2292-4886-ab7a-46207ec6f856'
slug: /d4488df1-2292-4886-ab7a-46207ec6f856
title: 'Patch Failure Monitoring - Ticket [Windows Workstations]'
title_meta: 'Patch Failure Monitoring - Ticket [Windows Workstations]'
keywords: ['patching', 'patch-failure', 'ticket', 'compound-condition']
description: 'Creates a ConnectWise Manage ticket for Windows workstations whose consecutive failed patch windows reached the ticket threshold.'
tags: ['ticketing', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-11-23
---

## Summary

Runs [Patch Failure Monitoring - Detection](/docs/97aa8bfb-f376-4acf-8241-782c364d3d18) every hour, with **Check** set to `Ticket`, on Windows workstations that have a value in [cPVAL Patch Failure Last Window](/docs/5b700551-2f69-4ac2-9489-bfa279c8d7ac) and where [cPVAL Patch Failure Monitoring](/docs/b3797751-cb85-4d82-b943-3bde379d6481) is `Windows` or `Windows Workstations`. When [cPVAL Patch Failure Count](/docs/02b8e35f-c8dd-4685-a00b-412fd0112c7c) has reached the ticket threshold in [cPVAL Patch Failure Ticket Workstation](/docs/4e93e558-3a43-4d58-b60b-e6391fb79e46), the detection script exits with `1` and writes `Failure: Ticket required`, followed by the failed patch windows, the KB number and name of each failed update, when the repair ran and what to try next. The compound condition then creates a ConnectWise Manage ticket with the [Consecutive Patch Failures](/docs/d5aaffa6-061b-4349-86f3-cf30b9a3cd14) template, including that text in the ticket.

The condition resets when a successful patch window resets the count and clears [cPVAL Patch Failure Last Window](/docs/5b700551-2f69-4ac2-9489-bfa279c8d7ac), or when the device stops being monitored, and the ticket template then closes the ticket.

## Details

- **Name:** `Patch Failure Monitoring - Ticket [Windows Workstations]`
- **Description:** `Creates a ConnectWise Manage ticket for Windows workstations whose consecutive failed patch windows reached the ticket threshold.`
- **Recommended Agent Policies:** `Windows Workstation Policy`

## Dependencies

- [Custom Field: cPVAL Patch Failure Monitoring](/docs/b3797751-cb85-4d82-b943-3bde379d6481)
- [Custom Field: cPVAL Patch Failure Autofix Workstation](/docs/04f87a60-2857-4253-bca8-f4addd2f71fe)
- [Custom Field: cPVAL Patch Failure Ticket Workstation](/docs/4e93e558-3a43-4d58-b60b-e6391fb79e46)
- [Custom Field: cPVAL Patch Failure Count](/docs/02b8e35f-c8dd-4685-a00b-412fd0112c7c)
- [Custom Field: cPVAL Patch Failure Last Window](/docs/5b700551-2f69-4ac2-9489-bfa279c8d7ac)
- [Custom Field: cPVAL Patch Failure Detail](/docs/b23a6da2-148f-4649-9233-c02170b5e72f)
- [Automation: Patch Failure Monitoring - Detection](/docs/97aa8bfb-f376-4acf-8241-782c364d3d18)
- [Ticket Template: Consecutive Patch Failures](/docs/d5aaffa6-061b-4349-86f3-cf30b9a3cd14)
- [Automation: Patch Failure Monitoring](/docs/28302386-1560-4468-be5c-c9d683b99e65)
- [Solution: Patch Failure Monitoring - NinjaOne](/docs/020ff3c5-06a6-4f98-9eaa-7f7392b2257a)

## Compound Condition Creation

[Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/patch-failure-monitoring-ticket-windows-workstations.toml)

## Changelog

### 2026-11-23

- Initial version of the document
