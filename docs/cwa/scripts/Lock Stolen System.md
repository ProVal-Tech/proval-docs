---
id: 'cwa-lock-stolen-system'
title: 'Lock Stolen System'
title_meta: 'Lock Stolen System'
keywords: ['stolen', 'bitlocker', 'lockdown', 'security', 'encryption', 'tracking', 'windows']
description: 'This document provides a detailed overview of a script designed to track and lock down stolen systems. It outlines the script's functionality, sample runs, variables, global parameters, and the ticketing process for reporting stolen devices.'
tags: ['security', 'encryption', 'windows', 'tracking']
draft: false
unlisted: false
---
## Summary

This script is used to track and lock down stolen systems. If the computer-level EDF `Stolen Lockdown` is marked then it will enable Bitlocker and shutdown the computer.

## Sample Run

Target: Windows Machine

![Sample Run Image](..\..\..\static\img\Lock-Stolen-System\image_1.png)

## Variables

| Name              | Description                                          |
|-------------------|------------------------------------------------------|
| stolen            | Filled by an EDF.                                   |
| SystemLockdown    | Filled by an EDF.                                   |
| NetNeighbors       | Result of Get-NetNeighbor Powershell                |
| ipconfig          | Result of ipconfig /all                             |
| IPINFO            | Result of Get-IPInfo PowerShell                     |
| IPINFOIP         | IP address of the Machine                           |
| IPINFOCity       | Current City of the Machine according to the IP address |
| IPINFOState      | Current State of the machine according to the IP address |
| IPINFOLoc        | Current coordinates of the computer according to the IP address |
| ImageCurrentUser  | Path to webcam picture taken on local machine       |
| BitlockerOutput   | Result of PowerShell to enable Bitlocker            |

## Global Parameters

| Name                | Example        | Required | Description                                             |
|---------------------|----------------|----------|---------------------------------------------------------|
| BitlockerPassword    | password123!   | True     | The password to use to enable Bitlocker on the target machine |
| BitlockerMessage     | This system is owned... | True     | The message to display on the Bitlocker lock screen.   |

## EDFs

| Name                       | Type       | Required | Description                                                                                     |
|----------------------------|------------|----------|-------------------------------------------------------------------------------------------------|
| Mark System As Stolen      | Check Box  | True     | Primary EDF to enable the solution. Check this EDF to mark a computer as stolen.               |
| System Lockdown             | Check Box  | True     | Mark this EDF to lockdown the computer once it comes online. Script will not enable the Bitlocker and Shutdown the computer, if this EDF is unchecked. |
| IPINFO_IP                  | Text Box   | True     | Current IP address of the machine, saved by the Script.                                       |
| IPINFO_City                | Text Box   | True     | Current City of the Machine according to the IP address                                       |
| IPINFO_State               | Text Box   | True     | Current State of the machine according to the IP address                                      |
| IPINFO_Coords             | Text Box   | True     | Current coordinates of the computer according to the IP address                               |

![EDFs Image](..\..\..\static\img\Lock-Stolen-System\image_2.png)

## Output

- Script log
- Ticket
- LTShare files
- EDFs

## Ticketing

**Subject:** `Lost or stolen system %computername% at %clientname% has come online!`

**Ticket Body:** `The script Lock Stolen System is currently running against the device and will attempt to find the location of the machine, attempt to bitlocker the device, and attempt to take a photo from any onboard webcams.`

**Ticket Comment:**

```
The system has been encrypted with bitlocker to prevent data theft.
PW: @BitlockerPassword@

Information Gathered!

Ipconfig:
@ipconfig@

NetNeighbors if available:
@netneighbors@

WebCamImage:
@ImageCurrentUser@

The script is using the shutdown command so the machine will become unusable without the bitlocker key.
```



