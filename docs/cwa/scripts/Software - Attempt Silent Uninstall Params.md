---
id: 'd6d1444e-6802-41d1-ae96-cd48c71e2e8b'
title: 'Uninstall Application Script'
title_meta: 'Uninstall Application Script for ConnectWise Automate'
keywords: ['uninstall', 'application', 'script', 'database', 'automation']
description: 'This document describes a script that fetches the uninstallation string for a specified application from the database and attempts to uninstall it. It includes user parameters, process details, and output logs, making it a useful tool for managing software uninstallation efficiently.'
tags: ['database', 'software', 'uninstallation', 'windows']
draft: false
unlisted: false
---

## Summary

This script will fetch the uninstallation string from the database for the defined app in the parameter `@AppName@` and then attempt to uninstall the application.  
**Time Saved by Automation:** 10 Minutes

## Sample Run

![Sample Run](../../../static/img/Software---Attempt-Silent-Uninstall-Params/image_1.png)

#### User Parameters

| Name     | Example      | Required | Description                               |
|----------|--------------|----------|-------------------------------------------|
| AppName  | Team Viewer  | True     | Application name that needs to be uninstalled |

## Process

When the script runs, it will ask for a parameter `AppName`, which needs to be filled by the user. This script will then check if the software is installed on the machine. If it is, the script will fetch the uninstallation string from the database for the defined app in the parameter `@AppName@` and attempt to uninstall the application. The script also verifies whether the software was uninstalled successfully and displays the result in the script's logs section.

## Output

- Script log
