---
id: '6f37a14e-64e0-4bf1-a840-806cdf2ab2b4'
slug: /6f37a14e-64e0-4bf1-a840-806cdf2ab2b4
title: 'Software - Attempt Silent Uninstall Using String Params'
title_meta: 'Software - Attempt Silent Uninstall Using String Params'
keywords: ['uninstall', 'application', 'script', 'database', 'silent']
description: 'This document describes a script that fetches the uninstallation string from the database for a specified application and attempts to uninstall it. The script utilizes silent switches for a seamless process and logs the results for verification.'
tags: ['database', 'software', 'uninstallation', 'windows']
draft: false
unlisted: false
---

## Summary

This script fetches the uninstallation string from the database for the defined application specified in the parameter `@AppName@` and then attempts to uninstall the application. If `uninstall.exe` is found in the uninstallation string, it will attempt to uninstall the application using silent switches.

**Time Saved by Automation:** 10 Minutes

## Sample Run

![Sample Run](../../../static/img/Software---Attempt-Silent-Uninstall-Using-String-Params/image_1.png)

### User Parameters

| Name     | Example  | Required | Description                                   |
|----------|----------|----------|-----------------------------------------------|
| AppName  | Dropbox  | True     | Application name that needs to be uninstalled |

## Process

When the script runs, it will prompt the user for the parameter `AppName`, which needs to be filled in. The script will then check if the software is installed on the machine. If it is, it will fetch the uninstallation string from the database for the specified application and attempt to uninstall it. If `uninstall.exe` is found in the uninstallation string, the script will use silent switches to uninstall the application. The script also verifies whether the software was successfully uninstalled and displays the result in the script's logs section.

## Output

- Script log


