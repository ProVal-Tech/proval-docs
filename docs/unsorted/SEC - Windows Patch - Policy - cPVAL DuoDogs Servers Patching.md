---
id: 'e1f17f96-4dad-40d5-8801-c0d132456ce8'
title: 'SEC - Windows Patch - Policy - cPVAL DuoDogs Servers Patching'
title_meta: 'SEC - Windows Patch - Policy - cPVAL DuoDogs Servers Patching'
keywords: ['patch', 'policy', 'servers', 'management', 'windows', 'reboot']
description: 'This document outlines the organization-level patch policy for servers, detailing the configuration for patch management, including the scheduling of updates and reboot actions. It emphasizes the disabling of Windows Automatic Update and the conditions under which server reboots occur.'
tags: ['reboot', 'windows']
draft: true
unlisted: false
---

# Summary

We have created an organization-level patch policy for servers, and its purpose is to manage patching and rebooting of the servers. Windows Automatic Update is disabled under this policy.

# Profile Module

Patch Management

# Dependencies

None

# Profile Type

What type of profile has been created? It includes the following:

- Patch Management Profiles

# Profile Details

Provide the configuration of the profile using the following templates based on the profile type. Remove any segments below that are not applicable to the profile type.

### Patch Management

- Patch Windows Automatic Update: Servers will be patched every week on Saturday at 10:30 PM according to the machine's time zone, with a "Skip if offline" option and a distribution window of 1 hour.
- Patch reboot action: If a user is logged in, ask for permission. Do nothing if there is no response in 15 minutes. Reboot if the user is not logged in.
- Windows Automatic Update is disabled.
## Attachments
[cPVAL_DuoDogs_Servers_Patching.xml](<..\..\static\attachments\itg\11112364\cPVAL_DuoDogs_Servers_Patching.xml>)
