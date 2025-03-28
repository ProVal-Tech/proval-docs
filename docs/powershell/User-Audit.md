---
id: 'b2914f30-25ee-4d74-ac6a-77260b88ddcb'
title: 'User-Audit'
title_meta: 'User-Audit'
keywords: ['user', 'test', 'audit', 'logs', 'SID']
description: 'Documentation for the User-Audit command to retrieve specific or multiple users auditing for information username, sids, and status'
tags: ['user', 'test', 'audit', 'logs', 'SID']
draft: false
unlisted: false
---

## Description
This agnostic script is built to retrieve specific or multiple users auditing for information username, SID, and status.

## Requirements
- PowerShell V5

## Usage
1. Retrieve the users "Username", "SID", and "Status" provided in the `-pattern`.
The script matches the string provided in `-pattern` and fetches the list of users that contains the provided string in it.

*Returns users audit that contains 'Test' in it.*
```powershell
.\User-Audit.ps1 -Pattern 'Test'
This will fetch any users containing the "Test" string. If the agent is a Domain Controller, it will audit the domain accounts; otherwise, it will audit the local accounts containing a test string
```

*Returns users audit that contains 'Test' or 'Pro' in it.*
```powershell
.\User-Audit.ps1 -Pattern 'Test, Pro'
This will fetch any users containing a "Test" or "Pro" string. If the agent is a Domain Controller, it will audit the domain accounts; otherwise, it will audit the local accounts containing a "test" or "pro" string.
```

## Parameters
| Parameter      | Alias | Required | Example       | Type   | Description                                                                                           |
| -------------- | ----- | -------- | ------------- | ------ | ----------------------------------------------------------------------------------------------------- |
| `Pattern`  |       | True     | Test,Pro | String | The name of the specific/multiple user(s) pattern to match and find  the user detail of matching string.                                                  |

## Output
- Script Log



