---
id: ps-deploy-teams
title: 'Deploy-Teams'
title_meta: 'Deploy-Teams Command'
keywords: ['deploy', 'teams', 'installation', 'update']
description: 'Documentation for the Deploy-Teams command to install or update the Teams Machine-Wide Installer to the latest version.'
tags: ['installation', 'update', 'software', 'windows']
draft: false
unlisted: false
---
## Description
Installs Teams Machine-Wide Installer.

## Requirements
- PowerShell Version 5+

## Usage
- It queries the Microsoft Teams manifest on GitHub to retrieve the latest available version of Teams Machine-Wide Installer.
- The script checks the currently installed version of Teams Machine-Wide Installer on the system.
- If the installed version is older than the latest available version, the script proceeds with the update process. Otherwise, it notifies that the latest version is already installed.
- Constructing the download URL based on the system architecture, the script downloads the latest version of Teams Machine-Wide Installer.
- The script initiates the installation process using the downloaded MSI file, performing a silent installation without user interaction.
- After installation, the script checks if the installed version matches the expected latest version.
- Throughout the process, the script logs relevant information, including download attempts, installation success or failure, and version details.
- Any errors encountered during the process are logged with appropriate details for further analysis. The logs provide a comprehensive record of the script's execution.


This script does not require any additional parameters for its execution. To use the script, simply run it in a PowerShell environment.

```powershell
.\Deploy-MSTeams.ps1
```

## Output
- Deploy-MSTeams-log.txt
- Deploy-MSTeams-Error.txt