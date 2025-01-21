---
id: '0123f6a0-1512-4c19-a7c0-9cca0404bf5b'
title: 'Windows 10 and 11 Feature Pack Update Monitoring in CW RMM'
title_meta: 'Windows 10 and 11 Feature Pack Update Monitoring in CW RMM'
keywords: ['windows', 'feature', 'update', 'monitoring', 'automation']
description: 'This document outlines the procedures for executing, overseeing, and monitoring Windows 10 and 11 Feature Pack updates through ConnectWise RMM. It includes associated content, implementation steps, and FAQs to assist users in managing feature updates effectively.'
tags: ['update', 'windows']
draft: false
unlisted: false
---

## Purpose

This document provides details on the contents and the procedure for executing, overseeing, and monitoring Windows 10 and 11 Feature Pack updates through CW RMM.

## Associated Content

| Content                                                                                               | Type        | Function                                                                                                                                                                                                 |
|-------------------------------------------------------------------------------------------------------|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [CW RMM - Custom Field - Feature Update Install Failure](https://proval.itglue.com/DOC-5078775-14592254) | Custom Field | The `Feature Update Install With Tracking` task utilizes this custom field to store the reason for failure in case the installation of the latest feature update is unsuccessful.                       |
| [CW RMM - Custom Field - Feature Update Reboot Pending](<../cwrmm/custom-fields/Feature Update Reboot Pending.md>) | Custom Field | The `Feature Update Install With Tracking` script flags this custom field if the installation is successful but the reboot is intentionally suppressed by the user parameter.                            |
| [CW RMM - Custom Field - WinFeatUpgradeAttempts](<../cwrmm/custom-fields/WinFeatUpgradeAttempts.md>)       | Custom Field | It keeps a record of how many times a Windows 10/11 device has tried to install the feature upgrade using the `Feature Update Install With Tracking` task, with the default value set to 0.       |
| [CW RMM - Device Group - Feature Pack Update Automation](<../cwrmm/groups/Feature Pack Update Automation.md>) | Device Group | Organizes computers operating on older build versions of Windows 10 and 11. The grouping involves comparing the computer's build version with the latest available build for the operating system.         |
| [CW RMM - Device Group - Feature Pack Update - Updated Computers](<../cwrmm/groups/Feature Pack Update - Updated Computers.md>) | Device Group | Classifies Windows 10 and 11 computers that are already using the latest build version but still possess a value in any of the associated custom fields.                                                  |
| [CW RMM - Device Group - Windows Feature Pack Update: Reboot Pending](<../cwrmm/groups/Windows Feature Pack Update Reboot Pending.md>) | Device Group | Categorizes Windows 10 and 11 computers where the `Feature Update Install with Tracking` script is completed but a reboot is pending.                                                              |
| [CW RMM - Device Group - Windows Feature Pack Update Failure: Volume Health Error](<../cwrmm/groups/Windows Feature Pack Update Failure Volume Health Error.md>) | Device Group | Categorizes Windows 10 and 11 computers where the `Feature Update Install with Tracking` script failed because of a Volume Health Error.                                                             |
| [CW RMM - Device Group - Windows Feature Pack Update Failure: Low Drive Space Error](<../cwrmm/groups/Windows Feature Pack Update Failure Low Drive Space Error.md>) | Device Group | Categorizes Windows 10 and 11 computers where the `Feature Update Install with Tracking` script failed because of a Low Drive Space Error.                                                           |
| [CW RMM - Device Group - Windows Feature Pack Update Failure: Health Check Error](<../cwrmm/groups/Windows Feature Pack Update Failure Health Check Error.md>) | Device Group | Categorizes Windows 10 and 11 computers where the `Feature Update Install with Tracking` script failed because of a Health Check Error.                                                               |
| [CW RMM - Device Group - Windows Feature Pack Update Failure: Compatibility Check Error](<../cwrmm/groups/Windows Feature Pack Update Failure Compatibility Check Error.md>) | Device Group | Categorizes Windows 11 computers where the `Feature Update Install with Tracking` script failed because of a Compatibility Check Error.                                                                |
| [CW RMM - Device Group - Windows Feature Pack Update Failure: Installation Failure/Error](<../cwrmm/groups/Windows Feature Pack Update Failure Installation FailureError.md>) | Device Group | Categorizes Windows 10 and 11 computers where the `Feature Update Install with Tracking` script failed for an unknown reason.                                                                          |
| [CW RMM - Task - Feature Update Install With Tracking](<../cwrmm/tasks/Feature Update Install With Tracking.md>) | Task        | The script initiates the latest Feature Update using the Upgrade Assistant.                                                                                                                             |
| [CW RMM - Task - Windows Feature Update Attempt Tracking (Subscript)](<../cwrmm/tasks/Windows Feature Update Attempt Tracking (Subscript).md>) | Task        | This script is a subscript used for tracking the number of times the Windows Feature Upgrade solution has run and enters that value into the `WinFeatUpgradeAttempts` field.                             |
| [CW RMM - Task - Feature Update Install (Reboot Pending Machines Validation)](<../cwrmm/tasks/Feature Update Install (Reboot Pending Machines Validation).md>) | Task        | The script runs on machines where the `Feature Update Reboot Pending` custom field is flagged after the execution of the `Feature Update Install With Tracking` task, signifying a pending reboot to finalize the Feature Pack Update. |
| [CW RMM - Task - Feature Update Install with Tracking (Reset Custom Fields)](<../cwrmm/tasks/Feature Update Install with Tracking (Reset Custom Fields).md>) | Task        | The script clears the related custom fields on machines where the Feature Update is successfully installed, thereby excluding those machines from automation and monitoring.                                |
| [CW RMM - Monitor - Feature Update Install Reboot Pending](<../cwrmm/monitors/Feature Update Install Reboot Pending.md>) | Monitor     | Notifications for the computer where the `Feature Update Install with Tracking` script is completed but a restart is pending.                                                                             |
| [CW RMM - Monitor - Feature Update Install Failure](https://proval.itglue.com/DOC-5078775-14592324)   | Monitor     | The `Feature Update Install With Tracking` task utilizes this custom field to store the reason for failure in case the installation of the latest feature update is unsuccessful.                         |

## Implementation

1. Create the [CW RMM - Custom Field - Feature Update Install Failure](https://proval.itglue.com/DOC-5078775-14592254) custom field.
2. Create the [CW RMM - Custom Field - Feature Update Reboot Pending](<../cwrmm/custom-fields/Feature Update Reboot Pending.md>) custom field.
3. Create the [CW RMM - Custom Field - WinFeatUpgradeAttempts](<../cwrmm/custom-fields/WinFeatUpgradeAttempts.md>) custom field.
4. Create the [CW RMM - Device Group - Feature Pack Update Automation](<../cwrmm/groups/Feature Pack Update Automation.md>) Device Group.
5. Create the [CW RMM - Device Group - Feature Pack Update - Updated Computers](<../cwrmm/groups/Feature Pack Update - Updated Computers.md>) Device Group.
6. Create the [CW RMM - Device Group - Windows Feature Pack Update: Reboot Pending](<../cwrmm/groups/Windows Feature Pack Update Reboot Pending.md>) Device Group.
7. Create the [CW RMM - Device Group - Windows Feature Pack Update Failure: Volume Health Error](<../cwrmm/groups/Windows Feature Pack Update Failure Volume Health Error.md>) Device Group.
8. Create the [CW RMM - Device Group - Windows Feature Pack Update Failure: Low Drive Space Error](<../cwrmm/groups/Windows Feature Pack Update Failure Low Drive Space Error.md>) Device Group.
9. Create the [CW RMM - Device Group - Windows Feature Pack Update Failure: Health Check Error](<../cwrmm/groups/Windows Feature Pack Update Failure Health Check Error.md>) Device Group.
10. Create the [CW RMM - Device Group - Windows Feature Pack Update Failure: Compatibility Check Error](<../cwrmm/groups/Windows Feature Pack Update Failure Compatibility Check Error.md>) Device Group.
11. Create the [CW RMM - Device Group - Windows Feature Pack Update Failure: Installation Failure/Error](<../cwrmm/groups/Windows Feature Pack Update Failure Installation FailureError.md>) Device Group.
12. Create the [CW RMM - Task - Windows Feature Update Attempt Tracking (Subscript)](<../cwrmm/tasks/Windows Feature Update Attempt Tracking (Subscript).md>) Task.
13. Create and deploy the [CW RMM - Task - Feature Update Install With Tracking](<../cwrmm/tasks/Feature Update Install With Tracking.md>) Task as described in the script's document.
14. Create and deploy the [CW RMM - Task - Feature Update Install (Reboot Pending Machines Validation)](<../cwrmm/tasks/Feature Update Install (Reboot Pending Machines Validation).md>) Task as described in the script's document.
15. Create and deploy the [CW RMM - Task - Feature Update Install with Tracking (Reset Custom Fields)](<../cwrmm/tasks/Feature Update Install with Tracking (Reset Custom Fields).md>) Task as described in the script's document.
16. Create the [CW RMM - Monitor - Feature Update Install Reboot Pending](<../cwrmm/monitors/Feature Update Install Reboot Pending.md>) monitor set.
17. Create the [CW RMM - Monitor - Feature Update Install Failure](https://proval.itglue.com/DOC-5078775-14592324) monitor set.

## FAQ

**Q:** Is it mandatory to create all groups for the solution to work?  
**A:** The essential groups for the solution are [CW RMM - Device Group - Feature Pack Update Automation](<../cwrmm/groups/Feature Pack Update Automation.md>), [CW RMM - Device Group - Feature Pack Update - Updated Computers](<../cwrmm/groups/Feature Pack Update - Updated Computers.md>), and [CW RMM - Device Group - Windows Feature Pack Update: Reboot Pending](<../cwrmm/groups/Windows Feature Pack Update Reboot Pending.md>). The remaining groups are designated as view-only, serving to categorize computers based on the reasons for script failure.

**Q:** Is it necessary to create and enable both monitors?  
**A:** No, each monitor serves a distinct purpose, and it is not obligatory to create both sets. In fact, only the monitor set relevant to the desired alerting needs to be created and activated.

**Q:** Is it possible to restrict the solution to Windows 10 only?  
**A:** Certainly, to confine the solution to Windows 10, the individual creating the solution should ensure that the associated groups are limited to Windows 10 only or exclude Windows 11 from the groups.
