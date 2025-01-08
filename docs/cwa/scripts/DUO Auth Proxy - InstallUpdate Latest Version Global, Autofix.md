---
id: 'cwa-duo-authentication-proxy-update'
title: 'DUO Authentication Proxy Update Script'
title_meta: 'DUO Authentication Proxy Update Script'
keywords: ['duo', 'authentication', 'proxy', 'update', 'script']
description: 'This document provides a detailed overview of a script designed to install or update the DUO Authentication Proxy application to the latest version. The script can be executed manually or as part of an Autofix from the specified monitor set in ConnectWise Automate. It includes sample runs, dependencies, variables, and ticketing information for handling update failures.'
tags: ['update', 'software', 'ticketing', 'monitoring', 'automation']
draft: false
unlisted: false
---
## Summary

The script installs or updates the DUO Authentication Proxy application to the latest available version. It can either run manually or as an Autofix from the [CWM - Automate - Remote Monitor - ProVal - Development - Software - Update - DUO Auth Proxy](https://proval.itglue.com/DOC-5078775-12528305) monitor set.

## Sample Run

![Sample Run](5078775/docs/12520502/images/17725650)

## Dependencies

- [CWM - Automate - Remote Monitor - ProVal - Development - Software - Update - DUO Auth Proxy](https://proval.itglue.com/DOC-5078775-12528305)

## Variables

| Name               | Description                                                             |
|--------------------|-------------------------------------------------------------------------|
| STATUS             | Status returned by the internal monitor (SUCCESS/FAILED)                |
| ProjectName        | Duo_Auth_Proxy                                                          |
| WorkingDirectory    | C:\ProgramData\_automation\app\Duo_Auth_Proxy                          |
| EXEPath            | C:\ProgramData\_automation\app\Duo_Auth_Proxy\Duo_Auth_Proxy.exe      |
| LatestVersion      | Latest Version of the application                                        |
| Subject            | Ticket Subject                                                          |
| Body               | Ticket Body                                                             |
| Tickid             | Ticketid to comment, if already exists an open/new ticket               |
| PowerShellResult   | Result of the PowerShell command attempting to download and install/update the application |

#### Global Parameters

| Name                  | Example | Required | Description                                                                 |
|-----------------------|---------|----------|-----------------------------------------------------------------------------|
| Ticketcreationcategory | 123     | False    | Set it to a valid ticket category id to enable ticketing on failure. Default is 0 |

## Output

- Script Logs
- Ticket (if enabled)

## Ticketing

**Subject:**

```
DUO Security Authentication Proxy Update Failed on %ComputerName% at %ClientName%
```

**Body:**

```
%Computername%
The quick script to update DUO Security Authentication Proxy has failed - please review / update manually.
Script Logs -
%PowerShellResult%
```

