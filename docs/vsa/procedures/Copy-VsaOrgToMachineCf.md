---
id: '2b97ee5d-c457-4f9d-a61f-6531f7351cf9'
title: 'Copy Org CFs to Machines'
title_meta: 'Copy Org CFs to Machines in Kaseya VSA'
keywords: ['kaseya', 'cf', 'machines', 'copy', 'org', 'fields']
description: 'This document provides an overview of the process to copy organizational custom fields (CFs) to machines within a specified organization in Kaseya VSA. It details the requirements, parameters, and usage of the script to ensure that machine CFs are updated accurately based on the organization CF values.'
tags: ['kaseya', 'performance', 'setup', 'update']
draft: false
unlisted: false
---

# Overview
Copies Org CFs to Machines in the specified Org.

# Requirements
- VSAAPI module

# Process
Copies Org CFs to Machines in the specified Org. It checks to ensure the Machine CF exists and creates it if it does not.

# Payload Usage
```
./Copy-VsaOrgToMachineCF -BaseURL https://vsa.provaltech.com -VsaUserName serviceApi -RestApiToken token -OrgField 'Monitoring' -MachineField 'xPVAL Monitoring Managed' -OrgName 'Proval Technologies' -AgentName fdev-win10-1
```
This command sets 'xPVAL Monitoring Managed' to the org CF value from 'Monitoring' for the specified agent.

# Parameters

| Parameter       | Alias | Required | Default | Type   | Description                                             |
|------------------|-------|----------|---------|--------|---------------------------------------------------------|
| `BaseURL`        |       | True     |         | String | VSA URL                                                |
| `VsaUserName`    |       | True     |         | String | User with API Access                                   |
| `RestApiToken`   |       | True     |         | String | REST API Token for User                                |
| `OrgName`        |       | True     |         | String | Org Name that contains the Field to Copy               |
| `OrgField`       |       | True     |         | String | Org Custom Field to Copy                               |
| `MachineField`   |       | True     |         | String | Machine Custom Field to receive data                   |
| `GroupName`      |       | False    |         | String | Optionally supply a group within the org to write the CF to exclusively |
| `AgentName`      |       | False    |         | String | Optionally supply a single agent name within the org to write the CF to exclusively |

# Output
```
./UpdateVsaMonitoringFields-log.txt
```
