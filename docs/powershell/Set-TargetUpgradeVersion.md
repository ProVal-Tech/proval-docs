---
id: ps-set-targetupgradeversion
title: 'Set-TargetUpgradeVersion'
title_meta: 'Set-TargetUpgradeVersion Command'
keywords: ['upgrade', 'version', 'target', 'update']
description: 'Documentation for the Set-TargetUpgradeVersion command to specify the target version for system upgrades.'
tags: ['update', 'configuration', 'windows']
draft: false
unlisted: false
---

## Description
    Sets Windows 10 to a specific Feature Upgrade.
    When set to 21h2, this will prevent Windows 11 Toast Notifications that prompt for upgrade.
    Passing -Undo removes these keys from the registry, allowing for upgrade.


## Requirements
    Requires Windows 10 2004 and above. This is checked by the script.

## Usage
Modifies HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate TargetRelease and TargetReleaseInfo to spcify Feature upgrade to lock to.


Describe how the payload is executed and if it requires any parameters. Delete the parameter block below if not needed. State that this does not use a payload if it doesn’t.

Explanation of the usage of the below example.

```powershell
c:\> TargetUpgradeversion.ps1 -Version 2004
```
```powershell
c:\> TargetUpgradeversion.ps1 -Undo
```

## Parameters
| Parameter         | Alias | Required  | Default   | Type      | Description                               |
| ----------------- | ----- | --------- | --------- | --------- | ----------------------------------------- |
| -Version          |       | False     |           | String    |   Specify Target Version.                 |
| -Undo             |       | False     |           | Switch    |   Remove Version Lock                     |


## Output
Location of output for log, result, and error files.

    .\Set-TargetUpgradeVersion-log.txt
    .\Set-TargetUpgradeVersion-data.txt
    .\Set-TargetUpgradeVersion-error.txt