---
id: '087d044f-a130-4650-ba45-eaf144d45b65'
slug: /087d044f-a130-4650-ba45-eaf144d45b65
title: 'AutoElevate Deployment'
title_meta: 'AutoElevate Deployment'
keywords: ['agent','windows','security']
description: 'Controls whether the AutoElevate deployment process should run on the selected devices.'
tags:  ['security','application','custom-fields']
draft: false
unlisted: false
last_update:
  date: 2026-08-10
---

## Summary
Controls whether the AutoElevate deployment process should run on the selected devices.

## Details

| Name | Description | Level | Type | Option Type | Options | Help Text | Default Value | Editable |
|---|---|---|---|---|---|---|---|---|
| AutoElevate Deployment | Custom Field to exclude Endpoint from AutoElevate Deployment. |  Company | Dropdown | String | `Disabled`,`Macintosh`, `All`, `Windows`,  `Win Workstations`,  `Win Workstations and Macintosh` | Select the operating systems on which AutoElevate should be deployed.<br />`All` : Deploys on both macintosh and windows servers and workstations machines.<br />`Windows` : Deploys on both windows servers and workstations.<br />`Win Workstations` : Select this to deploy on just windows workstations.<br />`Win Workstations and Macintosh` : Select this to deploy on windows workstations and Mac machines.<br />`Macintosh` : Select this to deploy on just Mac machines. | - | `Yes` |

## Dependencies

- [Solution : AutoElevate Deployment](/docs/4a95cdd5-dec1-4d8e-aa3a-0ee4dd7c0273)

## Completed Custom Field

![Image1](../../../static/img/docs/087d044f-a130-4650-ba45-eaf144d45b65/image1.webp)

## Changelog

### 2026-08-10

- Initial version of the document
