---
id: 'dd445ce7-a149-452c-9b35-dc1adbab4e06'
slug: /dd445ce7-a149-452c-9b35-dc1adbab4e06
title: 'Winget - Install/Update'
title_meta: 'Winget - Install/Update'
keywords: ['winget', 'package', 'install', 'endpoint']
description: 'This document provides a detailed guide on how to install a Winget package on a target endpoint, including sample runs, dependencies, and parameters required for the process.'
tags: ['installation', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

This document explains how to install a Winget package on a target endpoint.

## Sample Run

![Sample Run](../../../static/img/docs/d5ce6f1c-94ef-4e78-8e0a-61dd74f8d2cc/image_1.webp)

## Dependencies

- [SWM - Software Management - Powershell - Invoke-WingetProcessor](/docs/8496c2e9-0e52-4961-a1f1-4a95296e8cf7)
- [Solution - Update/Deploy Target Application to Latest Version Winget ](/docs/2487a1f4-6f85-42f3-91d0-4aab8c875021)

### Global Parameters

| Name        | Example                | Required | Description                                                                 |
|-------------|------------------------|----------|-----------------------------------------------------------------------------|
| ProjectName | Invoke-WingetProcessor | True     | This represents the name of the Agnostic script and should not be changed. |

### User Parameters

| Name      | Example                          | Required | Description                                |
|-----------|----------------------------------|----------|--------------------------------------------|
| PackageId | Cisco.CiscoWebexMeetings        | True     | The Winget package you wish to install.   |
| Scope     | msstorewinget                   | True     | The source to use when obtaining the package. |
| OptionalParameter     | --Scope Machine                   | False     | Specifies option parameters to deploy/update/remove the application(s) |

## Process

Please refer to [SWM - Software Management - Powershell - Invoke-WingetProcessor](/docs/8496c2e9-0e52-4961-a1f1-4a95296e8cf7) for the process.

## Output

- Script Log

## FAQ

For auto-deployment of application we have monitor [Application - InstallUpdate - Winget](/docs/9b40d1cd-7886-416f-b56e-11ab3a44befb), does the auto-deployment work with the optionalparameter needed?

No, for auto-deployment you need to copy this script and have to set the OptionalParameter user param to the global parameter with the value set to it and apply that as an autofix because the auto-deployment monitor do not pass the optional parameter value.