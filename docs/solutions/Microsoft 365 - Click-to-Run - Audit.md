---
id: 'rmm-audit-click-to-run-microsoft-365'
title: 'Audit Click-to-Run Version of Microsoft 365'
title_meta: 'Audit Click-to-Run Version of Microsoft 365'
keywords: ['microsoft', 'click-to-run', 'audit', 'office', 'version', 'update', 'channel', 'auto-update']
description: 'This document provides a comprehensive guide for auditing the Click-to-Run version of Microsoft 365, including the creation of custom fields, device groups, and scheduled tasks to gather essential information about the installed Office version and its update settings.'
tags: ['configuration', 'software', 'update', 'windows', 'report']
draft: false
unlisted: false
---
## Purpose

The solution aims to audit the basic information of installed Click-to-Run version of Microsoft 365.

## Associated Content

| Content                                                                                     | Type          | Function                                                                                                      |
|---------------------------------------------------------------------------------------------|---------------|--------------------------------------------------------------------------------------------------------------|
| [Endpoint - C2R Office Version](https://proval.itglue.com/DOC-5078775-17917395)           | Custom Field  | Stores the C2R office version installed on the machine.                                                    |
| [Endpoint - C2R Auto Update](https://proval.itglue.com/DOC-5078775-17917401)             | Custom Field  | Stores whether the C2R office Auto update is enabled or disabled.                                          |
| [Endpoint - C2R Update Channel](https://proval.itglue.com/DOC-5078775-17917393)          | Custom Field  | Stores the Update Channel of the office installed on the machine.                                          |
| [Endpoint - C2R Data Collection Time](https://proval.itglue.com/DOC-5078775-17917394)    | Custom Field  | Stores the time when the C2R Update Channel, C2R Auto Update, and C2R Office Version custom fields were updated. |
| [Device Group - Office C2R Auditing](https://proval.itglue.com/DOC-5078775-17917403)     | Device Group  | A group of computers with Microsoft 365 installed.                                                         |
| [Task - Microsoft 365 - Click-to-Run - Get Details](https://proval.itglue.com/DOC-5078775-17917390) | Task          | Retrieves the installed Microsoft Click-to-Run Office version on the machine, verifies whether auto-update is enabled, and obtains the Update channel. |

## Implementation

1. Create the following Custom Fields:
   - [C2R Office Version](https://proval.itglue.com/DOC-5078775-17917395)
   - [C2R Auto Update](https://proval.itglue.com/DOC-5078775-17917401)
   - [C2R Update Channel](https://proval.itglue.com/DOC-5078775-17917393)
   - [C2R Data Collection](https://proval.itglue.com/DOC-5078775-17917394)

2. Create this device group:
   - [Device Group - Office C2R Auditing](https://proval.itglue.com/DOC-5078775-17917403)

3. Create and schedule this task as outlined in the document:
   - [Microsoft 365 - Click-to-Run - Get Details](https://proval.itglue.com/DOC-5078775-17917390)



