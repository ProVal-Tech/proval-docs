---
id: '0123f6a0-1512-4c19-a7c0-9cca0404bf5b'
slug: /0123f6a0-1512-4c19-a7c0-9cca0404bf5b
title: 'Feature Update Install'
title_meta: 'Feature Update Install'
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
| [CW RMM - Custom Field - Feature Update Install Failure](/docs/1c9abaeb-17f0-4a3b-86ee-953b5b713dc3) | Custom Field | The `Feature Update Install With Tracking` task utilizes this custom field to store the reason for failure in case the installation of the latest feature update is unsuccessful.                       |
| [CW RMM - Custom Field - Feature Update Reboot Pending](/docs/45e14854-ba83-4737-8264-b5cd809fca56) | Custom Field | The `Feature Update Install With Tracking` script flags this custom field if the installation is successful but the reboot is intentionally suppressed by the user parameter.                            |
| [CW RMM - Custom Field - WinFeatUpgradeAttempts](/docs/58b312bd-f26c-4b05-ab92-c184520d05de)       | Custom Field | It keeps a record of how many times a Windows 10/11 device has tried to install the feature upgrade using the `Feature Update Install With Tracking` task, with the default value set to 0.       |
| [CW RMM - Device Group - Feature Pack Update Automation](/docs/b9c9e1fe-57af-4816-befb-f2701ba009ba) | Device Group | Organizes computers operating on older build versions of Windows 10 and 11. The grouping involves comparing the computer's build version with the latest available build for the operating system.         |
| [CW RMM - Device Group - Feature Pack Update - Updated Computers](/docs/72490aca-9d0d-47b9-88a9-437279e21d7a) | Device Group | Classifies Windows 10 and 11 computers that are already using the latest build version but still possess a value in any of the associated custom fields.                                                  |
| [CW RMM - Device Group - Windows Feature Pack Update: Reboot Pending](/docs/72a7b834-70a2-4b4f-becb-bb77fa83a28d) | Device Group | Categorizes Windows 10 and 11 computers where the `Feature Update Install with Tracking` script is completed but a reboot is pending.                                                              |
| [CW RMM - Device Group - Windows Feature Pack Update Failure: Volume Health Error](/docs/891dd514-bfc7-4dba-b09c-7597145bb3e2) | Device Group | Categorizes Windows 10 and 11 computers where the `Feature Update Install with Tracking` script failed because of a Volume Health Error.                                                             |
| [CW RMM - Device Group - Windows Feature Pack Update Failure: Low Drive Space Error](/docs/f7cf60a6-9107-4188-9993-41ed9ed243d1) | Device Group | Categorizes Windows 10 and 11 computers where the `Feature Update Install with Tracking` script failed because of a Low Drive Space Error.                                                           |
| [CW RMM - Device Group - Windows Feature Pack Update Failure: Health Check Error](/docs/1b9f901e-ea4e-4ed0-9b62-01d667196d48) | Device Group | Categorizes Windows 10 and 11 computers where the `Feature Update Install with Tracking` script failed because of a Health Check Error.                                                               |
| [CW RMM - Device Group - Windows Feature Pack Update Failure: Compatibility Check Error](/docs/2eff2df6-a435-433a-8664-79cdda6fdedc) | Device Group | Categorizes Windows 11 computers where the `Feature Update Install with Tracking` script failed because of a Compatibility Check Error.                                                                |
| [CW RMM - Device Group - Windows Feature Pack Update Failure: Installation Failure/Error](/docs/998b5859-608f-4c0c-abd2-75356b272102) | Device Group | Categorizes Windows 10 and 11 computers where the `Feature Update Install with Tracking` script failed for an unknown reason.                                                                          |
| [CW RMM - Task - Feature Update Install With Tracking](/docs/5244ac77-6926-4902-a183-b4b2aac18e2b) | Task        | The script initiates the latest Feature Update using the Upgrade Assistant.                                                                                                                             |
| [CW RMM - Task - Windows Feature Update Attempt Tracking (Subscript)](/docs/fa4da03b-8c90-4acc-a080-42af8f471a1c) | Task        | This script is a subscript used for tracking the number of times the Windows Feature Upgrade solution has run and enters that value into the `WinFeatUpgradeAttempts` field.                             |
| [CW RMM - Task - Feature Update Install (Reboot Pending Machines Validation)](/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7) | Task        | The script runs on machines where the `Feature Update Reboot Pending` custom field is flagged after the execution of the `Feature Update Install With Tracking` task, signifying a pending reboot to finalize the Feature Pack Update. |
| [CW RMM - Task - Feature Update Install with Tracking (Reset Custom Fields)](/docs/40144621-2d0b-4294-b5cb-cec356cf9d74) | Task        | The script clears the related custom fields on machines where the Feature Update is successfully installed, thereby excluding those machines from automation and monitoring.                                |
| [CW RMM - Monitor - Feature Update Install Reboot Pending](/docs/94a786f8-dfa2-416c-aa3b-e57acbba1cb2) | Monitor     | Notifications for the computer where the `Feature Update Install with Tracking` script is completed but a restart is pending.                                                                             |
| [CW RMM - Monitor - Feature Update Install Failure](/docs/67eaa7f5-bf6c-4680-982b-8b64fc27a76f)   | Monitor     | The `Feature Update Install With Tracking` task utilizes this custom field to store the reason for failure in case the installation of the latest feature update is unsuccessful.                         |

