---
id: '0abb04f1-450d-4185-9ecd-f27a842cf658'
title: 'HP iLO Credential Missing Detection'
title_meta: 'HP iLO Credential Missing Detection'
keywords: ['ilo', 'hp', 'credential', 'detection', 'ticket', 'monitoring']
description: 'This document provides an overview of the dataview that presents information about iLO-enabled HP Servers where the password entry for iLO Automation Password is not stored in the client-level password tab. It assists in identifying clients and servers for which the HP iLO Credential Missing Detection script will generate a ticket, along with instructions on how to exclude certain computers from monitoring.'
tags: ['report', 'security']
draft: false
unlisted: false
---
## Summary

The dataview presents information about iLO-enabled HP Servers where the password entry for `iLO Automation Password` is not stored in the client-level password tab. This data view assists in identifying clients/servers for which the [HP iLO Credential Missing Detection](<../scripts/HP iLO Credential Missing Detection.md>) script will generate a ticket.

Flag the Computer-Level EDF `Exclude From HPE ILO Monitoring` to exclude a computer/server from the dataview.

## Dependencies

[CWM - Automate - Client Script - HP iLO Credential Missing Detection](<../scripts/HP iLO Credential Missing Detection.md>)

## Columns

| Column          | Description                      |
|-----------------|----------------------------------|
| Clientid        | Clientid (Hidden)               |
| Locationid      | Locationid (Hidden)             |
| Computerid      | Computerid                       |
| Client          | Client Name                      |
| Location        | Location Name                    |
| Server          | Server Name                      |
| Operating System| Operating System                 |
| Manufacturer     | Manufacturer                     |
| Last Contact    | Last Contact with RMM           |













