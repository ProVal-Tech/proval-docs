---
id: '27e27b0e-f21e-4bb0-84e2-518eac8662b1'
title: 'Remove Stagnant VSA Agents'
title_meta: 'Remove Stagnant VSA Agents from the Environment'
keywords: ['vsa', 'agents', 'offline', 'removal', 'api']
description: 'This document provides an overview of a script that removes VSA agents from the environment that have been offline for a specified number of days. It details the requirements, process, payload usage, parameters, and output location for logs, results, and errors.'
tags: ['vsa', 'offline', 'removal', 'api', 'configuration']
draft: false
unlisted: false
---
# Overview

Removes VSA Agents from the environment that exceed X days offline

# Requirements

Requires VSAAPI Module to be loaded.

# Process

Gets a list of agents that meet the set criteria (offline for `$OfflineDays` days, not in `$MachineGroupException` groups) and runs the VSAAPI function `Remove-VsaAgent`, removing them from the VSA without first uninstalling the agent.

# Payload Usage

```powershell
./Remove-VsaStagnantAgent.ps1 -BaseURL https://vsa.provaltech.com -VsaUserName apiServiceAccount -RestApiToken abcd-efgh-ijkl-mnop -OfflineDays 30 -MachineGroupException proval.development
```

Removes agents offline for 30 days in all groups except proval.development

# Parameters

| Parameter                  | Alias | Required | Default | Type          | Description                          |
|---------------------------|-------|----------|---------|---------------|--------------------------------------|
| `BaseURL`                 |       | True     |         | String        | VSA URL                              |
| `VsaUserName`             |       | True     |         | String        | User with Api Access                 |
| `RestApiToken`            |       | True     |         | String        | Rest Api Token for User              |
| `OfflineDays`             |       | False    | 60      | Int           | Agent Idle Days for removal          |
| `MachineGroupException`    |       | False    |         | String Array  | Groups to exclude from agent removal  |

# Output

Location of output for log, result, and error files.

```
./Remove-VsaStagnantAgent-log.txt
```







