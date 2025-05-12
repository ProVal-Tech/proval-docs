---
id: '72c57df5-f535-4d8e-9c04-6acde4c93aef'
slug: /72c57df5-f535-4d8e-9c04-6acde4c93aef
title: 'Remind User of Reboot Needed Autofix'
title_meta: 'Remind User of Reboot Needed Autofix'
keywords: ['popup', 'reminder', 'reboot', 'user', 'notification']
description: 'This script sends a popup message to the logged-in user, reminding them to reboot their machine if it has not been rebooted in the last 30 days. It is ideal for monitors that check machine uptime and require user action to maintain performance.'
tags: ['performance', 'security', 'windows']
draft: false
unlisted: false
---

## Summary

This script sends a popup message to the logged-in user, reminding them to reboot their machine.  
It can only be used as an autofix for monitors that check for machines that have not been rebooted in the last 30 days.  

**Time Saved by Automation:** 2 Minutes

## Sample Run

![Sample Run](../../../static/img/docs/72c57df5-f535-4d8e-9c04-6acde4c93aef/image_1.webp)

## Process

- The script first verifies if the user is logged in. If not, it exits.
- If the user is logged in, it sends a popup message to remind them to reboot their machine.