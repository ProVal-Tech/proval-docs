---
id: ps-invoke-wingetprocessor
title: 'Invoke-WingetProcessor'
title_meta: 'Invoke-WingetProcessor'
keywords: ['winget', 'package', 'install', 'update']
description: 'Documentation for the Invoke-WingetProcessor command to manage software packages using Winget in PowerShell.'
tags: ['installation', 'software', 'update']
draft: false
unlisted: false
---

## Description
WinGetProcessor is a wrapper for Winget for PowerShell.

## Requirements
VLibs must be installed on the endpoint for Winget to function. The script will attempt to install this dependency if Winget is not yet installed.

## Usage
WingetProcessor wraps most Winget functions in a function called `Invoke-WingetCommand`, which wraps the Winget executable in a script block and executes it with `Invoke-Command`. The Winget executable path is dynamically determined based on user context. If Winget is not installed on the endpoint and is being run as NT Authority\SYSTEM, the package and dependencies will be installed as a ProvisionedAppXPackage.

```powershell
PS C:> Invoke-WingetProcessor.ps1 -Install -PackageId 'Postman.Postman','Google.Chrome' -AllowUpdate
    Installs Google Chrome and Postman API Toolbox, allowing the applications to be updated if already installed.
PS C:> Invoke-WingetProcessor.ps1 -Install -Name 'Postman x86_64 10.0.1','Google Chrome'
    Installs Google Chrome and Postman API Toolbox, skipping any action if already installed.
PS C:> Invoke-WingetProcessor.ps1 -Uninstall -Name 'Google Chrome'
    Uninstalls Google Chrome from the endpoint.
PS C:> Invoke-WingetProcessor.ps1 -UpdateAll
    Updates all WinGet-compatible packages on the endpoint.
PS C:> Invoke-WingetProcessor.ps1 -Export C:\Users\Dev\Desktop\Export.json
    Exports a list of installed software to the specified path and returns an object containing that data.
PS C:> Invoke-WingetProcessor.ps1 -Import C:\Users\Dev\Desktop\SoftwareList.json
    Imports a list of previously exported software from the specified path. No changes are made to software on the endpoint exceeding the version listed in the JSON.
PS C:> Invoke-WingetProcessor.ps1 -Import C:\Users\Dev\Desktop\SoftwareList.json -AllowUpdate
    Imports a list of previously exported software from the specified path. All software in the JSON will be installed at the latest available version, regardless of software pre-existing on the endpoint.
PS C:> Invoke-WingetProcessor.ps1 -Install -PackageID 'Microsoft.Teams.Classic' -Source 'winget' -AllowUpdate -OptionalParameter '--Scope', 'machine'
    Installs Teams Machine-Wide Installer for all users, allowing the applications to be updated if already installed.
```

## Parameters
| Parameter           | Required | Type         | Parameter Sets                                                                  | Description                                                                     |
| ------------------- | -------- | ------------ | ------------------------------------------------------------------------------- | ------------------------------------------------------------------------------- |
| `Install`           | True     | Bool         | InstallByPackage, InstallByName                                                | Installs one or more packages on the endpoint                                   |
| `AllowUpdate`       | False    | Bool         | InstallByPackage, InstallByName, InstallByImport                               | Allows `-Install` and `-Import` to update pre-installed packages               |
| `Uninstall`         | True     | Bool         | UninstallByPackage, UninstallByName                                            | Uninstalls one or more packages on the endpoint                                 |
| `PackageId`         | True     | String Array | InstallByPackage, UninstallByPackage                                           | Install or Uninstall by PackageId(s)                                           |
| `Name`              | True     | String Array | InstallByName, UninstallByName                                                 | Install or Uninstall by Package Name(s)                                        |
| `UpdateAll`         | True     | Bool         | UpdateAll                                                                       | Updates all packages on the endpoint to the latest available version            |
| `Export`            | True     | Bool         | Export                                                                          | Exports a JSON and returns an object of installed applications on the endpoint. |
| `Import`            | True     | Bool         | InstallByImport                                                                 | Imports a list of software in JSON format and installs it on the endpoint.     |
| `Source`            | True     | String       | InstallByPackage, InstallByName, UpdateAll                                     | Specifies winget or msstore as the source for package installation              |
| `OptionalParameter` | False    | String       | InstallByPackage, InstallByName, UpdateAll, UninstallByName, UninstallByPackage | Specifies optional parameters to deploy/update/remove the application(s)       |

## Output
Location of output for log, result, and error files.

```
.\Invoke-WingetProcessor-log.txt
.\Invoke-WingetProcessor-error.txt
```


