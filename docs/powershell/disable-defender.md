---
id: 'ps-disable-defender'
slug: /ps-disable-defender
title: 'Disable Defender'
title_meta: 'Disable Defender'
keywords: ['Windows Defender', 'SentinelOne', 'antivirus', 'real-time protection']
description: 'Disables Windows Defender real-time protection when a supported third-party antivirus service is detected.'
tags: ['security']
draft: false
unlisted: false
last_update:
  date: 2025-06-04
---

## Description

Disables Windows Defender real-time protection when a supported third-party antivirus service is detected. If Defender is already disabled, no action is taken.

## Requirements

- PowerShell 5+
- Administrative privileges

## Process

1. Checks for the presence of a supported third-party antivirus service (currently SentinelOne).
2. If no supported AV service is found, exits without changes.
3. Queries Windows Defender real-time protection status.
4. If Defender is already disabled, exits without changes.
5. Disables Defender real-time protection.

## Usage

Checks for SentinelAgent service and disables Defender if it is enabled.

```powershell
.\Disable-Defender.ps1
```

## Supported Antivirus Products

| Product      | Service Name   |
|--------------|----------------|
| SentinelOne  | SentinelAgent  |

Additional products can be added to the `$supportedAVServices` array in the script.

## Output

    .\Disable-Defender-log.txt
    .\Disable-Defender-error.txt

## Changelog

### 2025-06-04

- Initial version of the document
