---
id: '27e27b0e-f21e-4bb0-84e2-518eac8662b1'
title: 'Remove Stagnant VSA Agents'
title_meta: 'Remove Stagnant VSA Agents from the Environment'
keywords: ['vsa', 'agents', 'offline', 'removal', 'api']
description: 'This document provides an overview of a script that removes VSA agents from the environment that have been offline for a specified number of days. It details the requirements, process, payload usage, parameters, and output location for logs, results, and errors.'
tags: ['api']
draft: true
unlisted: false
---

# Overview

This script removes VSA agents from the environment that have been offline for a specified number of days.

# Requirements

The VSAAPI Module must be loaded.

# Process

The script retrieves a list of agents that meet the specified criteria (offline for `$OfflineDays` days and not in `$MachineGroupException` groups) and executes the VSAAPI function `Remove-VsaAgent`, removing them from the VSA without first uninstalling the agent.

# Payload Usage

```powershell
./Remove-VsaStagnantAgent.ps1 -BaseURL https://vsa.provaltech.com -VsaUserName apiServiceAccount -RestApiToken abcd-efgh-ijkl-mnop -OfflineDays 30 -MachineGroupException proval.development
```

This command removes agents that have been offline for 30 days in all groups except `proval.development`.

# Parameters

| Parameter                  | Alias | Required | Default | Type          | Description                          |
|---------------------------|-------|----------|---------|---------------|--------------------------------------|
| `BaseURL`                 |       | True     |         | String        | VSA URL                              |
| `VsaUserName`             |       | True     |         | String        | User with API access                 |
| `RestApiToken`            |       | True     |         | String        | REST API token for the user         |
| `OfflineDays`             |       | False    | 60      | Int           | Number of idle days for agent removal|
| `MachineGroupException`    |       | False    |         | String Array  | Groups to exclude from agent removal  |

# Output

The output location for log, result, and error files is as follows:

```
./Remove-VsaStagnantAgent-log.txt
```

