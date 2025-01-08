---
id: 'vsa-check-endpoint-compatibility'
title: 'Check Endpoint Compatibility for ProVal Support'
title_meta: 'Check Endpoint Compatibility for ProVal Support'
keywords: ['endpoint', 'compatibility', 'proval', 'windows', 'customfield', 'agent', 'view']
description: 'This document outlines the process for checking if an endpoint operating system and PowerPoint version are supported by ProVal. It updates a custom field with compatibility status and organizes agents into appropriate views based on their compatibility.'
tags: ['customfield', 'compatibility', 'view', 'agent', 'windows']
draft: false
unlisted: false
---
## Purpose

Checks that an endpoint OS and Powerpoint version (for Windows) is ProVal supported, updates the custom field with either 'Compatible' or a reason why the endpoint is not compatible, and adds the agent to the appropriate view.

## Associated Content

| Content                                                                                                                                                                             | Type | Function                                         |
|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------|--------------------------------------------------|
| [EPM - Data Collection - Custom Field - xPVAL ProVal Compatible Endpoint](https://proval.itglue.com/DOC-5078775-11409312)                                                         | CF   | Contains compatibility data per endpoint         |
| [EPM - Data Collection - View - xPVAL ProVal Compatible Endpoint | xPVAL ProVal Incompatible Endpoint](https://proval.itglue.com/DOC-5078775-11409320)                               | View | Views to display compatible / incompatible agents in the VSA |
| [EPM - Data Collection - Agent Procedure - VSA Proval Script Compliancy Update](https://proval.itglue.com/DOC-5078775-11409316)                                                 | AP   | Adds compatibility data to the CF                |

## Implementation

- Create CF in Client Environment
- Import View into Client Environment
- Update View to use the appropriate CF after import
- Import Agent Procedure into Client Environment
- Ensure AP has the appropriate CF assigned to updateSystemInfo()
- Run AP on all endpoints
- (Optional) Create an automation policy to run this solution on a scheduled basis

