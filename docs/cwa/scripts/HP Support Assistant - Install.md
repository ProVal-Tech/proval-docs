---
id: 'f65ad1a0-8f26-40f7-8d72-0e753243c01e'
title: 'HP Support Assistant - Install'
title_meta: 'HP Support Assistant - Install'
keywords: ['hp', 'support', 'assistant', 'installation', 'script']
description: 'This document outlines a script that downloads and installs the HP Support Assistant when a user is logged in. It verifies the installation and logs the outcome, aiming to save time by automating the installation process.'
tags: ['installation', 'logging', 'software']
draft: false
unlisted: false
---

## Summary

This script downloads and installs the HP Support Assistant if a user is logged in, then verifies the installation within the script.

**Time Saved by Automation:** 5 Minutes

## Sample Run

![Sample Run](../../../static/img/HP-Support-Assistant---Install/image_1.png)

## Dependencies

- Requires a user to be logged in
- File Download from: [HP Support Assistant Installer](https://ftp.hp.com/pub/softpaq/sp93001-93500/sp93097.exe)

## Process

1. The script downloads the HP Support software from HP.
2. Queues the installation with the silent switch for the logged-in user.
3. Verifies if the software is detected.
   - If not, logs a failure to install in Automate's scripting logs.

## Output

- Script log



