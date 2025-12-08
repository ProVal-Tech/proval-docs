---
id: '9c9888a7-678a-497f-8f61-11e21e020999'
slug: /9c9888a7-678a-497f-8f61-11e21e020999
title: 'Inactive AD Users Audit'
title_meta: 'Inactive AD Users Audit'
keywords: ['inactive', 'users', 'active directory', 'user management']
description: 'This dataview stores the data of the users that were either disabled via script "Disable - AD Inactive Users - X Days" or enabled via script "Enable - Inactive Disabled AD Users - X Days"'
tags: ['active-directory', 'accounts']
draft: false
unlisted: false
---

## Summary

This dataview displays the data gathered by the script [Audit - Inactive AD Users - X Days](/docs/cd2a8419-a43c-46ea-ba52-8b9b6c0a01fa) and also the details of the users that was either enabled via [Script - Enable - Inactive Disabled AD Users - X Days](/docs/7694a01e-f449-40e0-8982-0c351509257a) or disabled via [Script - Disable - Inactive AD Users - X Days](/docs/b793791e-2305-4ac5-ace3-b5737368190e).

## Dependencies

- [Audit - Inactive AD Users - X Days](/docs/cd2a8419-a43c-46ea-ba52-8b9b6c0a01fa)
- [Script - Enable - Inactive Disabled AD Users - X Days](/docs/7694a01e-f449-40e0-8982-0c351509257a)
- [Script - Disable - Inactive AD Users - X Days](/docs/b793791e-2305-4ac5-ace3-b5737368190e)
- [Table - pvl_ad_inactive_users](/docs/2b118df6-1fef-4530-9303-0bb56c478361)
- [Solution- Inactive AD Users Disable/Enable](/docs/d93ff68b-9515-4d4c-bfa4-ff551b3eac37)

## Columns

| Column | Description |
| ------ | ----------- |
| Client       |  Client name of the agent |
| Location | Location name of the agent |
| Computer | Computer Name of the agent |
| Operating System | Operating system name of the agent |
| LastContact | Last contact information of the agent with the CW Automate tool |
| UserName | AD SamAccount name of the users that are inactive for more than X days |
| UserSID | AD SID of the users that are inactive for more than X days |
| LastLogonDate | AD inactive user last login date in the domain environment |
| User Enabled | AD inactive user status, whether enabled or disabled |
| IsExcluded | AD inactive user status, whether user is excluded from getting disabled or not |
| User Status Change | AD inactive user status change to enabled or disabled using [Script - Enable - Inactive Disabled AD Users - X Days](/docs/7694a01e-f449-40e0-8982-0c351509257a) and [Script - Disable - Inactive AD Users - X Days](/docs/b793791e-2305-4ac5-ace3-b5737368190e) respectively|
| DistinguishedName | It stores the inactive user's uniquely identifying information that is an entry within a directory service |
| ScriptRanDate | This has the information of the last script run date when the information was collected via [Script - Enable - Inactive Disabled AD Users - X Days](/docs/7694a01e-f449-40e0-8982-0c351509257a) and [Script - Disable -  Inactive AD Users - X Days](/docs/b793791e-2305-4ac5-ace3-b5737368190e) |