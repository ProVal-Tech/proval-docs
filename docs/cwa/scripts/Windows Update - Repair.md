---
id: 'aaa3f8da-cfd3-454a-808b-d4501f9c2608'
slug: /aaa3f8da-cfd3-454a-808b-d4501f9c2608
title: 'Windows Update - Repair'
title_meta: 'Windows Update - Repair'
keywords: ['repair', 'windows', 'update', 'settings', 'script']
description: 'This document outlines a script designed to repair and reset Windows update settings, aiming to resolve potential patching issues on Windows devices. It details the script’s dependencies, global and user parameters, process, and expected output, including logging of successes and failures.'
tags: ['performance', 'software', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

This script attempts to repair and reset Windows update settings using the ProVal script: [Repair-WindowsUpdate](/docs/powershell/Repair-WindowsUpdate.md)
The goal of this script is to fix potential patching issues for Windows devices.

## Sample Run

![Sample Run](<../../../static/img/docs/Windows Update - Repair/image.png>)

## Dependencies

[Repair-WindowsUpdate](/docs/powershell/Repair-WindowsUpdate.md)

## Global Parameters

| Name                      | Example                          | Description                                                                    |
|---------------------------|----------------------------------|--------------------------------------------------------------------------------|
| Email                     | [Someone@somewhere.com](mailto:Someone@somewhere.com) | The email address of the recipient for any failed run of the script.          |
| TicketOnFailure-G         | 1 or anything else               | 1 will enable ticketing on failure; anything else disables this feature.      |
| TicketCreationCategory     | 178                              | The ticket creation category for the created ticket.                          |

## User Parameters

| Name            | Example            | Required | Description                                                              |
|-----------------|--------------------|----------|--------------------------------------------------------------------------|
| SfcScan         | 1                  | False    | 1 to execute SFC Scan as well; leave it blank to skip SFC Scan.          |
| TicketOnFailure | 1 or anything else | False    | 1 will enable ticketing on failure; anything else will disable this feature. |
| DISMRepair      | 1                  | False    | 1 to execute the DISM repair task with the windows patch component reset  |

## Process

Executes the Agnostic script [Repair-WindowsUpdate](/docs/powershell/Repair-WindowsUpdate.md) Attempts to remove the `SoftwareDistribution.old` and `catroot2.old` directories if new `SoftwareDistribution` and `catroot2` directories are created. Reset the Windows update components. Logs successes and failures accordingly. If the script fails to repair the device, it will verify the global variable settings and notify as configured.

Note: Please whitelist the below filehash in the security application for the PowerShell successful execution:

`1D7C348C9B7C33C0FA677713A19A992E`
`D056A7921569BF0E637AC8EBF03D0DC5`



## Output

- Script Logs


