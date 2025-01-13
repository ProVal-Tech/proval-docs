---
id: 'cwa-popup-message-script'
title: 'Send Popup Message to Logged-in User for Patching'
title_meta: 'Send Popup Message to Logged-in User for Patching'
keywords: ['popup', 'message', 'user', 'patching', 'maintenance']
description: 'This document describes a script that sends a popup message to the currently logged-in user, requesting them to leave their machine online for necessary patching and maintenance. The script helps ensure that systems remain available for updates, enhancing overall security and performance.'
tags: ['notification', 'windows', 'security', 'setup']
draft: false
unlisted: false
---
## Summary

This script will send a popup message to the logged-in user to leave their machine online for patching/maintenance.

**Time Saved by Automation:** 2 Minutes

## Sample Run

![Sample Run](..\..\..\static\img\Remind-User-of-Patching-Window-Autofix\image_1.png)

## Process

- The script first verifies if the user is logged in or not. If not, exit out.
- If a user is logged in, send a popup message to the user to leave their machine online.



