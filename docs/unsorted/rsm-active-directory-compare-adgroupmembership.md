---
id: '619512d1-a535-44c5-9095-b7b310c7d171'
slug: /619512d1-a535-44c5-9095-b7b310c7d171
title: 'RSM - Active Directory - Compare - ADGroupMembership'
title_meta: 'RSM - Active Directory - Compare - ADGroupMembership'
keywords: ['active-directory', 'membership', 'comparison', 'registry', 'logging']
description: 'This document provides an overview of a script that compares the membership of an Active Directory group by analyzing previous runs and logging any changes detected. It is intended to be run on an Active Directory Domain Controller and details the process, parameters, and output of the script.'
tags: ['active-directory', 'logging', 'registry', 'windows']
draft: false
unlisted: true
---

## Overview

This script returns information about membership changes to a group based on previous runs.

## Requirements

- Should be run on an Active Directory Domain Controller.

## Process

1. If the script has not been run previously for the target group, it creates the pertinent registry key and value, then exits.
2. Previous runs of the script are compared with the current run.
3. If changes are detected, they will be logged and added to the return object.
4. The list of users in the registry is updated with the live user list.
5. The object is returned.

## Payload Usage

Describe how the payload is executed and if it requires any parameters. Delete the parameter block below if not needed. State that this does not use a payload if it doesn’t.

Example:
```
Compare-ADGroupMembers.ps1 -ADGroupName "Domain Admins"
```
This command compares the users found in the last run of `Compare-ADGroupMembers.ps1` with the current list of members of the specified group and returns the differences between the two.

### Parameters

| Parameter       | Alias | Required | Default | Type   | Description                                                                 |
|------------------|-------|----------|---------|--------|-----------------------------------------------------------------------------|
| `-ADGroupName`   |       | True     |         | String | Specifies the name of the group to compare the membership of.             |

## Output

```
    System Object
    ./Compare-ADGroupMembers-log.txt
    ./Compare-ADGroupMembers-data.txt
    ./Compare-ADGroupMembers-error.txt
```

## Locations

| Payload                                  |
|------------------------------------------|
| /repo/scripts/Compare-ADGroupMembers.ps1 |

