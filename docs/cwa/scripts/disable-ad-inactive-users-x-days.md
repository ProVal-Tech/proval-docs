---
id: 'b793791e-2305-4ac5-ace3-b5737368190e'
slug: /b793791e-2305-4ac5-ace3-b5737368190e
title: 'Disable - AD Inactive Users - X Days'
title_meta: 'Disable - AD Inactive Users - X Days'
keywords: ['inactive', 'users', 'active directory', 'user management']
description: 'This script detects the inactive users over X days and disables them, and records the data into the custom table so that it can be represented in a dataview.'
tags: ['active-directory', 'accounts']
draft: false
unlisted: false
---

## Summary

This script detects the inactive users over X days and disables them, and records the data into the [Table - pvl_ad_inactive_users](/docs/2b118df6-1fef-4530-9303-0bb56c478361) so that it can be represented in a [Dataview - AD Inactive Users Audit](/docs/9c9888a7-678a-497f-8f61-11e21e020999).

## Sample Run

- Please set it to 1 to create the custom table and required EDFs during the script import so that the solution can work properly  
![Sample Run](../../../static/img/docs/d4dc0325-d6ed-4fc3-8f7e-41632b5bc3f3/image.webp)

- Run normally to disable inactive AD users over threshold   
![Sample Run 1](../../../static/img/docs/d4dc0325-d6ed-4fc3-8f7e-41632b5bc3f3/image2.webp)

## File Hash

| Path | Algorithm | Hash |
| --- | --- | --- |
| `C:\ProgramData\_automation\script\Inactive_ADUsers\Inactive_ADUser.ps1` | MD5 | `437700E0831610DC21C77F2AF7697205` |
| `C:\ProgramData\_automation\script\Inactive_ADUsers\Inactive_ADUser.ps1` | SHA256 | `F44ED5BF2380D9BAC15CD159E2B73ABF3649B652CCC8399925074528EA6BBD8E` |

## Dependencies

[Solution- Inactive AD Users Disable/Enable](/docs/d93ff68b-9515-4d4c-bfa4-ff551b3eac37)

### User Parameters

| Name          | Example                                                                                   | Required | Description                                                       |
|---------------|-------------------------------------------------------------------------------------------|----------|-------------------------------------------------------------------|
| SetEnvironment     | 1 | False     |  It is needed to run this script initially with a value of 1 to create the [Table - pvl_ad_inactive_users](/docs/2b118df6-1fef-4530-9303-0bb56c478361) and import the required EDFs.                                             |

## Global Parameters

| Name          | Example                                                                                   | Required | Description                                                       |
|---------------|-------------------------------------------------------------------------------------------|----------|-------------------------------------------------------------------|
| Threshold_Days     | 90 | True     |  It defines the number of days since the user wasn't logged in to the domain environment.                                             |
| ExcludeList     | demo,test,testuser | False     |  This will exclude the users from being included in the list to get disabled. The user's list should be provided in a comma-separated format. e.g., John,Kevin,demo.                                             |

## EDFs

| Name           | Level  | Type  | Tab | Description             |
|-----------------|--------|--------|----------|-----------------------------------------------------------------------|
| Exclude AD Inactive UserList | Client | Text | Automation | This accepts the user list that is required to be excluded from the disable/enable of inactive AD users on the client. ![EDF](../../../static/img/docs/d4dc0325-d6ed-4fc3-8f7e-41632b5bc3f3/image4.webp) |
| Exclude AD Inactive UserList | Location | Text | Automation | This accepts the user list that is required to be excluded from the disable/enable of inactive AD users on the location. ![EDF](../../../static/img/docs/d4dc0325-d6ed-4fc3-8f7e-41632b5bc3f3/image5.webp) |


## Process

This script detects the inactive users over X days and disables them, and records the data into the [Table - pvl_ad_inactive_users](/docs/2b118df6-1fef-4530-9303-0bb56c478361) so that it can be represented in a [Dataview - AD Inactive Users Audit](/docs/9c9888a7-678a-497f-8f61-11e21e020999).
Here X = `Threshold_Days` set in the Global Parameter.
This script excludes the default account `Administrator|Guest|krbtgt|DefaultAccount|.*\$`.

Here, `*\$` meant any user that has $ its name at the end.

For e.g. ``Computername$`` ``UserName$``

It also excludes users that are stored in the `Exclude AD Inactive UserList` EDFs at client/location level.

It works as follows:

1) If the Script `ExcludeList` is provided and the Location EDF `Exclude AD Inactive UserList` is set with the users, then script will exclude the `Excludelist` `+` `Exclude AD Inactive UserList` Location EDF list.

2) If the Script `ExcludeList` is provided and the Client EDF `Exclude AD Inactive UserList` is set with the users and the location EDF `Exclude AD Inactive UserList` is empty, then script will exclude the users list of `Excludelist` `+` `Exclude AD Inactive UserList` Client EDF list.

3)  If the Script `ExcludeList` is empty and the location EDF is set, then the Location EDF list will be excluded.

4) If the Script `ExcludeList` is empty and the location EDF `Exclude AD Inactive UserList` is empty too and only the Client EDF `Exclude AD Inactive UserList` is set, then the Client EDF `Exclude AD Inactive UserList` list of users will be excluded.

5) If Script `ExcludeList` has user lists and the EDFs at location/client level `Exclude AD Inactive UserList` is empty, then the script `ExcludeList` will be accepted for the exclusion.

## Output

- [Table - pvl_ad_inactive_users](/docs/2b118df6-1fef-4530-9303-0bb56c478361)
- [Dataview - AD Inactive Users Audit](/docs/9c9888a7-678a-497f-8f61-11e21e020999)
- Output