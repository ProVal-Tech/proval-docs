---
id: ps-set-pathvariable
title: 'Set-PathVariable'
title_meta: 'Set-PathVariable Command'
keywords: ['path', 'environment', 'variable', 'scope']
description: 'Documentation for the Set-PathVariable command to set provided paths to the Environmental Path variable at the desired scope.'
tags: ['configuration', 'windows']
draft: false
unlisted: false
---

## Description
Sets the provided path(s) to the Environmental Path variable for a Path at the desired scope.

## Requirements
PowerShell V.5

## Usage
1. For every given path reload the current path environmental variable for the desired scope.
2. Search that scope for the given path, if it's present return the current environmental path variable.
3. Add the given path to the environmental path variable and return the current environmental path variable.



```powershell
.\Set-PathVariable.ps1 -Path 'C:\Documents and Settings','C:\Config.Msi', 'C:\Recovery','C:\Intel' -scope Machine
```
Will return the current $Env:Path state for the machine after adding those paths to the variable.

```powershell
.\Set-PathVariable.ps1 -Path 'C:\something' -scope User
```
Will return the current $Env:Path state for the user after adding those paths to the variable.

## Parameters
| Parameter         | Alias | Required  | Default   | Type      | Description                               |
| ----------------- | ----- | --------- | --------- | --------- | ----------------------------------------- |
| `Path`            |       | True      |           | String[]  | A list of paths to add to the desired scope
| `Scope`           |       | False     | Machine   | System.EnvironmentVariableTarget   | This designates the scoped environmental variable you wish to target, machine, or user.                                          |


## Output

Standard Output
