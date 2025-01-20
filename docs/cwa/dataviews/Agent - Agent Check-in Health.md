---
id: '72e598df-0fcf-471d-9ee8-030986141642'
title: 'Agent Check-In Status Overview in CWA'
title_meta: 'Agent Check-In Status Overview in CWA'
keywords: ['agent', 'checkin', 'status', 'remediation', 'script']
description: 'This document provides an overview of an agent’s check-in status in ConnectWise Automate (CWA), detailing whether the associated script has been executed for remediation. It includes dependencies, a breakdown of relevant columns, and the status of agents in relation to their connectivity and script execution.'
tags: ['connectwise']
draft: false
unlisted: false
---
## Summary

This dataview will provide information about an agent's check-in status in CWA and if the associated script has been run to attempt remediation. The data displayed is based on the script in the Dependencies section.

## Dependencies

- [CW RMM+ Plugin Configuration](https://proval.itglue.com/5078775/docs/9770217)
- [Script - ScreenConnect Client - Connectivity - Audit*](<../scripts/ScreenConnect Client - Connectivity - Audit.md>)
- [Script - Automate Agent - Auto Repair*](<../scripts/Automate Agent - Auto Repair.md>)

## Columns

| Column                        | Description                                                                                                           |
|-------------------------------|-----------------------------------------------------------------------------------------------------------------------|
| Client                        | Client Name                                                                                                          |
| Location                      | Location Name                                                                                                        |
| Computer                      | Computer Name                                                                                                        |
| Status                        | Status of whether the agent is offline in Automate.Offline - The computer is offline in Automate as well as in ScreenConnect.Broken - The script ran against the agent, but was not able to bring the Automate agent online.Undetermined - RMM+ Solution is not configured properly.Not Run Yet -- The script has not been run against this agent yet. |
| Last Contact                  | Last contact of the agent with the Automate server.                                                                 |
| Last Contact ScreenConnect     | Last Contact of the agent with the ScreenConnect Portal.                                                            |
| Last Script Check             | Last run date of the [Script - Automate Agent - Auto Repair*](<../scripts/Automate Agent - Auto Repair.md>) on the agent. |
| Operating System              | Operating System of the Computer.                                                                                    |
| Command Output                | Output of the command ran by [Script - ScreenConnect Client - Connectivity - Audit*](<../scripts/ScreenConnect Client - Connectivity - Audit.md>) to verify the current status of the computer in ScreenConnect portal. |
| Clientid                     | Clientid (Hidden)                                                                                                   |
| Locationid                   | Locationid (Hidden)                                                                                                 |
| Computerid                   | Computerid (Hidden)                                                                                                 |













