---
id: 'b9420698-4c50-42f5-8a9e-6834d03a9ebf'
title: 'SWM - Software Configuration - Remove Dell Optimizer'
title_meta: 'SWM - Software Configuration - Remove Dell Optimizer'
keywords: ['dell', 'optimizer', 'uninstall', 'reboot']
description: 'This document outlines a script designed to remove the Dell Optimizer application from Dell computers. It includes instructions for setting a user parameter to control whether the computer should reboot automatically after the application is uninstalled.'
tags: ['recovery', 'software', 'uninstallation', 'windows']
draft: false
unlisted: false
---

## Summary

The purpose of the script is to remove the `Dell Optimizer` application from Dell computers. The computer needs to be restarted to remove the application completely.  

**Note:** The script will not reboot the computer unless the user parameter `Reboot` is set to `1`.

## Sample Run

Set the value for the user parameter `Reboot` to `1` to forcefully restart the computer after uninstalling the application.  
![Sample Run 1](../../../static/img/SWM---Software-Configuration---Remove-Dell-Optimizer/image_1.png)  

Leave the parameter blank to restart the computer manually.  
![Sample Run 2](../../../static/img/SWM---Software-Configuration---Remove-Dell-Optimizer/image_2.png)  

#### User Parameters

| Name   | Example | Required | Description                                                                                     |
|--------|---------|----------|-------------------------------------------------------------------------------------------------|
| Reboot | 1       | False    | Set it to `1` to restart the computer after removing the application. Leave it blank to restart the computer later/manually. |

## Output

- Script Log




