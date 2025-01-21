---
id: '1b773da4-e288-4874-9d6b-2e765ddcf248'
title: 'Monitor for Possible Brute Force Attack on Domain Controller'
title_meta: 'Monitor for Possible Brute Force Attack on Domain Controller'
keywords: ['brute', 'force', 'attack', 'domain', 'controller', 'monitoring', 'security']
description: 'This document outlines a solution for monitoring domain controllers for excessive logon failures within a one-hour window, which may indicate a potential brute force attack. It includes details on custom fields, dynamic groups, tasks, and monitoring setup necessary for effective security management.'
tags: ['security']
draft: false
unlisted: false
---

## Purpose

The solution monitors the domain controller for excessive logon failures within one hour, indicating a possible brute force attack.

## Associated Content

### Custom Fields

| Content | Level | Function |
|---------|-------|----------|
| [Is Primary Domain Controller](<../cwrmm/custom-fields/Is Primary Domain Controller.md>) | Endpoint | Used to determine whether a Domain Controller is an infrastructure master or not. |

### Groups

| Content | Type | Function |
|---------|------|----------|
| [Domain Controllers](<../cwrmm/groups/Domain Controllers.md>) | Dynamic Group | Stores the Domain Controllers in a single place. |
| [Infrastructure Master](<../cwrmm/groups/Infrastructure Master.md>) | Dynamic Group | Stores all the available infrastructure masters in a single place. |

### Tasks/Scripts

| Content | Type | Function |
|---------|------|----------|
| [Validate Primary Domain Controller](<../cwrmm/tasks/Validate Primary Domain Controller.md>) | Task | Validate whether a computer is an infrastructure master or not and update the custom field [Is Primary Domain Controller](<../cwrmm/custom-fields/Is Primary Domain Controller.md>). |

### Monitor

| Content | Type | Function |
|---------|------|----------|
| [Possible Brute Force Attack](<../cwrmm/monitors/Possible Brute Force Attack.md>) | Monitor | Check the computer for security event log event ID 4625 where the count of occurrences is greater than 10 in the last 60 minutes. |

## Implementation

1. Create the required Custom Fields (if not exist) using the documentation below:
   - [Is Primary Domain Controller](<../cwrmm/custom-fields/Is Primary Domain Controller.md>)

2. Create the following Dynamic Groups (if not exist):
   - [Domain Controllers](<../cwrmm/groups/Domain Controllers.md>)
   - [Infrastructure Master](<../cwrmm/groups/Infrastructure Master.md>)

3. Create and schedule the following Task(s) (if not exist):
   - [Validate Primary Domain Controller](<../cwrmm/tasks/Validate Primary Domain Controller.md>)

### Monitor

4. Create and enable the following monitor:
   - [Possible Brute Force Attack](<../cwrmm/monitors/Possible Brute Force Attack.md>)

