---
id: ps-get-latestinstalledcu
title: 'Get-LatestInstalledCU'
title_meta: 'Get-LatestInstalledCU Command'
keywords: ['cumulative', 'update', 'windows', 'patch']
description: 'Documentation for the Get-LatestInstalledCU command to retrieve the most recent cumulative update installed on the system.'
tags: ['windows', 'update', 'configuration']
draft: false
unlisted: false
---
## Description
Using the computer's Build number, retrieve the most recent cumulative update that has been installed on the system from the official Microsoft websites.

## Requirements
The script will not support any operating system not on this list because Microsoft only releases CU for the following operating systems:
-Microsoft Windows 10
-Microsoft Windows 11
-Microsoft Windows Server 2016
-Microsoft Windows Server 2019
-Microsoft WindowsServer 2022

## Usage
1. The script starts by setting the error handling behavior and configuring the security protocol for web requests.
2. It retrieves information about the current operating system using the Get-CimInstance cmdlet.
3. Based on the operating system's name, it determines the appropriate comparison URL for gathering release information.
    1. Microsoft Windows 10: https://learn.microsoft.com/en-us/windows/release-health/release-information
    2. Microsoft Windows Server 2016: https://learn.microsoft.com/en-us/windows/release-health/release-information
    3. Microsoft Windows Server 2019: https://learn.microsoft.com/en-us/windows/release-health/release-information
    4. Microsoft Windows 11: https://learn.microsoft.com/en-us/windows/release-health/windows11-release-information
    5. Microsoft Windows Server 2022: https://support.microsoft.com/en-us/topic/windows-server-2022-update-history-e1caa597-00c5-4ab9-9f3e-8212fe80b2ee
4. If the operating system is unsupported, an exception is thrown.
5. The script retrieves the OS build number and version information.
6. If the build number cannot be obtained from the previous step, it falls back to using the `ver` command to retrieve the OS build.
7. The script then parses the web page content from the comparison URL to find the relevant KB (Knowledge Base) ID and support URL.
8. The script formats the cumulative update string by combining the release date, KB ID, and month of the update.
9. Finally, it returns the cumulative update information as a custom object containing the last installed CU, OS build, release date, and KB ID.


```powershell
    .\Get-LatestInstalledCU.ps1
```
Returns the basic information of the latest installed cumulative update on the system.
e.g.,
    LastInstalledCU : 2023-05-09 KB5026372 May Cumulative Update
    OSBuild         : 10.0.22621.1702
    ReleaseDate     : 2023-05-09
    KBid            : KB5026372