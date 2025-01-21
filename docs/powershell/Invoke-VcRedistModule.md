---
id: ps-invoke-vcredistmodule
title: 'Invoke-VcRedistModule'
title_meta: 'Invoke-VcRedistModule'
keywords: ['vcredist', 'visualc++', 'redistributable', 'installation']
description: 'Documentation for the Invoke-VcRedistModule command to manage the installation, uninstallation, and listing of Visual C++ Redistributables.'
tags: ['installation', 'software', 'uninstallation']
draft: false
unlisted: false
---

## Description
This PowerShell script uses the VcRedist module to manage the installation, uninstallation, and listing of Visual C++ Redistributables.

## Requirements
- PowerShell v5+
- Run as administrator

## Usage
- The script uses the Strapper module.
- It utilizes the VCRedist module to manage Visual C++ Redistributables.
- Functions are defined for setting working directories, installing supported redistributables, and uninstalling unsupported redistributables.
- The script uses parameter sets to handle different operations such as listing, installing, uninstalling, and purging.
- It includes error handling to manage exceptions during the process.

```powershell
.\Invoke-VcRedistModule.ps1 -List
```
Lists all supported Visual C++ Redistributables.

```powershell
.\Invoke-VcRedistModule.ps1 -List -Installed
```
Lists all installed Visual C++ Redistributables on the system.

```powershell
.\Invoke-VcRedistModule.ps1 -Install -Release 2012 -Architecture x64
```
Installs the specified version (Release 2012) of Visual C++ Redistributable for x64 architecture.

```powershell
.\Invoke-VcRedistModule.ps1 -Install -Release 2013,2019 -Architecture x64
```
Installs the specified versions (Release 2013 and 2019) of Visual C++ Redistributable for x64 architecture.

```powershell
.\Invoke-VcRedistModule.ps1 -Install -Supported -Force
```
Installs all supported Visual C++ Redistributables even if they are already installed on the system.

```powershell
.\Invoke-VcRedistModule.ps1 -Install -Supported
```
Installs all supported Visual C++ Redistributables on the system.

```powershell
.\Invoke-VcRedistModule.ps1 -Uninstall -Release 2007
```
Uninstalls the specified version (Release 2007) of Visual C++ Redistributable.

```powershell
.\Invoke-VcRedistModule.ps1 -Uninstall -Unsupported
```
Uninstalls the unsupported versions of Visual C++ Redistributable from the system.

```powershell
.\Invoke-VcRedistModule.ps1 -Uninstall -All
```
Uninstalls all installed Visual C++ Redistributables.

```powershell
.\Invoke-VcRedistModule.ps1 -Uninstall -Release 2007 -Architecture x86
```
Uninstalls the specified version (Release 2007) of Visual C++ Redistributable for x86 architecture from the system.

```powershell
.\Invoke-VcRedistModule.ps1 -Uninstall -Release 2007,2003
```
Uninstalls the specified versions (Release 2003 and 2007) of Visual C++ Redistributable from the system.

```powershell
.\Invoke-VcRedistModule.ps1 -Purge
```
Uninstalls unsupported redistributables and installs supported ones.

## Parameters
| Parameter         | ParameterSetName             | Required  | ValidSet  | Type      | Description                                                                                            |
| ----------------- | -----------------------------| --------- | --------- | --------- | ------------------------------------------------------------------------------------------------------ |
| `List`            | `List`                       | True      |           | Switch    | Lists the supported Visual C++ Redistributables.                                                       |
| `Installed`       | `List`                       | False     |           | Switch    | Lists the Visual C++ Redistributables currently installed on the system.                               |
| `Install`         | `Install`                    | True      |           | Switch    | Installs a specified version of Visual C++ Redistributable.                                            |
| `Supported`       | `Install`                    | False     |           | Switch    | Installs the supported version of Visual C++ Redistributable.                                          |
| `Uninstall`       | `Uninstall`                  | True      |           | Switch    | Uninstalls a specified version of Visual C++ Redistributable.                                          |
| `Unsupported`     | `Uninstall`                  | False     |           | Switch    | Uninstalls any unsupported Visual C++ Redistributable.                                                 |
| `All`             | `Uninstall`                  | False     |           | Switch    | Uninstalls all installed Visual C++ Redistributables.                                                  |
| `Release`         | `Install`,`Uninstall`        | False     |           | int32[]   | Specifies the release version of Visual C++ Redistributable to install or uninstall.                   |
| `Architecture`    | `Install`,`Uninstall`,`List` | False     | x64, x86  | String    | Specifies the architecture (x64 or x86) for Visual C++ Redistributable.                                |
| `Purge`           | `Purge`                      | True      |           | Switch    | Uninstalls unsupported Visual C++ Redistributables and installs supported ones.                        |
| `Force`           | `Install`,`Purge`            | False     |           | Switch    | Performs an installation of a Visual C++ Redistributable even if it is already installed on the system. |

## Output
- .\Invoke-VcRedistModule-log.txt
- .\Invoke-VcRedistModule-Error.txt



