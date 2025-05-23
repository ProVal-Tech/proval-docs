---
id: 'd0c435d0-7bfb-4d65-aff3-f3db9b5c3ab6'
slug: /d0c435d0-7bfb-4d65-aff3-f3db9b5c3ab6
title: 'Windows Update History Audit'
title_meta: 'Windows Update History Audit'
keywords: ['windows', 'update', 'data', 'epm', 'report']
description: 'This document provides a comprehensive overview of a script that gathers Windows update data and enters it into the EPM - Custom Table - pvl_windows_updates. It includes details on dependencies, variables, global parameters, and the expected output.'
tags: ['database', 'report', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

This document describes a script that gathers Windows update data and enters it into the [EPM - Custom Table - pvl_windows_updates](/docs/d1791eba-107c-4be0-8048-a1d716dae301) table.

## Sample Run

![Sample Run](../../../static/img/docs/d0c435d0-7bfb-4d65-aff3-f3db9b5c3ab6/image_1.webp)

## Dependencies

- [EPM - Data Collection - Get-WindowsUpdateReport](/docs/b5940a1c-0e82-4756-86a2-b49e57d664f1)

## Variables

| Name      | Description                                         |
|-----------|-----------------------------------------------------|
| JSONPath  | The file path where the serialized object will be saved. |

#### Global Parameters

| Name        | Value                 | Description                                   |
|-------------|-----------------------|-----------------------------------------------|
| TableName   | pvl_windows_updates    | The table to save the data to.               |
| ProjectName | Get-WindowsUpdateReport | The name of the target agnostic script.      |

## Output

- Script Log
- [pvl_windows_updates](/docs/d1791eba-107c-4be0-8048-a1d716dae301)