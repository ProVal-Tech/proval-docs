---
id: 'd657bd73-5526-4f27-93bb-9dbae3fe2f6e'
slug: /d657bd73-5526-4f27-93bb-9dbae3fe2f6e
title: 'Set-LastLoggedOnUser'
title_meta: 'Set-LastLoggedOnUser'
keywords: ['user', 'login', 'session', 'windows']
description: 'Documentation for the Set-LastLoggedOnUser command to set the last logged-on user in Windows.'
tags: ['security', 'windows']
draft: false
unlisted: false
---

## Description

This script manages the last logged-in user's information displayed on the Windows login screen and can optionally restart the computer to apply changes.

## Requirements

The user must have logged on to the computer at least once to be set at the login screen by this script.

## Usage

- Ensures the `-Username` or `-Set` parameter is provided and validates the structure of the parameters.
- Imports the 'Strapper' module and sets the environment for 'Strapper'.
- If the `-Clear` parameter is specified:
  - Logs the intention to clear the last logged-in user's information.
  - Iterates through registry keys related to the last logged-in user and attempts to clear each key.
  - Logs any failures encountered during the clearing process.
- If the `-Username` parameter is specified:
  - Formats the username properly, adding a domain prefix if necessary.
  - Logs the intention to set the specified user as the last logged-in user.
  - Determines the SID for the specified user.
  - Defaults the display name to the username if not provided.
  - Creates an array of registry settings to be updated.
  - Iterates through the registry settings and updates each key with the appropriate value.
  - Logs any failures encountered during the setting process.
- If the `-Restart` parameter is specified:
  - Initiates an immediate forced restart of the computer.
- If the `-Restart` parameter is not specified:
  - Logs a reminder to restart the computer at the earliest convenience to apply the changes.

```powershell
.\\Set-LastLoggedOnUser.ps1 -Clear
```
Clears the last logged-in user's information from the login screen.

```powershell
.\\Set-LastLoggedOnUser.ps1 -Username 'Domain\\User' -DisplayName 'User Name'
```
Sets the specified domain user as the last logged-in user on the login screen with an optional display name.

```powershell
.\\Set-LastLoggedOnUser.ps1 -Username 'User' -DisplayName 'User Name'
```
Sets the specified local user as the last logged-in user on the login screen with an optional display name.

```powershell
.\\Set-LastLoggedOnUser.ps1 -Username 'Domain\\User' -Restart
```
Sets the specified user as the last logged-in user and restarts the computer immediately to apply the changes.

## Parameters

| Parameter      | ParameterSet | Required | Type   | Description                                                                                  |
|----------------|--------------|----------|--------|----------------------------------------------------------------------------------------------|
| `Clear`        | `Clear`      | True     | Switch | Clears the last logged-in user's information from the login screen.                         |
| `Username`     | `Set`        | True     | String | Sets the specified username as the last logged-in user. The username should be in the format 'Domain\\User' or 'User'. |
| `DisplayName`  | `Set`        | False    | String | Optionally specifies the display name to set for the last logged-in user. If not provided, it defaults to the username. |
| `Restart`      | `Set`, `Clear` | False  | String | Optionally restarts the computer to apply the changes immediately.                          |

## Output

- .\\Set-LastLoggedOnUser-Log.txt
- .\\Set-LastLoggedOnUser-Error.txt