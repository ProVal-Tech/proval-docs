---
id: '670407ad-49d7-407a-bf5c-4bf727dc103b'
title: 'Check Point Endpoint Security Removal'
title_meta: 'Check Point Endpoint Security Removal'
keywords: ['uninstallation', 'checkpoint', 'security', 'windows', 'reboot']
description: 'This document provides a detailed overview of a script designed to uninstall Check Point Endpoint Security from Windows machines. The script handles drive decryption and requires multiple reboots for successful uninstallation, ensuring a thorough process. Caution is advised when using this script due to its reboot requirements.'
tags: ['reboot', 'security', 'ticketing', 'uninstallation', 'windows']
draft: false
unlisted: false
---

## Summary

This script uninstalls Check Point Endpoint Security from Windows machines. It decrypts the drives if they are encrypted and then proceeds with the Check Point uninstallation. During this process, the machine requires at least two reboots: once for decryption and once to remove Check Point.

**Note:** Use this script with caution as it tends to reboot the machine several times to complete the uninstallation.

## Sample Run

![Sample Run](../../../static/img/Check-Point-Endpoint-Security-Removal/image_1.png)

### Global Parameters

| Name                    | Example | Required | Description                                                                                                                                                      |
|-------------------------|---------|----------|------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| TicketCreationCategory   | 126     | False    | Set it to '0' to disable ticketing. Specify the ticket creation category to direct the tickets to the right board and enable ticket creation.                  |

### User Parameters

| Name   | Example | Required | Description                                                                                                                                                                                                                      |
|--------|---------|----------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Force  | 1       | True     | Set it to '1' to confirm the reboot of the machine. If it's not set to '1' and the machine is online, the script will not proceed with the uninstallation, as it requires several reboots for completion.                           |

### Extra Data Fields

| EDF Name                | Level  | Type  | Description                                                                                                      |
|-------------------------|--------|-------|------------------------------------------------------------------------------------------------------------------|
| Uninstallation Password  | Client | Text  | Populate the Uninstallation Password required to uninstall Check Point from the machine.                        |

## Output

- Script Logs
- Ticketing

## Ticketing

Tickets will only be generated if the ticket category is defined on a global monitor.

**Ticket Subject:** `Check Point Endpoint Security uninstallation failed on %ComputerName% (%ComputerID%)`

**Ticket Body:** `Check Point Endpoint Security uninstallation failed on %ComputerName% (%ComputerID%)`

The PC information is outlined below:  
PC Name: %computername%  
Last Login: %lastuser%  
PC Model: @biosname@  
OS: %os%  
S/N of PC: @biosver@  



