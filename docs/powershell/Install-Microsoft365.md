---
id: ps-install-microsoft365
title: 'Install-Microsoft365'
title_meta: 'Install-Microsoft365 Command'
keywords: ['install', 'microsoft365', 'office', 'setup']
description: 'Documentation for the Install-Microsoft365 command to install Microsoft 365 Apps for Business or any Microsoft 365 product with XML configuration support.'
tags: ['installation', 'office365', 'setup', 'configuration']
draft: false
unlisted: false
---
## Description
Enables the installation of Microsoft 365 Apps for Business or any Microsoft 365 product with XML configuration support.

## Requirements
- PowerShell 5+
- Windows 10+ / Server 2016+
- Must be run as an Administrator

## Usage
1. Checks for elevated session privileges. If not elevated, it warns and exits.
2. Sets up the environment
3. Check if a custom XML configuration path is provided. If not, it creates a default configuration for Microsoft 365 Apps for Business installation.
4. Downloads and extracts the Office Deployment Tool (ODT) in a dedicated ODT folder within the script's directory.
5. Uses the ODT with the provided or default XML configuration to start the installation of Microsoft 365 Apps.
6. Cleans up the ODT folder after the installation is complete. Optionally, restart the computer if requested.


```powershell
.\Install-Microsoft365.ps1
Installs Microsoft 365 Apps for Business with default configuration.

```powershell
.\Install-Microsoft365.ps1 -XMLPath "C:\Path\To\config.xml"
Installs Microsoft 365 using the specified local XML configuration file.

```powershell
.\Install-Microsoft365.ps1 -XMLPath "https://contoso.com/config.xml" -Restart
Installs Microsoft 365 using the specified XML configuration from a URL and restarts the computer after installation.

## Parameters
| Parameter   | Alias | Required | Default | Type   | Description                          |
| ----------- | ----- | -------- | ------- | ------ | ------------------------------------ |
| `XMLPath`   |       | False    |         | Switch | The URL/path to the XML config file  |
| `Restart`   |       | False    | $False  | Switch | Restart after the install            |

## Output
    .\Install-Microsoft365-log.txt
    .\Install-Microsoft365-error.txt
