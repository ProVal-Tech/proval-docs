---
id: 'd05c42d1-0984-4ce7-9b1e-7f144871fe1e'
slug: /d05c42d1-0984-4ce7-9b1e-7f144871fe1e
title: 'Compare-ADGroupMembers'
title_meta: 'Compare-ADGroupMembers'
keywords: ['compare', 'adgroup', 'members', 'changes']
description: 'Documentation for the Compare-ADGroupMembers command to return information about membership changes to a group based on previous runs of the script.'
tags: ['active-directory', 'report', 'security']
draft: false
unlisted: false
---

## Description
Returns information about membership changes to a group based on previous runs of the script.

## Requirements
Should be run on an Active Directory Domain Controller.

## Usage
1. If the script has not been run previously for the target group, the script will create the pertinent registry key and value, and then exit.
2. Previous runs of the script are then compared with the current run.
3. If changes are detected, the changes will be logged and added to the return object.
4. Update the list of users in the registry with the live user list.
5. Return the object.

```powershell
.\Compare-ADGroupMembers.ps1 -ADGroupName "Domain Admins"
```
Compares the users found in the last run of Compare-ADGroupMembers.ps1 with the current list of members of the specified group and returns the differences between the two.

## Parameters
| Parameter         | Alias | Required  | Default   | Type      | Description                               |
| ----------------- | ----- | --------- | --------- | --------- | ----------------------------------------- |
| `ADGroupName`     |       | True      |           | String    | Specifies the name of the group to compare the membership of. |

## Output
Location of output for log, result, and error files.

- `System.Object`
- `.\Compare-ADGroupMembers-log.txt`
- `.\Compare-ADGroupMembers-data.txt`
- `.\Compare-ADGroupMembers-error.txt`