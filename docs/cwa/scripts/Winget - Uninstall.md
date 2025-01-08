---
id: 'cwa-remove-winget-package'
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

![Sample Run](5078775/docs/12024902/images/16865768)

## Dependencies

- [SWM - Software Management - Powershell - Invoke-WingetProcessor](https://proval.itglue.com/DOC-5078775-11310973)

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


