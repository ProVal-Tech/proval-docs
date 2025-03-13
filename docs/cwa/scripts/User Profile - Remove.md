---
id: '765d906e-33c3-4615-9cd6-9c01a9eeaebb'
title: 'User Profile - Remove'
title_meta: 'User Profile - Remove'
keywords: ['user', 'profile', 'delete', 'account', 'local']
description: 'This document describes a script that deletes a user profile and removes the local user account. It emphasizes the destructive nature of the script and provides information on the necessary parameters and dependencies for successful execution.'
tags: ['security', 'uninstallation', 'windows']
draft: false
unlisted: false
---

## Summary

### <span style={{color: 'red'}}>***This script is destructive and should only be used after fully understanding the implications.***</span>

This script deletes a user profile and removes the user account if it is local. It runs [User Profile - Get Information](<./User Profile - Get Information.md>) after successful deletion.

## Sample Run

#### Example 1: Removes user profile and the local user from the machine

![Example1](../../../static/img/cwa-user-profile-remove/Example1.png)

#### Example 2: Removes user profile without removing the local user

![Example2](../../../static/img/cwa-user-profile-remove/Example2.png)

#### Example 3: Removes user profile based on SID. SID parameter can be used when UserName is not available. 

![Example3](../../../static/img/cwa-user-profile-remove/Example3.png)

## Dependencies

- [Remove-UserProfile](<../../powershell/Remove-UserProfile.md>)
- [User Profile - Get Information](<./User Profile - Get Information.md>)

### User Parameters

| Name         | Example    | Required  | Description                                                                                          |
|--------------|------------|-----------|------------------------------------------------------------------------------------------------------|
| Username     | testuser   | Partially | The username of the user to remove. Can be in the format 'testuser', './testuser', or 'domain/testuser'. |
| PreserveUser | 1          | False     | If set to 1, then the user account will not be deleted along with the profile.                     |
| SID | S-1-5-21-3623811015-3361044348-30300820-1013 | Partially | The SID of the user profile to remove. Preserve User can not be used with SID. This parameter can be used when can be used when UserName is not available.<br /><br />**Both UserName and SID can not be used together** |


## Process

See [Remove-UserProfile](<../../powershell/Remove-UserProfile.md>) for process information.

## Output

- Script log
- Local file on computer