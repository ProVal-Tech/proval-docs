---
id: '67bf4b52-4294-4773-b4df-7d75c9387954'
slug: /67bf4b52-4294-4773-b4df-7d75c9387954
title: 'Sysmon'
title_meta: 'Sysmon'
keywords: ['sysmon', 'windows', 'monitor', 'service', 'configuration', 'installation', 'uninstallation', 'endpoint']
description: 'This document provides a comprehensive guide on how to install and uninstall the Sysmon application on Windows computers, including optional enhancements for monitoring configurations and services. It covers the necessary scripts, parameters, and variables required for effective deployment and management of Sysmon.'
tags: ['installation', 'uninstallation', 'windows']
draft: false
unlisted: false
---

## Summary

This solution handles the optional application Sysmon.

### Base Scripts:
1. Install Sysmon application
2. Uninstall Sysmon application

### Optional Script Enhancement Suggestions:
1. Monitor Configuration

**Intended Target:** Windows Computers

## Install Sysmon on an Endpoint (Sysmon - Install)

1. Import the Sysmon Install Script.
2. Set the optional config file as a user parameter, or leave it blank if you do not have a specified config file.

![Image](../../static/img/docs/67bf4b52-4294-4773-b4df-7d75c9387954/image_1.webp) or ![Image](../../static/img/docs/67bf4b52-4294-4773-b4df-7d75c9387954/image_2.webp)

## Uninstall Sysmon From an Endpoint (Sysmon - Uninstall)

1. Import the Sysmon Uninstall Script.
2. Run the script.

![Image](../../static/img/docs/67bf4b52-4294-4773-b4df-7d75c9387954/image_3.webp)

### Optional Script Enhancement Suggestions

1. Service Monitor
   1. Sysmon64 - 64-bit service
   2. Sysmon - 32-bit service
2. Pick an appropriate group that you would like to monitor for Sysmon services and set up a remote monitor.
   1. Name: △ Sysmon Service Monitor
   2. Limit to: Feel free to add a limit if desired.
   3. Alert style: Once
   4. Alert Template: Service - Restart autocorrect script template.
   5. Check Action: System
   6. Check Type: Run File
   7. Execute Info: `C:/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -ExecutionPolicy Bypass -Command "If ((Get-Service | Where-Object -Property Name -Match 'Sysmon').count -eq 0) {return} else { Get-Service | Where-Object -Property Name -Match 'Sysmon' | ForEach-Object { if ($_.status -ne 'Running') { return $_.DisplayName; } else { return } } }"`
   8. Condition: Missing
   9. Interval: 300

![Image](../../static/img/docs/67bf4b52-4294-4773-b4df-7d75c9387954/image_4.webp) ![Image](../../static/img/docs/67bf4b52-4294-4773-b4df-7d75c9387954/image_5.webp)

## Variables

### Sysmon - Install

| Name                  | Description                                                                                         |
|-----------------------|-----------------------------------------------------------------------------------------------------|
| Local File Location    | The folder location of where the config file and the zip file will be downloaded.                  |
| Sysmon File Name      | The name of the Sysmon executable file (changes based on bitness).                                 |
| Command Arguments      | The arguments that follow the installation command when installing or uninstalling the application. |
| ExtractResult         | Outcome of the PowerShell script downloading and extracting the Sysmon installer.                  |
| %Shellresult%         | Outcome of the Sysmon installation command.                                                         |
| Full Command          | The full command being run to install/uninstall the application.                                    |

### Sysmon - Uninstall

| Name                  | Description                                                                                         |
|-----------------------|-----------------------------------------------------------------------------------------------------|
| Local File Location    | The folder location of where the config file and the zip file will be downloaded.                  |
| Sysmon File Name      | The name of the Sysmon executable file (changes based on bitness).                                 |
| Command Arguments      | The arguments that follow the installation command when installing or uninstalling the application. |
| Full Command          | The full command being run to install/uninstall the application.                                    |

## Output

- Script log
