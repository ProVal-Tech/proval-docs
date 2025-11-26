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
| [Audit - Inactive AD Users - X Days](/docs/cd2a8419-a43c-46ea-ba52-8b9b6c0a01fa) | Script | This script detects the inactive users over `Inactive_AD_Users_Threshold_Days` days and records the data into the [Table - pvl_ad_inactive_users](/docs/2b118df6-1fef-4530-9303-0bb56c478361) so that it can be represented in a [Dataview - AD Inactive Users Audit](/docs/9c9888a7-678a-497f-8f61-11e21e020999). |
| [Disable - AD Inactive Users - X Days](/docs/b793791e-2305-4ac5-ace3-b5737368190e) | Script | This script detects the inactive users over `Inactive_AD_Users_Threshold_Days` days and disables them.    |
| [Enable - Inactive Disabled AD Users - X Days](/docs/7694a01e-f449-40e0-8982-0c351509257a) | Script | This script enables the inactive users that are not logged in for over `Inactive_AD_Users_Threshold_Days` days. |
| [Audit Inactive AD Users](/docs/4416d8f0-fa01-4121-9611-bb21b64c1705) | Internal Monitor | This internal monitor detect the online AD Infrastructure Master Server where the client EDF `Audit Inactive AD Users` is enabled for Auditing and runs the script [Audit - Inactive AD Users - X Days](/docs/cd2a8419-a43c-46ea-ba52-8b9b6c0a01fa).|
| [Disable Inactive AD Users](/docs/4bc9f814-a738-4d8a-9c25-ae7e6b6d24f4) | Internal Monitor | This internal monitor detects the online AD Infrastructure Master Server where the [Table - pvl_ad_inactive_users](/docs/2b118df6-1fef-4530-9303-0bb56c478361) has an enabled users list over threshold and are not excluded. |
| [Enable Inactive Disabled AD Users](/docs/f83e24ad-91fb-46e7-bc93-51e99e1c7f16) | Internal Monitor | This internal monitor detects the online AD Infrastructure Master servers where the client-EDF `Enable Inactive Disabled AD Users` is enabled. It only targets servers that have a disabled users list in [Table - pvl_ad_inactive_users](/docs/2b118df6-1fef-4530-9303-0bb56c478361) and enables those accounts.|
| [pvl_ad_inactive_users](/docs/2b118df6-1fef-4530-9303-0bb56c478361) | Custom Table | This table stores the data of the inactive users above the threshold. It also collects information about the inactive users that were enabled or disabled using scripts [Enable - Inactive Disabled AD Users - X Days](/docs/7694a01e-f449-40e0-8982-0c351509257a) and [Disable - AD Inactive Users - X Days](/docs/b793791e-2305-4ac5-ace3-b5737368190e) respectively. |
| [AD Inactive Users Audit](/docs/9c9888a7-678a-497f-8f61-11e21e020999) | Dataview | This dataview displays the audit data that was stored in the [Table - pvl_ad_inactive_users](/docs/2b118df6-1fef-4530-9303-0bb56c478361) . |
| `△ Custom - Execute Script - Audit Inactive AD Users` | Alert Template | This alert template calls the [Script - Audit - Inactive AD Users - X Days](/docs/cd2a8419-a43c-46ea-ba52-8b9b6c0a01fa) to audit the inactive account above X days detected by the internal monitor [Audit Inactive AD Users](/docs/4416d8f0-fa01-4121-9611-bb21b64c1705) |
| `△ Custom - Execute Script - Disable Inactive AD Users` | Alert Template | This alert template calls the [Script - Disable - AD Inactive Users - X Days](/docs/b793791e-2305-4ac5-ace3-b5737368190e) to disable inactive account above X days detected by the internal monitor [Disable Inactive AD Users](/docs/4bc9f814-a738-4d8a-9c25-ae7e6b6d24f4) |
| `△ Custom - Execute Script - Activate Disabled AD Users` | Alert Template | This alert template calls the [Script - Enable - Inactive Disabled AD Users - X Days](/docs/7694a01e-f449-40e0-8982-0c351509257a) to enable the detected accounts via internal monitor [Enable Inactive Disabled AD Users](/docs/f83e24ad-91fb-46e7-bc93-51e99e1c7f16) |


## Implementation

### Audit inactive AD account

- Import the script [Audit - Inactive AD Users - X Days](/docs/cd2a8419-a43c-46ea-ba52-8b9b6c0a01fa). It is needed to run this script during import with `SetEnvironment` = 1, to create the [Table - pvl_ad_inactive_users](/docs/2b118df6-1fef-4530-9303-0bb56c478361), import the required EDFs, and import the required system properties `Inactive_AD_Users_Threshold_Days`. Refer to the [Audit - Inactive AD Users - X Days](/docs/cd2a8419-a43c-46ea-ba52-8b9b6c0a01fa) for a sample run demonstration and also check on how the EDFs are used.
- Import the [Monitor - Audit Inactive AD Users](/docs/4416d8f0-fa01-4121-9611-bb21b64c1705)
- Import the `Alert Template - △ Custom - Execute Script - Audit Inactive AD Users`
- Import the [Dataview - AD Inactive Users Audit](/docs/9c9888a7-678a-497f-8f61-11e21e020999)
- Reload the System Cache.
- Apply the `Alert Template - △ Custom - Execute Script - Audit Inactive AD Users` to the [Monitor - Audit Inactive AD Users](/docs/4416d8f0-fa01-4121-9611-bb21b64c1705) and save it.
- Run now and reset the monitor.

### Disable inactive AD account

- Import the [Script - Disable - AD Inactive Users - X Days](/docs/b793791e-2305-4ac5-ace3-b5737368190e)
- Import the [Monitor - Disable Inactive AD Users](/docs/4bc9f814-a738-4d8a-9c25-ae7e6b6d24f4) 
- Import the `Alert Template - △ Custom - Execute Script - Disable Inactive AD Users`
- Reload the System Cache.
- Apply the `Alert Template - △ Custom - Execute Script - Disable Inactive AD Users` to the [Monitor - Disable Inactive AD Users](/docs/4bc9f814-a738-4d8a-9c25-ae7e6b6d24f4)
- Run now and reset the monitor.

### Enable inactive disabled AD account

- Import the [Script - Enable - Inactive Disabled AD Users - X Days](/docs/7694a01e-f449-40e0-8982-0c351509257a)
- Import the [Monitor - Enable Inactive Disabled AD Users](/docs/f83e24ad-91fb-46e7-bc93-51e99e1c7f16)
- Import the `Alert Template - △ Custom - Execute Script - Activate Disabled AD Users`
- Reload the System Cache.
- Apply the `Alert Template - △ Custom - Execute Script - Activate Disabled AD Users` to the internal monitor [Monitor - Enable Inactive Disabled AD Users](/docs/f83e24ad-91fb-46e7-bc93-51e99e1c7f16)
- Run now and reset the monitor.