---
id: '052ad6fb-db8f-41f4-991f-f3c9d73b3b1c'
slug: /052ad6fb-db8f-41f4-991f-f3c9d73b3b1c
title: 'Automate and ScreenConnect Uninstaller [macOS]'
title_meta: 'Automate and ScreenConnect Uninstaller [macOS]'
keywords: ['rmm','automate','Screenconnect','uninstallation']
description: 'Removes ScreenConnect (ConnectWise Control) installations from macOS systems'
tags: ['application','uninstallation']
draft: false
unlisted: false
last_update:
  date: 2026-03-17
---

## Overview
This script fully removes both ConnectWise Automate and ScreenConnect/ConnectWise Control agents from **macOS** by stopping services, cleaning related files, and deleting all associated components, with optional targeting for specific ScreenConnect instances.

## Sample Run

`Play Button` > `Run Automation` > `Script`  
![SampleRun1](../../../static/img/docs/b97b3d2c-ecc6-42ff-9236-36b14765c9b7/samplerun1.webp)

Search and select `Automate and Screenconnect Uninstaller [macOS]`

![Image1](../../../static/img/docs/052ad6fb-db8f-41f4-991f-f3c9d73b3b1c/image1.webp)

## Parameters

| Name | Example | Required | Default | Type | Description |
| ---- | ------- | -------- | ------- | ---- | ----------- |
| InstanceID| 7df67d57637499t6 | False | - | String | To uninstall a specific client/instance enter the InstanceID here. By default, all instances will be removed. |

## Automation Setup/Import

[Automation Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/scripts/automate-and-screenconnect-uninstaller.sh)

## Output

- Activity Details  

## Changelog

### 2026-03-17

- Initial version of the document

