---
id: ps-get-cwcontrolagentsession
title: 'Get-CWControlAgentSession'
title_meta: 'Get-CWControlAgentSession Command'
keywords: ['connectwise', 'control', 'session', 'api']
description: 'Documentation for the Get-CWControlAgentSession command to connect to ConnectWise Control via the built-in Plugin API in Automate to obtain a list of computers with their last check-in date and current state.'
tags: ['configuration', 'software', 'report']
draft: false
unlisted: false
---
## Description
Method to connect to Connectwise Control via built in Plugin API in Automate to obtain a list of computers with their last check in date and current state.

## Requirements
Connectwise Control with properly configured Connectwise Automate plugin.
Connectwise Automate with properly configured Connectwise Control plugin.

## Usage
1. Stores the Connectwise control extension id.
2. Connects to the control api with passed server and token.
3. Submits the request to the api with the requested included properties.
4. Returns a system object containing requested information.


Return a system object containing,
    SessionID
    OnlineStatusControl
    LastConnected
    Name
    ConnectionCount

```powershell
.\Get-CWControlAgentSession.ps1 -Server 'https://something.someplace.com/controlportal' -token 'SomeAPIKEY' -IncludeProperty Name, ConnectionCount
```

## Parameters
| Parameter         | Alias | Required  | Default   | Type      | Description                               |
| ----------------- | ----- | --------- | --------- | --------- | ----------------------------------------- |
| `Server`          |       | True      |           | String    | The Connectwise Control server address.   |
| `Token`           |       | True      |           | String    | The api token for Connectwise Control.     |
| `IncludedProperty`|       | False     |           | String[]  | A validate set of optional properties to query .   |
| `Key`             |       | True      |           | Byte[]    | A Pre script designated key to decrypt sensitive information  |

## Output

    .\Get-CWControlAgentSession-log.txt
    .\Get-CWControlAgentSession-error.txt
