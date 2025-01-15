---
id: ps-get-windowsupdatereport
title: 'Get-WindowsUpdateReport'
title_meta: 'Get-WindowsUpdateReport Command'
keywords: ['windows', 'update', 'report', 'patches']
description: 'Documentation for the Get-WindowsUpdateReport command to get a list of patches that are installed or available on the local machine.'
tags: ['windows', 'update', 'report']
draft: false
unlisted: false
---
## Description
Get a list of patches that are installed or available on the local machine.

### Execution Note
Running this script on Windows 7 and below is at best unstable and at worst causes an out-of-memory exception.

## Requirements
- Powershell v5
- Internet connection

## Usage
1. Prerequisite installation is performed
   1. Installs NuGet if not present
   2. Sets PSGallery as a trusted provider
   3. Installs PSWindowsUpdate module
2. Returns WindowsUpdate objects



*Returns a PSWindowsUpdate.WindowsUpdate object list of installed and available patches.*
```powershell
.\Get-WindowsUpdateReport.ps1
```

*Exports a CSV patch report of installed and available patches.*
```powershell
.\Get-WindowsUpdateReport.ps1 | Export-CSV -Path ".\PatchReport.csv" -NoTypeInformation
```

*Exports a JSON patch report of installed and available patches.*
```powershell
.\Get-WindowsUpdateReport.ps1 | ConvertTo-Json -Depth 100 | Out-File -FilePath ".\PatchReport.json"
```

*Exports an XML patch report of installed and available patches.*
```powershell
.\Get-WindowsUpdateReport.ps1 | Export-Clixml -Path ".\PatchReport.xml"
```

## Output
| PSWindowsUpdate.WindowsUpdate     |
| --------------------------------- |
| `Size`                            |
| `Status`                          |
| `ComputerName`                    |
| `KB`                              |
| `Title`                           |
| `AutoSelectOnWebSites`            |
| `BundledUpdates`                  |
| `CanRequireSource`                |
| `Categories`                      |
| `Deadline`                        |
| `DeltaCompressedContentAvailable` |
| `DeltaCompressedContentPreferred` |
| `Description`                     |
| `EulaAccepted`                    |
| `EulaText`                        |
| `HandlerID`                       |
| `Identity`                        |
| `Image`                           |
| `InstallationBehavior`            |
| `IsBeta`                          |
| `IsDownloaded`                    |
| `IsHidden`                        |
| `IsInstalled`                     |
| `IsMandatory`                     |
| `IsUninstallable`                 |
| `Languages`                       |
| `LastDeploymentChangeTime`        |
| `MaxDownloadSize`                 |
| `MinDownloadSize`                 |
| `MoreInfoUrls`                    |
| `MsrcSeverity`                    |
| `RecommendedCpuSpeed`             |
| `RecommendedHardDiskSpace`        |
| `RecommendedMemory`               |
| `ReleaseNotes`                    |
| `SecurityBulletinIDs`             |
| `SupersededUpdateIDs`             |
| `SupportUrl`                      |
| `Type`                            |
| `UninstallationNotes`             |
| `UninstallationBehavior`          |
| `UninstallationSteps`             |
| `KBArticleIDs`                    |
| `DeploymentAction`                |
| `DownloadPriority`                |
| `DownloadContents`                |
| `RebootRequired`                  |
| `IsPresent`                       |
| `CveIDs`                          |
| `BrowseOnly`                      |
| `PerUser`                         |
| `AutoSelection`                   |
| `AutoDownload`                    |
### Log File

    .\Get-Windows10PatchInfo-log.txt




