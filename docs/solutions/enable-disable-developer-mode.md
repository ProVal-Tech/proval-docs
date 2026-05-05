---
id: 'b4452b00-9dfd-4ad8-b4fd-3ba7769ff674'
slug: /b4452b00-9dfd-4ad8-b4fd-3ba7769ff674
title: 'Enable/Disable Developer Mode'
title_meta: 'Enable/Disable Developer Mode'
keywords: ['developer', 'update', 'cf', 'status']
description: 'This solution retrives the developer mode status from the machine and updates the result into the custom field. It also contains a script that can enable or disable the developer mode on the machine.'
tags: ['auditing', 'update','windows']
draft: false
unlisted: false
last_update:
  date: 2026-05-01
---

## Purpose

This solution retrives the developer mode status from the machine and updates the result into the custom field. It also contains a script that can enable or disable the developer mode on the machine.

## Associated Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [Check Developer Mode Status - CF](/docs/101362d2-15fb-4f85-b344-08986e7e12f3)      | Agent Procedure | This script retrieves the developer mode status and store the result into the Custom field. |
| [cPVAL_Developer_Mode_Status](/docs/7eca9a7b-d09d-416d-8c04-3dab7776ba1b) | Custom Field | This custom field stores that Developer Mode status gathered by the script [Check Developer Mode Status - CF](/docs/101362d2-15fb-4f85-b344-08986e7e12f3) |
| [Enable/Disable Developer Mode](/docs/aa52a152-4cf2-4ed2-816b-88201816d69a) | Agent Procedure | This script enables the developer mode on the machine. |


## Implementation

1. Create the Custom Field: [cPVAL_Developer_Mode_Status](/docs/7eca9a7b-d09d-416d-8c04-3dab7776ba1b)

2. Import the below Agent Procedures:
    - [Check Developer Mode Status - CF](/docs/101362d2-15fb-4f85-b344-08986e7e12f3)
    - [Enable/Disable Developer Mode](/docs/aa52a152-4cf2-4ed2-816b-88201816d69a)


## Changelog

### 2026-05-01

- Initial version of the document