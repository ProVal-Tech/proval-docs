---
id: 'f458ca84-e7c2-44d1-ad9c-15421c77d5d4'
slug: /f458ca84-e7c2-44d1-ad9c-15421c77d5d4
title: 'Auto Reboot Management - Reboot Failure [Windows Servers]'
title_meta: 'Auto Reboot Management - Reboot Failure [Windows Servers]'
keywords: ['reboot', 'failure', 'ticket', 'auto-reboot', 'compound-condition']
description: 'Creates a ConnectWise Manage ticket for Windows servers whose scheduled restart failed, when cPVAL Auto Reboot Failure Ticket is Windows or Windows Servers.'
tags: ['ticketing', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-11-11
---

## Summary

Runs [Auto Reboot Management - Failure Detection](/docs/6bf3e590-1fb6-4dc8-9b38-423176e0025c) every 30 minutes on Windows servers where [cPVAL Auto Reboot Failure](/docs/3b31f3bd-c1b1-4f43-bce9-ea6f669f783a) holds a failure and [cPVAL Auto Reboot Failure Ticket](/docs/4c0f96e5-8387-4cb6-8426-d267ec01b0f9) is `Windows` or `Windows Servers`. When the detection script confirms the failure, it exits with `1` and writes `Detected:` followed by the failure, and the compound condition creates a ConnectWise Manage ticket with the [Auto Reboot Failure](/docs/375c80c2-07dd-43b9-b24b-3cc4c948c105) template, including the failure in the ticket.

The condition resets when the failure field is cleared, either by a later confirmed restart or by a technician, and the ticket template then closes the ticket.

## Details

- **Name:** `Auto Reboot Management - Reboot Failure [Windows Servers]`
- **Description:** `Creates a ConnectWise Manage ticket for Windows servers whose scheduled restart failed, when cPVAL Auto Reboot Failure Ticket is Windows or Windows Servers.`
- **Recommended Agent Policies:** `Windows Server Policy`

## Dependencies

- [Custom Field: cPVAL Auto Reboot Failure](/docs/3b31f3bd-c1b1-4f43-bce9-ea6f669f783a)
- [Custom Field: cPVAL Auto Reboot Failure Ticket](/docs/4c0f96e5-8387-4cb6-8426-d267ec01b0f9)
- [Automation: Auto Reboot Management - Failure Detection](/docs/6bf3e590-1fb6-4dc8-9b38-423176e0025c)
- [Ticket Template: Auto Reboot Failure](/docs/375c80c2-07dd-43b9-b24b-3cc4c948c105)
- [Automation: Auto Reboot Management](/docs/15697579-8f51-4c51-9812-d909edebfc8b)
- [Solution: Auto Reboot Management - NinjaOne](/docs/52091463-99b7-4a21-8ad0-7ade5b8212e7)

## Compound Condition Creation

[Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/auto-reboot-management-reboot-failure-windows-servers.toml)

## Changelog

### 2026-11-11

- Initial version of the document
