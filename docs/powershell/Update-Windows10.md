---
id: ps-update-windows10
title: 'Update-Windows10'
title_meta: 'Update-Windows10'
keywords: ['update', 'windows', 'upgrade', 'installation']
description: 'Documentation for the Update-Windows10 command to manage Windows 10 feature updates and prevent automatic reboots.'
tags: ['update', 'windows']
draft: false
unlisted: false
---

## Description
The `Update-Windows10` script manages Windows 10 feature updates, preventing automatic reboots during the upgrade process. It provides a high-level assessment of the system prior to upgrading, verbose logging during the upgrade, and reporting features for success and failure.

## Requirements
- The reboot parameter must be set.

## Usage
1. **Determine if a status update is desired:**
    - `(status Update)`
        1. Returns the values found in the registry regarding the script's reporting feature.
        2. Creates an event log for the completion of the script.

2. **Running the upgrade:**
    - `(Running the upgrade)`
        1. Initializes the reporting feature.
        2. Determines if diagnostic issues are present.
            - `(not present)`
                1. Removes old build notification restrictions.
                2. Removes old upgrades.
                3. Removes temporary files.
                4. Checks free space.
                    - If not enough space, the script exits.
                5. Schedules a new diagnostic to gather logs on the next reboot.
                6. Schedules the status update trigger to run on the next reboot.
                7. Runs a new upgrade.
            - `(present)`
                1. Unregisters any diagnostic scheduled job.
                2. Checks for Windows hardware/software compatibility issues.
                    - `(not present)`
                        1. Outputs to the log that no issues were found.
                    - `(present)`
                        1. Retrieves Windows hardware compatibility.
                        2. Retrieves Windows software compatibility.
                        3. Runs diagnostics log retrieval.

```powershell
.\Update-Windows10.ps1 -Reboot None
```

## Parameters

### Diagnostics
This parameter sets a scheduled task on the system to identify and log errors and configuration issues. The task writes these issues to the appropriate log files. It operates on a timed trigger and should not be executed manually.

### Reboot
This parameter provides options for restarting the system:
- `Auto`: Automatically reboots the system 30 minutes after completion.
- `None`: Prevents the system from rebooting.

### StatusUpdate
This parameter toggles the Status Update feature of the script. It operates on a timed trigger and should not be executed manually.

| Parameter      | Alias | Required | Default | Type         | Description                                                                  |
| ---------------| ----- | -------- | ------- | ------------ | ---------------------------------------------------------------------------- |
| `Diagnostics`  | N/A   | No       | False   | Switch       | Sets a scheduled task to log errors and configuration issues.                |
| `Reboot`       | N/A   | No       |         | ValidateSet  | Options: `Auto` (reboots 30 minutes after completion), `None` (no reboot).  |
| `StatusUpdate` | N/A   | No       | False   | Switch       | Enables status updates for reporting purposes only.                          |

## Output
The script generates log, result, and error files at the following locations:

- `.\\Update-Windows10-log.txt`
- `.\\Update-Windows10-Error.txt`



