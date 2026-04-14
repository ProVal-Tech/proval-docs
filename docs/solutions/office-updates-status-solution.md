---
id: '1626c96c-80e1-45b9-93f3-d1b8237f911f'
slug: /1626c96c-80e1-45b9-93f3-d1b8237f911f
title: 'Office Update Status Solution'
title_meta: 'Office Update Status Solution'
keywords: ['office', 'update', 'cf', 'status']
description: 'This solution document is retrive the office update status from the machine and update the result into the custom field.'
tags: []
draft: true
unlisted: false
last_update:
  date: 2026-04-04
---

## Purpose

This solution document is retrive the office update status from the machine and update the result into the custom field.

## Associated Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [Agent Procedure - Office Enable Update Status - CF](/docs/e4450cc1-05dc-4cc1-8803-3ae7bdbd7e19)      | Script | This will retrieve the office update status and store the result into the Custom field |
| [Custom Field - cPVAL Office Update](/docs/1be983dd-ef42-4873-a299-a5cd6e44c2ea) | Custom field | This will store the result |
| [Views - cPVAL Office Updates Enabled](/docs/f71462bc-a274-4bee-839e-0f48effe09c6) | View | It will display the machines that have office update is enabled |
| [Views - cPVAL Office Channel Status](/docs/9c5b8f5a-3e80-499a-bcf2-ac376fedd841) | View | It will disaply the machines that have office update is diabled |


## Implementation

1. Create the Custom Field:
[Custom Field - cPVAL Office Update](/docs/1be983dd-ef42-4873-a299-a5cd6e44c2ea)

2. Import the agent procedure:
[Agent Procedure - Office Enable Update Status - CF](/docs/e4450cc1-05dc-4cc1-8803-3ae7bdbd7e19)

3. Map the Custom field into the Agent procedure:

![Image 1](../../../static/img/docs/1626c96c-80e1-45b9-93f3-d1b8237f911f/)


4. Create the views:
[Views - cPVAL Office Updates Enabled](/docs/f71462bc-a274-4bee-839e-0f48effe09c6)
[Views - cPVAL Office Channel Status](/docs/9c5b8f5a-3e80-499a-bcf2-ac376fedd841)


## FAQ

<!-- Add frequently asked questions here -->

## Changelog