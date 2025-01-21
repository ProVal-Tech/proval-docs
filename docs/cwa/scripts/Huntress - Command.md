---
id: '134f8e46-d2b2-4d92-9c3c-d1f8f921bf5d'
title: 'Huntress Installation and Uninstallation Script'
title_meta: 'Huntress Installation and Uninstallation Script'
keywords: ['huntress', 'install', 'uninstall', 'reinstall', 'script']
description: 'This document outlines a script designed to manage the installation and uninstallation of the Huntress application on target machines, detailing action parameters, processes, and expected outputs.'
tags: ['installation', 'security', 'software', 'uninstallation', 'windows']
draft: false
unlisted: false
---

## Summary

This script takes an action parameter of 'Install', 'Uninstall', or 'ReInstall' and performs that action on the target machine.

## Sample Run

![Sample Run](../../../static/img/Huntress---Command/image_1.png)

## Variables

Document the various variables in the script. Delete any section that is not relevant to your script.

| Name            | Description                                          |
|-----------------|------------------------------------------------------|
| Installed       | This is 0 (Uninstalled) or 1 (Installed).           |
| UninstallState  | This is 0 (Success) or 1 (Failed).                  |
| InstallState    | This is 0 (Success) or 1 (Failed).                  |

#### Global Parameters

| Name      | Example                       | Required          | Description                                       |
|-----------|-------------------------------|-------------------|---------------------------------------------------|
| Acct_Key  | hfdkjaldhfuinb933487fg0a     | True              | This is the assigned Account Key for Huntress.    |

#### User Parameters

| Name     | Example                                         | Required | Description                                         |
|----------|-------------------------------------------------|----------|-----------------------------------------------------|
| Action   | 'Install', 'Uninstall', or 'ReInstall' - Default = Install | False    | The action you wish to take with the Huntress application. |

## Process

1. Action - Uninstall or Reinstall
   1. Start Uninstall.
   2. Check for method of removal and remove.
   3. Check if still installed.
   4. Return 0 if successfully removed; return 1 if still present - Variable `UninstallStatus`, Logged.
   5. If return is 0 and there is a 'ReInstall' action, then initiate install; otherwise, exit with an error.
2. Action Install - or sent to by Reinstall action
   1. Check if account key applies; set `InstallState` to 1 if not valid and return an error.
   2. Download the application for Mac or Windows.
   3. Execute the installer for Mac or Windows.
   4. Check for the installation.
   5. Return 0 if the software is installed or 1 if Huntress is not installed.
   6. Errors out if failed.

## Output

- Script log
