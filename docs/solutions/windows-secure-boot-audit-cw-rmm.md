---
id: '05b9e73a-64ae-43f6-8ed5-89c952a3aaec'
slug: /05b9e73a-64ae-43f6-8ed5-89c952a3aaec
title: 'Windows Secure boot Audit'
title_meta: 'Windows Secure boot Audit'
keywords: ['audit','bios','certificates','secureboot','windows']
description: 'This solution fetches the status of key certificate and configurations that will be needed before the current secure boot certificates expire.'
tags: ['bios','certificates','secureboot','windows']
draft: False
unlisted: false
last_update:
  date: 2026-03-23
---

## Purpose

This solution fetches the status of key certificate and configurations that will be needed before the current secure boot certificates expire. This displays the status of Windows Secure Boot, Windows Telemetry, Windows DB Certificate and Windows KEK Certificate. 

## Associated Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [Custom Fields : Windows Secure Boot](/docs/222fae1b-23f8-45d8-9bcf-e1974ee8dcea)      |  Custom Fields           | Custom Fields to display the script output. |
| [Group : Windows Machines](/docs/222fae1b-23f8-45d8-9bcf-e1974ee8dcea)      |  Group          | Group containing online windows machines. |
| [Task : Windows Secure Boot Audit](/docs/c394b81e-3d3c-4316-8d92-0d243625a02c)      |  Task    | This Script fetches the status of key certificate and configurations that will be needed before the current secure boot certificates expire.|

## Implementation

- Create the [Custom Fields : Windows Secure Boot](/docs/222fae1b-23f8-45d8-9bcf-e1974ee8dcea) using the implementation instruction provided in the document.
- Create the  [Group : Windows Machines](/docs/222fae1b-23f8-45d8-9bcf-e1974ee8dcea) using the implementation instruction provided in the document.
- Create the [Task : Windows Secure Boot Audit](/docs/c394b81e-3d3c-4316-8d92-0d243625a02c) using the implementation instruction provided in the document.

### 2026-03-23

- Initial version of the document
