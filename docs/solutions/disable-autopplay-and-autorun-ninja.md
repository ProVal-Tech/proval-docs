---
id: '19b3d384-3d3d-42fc-80ab-1deef3f8af09'
slug: /19b3d384-3d3d-42fc-80ab-1deef3f8af09
title: 'Disable Autoplay and Autorun'
title_meta: 'Disable Autoplay and Autorun'
keywords: ['autorun', 'autoplay', 'registry']
description: 'This solution provides automation to disable AutoPlay and AutoRun on Windows systems (policy + user setting).'
tags: ['windows', 'registry']
draft: false
unlisted: false
last_update:
  date: 2026-10-06
---

## Purpose

This solution provides automation to disable AutoPlay and AutoRun on Windows systems (policy + user setting).

## Associated Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [Disable Autoplay and Autorun](/docs/df88e1bd-49d3-4a9d-892f-316b6915c1ce)     | Script | This script disables AutoPlay and AutoRun functionality on Windows systems at both system-level (HKLM) and user-level (HKCU). |
| [Disable Autoplay and Autorun - Server](/docs/f7c2c46c-5c85-4ce0-91b7-1bb0eb94bfb0)     | Compound Condition | This compound condition is used to trigger automation to disable autorun and autoplay on the Windows server of the organization where the custom field cpvalDisableAutoplayAndAutorun is checked. |
| [Disable Autoplay and Autorun - Workstation](/docs/8eec011a-c860-4b92-8561-92f69c2bc005)     | Compound Condition | This compound condition is used to trigger automation to disable autorun and autoplay on the Windows workstation of the organization where the custom field cpvalDisableAutoplayAndAutorun is checked. |
| [cPVAL Disable Autoplay and Autorun](/docs/65f466db-81df-47a5-93f2-6c60cf0713da)     | Custom field | Select this Custom Field to apply settings that disable AutoRun and AutoPlay policies across the client''s Windows devices. |
| [cPVAL Autoplay and Autorun Disabled](/docs/d16c8f3d-2948-4d26-a93e-a07b3194f1cd)     | Custom field | This custom field is checked by the automation script, where AutoPlay and Autorun are set to disabled for all users and the system. |

## Implementation

- Create the custom fields
- Create the script
- Create the compound conditions and enable them

## Changelog

### 2026-10-06

- Initial version of the document