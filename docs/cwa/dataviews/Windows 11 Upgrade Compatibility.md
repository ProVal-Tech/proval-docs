---
id: 'cwa-windows-11-compatibility-check'
title: 'Windows 11 Compatibility Check'
title_meta: 'Windows 11 Compatibility Check'
keywords: ['windows', 'upgrade', 'compatibility', 'check', 'machine']
description: 'This document provides a detailed overview of a PowerShell script that checks which machines are eligible for an upgrade to Windows 11. It includes information on dependencies, column descriptions, and format control for compatibility checks.'
tags: ['windows', 'upgrade', 'check', 'configuration', 'performance']
draft: false
unlisted: false
---
## Summary

Shows which machines are eligible to upgrade to Windows 11 based on the PowerShell script provided by Microsoft.

## Dependencies

- [EPM - Windows Configuration - Custom Table - plugin_proval_windows11_readiness](https://proval.itglue.com/DOC-5078775-8355448)
- [SEC - Windows Patching - Script - Windows - Check Windows 11 Compatibility](https://proval.itglue.com/DOC-5078775-8355447)
- [CWM - Automate - Monitor - Execute Script - Windows - Check Windows 11 Compatibility](https://proval.itglue.com/DOC-5078775-11364499)

## Columns

| Column                | Description                                                                                          |
|----------------------|------------------------------------------------------------------------------------------------------|
| Client Name          | Name of the Client.                                                                                  |
| Location Name        | Name of the Location.                                                                                |
| Computer Name        | Name of the Computer.                                                                                |
| Operating System     | Name of the Operating System.                                                                         |
| OS Version           | Build number of the Operating System.                                                                |
| Last Contact         | Last Contact of the machine with Automate Server.                                                  |
| Compatibility Check   | Displays the Windows 11 compatibility status of machine. Values can be Capable, Not Capable, Undetermined, or Script Failed. |
| Secureboot Check     | Secureboot status of the machine against the compatibility check. Values can be Fail or Pass.       |
| Memory Check         | Memory check of the machine against the compatibility check. Values can be Fail or Pass.           |
| CPU Check            | CPU check of the machine against the compatibility check. Values can be Fail or Pass.              |
| OS Drive Space Check | OS Drive Space Check of the machine against the compatibility check. Values can be Fail or Pass.   |
| TPM Check            | TPM Version check of the machine against the compatibility check. Values can be Fail or Pass.      |
| Script Last Ran      | The last time the compatibility check script was run against the target device.                     |
| Last User            | Last User logged on to the machine according to Automate.                                          |

## Format Control

| Column Name         | Operator | Comparator     | Color  |
|---------------------|----------|----------------|--------|
| Compatibility Check  | Equals   | Not Capable    | Red    |
| Compatibility Check  | Equals   | Undetermined    | Orange |
| Compatibility Check  | Equals   | Capable        | Green  |