## Implementation

1. Create the [CW RMM - Custom Field - Feature Update Install Failure](/docs/1c9abaeb-17f0-4a3b-86ee-953b5b713dc3) custom field.
2. Create the [CW RMM - Custom Field - Feature Update Reboot Pending](/docs/45e14854-ba83-4737-8264-b5cd809fca56) custom field.
3. Create the [CW RMM - Custom Field - WinFeatUpgradeAttempts](/docs/58b312bd-f26c-4b05-ab92-c184520d05de) custom field.
4. Create the [CW RMM - Device Group - Feature Pack Update Automation](/docs/b9c9e1fe-57af-4816-befb-f2701ba009ba) Device Group.
5. Create the [CW RMM - Device Group - Feature Pack Update - Updated Computers](/docs/72490aca-9d0d-47b9-88a9-437279e21d7a) Device Group.
6. Create the [CW RMM - Device Group - Windows Feature Pack Update: Reboot Pending](/docs/72a7b834-70a2-4b4f-becb-bb77fa83a28d) Device Group.
7. Create the [CW RMM - Device Group - Windows Feature Pack Update Failure: Volume Health Error](/docs/891dd514-bfc7-4dba-b09c-7597145bb3e2) Device Group.
8. Create the [CW RMM - Device Group - Windows Feature Pack Update Failure: Low Drive Space Error](/docs/f7cf60a6-9107-4188-9993-41ed9ed243d1) Device Group.
9. Create the [CW RMM - Device Group - Windows Feature Pack Update Failure: Health Check Error](/docs/1b9f901e-ea4e-4ed0-9b62-01d667196d48) Device Group.
10. Create the [CW RMM - Device Group - Windows Feature Pack Update Failure: Compatibility Check Error](/docs/2eff2df6-a435-433a-8664-79cdda6fdedc) Device Group.
11. Create the [CW RMM - Device Group - Windows Feature Pack Update Failure: Installation Failure/Error](/docs/998b5859-608f-4c0c-abd2-75356b272102) Device Group.
12. Create the [CW RMM - Task - Windows Feature Update Attempt Tracking (Subscript)](/docs/fa4da03b-8c90-4acc-a080-42af8f471a1c) Task.
13. Create and deploy the [CW RMM - Task - Feature Update Install With Tracking](/docs/5244ac77-6926-4902-a183-b4b2aac18e2b) Task as described in the script's document.
14. Create and deploy the [CW RMM - Task - Feature Update Install (Reboot Pending Machines Validation)](/docs/0c60dc74-ce8f-4332-b19c-d956287d66a7) Task as described in the script's document.
15. Create and deploy the [CW RMM - Task - Feature Update Install with Tracking (Reset Custom Fields)](/docs/40144621-2d0b-4294-b5cb-cec356cf9d74) Task as described in the script's document.
16. Create the [CW RMM - Monitor - Feature Update Install Reboot Pending](/docs/94a786f8-dfa2-416c-aa3b-e57acbba1cb2) monitor set.
17. Create the [CW RMM - Monitor - Feature Update Install Failure](/docs/67eaa7f5-bf6c-4680-982b-8b64fc27a76f) monitor set.

## FAQ

**Q:** Is it mandatory to create all groups for the solution to work?  
**A:** The essential groups for the solution are [CW RMM - Device Group - Feature Pack Update Automation](/docs/b9c9e1fe-57af-4816-befb-f2701ba009ba), [CW RMM - Device Group - Feature Pack Update - Updated Computers](/docs/72490aca-9d0d-47b9-88a9-437279e21d7a), and [CW RMM - Device Group - Windows Feature Pack Update: Reboot Pending](/docs/72a7b834-70a2-4b4f-becb-bb77fa83a28d). The remaining groups are designated as view-only, serving to categorize computers based on the reasons for script failure.

**Q:** Is it necessary to create and enable both monitors?  
**A:** No, each monitor serves a distinct purpose, and it is not obligatory to create both sets. In fact, only the monitor set relevant to the desired alerting needs to be created and activated.

**Q:** Is it possible to restrict the solution to Windows 10 only?  
**A:** Certainly, to confine the solution to Windows 10, the individual creating the solution should ensure that the associated groups are limited to Windows 10 only or exclude Windows 11 from the groups.