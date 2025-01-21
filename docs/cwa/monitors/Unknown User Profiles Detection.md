---
id: 'ba7bb64b-e12b-4d21-a86f-572ce95b78d7'
title: 'Unknown User Profiles Detection'
title_meta: 'Unknown User Profiles Detection'
keywords: ['monitor', 'profiles', 'user', 'detection', 'ticketing']
description: 'This document provides an overview of the internal monitor that identifies machines with unknown user profiles. It details the dependencies required for functionality, the target audience, and the alert template for ticket creation when unknown user profiles are detected.'
tags: ['database', 'security', 'ticketing']
draft: false
unlisted: false
---

## Summary

The internal monitor identifies machines that have unknown user profiles. The data is collected by the [User Profile - Get Information](<../scripts/User Profile - Get Information.md>) script.

![Image](../../../static/img/Unknown-User-Profiles-Detection/image_1.png)

**Note:** The internal monitor does not depend on the [Domain Trust Relationship Check](<./Domain Trust Relationship Check.md>) remote monitor. However, it will not detect the machines identified by the [Domain Trust Relationship Check](<./Domain Trust Relationship Check.md>) remote monitor to prevent identifying machines that have a broken trust relationship with the domain. Since the [User Profile - Get Information](<../scripts/User Profile - Get Information.md>) script cannot properly retrieve accounts for these machines, it will add '(Inferred)' to the remote user names.

## Dependencies

- [EPM - Accounts - Script - User Profile - Get Information](<../scripts/User Profile - Get Information.md>)
- [EPM - Accounts - Custom Table - plugin_proval_userprofiles](<../tables/plugin_proval_userprofiles.md>)
- [CWM - Automate - Script - Ticket Creation - Computer](<../scripts/Ticket Creation - Computer.md>)

## Target

Global

## Alert Template

`△ Custom - Ticket Creation - Computer`

## Ticketing

**Subject:** `Unknown User Profiles Detected on %ComputerName%`

**Body:**

```
%FIELDNAME% unknown user profiles detected on %ComputerName%  
Details:  
%RESULT%
```

**%FIELDNAME%:** Number of unknown profiles

**%RESULT%:** Information of unknown profiles.

**Example %RESULT%:**

```
Username: user1 (Inferred)
UserProfile: C:/Users/user1
ProfileSizeMB: 8090
UserSid: S-1-5-21-1327865892-1327865892-1327865892-12106

Username: user2 (Inferred)
UserProfile: C:/Users/user2
ProfileSizeMB: 1237
UserSid: S-1-5-21-1327865892-1327865892-1327865892-1758
```
