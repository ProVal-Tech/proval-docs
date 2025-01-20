---
id: 'a7948b43-d26f-4f00-a2d8-346b9d445153'
title: 'Remove Winget Package Script'
title_meta: 'Remove Winget Package Script'
keywords: ['winget', 'package', 'remove', 'script', 'software']
description: 'This document provides a detailed overview of a script designed to remove a Winget package, including its parameters, dependencies, and sample run output.'
tags: ['software', 'uninstallation', 'windows']
draft: false
unlisted: false
---
## Summary

This script will remove a Winget package.

## Sample Run

![Sample Run](../../../static/img/Winget---Uninstall/image_1.png)

## Dependencies

- [SWM - Software Management - Powershell - Invoke-WingetProcessor](<../../powershell/Invoke-WingetProcessor.md>)

#### Global Parameters

| Name         | Example                  | Required | Description                                                                                       |
|--------------|--------------------------|----------|---------------------------------------------------------------------------------------------------|
| ProjectName  | Invoke-WingetProcessor    | True     | This variable must remain Invoke-WingetProcessor it represents the agnostic script name without the .ps1 |

#### User Parameters

| Name | Example                  | Required | Description                      |
|------|--------------------------|----------|----------------------------------|
| Name | Nirsoft.BlueScreenView   | True     | The Winget Package to remove.    |

## Process

Please reference the Agnostic Documentation for process.

## Output

- Script log













