---
id: '2d758af9-c045-4154-b0c9-63eeb7743004'
title: 'Audit Agents Dataview'
title_meta: 'Audit Agents Dataview'
keywords: ['audit', 'agents', 'environment', 'dataview', 'client', 'location', 'computerid', 'agent', 'operating', 'system', 'manufacturer', 'antivirus', 'bios', 'contact', 'heartbeat', 'username', 'ad', 'logon']
description: 'This document provides a detailed overview of the dataview used to audit agents in the environment, including descriptions of each column such as Client Name, Location Name, and Agent Operating System, among others.'
tags: ['report', 'security', 'windows']
draft: false
unlisted: false
---

## Summary

The dataview can be used to audit the agents in the environment.

## Columns

| Column                         | Description                                         |
|--------------------------------|-----------------------------------------------------|
| Client Name                    | Name of the client.                                |
| Location Name                  | Name of the location.                              |
| ComputerID                     | Agent ID of the computers.                         |
| Agent Name                     | Computer name.                                     |
| Agent Type                     | Displays computer type (Workstation/Laptop/Server).|
| Agent Operating System         | OS of the computers.                               |
| Windows 10 Version             | The ReleaseID of the Windows version.              |
| Agent Manufacturer              | Displays the name of the BIOS manufacturer.        |
| AntiVirus                      | The virus scanner running on the agent.            |
| Agent Serial Number            | The serial number of the computer.                 |
| Agent - BIOS Date              | The BIOS date of the computer.                     |
| Agent Last Contact Date        | The last contact date of the agent.                |
| Days Since LC                  | The number of days since the last contact.         |
| Last Heartbeat Time            | The last heartbeat time received from the agent.   |
| Last Username                   | The last logged-in user on the computer.           |
| Last AD Logon                  | The last Active Directory login date.              |
| Days Since AD Logon            | The number of days since the last Active Directory login. |


