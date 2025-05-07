---
id: '1b9044f2-b871-42c4-8f3f-8a4710299018'
slug: /1b9044f2-b871-42c4-8f3f-8a4710299018
title: 'Microsoft 365 - Click-to-Run - Audit'
title_meta: 'Microsoft 365 - Click-to-Run - Audit'
keywords: ['microsoft', 'click-to-run', 'audit', 'office', 'version', 'update', 'channel', 'auto-update']
description: 'This document provides a comprehensive guide for auditing the Click-to-Run version of Microsoft 365, including the creation of custom fields, device groups, and scheduled tasks to gather essential information about the installed Office version and its update settings.'
tags: ['report', 'software', 'update', 'windows']
draft: false
unlisted: false
---

## Purpose

The solution aims to audit the basic information of the installed Click-to-Run version of Microsoft 365.

## Associated Content

| Content                                                                                     | Type          | Function                                                                                                      |
|---------------------------------------------------------------------------------------------|---------------|--------------------------------------------------------------------------------------------------------------|
| [Endpoint - C2R Office Version](/docs/9229f1df-c80a-4333-8184-2c54954b4996)           | Custom Field  | Stores the C2R Office version installed on the machine.                                                    |
| [Endpoint - C2R Auto Update](/docs/3fbd3eec-1a64-44d4-a812-fc2ac0e359e0)             | Custom Field  | Stores whether the C2R Office Auto Update is enabled or disabled.                                          |
| [Endpoint - C2R Update Channel](/docs/371c0aa5-4230-4952-b341-f5c58b0b46ad)          | Custom Field  | Stores the Update Channel of the Office installed on the machine.                                          |
| [Endpoint - C2R Data Collection Time](/docs/d6a8abaa-dc34-4f49-8bf6-2bffe1ac40d0)    | Custom Field  | Stores the time when the C2R Update Channel, C2R Auto Update, and C2R Office Version custom fields were updated. |
| [Device Group - Office C2R Auditing](/docs/4611eb6b-e00e-4e38-9935-531f71852e8c)     | Device Group  | A group of computers with Microsoft 365 installed.                                                         |
| [Task - Microsoft 365 - Click-to-Run - Get Details](/docs/f5099dd5-8e47-468f-a623-a245c342eb19) | Task          | Retrieves the installed Microsoft Click-to-Run Office version on the machine, verifies whether auto-update is enabled, and obtains the Update channel. |

## Implementation

1. Create the following Custom Fields:
   - [C2R Office Version](/docs/9229f1df-c80a-4333-8184-2c54954b4996)
   - [C2R Auto Update](/docs/3fbd3eec-1a64-44d4-a812-fc2ac0e359e0)
   - [C2R Update Channel](/docs/371c0aa5-4230-4952-b341-f5c58b0b46ad)
   - [C2R Data Collection](/docs/d6a8abaa-dc34-4f49-8bf6-2bffe1ac40d0)

2. Create this device group:
   - [Device Group - Office C2R Auditing](/docs/4611eb6b-e00e-4e38-9935-531f71852e8c)

3. Create and schedule this task as outlined in the document:
   - [Microsoft 365 - Click-to-Run - Get Details](/docs/f5099dd5-8e47-468f-a623-a245c342eb19)


