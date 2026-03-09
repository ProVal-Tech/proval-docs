---
id: '1ec129b5-f607-41ab-b451-b54a2078950c'
slug: /1ec129b5-f607-41ab-b451-b54a2078950c
title: 'Windows Hello Audit'
title_meta: 'Windows Hello Audit'
keywords: ['windows','hello','status','audit']
description: 'The purpose of this solution is to audit Windows Hello on Windows devices. It determines whether Windows Hello is enabled and identifies the authentication method currently in use.'
tags: ['windows','auditing']
draft: false
unlisted: false
---

## Purpose

The purpose of this solution is to audit Windows Hello on Windows devices. It determines whether `Windows Hello` is enabled and identifies the authentication method currently in use.

## Associated Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [Windows Hello Status ](/docs/9979c502-1841-4183-927c-6e0c7e5abe53) | Custom Field    |  Displays whether Windows Hello is enabled on the device and specifies which Windows Hello method is being used. |
| [Enable Windows Hello Audit ](/docs/e2010129-f04b-4bca-b69e-d5b89d5254d4) | Custom Field    |  Custom Field to enable the solution. |
| [Exclude Windows Hello Audit ](/docs/53b051e4-9962-4a17-9f0d-838e40c7ae84) | Custom Field    |  Custom Fields to exclude Site/Endpoint from the solution. |
| [Machines Opted For Windows Hello Audit ](/docs/76e7fddd-b77c-4aac-ab3d-95aef75a7b04) | Group |  Contains machines where the Windows Hello audit is enabled.|
| [Get Windows Hello Status ](/docs/2de3c07b-22ab-4796-90b9-e6e0f4082299) | Script| Audits Windows Hello on windows machines. |

## Implementation

- Create the following custom fields:
    - [Windows Hello Status ](/docs/9979c502-1841-4183-927c-6e0c7e5abe53)
    - [Enable Windows Hello Audit ](/docs/e2010129-f04b-4bca-b69e-d5b89d5254d4)
    - [Exclude Windows Hello Audit ](/docs/53b051e4-9962-4a17-9f0d-838e40c7ae84)
- Create [Group - Machines Opted For Windows Hello Audit ](/docs/76e7fddd-b77c-4aac-ab3d-95aef75a7b04)  as per instructions in the document.
- Create [Script - Get Windows Hello Status ](/docs/2de3c07b-22ab-4796-90b9-e6e0f4082299)  as per instructions in the document.
