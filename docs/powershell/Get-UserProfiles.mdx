---
id: ps-get-userprofiles
title: 'Get-UserProfiles'
title_meta: 'Get-UserProfiles Command'
keywords: ['user', 'profiles', 'local', 'admin']
description: 'Documentation for the Get-UserProfiles command to gather information about user profiles on a Windows system.'
tags: ['security', 'windows']
draft: false
unlisted: false
---
## Description
Gathers information about user profiles.

## Requirements
PowerShell v5

## Usage
1. Searches `HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList\` for existing profiles.
2. For each profile, the script performs the following steps:
    1. Attempts to translate the `System.Security.Principal.SecurityIdentifier` object created from the user SID to a `System.Security.Principal.NTAccount`. This is used to validate the username.
        - If this process fails, then the username will be inferred from the `ProfileImagePath`.
            - Ex: `C:\users\username` would be inferred as `username`.
    2. Validates if the user is a local user by comparing against the output from `Get-LocalUser`.
    3. Checks if the user is a local admin via the `Test-LocalAdminAccess` function.
        - Starts with the `Administrators` local group and searches for membership of the target user. If the user is found to be a member, then the function returns `$true`. If not, then any subgroups are recursively searched.
    4. Checks for the last login time of the user using the function `Get-LoginEvents`
        - Uses an event log filter to search for the target user SID login events.
        - If no events are returned by `Get-LoginEvents`, then the `Win32_NetworkLoginProfile` WMI namespace is searched.
    5. The profile size is determined via `Get-ChildItem` against the `ProfileImagePath`. Returns in megabytes rounded to two decimal places.
    6. Creates a `[pscustomobject]` and adds it to the return array.
3. Local users that are detected but do not have a valid user profile created are then processed.
    1. Checks if the user is a local admin via the `Test-LocalAdminAccess` function.
    2. Creates a `[pscustomobject]` and adds it to the return array.
4. Returns the composed array.



```powershell
.\Get-UserProfiles.ps1
```

## Output
    .\Get-UserProfiles-log.txt









