---
id: 'cwa-remove-local-accounts'
title: 'Remove Local Accounts Script'
title_meta: 'Remove Local Accounts Script for User Management'
keywords: ['remove', 'local', 'accounts', 'purge', 'user', 'management']
description: 'This document outlines a script designed to completely remove and purge local accounts, including UserSID, from the agent. It can operate manually or automatically, depending on the configuration. The script saves approximately 5 minutes of time by automating the removal process for inactive accounts.'
tags: ['automation', 'cleanup', 'user', 'inactive', 'logging']
draft: false
unlisted: false
---
## Summary

This script can be used to completely remove/purge local accounts (including UserSID) manually and automatically from the agent.

**Time Saved by Automation:** 5 Minutes

## Sample Run

![Sample Run](..\..\..\static\img\User-Management---Purge-Local-Account-and-Profile\image_1.png)

## Dependencies

- @custom_proval_computer_accounts (Table)
- @User management - Profile Audit (Script)
- [Local User Detection Not Logged In From 90 Days](https://proval.itglue.com/DOC-5078775-7819329)

## Variables

| Variable  | Description                                                                                          |
|-----------|------------------------------------------------------------------------------------------------------|
| psout     | This contains powershell script output of whether the complete profile removed or not              |
| fieldname | This contains list of users account inactive from 90 days                                           |
| status    | It detects the dependent monitor status for the agent                                               |

#### Global Parameters

| Name      | Example                               | Required | Description                                         |
|-----------|---------------------------------------|----------|-----------------------------------------------------|
| LogPath   | C:\temp\Remove-LocalUserProfile.log  | True     | This path stores the logging of completed script.   |
| AutoPurge | False                                 | True     | False -- Auto Purge is off, Usernames required<br>True -- Auto Purge is ON, Usernames not required |

#### User Parameters

| Name      | Example              | Required    | Description                                                                                      |
|-----------|----------------------|-------------|--------------------------------------------------------------------------------------------------|
| Usernames | user1,user2,user3   | True/False  | Provide list of user to remove when AutoPurge = False, else for Autopurge = True please leave blank. |

## Process

- This script can be used to perform both manual removal of users or automatic purge.
- For automatic purge, mark Autopurge = True, then the usernames not logged in from more than 90 days will be picked from dependent monitor and this script will trigger as autofix to remove them.
- For manual purge, Provide usernames to remove from the agent.

## Output

- Script log



