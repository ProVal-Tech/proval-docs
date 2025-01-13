---
id: 'cwa-organization-level-patch-policy-for-servers'
title: 'Organization Level Patch Policy for Servers'
title_meta: 'Organization Level Patch Policy for Servers'
keywords: ['patch', 'policy', 'servers', 'management', 'windows', 'reboot']
description: 'This document outlines the organization-level patch policy for servers, detailing the configuration for patch management, including the scheduling of updates and reboot actions. It emphasizes the disabling of Windows Automatic Update and the conditions under which server reboots occur.'
tags: ['patch', 'management', 'windows', 'reboot', 'configuration']
draft: true
unlisted: true
---
# Summary

We have created an organization-level patch policy for Servers and its purpose is to Patch & reboot the servers. Windows Automatic Update is disabled on this policy.

# Profile Module

Patch Management

# Dependencies

None

# Profile Type

What type of profile has been created? Includes the following:

- Patch Management Profiles

# Profile Details

Provide the configuration of the profile, using the following templates based on profile Type. Remove any segments below that are not applicable to the Profile Type.

### Patch Management

- Patch windows automatic update: Servers: Every Week on Saturday at 10:30 PM as per the machine time zone with Skip if offline and the distribution hours is 1 hour.
- Patch reboot action as below: If user logged in ask permission. Do nothing if no response in 15 minutes. Reboot if user not logged in.
- Patch Windows Automatic Update is disabled.



