---
id: '84d8b11d-aea7-4fe8-9811-2041d0b7eda2'
slug: /84d8b11d-aea7-4fe8-9811-2041d0b7eda2
title: 'Remove Stagnant Agents'
title_meta: 'Remove Stagnant Agents'
keywords: ['stagnant', 'agents', 'removal', 'vsa', 'automation']
description: 'This document provides an overview of the process to remove stagnant agents from Kaseya VSA based on specific filters defined in a JSON file. It includes requirements, dependencies, usage examples, and detailed parameters for the removal process, along with logging and notification options.'
tags: ['software', 'windows']
draft: false
unlisted: false
---

# Overview
Remove stagnant agents based on a set of filters passed in via a JSON file. Logs the removed agents in a file in the same directory as the executable (`yyyyMMddhhmmssfff_stagnantAgents.log`). Email notifications can be sent via the procedure.

# Requirements
- .NET 8

# Dependencies
- [VSAToolbox](https://github.com/Proval-tech/VSAToolbox)

# Process
Gets a list of agents that meet the set criteria (offline for `$OfflineDays` days, not in `$MachineGroupException` groups, etc.) and runs the VSAAPI function `Remove-VsaAgent`, removing them from the VSA without first uninstalling the agent. Exclusion filters can be applied for `OsType`, `OsInfo` (Build caption), `IPAddress`, `Mac Address`, `Country`, `Domain`, and `Workgroup`. Filters are individually applied; applying more than one filter will remove BOTH pools from the removal list. For example, providing `-OsTypeExclusion '10'` and `-DomainWorkgroupExclusion 'proval'` will retain ALL Windows 10 machines from the list, **AND** ALL machines on the ProVal domain or Workgroup.

# Payload Usage
```
./Remove-VsaStagnantAgent.ps1 -BaseURL https://vsa.provaltech.com -VsaUserName apiServiceAccount -RestApiToken abcd-efgh-ijkl-mnop -OfflineDays 30 -MachineGroupException proval.development -OsTypeException 11
```
Removes agents offline for 30 days in all groups except `proval.development`. Does not remove any endpoint running Windows 11.

# Parameters

| Parameter                       | Required | Default | Type          | Description                                              |
|---------------------------------|----------|---------|---------------|----------------------------------------------------------|
| `BaseURL`                       | True     |         | String        | VSA URL                                                 |
| `VsaUserName`                   | True     |         | String        | User with API Access                                     |
| `RestApiToken`                  | True     |         | String        | REST API Token for User                                  |
| `OfflineDays`                   | False    | 60      | Int           | Agent Idle Days for removal                              |
| `MachineGroupException`         | False    |         | String Array  | Groups to exclude from agent removal                     |
| `OsTypeExclusion`               | False    |         | String Array  | Exclude agents from removal based on their OsType Field. This can be a partial match. Example Syntax: 10 (Windows 10), 2022 (Windows Server 2022), Mac (Mac OS X, All Versions) |
| `OsInfoExclusion`               | False    |         | String Array  | Exclude agents from removal based on their OsInfo Field. This can be a partial match. Example Syntax: Enterprise, Professional, Server, 19077 (All Windows Machines at build 19077), 19H2026 (All Mac OS X 10.15.7 machines) |
| `ComputerNameExclusion`         | False    |         | String Array  | Exclude agents from removal based on Machine Name. This can be a partial match. |
| `IPAddressExclusion`            | False    |         | String Array  | Exclude agents from removal based on IP Address. This can be a partial address. |
| `MacAddrExclusion`              | False    |         | String Array  | Exclude agents from removal based on MAC Address. This can be a partial address. |
| `CountryExclusion`              | False    |         | String Array  | Exclude agents from removal based on Country. This can be a partial match. |
| `DomainWorkgroupExclusion`      | False    |         | String Array  | Exclude agents from removal based on Domain or Workgroup Name. This can be a partial match. |

# Output
Location of output for log, result, and error files.
```
./Remove-VsaStagnantAgent-log.txt
```

