---
id: '6e3a2154-42ba-471c-8cd5-379e95b3732f'
slug: /6e3a2154-42ba-471c-8cd5-379e95b3732f
title: 'SecureBoot 2026 Compliance Check'
title_meta: 'SecureBoot 2026 Compliance Check'
keywords: ['certificates','compliance','secureboot']
description: ''This script evaluates whether a Windows device is prepared for the upcoming Microsoft Secure Boot certificate transition scheduled for 2026. Microsoft is replacing legacy Secure Boot certificates with updated 2023-era certificates (KEK and DB). Devices that do not contain these updated certificates may be considered at risk once older certificates expire.'
tags: ['auditing','certificates','secureboot']
draft: false
unlisted: false
last_update:
  date: 2026-04-08
---

## Summary

This script evaluates whether a Windows device is prepared for the upcoming Microsoft Secure Boot certificate transition scheduled for 2026. Microsoft is replacing legacy Secure Boot certificates with updated 2023-era certificates (KEK and DB). Devices that do not contain these updated certificates may be considered at risk once older certificates expire.

The script performs the following checks:

- Verifies that Secure Boot is enabled.
- Checks for presence of:
  - Microsoft Corporation KEK 2K CA 2023
  - Windows UEFI CA 2023 (DB certificate)
- Determines overall readiness status:
  - Ready  → Secure Boot enabled + both 2023 certificates present
  - Risk   → Secure Boot enabled but 2023 certificates missing
  - N/A    → Secure Boot disabled or not supported
- Outputs a compact compliance string.
- Optionally writes the result to a VSA RMM Custom field.


## Implementation

1. Download the Agent procedure `SecureBoot 2026 Compliance Check` from the attachments with PS1.

2. After downloading the attached files, click on the `Import` button
3. Select the Agent procedure just downloaded and add it to the Datto RMM interface.  
![Image 1](../../../static/img/docs/48d5dd1c-37ef-4e43-87b8-b10fa565fef4/import.webp) 
4. Import the PS1 under the manage file.

## Sample Run




## Dependencies

Custom field

## Variables

| Variable Name | Type 
| ------------- | ---- 
| cPVAL SecureBoot Check | String |

## Output

Agent Procedure History Log

![Image 3](../../../static/img/docs/48d5dd1c-37ef-4e43-87b8-b10fa565fef4/udf-output.webp)

Custom Field

![Image 3](../../../static/img/docs/48d5dd1c-37ef-4e43-87b8-b10fa565fef4/udf-update.webp)

## Changelog

### 2026-04-08

- Initial version of the document