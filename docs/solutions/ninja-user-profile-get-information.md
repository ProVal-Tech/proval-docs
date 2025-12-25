---
id: '04dfa2f0-b1e0-4860-b7be-39b841a7e492'
slug: /04dfa2f0-b1e0-4860-b7be-39b841a7e492
title: 'User Profile - Get Information'
title_meta: 'User Profile - Get Information'
keywords: ['user', 'profiles', 'data', 'gather', 'information']
description: 'The purpose of this solution is to gather information about user profiles.'
tags: ['report', 'security', 'windows']
draft: false
unlisted: false
---

## Purpose

The purpose of this solution is to gather information about user profiles.

*Note:* This solution is not supported on Windows Domain Controllers or deprecated versions of Windows.

## Associated Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [cPVAL User Profile Audit](/docs/4cf9ccc6-03f1-454e-9032-3f25909db6a4) | Custom Field | Use this field to specify which operating system should receive User Profile Audit automatically. | 
| [cPVAL User Profile Details](/docs/8e0adb65-9df6-4bbf-a1d9-4a32650776aa) | Custom Field | Stores an HTML-formatted information of User Profiles. Data is populated via the "User Profile - Audit" automation script| 
| [User Profile - Audit](/docs/97da597d-fd40-40f3-994c-d1f302ac884d) | Script | This script gathers information about user profiles and stores it in the Custom Field.| 
| [Execute User Profile Audit Script](/docs/ba234ea4-03a5-4b1b-b937-220489f508cd) | Compound Condition | Executes User Profile Audit Script on windows Servers opted for Audit.| 
| [Execute User Profile Audit Script](/docs/fc9da1ee-8f02-4307-8928-649bed3c0a36) | Compound Condition | Executes User Profile Audit Script on windows Workstations opted for Audit.| 
| [Group - cPVAL User Profile Audit](/docs/af02cf09-0dd5-4ae8-9f6b-8d074cccd747) | Group | This includes machines which are opted for User Profile Audit excluding the domain controllers.| 


## Implementation

- Create the [Custom Field - cPVAL User Profile Audit](/docs/4cf9ccc6-03f1-454e-9032-3f25909db6a4) using the implementation instruction provided in the document.
- Create the  [Custom Field - cPVAL User Profile Details](/docs/8e0adb65-9df6-4bbf-a1d9-4a32650776aa) using the implementation instruction provided in the document.
- Create the [Automations - User Profile - Audit](/docs/97da597d-fd40-40f3-994c-d1f302ac884d) using the implementation instruction provided in the document.
- Create the [Compound Condition - Execute User Profile Audit Script](/docs/ba234ea4-03a5-4b1b-b937-220489f508cd) for Servers using the implementation instruction provided in the document.
- Create the [Compound Condition - Execute User Profile Audit Script](/docs/fc9da1ee-8f02-4307-8928-649bed3c0a36) for Workstations using the implementation instruction provided in the document.
- Create the [Group - cPVAL User Profile Audit](/docs/af02cf09-0dd5-4ae8-9f6b-8d074cccd747) using the implementation instruction provided in the document.
