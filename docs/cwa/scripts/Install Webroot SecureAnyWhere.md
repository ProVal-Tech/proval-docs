---
id: 'cab8dbad-3675-4e65-863e-dd88a0391fc1'
title: 'Install Webroot SecureAnyWhere'
title_meta: 'Install Webroot SecureAnyWhere'
keywords: ['webroot', 'plugin', 'installation', 'deployment', 'automate']
description: 'This document details a modified script for the Webroot Plugin installation, enabling automatic deployment through ConnectWise Automate. It outlines the script functionality, dependencies, variables, and process for both installed and non-installed software scenarios.'
tags: ['connectwise', 'installation', 'registry', 'security', 'software']
draft: false
unlisted: false
---

## Summary

This script is a modification of the Webroot Plugin included installation script, Install Webroot SecureAnywhere. The script has been modified to provide a plugin-exclusive method of automatic deployment through the ConnectWise Automate Application. The script is split into two parts, separated by a condition. If the software is installed, the script will set the active threats registry value on the target. If the software is not installed, then the script will install the software.

At a minimum, this script can be run on a single agent; however, please review the solution document [SWM - Software Install - Solution - Webroot](<../../solutions/Webroot.md>) for any necessary prerequisites.

***Common Usage***

This script is typically set as an autofix on a monitor looking for the installed software. Please reference the solution document for more information: [SWM - Software Install - Solution - Webroot](<../../solutions/Webroot.md>).

## Dependencies

- ConnectWise Automate Webroot Plugin is required.
- Client and Location EDFs are required.

Reference [SWM - Software Install - Solution - Webroot](<../../solutions/Webroot.md>) for more information on your specific needs.

## Variables

Document the various variables in the script. Delete any section that is not relevant to your script.

| Name                | Description                                                                                         |
|---------------------|-----------------------------------------------------------------------------------------------------|
| ComputerCheck       | Verifies the state of the Computer exclusion EDF.                                                  |
| LocationCheck       | Verifies the state of the Location exclusion EDF.                                                  |
| DisableUninstall    | The DisableUninstall value from the Plugin appears to set system component = 1 in the registry for this application. |
| WSA_Keycode         | The target client Webroot site Keycode from the Webroot Plugin.                                   |
| WSA_KeycodeLength   | The length of the keycode.                                                                          |
| GroupName           | The group name applied to the client in the Webroot Plugin.                                        |
| ActiveThreats       | Verifies the active threats registry objects if the software is installed.                         |

## Process

1. Software is installed.
   1. Computer and Location are not excluded.
      1. Active Threat registry values do not exist.
         - Create the registry objects.
      2. Active Threat registry values exist.
         - Exit.
   2. Computer and Locations are excluded.
      - Log EDF values are not set and exit.
2. Software is not installed.
   1. Computer and Location are excluded.
      - Log EDF values are not set and exit.
   2. Computer and Location are not excluded.
      1. Mac
         - Install for Mac, verify, then exit.
      2. Windows
         - Install for Windows, verify, and exit.



