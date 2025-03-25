---
id: '8f914719-a7f7-4ed8-99fb-667c8c26237d'
slug: /8f914719-a7f7-4ed8-99fb-667c8c26237d
title: 'Windows 11 Compatibility Check with Warranty Status'
title_meta: 'Windows 11 Compatibility Check with Warranty Status'
keywords: ['windows', 'upgrade', 'compatibility', 'check', 'machine', 'status', 'client', 'location']
description: 'This document provides an overview of how to determine which machines are eligible for an upgrade to Windows 11 using a PowerShell script. It details dependencies, the columns of data returned, and the significance of each column in assessing compatibility.'
tags: ['cpu', 'memory', 'secureboot', 'tpm', 'windows']
draft: false
unlisted: false
---

## Summary

This document shows which machines are eligible to upgrade to Windows 11 based on the PowerShell script provided by Microsoft.

## Dependencies

- [plugin_proval_windows11_readiness](<../tables/plugin_proval_windows11_readiness.md>)
- [Windows 11 Compatibility Check [DV]](<../scripts/Windows - Check Windows 11 Compatibility.md>)
- [Scalepad's Warranty Master Plugin](https://help.scalepad.com/en/articles/5899906-connectwise-automate-integration-instructions)

## Columns

| Column                     | Description                                                                                         |
|----------------------------|-----------------------------------------------------------------------------------------------------|
| Client Name                | Name of the Client.                                                                                |
| Location Name              | Name of the Location.                                                                               |
| Computer Name              | Name of the Computer.                                                                               |
| Operating System           | Name of the Operating System.                                                                        |
| OS Version                 | Build number of the Operating System.                                                               |
| Last Contact               | Last contact of the machine with the Automate Server.                                              |
| Compatibility Check        | Displays the Windows 11 compatibility status of the machine. Values can be Capable, Not Capable, Undetermined, or Script Failed. |
| Secureboot Check           | Secureboot status of the machine against the compatibility check. Values can be Fail or Pass.      |
| Memory Check               | Memory check of the machine against the compatibility check. Values can be Fail or Pass.           |
| CPU Check                  | CPU check of the machine against the compatibility check. Values can be Fail or Pass.              |
| OS Drive Space Check       | OS Drive Space check of the machine against the compatibility check. Values can be Fail or Pass.   |
| TPM Check                  | TPM Version check of the machine against the compatibility check. Values can be Fail or Pass.      |
| Script Last Ran            | The last time the compatibility check script was run against the target device.                    |
| Last User                  | Last user logged on to the machine according to Automate.                                          |
| Purchase Date              | Purchase date of the device.                                                                        |
| Expiry Date                | Warranty expiry date of the device.                                                                 |
| Warranty Status            | Warranty status of the device (Expired/Expiring Soon/In Warranty).                                 |



