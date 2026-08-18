---
id: 'eddc8835-6b4e-4b87-9e25-7a257fb28179'
slug: /eddc8835-6b4e-4b87-9e25-7a257fb28179
title: 'Rename File - Windows'
title_meta: 'Rename File - Windows'
keywords: ['rename', 'windows','file']
description: 'Renames any type of file using the specified file path, current file name, and new file name.'
tags:  ['windows']
draft: false
unlisted: false
last_update:
  date: 2026-08-17
---

## Overview
Renames any type of file using the specified file path, current file name, and new file name. If the new file name already exists, no action is taken and the script exits successfully.

## Sample Run

![SampleRun](../../../static/img/docs/eddc8835-6b4e-4b87-9e25-7a257fb28179/image1.webp)

## Parameters

| Name | Example | Accepted Values | Required | Default | Type | Description |
| ---- | ------- | --------------- | -------- | ------- | ---- | ----------- |
| FilePath | `C:\Temp` | String | True | - | String/Text | The directory containing the file. |
| OldFileName | `OldFile.txt` | String | True | - | String/Text | The current name of the file. |
| NewFileName | `NewFile.txt` | String | True | - | String/Text | The new name for the file. |

## Automation Setup/Import

[Automation Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/scripts/rename-file-windows.ps1)

## Output

- Activity Details 

## Changelog

### 2026-08-17

- Initial version of the document
