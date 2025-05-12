---
id: '6b58263a-cc4f-45d1-bf29-2e777f0cf644'
slug: /6b58263a-cc4f-45d1-bf29-2e777f0cf644
title: 'Dell Command update - New v 3.1+'
title_meta: 'Dell Command update - New v 3.1+'
keywords: ['dell', 'command', 'update', 'installation', 'scan']
description: 'This document provides a script for installing and running a scan for Dell Command Update, detailing user parameters and process steps to ensure a smooth installation and update experience.'
tags: ['dell', 'firmware', 'installation', 'update']
draft: false
unlisted: false
---

## Summary

This script installs and runs a scan for Dell Command Update.

**Time Saved by Automation:** 10 Minutes

## Sample Run

![Sample Run](../../../static/img/docs/6b58263a-cc4f-45d1-bf29-2e777f0cf644/image_1.webp)

## Variables

| Variable | Description                                   |
|----------|-----------------------------------------------|
| Logs     | This contains the Dell command execution failure logs |

### User Parameters

| Name         | Example | Required | Description                                                                                                   |
|--------------|---------|----------|---------------------------------------------------------------------------------------------------------------|
| DCU_INSTALL  | 1       | False    | Set it to 1 to install/upgrade DCU. No scans or updates will be performed.                                   |
| DCU_SCAN     | 1       | False    | Set it to 1 to install/upgrade DCU, run a scan, and perform no updates.                                      |
| DCU_BIOS     | 1       | False    | Set it to 1 to install/upgrade DCU if needed, run a scan, execute updates, and attempt a BIOS update.       |

## Process

This script installs Dell Command Update if it is not present, updates it to version 3.1.2 if needed, configures it, runs a scan, and then performs a one-time Dell firmware update by default if no value is provided in the user parameters.

## Output

- Script log