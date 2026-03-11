---
id: '0ebb7e89-d2d8-40d4-ba1e-330ab20f86cd'
slug: /0ebb7e89-d2d8-40d4-ba1e-330ab20f86cd
title: 'Windows User Profiles'
title_meta: 'Windows User Profiles'
keywords: ['user', 'profiles', 'data', 'gather', 'information']
description: 'This is RMM version of the Get User Profiles script. It gathers information about user profiles and stores the data in the custom field.'
tags: ['report', 'security', 'windows']
draft: False
unlisted: false
last_update:
  date: 2026-03-11
---

## Purpose

Gathers and displays information about Windows user profiles. This solution is for CW RMM platform.

## Associated Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [Custom Field - User Profiles](/docs/e390856a-cc1c-4dde-93e4-f714f2d08258) | Custom Field | Lists the user Profiles on windows machines. |
| [Task - User Profile - Get Information](/docs/aeb4ccec-bf76-436d-8b0c-cd3ec3d39131) | Task |  Gathers information about user profiles and stores the data in the custom field. |
| [Group - Windows Machines (Non‑DC)](/docs/aa76fac8-dac7-44d9-897d-d0f6f15609dc) | Group |  This group contains online windows machines excluding Domain Controllers. |

## Implementation

- Create [Custom Field - User Profiles](/docs/e390856a-cc1c-4dde-93e4-f714f2d08258)  as per instructions in the document.
- Create [Task - User Profile - Get Information](/docs/aeb4ccec-bf76-436d-8b0c-cd3ec3d39131)  as per instructions in the document.
- Create [Group - Windows Machines (Non‑DC)](/docs/aa76fac8-dac7-44d9-897d-d0f6f15609dc)  as per instructions in the document.


## Changelog

### 2026-03-11

- Initial version of the document