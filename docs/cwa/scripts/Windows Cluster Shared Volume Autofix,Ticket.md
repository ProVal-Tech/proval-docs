---
id: '0a795741-52b7-4de6-abc2-01b5add80f99'
slug: /0a795741-52b7-4de6-abc2-01b5add80f99
title: 'Windows Cluster Shared Volume Autofix,Ticket'
title_meta: 'Windows Cluster Shared Volume Autofix,Ticket'
keywords: ['cluster', 'disk', 'space', 'audit', 'monitor']
description: 'This document details a function script designed to operate as an Autofix with the CWA Remote Monitor for Windows Cluster Shared Volume Detection. It creates tickets with comprehensive information about cluster disks when free space drops below a set threshold and invokes a space audit to ensure accurate data capture for cluster servers.'
tags: ['windows']
draft: false
unlisted: false
---

## Summary

This function script runs as an Autofix with the [CWA Remote Monitor - Windows Cluster Shared Volume Detection](<../monitors/CWA Remote Monitor - Windows Cluster Shared Volume Detection.md>) to create a ticket with detailed information about the cluster disk where the free space is below the threshold. It also calls the [CWA Script - Windows Cluster Volume Space Audit](<./Windows Cluster Volume Space Audit DV.md>) to perform the space audit after the Autofix script is scheduled, ensuring the latest data is captured for that cluster server.

## Sample Run

This should always run with the [CWA Remote Monitor - Windows Cluster Shared Volume Detection](<../monitors/CWA Remote Monitor - Windows Cluster Shared Volume Detection.md>).

## Dependencies

- [CWA Remote Monitor - Windows Cluster Shared Volume Detection](<../monitors/CWA Remote Monitor - Windows Cluster Shared Volume Detection.md>)
- [CWA Script - Windows Cluster Volume Space Audit](<./Windows Cluster Volume Space Audit DV.md>)

## Variables

| Name                   | Description                                                                                                      |
|------------------------|------------------------------------------------------------------------------------------------------------------|
| psout                  | Contains the output of the PowerShell to capture the status of cluster disk space availability                    |
| TicketComment          | Stores the status of the disk space, which can be directly used in the ticket body                               |
| TicketCreationCategory  | Stores the ticket category ID coming from the monitor [CWA Remote Monitor - Windows Cluster Shared Volume Detection](<../monitors/CWA Remote Monitor - Windows Cluster Shared Volume Detection.md>) |

## Output

- Script log
- Dataview


