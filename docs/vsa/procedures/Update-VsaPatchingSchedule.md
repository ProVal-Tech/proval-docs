---
id: 'cc16fc4b-276f-4416-a994-e917421add17'
slug: /cc16fc4b-276f-4416-a994-e917421add17
title: 'Update-VsaPatchingSchedule'
title_meta: 'Update-VsaPatchingSchedule'
keywords: ['vsa', 'patching', 'configuration', 'scheduling', 'api']
description: 'This document outlines the process for updating machine custom fields with the organization custom field patching schedule, including requirements, process steps, and parameters for the API call.'
tags: ['api', 'patching']
draft: false
unlisted: false
---

# Overview
This document outlines the process for updating machine custom fields (CFs) with the organization custom field patching schedule, considering Machine View and Group exceptions.

# Requirements
- VSAAPI Module

# Process
1. Retrieve the All Servers and All Workstations view ID from the API.
2. Get all agents in the relevant view.
3. Set the CF 'xPVAL Patch Schedule' value on all servers in the environment to the 'Servers - Patch Schedule' Org CF value.
4. Set the CF 'xPVAL Patch Schedule' value on all workstations in the environment to the 'Workstations - Patch Schedule' Org CF value.
5. Check for any Group Exceptions in the Org CFs and apply those values to the specified groups.

# Notes
The custom field for Group Exceptions **MUST** meet the following syntax:

> GROUPNAME SCHEDULE|GROUPNAME SCHEDULE

For each group that needs an exception within an organization, list the group name, followed by a single space, and then the name of the patching schedule (which can be anything). If there is more than one group, separate each group with a pipe.

# Payload Usage
Pass the parameters to VSAAPI for use in the API call.

```
./Update-VsaPatchingSchedule.ps1 -BaseURL https://vsa.provaltech.com -VsaUserName dantestapi -RestApiToken 8a8e0cf0-bac1-4faa-ae2e-3cfa04e3938c
```

# Parameters

| Parameter       | Alias | Required | Default | Type   | Description                |
|------------------|-------|----------|---------|--------|----------------------------|
| `BaseURL`       |       | True     |         | String | VSA URL                    |
| `VsaUserName`   |       | True     |         | String | User with API Access       |
| `RestApiToken`  |       | True     |         | String | REST API Token for User    |

# Output
The output will be saved to `./Update-VsaPatchingSchedule-log.txt`.


