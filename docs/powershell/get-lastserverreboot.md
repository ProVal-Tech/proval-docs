---
id: 'ab26f055-f420-4e35-8241-8f868c940b6d'
slug: /ab26f055-f420-4e35-8241-8f868c940b6d
title: 'Get-LastServerReboot'
title_meta: 'Get-LastServerReboot'
keywords: ['reboot', 'server', 'workstation', 'uptime', 'monitoring', 'threshold', 'alerting']
description: 'Alerts if a device has not been rebooted within a configurable number of days.'
tags: ['monitoring', 'reboot', 'alerting', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-06-26
---

## Description

Alerts if a device (workstation or server) hasn't been rebooted within a configurable number of days (and optionally minutes). Designed for RMM automation to proactively flag devices that have exceeded their expected reboot cycle.

## Requirements

- Windows with PowerShell 5.1 or later
- Internet access on first run (to install or update the `Strapper` module from PSGallery)

## Usage

If no parameters are provided, the script uses a default threshold of **8 days** and alerts (exit code 1) if the device has not rebooted within that window.

### Use default 8-day threshold

```powershell
.\Get-LastServerReboot.ps1
```

### Set a custom day threshold

```powershell
.\Get-LastServerReboot.ps1 -ThresholdDays 14
```

### Test with a short minute-based threshold

```powershell
.\Get-LastServerReboot.ps1 -ThresholdMinutes 30
```

### Combine days and minutes

```powershell
.\Get-LastServerReboot.ps1 -ThresholdDays 7 -ThresholdMinutes 720
```

## Parameters

| Parameter          | Alias | Required | Default | Type  | Description                                                                                                      |
| ------------------ | ----- | -------- | ------- | ----- | ---------------------------------------------------------------------------------------------------------------- |
| `ThresholdDays`    |       | False    | `8`     | Int   | Number of days since last reboot before alerting. Defaults to `0` when only `-ThresholdMinutes` is specified.     |
| `ThresholdMinutes` |       | False    | `0`     | Int   | Number of minutes to use as the threshold (or to add to `-ThresholdDays` when both are specified).                |

`-ThresholdDays` and `-ThresholdMinutes` can be used independently or together:

- If **neither** is specified, the default threshold is **8 days**.
- If only `-ThresholdDays` is specified, that value is the threshold.
- If only `-ThresholdMinutes` is specified, `-ThresholdDays` is automatically set to `0` so the threshold is based solely on minutes.
- If **both** are specified, their values are combined into a single threshold.

## Output

| Exit Code | Meaning                                                    |
| --------- | ---------------------------------------------------------- |
| `0`       | Device is within the reboot threshold                      |
| `1`       | Device has exceeded the reboot threshold (alert condition)  |

Log files are written to the script directory and are **overwritten on each run** so only the most recent execution is stored:

```plaintext
Get-LastServerReboot-log.txt
Get-LastServerReboot-error.txt
```

Each run logs:

- Device name
- Last reboot timestamp
- Current uptime (days, hours, minutes)
- Configured threshold
- Result (OK with time remaining, or ALERT with uptime details)

If the last boot time cannot be retrieved, the script logs an error and exits with code 1.

## Changelog

### 2026-06-26

- Initial version of the document
