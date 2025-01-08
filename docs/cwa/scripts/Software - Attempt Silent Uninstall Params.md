---
id: 'cwa-uninstall-application'
title: 'Uninstall Application Script'
title_meta: 'Uninstall Application Script for ConnectWise Automate'
keywords: ['uninstall', 'application', 'script', 'database', 'automation']
description: 'This document describes a script that fetches the uninstallation string for a specified application from the database and attempts to uninstall it. It includes user parameters, process details, and output logs, making it a useful tool for managing software uninstallation efficiently.'
tags: ['uninstallation', 'software', 'database', 'script', 'windows']
draft: false
unlisted: false
---
## Summary

This script will fetch the uninstallation string from the database for the defined app in the parameter `@AppName@` and then attempt to uninstall the application.  
Time Saved by Automation: 10 Minutes

## Sample Run

![Sample Run](5078775/docs/8116144/images/11299397)

#### User Parameters

| Name     | Example      | Required | Description                               |
|----------|--------------|----------|-------------------------------------------|
| AppName  | Team Viewer  | True     | Application name that needs to be uninstalled |

## Process

When the script runs it will ask for a parameter `AppName` and that needs to be filled by the user. This script will then look if the software is installed on the machine and if yes, it will fetch the uninstallation string from the database for the defined app in the parameter `@AppName@` and then attempt to uninstall the application. This script also verifies if the software was uninstalled or not and displays the result in the scripts logs section.

## Output

- Script log

