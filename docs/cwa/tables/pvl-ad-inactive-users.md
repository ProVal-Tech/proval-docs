---
id: '2b118df6-1fef-4530-9303-0bb56c478361'
slug: /2b118df6-1fef-4530-9303-0bb56c478361
title: 'pvl_ad_inactive_users'
title_meta: 'pvl_ad_inactive_users'
keywords: ['inactive', 'users', 'active directory', 'user management']
description: 'This table stores the data of the inactive users above threshold'
tags: ['active-directory', 'accounts']
draft: false
unlisted: false
---

## Purpose

This table stores the data of the inactive users above the threshold gathered by the script [Audit - Inactive AD Users - X Days](/docs/cd2a8419-a43c-46ea-ba52-8b9b6c0a01fa). It also collects information about the inactive user accounts that were enabled or disabled using the scripts [Enable - Inactive Disabled AD Users - X Days](/docs/7694a01e-f449-40e0-8982-0c351509257a) and [Disable - Inactive AD Users - X Days](/docs/b793791e-2305-4ac5-ace3-b5737368190e) respectively.

## Dependencies

- [Script - Audit - Inactive AD Users - X Days](/docs/cd2a8419-a43c-46ea-ba52-8b9b6c0a01fa)
- [Script - Enable - Inactive Disabled AD Users - X Days](/docs/7694a01e-f449-40e0-8982-0c351509257a)
- [Script - Disable - Inactive AD Users - X Days](/docs/b793791e-2305-4ac5-ace3-b5737368190e)
- [Solution- Inactive AD Users Disable/Enable](/docs/d93ff68b-9515-4d4c-bfa4-ff551b3eac37)

## Table

- pvl_ad_inactive_users

### pvl_ad_inactive_users

| Column | Type | Explanation |
| ------ | ---- | ----------- |
| Computerid | Int | Computerid of the agent |
| UserName | VARCHAR | Inactive username information that hasn't logged in above X days |
| UserSID | VARCHAR | Inactive user SID information that hasn't logged in above X days |
| LastLogonDate | DATETIME | User's last login date in the domain environment |
| DistinguishedName | VARCHAR | It stores the inactive user's uniquely identifying information that is an entry within a directory service |
| Enabled | VARCHAR | It stores the information about the inactive user's state, whether it is enabled or disabled |
| IsExcluded | VARCHAR | It stores the information of the inactive user's that are excluded or not in the Automate |
| UserStatus | VARCHAR | It contains the information of each inactive user that were disabled or enabled.|
| ScriptRanDate | DATETIME | This has the information of the last script run date when the information was collected via scripts .|
