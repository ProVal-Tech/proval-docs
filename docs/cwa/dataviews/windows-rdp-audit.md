---
id: '6925218d-aa6b-4919-a873-262691c16b9e'
slug: /6925218d-aa6b-4919-a873-262691c16b9e
title: 'Windows - RDP Audit'
title_meta: 'Windows - RDP Audit'
keywords: ['rdp', 'agents', 'status', 'report', 'windows']
description: 'This document provides a detailed dataview that shows whether RDP is enabled or disabled on agents, based on their dependent roles. It includes important information such as client name, location name, computer name, operating system, agent status, and RDP status. Note that the dataview reflects role-dependent changes and may not show immediate status updates.'
tags: ['networking', 'report', 'security', 'windows']
draft: false
unlisted: false
---

## Summary

This dataview provides information about whether RDP is enabled or disabled on an agent based on the dependent role.

**Note:** This dataview is role-dependent, so it will not reflect changed status immediately.

## Dependencies

[Windows - RDP Enabled](/docs/2aa464bf-472c-48db-a3a8-f8fc1aa11091)

## Columns

| Column              | Description                                 |
|---------------------|---------------------------------------------|
| Client Name         | Client name of an agent                     |
| Location Name       | Location name of an agent                   |
| Computer Name       | Agent name                                  |
| Operating System    | Operating system of an agent                |
| Agent Status        | Agent status, whether offline or online     |
| RDP Status          | RDP status, whether enabled or disabled     |
