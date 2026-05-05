---
id: 'd41f1905-bc6a-412f-9de9-88010c502010'
slug: /d41f1905-bc6a-412f-9de9-88010c502010
title: 'pvl_hpimageassistant_audit'
title_meta: 'pvl_hpimageassistant_audit'
keywords: ['hp', 'hpia', 'hp-image-assistant', 'image-assistant', 'drivers', 'firmware', 'driver-updates', 'bios']
description: 'This table stores the available update data retrieved during the HP Image Assistant scanning process.'
tags: ['hp', 'firmware', 'bios', 'drivers']
draft: false
unlisted: false
last_update:
  date: 2026-04-30
---

## Summary

This table stores the available update data retrieved during the HP Image Assistant scanning process.

## Dependencies

- [Script: HP Image Assistant - Install + Command Handler [DV,Param,Autofix]](/docs/8d551cc4-c4db-465a-a0df-2649e0eef711)
- [Script: OverFlowedVariable - SQL Insert - Execute](/docs/34cee8fe-1b6b-4558-a890-2face427ceb8)
- [Solution: HP Image Assistant Handler](/docs/ddf20590-a18c-43f2-9e14-4ce2606187bc)

## Tables

### pvl_hpimageassistant_audit

| Column           | Type     | Explanation                                                                 |
|------------------|----------|-----------------------------------------------------------------------------|
| ComputerId       | INT      | The Automate Computer ID of the agent.                                      |
| Type             | VARCHAR  | The type of update (e.g., 'Firmware', 'Software').                          |
| Id               | VARCHAR  | The HP SoftPaq ID associated with the update (e.g., 'sp151063').            |
| Name             | VARCHAR  | A human-readable description of the update.                                 |
| TargetVersion    | VARCHAR  | The currently installed version on the endpoint, or 'Not Installed' if absent. |
| ReferenceVersion | VARCHAR  | The updated version available from HP.                                      |
| Comments         | VARCHAR  | The recommendation status from HP (e.g., 'HP update recommended').          |
| SSMCompliant     | VARCHAR  | Indicates System Software Manager compliance ('True' or 'False').           |
| DPBCompliant     | VARCHAR  | Indicates Driver Pack Builder compliance ('True' or 'False').               |
| Url              | VARCHAR  | The direct download URL for the update executable file.                     |
| ReleaseNotesUrl  | VARCHAR  | The URL to the HTML release notes for the update.                           |
| CvaUrl           | VARCHAR  | The URL to the CVA configuration file.                                      |
| ScriptRunTime    | DATETIME | The timestamp of when the script executed and populated this record.        |

## Changelog

### 2026-04-30

- Initial version of the document.
