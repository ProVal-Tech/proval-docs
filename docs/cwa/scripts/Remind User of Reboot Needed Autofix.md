---
id: 'cwa-send-popup-reboot-reminder'
title: 'Send Popup Reboot Reminder'
title_meta: 'Send Popup Reboot Reminder'
keywords: ['popup', 'reminder', 'reboot', 'user', 'notification']
description: 'This script sends a popup message to the logged-in user, reminding them to reboot their machine if it has not been rebooted in the last 30 days. Ideal for monitors that check machine uptime and require user action to maintain performance.'
tags: ['notification', 'windows', 'security', 'performance']
draft: false
unlisted: false
---
## Summary

This script will send a popup message to the logged-in user to remind them to reboot their machine.  
This script can only be used as autofix for monitors that check for the machine which have not been rebooted since 30 days.  

**Time Saved by Automation:** 2 Minutes

## Sample Run

![Sample Run](../../../static/img/Remind-User-of-Reboot-Needed-Autofix/image_1.png)

## Process

- The script first verifies if the user is logged in or not. If not, exit out.
- If the user is logged in, send a popup message to the user to reboot their machine online.




