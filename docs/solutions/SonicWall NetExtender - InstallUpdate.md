---
id: 'cwa-sonicwall-netextender-installation'
title: 'SonicWall NetExtender Installation and Update'
title_meta: 'SonicWall NetExtender Installation and Update'
keywords: ['sonicwall', 'netextender', 'installation', 'update', 'winget']
description: 'This document provides a comprehensive guide on installing and updating the SonicWall NetExtender application using Winget. It includes associated scripts, internal monitors, and alert templates necessary for effective deployment and version detection of SonicWall NetExtender.'
tags: ['installation', 'update', 'software', 'monitoring', 'alert']
draft: false
unlisted: false
---
## Purpose

This solution ensures the SonicWall NetExtender gets installed/updated to the latest version.

## Associated Content

| Content                                                                                      | Type            | Function                                                                                                                                                                                                                                                                                                                                                       |
|----------------------------------------------------------------------------------------------|-----------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [Install/Update Sonicwall NetExtender [Winget]](https://proval.itglue.com/DOC-5078775-8058617) | Script          | This script will attempt to install/update the SonicWall NetExtender application to the target device using Winget.                                                                                                                                                                                                                                        |
| [Internal Monitor - SonicWall NetExtender Deployment](https://proval.itglue.com/DOC-5078775-13399330) | Internal Monitor | This internal monitor detects the online Windows agent where the SonicWall NetExtender is installed for the upgrade. It depends on the client-based EDF 'SonicWall NetExtender Deployment' to be checked for the SonicWall NetExtender Install/Update. It also depends on the location-based and computer-based EDF 'SonicWall NetExtender Exclude' to exclude particular locations/agents from the deployed clients. |
| [SonicWall NetExtender - Latest Version [Winget]](https://proval.itglue.com/DOC-5078775-13816835) | Script          | This script is designed to store the SonicWall NetExtender latest version to the system properties 'SonicWall_Netextender_Version'.                                                                                                                                                                                                                         |
| [Internal Monitor - SonicWall NetExtender - Latest Version Detection](https://proval.itglue.com/DOC-5078775-13813876) | Internal Monitor | This monitor schedules the script [SonicWall NetExtender - Latest Version [Winget]](https://proval.itglue.com/DOC-5078775-13816835) to collect the latest version detail of the SonicWall NetExtender application every month and update it to the system properties SonicWall_Netextender_Version.                                                                         |
| **△ Custom - Autofix - SonicWall NetExtender - Latest Version Collector**                   | Alert Template   | This alert template runs the script [SonicWall NetExtender - Latest Version [Winget]](https://proval.itglue.com/DOC-5078775-13816835) for the SonicWall NetExtender latest version detection and store to the system properties. It should be scheduled with the monitor [SonicWall NetExtender - Latest Version Detection](https://proval.itglue.com/DOC-5078775-13813876).                     |
| **△ Custom - Autofix - SonicWall NetExtender - Install/Update**                           | Alert Template   | This alert template runs the script [SWM - Software - Install/Update Sonicwall NetExtender [Winget]](https://proval.itglue.com/DOC-5078775-8058617) for the SonicWall NetExtender install/update. It should be scheduled with the monitor [SonicWall NetExtender Deployment](https://proval.itglue.com/DOC-5532599-13399427).                                            |
| SonicWall NetExtender Deployment                                                              | Client-EDF      | This EDF needed to be checked for the monitor to detect the clients where the SonicWall NetExtender deployment needed on their agents.                                                                                                                                                                                                                       |
| SonicWall NetExtender Exclude                                                                 | Location-EDF    | This EDF check at location level will exclude the agents of the locations from the SonicWall NetExtender deployment.                                                                                                                                                                                                                                        |
| SonicWall NetExtender Exclude                                                                 | Computer-EDF    | This EDF check will exclude the agents from the SonicWall NetExtender deployment.                                                                                                                                                                                                                                                                              |

## Implementation

1. Import Script [SWM - Software - Install/Update Sonicwall NetExtender [Winget]](https://proval.itglue.com/DOC-5078775-8058617) and [SonicWall NetExtender - Latest Version [Winget]](https://proval.itglue.com/DOC-5078775-13816835).
2. Import internal monitor [SonicWall NetExtender Deployment](https://proval.itglue.com/DOC-5532599-13399427) and [SonicWall NetExtender - Latest Version Detection](https://proval.itglue.com/DOC-5078775-13813876).
3. Import the Alert Templates '△ Custom - Autofix - SonicWall NetExtender - Latest Version Collector' and '△ Custom - Autofix - SonicWall NetExtender - Install/Update'.
4. Apply the △ Custom - Autofix - SonicWall NetExtender - Install/Update alert template to the [SonicWall NetExtender Deployment](https://proval.itglue.com/DOC-5532599-13399427) monitor.
5. Apply the △ Custom - Autofix - SonicWall NetExtender - Latest Version Collector alert template to the [SonicWall NetExtender - Latest Version Detection](https://proval.itglue.com/DOC-5078775-13813876) monitor.
6. Run the [SonicWall NetExtender - Latest Version [Winget]](https://proval.itglue.com/DOC-5078775-13816835) Script and ensure the script populates the System Property  
   ![Image](5078775/docs/12674331/images/19948547)
7. Enable the deployment monitor.

