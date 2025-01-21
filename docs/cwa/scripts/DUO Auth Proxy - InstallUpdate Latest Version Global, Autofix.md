---
id: '775e0b37-b55c-47fb-bec6-a01314ac123f'
title: 'DUO Authentication Proxy Update Script'
title_meta: 'DUO Authentication Proxy Update Script'
keywords: ['duo', 'authentication', 'proxy', 'update', 'script']
description: 'This document provides a detailed overview of a script designed to install or update the DUO Authentication Proxy application to the latest version. The script can be executed manually or as part of an Autofix from the specified monitor set in ConnectWise Automate. It includes sample runs, dependencies, variables, and ticketing information for handling update failures.'
tags: ['software', 'ticketing', 'update']
draft: false
unlisted: false
---

## Summary

The script installs or updates the DUO Authentication Proxy application to the latest available version. It can run either manually or as an Autofix from the [CWM - Automate - Remote Monitor - ProVal - Development - Software - Update - DUO Auth Proxy](<../monitors/DUO Auth Proxy.md>) monitor set.

## Sample Run

![Sample Run](../../../static/img/DUO-Auth-Proxy---InstallUpdate-Latest-Version-Global,-Autofix/image_1.png)

## Dependencies

- [CWM - Automate - Remote Monitor - ProVal - Development - Software - Update - DUO Auth Proxy](<../monitors/DUO Auth Proxy.md>)

## Variables

| Name               | Description                                                             |
|--------------------|-------------------------------------------------------------------------|
| STATUS             | Status returned by the internal monitor (SUCCESS/FAILED)                |
| ProjectName        | Duo_Auth_Proxy                                                          |
| WorkingDirectory    | C:/ProgramData/_automation/app/Duo_Auth_Proxy                          |
| EXEPath            | C:/ProgramData/_automation/app/Duo_Auth_Proxy/Duo_Auth_Proxy.exe      |
| LatestVersion      | Latest version of the application                                        |
| Subject            | Ticket subject                                                          |
| Body               | Ticket body                                                             |
| Tickid             | Ticket ID to comment on, if an open/new ticket already exists           |
| PowerShellResult   | Result of the PowerShell command attempting to download and install/update the application |

#### Global Parameters

| Name                  | Example | Required | Description                                                                 |
|-----------------------|---------|----------|-----------------------------------------------------------------------------|
| Ticketcreationcategory | 123     | False    | Set it to a valid ticket category ID to enable ticketing on failure. Default is 0 |

## Output

- Script logs
- Ticket (if enabled)

## Ticketing

**Subject:**

```
DUO Security Authentication Proxy Update Failed on %ComputerName% at %ClientName%
```

**Body:**

```
%ComputerName%
The script to update DUO Security Authentication Proxy has failed - please review/update manually.
Script Logs -
%PowerShellResult%
```

