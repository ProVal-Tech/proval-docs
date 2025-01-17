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
| [Is Primary Domain Controller](https://proval.itglue.com/DOC-5078775-14036215) | Endpoint | Used to determine whether a Domain Controller is infrastructure master or not. |

### Groups

| Content | Type | Function |
|---------|------|----------|
| [Domain Controllers](https://proval.itglue.com/DOC-5078775-14036214) | Dynamic Group | Stores the Domain Controllers in a single place. |
| [Infrastructure Master](https://proval.itglue.com/DOC-5078775-14029455) | Dynamic Group | Stores all the available infrastructure masters in a single place. |

### Tasks/Scripts

| Content | Type | Function |
|---------|------|----------|
| [Validate Primary Domain Controller](https://proval.itglue.com/DOC-5078775-14036218) | Task | Validate whether a computer is infrastructure master or not and update the custom field [Is Primary Domain Controller](https://proval.itglue.com/DOC-5078775-14036215). |

### Monitor

| Content | Type | Function |
|---------|------|----------|
| [Possible Brute Force Attack](https://proval.itglue.com/DOC-5078775-18075486) | Monitor | Check the computer for security event log event id 4625 where the count of occurrences is greater than 10 in the last 60 minutes. |

## Implementation

1. Create the required Custom Fields (if not exist) using the below documentation:
   - [Is Primary Domain Controller](https://proval.itglue.com/DOC-5078775-14036215)

2. Create the following Dynamic Groups (if not exist):
   - [Domain Controllers](https://proval.itglue.com/DOC-5078775-14036214)
   - [Infrastructure Master](https://proval.itglue.com/DOC-5078775-14029455)

3. Create and schedule the following Task(s) (if not exist):
   - [Validate Primary Domain Controller](https://proval.itglue.com/DOC-5078775-14036218)

### Monitor

4. Create and enable the following monitor:
   - [Possible Brute Force Attack](https://proval.itglue.com/DOC-5078775-18075486)











