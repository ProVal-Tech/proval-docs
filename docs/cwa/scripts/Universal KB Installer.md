---
id: '424dfd5c-377f-461f-a57f-80001d839af8'
title: 'Universal KB Installer'
title_meta: 'Universal KB Installer'
keywords: ['install', 'patch', 'windows', 'kbnumber', 'reboot']
description: 'This document provides an overview of a script designed to install specified patches on Windows machines, detailing parameters for rebooting, sample runs, and expected output logs.'
tags: ['installation', 'security', 'software', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

The purpose of this script is to install the desired patch on Windows machines.

## Sample Run

Leave the Reboot parameter blank or set it to '0' to prevent the machine from rebooting.  
![Image](../../../static/img/Universal-KB-Installer/image_1.png)  

Set the Reboot parameter to '1' to reboot the machine.  

![Image](../../../static/img/Universal-KB-Installer/image_2.png)  

### User Parameters

| Name     | Example   | Required | Description                                                                                   |
|----------|-----------|----------|-----------------------------------------------------------------------------------------------|
| KBNumber | 5044285   | True     | KB ID Number of the patch that needs to be installed.                                        |
| Reboot   | 0         | False    | Set this value to '1' to reboot the machine after patch installation during script execution. Leave it blank or set it to '0' to prevent the machine from rebooting. |

## Output

- Script Logs





