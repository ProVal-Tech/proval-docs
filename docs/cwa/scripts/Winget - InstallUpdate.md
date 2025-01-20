---
id: 'dd445ce7-a149-452c-9b35-dc1adbab4e06'
title: 'Install Winget Package on Target Endpoint'
title_meta: 'Install Winget Package on Target Endpoint'
keywords: ['winget', 'package', 'install', 'endpoint']
description: 'This document provides a detailed guide on how to install a Winget package on a target endpoint, including sample runs, dependencies, and parameters required for the process.'
tags: ['installation', 'software', 'windows']
draft: false
unlisted: false
---
## Summary

Installs a Winget package on a target endpoint.

## Sample Run

![Sample Run](../../../static/img/Winget---InstallUpdate/image_1.png)

## Dependencies

- [SWM - Software Management - Powershell - Invoke-WingetProcessor](<../../powershell/Invoke-WingetProcessor.md>)

#### Global Parameters

| Name         | Example                | Required | Description                                                                 |
|--------------|------------------------|----------|-----------------------------------------------------------------------------|
| ProjectName  | Invoke-WingetProcessor | True     | This represents the name of the Agnostic script, and should not be changed. |

#### User Parameters

| Name      | Example                          | Required | Description                                |
|-----------|----------------------------------|----------|--------------------------------------------|
| PackageId | Cisco.CiscoWebexMeetings        | True     | The Winget package you wish to install.   |
| Scope     | msstorewinget               | True     | The Source to use when obtaining the package. |

## Process

Please Reference [SWM - Software Management - Powershell - Invoke-WingetProcessor](<../../powershell/Invoke-WingetProcessor.md>) for process.

## Output

- Script log













