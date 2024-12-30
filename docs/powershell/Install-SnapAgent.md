---
id: ps-install-snapagent
title: 'Install-SnapAgent'
title_meta: 'Install-SnapAgent Command'
keywords: ['install', 'snapagent', 'software', 'monitoring']
description: 'Documentation for the Install-SnapAgent command to install SnapAgent on Windows computers.'
tags: ['installation', 'software', 'windows']
draft: false
unlisted: false
---
## Description
Installs SnapAgent on the Windows computers.

## Requirements
    Powershell v5+
    Installer package URL

## Usage 
- It checks if the URL Provided.
- If not, then it logs the URL is missing.
- If URL detected, then it downloads the snap_agent_installer.exe to the working directory "C:\ProgramData\_automation\app\SnapAgent".
- It then validates the installer package downloaded.
- If downloaded then executes the command to install it.
- After execution it goes for a sleep of 30 seconds and then validates the SnapAgent installed or not.
- If not then it checks the installation directory "C:\Program Files (x86)\Blackpoint\SnapAgent\Snap_Agent.exe".
- If not found then it logs the error log file .\Install-SnapAgent-Error.txt with the error result.
- If detected then it executes the SnapAgent from here and monitors the SnapAgent showing up in the Program and features for three times with a delay of 60 seconds each.
- If still the SnapAgent doesn't show up, it logs the error log file .\Install-SnapAgent-Error.txt with the error result.
- For all above checks it logs the information to the .\Install-SnapAgent-Log.txt file.


Installs SnapAgent. URL is necessary to install it

```powershell
.\Install-SnapAgent.ps1 -URL 'ProvideURL'
```

## Parameters
| Parameter         | Alias | Required  | Default   | Type      | Description                               |
| ----------------- | ----- | --------- | --------- | --------- | ----------------------------------------- |
| `URL`             |       | True      |           | String    | The URL needed to install the SnapAgent   |

## Output

    .\Install-SnapAgent-Log.txt
    .\Install-SnapAgent-Error.txt
