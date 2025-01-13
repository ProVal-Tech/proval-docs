---
id: 'cwa-client-script-hp-server-ilo-ticketing'
title: 'Client Script for HP Server iLO Ticketing'
title_meta: 'Client Script for HP Server iLO Ticketing'
keywords: ['client', 'script', 'hp', 'ilo', 'ticketing']
description: 'This document provides a client script designed to create tickets for clients with HP Servers that have HP iLO enabled but lack credentials. It includes instructions for implementation, dependencies, and expected output.'
tags: ['hpe', 'monitoring', 'ticket', 'edf', 'scheduling']
draft: false
unlisted: false
---
## Summary

This is a client script that creates the ticket for all clients which has an HP Server and have HP iLO enabled but the credentials are missing.

Flag the Computer-Level EDF `Exclude From HPE ILO Monitoring` to exclude a computer/server from generating ticket.

## Sample Run

![Sample Run](../../../static/img/HP-iLO-Credential-Missing-Detection/image_1.png)

## Dependencies

Computer-Level EDF - Exclude From HPE ILO Monitoring

## Implementation

- Import the script
- After import please reload the system cache and refresh the scripts to have the EDF automatically imported with the script.
- Schedule it from the dashboard -> Scheduled Client Scripts.  
  Note: This is an optional feature. Please ensure the client wants the ticketing for the missing credentials alerting.

## Output

- Script log
- Ticket



