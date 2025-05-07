---
id: '0e4d033e-85f3-4ca6-bbad-17a7848fb42a'
slug: /0e4d033e-85f3-4ca6-bbad-17a7848fb42a
title: 'Set Autologon'
title_meta: 'Set Autologon'
keywords: ['autologon', 'login', 'script', 'sysinternals', 'windows']
description: 'This document describes a script that downloads Autologon.exe from the Sysinternals website and configures it to enable automatic user login after system reboot. It includes user parameters, process details, and expected output.'
tags: ['security', 'setup', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

This script downloads Autologon.exe from the Sysinternals website and passes the Autologon.exe parameters that allow a user to log in automatically after the system is rebooted.

**Time Saved by Automation:** 15 Minutes

## Sample Run

![Sample Run](../../../static/img/docs/0e4d033e-85f3-4ca6-bbad-17a7848fb42a/image_1.webp)

## Dependencies

This script downloads a file from the Microsoft Sysinternals website. If this link changes, the script must be updated to reflect the proper download location.

### User Parameters

| Name     | Example           | Required | Description                                                                                      |
|----------|-------------------|----------|--------------------------------------------------------------------------------------------------|
| Username | user.name         | True     | The username of the user for Autologon on the target device.                                   |
| Domain   | test.com          | False    | The name of the domain. (Leave blank for a local user account.)                                |
| Password | SecurePassword1    | True     | The password for the user for Autologon on the target device.                                   |

## Process

This script downloads Autologon.exe from Microsoft to the LTSvc folder. It then executes the Autologon.exe application, passing the parameters entered by the user running the script. The script will subsequently lock the machine, forcing the Autologon to take effect.

## Output

- Script log messages
