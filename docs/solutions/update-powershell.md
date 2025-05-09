---
id: '6196fdb8-de1b-46d2-a19f-2fcb9b676ed8'
slug: /6196fdb8-de1b-46d2-a19f-2fcb9b676ed8
title: 'Update PowerShell'
title_meta: 'Update PowerShell'
keywords: ['update', 'audit', 'powershell', 'version', 'windows']
description: 'This document outlines the purpose and steps to update and audit the PowerShell version for older operating systems, ensuring compliance and security by detecting outdated versions and facilitating updates.'
tags: ['installation', 'security', 'update', 'windows']
draft: false
unlisted: false
---

## Purpose

The purpose of this document is to update and audit the PowerShell version for older operating systems (Windows 10 and below).

## Associated Content

| Content                                                                | Type             | Function                                                                                                                                               |
| ---------------------------------------------------------------------- | ---------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------ |
| [Dynamic PowerShell Role](/docs/6c30a69a-90c5-4e2d-ba5f-f2a663adbd81)  | Role             | Detect the current PowerShell version of the machine.                                                                                                  |
| [PowerShell Out of Date](/docs/abc5e9cd-9e2c-4df0-b129-be342008e554)   | Internal Monitor | The monitor set will detect the Windows machines where PowerShell Version is older than 5.0.                                                           |
| [PowerShell Version Audit](/docs/9da26821-e8e6-44b4-9310-2495aebd0396) | Dataview         | This dataview collects information on PowerShell Version based on the [role](/docs/6c30a69a-90c5-4e2d-ba5f-f2a663adbd81).                              |
| [Update PowerShell](/docs/a95013e7-7091-4d99-a772-4223230789d9)        | Script           | Updates PowerShell Desktop to the latest version.                                                                                                      |
| PowerShell Out of Date                                                 | Alert Template   | Executes the [script](/docs/a95013e7-7091-4d99-a772-4223230789d9) against the detections of [the monitor](/docs/abc5e9cd-9e2c-4df0-b129-be342008e554). |

## Implementation

1. Import the [Dynamic PowerShell Role](/docs/6c30a69a-90c5-4e2d-ba5f-f2a663adbd81) Role.
2. Execute the Update Config command against all agents.
3. Import the [ProVal - Production - PowerShell Out of Date](/docs/abc5e9cd-9e2c-4df0-b129-be342008e554) Internal monitor.
4. Import the [Update PowerShell](/docs/a95013e7-7091-4d99-a772-4223230789d9) script.
5. Configure the Global Parameter of the script as needed.
6. Import the [PowerShell Version Audit [Role]](/docs/9da26821-e8e6-44b4-9310-2495aebd0396) dataview.
7. Import the `△ Custom - Autofix - PowerShell Out of Date` Alert Template.
8. Reload the system cache.
9. Assign the alert template to the internal monitor.

## FAQ

**Question:**  
Can I modify this script to add a pop-up for a user to schedule their own reboot?  
**Answer:**  
No, User-Prompt Show and prompter are written for PowerShell v5 or above.

**Question:**  
Is there anything the end user will experience due to running this script?  
**Answer:**  
Yes, if a user is logged on to the computer while this script is running, they will see an alert pop up in the bottom right-hand corner of the screen informing them that there is an important update that requires a reboot to complete. A yellow-bordered pop-up may appear requesting a reboot, which can be granted or postponed.

**Question:**  
The script keeps failing on this machine, why?  
**Answer:**  
You should be able to see the reasons why the script failed in the script logs for that machine. You can expect script failures if any of the following conditions are true, and the log will reflect this.

This script will not update if any of the following conditions are true:
1. Target OS is Windows XP, 2003, or Vista/2008, because PowerShell V5 is not available for these operating systems.
2. Target OS is Windows 10 or Server 2016, because PowerShell V5 is installed by default on these systems.
3. Target OS is Windows 7 or Server 2008R2 but not SP2, because SP2 must be installed to install PowerShell V5.
4. Target OS is Windows 8, because PowerShell V5 is not applicable to this operating system.
5. Target OS is Windows 7 or Server 2008R2 SP2 but missing .NET Framework 4.5.2 or greater, because .NET 4.5.2 is required.