---
id: 'f8deaddc-02c1-492d-b9dc-381a653de0e5'
slug: /f8deaddc-02c1-492d-b9dc-381a653de0e5
title: 'Microsoft365 Click-to-Run Solution'
title_meta: 'Microsoft365 Click-to-Run Solution'
keywords: ['repair','c2r','office','update','channel']
description: 'This solution is used to get the Microsoft365 channel details, set the office channel update repair the office and update office the c2r.'
tags: ['office', 'office365', 'microsoft365', 'update']
draft: false
unlisted: false
last_update:
  date: 2026-03-11
---

## Purpose

The aim of this VSA solution is to get the office channel details, update, repair the C2R and set the channel on the machines.

## Associated Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
|[cPVAL Office Channel Status](/docs/880a8d01-fc10-4ea9-94d8-7b2bb87c01a5) | Custom Field | This custom field contains the office channel status of the machines.|
|[Office C2R - Get Channel Status](/docs/bf426f89-7da1-4f4b-88b7-03983136458c) | Agent Procedure | This agent procedure is used to check the Channel Status on to the machine for Microsoft Office and update the result into a Custom field.|
|[Office C2R - Set Channel](/docs/d401a54a-5bff-4d37-8fdf-001220f73fb5) | Agent Procedure | Sets the Microsoft Update Channel for a Click2Run Office installation on an endpoint. |
|[Office C2R - Repair](/docs/c0c1b5a3-0e2d-4ed9-9c0a-926ce2181c7c) | Agent Procedure | To repair the Microsoft365 office using quick\full repair |
|[Office C2R - Update](/docs/ddcdb6e8-8ce6-4c38-b494-1284f0fc6fd8) | Agent procedure | This script updates the Click-To-Run version of Microsoft 365 Apps to their latest version. |

## Implementation

1. Create the Custom Field:
[cPVAL Office Channel Status](/docs/880a8d01-fc10-4ea9-94d8-7b2bb87c01a5)

2. Create below scripts 
    - [Office C2R - Get Channel Status](/docs/bf426f89-7da1-4f4b-88b7-03983136458c)
    - [Office C2R - Set Channel](/docs/d401a54a-5bff-4d37-8fdf-001220f73fb5)
    - [Office C2R - Repair](/docs/c0c1b5a3-0e2d-4ed9-9c0a-926ce2181c7c)
    - [Office C2R - Update](/docs/ddcdb6e8-8ce6-4c38-b494-1284f0fc6fd8)

 ## Changelog

 ### 2026-03-11

 - Initial version of the document

