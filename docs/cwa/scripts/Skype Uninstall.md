---
id: '8ada9bce-67c7-4493-b40f-5412933cc16e'
title: 'Uninstall Skype Script'
title_meta: 'Uninstall Skype Script for Efficient Removal'
keywords: ['uninstall', 'skype', 'script', 'automation', 'software']
description: 'This document provides a detailed overview of a script designed to uninstall Skype from devices. It outlines the process, dependencies, and expected outcomes, ensuring users can efficiently remove the application while saving time through automation.'
tags: ['software', 'uninstallation', 'windows']
draft: false
unlisted: false
---

## Summary

This script will attempt to uninstall Skype.

**Time Saved by Automation:** 10 Minutes

## Sample Run

![Sample Run](../../../static/img/Skype-Uninstall/image_1.png)

## Dependencies

None.

## Process

The script will verify that Skype is installed. If Skype is installed, it will fetch the proper uninstall string from the device, sanitize the string, and then run the uninstall string. The script will then refresh its software inventory and verify if the application was removed successfully.

If Skype is removed successfully, the script will exit with a successful log message. If Skype is not removed, the script will exit with an error and an error log message.

## Output

Script log messages.

