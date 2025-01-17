---
id: ps-protect-screenlock
title: 'Protect-ScreenLock'
title_meta: 'Protect-ScreenLock Command'
keywords: ['screenlock', 'screensaver', 'timeout', 'security']
description: 'Documentation for the Protect-ScreenLock command to ensure screen saver settings are enabled and set to a specified timeout.'
tags: ['security', 'windows']
draft: false
unlisted: false
---
## Description
Ensures that the screen saver settings are enabled and set to the specified timeout.

## Requirements
- Requires PowerShell v5
- Administrative privileges are required for execution

## Usage
1. Determines if the machine is domain joined
2. If the OS version is Windows 10 or above, validates the value of 
- `HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System:InactivityTimeoutSecs`
3. The following keys are checked:
- `Control Panel\Desktop:ScreenSaveActive`
- `Control Panel\Desktop:ScreenSaverIsSecure`
- `Control Panel\Desktop:ScreenSaveTimeOut`
- `Control Panel\Desktop:SCRNSAVE.EXE`
- `Software\Policies\Microsoft\Windows\Control Panel\Desktop:ScreenSaveActive`
- `Software\Policies\Microsoft\Windows\Control Panel\Desktop:ScreenSaverIsSecure`
- `Software\Policies\Microsoft\Windows\Control Panel\Desktop:ScreenSaveTimeOut`
- `Software\Policies\Microsoft\Windows\Control Panel\Desktop:SCRNSAVE.EXE`
4. If no value is found in either path, or the value is found and out of scope, then the remediation process is started.
5. If the computer is joined to a domain and the `-DomainException` flag is set, then a GPRESULT will be run and the reports saved in an HTML format in the same directory as the script. 
- `.\gpresult_user.html`
- `.\gpresult_computer.html`
6. If the domain exception is not active, then the following items will be set if they are found to be out of scope:
- `Control Panel\Desktop:ScreenSaveActive = 1`
- `Control Panel\Desktop:ScreenSaverIsSecure = 1`
- `Control Panel\Desktop:ScreenSaveTimeOut = \<Value of the -Timeout parameter>`
- `Control Panel\Desktop:SCRNSAVE.EXE = 'C:\WINDOWS\System32\scrnsave.scr'`


If the machine is part of a domain, then no configuration changes will be made, and instead if any configurations are out of scope, then a GPRESULT will be run and placed in the same directory as the script.
```powershell
Protect-Screenlock.ps1 -Timeout 1200 -DomainException
```

Ensures that all users that have logged into the machine prior will have a screen saver active, protected, and with a maximum timeout of 1200 seconds.
```powershell
Protect-Screenlock.ps1 -Timeout 1200
```
Sets a specified `.scr` screensaver file for all users. It skips setting the screensaver if no path is provided.
```powershell
Protect-Screenlock.ps1 -ScreensaverPath "C:\Temp\screensaver.scr"
```

## Parameters
| Parameter         | Alias | Required  | Default   | Type      | Description                               |
| ----------------- | ----- | --------- | --------- | --------- | ----------------------------------------- |
| `-Timeout`        |       | False     | 900       | Int       | The maximum timeout value for the screen saver. |
| `-DomainException`|       | True      |           | Switch    | Set to run a GPRESULT instead of making configuration changes when a machine is part of a domain. |
| `-ScreenSaverPath`|       | False     |           | String    | Optional parameter to specify the path of the screensaver file. | 

## Output
Location of output for log, result, and error files.

    .\Protect-ScreenLock-log.txt
    .\Protect-ScreenLock-data.txt
    .\Protect-ScreenLock-error.txt
    .\gpresult_computer.html
    .\gpresult_user.html









