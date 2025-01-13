---
id: ps-get-adbitlockerstore
title: 'Get-ADBitlockerStore'
title_meta: 'Get-ADBitlockerStore Command'
keywords: ['bitlocker', 'ad', 'backup', 'recovery']
description: 'Documentation for the Get-ADBitlockerStore command to return objects from Active Directory representing backed up Bitlocker key protectors.'
tags: ['active-directory', 'backup', 'recovery', 'security']
draft: false
unlisted: false
---
## Description
Returns objects from AD representing backed up Bitlocker key protectors.

## Requirements
PowerShell v5
Must be run on Active Directory server

## Usage
Gathers all existing Bitlocker key protectors and formats them into PSObjects.


```powershell
.\Get-ADBitlockerStores.ps1
```

## Output
    - PSObject[]. Returns a list of PSObjects representing backed up Bitlocker key protectors.
    - .\MyProject-log.txt
```
    Example Output Object:
    DistinguishedName       : <redacted>
    Name                    : 2021-09-25T15:28:43-05:00{07BE58FA-493A-49FA-B300-CB5B5123EF11}
    Created                 : 9/29/2021 7:34:46 AM
    Deleted                 :
    RecoveryGUID            : 07be58fa-493a-49fa-b300-cb5b5123ef11
    RecoveryPassword        : <redacted>
    VolumeGUID              : bf089cd1-fd99-4b77-b4f6-f8f2673aa2ae
    ParentDistinguishedName : <redacted>
    ParentSID               : S-1-5-21-3684404077-2748133095-2161390432-2690
```

