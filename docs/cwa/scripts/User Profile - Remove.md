---
id: '765d906e-33c3-4615-9cd6-9c01a9eeaebb'
title: 'Delete User Profile and Account'
title_meta: 'Delete User Profile and Account - Destructive Script'
keywords: ['user', 'profile', 'delete', 'account', 'local']
description: 'This document describes a script that deletes a user profile and removes the local user account. It emphasizes the destructive nature of the script and provides information on the necessary parameters and dependencies for successful execution.'
tags: ['security', 'uninstallation', 'windows']
draft: false
unlisted: false
---
## Summary

**This script is destructive and should only be used after fully understanding the implications.**

Deletes a user profile and removes the user account if local. Runs [EPM - Accounts - Script - User Profile - Get Information](<./User Profile - Get Information.md>) after successful deletion.

## Sample Run

## Dependencies

- [EPM - Accounts - Agnostic - Remove-UserProfile](<../../powershell/Remove-UserProfile.md>)

### User Parameters

| Name          | Example    | Required | Description                                                                                          |
|---------------|------------|----------|------------------------------------------------------------------------------------------------------|
| Username      | testuser   | True     | The username of the user to remove. Can be in the format 'testuser', './testuser', or 'domain/testuser'. |
| PreserveUser  | 1          | False    | If set to 1, then the user account will not be deleted along with the profile.                     |

## Process

See [EPM - Accounts - Agnostic - Remove-UserProfile](<../../powershell/Remove-UserProfile.md>) for process information.

## Output

- Script log
- Local file on computer













