---
id: '175431c0-b3d2-436a-bf40-e72710a17c36'
slug: /175431c0-b3d2-436a-bf40-e72710a17c36
title: 'Webroot - Force Uninstall Reboot'
title_meta: 'Webroot - Force Uninstall Reboot'
keywords: ['webroot', 'uninstallation', 'safe-mode', 'wipe', 'script']
description: 'This document provides a detailed overview of a script designed to boot a machine in safe mode and completely remove Webroot from the target machine. It includes a summary of the process, a sample run, and the expected output, ensuring users can effectively utilize the script for uninstallation.'
tags: ['security', 'setup', 'uninstallation', 'windows']
draft: false
unlisted: false
---

## Summary

This script will boot the machine in safe mode and attempt to completely wipe Webroot from the target machine.

**Time Saved by Automation:** 20 Minutes

## Sample Run

![Sample Run](../../../static/img/docs/175431c0-b3d2-436a-bf40-e72710a17c36/image_1.png)

## Process

This script first checks if the Webroot service is running on the machine. If it is, the script will boot the machine in safe mode and attempt to completely wipe Webroot from the target machine. It further verifies whether the uninstallation was successful.

## Output

- Script log

