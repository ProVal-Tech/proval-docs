---
id: 'c71a185f-c8df-4ead-a522-d3a963a8359e'
slug: /c71a185f-c8df-4ead-a522-d3a963a8359e
title: 'BP_Enable_Deployment'
title_meta: 'BP_Enable_Deployment'
keywords: ['deployment','snapagent','blackpoint']
description: 'Custom field to select the target operating system for Blackpoint SnapAgent deployment.'
tags: ['windows','application','security']
draft: false
unlisted: false
last_update:
  date: 2026-08-25
---

## Summary

Custom field to select the target operating system for BlackPoint SnapAgent deployment.

## Details

| Name | Description | Level | Type | Option Type | Options | Help Text | Default Value | Editable |
|---|---|---|---|---|---|---|---|---|
| BP_Enable_Deployment | Custom field to select the target operating system for BlackPoint SnapAgent deployment. |  Company | Dropdown | String | `Disabled`,`Macintosh`, `All`, `Windows`,  `Win Workstations`,  `Win Workstations and Macintosh` | Select the operating systems on which BlackPoint should be deployed.<br />`All` : Deploys on both macintosh and windows servers and workstations machines.<br />`Windows` : Deploys on both windows servers and workstations.<br />`Win Workstations` : Select this to deploy on just windows workstations.<br />`Win Workstations and Macintosh` : Select this to deploy on windows workstations and Mac machines.<br />`Macintosh` : Select this to deploy on just Mac machines.<br />`Disabled` : Disables the deployment.| - | `Yes` |

## Dependencies

- [Solution - BlackPoint SnapAgent Deployment](/docs/b99808e9-5148-47f6-9da4-bc4eeb590f2a) 

## Completed Custom Field

![Image1](../../../static/img/docs/c71a185f-c8df-4ead-a522-d3a963a8359e/image1.webp)

## Changelog

### 2026-08-25

- Initial version of the document