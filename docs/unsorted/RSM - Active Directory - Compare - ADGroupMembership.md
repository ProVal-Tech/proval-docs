---
id: 'ps-compare-ad-group-members'
title: 'Compare Active Directory Group Members'
title_meta: 'Compare Active Directory Group Members'
keywords: ['active-directory', 'membership', 'comparison', 'registry', 'logging']
description: 'This document provides an overview of a script that compares the membership of an Active Directory group by analyzing previous runs and logging any changes detected. It is intended to be run on an Active Directory Domain Controller and details the process, parameters, and output of the script.'
tags: ['active-directory', 'logging', 'comparison', 'registry', 'windows']
draft: true
unlisted: true
---
## Overview

Returns information about membership changes to a group based on previous runs of the script.

## Requirements

1. Should be run on an Active Directory Domain Controller

## Process

1. If the script has not been run previously for the target group, then the script creates the pertinent registry key and value, and then exits.
2. Previous runs of the script are then compared with the current run.
3. If there are changes detected, the changes will be logged and added to the return object.
4. Update the list of users in the registry with the live user list.
5. Return the object.

## Payload Usage

Describe how the payload is executed and if it requires any parameters. Delete the parameter block below if not needed. State that this does not use a payload if it doesn’t.

Example:
```
Compare-ADGroupMembers.ps1 -ADGroupName "Domain Admins"
```
Compares the users found in the last run of Compare-ADGroupMembers.ps1 with the current list of members of the specified group and returns the differences between the two.

### Parameters

| Parameter       | Alias | Required | Default | Type   | Description                                                                 |
|------------------|-------|----------|---------|--------|-----------------------------------------------------------------------------|
| `-ADGroupName`   |       | True     |         | String | Specifies the name of the group to compare the membership of.             |

## Output

```
    System Object
    .\Compare-ADGroupMembers-log.txt
    .\Compare-ADGroupMembers-data.txt
    .\Compare-ADGroupMembers-error.txt
```

## Locations

| Payload                                  |
|------------------------------------------|
| /repo/scripts/Compare-ADGroupMembers.ps1 |



