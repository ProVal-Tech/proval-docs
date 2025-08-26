---
id: 'c79a87be-f5ed-44f8-ac22-2a4bb37d3ef2'
slug: /c79a87be-f5ed-44f8-ac22-2a4bb37d3ef2
title: 'Windows 11 Compatibility Validation'
title_meta: 'Windows 11 Compatibility Validation'
keywords: ['windows', 'compatibility', 'validation', 'upgrade', 'task']
description: 'This document provides a comprehensive guide to verify if a Windows 10 PC is compatible with Windows 11, including sample runs, dependencies, task creation steps, and deployment instructions.'
tags: ['windows']
draft: false
unlisted: false
---

## Purpose
This solution provides a comprehensive guide to verify if a Windows 10/11 PC is compatible with Windows 11, including sample runs, dependencies, task creation steps, and deployment instructions.

## Associated Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [Windows 11 machines](/docs/a3cdc948-d650-413e-8c02-3b549403f88f)      | Dynamic Group | This document provides a comprehensive guide to verify if a Windows 11 PC is compatible with Windows 11, including sample runs, dependencies, task creation steps, and deployment instructions.
 | [Windows 10 machines](/docs/8d5c2d6a-5bb8-4720-bd11-4fa7396fbf7a) | Dynamic Group| This document provides a comprehensive guide to verify if a Windows 10 PC is compatible with Windows 11, including sample runs, dependencies, task creation steps, and deployment instructions.
| [Windows 11 Compatible machines](/docs/9bfa70b2-a410-45d7-a8cc-a75c8e90c6f5) | Dynamic Group| This document outlines the steps to create a dynamic group in ConnectWise RMM for identifying Windows 10/11 computers that are compatible with the Windows 11 upgrade. It includes detailed instructions and screenshots for each step of the process
| [Windows 11 incompatible machines](/docs/6b52f66a-4b64-4d36-9f9f-74379510cf68)      | Dynamic Group | This document provides a step-by-step guide on how to create a dynamic group in ConnectWise RMM for Windows 10/11 computers that are not compatible with Windows 11. It includes instructions on setting up custom fields and criteria to accurately identify incompatible machines.
 | [Windows 11 Compatible](/docs/99719e54-ce8f-4b76-93f4-cc832a3b88cf) | Endpoint Custom Field | This document provides a summary and detailed information about the Windows 11 compatibility check, indicating whether a computer meets the necessary requirements for installing Windows 11. It includes a table of fields, their types, options, and default values, along with relevant screenshots for visual reference.
| [Windows 11 Compatibility Validation](/docs/676de0c3-b6a2-4a82-bf87-6d00395a7dff) | Task | This document provides a comprehensive guide to verify if a Windows 10/11 PC is compatible with Windows 11, including sample runs, dependencies, task creation steps, and deployment instructions.
|

## Implementation

Please follow the [Windows 11 Compatibility Validation](/docs/676de0c3-b6a2-4a82-bf87-6d00395a7dff) implementation instruction on how to schedule it on the group [Windows 11 machines](/docs/a3cdc948-d650-413e-8c02-3b549403f88f) and [Windows 10 machines](/docs/8d5c2d6a-5bb8-4720-bd11-4fa7396fbf7a) 

## FAQ

- Does it is required to run this on the Windows 11 machines too?
- I couldn't find anything concrete that 100% validates that devices will not go to 24H2 if they are not compatible. However, everything always pointed back to checking the system requirements. So I think that might confirmation enough for us to say that Microsoft will not allow machines to 24H2 unless they are compatible.

I do believe that this could be skirted if you installed the ISO locally. But that is not something we can do, obviously.

Hence, auditing on Windows 11 will also help to find issued Windows 11 machines that gets corrupted or had issues in further upgrades if forcefully updated to 11.