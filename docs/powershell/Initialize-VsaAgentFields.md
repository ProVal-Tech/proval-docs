---
id: ps-initialize-vsaagentfields
title: 'Initialize-VsaAgentFields'
title_meta: 'Initialize-VsaAgentFields Command'
keywords: ['vsa', 'customfields', 'client', 'environment']
description: 'Documentation for the Initialize-VsaAgentFields command to write the ProVal Stack Machine Custom Fields to a new client environment.'
tags: []
draft: false
unlisted: false
---

## Description
Writes the ProVal Stack Machine Custom Fields to a new client environment.

## Requirements
VSAAPI ProVal Module

## Usage
Uses the VSAAPI module to interface with the client environment, setting new CustomFields for the Machine Scope.

```powershell
.\Initialize-VsaAgentFields.ps1 -BaseURL https://vsa.provaltech.com -VsaUserName apiServiceAccount -RestApiToken abcd-efgh-ijkl-mnop
```

## Parameters
| Parameter      | Required | Type   | Description                                    |
| -------------- | -------- | ------ | ---------------------------------------------- |
| `BaseURL`      | True     | String | URL of the Target VSA Environment             |
| `VsaUserName`  | True     | String | VSA User with System Role/Scope and API Access |
| `RestApiToken` | True     | String | REST API Access Token for the VSA User above  |

## Output
- Initialize-VsaAgentFields-Log.txt
- Initialize-VsaAgentFields-error.txt
