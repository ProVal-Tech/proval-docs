---
id: '7a5a36e2-53b5-4a14-aa2b-0b214ac40767'
title: 'Adobe License Detail'
title_meta: 'Adobe License Detail'
keywords: ['adobe', 'license', 'edf', 'windows', 'sqlite3']
description: 'This document outlines a script designed to collect the Adobe license key from Windows agents and store it in a custom EDF named "Adobe License Key". It details the dependencies, variables, process, and expected output, including logs and dataviews.'
tags: ['adobe', 'windows']
draft: true
unlisted: false
---

## Summary

This script collects the Adobe license key and stores it in the custom EDF "Adobe License Key".

## Sample Run

![Sample Run](<../../../static/img/Adobe-License-Detail/image_1.png>)

## Dependencies

[Adobe License Detection](<./Adobe License Detection.md>)

## Variables

| Name                | Description                             |
|---------------------|-----------------------------------------|
| Output              | This variable stores the Adobe License Key |
| Adobe License Key   | EDF that stores the License key        |

## Process

This script can run on any Windows agent. It first checks whether the agent has the Adobe product installed. If it does, the script downloads the "sqlite3.exe" file from the following URL: [https://bitbucket.org/provaltech/downloads/downloads/sqlite3.exe](https://bitbucket.org/provaltech/downloads/downloads/sqlite3.exe) and executes it. Additionally, it runs a PowerShell script to fetch the Adobe License key and stores it in the EDF. This information is also displayed in the dataview.

## Output

- Script log
- EDF
- Dataview