---
id: '0bcdb6d5-adc1-4122-923c-1bc121f1a146'
title: 'Uninstall Microsoft Teams Classic'
title_meta: 'Uninstall Microsoft Teams Classic from Windows Machines'
keywords: ['uninstall', 'microsoft', 'teams', 'windows', 'script']
description: 'This document provides a detailed overview of a script designed to uninstall Microsoft Teams Classic from Windows machines, including parameters, output, and ticketing information for failures.'
tags: ['windows', 'uninstallation', 'software', 'ticketing', 'script']
draft: false
unlisted: false
---
## Summary

This script uninstalls `Microsoft Teams Classic` from Windows machines.

**File Path:** `C:/ProgramData/_Automation/Script/Uninstall-ClassicTeams/Uninstall-ClassicTeams.ps1`  
**File Hash (SHA256):** `3CAF5B7B6E5EC3EB4ADF596CE9729D7C36202298610E2DFA3085C172B4C13ACD`  
**File Hash (MD5):** `C258358FD0B50A6DFAB39AFE289A2380`  

## Sample Run

![Sample Run](../../../static/img/Uninstall-Teams-Classic/image_1.png)

## Global Parameters

| Name                   | Required | Example | Description                                                                                     |
|------------------------|----------|---------|-------------------------------------------------------------------------------------------------|
| Ticket_On_Failure      | False    | 1       | Fill it as '1' if you would like to receive Ticket on failure else leave it blank or '0'      |
| TicketCreationCategory  | False    | 298     | Mention the ticketcreationcategory in order to direct the tickets to the right board in Manage |

## Output

- Script Logs
- Ticket (if enabled)

## Ticketing

Subject: `Microsoft Teams classic Uninstallation Failed on %ComputerName%(%ComputerID%)`  

Ticket Body: `Failed to Uninstall Microsoft Teams Classic from machine on %computername% at %clientname%. Here are the results returned from the installer: @psout@`

The PC information is outlined below:  
PC Name: %computername%  
Last Login: %lastuser%  
PC model: @biosname@  
OS: %os%  
S/N OF PC: @biosver@  






