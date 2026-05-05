---
id: 'e5150f2e-6b8a-4156-9c1b-513e602b36a1'
slug: /e5150f2e-6b8a-4156-9c1b-513e602b36a1
title: 'Installed Remote Access Tools'
title_meta: 'Installed Remote Access Tools'
keywords: ['installed-tools', 'remote-access', 'remote-access-tools-auditing']
description: 'The purpose of this solution is to identify a curated set of remote access tools.'
tags: ['windows', 'auditing', 'security']
draft: false
unlisted: false
last_update:
  date: 2026-05-05
---

## Purpose

The purpose of this solution is to identify a curated set of remote access tools. It analyzes multiple data sources, including uninstall registry keys, active processes, installed services, and known executable paths, to ensure accurate detection. Optional exclusions can be configured using a System Property, allowing flexibility in tailoring the results. Supported tool display names :

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

## Associated Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [Script - Get Installed Remote Access Tools](/docs/f65c8e46-3df5-4a2e-b230-2392f5ad364e) | Script | This script performs a comprehensive inventory of endpoints to identify a curated set of remote access tools. Set the `SetEnvironment` parameter to `1` during the initial execution of the script to create the system property. |
| [Table - pvl_installed_remote_access_tools](/docs/122991ce-8d88-448b-a4a2-4bde95ccc149) | Custom Table | Stores the data to be displayed in the  [Dataview - Remote Access Tools Report](/docs/ee8f046e-a795-4850-b7f8-a18b4e1f2562). It is populated by the [Script - Get Installed Remote Access Tools](/docs/f65c8e46-3df5-4a2e-b230-2392f5ad364e) |
| [Dataview - Remote Access Tools Report](/docs/ee8f046e-a795-4850-b7f8-a18b4e1f2562) | Custom Table | Displays the lists remote access tools detected on systems |
| [Internal Monitor - Execute Script -  Get Installed Remote Access Tools](/docs/c31b954a-fe64-4790-8cc0-5b86f5519ad0) | Internal Monitor | Executes the [Script - Get Installed Remote Access Tools](/docs/f65c8e46-3df5-4a2e-b230-2392f5ad364e) script once weekly against the Windows machines. |
| **`△ Custom - Execute Script - Get Installed Remote Access Tools`** | Alert Template | Alert Template to be used with [Internal Monitor - Execute Script -  Get Installed Remote Access Tools](/docs/c31b954a-fe64-4790-8cc0-5b86f5519ad0) |

## Implementation

- Import the [Script - Get Installed Remote Access Tools](/docs/f65c8e46-3df5-4a2e-b230-2392f5ad364e) from Proval Plugin.
- Set the `SetEnvironment` parameter to `1` during the initial execution of the [Script - Get Installed Remote Access Tools](/docs/f65c8e46-3df5-4a2e-b230-2392f5ad364e)  to create the system property.
- Execute the script against any machine in the environment. This will create the [Table - pvl_installed_remote_access_tools](/docs/122991ce-8d88-448b-a4a2-4bde95ccc149).
- Import the [Dataview - Remote Access Tools Report](/docs/ee8f046e-a795-4850-b7f8-a18b4e1f2562) from Proval Plugin.
- Import the [Internal Monitor - Execute Script -  Get Installed Remote Access Tools](/docs/c31b954a-fe64-4790-8cc0-5b86f5519ad0) from Proval Plugin.
- Import the **`△ Custom - Execute Script - Get Installed Remote Access Tools`** from Proval Plugin.


## Changelog

### 2026-05-05

- Initial version of the document
