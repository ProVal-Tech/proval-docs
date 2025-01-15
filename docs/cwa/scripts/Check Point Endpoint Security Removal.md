---
id: '670407ad-49d7-407a-bf5c-4bf727dc103b'
title: 'Check Point Endpoint Security Uninstallation Script'
title_meta: 'Check Point Endpoint Security Uninstallation Script'
keywords: ['uninstallation', 'checkpoint', 'security', 'windows', 'reboot']
description: 'This document provides a detailed overview of a script designed to uninstall Check Point Endpoint Security from Windows machines. The script handles drive decryption and requires multiple reboots for successful uninstallation, ensuring a thorough process. Caution is advised when using this script due to its reboot requirements.'
tags: ['uninstallation', 'windows', 'security', 'reboot', 'ticketing']
draft: false
unlisted: false
---
## Summary

This Script uninstalls the Check Point Endpoint Security from Windows machines. It decrypts the drives if encrypted and then proceeds for Check Point uninstallation. During this process, the machine requires a reboot at least two times, once for decryption and once to remove the Checkpoint.

**Note:** Use this Script with caution as it tends to reboot the machine several times to uninstall Checkpoint.

## Sample Run

![Sample Run](../../../static/img/Check-Point-Endpoint-Security-Removal/image_1.png)

### Global Parameters

| Name                    | Example | Required | Description                                                                                                                                                      |
|-------------------------|---------|----------|------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| TicketCreationCategory   | 126     | False    | Set it to '0' to disable ticketing. Mention the ticketcreationcategory in order to direct the tickets to the right board and to enable the tickets.           |

### User Parameters

| Name   | Example | Required | Description                                                                                                                                                                                                                      |
|--------|---------|----------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Force  | 1       | True     | Set it to 1 to confirm to Reboot of the machine. If it's not set to '1' and the machine is online, the script will not proceed for uninstallation, as it requires several reboots for uninstallation.                           |

### Extra Data Fields

| EDF Name                | Level  | Type  | Description                                                                                                      |
|-------------------------|--------|-------|------------------------------------------------------------------------------------------------------------------|
| Uninstallation Password  | Client | Text  | Populate the Uninstallation Password required to uninstall the Check Point from the machine.                    |

## Output

- Script Logs
- Ticketing

## Ticketing

The tickets will only be generated if the ticket category is defined on a global monitor.

**Ticket Subject:** `Check Point Endpoint Security uninstallation Failed on %ComputerName%(%ComputerID%)`

**Ticket Body:** `Check Point Endpoint Security uninstallation Failed on %ComputerName%(%ComputerID%)`

The PC information is outlined below:  
PC Name: %computername%  
Last Login: %lastuser%  
PC model: @biosname@  
OS: %os%  
S/N OF PC: @biosver@  






