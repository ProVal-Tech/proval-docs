---
id: '18a04fc3-7659-44d6-8a9b-cd080cda4d08'
title: 'Workstation Patch Policy Overview'
title_meta: 'Workstation Patch Policy Overview'
keywords: ['patch', 'workstation', 'policy', 'maintenance', 'reboot']
description: 'This document outlines the organization-level patch policy for workstations, detailing the procedures for patch management, including scheduling maintenance reminders, disabling Windows Automatic Updates, and managing reboot actions based on user activity.'
tags: ['windows']
draft: true
unlisted: false
---
# Summary
We have created an organization-level patch policy for Workstations and its purpose is to Patch & reboot the Workstations. Windows Automatic Update is disabled and this policy will also give the maintenance reminder prior to patching.

# Profile Module
Patch Management 

# Dependencies
This should be a list of ITGlue documents listed in the Related Items sidebar on which this Patching profile depends

- Agent procedure: Weekly Maintenance reminder

# Profile Type
What type of profile has been created? Includes the following:

- Patch Management Profiles

# Profile Details
Provide the configuration of the profile, using the following templates based on profile Type. Remove any segments below that are not applicable to the Profile Type.

### Patch Management
- Desktop maintenance reminder Procedure is scheduled on Every week on Tuesday at 10 AM on the machine time zone with skip if offline.
- Patch windows automatic update: Workstations: Every Week on Tuesday at 10:00 PM as per the machine time zone with Skip if offline and the distribution hours is 2 hours.
- Patch reboot action as below: If user logged in ask permission. Do nothing if no response in 60 minutes. Reboot if user not logged in.
- Patch Windows Automatic Update is disabled.













