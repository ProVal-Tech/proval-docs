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

This script is designed to deploy the ConnectWise Asio Platform agent to Windows endpoints in a controlled and automated manner. The script requires token during the installtion. The token needs to upload under the managed Variables. I have already created a managed variable namely `<Token_CWRMM>`

## Sample Run

![run script](../../../static/img/docs/d7c999ba-a742-4251-868f-aa7f7839d7d2/samplerun.webp)

## Parameters

Need to craete this variable under the managed files.

- **`<Token_CWRMM>`**

# Parameters

| Parameter         | Required | Type   | Description                                       |
|-------------------|----------|--------|---------------------------------------------------|
| `Token_CWRMM`     | True     | String | Tokem of the agent installation.                  |

![managed-variable](../../../static/img/docs/d7c999ba-a742-4251-868f-aa7f7839d7d2/managedvariables.webp)  

## Output

- Script logs.
- `%ProgramData%_automation\AgentProcedure\CWRMM\AsioAgentInstaller.log`

| Time                | Procedure                                            | Description                                                                                                                                                                                                             | User   |
| ------------------- | ---------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------ |
| 4:04:46 pm 8-Jan-26 | Install - CW RMM Agent                               | Success THEN                                                                                                                                                                                                            | Pronoc |
| 4:04:46 pm 8-Jan-26 | Install - CW RMM Agent-0005                          | Success THEN                                                                                                                                                                                                            | Pronoc |
| 4:04:46 pm 8-Jan-26 | Install - CW RMM Agent-0005                          | Agent installed successfully.                                                                                                                                                                                           | Pronoc |
| 4:04:46 pm 8-Jan-26 | Install - CW RMM Agent                               | msiexec /i "%ProgramData%_automation\AgentProcedure\CWRMM\AsioAgentInstaller.msi" TOKEN=6327831e-8d47-467c-88e2-94ba2deb97a5 /qn /norestart /L*V "%ProgramData%_automation\AgentProcedure\CWRMM\AsioAgentInstaller.log" | Pronoc |
| 4:04:44 pm 8-Jan-26 | Install - CW RMM Agent-0004                          | Success THEN                                                                                                                                                                                                            | Pronoc |
| 4:04:43 pm 8-Jan-26 | Install - CW RMM Agent-0004                          | Machine is not under the AU or EU region. Using Default URL.                                                                                                                                                            | Pronoc |
| 4:04:43 pm 8-Jan-26 | Install - CW RMM Agent-0003                          | Success THEN                                                                                                                                                                                                            | Pronoc |
| 4:04:41 pm 8-Jan-26 | Install - CW RMM Agent-0003                          | Machine is not under the AU or EU region. Using Default URL.                                                                                                                                                            | Pronoc |
| 4:04:41 pm 8-Jan-26 | Install - CW RMM Agent-0002                          | Success ELSE                                                                                                                                                                                                            | Pronoc |
| 4:04:41 pm 8-Jan-26 | Install - CW RMM Agent-0002                          | Machine is not under the AU region.                                                                                                                                                                                     | Pronoc |
| 4:04:41 pm 8-Jan-26 | Install - CW RMM Agent-0001                          | Success ELSE                                                                                                                                                                                                            | Pronoc |
| 4:04:41 pm 8-Jan-26 | Install - CW RMM Agent-0001                          | Machine is not under the EU region.                                                                                                                                                                                     | Pronoc |
| 4:04:41 pm 8-Jan-26 | Install - CW RMM Agent                               | en-US                                                                                                                                                                                                                   | Pronoc |
| 4:04:41 pm 8-Jan-26 | Execute Shell Command - Get Results to Variable      | Success THEN                                                                                                                                                                                                            | Pronoc |
| 4:04:41 pm 8-Jan-26 | Execute Shell Command - Get Results to Variable-0001 | Success THEN                                                                                                                                                                                                            | Pronoc |
| 4:04:41 pm 8-Jan-26 | Execute Shell Command - Get Results to Variable-0010 | Success THEN                                                                                                                                                                                                            | Pronoc |
| 4:04:39 pm 8-Jan-26 | Execute Shell Command - Get Results to Variable-0002 | Success THEN                                                                                                                                                                                                            | Pronoc |
| 4:04:39 pm 8-Jan-26 | Execute Shell Command - Get Results to Variable-0003 | Success THEN                                                                                                                                                                                                            | Pronoc |
| 4:04:39 pm 8-Jan-26 | Execute Shell Command - Get Results to Variable-0004 | Success THEN                                                                                                                                                                                                            | Pronoc |
| 4:04:39 pm 8-Jan-26 | Execute Shell Command - Get Results to Variable-0005 | Success ELSE                                                                                                                                                                                                            | Pronoc |
| 4:04:39 pm 8-Jan-26 | Execute Shell Command - Get Results to Variable-0005 | Executing command in 64-bit shell as system: powershell.exe "Get-WinSystemLocale | Select-Object -ExpandProperty Name"                                                                                                  | Pronoc |
| 4:04:37 pm 8-Jan-26 | Execute Powershell Command                           | Success THEN                                                                                                                                                                                                            | Pronoc |
| 4:04:37 pm 8-Jan-26 | Execute Powershell Command-0001                      | Success THEN                                                                                                                                                                                                            | Pronoc |
| 4:04:37 pm 8-Jan-26 | Execute Powershell Command-0002                      | Success THEN                                                                                                                                                                                                            | Pronoc |
| 4:04:37 pm 8-Jan-26 | Execute Powershell Command-0011                      | Success THEN                                                                                                                                                                                                            | Pronoc |
| 4:04:37 pm 8-Jan-26 | Execute Powershell Command-0012                      | Success ELSE                                                                                                                                                                                                            | Pronoc |
| 4:04:37 pm 8-Jan-26 | Execute Powershell Command-0011                      | Powershell command completed!                                                                                                                                                                                           | Pronoc |
| 4:04:34 pm 8-Jan-26 | Execute Powershell Command-0011                      | Creating directory: C:\ProgramData_automation\AgentProcedure\CWRMM                                                                                                                                                      | Pronoc |
| 4:04:34 pm 8-Jan-26 | Execute Powershell Command-0009                      | Success THEN                                                                                                                                                                                                            | Pronoc |
| 4:04:34 pm 8-Jan-26 | Execute Powershell Command-0010                      | Success ELSE                                                                                                                                                                                                            | Pronoc |
| 4:04:34 pm 8-Jan-26 | Execute Powershell Command-0010                      | Not sending output to variable.                                                                                                                                                                                         | Pronoc |
| 4:04:34 pm 8-Jan-26 | Execute Powershell Command-0007                      | Success THEN                                                                                                                                                                                                            | Pronoc |
| 4:04:34 pm 8-Jan-26 | Execute Powershell Command-0008                      | Success THEN                                                                                                                                                                                                            | Pronoc |
| 4:04:34 pm 8-Jan-26 | Execute Powershell Command-0008                      | Custom command detected: New-Item -Type Directory                                                                                                                                                                       | Pronoc |
| 4:04:33 pm 8-Jan-26 | Execute Powershell Command-0003                      | Success THEN                                                                                                                                                                                                            | Pronoc |
| 4:04:33 pm 8-Jan-26 | Execute Powershell Command-0004                      | Success ELSE                                                                                                                                                                                                            | Pronoc |
| 4:04:31 pm 8-Jan-26 | Execute Powershell Command-0002                      | Powershell is present.                                                                                                                                                                                                  | Pronoc |
| 4:04:30 pm 8-Jan-26 | Install - CW RMM Agent                               | Checking and installing the CW RMM Agent.                                                                                                                                                                               | Pronoc |
| 4:04:23 pm 8-Jan-26 | Run Now - Install - CW RMM Agent                     | Procedure scheduled to run at Jan 8 2026 4:04 PM                                                                                                                                                                        | Pronoc |