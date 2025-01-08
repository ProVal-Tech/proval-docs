---
id: 'cwa-rdp-status-report'
title: 'RDP Status Report for Agents'
title_meta: 'RDP Status Report for Agents - Check RDP Enablement'
keywords: ['rdp', 'agents', 'status', 'report', 'windows']
description: 'This document provides a detailed dataview that shows whether RDP is enabled or disabled on agents, based on their dependent roles. It includes important information such as client name, location name, computer name, operating system, agent status, and RDP status. Note that the dataview reflects role-dependent changes and may not show immediate status updates.'
tags: ['report', 'windows', 'networking', 'security']
draft: false
unlisted: false
---
## Summary

This dataview gives information about if RDP is enabled or disabled on an agent based on the dependent role.

Note: This dataview is a role dependent dataview so it will not reflect changed status immediately.

## Dependencies

[Windows - RDP Enabled](https://proval.itglue.com/DOC-5078775-8061217)

## Columns

| Column              | Description                                 |
|---------------------|---------------------------------------------|
| Client Name         | Client Name of an agent                     |
| Location Name       | Location Name of an agent                   |
| Computer Name       | Agent name                                  |
| Operating System    | Operating System of an agent                |
| Agent Status        | Agent status whether offline or online      |
| RDP Status          | RDP status whether enabled or disabled      |


