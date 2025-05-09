---
id: 'd87e16ae-34f2-43ba-a84d-061abc69d716'
slug: /d87e16ae-34f2-43ba-a84d-061abc69d716
title: 'Copilot Disable and Uninstall'
title_meta: 'Copilot Disable and Uninstall'
keywords: ['Copilot', 'Pilot', 'Microsoft', 'Edge', 'Browser']
description: 'This monitor disables the copilot and uninstall it from the detected agents'
tags: ['api', 'edge', 'browsers', 'windows']
draft: false
unlisted: false
---

## Summary

This monitor disables the copilot and uninstall it from the detected agents

It also depends on the following EDFs:

## EDFs

| Name                    | Level    | Type     | Example                       | Description                                                                                                      |
|-------------------------|----------|----------|-------------------------------|------------------------------------------------------------------------------------------------------------------|
| Copilot_Status          | Client   | Text     | Disabled -- 2025-02-28 00:00:00 | This stores the Copilot status after script completion with the script ran date and time                         |
| Exclude Copilot Disable | Computer | Checkbox | 1 or 0                         | This excludes the agent from getting its copilot disabled and uninstalled                                        |
| Exclude Copilot Disable | Location | Checkbox | 1 or 0                         | This excludes the agents of the location from getting its copilot disabled and uninstalled                       |
| Copilot Disable and Uninstall | Client | Checkbox | 1 or 0                         | This checkbox sets the agents of the client to disable its copilot and uninstall it completely                   |

## Dependencies

[Script_Copilot_Enable_Disable](/docs/42e9ec1d-84df-11ef-8a0f-8600008a66b7)

Alert Template - `△ Custom - Execute Script - Copilot - Enable/Disable`

## Target

Global