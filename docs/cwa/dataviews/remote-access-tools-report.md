---
id: 'ee8f046e-a795-4850-b7f8-a18b4e1f2562'
slug: /ee8f046e-a795-4850-b7f8-a18b4e1f2562
title: 'Remote Access Tools Report'
title_meta: 'Remote Access Tools Report'
keywords: ['installed-tools', 'remote-access', 'remote-access-tools-auditing']
description: 'This dataview lists remote access tools detected on systems.'
tags: ['windows', 'auditing', 'security']
draft: false
unlisted: false
last_update:
  date: 2026-05-05
---

## Summary

This dataview displays the lists remote access tools detected on systems, covering a wide range of commonly used tools, along with detailed column descriptions to support clear analysis and reporting. This data is populated by the [Script - Get Installed Remote Access Tools](/docs/f65c8e46-3df5-4a2e-b230-2392f5ad364e)

Supported tool display names : 

- `AeroAdmin`
- `Ammyy Admin`
- `AnyDesk`
- `BeyondTrust`
- `Chrome Remote Desktop`
- `Connectwise Control`
- `DWService`
- `GoToMyPC`
- `LiteManager`
- `LogMeIn`
- `ManageEngine`
- `Ninja RMM`
- `NoMachine`
- `Parsec`
- `Remote Utilities`
- `RemotePC`
- `Splashtop`
- `Supremo`
- `TeamViewer`
- `TightVNC`
- `UltraVNC`
- `VNC Connect (RealVNC)`
- `Zoho Assist`
- `Atera`
- `Automate`
- `Datto RMM`
- `Kaseya`
- `N-Able N-Central`
- `N-Able N-Sight`
- `Syncro`

## Dependencies


- [Script - Get Installed Remote Access Tools](/docs/f65c8e46-3df5-4a2e-b230-2392f5ad364e)
- [Solution - Installed Remote Access Tools](/docs/e5150f2e-6b8a-4156-9c1b-513e602b36a1)


## Columns

| Column | Description |
| ------------------- | ----------------- |
|  Machine Name       | Name of the machine |
|  Client             | Name of the client |
|  Location           | Name of the location |  
|  OS                 | Name of the operating system |
|  Last Contact       | Last contact in Automate |
|  Tool Name          | Name of the Remote Access Tool |
|  Installed          | Installation status of the Remote Access Tool |
|  CurrentlyRunning   | Current running status of the Remote Access Tool |
|  HasRunningService  | Indicates if the Remote Access Tool has a running service |
|  UninstallString    | Uninstall string of the Remote Access Tool |
|  ExePath            | Executable path of the Remote Access Tool | 
|  ScriptRanDate      | Date the script was run for the Remote Access Tool |


## Changelog

### 2026-05-05

- Initial version of the document