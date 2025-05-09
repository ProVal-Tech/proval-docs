---
id: '34794e27-c775-4d58-953b-5f8a61132cae'
slug: /34794e27-c775-4d58-953b-5f8a61132cae
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

| Content                                                                      | Type             | Function                                                                                                                                                                  |
| ---------------------------------------------------------------------------- | ---------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [User Profile - Get Information](/docs/91d80bf6-68c8-4025-b285-d07390b860c8) | Script           | Gathers information about user profiles.                                                                                                                                  |
| [Windows - User Profiles](/docs/da3a0d43-7bdd-4408-99ce-138337eecb43)        | Dataview         | Displays Windows user profile information gathered from [the script](/docs/91d80bf6-68c8-4025-b285-d07390b860c8).                                                         |
| [User Profile - Remove](/docs/765d906e-33c3-4615-9cd6-9c01a9eeaebb)          | Script           | Deletes a user profile and removes the user account if local. Runs the [script](/docs/91d80bf6-68c8-4025-b285-d07390b860c8) after successful deletion.                    |
| [User Profile - Get Information](/docs/36a5ce5d-5c24-4fe0-9dc7-bc6fc429f4a1) | Internal Monitor | Executes the [script](/docs/91d80bf6-68c8-4025-b285-d07390b860c8) once every 7 days.                                                                                      |
| `User Profile - Get Information`                                             | Alert Template   | This alert template is used with [the monitor](/docs/36a5ce5d-5c24-4fe0-9dc7-bc6fc429f4a1) to run [the script](/docs/91d80bf6-68c8-4025-b285-d07390b860c8) as an autofix. |

## Optional Content

| Content                                                                       | Type             | Function                                                                                                                                                                       |
| ----------------------------------------------------------------------------- | ---------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| [Unknown User Profiles Detection](/docs/ba7bb64b-e12b-4d21-a86f-572ce95b78d7) | Internal Monitor | Identifies machines that have unknown user profiles.                                                                                                                           |
| [Domain Trust Relationship Check](/docs/bf518e9f-f93c-451b-a38a-5fc3472cc6f4) | Remote Monitor   | Generates a ticket whenever the trust relationship between the domain and the workstation is broken. Used to exclude results from the Unknown User Profiles Detection monitor. |

## Other Content

| Content                                                                  | Type         | Function                                                                                                                                                                                         |
| ------------------------------------------------------------------------ | ------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| [Get-UserProfiles](/docs/dee76265-9071-47bb-9262-d656dd8b5c6d)           | Agnostic     | Gathers information about user profiles and is used in the [the script](/docs/91d80bf6-68c8-4025-b285-d07390b860c8).                                                                             |
| [Remove-UserProfile](/docs/af494143-56df-448c-8f30-44cf93a441ac)         | Agnostic     | Deletes a user profile and removes the user account if local.                                                                                                                                    |
| [plugin_proval_userprofiles](/docs/7a87abf3-b410-491b-bbc1-534092e61f55) | Custom Table | Stores Windows user profile information. Data is filled by [the script](/docs/91d80bf6-68c8-4025-b285-d07390b860c8) and displayed in [the dataview](/docs/da3a0d43-7bdd-4408-99ce-138337eecb43). |

## Implementation

1. Import the following scripts using the ProSync plugin:
   - [EPM - Accounts - Script - User Profile - Get Information](/docs/91d80bf6-68c8-4025-b285-d07390b860c8)
   - [EPM - Accounts - Script - User Profile - Remove](/docs/765d906e-33c3-4615-9cd6-9c01a9eeaebb)

2. Import the following monitor using the ProSync Plugin:
   - [Internal Monitor - Execute Script - User Profile - Get Information](/docs/36a5ce5d-5c24-4fe0-9dc7-bc6fc429f4a1)

3. Import the following alert templates using the ProSync plugin:
   - `△ Custom - Execute Script - Windows - User Profile - Get Information`

4. Import the following dataviews using the ProSync Plugin:
   - [Dataview - Windows - User Profiles](/docs/da3a0d43-7bdd-4408-99ce-138337eecb43)

5. Reload the System Cache  
   ![Reload System Cache](../../static/img/docs/34794e27-c775-4d58-953b-5f8a61132cae/image_1.webp)

6. Configure the solution as follows:
   - Navigate to Automation → Scripts to perform the following task:
     - Execute the [Script - User Profile - Get Information](/docs/91d80bf6-68c8-4025-b285-d07390b860c8) on any Windows machine except the DC server to create the [Custom Table - plugin_proval_userprofiles](/docs/7a87abf3-b410-491b-bbc1-534092e61f55).
   - Navigate to Automation → Monitors within the CWA Control Center and set up the following:
     - [Internal Monitor - Execute Script - User Profile - Get Information](/docs/36a5ce5d-5c24-4fe0-9dc7-bc6fc429f4a1)
       - Configure with the alert template: `△ Custom - Execute Script - Windows - User Profile - Get Information`
       - Right-click and Run Now to start the monitor.
   - After performing the above steps and verifying that the script has been executed on some machines, check if [Dataview - Windows - User Profiles](/docs/da3a0d43-7bdd-4408-99ce-138337eecb43) is populating data.

### Optional Configuration (Client Performed):
- If a partner requires the deletion of a particular user profile and also wants it removed if it is a local account, use the script below. Read the associated content thoroughly. **This script must be used very cautiously**.
  - [Script - User Profile - Remove](/docs/765d906e-33c3-4615-9cd6-9c01a9eeaebb)
- If a partner wants tickets for the unknown user profiles, import and configure the [Unknown User Profiles Detection](/docs/ba7bb64b-e12b-4d21-a86f-572ce95b78d7) internal monitor.
   - Navigate to Automation → Monitors within the CWA Control Center and set up the following:
     - [Internal Monitor - Unknown User Profiles Detection](/docs/ba7bb64b-e12b-4d21-a86f-572ce95b78d7)
       - Configure with the alert template: `△ Custom - Ticket Creation - Computer`
       - Right-click and Run Now to start the monitor.
     - Use the mentioned [monitor](/docs/bf518e9f-f93c-451b-a38a-5fc3472cc6f4) to exclude any domain trust relationship issues.