---
id: ps-remove-userprofile
title: 'Remove-UserProfile'
title_meta: 'Remove-UserProfile Command'
keywords: ['remove', 'user', 'profile', 'local']
description: 'Documentation for the Remove-UserProfile command to delete a user profile and remove the user account if local.'
tags: ['configuration', 'windows', 'security']
draft: false
unlisted: false
---
## Description
#### **This script is destructive and should only be used after fully understanding the implications.**

Deletes a user profile and removes the user account if local.

## Requirements
PowerShell v5

## Usage
1. Refactors the user account to `computername\username` if the account passed appears to be a local user (starts with `.\` or no `\`)
    - `username` becomes `computername\username`
    - `.\username` becomes `computername\username`
    - `domain\username` remains as is.
2. The account is checked for being a local user.
3. Attempts to convert the NT Account object of the passed user into a `System.Security.Principal.SecurityIdentifier`
    1. If the translation fails, then the user account does not exist and orphaned profiles are then searched for possible matches to the user account using the regex `"^$env:SystemDrive\\Users\\$Username($|(\-|\_)(\w|\-|\.)+$)"`
    2. If a matching profile is found where the SID is **not** a valid user account, then the script continues under the discovered SID's context.
    3. If a matching profile is not found, then the script exits on error.
4. Profile information is gathered based on the user's SID.
5. If the user is a local user and the `-PreserveUser` switch was not passed, then the user account is removed.
    - A non-terminating error will be generated if the user account cannot be removed.
6. A `Win32_UserProfile` CIM instance is generated for the user profile.
    - CIM Instance Found
        1. The `Remove-CIMInstance` cmdlet is run against the profile.
            - If the cmdlet fails, then an error message is generated and the script exits.
        2. If the user folder was successfully removed, then the script exits.
        3. If the user folder still exists, then an error message is generated and the script exits.
    - CIM Instance Not Found
        - A `Win32_UserProfile` WMI instance is generated for the user profile.
            - WMI Instance Found
                 1. The `Remove-WMIObject` cmdlet is run against the profile.
                    - If the cmdlet fails, then an error message is generated and the script exits.
                2. If the user folder was successfully removed, then the script exits.
                3. If the user folder still exists, then an error message is generated and the script exits.
            - WMI Instance Not Found
                1. Ownership of the user folder is taken by the script caller.
                2. ACLs are set on the folder and all subfiles/subfolders to grant FullControl to the script caller.
                3. The folder is then deleted by `Remove-Item`
                2. If the user folder was successfully removed, then the script removes the associated registry entries and exits.
                3. If the user folder still exists, then an error message is generated and the script exits.



Removes the user profile for the local user 'testing123' and deletes the user account.

```powershell
.\Remove-UserProfile.ps1 -Username "testing123"
```

Removes the user profile for the local user 'testing123'. The user account will not be deleted due to the `-PreserveUser` switch being present.

```powershell
.\Remove-UserProfile.ps1 -Username "testing123" -PreserveUser
```

Removes the user profile for the user 'domain\testing123'. The user account will not be deleted due to the account being a remote domain account.
```powershell
Remove-UserProfile.ps1 -Username "domain\domainuser"
```

## Parameters
| Parameter         | Alias | Required  | Default   | Type          | Description                               |
| ----------------- | ----- | --------- | --------- | ---------     | ----------------------------------------- |
| `-Username`       |       | True      |           | String        | The username of the user to remove the profile for. Validated by the following regex: `^(((\.\\)\|(\w\|\-\|\.)+\\)\|)(\w\|\.\|\-)+$`|
| `-PreserveUser`   |       | False     | False     | Switch (bool) | Use this switch to preserve the user account after profile deletion. |

## Output
    ./Remove-UserProfile-log.txt
    ./Remove-UserProfile-data.txt
    ./Remove-UserProfile-error.txt

