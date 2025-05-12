---
id: '337848a2-3757-45c9-8142-17abf004a78e'
slug: /337848a2-3757-45c9-8142-17abf004a78e
title: 'BitLocker Audit + Recovery Key Gathering'
title_meta: 'BitLocker Audit + Recovery Key Gathering'
keywords: ['bitlocker', 'audit', 'recovery', 'key', 'management', 'device', 'groups', 'custom', 'tasks']
description: 'This document outlines a solution for auditing BitLocker status and managing recovery keys using custom tasks and device groups in ConnectWise RMM. It provides step-by-step implementation instructions and associated content for effective management.'
tags: ['recovery']
draft: false
unlisted: false
---

## Purpose

This solution uses custom tasks and device groups to audit and gather information.

## Associated Content

| Content                                                                                       | Type         | Function                                                                                                                                                       |
|-----------------------------------------------------------------------------------------------|--------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [CW RMM - Custom Field - BitLocker Key Backup Status](/docs/362c3958-f97e-4f40-bd1d-89cbfed9b17f) | Custom Field | Displays the most recent result after pushing the BitLocker recovery keys into AD/Azure AD.                                                                   |
| [CW RMM - Custom Field - BitLocker Status and Recovery Key Audit](/docs/a7785954-5a6d-4003-9d0e-c919e1a96b0c) | Custom Field | Shows drives that are encrypted with BitLocker and displays the recovery key if available.                                                                    |
| [CW RMM - Device Groups - BitLocker Auditing](/docs/38b92368-f583-426c-b8f1-5f3b6d56b410) | Device Group | Used to report on devices that have: BitLocker - Audit Required, BitLocker - Enabled, BitLocker - Disabled, and BitLocker - Regular Auditing. The purpose of the group "BitLocker - Regular Auditing" is to hold all devices that have been audited for BitLocker and check their status regularly. |
| [CW RMM - Task - BitLocker Status and Recovery Key Audit](/docs/9682b5a8-d821-43f6-9b77-59d43b6ef015) | Task         | Attempts to audit the BitLocker status of the endpoint.                                                                                                      |
| [CW RMM - Task - BitLocker Recovery Key Backup Audit](/docs/b469ea90-0c1b-421b-89e2-be5c91501035) | Task         | Attempts to push BitLocker keys to AD/Azure AD. **Please note:** This is a one-way push, NOT a sync.                                                         |

## Implementation

1. Create the following custom fields. This step is required before the rest of the steps will work as expected. Follow the documentation here: [CW RMM - Custom Field - BitLocker Key Backup Status](/docs/362c3958-f97e-4f40-bd1d-89cbfed9b17f) and [CW RMM - Custom Field - BitLocker Status and Recovery Key Audit](/docs/a7785954-5a6d-4003-9d0e-c919e1a96b0c).

2. Create the device groups. This step is required before creating the tasks; otherwise, they will not have a proper target. Follow the documentation here: [CW RMM - Device Groups - BitLocker Auditing](/docs/38b92368-f583-426c-b8f1-5f3b6d56b410).

3. Create the BitLocker status and recovery key task. Follow the documentation here: [CW RMM - Task - BitLocker Status and Recovery Key Audit](/docs/9682b5a8-d821-43f6-9b77-59d43b6ef015).  
   **Please ensure that the task is scheduled per the above documentation!**

4. Create the BitLocker recovery key backup task. Follow the documentation here: [CW RMM - Task - BitLocker Recovery Key Backup Audit](/docs/b469ea90-0c1b-421b-89e2-be5c91501035).  
   **Please ensure that the task is run manually!**

## FAQ