---
id: 'da7e6b68-3ac3-4d15-9969-ca843a187d2d'
title: 'Current Agent PowerShell Version'
title_meta: 'Current Agent PowerShell Version'
keywords: ['powershell', 'agent', 'version', 'script', 'query']
description: 'This document provides a detailed overview of a script that obtains the current agent PowerShell version, supported across all versions of PowerShell. It includes sample runs, dependencies, variables, process description, and expected output.'
tags: ['performance', 'windows']
draft: false
unlisted: false
---

## Summary

This script obtains the current agent PowerShell version. The script is supported in all versions of PowerShell to collect its version.

## Sample Run

![Sample Run](../../../static/img/PowerShell-Version-Audit/image_1.png)

## Dependencies

[PowerShell Version Audit](https://proval.itglue.com/DOC-5078775-10218221)

## Variables

| Name   | Description                     |
|--------|---------------------------------|
| psout  | This contains the PowerShell Version |

#### Script States

| Name               | Example    | Description                     |
|--------------------|------------|---------------------------------|
| PowerShellVersion   | 2022.5.1   | This contains the PowerShell Version |

## Process

This script runs a PowerShell query that is supported by all Windows operating systems and collects the data to the Script State, which replicates to the dataview. It also stores the date when the PowerShell version was last checked.

## Output

- Script log
- Script state
- Dataview

