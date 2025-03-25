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
| [Endpoint - C2R Office Version](<../cwrmm/custom-fields/Endpoint - C2R Office Version.md>)           | Custom Field  | Stores the C2R Office version installed on the machine.                                                    |
| [Endpoint - C2R Auto Update](<../cwrmm/custom-fields/Endpoint - C2R Auto Update.md>)             | Custom Field  | Stores whether the C2R Office Auto Update is enabled or disabled.                                          |
| [Endpoint - C2R Update Channel](<../cwrmm/custom-fields/Endpoint - C2R Update Channel.md>)          | Custom Field  | Stores the Update Channel of the Office installed on the machine.                                          |
| [Endpoint - C2R Data Collection Time](<../cwrmm/custom-fields/Endpoint - C2R Data Collection Time.md>)    | Custom Field  | Stores the time when the C2R Update Channel, C2R Auto Update, and C2R Office Version custom fields were updated. |
| [Device Group - Office C2R Auditing](<../cwrmm/groups/Office C2R Auditing.md>)     | Device Group  | A group of computers with Microsoft 365 installed.                                                         |
| [Task - Microsoft 365 - Click-to-Run - Get Details](<../cwrmm/tasks/Microsoft 365 - Click-to-Run - Get Details.md>) | Task          | Retrieves the installed Microsoft Click-to-Run Office version on the machine, verifies whether auto-update is enabled, and obtains the Update channel. |

## Implementation

1. Create the following Custom Fields:
   - [C2R Office Version](<../cwrmm/custom-fields/Endpoint - C2R Office Version.md>)
   - [C2R Auto Update](<../cwrmm/custom-fields/Endpoint - C2R Auto Update.md>)
   - [C2R Update Channel](<../cwrmm/custom-fields/Endpoint - C2R Update Channel.md>)
   - [C2R Data Collection](<../cwrmm/custom-fields/Endpoint - C2R Data Collection Time.md>)

2. Create this device group:
   - [Device Group - Office C2R Auditing](<../cwrmm/groups/Office C2R Auditing.md>)

3. Create and schedule this task as outlined in the document:
   - [Microsoft 365 - Click-to-Run - Get Details](<../cwrmm/tasks/Microsoft 365 - Click-to-Run - Get Details.md>)



