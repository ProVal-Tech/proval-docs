---
id: 'vsa-updating-machine-cfs-with-org-cf-patching-schedule'
title: 'Updating Machine CFs with Org CF Patching Schedule'
title_meta: 'Updating Machine CFs with Org CF Patching Schedule'
keywords: ['vsa', 'patching', 'configuration', 'scheduling', 'api']
description: 'This document outlines the process for updating machine custom fields with the organization custom field patching schedule, including requirements, process steps, and parameters for the API call.'
tags: ['configuration', 'patching', 'api', 'schedule', 'servers', 'workstations']
draft: false
unlisted: false
---
# Overview
Updates Machine CFs with the Org CF Patching schedule, considering Machine View, and Group exceptions.

# Requirements
VSAAPI Module

# Process
1. Gets the All Servers and All Workstations view ID from API
2. Gets all agents in the relevant view
3. Sets CF 'xPVAL Patch Schedule' value on all servers in the environment to the 'Servers - Patch Schedule' Org CF Value
4. Sets CF 'xPVAL Patch Schedule' value on all Workstations in the environment to the 'Workstations - Patch Schedule' Org CF Value
5. Checks for any Group Exceptions in the Org CFs and applies those values to the specified groups.

# Notes
The Custom Field for Group Exceptions MUST meet the following syntax:

> GROUPNAME SCHEDULE|GROUPNAME SCHEDULE

Specifically, for each group that needs an exception within an org, list the group name, then a single space, then the name of the patching schedule (which can be anything). If you have more than one group, separate each group with a pipe.

# Payload Usage
Passes the parameters to VSAAPI for use in the API call

```
.\Update-VsaPatchingSchedule.ps1 -BaseURL https://vsa.provaltech.com -VsaUserName dantestapi -RestApiToken 8a8e0cf0-bac1-4faa-ae2e-3cfa04e3938c
```

# Parameters

| Parameter         | Alias | Required | Default | Type   | Description                |
|-------------------|-------|----------|---------|--------|----------------------------|
| `BaseURL`        |       | True     |         | String | VSA URL                    |
| `VsaUserName`    |       | True     |         | String | User with Api Access       |
| `RestApiToken`   |       | True     |         | String | Rest Api Token for User    |

# Output
.\Update-VsaPatchingSchedule-log.txt


