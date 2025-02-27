---
id: '512415ba-2cc0-44bc-b0da-84a5e5d02adf'
title: 'Deploy-Teams'
title_meta: 'Deploy-Teams'
keywords: ['deploy', 'teams', 'installation', 'update']
description: 'Documentation for the Deploy-Teams command to install or update the Teams Machine-Wide Installer to the latest version.'
tags: ['installation', 'software', 'update', 'windows']
draft: false
unlisted: false
---

## Description
Installs the Teams Machine-Wide Installer.

## Requirements
- PowerShell Version 5+

## Usage
- The script queries the Microsoft Teams manifest on GitHub to retrieve the latest available version of the Teams Machine-Wide Installer.
- It checks the currently installed version of the Teams Machine-Wide Installer on the system.
- If the installed version is older than the latest available version, the script proceeds with the update process. Otherwise, it notifies that the latest version is already installed.
- By constructing the download URL based on the system architecture, the script downloads the latest version of the Teams Machine-Wide Installer.
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



