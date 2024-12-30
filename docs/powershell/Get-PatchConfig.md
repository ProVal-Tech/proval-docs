---
id: ps-get-patchconfig
title: 'Get-PatchConfig'
title_meta: 'Get-PatchConfig Command'
keywords: ['windows', 'update', 'patch', 'configuration']
description: 'Documentation for the Get-PatchConfig command to retrieve Windows Update settings and services for system patch management.'
tags: ['windows', 'update', 'configuration']
draft: false
unlisted: false
---
## Description
Retrieves Windows Update settings and services for system patch management.

## Requirements
PowerShell v5+

## Usage
1. Set Progress Preference and Security Protocol
2. Update or Install `Strapper` Module
3. Collect Registry Data

- Branch Readiness Level:
    - Path: `HKLM:\SOFTWARE\Microsoft\PolicyManager\default\Update\BranchReadinessLevel`
    - Collect `AllowedValues` and `Value`

- UX Settings:
    - Path: `HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings`
    - Collect `BranchReadinessLevel`, `ActiveHoursStart`, and `ActiveHoursEnd`

- Windows Update Policies:
    - Path: `HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate`
    - Collect various settings including `DisableWindowsUpdateAccess`, `BranchReadinessLevel`, `DeferFeatureUpdates`, etc.

- Automatic Update Policies:
    - Path: `HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU`
    - Collect various settings including `NoAutoUpdate`, `AUOptions`, `ScheduledInstallDay`, etc.

- User Windows Update Policy:
    - Path: `HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\WindowsUpdate`
    - Collect `DisableWindowsUpdateAccess` for each user

- Orchestrator Settings:
    - Path: `HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Orchestrator`
    - Collect `ScanBeforeInitialLogonAllowed` and `UsoDisableAADJAttribution`

4. Collect Service Start Types
    - Collect the start types of following services:
        - `Wuauserv` (Windows Update Service)
        - `Cryptsvc` (Cryptographic Services)
        - `Bits` (Background Intelligent Transfer Service)
        - `TrustedInstaller` (Windows Modules Installer)
        - `UsoSvc` (Update Orchestrator Service)

7. Assemble the Output Object
    - Combine all collected data into the `$PatchConfig` object:
```powershell
        $PatchConfig = [PSCustomObject]@{
            Services = $Services
            BranchReadinessLevel = $BranchReadinessLevel
            UxSettings = $UxSettings
            WindowsUpdate = $WindowsUpdate  
            AutoUpdate = $AutoUpdate
            UserWUPolicy = $UserWUPolicy
            Orchestrator = $Orchestrator
        }
```

8. Return the Output Object

## PatchConfig Object
    The `$PatchConfig` object is a custom PowerShell object that contains configurations and statuses related to Windows Update and system services.

### $PatchConfig Structure

#### 1. **Services**
This sub-object includes the start types of several essential services:
- **`Wuauserv`** (Windows Update Service)
- **`Cryptsvc`** (Cryptographic Services)
- **`Bits`** (Background Intelligent Transfer Service)
- **`TrustedInstaller`** (Windows Modules Installer)
- **`UsoSvc`** (Update Orchestrator Service)

**Possible values for `StartType`**:
- `Automatic`
- `Manual`
- `Disabled`

#### 2. **BranchReadinessLevel**
This sub-object refers to the registry key `HKLM:\SOFTWARE\Microsoft\PolicyManager\default\Update\BranchReadinessLevel`.

**Properties**:
- `Path`: The registry path.
- `AllowedValues`: Possible values for the branch readiness level.
- `Value`: The current value of the branch readiness level.

**Possible values for `AllowedValues` and `Value`**:
- `16` (Semi-Annual Channel)
- `8` (Semi-Annual Channel (Targeted))
- `32` (Release Preview)
- `48` (Insider Fast)
- `64` (Insider Slow)

#### 3. **UxSettings**
This sub-object refers to the registry key `HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings`.

**Properties**:
- `Path`: The registry path.
- `BranchReadinessLevel`: The current branch readiness level.
- `ActiveHoursStart`: The start time for active hours.
- `ActiveHoursEnd`: The end time for active hours.

**Possible values**:
- `BranchReadinessLevel`: As defined above.
- `ActiveHoursStart`: 0-23 (hours).
- `ActiveHoursEnd`: 0-23 (hours).

#### 4. **WindowsUpdate**
This sub-object refers to the registry key `HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate`.

