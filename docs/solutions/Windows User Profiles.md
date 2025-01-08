---
id: 'cwa-user-profile-information'
title: 'User Profile Information Gathering'
title_meta: 'User Profile Information Gathering'
keywords: ['windows', 'user', 'profile', 'information', 'gathering', 'monitor']
description: 'This document provides detailed instructions on gathering and displaying information about Windows user profiles using various scripts and monitors. It includes associated scripts, monitors, and optional configurations for effective management of user profiles.'
tags: ['windows', 'user', 'profile', 'monitor', 'script', 'dataview', 'alert', 'configuration']
draft: false
unlisted: false
---
## Purpose

Gathers and displays information about Windows user profiles.

## Associated Content

| Content                                                                                         | Type       | Function                                                                                                   |
|-------------------------------------------------------------------------------------------------|------------|------------------------------------------------------------------------------------------------------------|
| [Script - User Profile - Get Information](https://proval.itglue.com/DOC-5078775-8476496)      | Script     | Gathers information about user profiles.                                                                    |
| [Dataview - Windows - User Profiles](https://proval.itglue.com/DOC-5078775-8476497)          | Dataview   | Displays Windows user profile information gathered from the [Script - User Profile - Get Information](https://proval.itglue.com/DOC-5078775-8476496). |
| [Script - User Profile - Remove](https://proval.itglue.com/DOC-5078775-8481760)              | Script     | Deletes a user profile and removes the user account if local. Runs the [Script - User Profile - Get Information](https://proval.itglue.com/DOC-5078775-8476496) after successful deletion. |
| [Internal Monitor - Execute Script - User Profile - Get Information](https://proval.itglue.com/DOC-5078775-15229730) | Internal Monitor | Executes the [Script - User Profile - Get Information](https://proval.itglue.com/DOC-5078775-8476496) once per 7 days. |
| `△ Custom - Execute Script - Windows - User Profile - Get Information`                       | Alert Template | This alert template is used with [Internal Monitor - Execute Script - User Profile - Get Information](https://proval.itglue.com/DOC-5078775-15229730) to run [Script - User Profile - Get Information](https://proval.itglue.com/DOC-5078775-8476496) as an autofix. |

## Optional Content

| Content                                                                                                         | Type           | Function                                                                                                           |
|-----------------------------------------------------------------------------------------------------------------|----------------|--------------------------------------------------------------------------------------------------------------------|
| [Internal Monitor - Unknown User Profiles Detection](https://proval.itglue.com/DOC-5078775-17869275)         | Internal Monitor | Identifies machines that have unknown user profiles.                                                               |
| [Remote Monitor - Domain Trust Relationship Check](https://proval.itglue.com/5078775/docs/17974580)         | Remote Monitor   | This monitor is used to generate a ticket whenever the trust relationship between the domain and the workstation is broken. The results of this monitor are used to exclude results from the Unknown User Profiles Detection monitor. |

## Other Content

| Content                                                                                                       | Type         | Function                                                                                                           |
|---------------------------------------------------------------------------------------------------------------|--------------|--------------------------------------------------------------------------------------------------------------------|
| [EPM - Accounts - Agnostic - Get-UserProfiles](https://proval.itglue.com/DOC-5078775-8475169)              | Agnostic     | Gathers information about user profiles and is being used in script [EPM - Accounts - Script - User Profile - Get Information](https://proval.itglue.com/DOC-5078775-8476496). |
| [EPM - Accounts - Agnostic - Remove-UserProfile](https://proval.itglue.com/DOC-5078775-8475171)            | Agnostic     | Deletes a user profile and removes the user account if local.                                                     |
| [EPM - Accounts - Custom Table - plugin_proval_userprofiles](https://proval.itglue.com/DOC-5078775-8476498) | Custom Table | Stores Windows user profile information. Data is filled by [EPM - Accounts - Script - User Profile - Get Information](https://proval.itglue.com/DOC-5078775-8476496) and displayed in [EPM - Accounts - Dataview - Windows - User Profiles](https://proval.itglue.com/DOC-5078775-8476497). |

## Implementation

1. Import the following scripts using the ProSync plugin:
   - [EPM - Accounts - Script - User Profile - Get Information](https://proval.itglue.com/DOC-5078775-8476496)
   - [EPM - Accounts - Script - User Profile - Remove](https://proval.itglue.com/DOC-5078775-8481760)

2. Import the following monitor using the ProSync Plugin:
   - [Internal Monitor - Execute Script - User Profile - Get Information](https://proval.itglue.com/DOC-5078775-15229730)

3. Import the following Alert Templates using the ProSync plugin:
   - `△ Custom - Execute Script - Windows - User Profile - Get Information`

4. Import the following Dataviews using the ProSync Plugin:
   - [Dataview - Windows - User Profiles](https://proval.itglue.com/DOC-5078775-8476497)

5. Reload the System Cache  
   ![Reload System Cache](5078775/docs/15227185/images/22118560)

6. Configure the solution as follows:
   - Navigate to Automation → Scripts to perform the below task:
     - Execute the [Script - User Profile - Get Information](https://proval.itglue.com/DOC-5078775-8476496) on any Windows machine except DC server to create the [Custom Table - plugin_proval_userprofiles](https://proval.itglue.com/DOC-5078775-8476498).
   - Navigate to Automation → Monitors within the CWA Control Center and set up the following:
     - [Internal Monitor - Execute Script - User Profile - Get Information](https://proval.itglue.com/DOC-5078775-15229730)
       - Configure with the alert template: `△ Custom - Execute Script - Windows - User Profile - Get Information`
       - Right-click and Run Now to start the monitor.
   - After performing the above steps, and verifying the script has been executed on some machines, verify if [Dataview - Windows - User Profiles](https://proval.itglue.com/DOC-5078775-8476497) is populating data.

Optional Configuration (Client Performed):
- If a partner requires to delete a particular user profile and also remove it if it is a local account, use the below script. Read the associated content thoroughly. **This script has to be used very cautiously**.
  - [Script - User Profile - Remove](https://proval.itglue.com/DOC-5078775-8481760)
- If a partner wants tickets for the Unknown user profiles, import and configure the [Unknown User Profiles Detection](https://proval.itglue.com/DOC-5078775-17869275) internal monitor.
   - Navigate to Automation → Monitors within the CWA Control Center and set up the following:
     - [Internal Monitor - Unknown User Profiles Detection](https://proval.itglue.com/DOC-5078775-17869275)
       - Configure with the alert template: `△ Custom - Ticket Creation - Computer`
       - Right-click and Run Now to start the monitor.
     - Use the mentioned [Remote Monitor](https://proval.itglue.com/5078775/docs/17975723) to exclude any domain trust relationship issues.

