---
id: 'a518732d-b53b-4f7a-9aa1-1b478f68288f'
title: 'SMB1 Enable Audit Ticket Creation'
title_meta: 'SMB1 Enable Audit Ticket Creation'
keywords: ['ticket', 'audit', 'remediation', 'client', 'smbv1']
description: 'This document outlines a client script that generates a ticket for each client based on the count of computers requiring remediation for the SMBv1 enable status. It includes sample runs, dependencies, variable descriptions, and ticketing format.'
tags: ['ticketing', 'remediation', 'smb', 'client', 'status']
draft: false
unlisted: false
---
## Summary

This client script creates a ticket for each client with the computer count where remediation is required.

## Sample Run

![Sample Run](../../../static/img/SMBv1-Enable-Detection-Ticketing---Per-Client/image_1.png)

## Dependencies

[CWA Script - SMBv1 Status Audit/Autofix [DV,Param]](https://proval.itglue.com/DOC-5078775-15811522)

## Variables

| Name                     | Description                                                                                                                                                           |
|--------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| @VulnerableagentCount@   | This stores the count of computers where the remediation is required marked by the script @Script: SMBv1 Enabled Detection & Remediation [DV,Param].              |
| TicID                    | It stores the ticket ID if there is any existing open ticket detected so that commenting can be done on the same ticket.                                            |

## Output

- Ticket

## Ticketing

1. Ticketing:
   
   **Subject**:  
   SMB1 Enable audit data detected on the client: @sqlname@  
   Here, @sqlname@ is the client's name.

   **Body**:  
   The SMBv1 Enable status audit was detected on the @VulnerableagentCount@ computer of client "@sqlname@".  
   Please review the dataview for the computer list.

   OR

   The SMBv1 Enable status audit detected on @VulnerableagentCount@ computers of client "@sqlname@".  
   Please review the dataview for the computer list.






