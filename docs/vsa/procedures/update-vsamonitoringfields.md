---
id: '3a41852e-86f2-4fa6-b874-9ba472c9a223'
slug: /3a41852e-86f2-4fa6-b874-9ba472c9a223
title: 'Update-VsaMonitoringFields'
title_meta: 'Update-VsaMonitoringFields'
keywords: ['vsa', 'monitoring', 'exclusions', 'agents', 'automation']
description: 'This document provides an overview of the process to update monitoring exclusions for agents in VSA using automation. It details the requirements for the VSAAPI module, the parameters for executing the script, and examples of how to use the script for on-demand and scheduled updates. The payload usage section illustrates how to manage exclusion settings for agents, groups, and organizations effectively.'
tags: ['security', 'setup']
draft: false
unlisted: false
---

# Overview
Updates Machine CFs to manage monitoring exclusions.

# Requirements
- VSAAPI module

# Process
Automation will be used to write the Org CF to the machines daily, using `-SetManagedValues`. The script can also be used on-demand to assign specific exclusions to monitoring on an Agent, Group, Org, or Environment-wide basis.

# Payload Usage
```
./UpdateVsaMonitoringFields.ps1 <API Auth Params> -ExcludeAll
```
Writes 'Yes' to 'xPVAL Exclude From Monitoring' for every Agent in the environment. `-IncludeAll` can be used instead to write 'No'.

```
./UpdateVsaMonitoringFields.ps1 <API Auth Params> -Exclude -OrgName 'ProVal Technologies'
```
Writes 'Yes' to 'xPVAL Exclude From Monitoring' for every Agent in the organization 'ProVal Technologies'. `GroupName` and `AgentName` can also be provided. `OrgName` accepts both name and `OrgRef` (shortname).

```
./UpdateVsaMonitoringFields.ps1 <API Auth Params> -SetManagedValues
```
Writes contents of Org CF 'Managed' to 'xPVAL Monitoring Managed' on every endpoint.

# Parameters

| Parameter       | Alias | Required | Default | Type   | Description                                                                                      |
|------------------|-------|----------|---------|--------|--------------------------------------------------------------------------------------------------|
| `BaseURL`        |       | True     |         | String | VSA URL                                                                                         |
| `VsaUserName`    |       | True     |         | String | User with API Access                                                                             |
| `RestApiToken`   |       | True     |         | String | REST API Token for User                                                                          |
| `IncludeAll`     |       | False    |         | Switch | Writes 'No' to 'xPVAL Excluded From Monitoring' CF on ALL agents.                              |
| `Include`        |       | False    |         | Switch | Writes 'No' to 'xPVAL Excluded From Monitoring' CF for agents in the indicated container.      |
| `ExcludeAll`     |       | False    |         | Switch | Writes 'Yes' to 'xPVAL Excluded From Monitoring' CF on ALL agents.                             |
| `Exclude`        |       | False    |         | Switch | Writes 'Yes' to 'xPVAL Excluded From Monitoring' CF for agents in the indicated container.     |
| `OrgName`        |       | False    |         | String | Specifies Organization Level container for Include / Exclude parameters. Accepts Full or Short OrgName. |
| `GroupName`      |       | False    |         | String | Specifies Group Level container for Include / Exclude parameters. This is the formal VSA Reverse Group Name. |
| `AgentName`      |       | False    |         | String | Specifies Specific Agent for Include / Exclude parameters.                                       |

# Output
```
./UpdateVsaMonitoringFields-log.txt
```