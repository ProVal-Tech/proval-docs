---
id: 'ab26f055-f420-4e35-8241-8f868c940b6d'
slug: /ab26f055-f420-4e35-8241-8f868c940b6d
title: 'Get-LastServerReboot'
title_meta: 'Get-LastServerReboot'
keywords: ['reboot', 'server', 'uptime', 'monitoring', 'threshold', 'alerting']
description: 'Alerts if a server has not been rebooted within a configurable number of days.'
tags: ['monitoring', 'reboot', 'alerting', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-06-25
---

## Description

Alerts if a server hasn't been rebooted within a configurable number of days (and optionally minutes). Designed for RMM automation to proactively flag servers that have exceeded their expected reboot cycle.

## Requirements

- Windows with PowerShell 5.1 or later
- Internet access on first run (to install or update the `Strapper` module from PSGallery)

## Usage

```powershell
.\Get-LastServerReboot.ps1
```

```powershell
.\Get-LastServerReboot.ps1 -ThresholdDays 14
```

```powershell
.\Get-LastServerReboot.ps1 -ThresholdDays 0 -ThresholdMinutes 30
```

```powershell
.\Get-LastServerReboot.ps1 -ThresholdDays 7 -ThresholdMinutes 720
```

## Parameters

| Parameter          | Alias | Required | Default | Type | Description                                                  |
| ------------------ | ----- | -------- | ------- | ---- | ------------------------------------------------------------ |
| `ThresholdDays`    |       | False    | `8`     | Int  | Number of days since last reboot before alerting             |
| `ThresholdMinutes` |       | False    | `0`     | Int  | Additional minutes to add to the threshold (useful for testing) |

## Output

| Exit Code | Meaning                                                |
| --------- | ------------------------------------------------------ |
| `0`       | Server is within the reboot threshold                  |
| `1`       | Server has exceeded the reboot threshold (alert condition) |

Log files are written to the script directory and overwritten on each run:

```plaintext
Get-LastServerReboot-log.txt
Get-LastServerReboot-error.txt
```

Each run logs:

- Server name
- Last reboot timestamp
- Current uptime (days, hours, minutes)
- Configured threshold
- Result (OK with time remaining, or ALERT with uptime details)

## Changelog
