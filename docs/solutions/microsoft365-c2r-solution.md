---
id: 'f8deaddc-02c1-492d-b9dc-381a653de0e5'
slug: /f8deaddc-02c1-492d-b9dc-381a653de0e5
title: 'Microsoft365 Click-to-Run Solution'
title_meta: 'Microsoft365 Click-to-Run Solutionme'
keywords: ['repair','c2r','office','update','channel']
description: 'This solution is used to get the Microsoft365 channel details, set the office channel update repair the office and update office the c2r.'
tags: ['office', 'office365', 'microsoft365', 'update']
draft: false
unlisted: false
---

## Purpose

The aim is to get the office channel details, update and repair the c2r and set the channel on the machine.

## Associated Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| Link to the documentation of the content piece      | What is the type of content? (Script, Custom Table, VSA Policy, CWM Dataview, etc.) | What does this content piece do in the overall solution? |
|[Office C2R Update Channel Status](/docs/880a8d01-fc10-4ea9-94d8-7b2bb87c01a5) | Custom Field | Stores the C2R Office version installed on the machine|
|[Office C2R Update Schedule Select](/docs/d401a54a-5bff-4d37-8fdf-001220f73fb5ID) | Agent Procedure | This agent procedure will set the required channel configuration on the machine |
|[Office C2R Automatic Update Repair](/docs/c0c1b5a3-0e2d-4ed9-9c0a-926ce2181c7c) | Agent Procedure | To reapair the microsoft365 office quick\full repair |
|[Office C2R Update](/docs/ddcdb6e8-8ce6-4c38-b494-1284f0fc6fd8) | Agent procedure | Click to run update on all the office applications |

## Implementation

1. Create the following Custom Fields:

[Office C2R Update Channel Status](/docs/880a8d01-fc10-4ea9-94d8-7b2bb87c01a5)

2. Create script for set the channel

[Office C2R Update Schedule Select](/docs/d401a54a-5bff-4d37-8fdf-001220f73fb5ID)

3. Create script to repair the office 

[Office C2R Automatic Update Repair](/docs/c0c1b5a3-0e2d-4ed9-9c0a-926ce2181c7c)

4. Update the office C2R on the machine

[Office C2R Update](/docs/ddcdb6e8-8ce6-4c38-b494-1284f0fc6fd8)

