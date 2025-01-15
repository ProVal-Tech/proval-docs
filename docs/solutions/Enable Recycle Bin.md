---
id: '7fe38bc2-2ca2-444e-899b-15f41201ed06'
title: 'Enable AD Recycle Bin on Domain Controllers'
title_meta: 'Enable AD Recycle Bin on Domain Controllers'
keywords: ['active-directory', 'recycle', 'bin', 'domain', 'controllers', 'monitor', 'script']
description: 'This document outlines the steps to enable the Active Directory Recycle Bin feature on Domain Controllers, including associated roles, scripts, and monitoring processes. It provides detailed implementation instructions and links to relevant resources.'
tags: ['active-directory', 'monitor', 'script', 'configuration']
draft: false
unlisted: false
---
## Purpose

The purpose of this solution is to enable the AD Recycle Bin on Domain controllers [Microsoft TechNet Article](https://techcommunity.microsoft.com/t5/ask-the-directory-services-team/the-ad-recycle-bin-understanding-implementing-best-practices-and/ba-p/396944).

Note: Once you enable the Active Directory Recycle Bin you cannot turn it off.

## Associated Content

| Content                                                                 | Type         | Function                                                                                                           |
|-------------------------------------------------------------------------|--------------|---------------------------------------------------------------------------------------------------------------------|
| [Role - AD Domain Recycle Bin Feature](https://proval.itglue.com/DOC-5078775-8012918) | Role         | It Detects if the Recycle bin feature is enabled on Infrastructure master                                          |
| [AD Recycle Bin State Check](https://proval.itglue.com/DOC-5078775-7815146)   | Remote Monitor | This is a remote PowerShell monitor that detects whether the AD Recycle Bin is enabled or disabled on Windows Infrastructure master |
| [AD - Enable AD Recycle Bin](https://proval.itglue.com/DOC-5078775-7937042)    | Script       | This script enables the AD Recycle Bin                                                                              |
| △ Custom - Execute Script - AD - Enable AD Recycle Bin                | Alert Template | Executes the script [AD - Enable AD Recycle Bin - V2](https://proval.itglue.com/DOC-5078775-7937042) against the computers detected in the monitor set [AD Recycle Bin State Check](https://proval.itglue.com/DOC-5078775-7815146) |

## Implementation

1. Import the role [Role - AD Domain Recycle Bin Feature](https://proval.itglue.com/DOC-5078775-8012918) using the 02nd step of [Role - AD Domain Recycle Bin Feature](https://proval.itglue.com/DOC-5078775-8012918)
   - The role will take its time to get itself detected.

2. Import the following script using the ProSync plugin:
   - [AD - Enable AD Recycle Bin](https://proval.itglue.com/DOC-5078775-7937042)

3. Import the following Alert Templates using the ProSync plugin:
   - `△ Custom - Execute Script - AD - Enable AD Recycle Bin`

4. Reload the System Cache
   - ![Reload System Cache](../../static/img/Enable-Recycle-Bin/image_1.png)

5. Import the following [AD Recycle Bin State Check](https://proval.itglue.com/DOC-5078775-7815146) monitor in the steps shown below:
   - Open a RAWSQL monitor
   - Import the search "DC without Recycle Bin" using the 03 step in the [Import - Remote Monitor - AD Recycle Bin State Check](https://proval.itglue.com/DOC-5078775-14764163) document. Run the provided SQL in the RAWSQL monitor
   - Verify if the search "DC without Recycle Bin" is created successfully
   - Import the monitor remote monitor [AD Recycle Bin State Check](https://proval.itglue.com/DOC-5078775-7815146) using the 04th step in the [Import - Remote Monitor - AD Recycle Bin State Check](https://proval.itglue.com/DOC-5078775-14764163) document. Run the provided SQL in the RAWSQL monitor.
   - [AD Recycle Bin State Check](https://proval.itglue.com/DOC-5078775-7815146) Monitor will be automatically created on "Domain Controllers" group limited to search "DC without Recycle Bin" and with alert template `△ Custom - Execute Script - AD - Enable AD Recycle Bin`
   - Ensure that the alert template is running the [AD - Enable AD Recycle Bin](https://proval.itglue.com/DOC-5078775-7937042) script.







