---
id: '1691cc51-ef36-451d-9086-ca69c6ef85d8'
title: 'Disable Windows PowerShell v2 Feature'
title_meta: 'Disable Windows PowerShell v2 Feature'
keywords: ['disable', 'powershell', 'windows', 'feature', 'installation']
description: 'This script disables the Windows PowerShell v2 feature, ensuring that a newer version is installed beforehand. It checks for the presence of a PowerShell version greater than v2, installs it if necessary, and then disables v2. The process includes logging and error handling to ensure successful execution.'
tags: ['windows', 'installation', 'configuration', 'security', 'update']
draft: false
unlisted: false
---
## Overview

This Script will disable Windows Powershell v2 feature, providing a newer version is installed.

## Requirements

A version of PowerShell greater than v2 must be installed to disable PowerShell v2, this script will attempt to satisfy that requirement before disabling anything. The removal of the .NET 3.0 feature requires a reboot.

## Process

1. If there is a PowerShell version installed greater than v2, then we will disable PowerShell V2.
2. If there is no PowerShell version installed greater than v2:
   1. Install a version greater than v2.
   2. Verify that the installation was successful, error if not.
   3. Disable PowerShell version 2.

How does the content operate and accomplish the goal?

## Payload Usage

```
./Disable-PowershellVersion2.ps1
```

Checks for a version of PowerShell greater than v2, if there is one present disables the PowerShell V2 feature, if it's not present it attempts to install a newer PowerShell version so v2 can be disabled.

## Output

```
    ./Disable-PowershellVersion2-log.txt
    ./Disable-PowershellVersion2-error.txt
```

## Locations

| Payload                     | /repo/script/Disable-PowershellVersion2.ps1 |
|-----------------------------|-----------------------------------------------|
| Automate                    |                                               |
| ConnectWise RMM             |                                               |
| Kaseya                      |                                               |
| Datto RMM                   |                                               |







