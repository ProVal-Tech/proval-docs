---
id: 'cwa-computer-client-transfer-notification'
title: 'Computer Client Transfer Notification Script'
title_meta: 'Computer Client Transfer Notification Script'
keywords: ['client', 'transfer', 'notification', 'script', 'automate']
description: 'This document describes a script designed to identify computers that have been transferred from one client to another within ConnectWise Automate. It includes details on setup, dependencies, variables used, and the output format for notifications.'
tags: ['client', 'notification', 'setup', 'ticketing', 'automation']
draft: false
unlisted: false
---
## Summary

The script's objective is to identify the computers that have been transferred from one client to another in Automate. The schedule of the script determines the delay in the alert.

## Sample Run

![Sample Run](..\..\..\static\img\Agents-Migration-Monitoring---Client-Level\image_1.png)

It is a client script that has to be set up to run on a regular basis, either daily or hourly.

## Dependencies

[CWM - Automate - Custom Table - pvl_computer_client_auditing](https://proval.itglue.com/DOC-5078775-12597798)

## Variables

| Name               | Description                                                                                                 |
|--------------------|-------------------------------------------------------------------------------------------------------------|
| Table_Name         | [pvl_computer_client_auditing](https://proval.itglue.com/DOC-5078775-12597798)                            |
| Count              | Number of detected computers                                                                                 |
| sqlNew_Clientid    | New clientid of detected computer                                                                            |
| sqlcmpid           | computerid of detected computer                                                                               |
| sqlComputer_Name    | Name of the detected computer                                                                                 |
| sqlOld_Client_Name | Name of the previous client of the detected computer                                                         |
| sqlNew_Client_Name | Name of the Current Client of the detected computer                                                          |
| sqlLast_Checked    | Last time when the computer was found under the previous client                                              |

## Output

- Tickets

## Ticketing

**Subject:** `Agent Migrated to New Client - @sqlComputer_Name@`

**Body:** Between @sqlLast_Checked@ and %When%, the computer "@sqlComputer_Name@" was relocated from "@sqlOld_Client_Name@" to "@sqlNew_Client_Name@" in Automate. Please look into it.

## Sample Ticket

![Sample Ticket](..\..\..\static\img\Agents-Migration-Monitoring---Client-Level\image_2.png)


