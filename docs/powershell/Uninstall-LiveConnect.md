---
id: '1787ff26-0a78-4f87-8189-31a9363071d6'
title: 'Uninstall-LiveConnect'
title_meta: 'Uninstall-LiveConnect'
keywords: ['uninstall', 'liveconnect', 'remove', 'cleanup']
description: 'Documentation for the Uninstall-LiveConnect command to uninstall LiveConnect and remove associated directories.'
tags: ['software', 'uninstallation']
draft: false
unlisted: false
---

## Description
The `Uninstall-LiveConnect` script is designed to completely uninstall LiveConnect from the system. It removes all associated directories and files, ensuring a clean uninstallation process.

## Requirements
- A system reboot is required after running the script to complete the uninstallation process.

## Usage
- The script begins by identifying and terminating any running instances of LiveConnect.
- It proceeds to uninstall the LiveConnect application from the system.
- The script then removes all associated directories, including those in `ProgramData` and `AppData`, to ensure no residual files are left behind.

```powershell
./Uninstall-LiveConnect.ps1
```

## Output
The script generates the following output files to log the uninstallation process:

- `.\\Uninstall-LiveConnect-log.txt`: Contains detailed logs of the uninstallation process.
- `.\\Uninstall-LiveConnect-data.txt`: Contains data related to the uninstallation process.
- `.\\Uninstall-LiveConnect-error.txt`: Contains any error messages encountered during the uninstallation process.
