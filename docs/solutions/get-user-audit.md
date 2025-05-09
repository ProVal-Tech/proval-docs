---
id: '2d1e82e1-7c9e-460b-83e9-d333471376d3'
slug: /2d1e82e1-7c9e-460b-83e9-d333471376d3
title: 'Get User Audit'
title_meta: 'Get User Audit'
keywords: ['user', 'test', 'audit', 'logs', 'SID']
description: 'Documentation for the User-Audit to retrieve specific or multiple users auditing for information username, sids, and status using the string pattern match'
tags: ['security']
draft: false
unlisted: false
---

## Purpose
This solution is designed to perform user audits by allowing users to set pattern matching criteria to audit sets of users that match the provided patterns. It also supports specifying multiple patterns, separated by commas, to generate lists of users based on each pattern individually.

Note: If the agent is a Domain Controller, it will audit domain accounts; otherwise, it will audit local accounts.

## Associated Content
| Content                                                                             | Type            | Function                                                                                                                                                                                                                             |
| ----------------------------------------------------------------------------------- | --------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| [Agnostic-User-Audit](/docs/b2914f30-25ee-4d74-ac6a-77260b88ddcb)                   | Agnostic Script | This agnostic script is built to retrieve specific or multiple users auditing for information such as username, SID, and status.                                                                                                     |
| [Task-Get Specific/Multiple User Audit](/docs/359dfd23-db61-4c14-99e5-16e3b723ace4) | Task            | This script is designed to get the specific or multiple user(s) information (Username, SIDs, and Status). Note: If the agent is a Domain Controller, it will audit the domain accounts; otherwise, it will audit the local accounts. |

## Implementation

This is on-demand request and the task can be scheduled to the custom group where we need to perform the user audit and set the frequency as per the requirement.

## FAQ
Does this script will look for users with matching pattern?

Yes, it will look for users with matching string provided.

For Example:

`.\user-audit.ps1 -pattern 'Test'`

Then it will detect any users having test in it such as:

Test1

ProTest

Testing

More example:

`.\user-audit.ps1 -pattern 'Test,Pro'`

Test1

Pronoc

Suprotech

Protest