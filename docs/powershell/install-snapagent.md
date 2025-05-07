---
id: '0cf14533-c145-4a77-8ea7-8c70476768a9'
slug: /0cf14533-c145-4a77-8ea7-8c70476768a9
title: 'Install-SnapAgent'
title_meta: 'Install-SnapAgent'
keywords: ['install', 'snapagent', 'software', 'monitoring']
description: 'Documentation for the Install-SnapAgent command to install SnapAgent on Windows computers.'
tags: ['installation', 'software', 'windows']
draft: false
unlisted: false
---

## Description
Installs SnapAgent on Windows computers.

## Requirements
- PowerShell v5+
- Installer package URL

## Usage 
- Checks if the URL is provided.
- If not, it logs that the URL is missing.
- If the URL is detected, it downloads `snap_agent_installer.exe` to the working directory `C:\ProgramData\_automation\app\SnapAgent`.
- It then validates the downloaded installer package.
- If downloaded, it executes the command to install it.
- After execution, it sleeps for 30 seconds and then checks if SnapAgent is installed.
- If not found, it checks the installation directory `C:\Program Files (x86)\Blackpoint\SnapAgent\Snap_Agent.exe`.
- If not found, it logs the error to the file `.\Install-SnapAgent-Error.txt`.
- If detected, it executes SnapAgent from there and monitors its appearance in the Programs and Features for three instances with a delay of 60 seconds each.
- If SnapAgent still doesn't show up, it logs the error to the file `.\Install-SnapAgent-Error.txt`.
- For all checks, it logs information to the file `.\Install-SnapAgent-Log.txt`.

Installs SnapAgent. A URL is necessary to install it.

```powershell
.\Install-SnapAgent.ps1 -URL 'ProvideURL'
```

## Parameters
| Parameter         | Alias | Required  | Default   | Type      | Description                               |
| ----------------- | ----- | --------- | --------- | --------- | ----------------------------------------- |
| `URL`             |       | True      |           | String    | The URL needed to install the SnapAgent   |

## Output
- `.\Install-SnapAgent-Log.txt`
- `.\Install-SnapAgent-Error.txt`

