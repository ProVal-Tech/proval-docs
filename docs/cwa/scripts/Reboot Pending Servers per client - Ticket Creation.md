---
id: 'cwa-client-ticket-reboot-management'
title: 'Client-Level Ticket Management for Pending Server Reboots'
title_meta: 'Client-Level Ticket Management for Pending Server Reboots'
keywords: ['ticket', 'server', 'reboot', 'client', 'management', 'pending', 'automation']
description: 'This document outlines a script designed to manage client-level tickets for pending server reboots. It generates tickets based on the number of servers awaiting reboot, closes tickets for servers that no longer need reboots, and ensures that new tickets are created with the most current information. The script is intended for regular scheduling to maintain up-to-date ticket management.'
tags: ['ticket', 'server', 'client', 'management', 'pending', 'automation']
draft: false
unlisted: false
---
## Summary

The script generates a client-level ticket containing details about all pending server reboots for that client. Nevertheless, if a client has only one server awaiting a reboot, the script will generate a ticket at the computer level.  

The script will close tickets for servers that no longer have pending reboots and for clients with no pending server reboots. It won't generate new tickets for servers with pending reboots if there's already an existing ticket. It will re-create client-level tickets with current information after closing the previous ticket(s).

## Sample Run

It is a client script and is suggested to schedule it to run at regular intervals.  
![Sample Run](5078775/docs/13967831/images/20122401)

## Dependencies

[CWM - Automate - Script - Reboot Pending Servers per client - Tickets Management](https://proval.itglue.com/DOC-5078775-14262862)

## Output

- Tickets

## Sample Tickets

**Client-Level ticket:**  
![Client-Level Ticket](5078775/docs/13967831/images/20123075)  

**Computer-Level ticket:**  
![Computer-Level Ticket](5078775/docs/13967831/images/20123091)

