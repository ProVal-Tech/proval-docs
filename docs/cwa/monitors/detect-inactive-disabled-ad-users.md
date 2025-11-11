---
id: 'f83e24ad-91fb-46e7-bc93-51e99e1c7f16'
slug: /f83e24ad-91fb-46e7-bc93-51e99e1c7f16
title: 'ProVal Production - Detect Inactive Disabled AD Users'
title_meta: 'ProVal Production - Detect Inactive Disabled AD Users'
keywords: ['Inactive', 'Users', 'Active Directory', 'User Management']
description: 'This internal monitor detect the online domain controllers where the client-EDF "Enable Inactive Disabled AD Users" is checked and the exclusion location/computers EDFs "Exclude Enabling Inactive AD Users" are not checked. It also ensures to detect only those domain controller servers where the "pvl_ad_inactive_users" has a disabled users list.'
tags: ['active-directory', 'accounts']
draft: false
unlisted: false
---

## Summary

This internal monitor is scheduled to run every 6 hours and will detect the online domain controllers where the client-EDF `Enable Inactive Disabled AD Users` is checked and the exclusion location/computers EDFs `Exclude Enabling Inactive AD Users` are not checked.

It also ensures to detect only those domain controller servers where the "pvl_ad_inactive_users" has a disabled users list.

## Dependencies

[Script - Enable - Inactive Disabled AD Users - X Days](/docs/7694a01e-f449-40e0-8982-0c351509257a)

`Alert Template - △ Custom - Execute Script - Activate Disabled AD Users`

[Table - pvl_ad_inactive_users](/docs/2b118df6-1fef-4530-9303-0bb56c478361)

[Solution- Inactive AD Users Disable/Enable](/docs/d93ff68b-9515-4d4c-bfa4-ff551b3eac37)

## Target

Domain Controllers Group

## Implementation

- Import the monitor `ProVal Production - Detect Inactive Disabled AD Users`.
- Import the  `Alert Template - △ Custom - Execute Script - Activate Disabled AD Users`
- Enable the EDF ![Enable Inactive Disabled AD Users](../../../static/img/docs/d4dc0325-d6ed-4fc3-8f7e-41632b5bc3f3/image7.webp)
- And make sure to exclude the EDFs `Exclude Enabling Inactive AD Users` at location or computers if required to be part of this monitor detection
![Exclude Enabling Inactive AD Users-Location](../../../static/img/docs/d4dc0325-d6ed-4fc3-8f7e-41632b5bc3f3/image8.webp) and ![Exclude Enabling Inactive AD Users-Computer](../../../static/img/docs/d4dc0325-d6ed-4fc3-8f7e-41632b5bc3f3/image9.webp)
- Apply the `Alert Template - △ Custom - Execute Script - Activate Disabled AD Users` to the monitor that calls the [Script - Enable - Inactive Disabled AD Users - X Days](/docs/7694a01e-f449-40e0-8982-0c351509257a) to enable the detected accounts.