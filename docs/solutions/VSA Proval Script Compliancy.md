---
id: '9ec556eb-e7b8-410d-8f03-0dcb0a8b549b'
title: 'VSA Proval Script Compliancy'
title_meta: 'VSA Proval Script Compliancy'
keywords: ['endpoint', 'compatibility', 'proval', 'windows', 'customfield', 'agent', 'view']
description: 'This document outlines the process for checking if an endpoint operating system and PowerPoint version are supported by ProVal. It updates a custom field with compatibility status and organizes agents into appropriate views based on their compatibility.'
tags: ['windows']
draft: false
unlisted: false
---

## Purpose

This document checks whether an endpoint operating system (OS) and PowerPoint version (for Windows) are supported by ProVal. It updates a custom field with either 'Compatible' or a reason why the endpoint is not compatible, and adds the agent to the appropriate view.

## Associated Content

| Content                                                                                                                                                                             | Type | Function                                         |
|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------|--------------------------------------------------|
| [EPM - Data Collection - Custom Field - xPVAL ProVal Compatible Endpoint](<../vsa/custom-fields/xPVAL ProVal Compatible Endpoint.md>)                                                         | CF   | Contains compatibility data per endpoint         |
| [EPM - Data Collection - View - xPVAL ProVal Compatible Endpoint xPVAL ProVal Incompatible Endpoint](<../vsa/views/xPVAL ProVal Compatible Endpoint xPVAL ProVal Incompatible Endpoint.md>)                               | View | Views to display compatible/incompatible agents in the VSA |
| [EPM - Data Collection - Agent Procedure - VSA Proval Script Compliancy Update](<../vsa/procedures/VSA Proval Script Compliancy Update.md>)                                                 | AP   | Adds compatibility data to the CF                |

## Implementation

- Create a custom field (CF) in the Client Environment
- Import the view into the Client Environment
- Update the view to use the appropriate CF after import
- Import the agent procedure (AP) into the Client Environment
- Ensure the AP has the appropriate CF assigned to `updateSystemInfo()`
- Run the AP on all endpoints
- (Optional) Create an automation policy to run this solution on a scheduled basis



