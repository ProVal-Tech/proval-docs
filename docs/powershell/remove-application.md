---
id: '8230693f-cf73-479d-8279-d2ff54c4296e'
slug: /8230693f-cf73-479d-8279-d2ff54c4296e
title: 'Remove-Application'
title_meta: 'Remove-Application'
keywords: ['remove', 'application', 'uninstall', 'cleanup']
description: 'Documentation for the Remove-Application command to remove an application or list of applications either by normal means or forcefully.'
tags: ['software', 'uninstallation']
draft: false
unlisted: false
---

## Description

Removes an application or a list of comma-separated applications either by normal means or forcefully.

## Requirements

PowerShell V.5

## Usage

1. Search for the object
    1. Check the application log for an error and exit if not found.
    2. If there are more than one result for the search term `$Name`, notify the user that there are multiple results and to refine their search.
2. Determine the type of uninstallation object that `$Name` references (AppX, MSI, EXE).
    1. **AppX**
        1. Remove the AppX object.
        2. Check for the item after removal to confirm.
        3. Exit.
    2. **MSI**
        1. Attempt to remove the MSI package using the uninstall string.
        2. Log the success or failure of the uninstallation.
    3. **EXE**
        1. Check if a custom switch is provided. If so, attempt to uninstall using the provided switch.
        2. If the custom switch fails or is not provided, attempt to uninstall using the `QuietUninstallString` if available.
        3. If the `QuietUninstallString` fails or is not available, attempt to uninstall using targeted silent switches.
        4. If targeted silent switches fail, attempt to uninstall using the `UninstallString` without modifications.
        5. Log the success or failure of each uninstallation attempt.
3. Check if the application is still installed.
    1. If the application is not installed, log the successful removal and exit.
    2. If the application is still installed and the `-Force` parameter is specified, proceed with forced removal.
4. Forced Removal (if `-Force` parameter is specified)
    1. Terminate any processes related to the application.
    2. Remove the application's files and directories.
    3. Remove the application's shortcuts.
    4. Remove the application's registry keys.
    5. Log the success or failure of the forced removal.

```powershell
.\Remove-Application.ps1 -Name 'Google Chrome', 'Teams Machine-Wide Installer', 'ConnectWise Manage Client 64-bit'
```
Will attempt to remove Google Chrome, Teams Machine-Wide Installer, and 'ConnectWise Manage Client 64-bit' applications normally.

```powershell
.\Remove-Application.ps1 -Name 'Google Chrome', 'Teams Machine-Wide Installer', 'ConnectWise Manage Client 64-bit' -SystemComponentOverride
```
Will attempt to remove Google Chrome, Teams Machine-Wide Installer, and 'ConnectWise Manage Client 64-bit' applications normally. If the application is registered as a system component, it will continue to remove the application.

```powershell
.\Remove-Application.ps1 -Name 'Google Chrome'
```
Will attempt to remove Google Chrome normally.

```powershell
.\Remove-Application.ps1 -Name 'Google Chrome' -Force
```
Will attempt to remove Google Chrome normally, but if it fails, it will attempt a forceful removal of the application.

```powershell
.\Remove-Application.ps1 -Name 'Google Chrome' -Force -SystemComponentOverride
```
Will attempt to remove Google Chrome normally, but if it fails, it will attempt a forceful removal of the application. If the application is registered as a system component, it will continue to remove the application.

```powershell
.\Remove-Application.ps1 -Name 'Microsoft.BingWeather'
```
Will remove Bing Weather.

```powershell
.\Remove-Application.ps1 -Name 'Google Chrome' -Switch '--uninstall --multi-install --chrome --system-level --force-uninstall'
```
Will attempt to remove Google Chrome using the provided custom switch.

## Parameters

| Parameter                     | Alias              | Required | Default | Type      | Description                                                                                                                                              |
|-------------------------------|--------------------|----------|---------|-----------|----------------------------------------------------------------------------------------------------------------------------------------------------------|
| `Name`                        |                    | True     |         | String[]  | The name or the comma-separated list of the name of the application(s) as they appear in the programs list.                                            |
| `SystemComponentOverride`     | Override           | False    |         | Switch    | The default action of this script is to not remove any item that holds the `SystemComponent` registry key at a value of 1. Using `SystemComponentOverride`, you can bypass that default and remove items classified as system components. |
| `Switch`                      |                    | False    |         | String[]  | Specifies the custom switch(es) to be used during the uninstall process. This parameter is useful when the default silent switches do not work for a specific application. |
| `Force`                       |                    | False    |         | Switch    | Forces the removal of the application using an aggressive approach if the normal uninstallation methods fail.                                          |

## Output

- `.\Remove-Application-log.txt`
- `.\Remove-Application-error.txt`