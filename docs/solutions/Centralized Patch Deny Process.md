---
id: 'bfef669b-5475-4293-b6e8-77c8f20b3d5f'
slug: /bfef669b-5475-4293-b6e8-77c8f20b3d5f
title: 'Centralized Patch Deny Process'
title_meta: 'Centralized Patch Deny Process'
keywords: ['deny', 'patches', 'approval', 'policy', 'automate']
description: 'This document outlines the process for denying patches in the default approval policy using scripts and dataviews from ProVal. It includes associated content, implementation steps, and FAQs to assist users in managing denied patches effectively.'
tags: ['database', 'installation', 'security', 'update']
draft: false
unlisted: false
---

## Purpose

The purpose of this document is to outline the process for denying patches in the default approval policy from [Denied Patches](https://proval.itglue.com/5078775/assets/236189-denied-patches/records). This information can be viewed from [ProVal's Denied Patches](/docs/4f7c1abe-2d4b-4ad3-81a7-48e3111015ac) dataview.

## Associated Content

| Content                                                                                                       | Type         | Function                                                                                                                                                                                                                                                                                                                                                       |
|---------------------------------------------------------------------------------------------------------------|--------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [Fetch Denied Patch List From Centralized ITGLue KBIDs - Flexible Asset](/docs/f8e944d6-28ce-4be8-bf38-6907221544a7) | Script       | This is the primary script that saves the [Denied Patches](https://proval.itglue.com/5078775/assets/236189-denied-patches/records) to the [DeniedPatchReplace.sql](https://file.provaltech.com/repo/config/DeniedPatchReplace.sql) file on PVL-EUR-FILE-01. This script must not be altered or run against another computer. |
| [Deny Patches in Default Policy From Centralized ITGLue KBIDs - Flexible Asset](/docs/3e12ac9e-d141-4011-8ae3-bd0cebe53fc6) | Script       | This script must be imported into the partner's Automate and scheduled to run in sync with the [Fetch Denied Patch List From Centralized ITGLue KBIDs - Flexible Asset](/docs/f8e944d6-28ce-4be8-bf38-6907221544a7) script either against the Automate server or a local server. It's responsible for denying those patches and storing them in the [plugin_proval_denied_patches](/docs/9ee3657f-dff8-4599-a4c3-68ca3ba171f4) table. |
| [Deny Patches in Default Policy From Centralized ITGLue KBIDs - Function](https://proval.itglue.com/5078775/docs/9564856) | Script       | This script is called by the [Deny Patches in Default Policy From Centralized ITGLue KBIDs - Flexible Asset](/docs/3e12ac9e-d141-4011-8ae3-bd0cebe53fc6) script to deny the patches for the default patching policy.                                                                                                                                       |
| [plugin_proval_denied_patches](/docs/9ee3657f-dff8-4599-a4c3-68ca3ba171f4)                               | Custom Table | This table stores information about the patches to deny or any other data in the [Denied Patches](https://proval.itglue.com/5078775/assets/236189-denied-patches/records) flexible asset.                                                                                                                                                                         |
| [ProVal's Denied Patches](/docs/4f7c1abe-2d4b-4ad3-81a7-48e3111015ac)                                   | Dataview     | A dataview that informs partners about the patches denied by ProVal.                                                                                                                                                                                                                                                                                           |

## Implementation

1. Import the [Deny Patches in Default Policy From Centralized ITGLue KBIDs - Flexible Asset](/docs/3e12ac9e-d141-4011-8ae3-bd0cebe53fc6) script.
2. Import the [Deny Patches in Default Policy From Centralized ITGLue KBIDs - Function](https://proval.itglue.com/5078775/docs/9564856) script.
3. Import the [ProVal's Denied Patches](/docs/4f7c1abe-2d4b-4ad3-81a7-48e3111015ac) dataview.
4. Schedule the [Deny Patches in Default Policy From Centralized ITGLue KBIDs - Flexible Asset](/docs/3e12ac9e-d141-4011-8ae3-bd0cebe53fc6) script to run twice per day at 2:10 AM and 2:10 PM against the Automate server or a local server.

**Note:** The times mentioned here are based on the [Fetch Denied Patch List From Centralized ITGLue KBIDs - Flexible Asset](/docs/f8e944d6-28ce-4be8-bf38-6907221544a7) script, which is scheduled to run at 2:00 AM and 2:00 PM daily against PVL-EUR-FILE-01.

## FAQ

**Q:** Is there a way to not deny the patches but to get data in [ProVal's Denied Patches](/docs/4f7c1abe-2d4b-4ad3-81a7-48e3111015ac) dataview?  
**A:** No.

**Q:** Can we exclude a patch from denial?  
**A:** No.

**Q:** Is this going to deny the specific KBID for all operating systems?  
**A:** Yes.

**Q:** Can we exclude an OS for a KB? For example, deny a KBID for Windows 10 version 1809 but allow it to be approved for Windows Server 2019.  
**A:** No.


