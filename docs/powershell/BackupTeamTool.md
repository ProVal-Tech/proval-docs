---
id: ps-backupteamtool
title: 'BackupTeamTool'
title_meta: 'BackupTeamTool Command'
keywords: ['speedtest', 'restart', 'download', 'files']
description: 'Documentation for the BackupTeamTool command to assist the Backup Team with various tasks.'
tags: []
draft: false
unlisted: false
---

## Description
The script provides various functions for performing actions such as running a speed test, restarting services, and downloading files to help Backup Team in their day-to-day tasks.

## Requirements
Run as administrator

## Usage
1. The script begins by setting up the environment, including updating the NuGet package provider, setting the PowerShell Gallery as a trusted repository, and ensuring the Strapper module is installed and up to date.

2. The script defines several functions to perform specific tasks:
   - `SpeedTest`: Downloads the SpeedTest.net CLI tool, extracts it, and runs a speed test using the tool. The results are logged and displayed.
   - `RestartService`: Restarts specified services using a separate PowerShell script retrieved from a remote location.
   - `DownloadFile`: Downloads a file from a specified URL and saves it to the designated download path.
   - `ExtractFile`: Extracts the contents of a specified file using the 7-Zip utility, which is also downloaded if necessary.
   - `SetDownloadPath`: Updates the default download path for subsequent file downloads.

3. The script defines menu functions to provide a user-friendly interface for executing actions:
   - `SpeedTestMenu`: Invokes the `SpeedTest` function to initiate a speed test and display the results.
   - `UpdatePathMenu`: Prompts the user to enter a new download path and updates the default download path accordingly.
   - `StorageCraftMenu`: Displays a menu for performing actions related to StorageCraft, such as restarting services or downloading specific files.
   - `VeeamMenu`: Displays a menu for performing actions related to Veeam, such as restarting services or downloading specific files.

4. The script uses logging functions (`Write-Log`) to record information and errors during the execution of various tasks.

5. The script handles user input and provides options to return to previous menus or exit the script.

By organizing the script into functions and menus, the content operates in a modular and interactive manner. Users can select specific actions from the menu, which triggers the corresponding functions to perform the desired tasks. The script relies on external resources and modules to download files, extract archives, and interact with services. Logging is used to provide feedback and record important information or errors during the execution process.



```powershell
.\BackupTeamTool.ps1
```
    Prompts the user to select an action to perform from a menu.

    Enter the choice of action to perform:
    1. SpeedTest
    2. Change Default Download Path (Default Path: C:\WINDOWS\Temp)
    3. StorageCraft
    4. Veeam
    5. Exit


## Output
    BackupTeamTool-log.txt
    BackupTeamTool-Error.txt









