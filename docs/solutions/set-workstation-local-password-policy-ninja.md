---
id: '72e89e20-3771-450a-a89a-b6e27d9c46b5'
slug: /72e89e20-3771-450a-a89a-b6e27d9c46b5
title: 'Set Workstation Local Password Policy'
title_meta: 'Set Workstation Local Password Policy'
keywords: ['password', 'policy', 'security']
description: 'This solution is built to set the workstation local password policy as per the custom fields value set.'
tags: ['security']
draft: false
unlisted: false
last_update:
  date: 2026-10-07
---

## Purpose

This solution is built to set the workstation local password policy as per the custom fields value set.

## Associated Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [cPVAL Enable Maximum Local Password Age](/docs/664bcbf8-0a8e-4600-bd1d-4d626e98d001)      | Custom Field | Check this box to activate the maximum password age policy for local users. |
| [cPVAL Enable Minimum Local Password Length](/docs/eae5d758-f37e-4bbf-a9ae-6a8eec298874)      | Custom Field | Check this box to activate the minimum password length policy for local users. |
| [cPVAL Enforce Local Password Complexity](/docs/de18273e-a442-4663-9f15-fc46b95e8b20)      | Custom Field | Check this box to activate the password complexity policy for local users. |
| [cPVAL Minimum Password Length](/docs/4623eb24-8020-4005-a22d-d5ad390aae7d)      | Custom Field | Provide the minimum length for the local password length policy. The valid range is between 8 and 14. |
| [cPVAL Maximum Password Age](/docs/e7cde311-2a18-4737-9632-d60766ecd9d4)      | Custom Field | Provide the maximum age in days for the maximum local password age policy. The valid range is between 4 and 360. |
| [Set Workstation Local Password Policy](/docs/d7b077e1-7bdb-4753-8ae0-7560e7f13c87)      | Script | Sets the local password policy for the Windows machine. |
| [cPVAL Set Workstation Local Password Policy](/docs/f370ea9c-240d-495a-a740-7a70690f1632)      | Group | This group contains agents that have local password policy enabled using the custom fields at the org level. |
| [Set Workstation Local Password Policy](/docs/83beb3ee-345f-4726-8ed8-68944cec2b7f) | Task | This task is built to set the workstation local password policy. |

## Implementation

 1. Create the following custom fields:
    - [cPVAL Enable Maximum Local Password Age](/docs/664bcbf8-0a8e-4600-bd1d-4d626e98d001)
    - [cPVAL Enable Minimum Local Password Length](/docs/eae5d758-f37e-4bbf-a9ae-6a8eec298874)
    - [cPVAL Enforce Local Password Complexity](/docs/de18273e-a442-4663-9f15-fc46b95e8b20)
    - [cPVAL Minimum Password Length](/docs/4623eb24-8020-4005-a22d-d5ad390aae7d)
    - [cPVAL Maximum Password Age](/docs/e7cde311-2a18-4737-9632-d60766ecd9d4)
 2. Create the Automation: [Set Workstation Local Password Policy](/docs/d7b077e1-7bdb-4753-8ae0-7560e7f13c87)
 3. Create the group: [cPVAL Set Workstation Local Password Policy](/docs/f370ea9c-240d-495a-a740-7a70690f1632)
 4. Create the task: [Set Workstation Local Password Policy](/docs/83beb3ee-345f-4726-8ed8-68944cec2b7f)
 5. Enable the custom fields and set the minimum and maximum value as suggested by the client at the organization level.
 6. Enable the task [Set Workstation Local Password Policy](/docs/83beb3ee-345f-4726-8ed8-68944cec2b7f) for the automation to run weekly every Monday at 11:00 AM.


## Changelog

### 2026-10-07

- Initial version of the document