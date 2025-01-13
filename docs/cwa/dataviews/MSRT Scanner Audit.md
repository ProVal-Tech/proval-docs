---
id: 'rmm-msrt-scanner-status'
title: 'MSRT Scanner Status Dataview'
title_meta: 'MSRT Scanner Status Dataview'
keywords: ['msrt', 'scanner', 'status', 'dataview', 'rmm']
description: 'This document provides information about the MSRT scanner status dataview, which stores the results of the Malicious Software Removal Tool scanner. It outlines the dependencies, columns, and descriptions related to the agent status in the RMM system.'
tags: ['report', 'security', 'windows', 'update']
draft: false
unlisted: false
---
## Summary

This dataview stores the status of the MSRT scanner result from the script [Malicious Software Removal Tool Scanner](https://proval.itglue.com/DOC-5078775-16445571).

## Dependencies

[Malicious Software Removal Tool Scanner](https://proval.itglue.com/DOC-5078775-16445571)

## Columns

| Column                  | Description                                          |
|------------------------|------------------------------------------------------|
| Client                 | Client name of the agent                             |
| Location               | Location name of the agent                           |
| Computer               | The computer name of the agent                       |
| Operating System       | The operating system of the agent                    |
| LastContact            | The last contact of the agent with the RMM          |
| MSRT Scanner Result    | MSRT tool scanner result conclusion recorded         |
| MSRT Scanner Date      | MSRT's last scanner date                             |



