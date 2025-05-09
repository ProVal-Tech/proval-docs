---
id: '9be930d0-0f3e-40c2-8135-3a77e59a1e9e'
slug: /9be930d0-0f3e-40c2-8135-3a77e59a1e9e
title: 'Reboot Pending Servers per client - Ticket Creation'
title_meta: 'Reboot Pending Servers per client - Ticket Creation'
keywords: ['ticket', 'server', 'reboot', 'client', 'management', 'pending', 'automation']
description: 'This document outlines a script designed to manage client-level tickets for pending server reboots. It generates tickets based on the number of servers awaiting reboot, closes tickets for servers that no longer need reboots, and ensures that new tickets are created with the most current information. The script is intended for regular scheduling to maintain up-to-date ticket management.'
tags: []
draft: false
unlisted: false
---

## Summary

The script generates a client-level ticket containing details about all pending server reboots for that client. However, if a client has only one server awaiting a reboot, the script will generate a ticket at the computer level.

The script will close tickets for servers that no longer have pending reboots and for clients with no pending server reboots. It won't generate new tickets for servers with pending reboots if there's already an existing ticket. It will re-create client-level tickets with current information after closing the previous ticket(s).

## Sample Run

It is a client script and is suggested to schedule it to run at regular intervals.  
![Sample Run](../../../static/img/docs/9be930d0-0f3e-40c2-8135-3a77e59a1e9e/image_1_1.webp)

## Dependencies

[CWM - Automate - Script - Reboot Pending Servers per Client - Tickets Management](/docs/0d5f27c6-fa65-4a98-b32d-61426505aa1c)

## Output

- Tickets

## Sample Tickets

**Client-Level Ticket:**  
![Client-Level Ticket](../../../static/img/docs/9be930d0-0f3e-40c2-8135-3a77e59a1e9e/image_2_1.webp)  

**Computer-Level Ticket:**  
![Computer-Level Ticket](../../../static/img/docs/9be930d0-0f3e-40c2-8135-3a77e59a1e9e/image_3.webp)