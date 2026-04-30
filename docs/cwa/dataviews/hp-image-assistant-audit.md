---
id: 'fdad852c-49cf-4b8a-b638-0386989e3039'
slug: /fdad852c-49cf-4b8a-b638-0386989e3039
title: 'HP Image Assistant Audit'
title_meta: 'HP Image Assistant Audit'
keywords: ['hp', 'hpia', 'hp-image-assistant', 'image-assistant', 'drivers', 'firmware', 'driver-updates', 'bios']
description: 'Displays available HP update information gathered by the HP Image Assistant script from the table pvl_hpimageassistant_audit.'
tags: ['hp', 'firmware', 'bios', 'drivers']
draft: false
unlisted: false
last_update:
  date: 2026-04-30
---

## Summary

Displays available HP update information gathered by the [HP Image Assistant](/docs/8d551cc4-c4db-465a-a0df-2649e0eef711) script from the table [pvl_hpimageassistant_audit](/docs/d41f1905-bc6a-412f-9de9-88010c502010).

## Dependencies

- [Custom Table: pvl_hpimageassistant_audit](/docs/d41f1905-bc6a-412f-9de9-88010c502010)
- [Script: HP Image Assistant - Install + Command Handler [DV,Param,Autofix]](/docs/8d551cc4-c4db-465a-a0df-2649e0eef711)
- [Internal Monitor: HP Image Assistant Scan](/docs/6b7226dd-fab8-47f6-be79-72d6936e3875)
- [Solution: HP Image Assistant Handler](/docs/ddf20590-a18c-43f2-9e14-4ce2606187bc)

## Columns

| Column             | Explanation                                                                                                     |
|--------------------|-------------------------------------------------------------------------------------------------------------|
| Client             | The name of the client for this computer.                                                                    |
| Location           | The name of the location for this computer.                                                                  |
| Computer Name      | The name of the computer where the scan was performed.                                                       |
| Type               | The type of update available (e.g., 'Firmware', 'Software', 'Driver').                                      |
| Id                 | The HP SoftPaq ID associated with the update (e.g., 'sp151063').                                            |
| Name               | A human-readable description of the update.                                                                 |
| TargetVersion      | The currently installed version on the endpoint, or 'Not Installed' if absent.                              |
| ReferenceVersion   | The updated version available from HP.                                                                      |
| Comments           | The recommendation status from HP (e.g., 'HP update recommended').                                          |
| SSMCompliant       | Indicates System Software Manager compliance ('True' or 'False').                                           |
| DPBCompliant       | Indicates Driver Pack Builder compliance ('True' or 'False').                                               |
| Url                | The direct download URL for the update executable file.                                                     |
| ReleaseNotesUrl    | The URL to the HTML release notes for the update.                                                           |
| CvaUrl             | The URL to the CVA configuration file.                                                                      |
| ScriptRunTime      | The timestamp of when the script executed and populated this record.                                        |

## Changelog

### 2026-04-30

- Initial version of the document.
