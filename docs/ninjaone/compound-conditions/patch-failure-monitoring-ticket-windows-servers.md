---
id: 'fafe75cc-3caa-4713-9f78-507ad9eec3b5'
slug: /fafe75cc-3caa-4713-9f78-507ad9eec3b5
title: 'Patch Failure Monitoring - Ticket [Windows Servers]'
title_meta: 'Patch Failure Monitoring - Ticket [Windows Servers]'
keywords: ['patching', 'patch-failure', 'ticket', 'compound-condition']
description: 'Creates a ConnectWise Manage ticket for Windows servers whose consecutive failed patch windows reached the ticket threshold.'
tags: ['ticketing', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-11-23
---

## Summary

Runs [Patch Failure Monitoring - Detection](/docs/97aa8bfb-f376-4acf-8241-782c364d3d18) every hour, with **Check** set to `Ticket`, on Windows servers that have a value in [cPVAL Patch Failure Last Window](/docs/5b700551-2f69-4ac2-9489-bfa279c8d7ac) and where [cPVAL Patch Failure Monitoring](/docs/b3797751-cb85-4d82-b943-3bde379d6481) is `Windows` or `Windows Servers`. When [cPVAL Patch Failure Count](/docs/02b8e35f-c8dd-4685-a00b-412fd0112c7c) has reached the ticket threshold in [cPVAL Patch Failure Ticket Server](/docs/3c54b72d-8fb2-49bd-a2a2-5c6b08833b12), the detection script exits with `1` and writes `Failure: Ticket required`, followed by the failed patch windows, the KB number and name of each failed update, when the repair ran and what to try next. The compound condition then creates a ConnectWise Manage ticket with the [Consecutive Patch Failures](/docs/d5aaffa6-061b-4349-86f3-cf30b9a3cd14) template, including that text in the ticket.

The condition resets when a successful patch window resets the count and clears [cPVAL Patch Failure Last Window](/docs/5b700551-2f69-4ac2-9489-bfa279c8d7ac), or when the device stops being monitored, and the ticket template then closes the ticket.

## Details

- **Name:** `Patch Failure Monitoring - Ticket [Windows Servers]`
- **Description:** `Creates a ConnectWise Manage ticket for Windows servers whose consecutive failed patch windows reached the ticket threshold.`
- **Recommended Agent Policies:** `Windows Server Policy`

## Dependencies

- [Custom Field: cPVAL Patch Failure Monitoring](/docs/b3797751-cb85-4d82-b943-3bde379d6481)
- [Custom Field: cPVAL Patch Failure Autofix Server](/docs/62bf3875-c734-48e8-b518-b53373a9137e)
- [Custom Field: cPVAL Patch Failure Ticket Server](/docs/3c54b72d-8fb2-49bd-a2a2-5c6b08833b12)
- [Custom Field: cPVAL Patch Failure Count](/docs/02b8e35f-c8dd-4685-a00b-412fd0112c7c)
- [Custom Field: cPVAL Patch Failure Last Window](/docs/5b700551-2f69-4ac2-9489-bfa279c8d7ac)
- [Custom Field: cPVAL Patch Failure Detail](/docs/b23a6da2-148f-4649-9233-c02170b5e72f)
- [Automation: Patch Failure Monitoring - Detection](/docs/97aa8bfb-f376-4acf-8241-782c364d3d18)
- [Ticket Template: Consecutive Patch Failures](/docs/d5aaffa6-061b-4349-86f3-cf30b9a3cd14)
- [Automation: Patch Failure Monitoring](/docs/28302386-1560-4468-be5c-c9d683b99e65)
- [Solution: Patch Failure Monitoring - NinjaOne](/docs/020ff3c5-06a6-4f98-9eaa-7f7392b2257a)

## Compound Condition Creation

[Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/patch-failure-monitoring-ticket-windows-servers.toml)

## Changelog

### 2026-11-23

- Initial version of the document
