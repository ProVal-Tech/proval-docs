---
id: '711a44cb-a3af-49b7-b501-9ed088ba1d36'
slug: /711a44cb-a3af-49b7-b501-9ed088ba1d36
title: 'Get-RecentRebootReason'
title_meta: 'Get-RecentRebootReason'
keywords: ['reboot', 'reboot-reason', 'recent-reboot', 'recent-reboot-reason', 'reboot-audit']
description: 'Retrieves recent reboot reasons from the Windows Event Log.'
tags: ['auditing', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-06-06
---

## Overview

Retrieves recent reboot and shutdown reasons from the Windows **System** event log and returns them as clean PowerShell objects.

Run this script as Administrator from your RMM or locally. By default, it checks the most recent reboot-related events and includes who initiated them when possible.

## Requirements

- Windows with PowerShell 5.1 or later
- Must be run as **Administrator**
- Internet access on first run (to install or update the `Strapper` module from PSGallery)

## What It Does

1. Ensures modern TLS is enabled for online module operations.
2. Verifies the `Strapper` module is installed and up to date:
    - Checks local version
    - Checks PSGallery version
    - Updates or installs if needed
    - Imports the module and initializes the Strapper environment
3. Queries the **System** event log for reboot-related events.
4. Optionally limits results to events within the last X minutes.
5. Resolves event SIDs to usernames when possible.
6. Returns structured reboot reason objects to the pipeline.
7. Writes informational and error logging through Strapper logging.

## Event Logs and IDs Checked

The script queries the **System** log using XML filtering and checks:

- **Event ID 1074**
  - Planned restart/shutdown events (for example: user or process initiated)

- **Event ID 6008**
  - Unexpected shutdown events

For Event ID 6008, the provider is restricted to these names:

- `Microsoft-Windows-Eventlog`
- `EventLog`
- `Microsoft-Windows-Kernel-General`

If `-ThresholdMinutes` is provided and greater than 0, the query adds a time filter so only events within that recent time window are returned.


## Default Behavior

If no parameters are provided, the script:

- Checks the most recent **14** matching events (`-MaxEvents 14`)
- Searches without a time threshold
- Logs a summary of the time span between oldest and newest returned events

## Basic Usage

### Get recent reboot reasons (default)

```powershell
.\Get-RecentRebootReason.ps1
```

### Limit how many events are returned

```powershell
.\Get-RecentRebootReason.ps1 -MaxEvents 5
```

### Only check the last 60 minutes

```powershell
.\Get-RecentRebootReason.ps1 -ThresholdMinutes 60
```

### Combine both filters

```powershell
.\Get-RecentRebootReason.ps1 -ThresholdMinutes 120 -MaxEvents 10
```

## Parameters

| Parameter | Required | Default | Description |
|---|---|---|---|
| `-MaxEvents` | No | `14` | Maximum number of matching event records to retrieve |
| `-ThresholdMinutes` | No | Off | Restricts results to events created within the last N minutes |

## Output Objects

The script returns one object per matching event with these properties:

| Property | Description |
|---|---|
| `TimeCreated` | Original event timestamp |
| `FormattedDate` | Short date/time string for quick reading |
| `Id` | Event ID (`1074` or `6008`) |
| `User` | Resolved username, approximated username, SID, or `N/A` |
| `Message` | Full event message from the log |

## Username / SID Resolution Logic

For each event, the script tries to identify the user:

1. Translate SID to `DOMAIN\User` using .NET SID translation.
2. If translation fails, look up SID in:

    ```PlainText
    HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList\*
    ```

3. If a profile path is found, it approximates user from the profile folder name.
4. If no profile match is found, it returns the SID string.
5. If event has no user SID, returns `N/A`.

## Logging

The script logs major actions and outcomes, including:

- Start of reboot reason checks
- Event match counts and summary timing details
- Time-threshold match summary when `-ThresholdMinutes` is used
- SID translation and profile approximation warnings
- Event log query errors
- Final completion message

Strapper environment logging writes to standard script log files in the script run location:

```PlainText
    Get-RecentRebootReason-log.txt
    Get-RecentRebootReason-error.txt
```

## Common Scenarios

**Need quick reboot history for troubleshooting:**

```powershell
.\Get-RecentRebootReason.ps1 -MaxEvents 20
```

**Need only very recent reboot activity (for alert follow-up):**

```powershell
.\Get-RecentRebootReason.ps1 -ThresholdMinutes 30 -MaxEvents 10
```

**Need to identify whether reboot was planned or unexpected:**

- `Id = 1074` generally indicates planned restart/shutdown activity
- `Id = 6008` indicates unexpected shutdown

## Notes

- If no matching events are found, the script logs that condition and returns no objects.
- `-ThresholdMinutes` only applies when greater than 0.
- The script is designed for local machine event log inspection.
