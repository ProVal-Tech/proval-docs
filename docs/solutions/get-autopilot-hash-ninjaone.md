---
id: 'd5b749b5-eda4-43d2-8679-eb88f51a3527'
slug: /d5b749b5-eda4-43d2-8679-eb88f51a3527
title: 'Get - AutoPilot Hash - NinjaOne'
title_meta: 'Get - AutoPilot Hash - NinjaOne'
keywords: ['autopilot','hash','hardware']
description: 'The purpose of the soultion to update the check and update the Autopilot Hash into the Custom filed.'
tags: ['autopilot','auditing','custom-fields']
draft: false
unlisted: false
---

## Purpose

The purpose of the soultion to check and update the Autopilot Hash into a custom field.

## Associated Content

#### Custom Fields

| Content | Type | Function |
|---------|------|----------|
| [cPVAL AutoPilot Hash](/docs/8d3fbb67-9f18-426e-b08d-c010d655a94a) | `Custom Field` | This field stores the Windows Autopilot hardware hash value. |

#### Device Group

| Content                                                                                          | Type      | Description                                                                                                 |
|--------------------------------------------------------------------------------------------------|-----------|-------------------------------------------------------------------------------------------------------------|
| [ cPVAL Autopilot Hash - Not Updated](/docs/40f1253f-42d4-49ac-adad-26b940cd11b8) | `Group`   | This Group shows machines where custom field [cPVAL AutoPilot Hash](/docs/8d3fbb67-9f18-426e-b08d-c010d655a94a) is not updated.                                      |

#### Automation

| Content                                                                                          | Type          | Description                                                                                                 |
|--------------------------------------------------------------------------------------------------|---------------|-------------------------------------------------------------------------------------------------------------|
| [Get - AutoPilot Hash](/docs/d91bf7d6-5279-429d-b304-4876132453a5)     | `Script` | This script fetches the device Autopilot Hardware Hash using CIM/WMI from the MDM namespace. Once retrieved, it validates the hash format and updates the [cPVAL AutoPilot Hash](/docs/8d3fbb67-9f18-426e-b08d-c010d655a94a) custom field with the value. Must be run with Administrator privileges.                                           |

#### Task

| Content                                                                                          | Type          | Description                                                                                                 |
|--------------------------------------------------------------------------------------------------|---------------|-------------------------------------|
| [Check Autopilot Hash](/docs/9a07b71d-98ae-4352-ae78-b568ab72b052)    | `Task` | This task is used to run the script to update the Autopilot hash under the Custom Filed.    |

## Implementation

1. Create the following custom fields:
   - [Custom Field - cPVAL AutoPilot Hash](/docs/8d3fbb67-9f18-426e-b08d-c010d655a94a)
   
2. Create the following device group:
   - [Group - cPVAL Autopilot Hash - Not Updated](/docs/40f1253f-42d4-49ac-adad-26b940cd11b8)

3. Create the Automation:
   - [Automation - Get - AutoPilot Hash](/docs/d91bf7d6-5279-429d-b304-4876132453a5)

4. Create the Task:
   - [Task - Check Autopilot Hash](/docs/9a07b71d-98ae-4352-ae78-b568ab72b052)
