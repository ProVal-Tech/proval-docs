---
id: ps-install-msteams
title: 'Install-MSTeams'
title_meta: 'Install-MSTeams Command'
keywords: ['install', 'msteams', 'teamsbootstrapper', 'upgrade']
description: 'Documentation for the Install-MSTeams command to install Microsoft Teams using the Teamsbootstrapper.exe and optionally upgrade existing installations.'
tags: ['installation', 'software', 'windows']
draft: false
unlisted: false
---
## Description
Installs Microsoft Teams (New) utilizing Microsoft's teamsbootstrapper.exe and optionally uninstalls and deprovisions the existing Microsoft Teams installation before reinstalling.

## Requirements
Powershell v5

## Usage
1. Sets up the environment by downloading necessary repo packages.
2. Downloads the Teamsbootstrapper.exe from the official Microsoft download URL.
3. If the -Upgrade parameter is specified
    a. Checks if Microsoft Teams is currently installed using the IsAppInstalled function.
    b. If Microsoft Teams is installed, uninstalls the AppxPackage for all users.
    c. Deprovisions Microsoft Teams using the Teamsbootstrapper.exe with the -x flag.
    d. Deletes the registry key HKLM:\SOFTWARE\WOW6432Node\Microsoft\Office\Teams if it exists, which resolves the common error code (0x80004004) where the maglevInstallationSource regkey has been left behind.
    e. Verifies that Microsoft Teams is not installed as a ProvisionedAppPackage or AppxPackage for any user after the uninstallation process.

4. Attempts to install Microsoft Teams using the Teamsbootstrapper.exe with the -p flag.
5. Parses the JSON result from the Teamsbootstrapper.exe command to determine the installation success.
6. Logs the installation result and exits with the appropriate exit code.



Installs Microsoft Teams (New) using the Teamsbootstrapper.exe:

```powershell
.\Install-MSTeams.ps1
```

Uninstalls and deprovisions the existing Microsoft Teams installation before reinstalling:

```powershell
.\Install-MSTeams.ps1 -Upgrade
```

## Parameters
| Parameter | Alias | Required | Default | Type   | Description                                                                                                   |
| --------- | ----- | -------- | ------- | ------ | ------------------------------------------------------------------------------------------------------------- |
| `Upgrade` |       | False    |         | Switch | Will uninstall and deprovision the existing Microsoft Teams installation before reinstalling via teamsbootstrapper.exe. Only run this command if there is an issue preventing teamsbootstrapper.exe from installing.. |

## Output

    .\Install-MSTeams-log.txt
    .\Install-MSTeams-error.txt
