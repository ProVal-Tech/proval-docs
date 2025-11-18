---
id: 'cd2a8419-a43c-46ea-ba52-8b9b6c0a01fa'
slug: /cd2a8419-a43c-46ea-ba52-8b9b6c0a01fa
title: 'Audit - Inactive AD Users - X Days'
title_meta: 'Audit - Inactive AD Users - X Days'
keywords: ['inactive', 'users', 'active directory', 'user management']
description: 'This script detects the inactive users over X days and records the data into the custom table so that it can be represented in a dataview.'
tags: ['active-directory', 'accounts']
draft: false
unlisted: false
---

## Summary

This script detects the inactive users over X days and records the data into the [Table - pvl_ad_inactive_users](/docs/2b118df6-1fef-4530-9303-0bb56c478361) so that it can be represented in a [Dataview - AD Inactive Users Audit](/docs/9c9888a7-678a-497f-8f61-11e21e020999).

## Sample Run

- It is needed to run this script initially with a value of 1 to create the [Table - pvl_ad_inactive_users](/docs/2b118df6-1fef-4530-9303-0bb56c478361), import the required EDFs, and the system property. 
![Sample Run](../../../static/img/docs/d4dc0325-d6ed-4fc3-8f7e-41632b5bc3f3/image20.webp)

- Run normally to fetch the inactive AD users over threshold   
![Sample Run 1](../../../static/img/docs/d4dc0325-d6ed-4fc3-8f7e-41632b5bc3f3/image21.webp)

## File Hash

| Path | Algorithm | Hash |
| --- | --- | --- |
| `C:\ProgramData\_automation\script\Inactive_ADUsers\Activate_DisabledADUser.ps1` | MD5 | `43E7E6233A50EF110928128B74864B17` |
| `C:\ProgramData\_automation\script\Inactive_ADUsers\Activate_DisabledADUser.ps1` | SHA256 | `6C50479A488EC55984441A24580AA82CBC6311CEB02A3D025FF14E188116A93B` |

## EDFs

| Name           | Level  | Type  | Tab | Description             |
|-----------------|--------|--------|----------|-----------------------------------------------------------------------|
| Exclude AD Inactive UserList | Client | Text | Automation | This accepts the user list that is required to be excluded from the disabling of inactive AD users of the client domain. ![EDF](../../../static/img/docs/d4dc0325-d6ed-4fc3-8f7e-41632b5bc3f3/image4.webp) |
| Enable Inactive Disabled AD Users | Client | Checkbox | Automation | This will enable the inactive disabled users of the clients domain. ![EDF](../../../static/img/docs/d4dc0325-d6ed-4fc3-8f7e-41632b5bc3f3/image7.webp) |
| Audit Inactive AD Users | Client | Checkbox | Automation | This enable the auditing of the Inactive AD Users of the client domain. ![EDF](../../../static/img/docs/d4dc0325-d6ed-4fc3-8f7e-41632b5bc3f3/image22.webp) |

## System Property

| Name           | Level                   | Description      |
|---------------------------------|--------| ----------------------------------- |
| Inactive_AD_Users_Threshold_Days | 90 | This is set to detect the inactive users those are not logged in from the provided days. ![Property](../../../static/img/docs/d4dc0325-d6ed-4fc3-8f7e-41632b5bc3f3/image23.webp) |

## Dependencies

[Solution- Inactive AD Users Disable/Enable](/docs/d93ff68b-9515-4d4c-bfa4-ff551b3eac37)

### User Parameters

| **Name**    | **Example**                | **Required** | **Description**                                                                                                                                                                                                 |
|-------------|----------------------------|--------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `SetEnvironment` | 1 | False | It is needed to run this script initially with a value of 1 to create the [Table - pvl_ad_inactive_users](/docs/2b118df6-1fef-4530-9303-0bb56c478361), import the required EDFs, and the system property. |


## Global Parameters

| Name          | Example                                                                                   | Required | Description                                                       |
|---------------|-------------------------------------------------------------------------------------------|----------|-------------------------------------------------------------------|
| ExcludeList     | demo,test,testuser | False     |  This will exclude the users from being included in the list to get disabled. The user's list should be provided in a comma-separated format. e.g., John,Kevin,demo.                                             |


## Process

This script audits the AD inactive users that are not logged in for over value provided in the system properties `Inactive_AD_Users_Threshold_Days` days.


## Output

- [Table - pvl_ad_inactive_users](/docs/2b118df6-1fef-4530-9303-0bb56c478361)
- [Dataview - AD Inactive Users Audit](/docs/9c9888a7-678a-497f-8f61-11e21e020999)
- Output