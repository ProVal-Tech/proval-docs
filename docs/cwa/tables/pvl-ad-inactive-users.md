---
id: '2b118df6-1fef-4530-9303-0bb56c478361'
slug: /2b118df6-1fef-4530-9303-0bb56c478361
title: 'pvl_ad_inactive_users'
title_meta: 'pvl_ad_inactive_users'
keywords: ['Inactive', 'Users', 'Active Directory', 'User Management']
description: 'This table stores the data of the inactive users above threshold'
tags: ['active-directory', 'accounts']
draft: false
unlisted: false
---

## Purpose

This table stores the data of the inactive users above the threshold. It collects information about the inactive user's accounts, enabling and disabling using scripts [Script - Enable - Inactive Disabled AD Users - X Days](/docs/7694a01e-f449-40e0-8982-0c351509257a) and [Script - Disable - AD Inactive Users - X Days](/docs/b793791e-2305-4ac5-ace3-b5737368190e) respectively.

## Dependencies

[Script - Enable - Inactive Disabled AD Users - X Days](/docs/7694a01e-f449-40e0-8982-0c351509257a)

[Script - Disable - AD Inactive Users - X Days](/docs/b793791e-2305-4ac5-ace3-b5737368190e)

[Solution- Inactive AD Users Disable/Enable](/docs/d93ff68b-9515-4d4c-bfa4-ff551b3eac37)

## Tables

pvl_ad_inactive_users

### pvl_ad_inactive_users

| Column | Type | Explanation |
| ------ | ---- | ----------- |
| Computerid | Int | Computerid of the agent |
| UserName | VARCHAR | Inactive username information that hasn't logged in above X days |
| UserSID | VARCHAR | Inactive user SID information that hasn't logged in above X days |
| LastLogonDate | DATETIME | User's last login date in the domain environment |
| DistinguishedName | VARCHAR | It stores the inactive user's uniquely identifying information that is an entry within a directory service |
| Enabled | VARCHAR | It stores the information about the inactive user's state, whether it is enabled or disabled |
| UserStatus | VARCHAR | It contains the information of each inactive user where the script disabled or enabled it using scripts [Script - Enable - Inactive Disabled AD Users - X Days](/docs/7694a01e-f449-40e0-8982-0c351509257a) and [Script - Disable - AD Inactive Users - X Days](/docs/b793791e-2305-4ac5-ace3-b5737368190e) respectively |
| ScriptRanDate | DATETIME | This has the information of the last script run date when the information was collected via scripts  [Script - Enable - Inactive Disabled AD Users - X Days](/docs/7694a01e-f449-40e0-8982-0c351509257a) and [Script - Disable - AD Inactive Users - X Days](/docs/b793791e-2305-4ac5-ace3-b5737368190e)|
