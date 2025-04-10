---
id: '7fe38bc2-2ca2-444e-899b-15f41201ed06'
slug: /7fe38bc2-2ca2-444e-899b-15f41201ed06
title: 'Enable Recycle Bin'
title_meta: 'Enable Recycle Bin'
keywords: ['active-directory', 'recycle', 'bin', 'domain', 'controllers', 'monitor', 'script']
description: 'This document outlines the steps to enable the Active Directory Recycle Bin feature on Domain Controllers, including associated roles, scripts, and monitoring processes. It provides detailed implementation instructions and links to relevant resources.'
tags: ['active-directory']
draft: false
unlisted: false
---

## Purpose

The purpose of this solution is to enable the AD Recycle Bin on Domain Controllers. For more details, refer to the [Microsoft TechNet Article](https://techcommunity.microsoft.com/t5/ask-the-directory-services-team/the-ad-recycle-bin-understanding-implementing-best-practices-and/ba-p/396944).

**Note:** Once you enable the Active Directory Recycle Bin, you cannot turn it off.

## Associated Content

| Content                                                                 | Type            | Function                                                                                                           |
|-------------------------------------------------------------------------|-----------------|---------------------------------------------------------------------------------------------------------------------|
| [Role - AD Domain Recycle Bin Feature](/docs/01cb2977-8f3e-49fa-ad5b-62375c54a39c) | Role            | Detects if the Recycle Bin feature is enabled on the Infrastructure Master                                          |
| [AD Recycle Bin State Check](/docs/5041d497-ae6c-4209-a338-60f1da396106)   | Remote Monitor   | A remote PowerShell monitor that detects whether the AD Recycle Bin is enabled or disabled on the Windows Infrastructure Master |
| [AD - Enable AD Recycle Bin](/docs/e80d5873-304e-4b12-b52c-b608a7715a9f)    | Script          | This script enables the AD Recycle Bin                                                                              |
| △ Custom - Execute Script - AD - Enable AD Recycle Bin                | Alert Template   | Executes the script [AD - Enable AD Recycle Bin - V2](/docs/e80d5873-304e-4b12-b52c-b608a7715a9f) against the computers detected in the monitor set [AD Recycle Bin State Check](/docs/5041d497-ae6c-4209-a338-60f1da396106) |

## Implementation

1. Import the role [Role - AD Domain Recycle Bin Feature](/docs/01cb2977-8f3e-49fa-ad5b-62375c54a39c) using the second step of the same document.
   - The role will take some time to be detected.

2. Import the following script using the ProSync plugin:
   - [AD - Enable AD Recycle Bin](/docs/e80d5873-304e-4b12-b52c-b608a7715a9f)

3. Import the following Alert Templates using the ProSync plugin:
   - `△ Custom - Execute Script - AD - Enable AD Recycle Bin`

4. Reload the System Cache:
   - ![Reload System Cache](../../static/img/Enable-Recycle-Bin/image_1.png)

5. Import the [AD Recycle Bin State Check](/docs/5041d497-ae6c-4209-a338-60f1da396106) monitor following these steps:
   - Open a RAWSQL monitor.
   - Import the search "DC without Recycle Bin" using the third step in the [Import - Remote Monitor - AD Recycle Bin State Check](/docs/5041d497-ae6c-4209-a338-60f1da396106) document. Run the provided SQL in the RAWSQL monitor.
   - Verify that the search "DC without Recycle Bin" is created successfully.
   - Import the monitor [AD Recycle Bin State Check](/docs/5041d497-ae6c-4209-a338-60f1da396106) using the fourth step in the same document. Run the provided SQL in the RAWSQL monitor.
   - The [AD Recycle Bin State Check](/docs/5041d497-ae6c-4209-a338-60f1da396106) monitor will be automatically created in the "Domain Controllers" group, limited to the search "DC without Recycle Bin," and with the alert template `△ Custom - Execute Script - AD - Enable AD Recycle Bin`.
   - Ensure that the alert template is running the [AD - Enable AD Recycle Bin](/docs/e80d5873-304e-4b12-b52c-b608a7715a9f) script.