**Properties**:
- `Path`: The registry path.
- `DisableWindowsUpdateAccess`: Whether access to Windows Update is disabled.
- `BranchReadinessLevel`: The current branch readiness level.
- `DeferFeatureUpdates`: Whether feature updates are deferred.
- `DeferFeatureUpdatesPeriodInDays`: Number of days to defer feature updates.
- `DeferQualityUpdates`: Whether quality updates are deferred.
- `DeferQualityUpdatesPeriodInDays`: Number of days to defer quality updates.
- `WUServer`: URL of the Windows Update server.
- `WUStatusServer`: URL of the Windows Update status server.
- `DoNotConnectToWindowsUpdateInternetLocations`: Whether to connect to Windows Update internet locations.
- `TargetGroup`: The target group for updates.
- `AcceptTrustedPublisherCerts`: Whether to accept trusted publisher certificates.
- `ExcludeWUDriversInQualityUpdate`: Whether to exclude Windows Update drivers in quality updates.
- `DisableOSUpgrade`: Whether to disable windows upgrade functionality. (from windows 10 to 11)
- `TargetReleaseVersion`: Whether to limit the Windows feature release version to a certain version.
- `TargetReleaseVersionInfo`: Windows Feature Release version to limit the upgrade of the computer. The computer can not be upgraded above the version stored in this registry key.
- `SetDisableUXWUAccess`: Remove access to use all Windows Update features

**Possible values**:
- `DisableWindowsUpdateAccess`: 0 (not disabled), 1 (disabled).
- `BranchReadinessLevel`: As defined above.
- `DeferFeatureUpdates`: 0 (not deferred), 1 (deferred).
- `DeferFeatureUpdatesPeriodInDays`: 0-365 (days).
- `DeferQualityUpdates`: 0 (not deferred), 1 (deferred).
- `DeferQualityUpdatesPeriodInDays`: 0-30 (days).
- `WUServer`: String (URL).
- `WUStatusServer`: String (URL).
- `DoNotConnectToWindowsUpdateInternetLocations`: 0 (allow connection), 1 (do not allow connection).
- `TargetGroup`: String (group name).
- `AcceptTrustedPublisherCerts`: 0 (not accepted), 1 (accepted).
- `ExcludeWUDriversInQualityUpdate`: 0 (not excluded), 1 (excluded).
- `DisableOSUpgrade`: 0 (not disabled), 1 (disabled).
- `TargetReleaseVersion`: 1 (`TargetReleaseVersionInfo` registry key is enabled), 0 (`TargetReleaseVersionInfo` registry key is not enabled.)
- `TargetReleaseVersionInfo`: String (22H2, 23H2, 24H2 etc.)
- `SetDisableUXWUAccess`: 0 (not disabled), 1 (disabled).

#### 5. **AutoUpdate**
This sub-object refers to the registry key `HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU`.

**Properties**:
- `Path`: The registry path.
- `NoAutoUpdate`: Whether automatic updates are disabled.
- `AUOptions`: Automatic update options.
- `ScheduledInstallDay`: The scheduled day for installing updates.
- `ScheduledInstallTime`: The scheduled time for installing updates.
- `UseWUServer`: Whether to use Windows Update server.
- `RescheduleWaitTime`: The reschedule wait time.
- `NoAutoRebootWithLoggedOnUsers`: Whether to avoid auto reboot with logged-on users.
- `DetectionFrequency`: The detection frequency for updates.

**Possible values**:
- `NoAutoUpdate`: 0 (automatic updates enabled), 1 (automatic updates disabled).
- `AUOptions`:
    - 2 (Notify for download and auto install)
    - 3 (Auto download and notify for install)
    - 4 (Auto download and schedule the install)
    - 5 (Allow local admin to choose setting)
- `ScheduledInstallDay`:
    - 0 (Every day)
    - 1-7 (Sunday to Saturday)
- `ScheduledInstallTime`: 0-23 (hours).
- `UseWUServer`: 0 (do not use WU server), 1 (use WU server).
- `RescheduleWaitTime`: 1-60 (minutes).
- `NoAutoRebootWithLoggedOnUsers`: 0 (allow reboot), 1 (do not reboot).
- `DetectionFrequency`: 1-22 (hours).

#### 6. **UserWUPolicy**
This sub-object refers to the registry key `HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\WindowsUpdate`, and `HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer`.

