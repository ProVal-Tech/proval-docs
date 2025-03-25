---
id: 'dd445ce7-a149-452c-9b35-dc1adbab4e06'
slug: /dd445ce7-a149-452c-9b35-dc1adbab4e06
title: 'Winget - InstallUpdate'
title_meta: 'Winget - InstallUpdate'
keywords: ['winget', 'package', 'install', 'endpoint']
description: 'This document provides a detailed guide on how to install a Winget package on a target endpoint, including sample runs, dependencies, and parameters required for the process.'
tags: ['installation', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

This document explains how to install a Winget package on a target endpoint.

## Sample Run

![Sample Run](../../../static/img/Winget---InstallUpdate/image_1.png)

## Dependencies

- [SWM - Software Management - Powershell - Invoke-WingetProcessor](<../../powershell/Invoke-WingetProcessor.md>)

### Global Parameters

| Name        | Example                | Required | Description                                                                 |
|-------------|------------------------|----------|-----------------------------------------------------------------------------|
| ProjectName | Invoke-WingetProcessor | True     | This represents the name of the Agnostic script and should not be changed. |

### User Parameters

| Name      | Example                          | Required | Description                                |
|-----------|----------------------------------|----------|--------------------------------------------|
| PackageId | Cisco.CiscoWebexMeetings        | True     | The Winget package you wish to install.   |
| Scope     | msstorewinget                   | True     | The source to use when obtaining the package. |

## Process

Please refer to [SWM - Software Management - Powershell - Invoke-WingetProcessor](<../../powershell/Invoke-WingetProcessor.md>) for the process.

## Output

- Script log


