---
id: 'cwa-remove-dell-optimizer'
title: 'Remove Dell Optimizer Application'
title_meta: 'Remove Dell Optimizer Application'
keywords: ['dell', 'optimizer', 'uninstall', 'reboot']
description: 'This document outlines a script designed to remove the Dell Optimizer application from Dell computers. It includes instructions for setting a user parameter to control whether the computer should reboot automatically after the application is uninstalled.'
tags: ['uninstallation', 'software', 'windows', 'recovery']
draft: false
unlisted: false
---
## Summary

The purpose of the script is to remove the `Dell Optimizer` application from the Dell computers. The computer needs to be restarted to remove the application completely.  

**Note:** The script will not reboot the computer unless the user parameter `Reboot` is set to `1`.

## Sample Run

Set the value for the user parameter `Reboot` to `1` to forcefully restart the computer post uninstalling the application.  
![Sample Run 1](5078775/docs/13437712/images/19277685)  

Leave the parameter blank to restart the computer manually.  
![Sample Run 2](5078775/docs/13437712/images/19277698)  

#### User Parameters

| Name   | Example | Required | Description                                                                                     |
|--------|---------|----------|-------------------------------------------------------------------------------------------------|
| Reboot | 1       | False    | Set it to 1 to restart the computer after removing the application. Leave it blank to restart the computer later/manually. |

## Output

- Script Log


