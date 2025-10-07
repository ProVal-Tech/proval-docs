---
id: 'e44c752f-6457-428a-84b7-506f6be81714'
slug: /e44c752f-6457-428a-84b7-506f6be81714
title: 'Windows Secure boot Audit'
title_meta: 'Windows Secure boot Audit'
keywords: ['audit','bios','certificates','secureboot','windows']
description: 'This solution helps to display the status of key certificate and configurations that will be needed before the current secure boot certificates expire.'
tags: ['bios','certificates','secureboot','windows']
draft: false
unlisted: false
---

## Purpose

This solution guides to display the status of key certificate and configurations in a dataview that will be needed before the current secure boot certificates expire.

## Associated Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [Windows Secure Boot](/docs/263a9e69-95ea-4189-b4c7-f2be7f074872)     |   Role   | Role to detect if a Windows agent has secure boot enabled|
|[Windows Telemetry](/docs/53371c3c-92ce-468b-8017-cacce1921b26)  |  Role  |   Role to detect if a Windows agent has telemetry enabled.  |
|[Windows DB Certificate](/docs/046378db-8236-470b-b6d3-dc6955a19e9a)  |  Role  | Role to detect if a Windows agent has the updated 2023 DB Certificate.   |
|[Windows KEK Certificate](/docs/22cf1518-f97f-49cd-a95d-7ea1816714a7)  |  Role  |  Role to detect if a Windows agent has the updated 2023 KEK Certificate.  |
|[Windows Secure Boot Audit [Role]](/docs/380e59d8-81c8-41e8-a117-ee55867cd324)  |  Dataview  | This dataview displays the status of key certificate and configurations that will be needed before the current secure boot certificates expire.   |

## Implementation

- Import below roles:
    - [Windows Secure Boot](/docs/263a9e69-95ea-4189-b4c7-f2be7f074872)  
    - [Windows Telemetry](/docs/53371c3c-92ce-468b-8017-cacce1921b26)  
    - [Windows DB Certificate](/docs/046378db-8236-470b-b6d3-dc6955a19e9a)  
    - [Windows KEK Certificate](/docs/22cf1518-f97f-49cd-a95d-7ea1816714a7)  

- Import the dataview [Windows Secure Boot Audit [Role]](/docs/380e59d8-81c8-41e8-a117-ee55867cd324)  
- The computers will take some time to detect the role and slowly the [dataview](/docs/380e59d8-81c8-41e8-a117-ee55867cd324) will start showing the secure boot details.