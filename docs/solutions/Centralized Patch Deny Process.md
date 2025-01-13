---
id: 'cwa-deny-patches-default-policy'
title: 'Deny Patches in Default Approval Policy'
title_meta: 'Deny Patches in Default Approval Policy'
keywords: ['deny', 'patches', 'approval', 'policy', 'automate']
description: 'This document outlines the process for denying patches in the default approval policy using scripts and dataviews from ProVal. It includes associated content, implementation steps, and FAQs to assist users in managing denied patches effectively.'
tags: ['configuration', 'security', 'installation', 'update', 'database']
draft: false
unlisted: false
---
## Purpose

To deny the patches in the default approval policy from [Denied Patches](https://proval.itglue.com/5078775/assets/236189-denied-patches/records). This information can be viewed from [ProVal's Denied Patches](https://proval.itglue.com/DOC-5078775-9563172) dataview.

## Associated Content

| Content                                                                                                       | Type   | Function                                                                                                                                                                                                                                                                                                                                                       |
|---------------------------------------------------------------------------------------------------------------|--------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [Fetch Denied Patch List From Centralized ITGLue KBIDs - Flexible Asset](https://proval.itglue.com/DOC-5078775-9563113) | Script | This is the primary script that'll save the [Denied Patches](https://proval.itglue.com/5078775/assets/236189-denied-patches/records) to the [DeniedPatchReplace.sql](https://file.provaltech.com/repo/config/DeniedPatchReplace.sql) file on PVL-EUR-FILE-01. This script must not be altered or ran against another computer. |
| [Deny Patches in Default Policy From Centralized ITGLue KBIDs - Flexible Asset](https://proval.itglue.com/5078775/docs/9563142) | Script | This script has to be imported to the partner's Automate and have to be scheduled to run in sync of the [Fetch Denied Patch List From Centralized ITGLue KBIDs - Flexible Asset](https://proval.itglue.com/DOC-5078775-9563113) script either against the Automate server or a local server. It's responsible for denying those patches. Also, it stores the patches in [plugin_proval_denied_patches](https://proval.itglue.com/DOC-5078775-9563176) table. |
| [Deny Patches in Default Policy From Centralized ITGLue KBIDs - Function](https://proval.itglue.com/5078775/docs/9564856) | Script | This script is called by the [Deny Patches in Default Policy From Centralized ITGLue KBIDs - Flexible Asset](https://proval.itglue.com/5078775/docs/9563142) script to deny the patches for the default patching policy.                                                                                                                                            |
| [plugin_proval_denied_patches](https://proval.itglue.com/DOC-5078775-9563176)                               | Custom Table | This table stores the information of the patches to deny or whatever in [Denied Patches](https://proval.itglue.com/5078775/assets/236189-denied-patches/records) flexible asset.                                                                                                                                                                         |
| [ProVal's Denied Patches](https://proval.itglue.com/DOC-5078775-9563172)                                   | Dataview | A dataview to let the partner's know of the patches denied by ProVal.                                                                                                                                                                                                                                                                                           |

## Implementation

Step 1: Import the [Deny Patches in Default Policy From Centralized ITGLue KBIDs - Flexible Asset](https://proval.itglue.com/5078775/docs/9563142) script.  
Step 2: Import the [Deny Patches in Default Policy From Centralized ITGLue KBIDs - Function](https://proval.itglue.com/5078775/docs/9564856) script.  
Step 3: Import the [ProVal's Denied Patches](https://proval.itglue.com/DOC-5078775-9563172) dataview.  
Step 4: Schedule the [Deny Patches in Default Policy From Centralized ITGLue KBIDs - Flexible Asset](https://proval.itglue.com/5078775/docs/9563142) script to run twice per day at 2:10 AM and 2:10 PM against the Automate server or a local server.  

Note: I have mentioned this time here because the [Fetch Denied Patch List From Centralized ITGLue KBIDs - Flexible Asset](https://proval.itglue.com/DOC-5078775-9563113) script is scheduled to run at 2:00 AM and 2:00 PM daily against PVL-EUR-FILE-01. 

## FAQ

**Q:** Is there a way to not deny the patches but to get data in [ProVal's Denied Patches](https://proval.itglue.com/DOC-5078775-9563172) dataview?  
**A:** No.

**Q:** Can we exclude a patch from denial?  
**A:** No.

**Q:** Is this going to deny the specific KBID for all operating systems?  
**A:** Yes.

**Q:** Can we exclude an OS for a KB? eg, deny a KBID for Windows 10 version 1809 but let it be approved for Windows Server 2019.  
**A:** No.


