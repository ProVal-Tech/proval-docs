---
id: 'cwa-install-chocolatey-app'
title: 'Install Chocolatey Application'
title_meta: 'Install Chocolatey Application - Script Overview'
keywords: ['chocolatey', 'installer', 'upgrade', 'application', 'automation']
description: 'This document provides an overview of a script that installs Chocolatey and manages the installation or upgrade of specified applications. It includes details on dependencies, user parameters, and the process flow, ensuring successful application management through automation.'
tags: ['installation', 'software', 'upgrade', 'chocolatey', 'windows']
draft: false
unlisted: false
---
## Summary

The script will attempt to install Chocolatey and then install/upgrade the application with the name defined in the parameter. It will then check if the application was successfully installed, and exit or fail depending on the status.

Time Saved by Automation: 8 Minutes

## Sample Run

![Sample Run](..\..\..\static\img\CHOCO---Install-Application\image_1.png)

## Dependencies

- Parameter must be a valid Choco installer command
  - [Chocolatey Community](https://community.chocolatey.org/)

## Variables

- `@chocoout@` -> Upgrades/Installs the Application you specified
- `@chocolist@` -> grabs a list of chocolatey apps

#### User Parameters

| Name     | Example   | Required | Description                                        |
|----------|-----------|----------|----------------------------------------------------|
| AppName  | audacity  | True     | This is the chocolatey application install string   |

## Process

1. Chocolatey is downloaded and installed on the targeted machine
2. Runs the 'upgrade' command to update or install the requested application
3. Verifies that chocolatey successfully installed the application
   1. Logs success in the Automate Script logs if installed
   2. Logs failed in the Automate Script logs if didn't install

## Output

- Script log



