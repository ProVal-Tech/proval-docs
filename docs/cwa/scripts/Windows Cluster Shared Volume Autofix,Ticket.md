---
id: '0a795741-52b7-4de6-abc2-01b5add80f99'
title: 'Windows Cluster Volume Space Audit'
title_meta: 'Windows Cluster Volume Space Audit'
keywords: ['cluster', 'disk', 'space', 'audit', 'monitor']
description: 'This document details a function script designed to operate as an Autofix with the CWA Remote Monitor for Windows Cluster Shared Volume Detection. It creates tickets with comprehensive information about cluster disks when free space drops below a set threshold and invokes a space audit to ensure accurate data capture for cluster servers.'
tags: ['cwa', 'ticket', 'monitoring', 'audit', 'windows']
draft: false
unlisted: false
---
## Summary

This function script runs as an Autofix with the [CWA Remote Monitor - Windows Cluster Shared Volume Detection](https://proval.itglue.com/DOC-5078775-15952794) to create the ticket with detailed info about the cluster disk where the free space is below the threshold. It also calls the [CWA Script - Windows Cluster Volume Space Audit](https://proval.itglue.com/DOC-5078775-15952791) to perform the space audit after the autofix script schedule to ensure the latest data is captured for that cluster server.

## Sample Run

This should always run with the [CWA Remote Monitor - Windows Cluster Shared Volume Detection](https://proval.itglue.com/DOC-5078775-15952794).

## Dependencies

- [CWA Remote Monitor - Windows Cluster Shared Volume Detection](https://proval.itglue.com/DOC-5078775-15952794)
- [CWA Script - Windows Cluster Volume Space Audit](https://proval.itglue.com/DOC-5078775-15952791)

## Variables

| Name                   | Description                                                                                                      |
|------------------------|------------------------------------------------------------------------------------------------------------------|
| psout                  | Contains the output of the PowerShell to catch the status of cluster disk space availability                    |
| TicketComment          | Stores the status of the disk space which can be directly used in the ticket body                               |
| TicketCreationCategory  | It stores the ticket category ID coming up from the monitor [CWA Remote Monitor - Windows Cluster Shared Volume Detection](https://proval.itglue.com/DOC-5078775-15952794) |

## Output

- Script log
- Dataview






