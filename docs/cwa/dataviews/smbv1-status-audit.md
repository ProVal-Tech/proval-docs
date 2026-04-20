---
id: '27c68799-35d0-4034-b0b5-b8a7736288df'
slug: /27c68799-35d0-4034-b0b5-b8a7736288df
title: 'SMBv1 Status Audit'
title_meta: 'SMBv1 Status Audit'
keywords: ['smbv1', 'detection', 'remediation', 'dataview', 'agent']
description: 'This document provides a comprehensive overview of the dataview that gathers data from the SMBv1 Enabled Detection & Remediation script, detailing the status of SMB on agents where it is deployed, including client information, operating system, and vulnerability state.'
tags: ['vulnerability']
draft: false
unlisted: false
last_update:
  date: 2026-04-15
---

## Summary

This dataview gathers data from the script [SMBv1 Status Audit/Autofix [DV,Param]](/docs/4fd2cffe-c41b-4a3c-9b5e-3edb02ad322b) and depicts the status of SMB enabled on the agent where it is deployed.

## Dependencies

- [Script - SMBv1 Status Audit/Autofix [DV,Param]](/docs/4fd2cffe-c41b-4a3c-9b5e-3edb02ad322b)
- [Solution - SMBv1 Audit/Autofix ](/docs/343654e4-9263-4fec-87c1-3c3401a94e95)

## Columns

| Column                     | Description                                                                                   |
|---------------------------|-----------------------------------------------------------------------------------------------|
| Client                    | Client name of the agent                                                                      |
| Location                  | Location name of the agent                                                                    |
| Computer                  | The computer name of the agent                                                                |
| Operating System          | The operating system name of the agent                                                        |
| Last Contact              | The last contact information of the agent with Automate                                       |
| Last Logged In User        | Last user who logged into the machine. |
| SMB1 Audit Server Status      | Indicates if SMBv1 Server is enabled on the machine as detected by the [Remote Monitor - SMB1 Detection](/docs/de67816f-e6ff-4fed-92e1-26fd5ae5359d). |
| SMB1 Audit Client Status      | Indicates if SMBv1 Client is enabled on the machine as detected by the  [Remote Monitor - SMB1 Detection](/docs/de67816f-e6ff-4fed-92e1-26fd5ae5359d). |
| SMB1 Detection Update Time     | Indicates the last time the  [Remote Monitor - SMB1 Detection](/docs/de67816f-e6ff-4fed-92e1-26fd5ae5359d) ran and updated the SMB1 detection status on the machine. |
| SMB1 In Use                   | Indicates whether SMB1 traffic has been detected on the machine as reported by the 'ProVal - Production - SMB1 Traffic Detection' monitor. |
| SMB1 Traffic Update Time       | Indicates the last time the 'ProVal - Production - SMB1 Traffic Detection' monitor ran and updated the SMB1 traffic detection status on the machine. |
| SMB1 Autofix Status           |  Stores the status of SMBv1 after the execution of the [Script - SMBv1 Status Audit/Autofix [DV,Param]](/docs/4fd2cffe-c41b-4a3c-9b5e-3edb02ad322b) |
| SMB1 Autofix Logging          | This stores the PowerShell execution output of the [Script - SMBv1 Status Audit/Autofix [DV,Param]](/docs/4fd2cffe-c41b-4a3c-9b5e-3edb02ad322b) for logging purposes |
| SMB1 Autofix Vulnerability State | Indicates whether the device is considered vulnerable or not after the SMB1 autofix remediation has been applied by the [Script - SMBv1 Status Audit/Autofix [DV,Param]](/docs/4fd2cffe-c41b-4a3c-9b5e-3edb02ad322b) |
| SMB1 Autofix Date | Indicates the date and time when the  [Script - SMBv1 Status Audit/Autofix [DV,Param]](/docs/4fd2cffe-c41b-4a3c-9b5e-3edb02ad322b) was last executed to apply the SMB1 autofix remediation on the machine |

## Changelog

### 2026-04-15

- Updated the document to include previously missing dataview columns and expanded the column descriptions for clarity.

### 2025-04-10

- Initial version of the document
