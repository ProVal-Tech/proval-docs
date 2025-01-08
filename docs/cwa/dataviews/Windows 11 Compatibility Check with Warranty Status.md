---
id: 'cwa-windows11-compatibility-check'
title: 'Windows 11 Compatibility Check'
title_meta: 'Windows 11 Compatibility Check'
keywords: ['windows', 'upgrade', 'compatibility', 'check', 'machine', 'status', 'client', 'location']
description: 'This document provides an overview of how to determine which machines are eligible for an upgrade to Windows 11 using a PowerShell script. It details dependencies, the columns of data returned, and the significance of each column in assessing compatibility.'
tags: ['windows', 'upgrade', 'compatibility', 'client', 'location', 'memory', 'cpu', 'secureboot', 'tpm', 'warranty']
draft: false
unlisted: false
---
## Summary

Shows which machines are eligible to upgrade to Windows 11 based on the PowerShell script provided by Microsoft.

## Dependencies

- [plugin_proval_windows11_readiness](https://proval.itglue.com/DOC-5078775-8355448)
- [Windows 11 compatibility Check [DV]](https://proval.itglue.com/DOC-5078775-8355447)
- [Scalepad's Warranty Master Plugin](https://help.scalepad.com/en/articles/5899906-connectwise-automate-integration-instructions)

## Columns

| Column                     | Description                                                                                         |
|----------------------------|-----------------------------------------------------------------------------------------------------|
| Client Name                | Name of the Client.                                                                                |
| Location Name              | Name of the Location.                                                                               |
| Computer Name              | Name of the Computer.                                                                               |
| Operating System           | Name of the Operating System.                                                                        |
| OS Version                 | Build number of the Operating System.                                                               |
| Last Contact               | Last Contact of the machine with Automate Server.                                                  |
| Compatibility Check        | Displays the Windows 11 compatibility status of machine. Values can be Capable, Not Capable, Undetermined, or Script Failed. |
| Secureboot Check           | Secureboot status of the machine against the compatibility check. Values can be Fail or Pass.      |
| Memory Check               | Memory check of the machine against the compatibility check. Values can be Fail or Pass.           |
| CPU Check                  | CPU check of the machine against the compatibility check. Values can be Fail or Pass.              |
| OS Drive Space Check       | OS Drive Space Check of the machine against the compatibility check. Values can be Fail or Pass.   |
| TPM Check                  | TPM Version check of the machine against the compatibility check. Values can be Fail or Pass.      |
| Script Last Ran            | The last time the compatibility check script was run against the target device.                    |
| Last User                  | Last User logged on to the machine according to Automate.                                          |
| Purchase Date              | Purchase Date of the Device.                                                                        |
| Expiry Date                | Warranty Expiry Date of the Device.                                                                 |
| Warranty Status            | Warranty Status of the Device (Expired/Expiring Soon/In Warranty).                                 |


