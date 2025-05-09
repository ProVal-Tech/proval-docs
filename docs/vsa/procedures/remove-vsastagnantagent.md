---
id: '94d707f3-894a-4c0d-a83a-e447cb5d83fd'
slug: /94d707f3-894a-4c0d-a83a-e447cb5d83fd
title: 'Remove-VsaStagnantAgent'
title_meta: 'Remove-VsaStagnantAgent'
keywords: ['vsa', 'agents', 'offline', 'removal', 'exclusion']
description: 'This document outlines the process for removing VSA agents that have been offline for a specified number of days. It details the requirements, parameters, and usage examples for the script that facilitates this removal while allowing for various exclusion filters to be applied, ensuring that only the appropriate agents are targeted.'
tags: ['setup']
draft: false
unlisted: false
---

# Overview
This document describes the process for removing VSA Agents from the environment that have been offline for more than a specified number of days.

# Requirements
The VSAAPI Module must be loaded.

# Process
The script retrieves a list of agents that meet the specified criteria (offline for `$OfflineDays` days, not in `$MachineGroupException` groups, etc.) and runs the VSAAPI function `Remove-VsaAgent`, which removes them from the VSA without first uninstalling the agent. Exclusion filters can be applied for OsType, OsInfo (Build caption), IP Address, MAC Address, Country, Domain, and Workgroup. Filters are applied individually; applying more than one filter will remove both pools from the removal list. For example, providing `-OsTypeExclusion '10'` and `-DomainWorkgroupExclusion 'proval'` will retain all Windows 10 machines from the list **and** all machines on the ProVal domain or Workgroup.

# Payload Usage
```
./Remove-VsaStagnantAgent.ps1 -BaseURL https://vsa.provaltech.com -VsaUserName apiServiceAccount -RestApiToken abcd-efgh-ijkl-mnop -OfflineDays 30 -MachineGroupException proval.development -OsTypeException 11
```
This command removes agents that have been offline for 30 days in all groups except `proval.development`. It does not remove any endpoints running Windows 11.

# Parameters

| Parameter                     | Required | Default | Type          | Description                                           |
|-------------------------------|----------|---------|---------------|-------------------------------------------------------|
| `BaseURL`                     | True     |         | String        | VSA URL                                              |
| `VsaUserName`                 | True     |         | String        | User with API Access                                  |
| `RestApiToken`                | True     |         | String        | REST API Token for User                               |
| `OfflineDays`                 | False    | 60      | Int           | Agent idle days for removal                           |
| `MachineGroupException`       | False    |         | String Array  | Groups to exclude from agent removal                  |
| `OsTypeExclusion`             | False    |         | String Array  | Exclude agents from removal based on their OsType field. This can be a partial match. Example Syntax: 10 (Windows 10), 2022 (Windows Server 2022), Mac (Mac OS X, All Versions) |
| `OsInfoExclusion`             | False    |         | String Array  | Exclude agents from removal based on their OsInfo field. This can be a partial match. Example Syntax: Enterprise, Professional, Server, 19077 (All Windows Machines at build 19077), 19H2026 (All Mac OS X 10.15.7 machines) |
| `ComputerNameExclusion`       | False    |         | String Array  | Exclude agents from removal based on Machine Name. This can be a partial match. |
| `IPAddressExclusion`          | False    |         | String Array  | Exclude agents from removal based on IP Address. This can be a partial address. |
| `MacAddrExclusion`            | False    |         | String Array  | Exclude agents from removal based on MAC Address. This can be a partial address. |
| `CountryExclusion`            | False    |         | String Array  | Exclude agents from removal based on Country. This can be a partial match. |
| `DomainWorkgroupExclusion`    | False    |         | String Array  | Exclude agents from removal based on Domain or Workgroup Name. This can be a partial match. |

# Output
The location of output files for log, result, and error files is as follows:
```
./Remove-VsaStagnantAgent-log.txt
```
## Attachments
[Procedure_Stagnant_Agent_Removal_(Deprecated).xml](<../../../static/attachments/itg/10619887/Procedure_Stagnant_Agent_Removal_(Deprecated).xml>)