**Properties**:
- `DisableWindowsUpdateAccessPath`: The registry path of `DisableWindowsUpdateAccess` property.
- `DisableWindowsUpdateAccess`: Disabling Windows Update access for users.
- `NoWindowsUpdatePath`: The registry path of `NoWindowsUpdatePath` property.
- `NoWindowsUpdate`: Prevents users from connecting to the Windows Update website.

**Possible values**:
- `DisableWindowsUpdateAccess`: 0 (not disabled), 1 (disabled).
- `NoWindowsUpdate`: 0 (Disabled or not configured. Users can connect to the Windows Update website.), 1 (Enabled. Users cannot connect to the Windows Update website.)

#### 7. **Orchestrator**
This sub-object refers to the registry key `HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Orchestrator`, and `HKLM:\Software\Microsoft\WindowsUpdate\Orchestrator\Configurations`.

**Properties**:
- `ScanBeforeInitialLogonAllowedPath`: The registry path of `ScanBeforeInitialLogonAllowed` property.
- `ScanBeforeInitialLogonAllowed`: Whether scanning before the initial logon is allowed.
- `UsoDisableAADJAttributionPath`: The registry path of `UsoDisableAADJAttribution` property.
- `UsoDisableAADJAttribution`: To disable displaying the organization name in Windows Update notifications.

**Possible values**:
- `ScanBeforeInitialLogonAllowed`: 0 (not allowed), 1 (allowed).
- `UsoDisableAADJAttribution`: 0 (not disabled), 1 (disabled).

#### Example of the Output Object `$PatchConfig`
```powershell
$PatchConfig = [PSCustomObject]@{
    Services = [PSCustomObject]@{
        Wuauserv = 'Automatic'
        Cryptsvc = 'Manual'
        Bits = 'Automatic'
        TrustedInstaller = 'Manual'
        UsoSvc = 'Manual'
    }
    BranchReadinessLevel = [PSCustomObject]@{
        Path = 'HKLM:\SOFTWARE\Microsoft\PolicyManager\default\Update\BranchReadinessLevel'
        AllowedValues = 16, 8, 32, 48, 64
        Value = 8
    }
    UxSettings = [PSCustomObject]@{
        Path = 'HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings'
        BranchReadinessLevel = 8
        ActiveHoursStart = 8
        ActiveHoursEnd = 17
    }
    WindowsUpdate = [PSCustomObject]@{
        Path = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate'
        DisableWindowsUpdateAccess = 0
        BranchReadinessLevel = 8
        DeferFeatureUpdates = 1
        DeferFeatureUpdatesPeriodInDays = 30
        DeferQualityUpdates = 1
        DeferQualityUpdatesPeriodInDays = 7
        WUServer = 'https://update.server.local'
        WUStatusServer = 'https://status.server.local'
        DoNotConnectToWindowsUpdateInternetLocations = 1
        TargetGroup = 'IT'
        AcceptTrustedPublisherCerts = 1
        ExcludeWUDriversInQualityUpdate = 1
        DisableOSUpgrade = 1
        TargetReleaseVersion = 1
        TargetReleaseVersionInfo = '22H2'
        SetDisableUXWUAccess = 1
    }
    AutoUpdate = [PSCustomObject]@{
        Path = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU'
        NoAutoUpdate = 0
        AUOptions = 4
        ScheduledInstallDay = 0
        ScheduledInstallTime = 3
        UseWUServer = 1
        RescheduleWaitTime = 10
        NoAutoRebootWithLoggedOnUsers = 1
        DetectionFrequency = 12
    }
    UserWUPolicy = [PSCustomObject]@{
        DisableWindowsUpdateAccessPath = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\WindowsUpdate'
        DisableWindowsUpdateAccess = [PSCustomObject]@{
            UserName = 'user1'
            Value = 1
        }
        NoWindowsUpdatePath = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer'
        NoWindowsUpdate = [PSCustomObject]@{
            UserName = 'user1'
            Value = 1
        }
    }
    Orchestrator = [PSCustomObject]@{
        ScanBeforeInitialLogonAllowedPath = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Orchestrator'
        ScanBeforeInitialLogonAllowed = 1
        UsoDisableAADJAttributionPath = 'HKLM:\Software\Microsoft\WindowsUpdate\Orchestrator\Configurations'
        UsoDisableAADJAttribution = 0
    }
}
```

## Output
    Get-PatchConfig-log.txt
    Get-PatchConfig-Error.txt
