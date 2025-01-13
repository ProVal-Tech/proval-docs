---
id: 'cwa-update-screenconnect'
title: 'Update Screenconnect Versions'
title_meta: 'Update Screenconnect Versions'
keywords: ['screenconnect', 'update', 'script', 'connectwise', 'agent']
description: 'This document outlines a script designed to update Screenconnect versions on both Windows and Mac machines. It automatically downloads the Connectwise Control MSI and installs it, ensuring that the agent is up-to-date. The script is integrated with Automate and is intended to run as an auto-fix through an internal monitor, enabling seamless updates of the Screenconnect agent.'
tags: ['connectwise', 'update', 'ticketing', 'windows', 'mac', 'monitor']
draft: false
unlisted: false
---
## Summary

The purpose of this script is to update the Screenconnect versions on the machine. It downloads the Connectwise control msi and installs it to update the agent. The script supports both Windows and Mac machines and is limited to ScreenConnect integrated with Automate only.

## Script Target

Both Windows and MAC machines

## Sample Run

The script is intended to run as an auto-fix with the internal monitor [CWC - Internal Monitor - Outdated Screenconnect Version](https://proval.itglue.com/DOC-5078775-13978385) so the agent gets updated automatically.

## Global Parameters

| Name                     | Example | Required | Description                                                                                  |
|--------------------------|---------|----------|----------------------------------------------------------------------------------------------|
| TicketCreationCategory    | 293     | True     | Mention the ticket creation category in order to enable ticketing on the machine. Mention it as '0' to disable Ticketing. |

## Dependencies

[CWC - Internal Monitor - Outdated Screenconnect Version](https://proval.itglue.com/DOC-5078775-13978385)

## Output

- Script log
- Tickets

## Ticketing

To enable the ticketing on failure, the ticket category must be set in the global parameter of the script. The TicketCreationCategory parameter should not be equal to '0'.

**Ticket Subject:** `CW Control Agent Update - Failed - %ClientName%\%ComputerName%`

**Ticket Body:**  `Script failed to update the screenconnect version on the machine....!!`

If screen connect service fails to start after running the installation:

`The script tried to run the installer but could not find the screen connect service on the machine anymore. Run the CW control repair script to resolve the issue.`


