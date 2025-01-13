---
id: 'cwa-upgrade-windows-10-20h2'
title: 'Upgrade Windows 10 to 20H2 Feature Update'
title_meta: 'Upgrade Windows 10 to 20H2 Feature Update'
keywords: ['windows', 'upgrade', 'feature', 'build', '20h2', 'installation']
description: 'This document outlines a script used to upgrade a Windows 10 operating system to the specific Feature Update version 20H2. It details the required variables, global parameters, and the process involved in executing the upgrade, along with the supported operating systems and expected output.'
tags: ['upgrade', 'windows', 'installation', 'feature', 'setup']
draft: false
unlisted: false
---
## Summary

This script is used to upgrade a Windows 10 operating system to a specific Feature Update version i.e. Windows 10 20H2 build.

Time Saved by Automation: 120 Minutes

## Sample Run

![Sample Run](../../../static/img/Windows-10-Feature-Update-Process-(20H2-Version)/image_1.png)

## Variables

| Variable   | Description                                                                                  |
|------------|----------------------------------------------------------------------------------------------|
| ReleaseID  | This stores the build information of the Windows 10 operating system                       |

### Global Parameters

| Name                    | Example                                                        | Required     | Description                                                                                           |
|-------------------------|----------------------------------------------------------------|--------------|-------------------------------------------------------------------------------------------------------|
| tempdir                 | C:/temp                                                       | True         | This is a path where 20H2 iso will be downloaded.                                                    |
| ZIPURL                  | [http://your.url.here/path/to/20H2.zip](http://your.url.here/path/to/20H2.zip) | True         | This is the link from client site to download the 20H2 zip (It should be ours 20H2 zip to be placed in their location). |
| HoursToWait             | 1                                                              | True         | This sets script to check for upgrade happened or not to target build after process runs in mentioned hour. |
| TargetHash              | 53,5,109,134,124,170,48,240,142,252,3,4,118,182,102,25      | True         | This ensures the files copy, it will only let script work if 20H2 zip file is copied from our site. |
| ftpuser                 | Username                                                       | True/False   | This requires when the 20H2 file is kept at ftp server site and trying to download it from there.   |
| ftppassword             | Password                                                       | True/False   | This requires when the 20H2 file is kept at ftp server site and trying to download it from there.   |
| TargetVersion           | 2009                                                          | True         | This requires to compare the ReleaseID build to allow upgrade if the ReleaseID is lower than TargetVersion. |
| TicketingEnabled        | 1                                                              | True         | This will allow to enable/disable ticketing for failure reporting. <br> 1 - Enable <br> 0 - Disable |
| TicketCreationCategory   | 1                                                              | True         | This helps to set the ticket creation service board.                                                 |

## Process

- This script is used to upgrade a Windows operating system to a specific Feature Update version i.e. Windows 10 20H2 build.
- 20GB of free space on the target system is required.
- The following operating systems have confirmed support for this process:
  - Windows 7 Pro x64
  - Windows 8 Pro x64
  - Windows 8.1 Pro x64
  - Windows 10 Home x64 (All Feature Update Versions)
  - Windows 10 Pro x64 (All Feature Update Versions)
  - Windows 10 Business x64 (All Feature Update Versions)

## Output

- Script log




