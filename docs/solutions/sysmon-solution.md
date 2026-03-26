---
id: '2db51f41-1313-46c4-81f1-8c67ed578b73'
slug: /2db51f41-1313-46c4-81f1-8c67ed578b73
title: 'Sysmon Solution'
title_meta: 'Sysmon Solution'
keywords: ['sysmon', 'windows','configuration', 'installation', 'endpoint']
description: 'This solution provides full lifecycle management for Sysmon, including installation, uninstallation, and control of all related Sysmon services.'
tags: ['installation','windows']
draft: False
unlisted: false
last_update:
  date: 2026-03-26
---

## Purpose

This solution provides full lifecycle management for Sysmon, including installation, uninstallation, and control of all related Sysmon services.

## Associated Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [Custom Field - Enable Sysmon Installation ](/docs/cfcd7216-76be-40ee-89ec-cf636bc243f8)   | Custom Field | Custom field to handle installation Sysmon on windows machines. |
| [Custom Field - Sysmon ConfigFile DownloadURL](/docs/03a3c0c1-4c8c-42a9-9aa6-18c5fd745b8d)   | Custom Field | Specify the file path of the Sysmon configuration file that will be used for applying the Sysmon settings |
| [Custom Field - Exclude Sysmon Installation](/docs/8552abe9-3bbe-46c4-84f6-2c03fb73948b)   | Custom Field | Custom field to exclude site/endpoint from deploying the Sysmon installation.|
| [Group - Sysmon Deployment](/docs/424ddb1a-2a1b-47fb-b3cd-89ff4cf8b7a1)   | Group | Contains the machines which are opted for sysmon deployment.|
| [Group - Machines with Sysmon](/docs/03938ade-e9a6-4f71-b0d6-3208659796f5)   | Group | Includes machines with Sysmon installed on them.|
| [Task - Sysmon - Install](/docs/05fe8d4e-6e82-4bb1-a0eb-48c46627132d)   | Task | Installs Sysmon application on windows machines.|
| [Task - Sysmon - Uninstall](/docs/01f2be25-7b8c-490e-9f0c-0eff4f1f7925)   | Task | Uninstalls Sysmon application on windows machines.|
| [Monitor - Sysmon64 Service](/docs/8e2bc974-4a4e-4d7b-847d-505ff0cf0836)   | Monitors | Monitors Sysmon64 Service on 64-bit Windows machines. |
| [Monitor - Sysmon Service](/docs/37c40f9e-684e-4989-addf-a6f71eda344c)   | Monitors | Monitors Sysmon Service on 32-bit Windows machines. |

## Implementation


- Create the the following custom fields using the implementation instruction provided in the document.
  - [Custom Field - Enable Sysmon Installation ](/docs/cfcd7216-76be-40ee-89ec-cf636bc243f8) 
  - [Custom Field - Sysmon ConfigFile DownloadURL](/docs/03a3c0c1-4c8c-42a9-9aa6-18c5fd745b8d) 
  - [Custom Field - Exclude Sysmon Installation](/docs/8552abe9-3bbe-46c4-84f6-2c03fb73948b) 
- Create the the following Groups using the implementation instruction provided in the document.
  - [Group - Sysmon Deployment](/docs/424ddb1a-2a1b-47fb-b3cd-89ff4cf8b7a1) 
  - [Group - Machines with Sysmon](/docs/03938ade-e9a6-4f71-b0d6-3208659796f5)
- Create the the following Tasks using the implementation instruction provided in the document.  
  - [Task - Sysmon - Install](/docs/05fe8d4e-6e82-4bb1-a0eb-48c46627132d) 
  - [Task - Sysmon - Uninstall](/docs/01f2be25-7b8c-490e-9f0c-0eff4f1f7925) 
- - Create the the following monitors using the implementation instruction provided in the document.  
  - [Monitor - Sysmon64 Service](/docs/8e2bc974-4a4e-4d7b-847d-505ff0cf0836)
  - [Monitor - Sysmon Service](/docs/37c40f9e-684e-4989-addf-a6f71eda344c) 

## Changelog

### 2026-03-26

- Initial version of the document
