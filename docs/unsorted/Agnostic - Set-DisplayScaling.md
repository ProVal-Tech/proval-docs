---
id: 'ee4d2c2e-9944-4dcc-aaac-ab3c60bb15f6'
title: 'Agnostic - Set-DisplayScaling'
title_meta: 'Agnostic - Set-DisplayScaling'
keywords: ['windows', 'scaling', 'display', 'dpi', 'registry']
description: 'This document provides a step-by-step guide on how to set custom display scaling for Windows machines using PowerShell. It covers the necessary requirements, the process to modify registry keys for DPI scaling, and details on how to use the provided script with examples of parameters and expected output.'
tags: ['performance', 'setup', 'windows']
draft: true
unlisted: false
---

## Overview

Set Custom Display Scaling for Windows Machines

## Requirements

- Windows OS
- PowerShell 5

## Process

1. Set the registry path
2. Calculate the display scale value
3. Modify the `LogPixels` and `Win8DpiScaling` registry keys with the calculated value and enable DPI scaling

## Payload Usage

To set custom display scaling, use the following command:

```
./Set-DisplayScaling.ps1 -Scale '150'
```

## Parameters

| Parameter | Alias | Required | Validate Set       | Type   | Description                                   |
|-----------|-------|----------|---------------------|--------|-----------------------------------------------|
| Scale     |       | True     | 100, 125, 150, 175, 200 | Int32  | Percentage to set the display scale           |

## Output

The output files will be:

```
./Set-DisplayScaling-log.txt
./Set-DisplayScaling-Error.txt
```



