---
id: '7694a01e-f449-40e0-8982-0c351509257a'
slug: /7694a01e-f449-40e0-8982-0c351509257a
title: 'Enable - Inactive Disabled AD Users - X Days'
title_meta: 'Enable - Inactive Disabled AD Users - X Days'
keywords: ['inactive', 'users', 'active directory', 'user management']
description: 'This script enables the inactive users that are not logged in for over X days.'
tags: ['active-directory', 'accounts']
draft: false
unlisted: false
---

## Summary

This script enables the inactive users that are not logged in for over X days.

## Sample Run

- It is needed to run this script initially with a value of 1 to create the [Table - pvl_ad_inactive_users](/docs/2b118df6-1fef-4530-9303-0bb56c478361) and import the required EDFs. 
![Sample Run](../../../static/img/docs/d4dc0325-d6ed-4fc3-8f7e-41632b5bc3f3/image15.webp)

- If set to `All`, all inactive disabled users exceeding the `Threshold_Days` will be enabled
![Sample Run](../../../static/img/docs/d4dc0325-d6ed-4fc3-8f7e-41632b5bc3f3/image12.webp)

- If it is set to some specific user's name, e.g., `Demo,Test,TestUser`, then it will enable only the provided users.  
![Sample Run](../../../static/img/docs/d4dc0325-d6ed-4fc3-8f7e-41632b5bc3f3/image13.webp)

- If it is left `blank`, then it will enable all the disabled users that are disabled via [Script - Disable - AD Inactive Users - X Days](/docs/b793791e-2305-4ac5-ace3-b5737368190e)  
![Sample Run](../../../static/img/docs/d4dc0325-d6ed-4fc3-8f7e-41632b5bc3f3/image14.webp)

## File Hash

| Path | Algorithm | Hash |
| --- | --- | --- |
| `C:\ProgramData\_automation\script\Inactive_ADUsers\Activate_DisabledADUser.ps1` | MD5 | `D443303DAD60C3553E456430FB283849` |
| `C:\ProgramData\_automation\script\Inactive_ADUsers\Activate_DisabledADUser.ps1` | SHA256 | `E6D3EA2A1320E07F8E0F18F1375CF23320184C996B0E76B1CD899A9E899CA269` |

## EDFs

| Name           | Level  | Type  | Tab | Description             |
|-----------------|--------|--------|----------|-----------------------------------------------------------------------|
| Exclude AD Inactive UserList | Client | Text | Automation | This accepts the user list that is required to be excluded from the disable/enable of inactive AD users on the client. ![EDF](../../../static/img/docs/d4dc0325-d6ed-4fc3-8f7e-41632b5bc3f3/image4.webp) |
| Exclude AD Inactive UserList | Location | Text | Automation | This accepts the user list that is required to be excluded from the disable/enable of inactive AD users on the location. ![EDF](../../../static/img/docs/d4dc0325-d6ed-4fc3-8f7e-41632b5bc3f3/image5.webp) |
| Enable Inactive Disabled AD Users | Client | Checkbox | Automation | This will enable the inactive disabled users of the client's agents. ![EDF](../../../static/img/docs/d4dc0325-d6ed-4fc3-8f7e-41632b5bc3f3/image7.webp) |
| Exclude Enabling Inactive AD Users | Location | Checkbox | Exclusions | This will exclude the enabling of inactive AD users for the location's agents. ![EDF](../../../static/img/docs/d4dc0325-d6ed-4fc3-8f7e-41632b5bc3f3/image8.webp) |
| Exclude Enabling Inactive AD Users | Computer | Checkbox | Exclusions | This will exclude the enabling of the inactive disabled users of the agent. ![EDF](../../../static/img/docs/d4dc0325-d6ed-4fc3-8f7e-41632b5bc3f3/image9.webp) |

## Dependencies

[Solution- Inactive AD Users Disable/Enable](/docs/d93ff68b-9515-4d4c-bfa4-ff551b3eac37)

### User Parameters

| **Name**    | **Example**                | **Required** | **Description**                                                                                                                                                                                                 |
|-------------|----------------------------|--------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `SetEnvironment` | 1 | False | It is needed to run this script initially with a value of 1 to create the [Table - pvl_ad_inactive_users](/docs/2b118df6-1fef-4530-9303-0bb56c478361) and import the required EDFs. |
| `UserList`  | `test,demo,testuser`      | False        | To run with autofix using the internal monitor, `UserList` does not need to be set. If the script runs `on demand`, then if: <br /> (i) `UserList` = `All` → Enables all inactive, disabled users exceeding `Threshold_Days`. <br /> (ii) `UserList` = `Demo,Test,TestUser` → Enables only the specified users. <br /> (iii) `UserList` left `blank` → Enables all disabled users that were disabled via [Script - Disable - AD Inactive Users - X Days](/docs/b793791e-2305-4ac5-ace3-b5737368190e) |


## Global Parameters

| Name          | Example                                                                                   | Required | Description                                                       |
|---------------|-------------------------------------------------------------------------------------------|----------|-------------------------------------------------------------------|
| Threshold_Days     | 90 | True     |  It defines the number of days since the user wasn't logged in to the domain environment.                                             |
| ExcludeList     | demo,test,testuser | False     |  This will exclude the users from being included in the list to get enabled. The user's list should be provided in a comma-separated format. e.g., John,Kevin,demo.                                             |


## Process

This script enables the inactive users that are not logged in for over X days.

**UserList:** If set to `All`, then all inactive, disabled users exceeding the `Threshold_Days` will be enabled.

**NOTE:** To run the script as an autofix with the internal monitor, the `UserList` does not need to be set.

If the script runs on demand, then there are options:

If it is set to some specific user's name, e.g., `Demo,Test,TestUser`, then it will enable only the provided users.

- If it is left `blank`, then it will enable all the disabled users that are disabled via [Script - Disable - AD Inactive Users - X Days](/docs/b793791e-2305-4ac5-ace3-b5737368190e)

    - Here X = `Threshold_Days` set in the Global Parameter.
This script excludes the default account `Administrator|Guest|krbtgt|DefaultAccount|.*\$`.

        Here, `*\$` meant any user that has $ in its name end.

    For e.g. ``Computername$`` ``UserName$``

The script also excludes users that are stored in the `Exclude AD Inactive UserList` EDFs at the client/location level.

It works as follows:

1) If the Script `ExcludeList` is provided and the Location EDF `Exclude AD Inactive UserList` is set with the users, then the script will exclude the `Excludelist` `+` `Exclude AD Inactive UserList` Location EDF list.

2) If the Script `ExcludeList` is provided and the Client EDF `Exclude AD Inactive UserList` is set with the users and the location EDF `Exclude AD Inactive UserList` is empty, then the script will exclude the users list of `Excludelist` `+` `Exclude AD Inactive UserList` Client EDF list.

3)  If the Script `ExcludeList` is empty and the location EDF is set, then the Location EDF list will be excluded.

4) If the Script `ExcludeList` is empty and the location EDF `Exclude AD Inactive UserList` is empty too, and only the Client EDF `Exclude AD Inactive UserList` is set, then the Client EDF `Exclude AD Inactive UserList` list of users will be excluded.

5) If Script `ExcludeList` has user lists and the EDFs at the location/client level `Exclude AD Inactive UserList` is empty, then the script `ExcludeList` will be accepted for the exclusion.


## Output

- [Table - pvl_ad_inactive_users](/docs/2b118df6-1fef-4530-9303-0bb56c478361)
- [Dataview - AD Inactive Users Audit](/docs/9c9888a7-678a-497f-8f61-11e21e020999)
- Output