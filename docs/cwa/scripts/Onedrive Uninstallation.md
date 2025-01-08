---
id: 'cwa_uninstall_onedrive'
title: 'Uninstall Onedrive from Windows Machines'
title_meta: 'Uninstall Onedrive from Windows Machines'
keywords: ['uninstall', 'onedrive', 'windows', 'ticketing', 'script']
description: 'This document describes a script designed to uninstall Onedrive from Windows machines, including global parameters for ticketing on failure, sample run outputs, and details for logging and ticket creation.'
tags: ['windows', 'uninstallation', 'ticketing', 'software', 'configuration']
draft: false
unlisted: false
---
## Summary

The purpose of this script is to uninstall Onedrive from Windows machines.

## Sample Run

![Sample Run](5078775/docs/15406067/images/22408222)

## Global Parameters

| Name                    | Required | Example | Description                                                                                                 |
|-------------------------|----------|---------|-------------------------------------------------------------------------------------------------------------|
| Ticket_On_Failure       | False    | 1       | Fill it as '1' if you would like to receive Ticket on failure else leave it blank or '0'                  |
| TicketCreationCategory   | False    | 298     | Mention the ticketcreationcategory in order to direct the tickets to the right board in Manage             |

## Output

- Script Logs
- Ticketing

## Ticketing

Subject: `Onedrive Uninstallation Failed on %ComputerName%(%ComputerID%)`

Ticket Body: `Failed to uninstall Onedrive on the machine. Here is the uninstallation attempt results : @Output@`

The PC information is outlined below:  
PC Name: %computername%  
Last Login: %lastuser%  
PC model: @biosname@  
OS: %os%  
S/N OF PC: @biosver@


