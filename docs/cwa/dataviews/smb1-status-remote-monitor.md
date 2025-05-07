---
id: 'da0254e3-0958-4ab4-9950-7e35feb12345'
slug: /da0254e3-0958-4ab4-9950-7e35feb12345
title: 'SMB1 Status Remote Monitor'
title_meta: 'SMB1 Status Remote Monitor'
keywords: ['smb1', 'detection', 'security', 'endpoint', 'monitoring']
description: 'This document outlines a dataview for detecting whether SMB1 is enabled on endpoints. SMB1 is deprecated and poses security risks, so it is essential to ensure that it is disabled on all machines. The dataview includes necessary columns for monitoring and implementation steps for effective management.'
tags: ['report', 'security', 'windows']
draft: false
unlisted: false
---

## Summary

This dataview will show if SMB1 is enabled on the endpoint. SMB1 has been deprecated and is considered insecure. Ideally, machines should **not** have SMB1 enabled.

## Dependencies

[EPM - Windows Configuration - Remote Monitor - SMB1 Detection](/docs/de67816f-e6ff-4fed-92e1-26fd5ae5359d)

## Columns

| Column                    | Description                                                                                                                   |
|--------------------------|-------------------------------------------------------------------------------------------------------------------------------|
| Client ID                | Client ID                                                                                                                    |
| Location ID              | Location ID                                                                                                                  |
| Computer ID              | Computer ID                                                                                                                  |
| Client                   | Client Name                                                                                                                  |
| Location                 | Location Name                                                                                                                |
| Computer                 | Computer Name                                                                                                                |
| Operating System         | Operating System                                                                                                             |
| Last Logged In User      | Last Logged In User                                                                                                         |
| Last Contact             | Last contact with RMM                                                                                                       |
| SMB1 Server Status       | Enabled/Disabled (Blank if either the remote monitor is not installed on the machine or if it hasn't returned any results)   |
| SMB1 Client Status       | Enabled/Disabled. The data is determined by the existence and startup type of the `mrxsmb10` service.                       |
| Information Update Time   | The time when the SMB1 status data was fetched                                                                               |

## Implementation

- Apply and import the remote monitors to the Managed Service Plan groups' Windows machines.
- Import the dataview.

