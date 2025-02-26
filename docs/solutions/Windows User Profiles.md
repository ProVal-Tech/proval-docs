---
id: '34794e27-c775-4d58-953b-5f8a61132cae'
title: 'Windows User Profiles'
title_meta: 'Windows User Profiles'
keywords: ['windows', 'user', 'profile', 'information', 'gathering', 'monitor']
description: 'This document provides detailed instructions on gathering and displaying information about Windows user profiles using various scripts and monitors. It includes associated scripts, monitors, and optional configurations for effective management of user profiles.'
tags: ['windows']
draft: false
unlisted: false
---

## Purpose

Gathers and displays information about Windows user profiles.

## Associated Content

| Content                                                                                         | Type           | Function                                                                                                   |
|-------------------------------------------------------------------------------------------------|----------------|------------------------------------------------------------------------------------------------------------|
| [Script - User Profile - Get Information](<../cwa/scripts/User Profile - Get Information.md>)      | Script         | Gathers information about user profiles.                                                                    |
| [Dataview - Windows - User Profiles](<../cwa/dataviews/Windows - User Profiles.md>)          | Dataview       | Displays Windows user profile information gathered from the [Script - User Profile - Get Information](<../cwa/scripts/User Profile - Get Information.md>). |
| [Script - User Profile - Remove](<../cwa/scripts/User Profile - Remove.md>)              | Script         | Deletes a user profile and removes the user account if local. Runs the [Script - User Profile - Get Information](<../cwa/scripts/User Profile - Get Information.md>) after successful deletion. |
| [Internal Monitor - Execute Script - User Profile - Get Information](<../cwa/monitors/Execute Script - User Profile - Get Information.md>) | Internal Monitor | Executes the [Script - User Profile - Get Information](<../cwa/scripts/User Profile - Get Information.md>) once every 7 days. |
| `△ Custom - Execute Script - Windows - User Profile - Get Information`                       | Alert Template  | This alert template is used with [Internal Monitor - Execute Script - User Profile - Get Information](<../cwa/monitors/Execute Script - User Profile - Get Information.md>) to run [Script - User Profile - Get Information](<../cwa/scripts/User Profile - Get Information.md>) as an autofix. |

## Optional Content

| Content                                                                                                         | Type           | Function                                                                                                           |
|-----------------------------------------------------------------------------------------------------------------|----------------|--------------------------------------------------------------------------------------------------------------------|
| [Internal Monitor - Unknown User Profiles Detection](<../cwa/monitors/Unknown User Profiles Detection.md>)         | Internal Monitor | Identifies machines that have unknown user profiles.                                                               |
| [Remote Monitor - Domain Trust Relationship Check](https://proval.itglue.com/5078775/docs/17974580)         | Remote Monitor   | This monitor generates a ticket whenever the trust relationship between the domain and the workstation is broken. The results of this monitor are used to exclude results from the Unknown User Profiles Detection monitor. |

## Other Content

| Content                                                                                                       | Type         | Function                                                                                                           |
|---------------------------------------------------------------------------------------------------------------|--------------|--------------------------------------------------------------------------------------------------------------------|
| [EPM - Accounts - Agnostic - Get-UserProfiles](<../powershell/Get-UserProfiles.md>)              | Agnostic     | Gathers information about user profiles and is used in the script [EPM - Accounts - Script - User Profile - Get Information](<../cwa/scripts/User Profile - Get Information.md>). |
| [EPM - Accounts - Agnostic - Remove-UserProfile](<../powershell/Remove-UserProfile.md>)            | Agnostic     | Deletes a user profile and removes the user account if local.                                                     |
| [EPM - Accounts - Custom Table - plugin_proval_userprofiles](<../cwa/tables/plugin_proval_userprofiles.md>) | Custom Table | Stores Windows user profile information. Data is filled by [EPM - Accounts - Script - User Profile - Get Information](<../cwa/scripts/User Profile - Get Information.md>) and displayed in [EPM - Accounts - Dataview - Windows - User Profiles](<../cwa/dataviews/Windows - User Profiles.md>). |

## Implementation

1. Import the following scripts using the ProSync plugin:
   - [EPM - Accounts - Script - User Profile - Get Information](<../cwa/scripts/User Profile - Get Information.md>)
   - [EPM - Accounts - Script - User Profile - Remove](<../cwa/scripts/User Profile - Remove.md>)

2. Import the following monitor using the ProSync Plugin:
   - [Internal Monitor - Execute Script - User Profile - Get Information](<../cwa/monitors/Execute Script - User Profile - Get Information.md>)

3. Import the following alert templates using the ProSync plugin:
   - `△ Custom - Execute Script - Windows - User Profile - Get Information`

4. Import the following dataviews using the ProSync Plugin:
   - [Dataview - Windows - User Profiles](<../cwa/dataviews/Windows - User Profiles.md>)

5. Reload the System Cache  
   ![Reload System Cache](../../static/img/Windows-User-Profiles/image_1.png)

6. Configure the solution as follows:
   - Navigate to Automation → Scripts to perform the following task:
     - Execute the [Script - User Profile - Get Information](<../cwa/scripts/User Profile - Get Information.md>) on any Windows machine except the DC server to create the [Custom Table - plugin_proval_userprofiles](<../cwa/tables/plugin_proval_userprofiles.md>).
   - Navigate to Automation → Monitors within the CWA Control Center and set up the following:
     - [Internal Monitor - Execute Script - User Profile - Get Information](<../cwa/monitors/Execute Script - User Profile - Get Information.md>)
       - Configure with the alert template: `△ Custom - Execute Script - Windows - User Profile - Get Information`
       - Right-click and Run Now to start the monitor.
   - After performing the above steps and verifying that the script has been executed on some machines, check if [Dataview - Windows - User Profiles](<../cwa/dataviews/Windows - User Profiles.md>) is populating data.

### Optional Configuration (Client Performed):
- If a partner requires the deletion of a particular user profile and also wants it removed if it is a local account, use the script below. Read the associated content thoroughly. **This script must be used very cautiously**.
  - [Script - User Profile - Remove](<../cwa/scripts/User Profile - Remove.md>)
- If a partner wants tickets for the unknown user profiles, import and configure the [Unknown User Profiles Detection](<../cwa/monitors/Unknown User Profiles Detection.md>) internal monitor.
   - Navigate to Automation → Monitors within the CWA Control Center and set up the following:
     - [Internal Monitor - Unknown User Profiles Detection](<../cwa/monitors/Unknown User Profiles Detection.md>)
       - Configure with the alert template: `△ Custom - Ticket Creation - Computer`
       - Right-click and Run Now to start the monitor.
     - Use the mentioned [Remote Monitor](https://proval.itglue.com/5078775/docs/17975723) to exclude any domain trust relationship issues.



