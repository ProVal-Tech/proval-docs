---
id: '6ca0f24e-6a38-47a0-8858-0a47143355ad'
title: 'Update Visual Studio Code'
title_meta: 'Update Visual Studio Code to the Latest Version'
keywords: ['update', 'visualstudio', 'code', 'installer', 'application']
description: 'This document outlines a script designed to update the installed version of Visual Studio Code to the latest available version. It includes details on user requirements, prompts during the update process, and variables used within the script.'
tags: ['installation', 'software', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

The purpose of this script is to update the installed version of Visual Studio Code to the latest available version.

If the `User Installer` is installed, then the user must be logged on to the computer for the script to work. If the user is using the application, they will be prompted to close it:  
![Close Application Prompt](../../../static/img/SWM---Software-Update---Upgrade-Visual-Studio-Code-Latest/image_1.png)

The application cannot be upgraded if it is running.

This prompt is inevitable for computers with the `User Installer` version of the application installed and should not be canceled:  
![Inevitable Prompt](../../../static/img/SWM---Software-Update---Upgrade-Visual-Studio-Code-Latest/image_2.png)

**Note:** The script cannot be used to install a new instance of the application.

## Sample Run

![Sample Run](../../../static/img/SWM---Software-Update---Upgrade-Visual-Studio-Code-Latest/image_3.png)

## Variables

| Name          | Description                                         |
|---------------|-----------------------------------------------------|
| LatestVersion | Latest version of the application released by Microsoft |
| DownloadURL   | URL to download the latest version of the application |
| Log           | Script log to write before exiting                   |

## Output

- Script logs
