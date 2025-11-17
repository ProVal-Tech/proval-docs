---
id: 'd93ff68b-9515-4d4c-bfa4-ff551b3eac37'
slug: /d93ff68b-9515-4d4c-bfa4-ff551b3eac37
title: 'Inactive AD Users Disable/Enable'
title_meta: 'Inactive AD Users Disable/Enable'
keywords: ['inactive', 'users', 'active directory', 'user management']
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
| [Disable - AD Inactive Users - X Days](/docs/b793791e-2305-4ac5-ace3-b5737368190e) | Script | This script detects the inactive users over X days and disables them, and records the data into the [Table - pvl_ad_inactive_users](/docs/2b118df6-1fef-4530-9303-0bb56c478361) so that it can be represented in a [Dataview - AD Inactive Users Audit](/docs/9c9888a7-678a-497f-8f61-11e21e020999) |
| [Enable - Inactive Disabled AD Users - X Days](/docs/7694a01e-f449-40e0-8982-0c351509257a) | Script | This script enables the inactive users that are not logged in for over X days. |
| [Audit - AD Inactive Users - X Days](/docs/cd2a8419-a43c-46ea-ba52-8b9b6c0a01fa) | Script | This script detects the inactive users over X days and records the data into the [Table - pvl_ad_inactive_users](/docs/2b118df6-1fef-4530-9303-0bb56c478361) so that it can be represented in a [Dataview - AD Inactive Users Audit](/docs/9c9888a7-678a-497f-8f61-11e21e020999). |
| [Disable Inactive AD Users](/docs/f83e24ad-91fb-46e7-bc93-51e99e1c7f16) | Internal Monitor | This internal monitor detect the online AD Infrastructure Server where the [Table - pvl_ad_inactive_users](/docs/2b118df6-1fef-4530-9303-0bb56c478361) has an enabled users list over threshold and are not excluded. |
| [Enable Inactive Disabled AD Users](/docs/f83e24ad-91fb-46e7-bc93-51e99e1c7f16) | Internal Monitor | This internal monitor detect the online domain controllers where the client-EDF `Enable Inactive Disabled AD Users` is checked. It also ensures to detect only those AD Infrastructure Master servers where the [Table - pvl_ad_inactive_users](/docs/2b118df6-1fef-4530-9303-0bb56c478361) has a disabled users list. |
| [Audit Inactive AD Users](/docs/4416d8f0-fa01-4121-9611-bb21b64c1705) | Internal Monitor | This internal monitor detect the online AD Infrastructure Server where the client EDF `Audit Inactive AD Users` should be checked for the auditing to be enabled |
| [AD Inactive Users Audit](/docs/9c9888a7-678a-497f-8f61-11e21e020999) | Dataview | This dataview stores the data of the user's audit that was stored in the [Table - pvl_ad_inactive_users](/docs/2b118df6-1fef-4530-9303-0bb56c478361) which collects information of inactive AD user's enabled via [Script - Enable - Inactive Disabled AD Users - X Days](/docs/7694a01e-f449-40e0-8982-0c351509257a) or disabled via [Script - Disable - AD Inactive Users - X Days](/docs/b793791e-2305-4ac5-ace3-b5737368190e) status |
| `△ Custom - Execute Script - Activate Disabled AD Users` | Alert Template | This alert template calls the [Script - Enable - Inactive Disabled AD Users - X Days](/docs/7694a01e-f449-40e0-8982-0c351509257a) to enable the detected accounts via internal monitor [Detect Inactive Disabled AD Users](/docs/f83e24ad-91fb-46e7-bc93-51e99e1c7f16) |
| `△ Custom - Execute Script - Disable Inactive AD Users` | Alert Template | This alert template calls the [Script - Disable - AD Inactive Users - X Days](/docs/b793791e-2305-4ac5-ace3-b5737368190e) to disable inactive account above X days detected by the internal monitor [Disable Inactive AD Users](/docs/f83e24ad-91fb-46e7-bc93-51e99e1c7f16) |
| `△ Custom - Execute Script - Audit Inactive AD Users` | Alert Template | This alert template calls the [Script - Audit - Inactive AD Users - X Days](/docs/cd2a8419-a43c-46ea-ba52-8b9b6c0a01fa) to audit the inactive account above X days detected by the internal monitor [Audit Inactive AD Users](/docs/4416d8f0-fa01-4121-9611-bb21b64c1705) |
| [pvl_ad_inactive_users](/docs/2b118df6-1fef-4530-9303-0bb56c478361) | Custom Table | This table stores the data of the inactive users above the threshold. It collects information about the inactive user's accounts, enabling and disabling using scripts [Enable - Inactive Disabled AD Users - X Days](/docs/7694a01e-f449-40e0-8982-0c351509257a) and [Disable - AD Inactive Users - X Days](/docs/b793791e-2305-4ac5-ace3-b5737368190e) respectively. |

