---
id: '5eccc080-da21-4b13-b21d-df5c985a056a'
slug: /5eccc080-da21-4b13-b21d-df5c985a056a
title: 'Remove-PathVariable'
title_meta: 'Remove-PathVariable'
keywords: ['remove', 'path', 'environment', 'variable']
description: 'Documentation for the Remove-PathVariable command to remove specified paths from the Environmental Path variable at the desired scope.'
tags: ['windows']
draft: false
unlisted: false
---

## Description
Removes the provided path(s) from the Environmental Path variable for a Path at the desired scope.

## Requirements
PowerShell V.5

## Usage
1. For each given path, reload the current path environmental variable for the desired scope.
2. Search that scope for the given path. If it's not present, return the current environmental path variable.
3. Remove the given path from the environmental path variable and return the current environmental path variable.

```powershell
.\Remove-PathVariable.ps1 -Path 'C:\Documents and Settings','C:\Config', 'C:\Recovery','C:\Intel'
```
This command will remove the `C:\Documents and Settings`, `C:\Config`, `C:\Recovery`, and `C:\Intel` folders from the machine-scoped environmental variable if they exist.

```powershell
.\Remove-PathVariable.ps1 -Path 'C:\Documents and Settings','C:\Config', 'C:\Recovery','C:\Intel' -Scope User
```
This command will remove the `C:\Documents and Settings`, `C:\Config`, `C:\Recovery`, and `C:\Intel` folders from the user-scoped environmental variable if they exist.

## Parameters
| Parameter         | Alias | Required  | Default   | Type                          | Description                                                                                       |
| ----------------- | ----- | --------- | --------- | ----------------------------- | ------------------------------------------------------------------------------------------------- |
| `Path`            |       | True      |           | String[]                      | A list of paths to remove from the desired scope.                                               |
| `Scope`           |       | False     | Machine   | System.EnvironmentVariableTarget | This designates the scoped environmental variable you wish to target: machine or user.           |

## Output
Standard Output
