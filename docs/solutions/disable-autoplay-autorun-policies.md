---
id: '4bfb0532-45a1-41b8-8e69-d552bae1d12d'
slug: /4bfb0532-45a1-41b8-8e69-d552bae1d12d
title: 'Disable Autorun/Autoplay policies'
title_meta: 'Disable Autorun/Autoplay policies'
keywords: ['security', 'automation','permissions']
description: 'This script disables AutoPlay and AutoRun functionality at both system-level (HKLM) and user-level (HKCU) registry locations.'
tags: ['permissions', 'security']
draft: false
unlisted: false
last_update:
  date: 2026-06-25
---

## Purpose

This purpose of this solution is to disable AutoPlay and AutoRun functionality at both system-level (HKLM) and user-level (HKCU) registry locations. It configures the following policies:
    
- NoDriveTypeAutoRun: Set to 255 (0xFF) to disable AutoPlay for all drive types (USB drives, optical drives, etc.)
- NoAutoplayfornonVolume: Set to 1 to disable AutoPlay for non-volume devices
    
These policies prevent automatic execution of files and programs when devices are connected, enhancing system security by reducing the attack surface for malware distribution and unauthorized code execution.

## Associated Content

| Content                 | Type              | Function                |
|----------------------|-----------------------------|--------------------|
| [Disable AutoPlay AutoRun Policy](/docs/6edf4c00-78eb-4b46-8d5b-a69468c7cb7b) | Custom Field | Custom Field to enable the solution. Selecting `Enable` will apply settings that disable AutoRun and AutoPlay policies across the client's Windows devices. |
| [Exclude AutoPlay AutoRun Disable](/docs/e23af607-09ff-44f8-887c-277aff979040) | Custom Field | Custom field to exclude the Site/Endpoint from AutoPlay/AutoRun disablement. |
| [AutoPlay AutoRun Policies](/docs/75523b4a-95a9-4884-a9ca-3e197aa0fc82) | Custom Field | This custom field is updated by the [Disable Autorun/Autoplay Policy](/docs/6399c6ed-3a31-4d9e-97ce-9ca50780bb92) after it successfully disables AutoRun/AutoPlay policies on Windows machines. |
| [Disable AutoPlay AutoRun Policy](/docs/4b9dbdd3-f4f4-4f3e-bc09-51aaa16000c9) | Group | This contains Windows machines where the AutoPlay/AutoRun policy is set to be disabled. |
| [Disable Autorun/Autoplay Policy](/docs/6399c6ed-3a31-4d9e-97ce-9ca50780bb92) | Task | Disables AutoPlay and AutoRun functionality at both system-level (HKLM) and user-level (HKCU) registry locations. |

## Implementation

- Create the below custom fields as per instructions provided in the documents.
  - [Disable AutoPlay AutoRun Policy](/docs/6edf4c00-78eb-4b46-8d5b-a69468c7cb7b) 
  - [Exclude AutoPlay AutoRun Disable](/docs/e23af607-09ff-44f8-887c-277aff979040)
  - [AutoPlay AutoRun Policies](/docs/75523b4a-95a9-4884-a9ca-3e197aa0fc82)
- Create the group [Disable AutoPlay AutoRun Policy](/docs/4b9dbdd3-f4f4-4f3e-bc09-51aaa16000c9)
- Create the task [Disable Autorun/Autoplay Policy](/docs/6399c6ed-3a31-4d9e-97ce-9ca50780bb92)
- Schedule the task [Disable Autorun/Autoplay Policy](/docs/6399c6ed-3a31-4d9e-97ce-9ca50780bb92) to target the group [Disable AutoPlay AutoRun Policy](/docs/4b9dbdd3-f4f4-4f3e-bc09-51aaa16000c9) to start disabling the policies.

## Changelog

### 2026-06-25

- Initial version of the document