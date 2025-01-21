---
id: '86b3fe11-be22-4721-8626-ba34a5bf4419'
title: 'Onedrive Uninstallation'
title_meta: 'Onedrive Uninstallation'
keywords: ['uninstall', 'onedrive', 'windows', 'ticketing', 'script']
description: 'This document describes a script designed to uninstall OneDrive from Windows machines, including global parameters for ticketing on failure, sample run outputs, and details for logging and ticket creation.'
tags: ['software', 'ticketing', 'uninstallation', 'windows']
draft: false
unlisted: false
---

## Summary

The purpose of this script is to uninstall OneDrive from Windows machines.

## Sample Run

![Sample Run](../../../static/img/Onedrive-Uninstallation/image_1.png)

## Global Parameters

| Name                    | Required | Example | Description                                                                                                 |
|-------------------------|----------|---------|-------------------------------------------------------------------------------------------------------------|
| Ticket_On_Failure       | False    | 1       | Set to '1' if you would like to receive a ticket on failure; otherwise, leave it blank or set to '0'.      |
| TicketCreationCategory   | False    | 298     | Specify the ticket creation category to direct the tickets to the appropriate board in Manage.              |

## Output

- Script Logs
- Ticketing

## Ticketing

**Subject:** `OneDrive Uninstallation Failed on %ComputerName% (%ComputerID%)`

**Ticket Body:** `Failed to uninstall OneDrive on the machine. Here are the uninstallation attempt results: @Output@`

The PC information is outlined below:  
**PC Name:** %computername%  
**Last Login:** %lastuser%  
**PC Model:** @biosname@  
**OS:** %os%  
**S/N OF PC:** @biosver@



