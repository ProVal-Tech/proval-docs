---
id: '4bc9f814-a738-4d8a-9c25-ae7e6b6d24f4'
slug: /4bc9f814-a738-4d8a-9c25-ae7e6b6d24f4
title: 'Disable Inactive AD Users'
title_meta: 'Disable Inactive AD Users'
keywords: ['inactive', 'users', 'active directory', 'user management']
description: 'This internal monitor detect the online AD Infrastructure Server where the "pvl_ad_inactive_users" has an enabled users list over threshold and are not excluded.'
tags: ['active-directory', 'accounts']
draft: false
unlisted: false
---

## Summary

This internal monitor detect the online AD Infrastructure Server where the [Table - pvl_ad_inactive_users](/docs/2b118df6-1fef-4530-9303-0bb56c478361) has an enabled users list over threshold and are not excluded.


## Dependencies

- [Script - Disable - Inactive AD Users - X Days](/docs/b793791e-2305-4ac5-ace3-b5737368190e)
- **Alert Template:** `△ Custom - Execute Script - Disable Inactive AD Users`
- [Table - pvl_ad_inactive_users](/docs/2b118df6-1fef-4530-9303-0bb56c478361)
- [Solution - Inactive AD Users Disable/Enable](/docs/d93ff68b-9515-4d4c-bfa4-ff551b3eac37)

## Target

- AD Infrastructure Master Server

## Implementation

- Import the monitor `ProVal Production - Detect Inactive Disabled AD Users`.
- Ensure the - [Script - Disable - Inactive AD Users - X Days](/docs/b793791e-2305-4ac5-ace3-b5737368190e) is imported.
- Import the  `Alert Template - △ Custom - Execute Script - Disable Inactive AD Users`

- Apply the alert template `△ Custom - Execute Script - Disable Inactive AD Users` to the monitor that calls the [Script - Disable - Inactive AD Users - X Days](/docs/b793791e-2305-4ac5-ace3-b5737368190e) to disable the detected accounts.