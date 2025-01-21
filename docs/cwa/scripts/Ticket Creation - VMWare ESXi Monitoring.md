---
id: '7fbdffc1-7472-4276-914d-1e5b845dcd3c'
title: 'Ticket Creation - VMWare ESXi Monitoring'
title_meta: 'Ticket Creation - VMWare ESXi Monitoring'
keywords: ['esxi', 'ticket', 'monitor', 'alert', 'automation', 'script']
description: 'This document outlines a script designed to automatically create tickets with information about ESXi hosts. The script is intended for use with internal monitoring systems, ensuring that critical data about ESXi hosts is captured and reported efficiently. It includes details on the required variables, sample run scenarios, and the process involved in utilizing the script effectively.'
tags: ['esxi']
draft: false
unlisted: false
---

## Summary

The script will write the ESXi hosts' information to a ticket.

The script is designed to be used as an Autofix script with the internal monitor for the ESXi Host.

Use of the script is subject to the following requirements:  
1. The Device ID of the ESXi host should be used as the Test Value/Result in the monitor set.  
2. All pertinent data to be uploaded on the ticket should be in Field Name/Identity Field.

The following script variables can be utilized in the monitor's alerting tab: `@ESXHostName@`, `@ESXVersion@`, `@ESXMakeModel@`, `@ESXIPAddress@`, and `@ESXSN@`.  
"ESXi Bad Sensors Detected - @ESXHostName@ (@ESXIPAddress@)" is an illustration of a subject.  
In the aforementioned example, the ticket will be created with the Host Name and IP address included in the ticket subject.

## Sample Run

The script is attached to the "~Custom - Ticket Creation ESXi Hosts" alert template; it is not intended to be run manually.

## Variables

| Name           | Description                          |
|----------------|--------------------------------------|
| ESXHostName    | Name of the ESXi host                |
| ESXVersion     | ESXi Version of the host             |
| ESXMakeModel   | Manufacturer and Model of the Host   |
| ESXIPAddress   | IP address of the host               |
| ESXSN          | Serial Number of the Host            |

## Process

The script is an exact copy of the [CWM - Automate - Script - Ticket Creation - Computer](<./Ticket Creation - Computer.md>) script.  
The only difference is that this script will write the ESXi hosts' information to the ticket instead of the Computer's.

## Output

- Script Log
- Ticket



