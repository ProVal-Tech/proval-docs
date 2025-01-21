---
id: '18a04fc3-7659-44d6-8a9b-cd080cda4d08'
title: 'SEC - Windows Patch - Policy - cPVAL DuoDogs Workstations Patching'
title_meta: 'SEC - Windows Patch - Policy - cPVAL DuoDogs Workstations Patching'
keywords: ['patch', 'workstation', 'policy', 'maintenance', 'reboot']
description: 'This document outlines the organization-level patch policy for workstations, detailing the procedures for patch management, including scheduling maintenance reminders, disabling Windows Automatic Updates, and managing reboot actions based on user activity.'
tags: ['windows']
draft: true
unlisted: false
---

# Summary
We have created an organization-level patch policy for workstations. Its purpose is to patch and reboot the workstations. Windows Automatic Updates are disabled, and this policy will also provide maintenance reminders prior to patching.

# Profile Module
Patch Management 

# Dependencies
This section should list the ITGlue documents referenced in the Related Items sidebar on which this patching profile depends.

- Agent procedure: Weekly Maintenance Reminder

# Profile Type
What type of profile has been created? This includes the following:

- Patch Management Profiles

# Profile Details
Provide the configuration of the profile using the following templates based on the profile type. Remove any segments below that are not applicable to the profile type.

### Patch Management
- The desktop maintenance reminder procedure is scheduled for every week on Tuesday at 10 AM in the machine's time zone, with a skip if offline.
- Patch Windows Automatic Updates for workstations: Every week on Tuesday at 10:00 PM in the machine's time zone, with a skip if offline, and the distribution hours are 2 hours.
- Patch reboot action is as follows: If the user is logged in, ask for permission. Do nothing if there is no response within 60 minutes. Reboot if the user is not logged in.
- Windows Automatic Updates are disabled.



