---
id: ps-install-featureupdate
title: 'Install-FeatureUpdate'
title_meta: 'Install-FeatureUpdate Command'
keywords: ['install', 'featureupdate', 'upgrade', 'windows']
description: 'Documentation for the Install-FeatureUpdate command to install the latest feature update on a Windows 10+ machine.'
tags: ['update', 'windows', 'installation']
draft: false
unlisted: false
---
## Description
Installs the latest feature update on a Windows 10+ machine.

## Requirements
- PowerShell 5+
- Windows OS
- Must be run as an Administrator


Installs the latest feature update, if applicable.
```powershell
& .\Install-FeatureUpdate.ps1
```

Installs the latest feature update, if applicable. Reboots after a successful install.
```powershell
& .\Install-FeatureUpdate.ps1 -Reboot
```

Installs the latest feature update, if applicable. Skip drive check.
```powershell
& .\Install-FeatureUpdate.ps1 -SkipDriveCheck
```

Upgrades to the latest numbered version of Windows, if applicable. Reboots after a successful install.
```powershell
&  .\Install-FeatureUpdate -Reboot -Upgrade
```

## Parameters
| Parameter | Required | Default | Type   | Description                                                      |
| --------- | -------- | ------- | ------ | ---------------------------------------------------------------- |
| `Reboot`  | False    | False   | switch | If no errors are detected, reboots the machine after completion. |
| `SkipDriveCheck`  | False    | False   | switch | It skip the drive check and proceed for the upgrade. Default behavior of the script is to exit if the free drive space is less than 20 GB. |
| `Upgrade`  | False    | False   | switch | Upgrades to the latest numbered version of Windows. |

## Output
### Object

> ❗ Note that this is only an example to show the properties of the object.
```text
Version            : 1.6.2107.27002
ProfileName        : FindSuccessfulUpgrade
ProfileGuid        : 8A0824C8-A56D-4C55-95A0-22751AB62F3E
SystemInfo         : @{BiosReleaseDate=20220406000000.000000+000; BiosVendor=Hyper-V UEFI Release v4.1;
                     BiosVersion=Hyper-V UEFI Release v4.1; CV=F5ltJcVEe0qdNG5i; CommercialId=Offline;
                     FilterDrivers=FileInfo; FinalizeStartTime=1/1/0001 8:00:00 AM; FirmwareType=UEFI;
                     HostOSArchitecture=1033; HostOSBuildString=17763.1.amd64fre.rs5_release.180914-1434;
                     HostOSEdition=Professional; HostOSLanguageId=; HostOSVersion=10.0.17763;
                     MachineName=DESKTOP-T3MCJ00; Manufacturer=Microsoft Corporation; Model=Virtual Machine;
                     PostOOBESuccessTime=1/1/0001 8:00:00 AM; RegisteredAV=Windows Defender;
                     ReportId=809ff092-7346-46a5-a2aa-f57fc9c8f633; RollbackElapsedTime=PT0S; RollbackEndTime=1/1/0001
                     8:00:00 AM; RollbackStartTime=1/1/0001 8:00:00 AM;
                     SetupReportId=809ff092-7346-46a5-a2aa-f57fc9c8f633; TargetOSArchitecture=;
                     TargetOSBuildString=10.0.19041.1940 (vb_release_svc_prod2.220711-1757); TotalOfflineTime=PT0S;
                     UpgradeElapsedTime=PT45M57S; UpgradeEndTime=2/1/2023 6:38:41 PM; UpgradeStartTime=2/1/2023
                     5:52:44 PM}
LogErrorLine       :
FailureData        : {SetupDiag reports successful upgrade found., This appears to be a successful update as the last
                     operation was: OOBEBoot and the result was: success}
FailureDetails     : LastOperation = OOBEBoot
DeviceDriverInfo   :
Remediation        : {}
SetupPhaseInfo     : {@{PhaseName=End; PhaseStartTime=02/01/2023 10:35:16; PhaseEndTime=02/01/2023 10:35:16;
                     PhaseTimeDelta=0:00:00:00.0000000; CompletedSuccessfully=True}}
SetupOperationInfo : {@{OperationName=Start suspended services; OperationStartTime=02/01/2023 10:35:09;
                     OperationEndTime=02/01/2023 10:35:10; OperationTimeDelta=0:00:00:01.0000000;
                     CompletedSuccessfully=True}}
```

### Log Files
    .\Install-FeatureUpdate-log.txt
    .\Install-FeatureUpdate-error.txt

### Tables
    Install-FeatureUpdate_logs
    Install-FeatureUpdate_setupdiag
