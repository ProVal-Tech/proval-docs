---
id: 'b04bc7eb-65ce-4684-b787-3b248fcd44f6'
slug: /b04bc7eb-65ce-4684-b787-3b248fcd44f6
title: 'Update Screenconnect Version'
title_meta: 'Update Screenconnect Version'
keywords: ['screenconnect', 'update', 'script', 'connectwise', 'agent']
description: 'This document outlines a script designed to update Screenconnect versions on both Windows and Mac machines. It automatically downloads the Connectwise Control MSI and installs it, ensuring that the agent is up-to-date. The script is integrated with Automate and is intended to run as an auto-fix through an internal monitor, enabling seamless updates of the Screenconnect agent.'
tags: ['connectwise', 'ticketing', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

The purpose of this script is to update the Screenconnect versions on the machine. It downloads the Connectwise Control MSI and installs it to update the agent. The script supports both Windows and Mac machines and is limited to ScreenConnect integrated with Automate only.

## Script Target

Both Windows and Mac machines

## Sample Run

The script is intended to run as an auto-fix with the internal monitor [CWC - Internal Monitor - Outdated Screenconnect Version](/docs/f3fa89f2-9c7a-44ab-a6d9-14a37b205e7d), so the agent gets updated automatically.

## Global Parameters

| Name                     | Example | Required | Description                                                                                  |
|--------------------------|---------|----------|----------------------------------------------------------------------------------------------|
| TicketCreationCategory    | 293     | True     | Specify the ticket creation category to enable ticketing on the machine. Use '0' to disable ticketing. |

## Dependencies

[CWC - Internal Monitor - Outdated Screenconnect Version](/docs/f3fa89f2-9c7a-44ab-a6d9-14a37b205e7d)

## Output

- Script log
- Tickets

## Ticketing

To enable ticketing on failure, the ticket category must be set in the global parameters of the script. The TicketCreationCategory parameter should not be equal to '0'.

**Ticket Subject:** `CW Control Agent Update - Failed - %ClientName%/%ComputerName%`

**Ticket Body:**  `Script failed to update the Screenconnect version on the machine....!!`

If the Screenconnect service fails to start after running the installation:

`The script tried to run the installer but could not find the Screenconnect service on the machine anymore. Run the CW control repair script to resolve the issue.`

