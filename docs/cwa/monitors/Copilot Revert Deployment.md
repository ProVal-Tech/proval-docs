---
id: '5dc486d6-d03e-4a76-a1b9-b5cd68c5b2a2'
slug: /5dc486d6-d03e-4a76-a1b9-b5cd68c5b2a2
title: 'Copilot Revert Deployment'
title_meta: 'Copilot Revert Deployment'
keywords: ['Copilot', 'Pilot', 'Microsoft', 'Edge', 'Browser']
description: 'This monitor revert the copilot changes and ensures to enable and install the copilot on the agents where the script has disabled and uninstalled it'
tags: ['Copilot', 'Pilot', 'Microsoft', 'Edge', 'Browser']
draft: false
unlisted: false
---

## Summary

This monitor revert the copilot changes and ensures to enable and install the copilot on the agents where the script has disabled and uninstalled it.

It also depends on the following EDFs:

## EDFs

| Name                    | Level    | Type     | Example                       | Description                                                                                                      |
|-------------------------|----------|----------|-------------------------------|------------------------------------------------------------------------------------------------------------------|
| Copilot_Status          | Client   | Text     | Disabled -- 2025-02-28 00:00:00 | This stores the Copilot status after script completion with the script ran date and time                         |
| Exclude Copilot Revert  | Computer | Checkbox | 1 or 0                         | This excludes the copilot revert action for the computer where it is checked                                     |
| Exclude Copilot Revert  | Location | Checkbox | 1 or 0                         | This excludes the agents of the location where it is checked                                                     |
| Copilot Revert Enable   | Client   | Checkbox | 1 or 0                         | This check box allows the agents of clients to revert the Copilot disabling and uninstallation                   |
## Dependencies

[Script_Copilot_Enable_Disable](<../scripts/Copilot - Enable-Disable.md>)

Alert Template - `△ Custom - Execute Script - Copilot - Enable/Disable`

## Target

Global
