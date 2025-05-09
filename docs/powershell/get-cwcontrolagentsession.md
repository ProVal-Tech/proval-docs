---
id: 'd0a99efa-a256-47ca-b916-6c18581ba434'
slug: /d0a99efa-a256-47ca-b916-6c18581ba434
title: 'Get-CWControlAgentSession'
title_meta: 'Get-CWControlAgentSession'
keywords: ['connectwise', 'control', 'session', 'api']
description: 'Documentation for the Get-CWControlAgentSession command to connect to ConnectWise Control via the built-in Plugin API in Automate to obtain a list of computers with their last check-in date and current state.'
tags: ['report', 'software']
draft: false
unlisted: false
---

## Description
This method connects to ConnectWise Control via the built-in Plugin API in Automate to obtain a list of computers with their last check-in date and current state.

## Requirements
- ConnectWise Control with a properly configured ConnectWise Automate plugin.
- ConnectWise Automate with a properly configured ConnectWise Control plugin.

## Usage
1. Stores the ConnectWise Control extension ID.
2. Connects to the Control API with the provided server and token.
3. Submits the request to the API with the requested included properties.
4. Returns a system object containing the requested information.

The system object will contain:
- SessionID
- OnlineStatusControl
- LastConnected
- Name
- ConnectionCount

```powershell
.\Get-CWControlAgentSession.ps1 -Server 'https://something.someplace.com/controlportal' -Token 'SomeAPIKEY' -IncludeProperty Name, ConnectionCount
```

## Parameters
| Parameter          | Alias | Required | Default | Type     | Description                                         |
| ------------------ | ----- | -------- | ------- | -------- | --------------------------------------------------- |
| `Server`           |       | True     |         | String   | The ConnectWise Control server address.             |
| `Token`            |       | True     |         | String   | The API token for ConnectWise Control.              |
| `IncludedProperty` |       | False    |         | String[] | A validated set of optional properties to query.    |
| `Key`              |       | True     |         | Byte[]   | A pre-script designated key to decrypt sensitive information. |

## Output
- `.\Get-CWControlAgentSession-log.txt`
- `.\Get-CWControlAgentSession-error.txt`
