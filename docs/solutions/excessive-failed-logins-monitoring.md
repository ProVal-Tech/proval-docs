---
id: '1b773da4-e288-4874-9d6b-2e765ddcf248'
slug: /1b773da4-e288-4874-9d6b-2e765ddcf248
title: 'Excessive Failed Logins Monitoring'
title_meta: 'Excessive Failed Logins Monitoring'
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
| [Is Primary Domain Controller](/docs/b6a7c804-693c-4cf5-a60e-61dcb10ddcae) | Endpoint | Used to determine whether a Domain Controller is an infrastructure master or not. |

### Groups

| Content | Type | Function |
|---------|------|----------|
| [Domain Controllers](/docs/eeeb4ee0-d683-44fd-81cf-7f8872b71c68) | Dynamic Group | Stores the Domain Controllers in a single place. |
| [Infrastructure Master](/docs/c2c2d22b-f735-4ec5-91a6-a014ab2e84a8) | Dynamic Group | Stores all the available infrastructure masters in a single place. |

### Tasks/Scripts

| Content | Type | Function |
|---------|------|----------|
| [Validate Primary Domain Controller](/docs/7bc6ac21-322d-4630-836f-f00e93b94168) | Task | Validate whether a computer is an infrastructure master or not and update the custom field [Is Primary Domain Controller](/docs/b6a7c804-693c-4cf5-a60e-61dcb10ddcae). |

### Monitor

| Content | Type | Function |
|---------|------|----------|
| [Excessive Failed Logins Attempt](/docs/3691bc36-640e-4d39-8a41-0513d44c7d41) | Monitor | Check the computer for security event log event ID 4625 where the count of occurrences is greater than 10 in the last 60 minutes. |

## Implementation

1. Create the required Custom Fields (if not exist) using the documentation below:
   - [Is Primary Domain Controller](/docs/b6a7c804-693c-4cf5-a60e-61dcb10ddcae)

2. Create the following Dynamic Groups (if not exist):
   - [Domain Controllers](/docs/eeeb4ee0-d683-44fd-81cf-7f8872b71c68)
   - [Infrastructure Master](/docs/c2c2d22b-f735-4ec5-91a6-a014ab2e84a8)

3. Create and schedule the following Task(s) (if not exist):
   - [Validate Primary Domain Controller](/docs/7bc6ac21-322d-4630-836f-f00e93b94168)

### Monitor

4. Create and enable the following monitor:
   -  [Excessive Failed Logins Attempt](/docs/3691bc36-640e-4d39-8a41-0513d44c7d41)