---
id: '408179bd-2008-48a0-9311-d037a4e670ba'
slug: /408179bd-2008-48a0-9311-d037a4e670ba
title: 'Solution - User Activity Tracing'
title_meta: 'Solution - User Activity Tracing'
keywords: ['audit', 'login', 'logout', 'user', 'activity']
description: 'This document outlines a solution for auditing user login and logout activities, detailing the implementation steps and associated content for effective monitoring. The solution is designed to replace existing duplicates and should be scheduled at intervals shorter than 24 hours to ensure comprehensive data capture.'
tags: ['report']
draft: false
unlisted: false
---

## Purpose

This solution performs the user login/logout activity audit. By default, the script will audit the last 24 hours of data and replace any existing duplicates. Therefore, the script should be scheduled at a quicker interval than 24 hours to provide a buffer and ensure that no data is missed.

## Associated Content

| Content                                                                 | Type      | Function                                                   |
|-------------------------------------------------------------------------|-----------|------------------------------------------------------------|
| [Activity Logging Reporting [DV, Global]](<../scripts/Activity Logging Reporting DV, Global.md>) | Script    | This script is used to perform the audit of the login/logout of the users. |
| [User Activity Audit [Script]](<../dataviews/User Activity Audit Script.md>)         | Dataview  | The dataview shows the login/logout audit of the users.   |
| [pvl_login_logout_audit](<../tables/pvl_login_logout_audit.md>)               | Table     | This table stores the user login/logout data.             |

## Implementation

- Import the script [Activity Logging Reporting [DV, Global]](<../scripts/Activity Logging Reporting DV, Global.md>).
- Import the dataview [User Activity Audit [Script]](<../dataviews/User Activity Audit Script.md>).
- Run the script once by setting the User Parameter value 'SetEnvironment' to 1, as shown below:

  ![Image](../../../static/img/Solution---User-Activity-Tracing/image_1.png)

  This will create the table and also establish the system property 'ProVal_UserLogIn_Out_Threshold_Days' with the global parameter value 'DataRetention_Threshold' in days, as provided in the script for data retention (defaults to 90 days retention).
- Then, schedule the script on the Windows machines.

**NOTE:** This script is not suitable for execution on the DC servers to avoid the noise of multiple user login/logout traces in the system event log as well as in the database table. The DC server is excluded from the script for execution.


