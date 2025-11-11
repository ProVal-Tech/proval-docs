---
id: 'd93ff68b-9515-4d4c-bfa4-ff551b3eac37'
slug: /d93ff68b-9515-4d4c-bfa4-ff551b3eac37
title: 'Inactive AD Users Disable/Enable'
title_meta: 'Inactive AD Users Disable/Enable'
keywords: ['Inactive', 'Users', 'Active Directory', 'User Management']
description: 'This solution stores information about the inactive AD users and performs actions to disable or enable them using automation.'
tags: ['active-directory', 'accounts']
draft: false
unlisted: false
---

## Purpose

This solution stores information about the inactive AD users and performs actions to disable or enable them using automation.

## Associated Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [Script - Disable - AD Inactive Users - X Days](/docs/b793791e-2305-4ac5-ace3-b5737368190e) | Script | This script detects the inactive users over X days and disables them, and records the data into the [Table - pvl_ad_inactive_users](/docs/2b118df6-1fef-4530-9303-0bb56c478361) so that it can be represented in a [Dataview - AD Inactive Users Audit](/docs/9c9888a7-678a-497f-8f61-11e21e020999). |
| [Script - Enable - Inactive Disabled AD Users - X Days](/docs/7694a01e-f449-40e0-8982-0c351509257a) | Script | This script enables the inactive users that are not logged in for over X days. |
| [Monitor - Detect Inactive Disabled AD Users](/docs/f83e24ad-91fb-46e7-bc93-51e99e1c7f16) | Internal Monitor | This internal monitor is scheduled to run every 6 hours and will detect the online domain controllers where the client-EDF `Enable Inactive Disabled AD Users` is checked and the exclusion location/computers EDFs `Exclude Enabling Inactive AD Users` are not checked. |
| [Monitor - AD Inactive Users - Detection](/docs/0e776272-5ec0-4693-962b-38b97cd06cb9) | Remote Monitor | This remote monitor detects inactive AD Users over 90 days. |
| [Dataview - AD Inactive Users Audit](/docs/9c9888a7-678a-497f-8f61-11e21e020999) | Dataview | This dataview stores the data of the user's audit that was stored in the [Table - pvl_ad_inactive_users](/docs/2b118df6-1fef-4530-9303-0bb56c478361) which collects information of inactive AD user's enabled via [Script - Enable - Inactive Disabled AD Users - X Days](/docs/7694a01e-f449-40e0-8982-0c351509257a) or disabled via [Script - Disable - AD Inactive Users - X Days](/docs/b793791e-2305-4ac5-ace3-b5737368190e) status |
| `Alert Template - △ Custom - Execute Script - Activate Disabled AD Users` | Alert Template | This alert template calls the [Script - Enable - Inactive Disabled AD Users - X Days](/docs/7694a01e-f449-40e0-8982-0c351509257a) to enable the detected accounts via internal monitor [Monitor - Detect Inactive Disabled AD Users](/docs/f83e24ad-91fb-46e7-bc93-51e99e1c7f16) |
| `Alert Template - △ Custom - Execute Script - Disable Inactive AD Users` | Alert Template | This alert template calls the [Script - Disable - AD Inactive Users - X Days](/docs/b793791e-2305-4ac5-ace3-b5737368190e) to disable inactive account above 90 days detected by the remote monitor [Monitor - AD Inactive Users - Detection](/docs/0e776272-5ec0-4693-962b-38b97cd06cb9) |
| [Table - pvl_ad_inactive_users](/docs/2b118df6-1fef-4530-9303-0bb56c478361) | Custom Table | This table stores the data of the inactive users above the threshold. It collects information about the inactive user's accounts, enabling and disabling using scripts [Script - Enable - Inactive Disabled AD Users - X Days](/docs/7694a01e-f449-40e0-8982-0c351509257a) and [Script - Disable - AD Inactive Users - X Days](/docs/b793791e-2305-4ac5-ace3-b5737368190e) respectively. |

## Implementation

### Disable inactive AD account

- Import the [Script - Disable - AD Inactive Users - X Days](/docs/b793791e-2305-4ac5-ace3-b5737368190e)

It is needed to run this script during import with `SetEnvironment` = 1, to create the [Table - pvl_ad_inactive_users](/docs/2b118df6-1fef-4530-9303-0bb56c478361) and import the required EDFs. Refer to the [Script - Disable - AD Inactive Users - X Days](/docs/b793791e-2305-4ac5-ace3-b5737368190e) for a sample run demonstration and also check on how the EDFs are used.
- Import the remote monitor [Monitor - AD Inactive Users - Detection](/docs/0e776272-5ec0-4693-962b-38b97cd06cb9)
- Import the `Alert Template - △ Custom - Execute Script - Disable Inactive AD Users`
- Apply the `Alert Template - △ Custom - Execute Script - Disable Inactive AD Users` to the remote monitor [Monitor - AD Inactive Users - Detection](/docs/0e776272-5ec0-4693-962b-38b97cd06cb9) so that it can disable the inactive accounts on the detected agents using [Script - Disable - AD Inactive Users - X Days](/docs/b793791e-2305-4ac5-ace3-b5737368190e)
- Import the [Dataview - AD Inactive Users Audit](/docs/9c9888a7-678a-497f-8f61-11e21e020999)

### Enable inactive disabled AD account

- Import the [Script - Enable - Inactive Disabled AD Users - X Days](/docs/7694a01e-f449-40e0-8982-0c351509257a)

Set this to 1 during import to ensure the custom table [Table - pvl_ad_inactive_users](/docs/2b118df6-1fef-4530-9303-0bb56c478361) and [Monitor - AD Inactive Users - Detection](/docs/0e776272-5ec0-4693-962b-38b97cd06cb9) are created for the domain controller group with `Default - Do Nothing` template
- Import the internal monitor [Monitor - Detect Inactive Disabled AD Users](/docs/f83e24ad-91fb-46e7-bc93-51e99e1c7f16)
- Import the `Alert Template - △ Custom - Execute Script - Activate Disabled AD Users`
- Apply the `Alert Template - △ Custom - Execute Script - Activate Disabled AD Users` to the internal monitor [Monitor - Detect Inactive Disabled AD Users](/docs/f83e24ad-91fb-46e7-bc93-51e99e1c7f16) so that it can enable the AD inactive disabled accounts of the detected agents using [Script - Enable - Inactive Disabled AD Users - X Days](/docs/7694a01e-f449-40e0-8982-0c351509257a)
- Import the [Dataview - AD Inactive Users Audit](/docs/9c9888a7-678a-497f-8f61-11e21e020999)