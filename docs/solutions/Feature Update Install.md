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

The solution provides details on the contents and the procedure for executing, overseeing, and monitoring Windows 10 and 11 Feature Pack updates through CW RMM.

## Associated Content

| Content                                                                                               | Type        | Function                                                                                                                                                                                                 |
|-------------------------------------------------------------------------------------------------------|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [CW RMM - Custom Field - Feature Update Install Failure](https://proval.itglue.com/DOC-5078775-14592254) | Custom Field | The `Feature Update Install With Tracking` task utilizes this custom field to store the reason for failure in case the installation of the latest feature update is unsuccessful.                       |
| [CW RMM - Custom Field - Feature Update Reboot Pending](https://proval.itglue.com/DOC-5078775-14592255) | Custom Field | The `Feature Update Install With Tracking` script flags this custom field if the installation is successful but the reboot is intentionally suppressed by the user parameter.                            |
| [CW RMM - Custom Field - WinFeatUpgradeAttempts](https://proval.itglue.com/DOC-5078775-12949095)       | Custom Field | It will keep a record of how many times a Windows 10/11 device has tried to install the Feature upgrade using the `Feature Update Install With Tracking` task, with the default value set to 0.       |
| [CW RMM - Device Group - Feature Pack Update Automation](https://proval.itglue.com/DOC-5078775-14592310) | Device Group | Organize computers operating on older build versions of Windows 10 and 11. The grouping involves comparing the computer's build version with the latest available build for the operating system.         |
| [CW RMM - Device Group - Feature Pack Update - Updated Computers](https://proval.itglue.com/DOC-5078775-14592309) | Device Group | Classify Windows 10 and 11 computers that are already using the latest build version but still possess a value in any of the associated custom fields.                                                  |
| [CW RMM - Device Group - Windows Feature Pack Update: Reboot Pending](https://proval.itglue.com/DOC-5078775-14592311) | Device Group | Categorize the Windows 10 and 11 Computers where the `Feature Update Install with Tracking` script is completed but a reboot is pending.                                                              |
| [CW RMM - Device Group - Windows Feature Pack Update Failure: Volume Health Error](https://proval.itglue.com/DOC-5078775-14592312) | Device Group | Categorize the Windows 10 and 11 Computers where the `Feature Update Install with Tracking` script failed because of a Volume Health Error.                                                             |
| [CW RMM - Device Group - Windows Feature Pack Update Failure: Low Drive Space Error](https://proval.itglue.com/DOC-5078775-14592314) | Device Group | Categorize the Windows 10 and 11 Computers where the `Feature Update Install with Tracking` script failed because of a Low Drive Space Error.                                                           |
| [CW RMM - Device Group - Windows Feature Pack Update Failure: Health Check Error](https://proval.itglue.com/DOC-5078775-14592316) | Device Group | Categorize the Windows 10 and 11 Computers where the `Feature Update Install with Tracking` script failed because of a Health Check Error.                                                               |
| [CW RMM - Device Group - Windows Feature Pack Update Failure: Compatibility Check Error](https://proval.itglue.com/DOC-5078775-14592319) | Device Group | Categorize the Windows 11 Computers where the `Feature Update Install with Tracking` script failed because of a Compatibility Check Error.                                                                |
| [CW RMM - Device Group - Windows Feature Pack Update Failure: Installation Failure/Error](https://proval.itglue.com/DOC-5078775-14592320) | Device Group | Categorize the Windows 10 and 11 Computers where the `Feature Update Install with Tracking` script failed for an unknown reason.                                                                          |
| [CW RMM - Task - Feature Update Install With Tracking](https://proval.itglue.com/DOC-5078775-12947845) | Task        | The script initiates the latest Feature Update using the Upgrade Assistant.                                                                                                                             |
| [CW RMM - Task - Windows Feature Update Attempt Tracking (Subscript)](https://proval.itglue.com/DOC-5078775-12949193) | Task        | This script is a subscript used for tracking the number of times the Windows Feature Upgrade solution has run and enters that value into the `WinFeatUpgradeAttempts` field.                             |
| [CW RMM - Task - Feature Update Install (Reboot Pending Machines Validation)](https://proval.itglue.com/DOC-5078775-14591604) | Task        | The script runs on machines where the `Feature Update Reboot Pending` custom field is flagged after the execution of the `Feature Update Install With Tracking` task, signifying a pending reboot to finalize the Feature Pack Update. |
| [CW RMM - Task - Feature Update Install with Tracking (Reset Custom Fields)](https://proval.itglue.com/DOC-5078775-14591609) | Task        | The script clears the related custom fields on machines where the Feature Update is successfully installed, thereby excluding those machines from automation and monitoring.                                |
| [CW RMM - Monitor - Feature Update Install Reboot Pending](https://proval.itglue.com/DOC-5078775-14592326) | Monitor     | Notifications for the computer where the `Feature Update Install with Tracking` script is completed but a restart is pending.                                                                             |
| [CW RMM - Monitor - Feature Update Install Failure](https://proval.itglue.com/DOC-5078775-14592324)   | Monitor     | The `Feature Update Install With Tracking` task utilizes this custom field to store the reason for failure in case the installation of the latest feature update is unsuccessful.                         |

## Implementation

Create the [CW RMM - Custom Field - Feature Update Install Failure](https://proval.itglue.com/DOC-5078775-14592254) custom field.  
Create the [CW RMM - Custom Field - Feature Update Reboot Pending](https://proval.itglue.com/DOC-5078775-14592255) custom field.  
Create the [CW RMM - Custom Field - WinFeatUpgradeAttempts](https://proval.itglue.com/DOC-5078775-12949095) custom field.  
Create the [CW RMM - Device Group - Feature Pack Update Automation](https://proval.itglue.com/DOC-5078775-14592310) Device Group.  
Create the [CW RMM - Device Group - Feature Pack Update - Updated Computers](https://proval.itglue.com/DOC-5078775-14592309) Device Group.  
Create the [CW RMM - Device Group - Windows Feature Pack Update: Reboot Pending](https://proval.itglue.com/DOC-5078775-14592311) Device Group.  
Create the [CW RMM - Device Group - Windows Feature Pack Update Failure: Volume Health Error](https://proval.itglue.com/DOC-5078775-14592312) Device Group.  
Create the [CW RMM - Device Group - Windows Feature Pack Update Failure: Low Drive Space Error](https://proval.itglue.com/DOC-5078775-14592314) Device Group.  
Create the [CW RMM - Device Group - Windows Feature Pack Update Failure: Health Check Error](https://proval.itglue.com/DOC-5078775-14592316) Device Group.  
Create the [CW RMM - Device Group - Windows Feature Pack Update Failure: Compatibility Check Error](https://proval.itglue.com/DOC-5078775-14592319) Device Group.  
Create the [CW RMM - Device Group - Windows Feature Pack Update Failure: Installation Failure/Error](https://proval.itglue.com/DOC-5078775-14592320) Device Group.  
Create the [CW RMM - Task - Windows Feature Update Attempt Tracking (Subscript)](https://proval.itglue.com/DOC-5078775-12949193) Task.  
Create and deploy the [CW RMM - Task - Feature Update Install With Tracking](https://proval.itglue.com/DOC-5078775-12947845) Task as described in the script's document.  
Create and deploy the [CW RMM - Task - Feature Update Install (Reboot Pending Machines Validation)](https://proval.itglue.com/DOC-5078775-14591604) Task as described in the script's document.  
Create and deploy the [CW RMM - Task - Feature Update Install with Tracking (Reset Custom Fields)](https://proval.itglue.com/DOC-5078775-14591609) Task as described in the script's document.  
Create the [CW RMM - Monitor - Feature Update Install Reboot Pending](https://proval.itglue.com/DOC-5078775-14592326) monitor set.  
Create the [CW RMM - Monitor - Feature Update Install Failure](https://proval.itglue.com/DOC-5078775-14592324) monitor set.  

## FAQ

**Q:** Is it mandatory to create all groups for the solution to work?  
**A:** The essential groups for the solution are [CW RMM - Device Group - Feature Pack Update Automation](https://proval.itglue.com/DOC-5078775-14592310), [CW RMM - Device Group - Feature Pack Update - Updated Computers](https://proval.itglue.com/DOC-5078775-14592309), and [CW RMM - Device Group - Windows Feature Pack Update: Reboot Pending](https://proval.itglue.com/DOC-5078775-14592311). The remaining groups are designated as view-only, serving to categorize computers based on the reasons for script failure.

**Q:** Is it necessary to create and enable both monitors?  
**A:** No, each monitor serves a distinct purpose, and it is not obligatory to create both sets. In fact, only the monitor set relevant to the desired alerting needs to be created and activated.

**Q:** Is it possible to restrict the solution to Windows 10 only?  
**A:** Certainly, to confine the solution to Windows 10, the individual creating the solution should ensure that the associated groups are limited to Windows 10 only or exclude Windows 11 from the groups.











