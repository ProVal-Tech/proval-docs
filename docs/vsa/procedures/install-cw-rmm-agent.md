---
id: 'd7c999ba-a742-4251-868f-aa7f7839d7d2'
slug: /d7c999ba-a742-4251-868f-aa7f7839d7d2
title: 'Install - CW RMM Agent'
title_meta: 'Install - CW RMM Agent'
keywords: ['cw-rmm', 'rmm-agent', 'migration', 'cw-rmm-agent']
description: 'This script deploys ConnectWise Asio Platform agents to windows endpoints.'
tags: ['installation', 'application',]
draft: false
unlisted: false
---

## Summary

This script is designed for VSA to deploy the ConnectWise Asio Platform agent to Windows endpoints in a controlled and automated manner. The script requires token during the installation. The token needs to upload under the managed Variables `Token_CWRMM`.

## Sample Run

![run script](../../../static/img/docs/d7c999ba-a742-4251-868f-aa7f7839d7d2/samplerun.webp)

## Parameters

Need to create this variable under the managed files.

- **`<Token_CWRMM>`**

| Parameter         | Required | Type   | Description                                       |
|-------------------|----------|--------|---------------------------------------------------|
| `Token_CWRMM`     | True     | String | Tokem of the agent installation.                  |

![managed-variable](../../../static/img/docs/d7c999ba-a742-4251-868f-aa7f7839d7d2/managedvariables.webp)  

## Output

- Script logs.
- `%ProgramData%_automation\AgentProcedure\CWRMM\AsioAgentInstaller.log`

