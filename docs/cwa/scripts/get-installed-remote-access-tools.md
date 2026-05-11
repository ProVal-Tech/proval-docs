---
id: 'f65c8e46-3df5-4a2e-b230-2392f5ad364e'
slug: /f65c8e46-3df5-4a2e-b230-2392f5ad364e
title: 'Get Installed Remote Access Tools'
title_meta: 'Get Installed Remote Access Tools'
keywords: ['installed-tools', 'remote-access', 'remote-access-tools-auditing']
description: 'This script performs a comprehensive inventory of endpoints to identify a curated set of remote access tools. It analyzes multiple data sources, including uninstall registry keys, active processes, installed services, and known executable paths, to ensure accurate detection.'
tags: ['windows', 'auditing', 'security']
draft: false
unlisted: false
last_update:
  date: 2026-05-05
---

## Summary
This script performs a comprehensive inventory of endpoints to identify a curated set of remote access tools. It analyzes multiple data sources, including uninstall registry keys, active processes, installed services, and known executable paths, to ensure accurate detection.

Optional exclusions can be configured using a System Property, allowing flexibility in tailoring the results.

The collected data is then stored in the custom table [pvl_installed_remote_access_tools](/docs/122991ce-8d88-448b-a4a2-4bde95ccc149) for reporting and further analysis.

Supported tool display names (*use exact spelling when excluding*): 

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

- [Solution - Installed Remote Access Tools](/docs/e5150f2e-6b8a-4156-9c1b-513e602b36a1)

## Sample Run

![Image](../../../static/img/docs/f65c8e46-3df5-4a2e-b230-2392f5ad364e/image1.webp)  

## User Parameters

| Name | Required | Example | Description   |
|---------|---------|---------|---------|
| SetEnvironment | False | 1 | Set the `SetEnvironment` parameter to `1` during the initial execution of the script to create the system property. |


## System Properties

| Name | Required | Example | Description   |
|---------|---------|---------|---------|
| WhiteListedRemoteAccessTools | False | <ul><li>`Datto RMM, Chrome Remote Desktop, AnyDesk`</li><li>`Datto RMM`</li></ul>  | Optional comma-separated list of remote access tool display names that should be excluded from detection. Use this when specific tools are approved for the site and should not be reported by this script. |



## Output

- Script Logs
- Custom table

## Changelog

### 2026-05-05

- Initial version of the document
