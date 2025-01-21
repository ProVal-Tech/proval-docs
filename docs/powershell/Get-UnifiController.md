---
id: ps-get-unificontroller
title: 'Get-UnifiController'
title_meta: 'Get-UnifiController Command'
keywords: ['unifi', 'controller', 'network', 'api']
description: 'Documentation for the Get-UnifiController command to retrieve and return data from a Unifi Controller.'
tags: ['networking', 'software']
draft: false
unlisted: false
---

## Description
Returns a `unifiController` object containing all site data.

## Requirements
- PowerShell v5
- Unifi module

## Usage
1. Imports the Unifi module.
2. Connects to the Unifi API.
3. Creates and returns a Unifi controller object.

```powershell
.\Get-UnifiController.ps1 -TargetName 'localhost' -Port 8443 -Credential $credential
```

## Parameters

| Parameter         | Alias | Required  | Default   | Type        | Description                                                        |
| ----------------- | ----- | --------- | --------- | ----------- | ------------------------------------------------------------------ |
| `TargetName`      |       | True      |           | String      | The host name or the IP address of the target Unifi controller.   |
| `Port`            |       | False     | `8443`    | Int         | The port designated for the Unifi controller.                     |
| `Credential`      |       | True      |           | PSCredential | A credential object to access the Unifi controller.               |

## Output
Location of output for log, result, and error files.

`System.Object`
