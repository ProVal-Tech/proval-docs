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
---

## Summary

This dataview gathers data from the script [CWA Script - SMBv1 Enabled Detection & Remediation](/docs/4fd2cffe-c41b-4a3c-9b5e-3edb02ad322b) and depicts the status of SMB enabled on the agent where it is deployed.

## Dependencies

[CWA Script - SMBv1 Enabled Detection & Remediation](/docs/4fd2cffe-c41b-4a3c-9b5e-3edb02ad322b)

## Columns

| Column                     | Description                                                                                   |
|---------------------------|-----------------------------------------------------------------------------------------------|
| Client                    | Client name of the agent                                                                      |
| Location                  | Location name of the agent                                                                    |
| Computer                  | The computer name of the agent                                                                |
| Operating System          | The operating system name of the agent                                                        |
| Last Contact              | The last contact information of the agent with Automate                                       |
| SMBv1 Status              | This stores the status of SMBv1 after script execution                                        |
| SMBv1 Logging             | This stores the PowerShell execution output of the script for logging                         |
| SMBv1 Detection Date      | This stores the date and time when the last SMBv1 status was detected via the script [CWA Script - SMBv1 Enabled Detection & Remediation](/docs/4fd2cffe-c41b-4a3c-9b5e-3edb02ad322b) |
| SMBv1 Vulnerability State  | This indicates whether the device is vulnerable or not based on the script output detection    |

