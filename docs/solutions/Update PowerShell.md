---
id: 'cwa-update-audit-powershell-version'
title: 'Update and Audit PowerShell Version for Older Operating Systems'
title_meta: 'Update and Audit PowerShell Version for Older Operating Systems'
keywords: ['update', 'audit', 'powershell', 'version', 'windows']
description: 'This document outlines the purpose and steps to update and audit the PowerShell version for older operating systems, ensuring compliance and security by detecting outdated versions and facilitating updates.'
tags: ['configuration', 'installation', 'update', 'security', 'windows']
draft: false
unlisted: false
---
## Purpose

The purpose of the solution is to update and audit the PowerShell version for the older (< Windows 10) operating systems.

## Associated Content

| Content                                                                                     | Type          | Function                                                                                                         |
|---------------------------------------------------------------------------------------------|---------------|------------------------------------------------------------------------------------------------------------------|
| [Dynamic PowerShell Role](https://proval.itglue.com/DOC-5078775-10926872)                 | Role          | Detect the current PowerShell version of the machine.                                                          |
| [ProVal - Production - PowerShell Out of Date](https://proval.itglue.com/5078775/docs/11623739) | Internal Monitor | The monitor set will detect the windows machines where PowerShell Version is older than 5.0.                    |
| [PowerShell Version Audit [Role]](https://proval.itglue.com/5078775/docs/10923267)       | Dataview      | This dataview collects the information of PowerShell Version based on [Dynamic PowerShell Role](https://proval.itglue.com/DOC-5078775-10926872). |
| [Update PowerShell](https://proval.itglue.com/5078775/docs/11313612)                     | Script        | Updates PowerShell Desktop to the latest version.                                                               |
| △ Custom - Autofix - PowerShell Out of Date                                                | Alert Template | Execute the [Update PowerShell](https://proval.itglue.com/5078775/docs/11313612) script against the machines detected by [ProVal - Production - PowerShell Out of Date](https://proval.itglue.com/5078775/docs/11623739) monitor set. |

## Implementation

Step 1: Import the [Dynamic PowerShell Role](https://proval.itglue.com/DOC-5078775-10926872) Role.

Step 2: Execute Update Config command against All agents.

Step 3: Import the [ProVal - Production - PowerShell Out of Date](https://proval.itglue.com/5078775/docs/11623739) Internal monitor.

Step 4: Import the [Update PowerShell](https://proval.itglue.com/5078775/docs/11313612) script.

Step 5: Configure the Global Parameter of the script as needed.

Step 6: Import the [PowerShell Version Audit [Role]](https://proval.itglue.com/5078775/docs/10923267) dataview.

Step 7: Import the `△ Custom - Autofix - PowerShell Out of Date` Alert Template.

Step 8: Reload the system cache.

Step 9: Assign the alert template to the internal monitor.

## FAQ

**Question:**  
Can I modify this script to add a pop up for a user to schedule their own reboot?  
**Answer:**  
No, User-Prompt Show and prompter are written for PowerShell v5 or above.

**Question:**  
Is there anything the end user will experience due to running this script?  
**Answer:**  
Yes, in the event a user is logged on to the computer during the time of this script running, the user will see an alert pop up in the bottom right-hand corner of the screen informing them that there is an important update that requires a reboot to complete. A yellow bordered pop up may appear requesting a reboot which can be granted or postponed.

**Question:**  
The script keeps failing on this machine, why?  
**Answer:**  
You should be able to see the reasons why the script failed in the script logs for that machine. You can expect script failures if any of the below conditions are true, and the log will reflect this.

This Script Will not update if any of the following Conditions are true:
1. Target OS is Windows XP, 2003, or Vista/2008, because PowerShell V5 is not available for these operating systems.
2. Target OS is Windows 10 or Server 2016, because PowerShell V5 is installed by default on these systems.
3. Target OS is Windows 7 or Server 2008R2 but not SP2, because SP2 must be installed to install PowerShell V5.
4. Target OS is Windows 8, because PowerShell V5 is not applicable to this operating system.
5. Target OS is Windows 7 or Server 2008R2 SP2 but missing .NET Framework 4.5.2 or greater, because .NET 4.5.2 is required.




