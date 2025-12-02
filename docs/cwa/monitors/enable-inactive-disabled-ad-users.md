---
id: 'f83e24ad-91fb-46e7-bc93-51e99e1c7f16'
slug: /f83e24ad-91fb-46e7-bc93-51e99e1c7f16
title: 'Enable Inactive Disabled AD Users'
title_meta: 'Enable Inactive Disabled AD Users'
keywords: ['inactive', 'users', 'active directory', 'user management']
description: 'This internal monitor detect the online domain controllers where the client-EDF "Enable Inactive Disabled AD Users" is checked. It also ensures to detect only those AD Infrastructure Master servers where the "pvl_ad_inactive_users" has a disabled users list.'
tags: ['active-directory', 'accounts']
draft: false
unlisted: false
---

## Summary

This internal monitor detects the AD Infrastructure Master servers where the client-EDF `Enable Inactive Disabled AD Users` is enabled and has a disabled users list in the [Table - pvl_ad_inactive_users](/docs/2b118df6-1fef-4530-9303-0bb56c478361). It then runs the [Script - Enable - Inactive Disabled AD Users - X Days](/docs/7694a01e-f449-40e0-8982-0c351509257a) as an auto-fix to enable the detected accounts.


## Dependencies

- [Script - Enable - Inactive Disabled AD Users - X Days](/docs/7694a01e-f449-40e0-8982-0c351509257a)
- **Alert Template:** `△ Custom - Execute Script - Activate Disabled AD Users`
- [Table - pvl_ad_inactive_users](/docs/2b118df6-1fef-4530-9303-0bb56c478361)
- [Solution - Inactive AD Users Disable/Enable](/docs/d93ff68b-9515-4d4c-bfa4-ff551b3eac37)

## Target

- AD Infrastructure Master Server

## Implementation

- Import the monitor `ProVal Production - Enable Inactive Disabled AD Users`.
- Ensure the [Script - Enable - Inactive Disabled AD Users - X Days](/docs/7694a01e-f449-40e0-8982-0c351509257a) is imported.
- Import the  `Alert Template - △ Custom - Execute Script - Activate Disabled AD Users`
- Enable the client EDF:  
![Enable Inactive Disabled AD Users](../../../static/img/docs/d4dc0325-d6ed-4fc3-8f7e-41632b5bc3f3/image7.webp)  
- Apply the alert template `△ Custom - Execute Script - Activate Disabled AD Users` to the monitor that calls the [Script - Enable - Inactive Disabled AD Users - X Days](/docs/7694a01e-f449-40e0-8982-0c351509257a) to enable the detected accounts.