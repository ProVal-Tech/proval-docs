---
id: 'da0254e3-0958-4ab4-9950-7e35feb12345'
title: 'SMB1 Detection on Endpoints'
title_meta: 'SMB1 Detection on Endpoints - Security Assessment'
keywords: ['smb1', 'detection', 'security', 'endpoint', 'monitoring']
description: 'This document outlines a dataview for detecting whether SMB1 is enabled on endpoints. SMB1 is deprecated and poses security risks, so it is essential to ensure that it is disabled on all machines. The dataview includes necessary columns for monitoring and implementation steps for effective management.'
tags: ['report', 'security', 'windows']
draft: false
unlisted: false
---
## Summary

This dataview will show if SMB1 is enabled on the endpoint. SMB1 has been deprecated and is considered insecure. Ideally, machines should NOT have SMB1 enabled.

## Dependencies

[EPM - Windows Configuration - Remote Monitor - SMB1 Detection](<../monitors/SMB1 Detection.md>)

## Columns

| Column                    | Description                                                                                                                   |
|--------------------------|-------------------------------------------------------------------------------------------------------------------------------|
| Clientid                 | Clientid                                                                                                                      |
| Locationid               | Locationid                                                                                                                    |
| Computerid               | Computerid                                                                                                                    |
| Client                   | Client Name                                                                                                                  |
| Location                 | Location Name                                                                                                                |
| Computer                 | Computer Name                                                                                                                |
| Operating System         | Operating System                                                                                                             |
| Last Logged In User      | Last Logged In User                                                                                                         |
| Last Contact             | Last Contact with RMM                                                                                                       |
| SMB1 Server Status       | Enabled/Disabled (Blank if either the remote monitor is not installed on the machine or if it hadn't returned any results)   |
| SMB1 Client Status       | Enabled/Disabled. The data is determined by the existence and startup type of the `mrxsmb10` service.                       |
| Information Update Time   | The time when the SMB1 Status data was fetched                                                                               |

## Implementation

- Apply and import the remote monitors to the Managed Service Plan groups' Windows machines.
- Import the dataview.














