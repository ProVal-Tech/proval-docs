---
id: 'vsa-remove-vsa-stagnant-agent'
title: 'Remove Stagnant VSA Agents'
title_meta: 'Remove Stagnant VSA Agents from Environment'
keywords: ['vsa', 'agents', 'offline', 'removal', 'exclusion']
description: 'This document outlines the process for removing VSA agents that have been offline for a specified number of days. It details the requirements, parameters, and usage examples for the script that facilitates this removal while allowing for various exclusion filters to be applied, ensuring that only the appropriate agents are targeted.'
tags: ['vsa', 'agent', 'removal', 'exclusion', 'offline', 'configuration', 'setup']
draft: false
unlisted: false
---
# Overview
Removes VSA Agents from the environment that exceed X days offline.

# Requirements
Requires VSAAPI Module to be loaded.

# Process
Gets a list of agents that meet the set criteria (offline for `$OfflineDays` days, not in `$MachineGroupException` groups, etc.) and runs the VSAAPI function `Remove-VsaAgent`, removing them from the VSA without first uninstalling the agent. Exclusion Filters can be applied for OsType, OsInfo (Build caption), IPAddress, Mac Address, Country, Domain, and Workgroup. Filters are individually applied; applying more than one filter will remove BOTH pools from the removal list. For example, providing `-OsTypeExclusion '10'` and `-DomainWorkgroupExclusion 'proval'` will retain ALL Windows 10 machines from the list, **AND** ALL machines on the ProVal domain or Workgroup.

# Payload Usage
```
./Remove-VsaStagnantAgent.ps1 -BaseURL https://vsa.provaltech.com -VsaUserName apiServiceAccount -RestApiToken abcd-efgh-ijkl-mnop -OfflineDays 30 -MachineGroupException proval.development -OsTypeException 11
```
Removes agents offline for 30 days in all groups except proval.development. Does not remove any endpoint running Windows 11.

# Parameters

| Parameter                     | Required | Default | Type          | Description                                           |
|-------------------------------|----------|---------|---------------|-------------------------------------------------------|
| `BaseURL`                     | True     |         | String        | VSA URL                                              |
| `VsaUserName`                 | True     |         | String        | User with API Access                                  |
| `RestApiToken`                | True     |         | String        | Rest API Token for User                               |
| `OfflineDays`                 | False    | 60      | Int           | Agent Idle Days for removal                           |
| `MachineGroupException`       | False    |         | String Array  | Groups to exclude from agent removal                  |
| `OsTypeExclusion`             | False    |         | String Array  | Exclude agents from removal based on their OsType Field. This can be a partial match. Example Syntax: 10 (Windows 10), 2022 (Windows Server 2022), Mac (Mac OS X, All Versions) |
| `OsInfoExclusion`             | False    |         | String Array  | Exclude agents from removal based on their OsInfo Field. This can be a partial match. Example Syntax: Enterprise, Professional, Server, 19077 (All Windows Machines at build 19077), 19H2026 (All Mac OS X 10.15.7 machines) |
| `ComputerNameExclusion`       | False    |         | String Array  | Exclude agents from removal based on Machine Name. This can be a partial match. |
| `IPAddressExclusion`          | False    |         | String Array  | Exclude agents from removal based on IP Address. This can be a partial address. |
| `MacAddrExclusion`            | False    |         | String Array  | Exclude agents from removal based on MAC Address. This can be a partial address. |
| `CountryExclusion`            | False    |         | String Array  | Exclude agents from removal based on Country. This can be a partial match. |
| `DomainWorkgroupExclusion`    | False    |         | String Array  | Exclude agents from removal based on Domain or Workgroup Name. This can be a partial match. |

# Output
Location of output for log, result, and error files.
```
./Remove-VsaStagnantAgent-log.txt
```