## Implementation

### Audit inactive AD account

- Import the [Script - Audit - AD Inactive Users - X Days](/docs/cd2a8419-a43c-46ea-ba52-8b9b6c0a01fa)
    It is needed to run this script during import with `SetEnvironment` = 1, to create the [Table - pvl_ad_inactive_users](/docs/2b118df6-1fef-4530-9303-0bb56c478361) and import the required EDFs. Refer to the [Script - Audit - AD Inactive Users - X Days](/docs/cd2a8419-a43c-46ea-ba52-8b9b6c0a01fa) for a sample run demonstration and also check on how the EDFs are used.
- Reload the cache
- Import the [Monitor - Audit Inactive AD Users](/docs/4416d8f0-fa01-4121-9611-bb21b64c1705)
- Import the `Alert Template - △ Custom - Execute Script - Audit Inactive AD Users`
- Import the [Dataview - AD Inactive Users Audit](/docs/9c9888a7-678a-497f-8f61-11e21e020999)
- Apply the `Alert Template - △ Custom - Execute Script - Audit Inactive AD Users` to the [Monitor - Audit Inactive AD Users](/docs/4416d8f0-fa01-4121-9611-bb21b64c1705) and save it.
- Run now and reset the monitor.

### Disable inactive AD account

- Import the [Script - Disable - AD Inactive Users - X Days](/docs/b793791e-2305-4ac5-ace3-b5737368190e)
- Import the [Monitor - Disable Inactive AD Users](/docs/f83e24ad-91fb-46e7-bc93-51e99e1c7f16) 
- Import the `Alert Template - △ Custom - Execute Script - Disable Inactive AD Users`
- Apply the `Alert Template - △ Custom - Execute Script - Disable Inactive AD Users` to the [Monitor - Disable Inactive AD Users](/docs/f83e24ad-91fb-46e7-bc93-51e99e1c7f16)  so that it can disable the inactive accounts on the detected agents using [Script - Disable - AD Inactive Users - X Days](/docs/b793791e-2305-4ac5-ace3-b5737368190e)
- Import the [Dataview - AD Inactive Users Audit](/docs/9c9888a7-678a-497f-8f61-11e21e020999)
- Run now and reset the monitor.
- 
### Enable inactive disabled AD account

- Import the [Script - Enable - Inactive Disabled AD Users - X Days](/docs/7694a01e-f449-40e0-8982-0c351509257a)
- Import the [Monitor - Enable Inactive Disabled AD Users](/docs/f83e24ad-91fb-46e7-bc93-51e99e1c7f16)
- Import the `Alert Template - △ Custom - Execute Script - Activate Disabled AD Users`
- - Import the [Dataview - AD Inactive Users Audit](/docs/9c9888a7-678a-497f-8f61-11e21e020999)
- Apply the `Alert Template - △ Custom - Execute Script - Activate Disabled AD Users` to the internal monitor [Monitor - Enable Inactive Disabled AD Users](/docs/f83e24ad-91fb-46e7-bc93-51e99e1c7f16) so that it can enable the AD inactive disabled accounts of the detected agents using [Script - Enable - Inactive Disabled AD Users - X Days](/docs/7694a01e-f449-40e0-8982-0c351509257a)
- Run now and reset the monitor.