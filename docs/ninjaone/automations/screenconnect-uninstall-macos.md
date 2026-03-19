---
id: 'f44b5186-4991-4b70-ba9c-1559706fcb6a'
slug: /f44b5186-4991-4b70-ba9c-1559706fcb6a
title: 'ScreenConnect - Uninstall [macOS]'
title_meta: 'ScreenConnect - Uninstall [macOS]'
keywords: ['rmm','automate','Screenconnect','uninstallation']
description: 'Removes ScreenConnect (ConnectWise Control) installations from macOS systems'
tags: ['application','uninstallation']
draft: false
unlisted: false
last_update:
  date: 2026-03-17
---

## Overview
This script is designed to remove ScreenConnect (ConnectWise Control) installations from **macOS** systems. It can either perform a full cleanup by removing all installed ScreenConnect client instances, or it can target and uninstall a specific client instance when provided with its unique client ID.

## Sample Run

`Play Button` > `Run Automation` > `Script`  
![SampleRun1](../../../static/img/docs/b97b3d2c-ecc6-42ff-9236-36b14765c9b7/samplerun1.webp)

Search and select `Screenconnect - Uninstall [macOS]`

![Image1](../../../static/img/docs/f44b5186-4991-4b70-ba9c-1559706fcb6a/image1.webp)

## Parameters

| Name | Example | Required | Default | Type | Description |
| ---- | ------- | -------- | ------- | ---- | ----------- |
| InstanceID| 7df67d57637499t6 | False | - | String | To uninstall a specific client/instance enter the InstanceID here. By default, all instances will be removed. |

## Automation Setup/Import

[Automation Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/scripts/screenconnect-uninstall-macos.sh)

## Output

- Activity Details  

## Changelog

### 2026-03-17

- Initial version of the document
