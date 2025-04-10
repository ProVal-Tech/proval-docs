---
id: '70d9b103-f73f-4e68-a4aa-d2651e44d09a'
slug: /70d9b103-f73f-4e68-a4aa-d2651e44d09a
title: 'SonicWall NetExtender - InstallUpdate'
title_meta: 'SonicWall NetExtender - InstallUpdate'
keywords: ['sonicwall', 'netextender', 'installation', 'update', 'winget']
description: 'This document provides a comprehensive guide on installing and updating the SonicWall NetExtender application using Winget. It includes associated scripts, internal monitors, and alert templates necessary for effective deployment and version detection of SonicWall NetExtender.'
tags: ['installation', 'software', 'update']
draft: false
unlisted: false
---

## Purpose

This solution ensures that the SonicWall NetExtender is installed or updated to the latest version.

## Associated Content

| Content                                                                                      | Type            | Function                                                                                                                                                                                                                                                                                                                                                       |
|----------------------------------------------------------------------------------------------|-----------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [Install/Update SonicWall NetExtender [Winget]](/docs/d7f9015f-0d7c-4bfb-b624-4600f4774b65) | Script          | This script attempts to install or update the SonicWall NetExtender application on the target device using Winget.                                                                                                                                                                                                                                        |
| [Internal Monitor - SonicWall NetExtender Deployment](/docs/b0ca57d2-351c-4f1d-9d98-954c1d77777e) | Internal Monitor | This internal monitor detects the online Windows agent where the SonicWall NetExtender is installed for the upgrade. It depends on the client-based EDF 'SonicWall NetExtender Deployment' to check for the SonicWall NetExtender Install/Update. It also relies on the location-based and computer-based EDF 'SonicWall NetExtender Exclude' to exclude particular locations/agents from the deployed clients. |
| [SonicWall NetExtender - Latest Version [Winget]](/docs/5eca56c8-7035-41f7-b5d0-ef8d58bf532a) | Script          | This script is designed to store the latest version of SonicWall NetExtender in the system properties 'SonicWall_Netextender_Version'.                                                                                                                                                                                                                         |
| [Internal Monitor - SonicWall NetExtender - Latest Version Detection](/docs/62ad1299-3e65-4bf7-a415-307fdf9a162c) | Internal Monitor | This monitor schedules the script [SonicWall NetExtender - Latest Version [Winget]](/docs/5eca56c8-7035-41f7-b5d0-ef8d58bf532a) to collect the latest version details of the SonicWall NetExtender application every month and update it to the system properties SonicWall_Netextender_Version.                                                                         |
| **△ Custom - Autofix - SonicWall NetExtender - Latest Version Collector**                   | Alert Template   | This alert template runs the script [SonicWall NetExtender - Latest Version [Winget]](/docs/5eca56c8-7035-41f7-b5d0-ef8d58bf532a) for the latest version detection of SonicWall NetExtender and stores it in the system properties. It should be scheduled with the monitor [SonicWall NetExtender - Latest Version Detection](/docs/62ad1299-3e65-4bf7-a415-307fdf9a162c).                     |
| **△ Custom - Autofix - SonicWall NetExtender - Install/Update**                           | Alert Template   | This alert template runs the script [SWM - Software - Install/Update SonicWall NetExtender [Winget]](/docs/d7f9015f-0d7c-4bfb-b624-4600f4774b65) for the SonicWall NetExtender install/update. It should be scheduled with the monitor [SonicWall NetExtender Deployment](/docs/b0ca57d2-351c-4f1d-9d98-954c1d77777e).                                            |
| SonicWall NetExtender Deployment                                                              | Client-EDF      | This EDF needs to be checked for the monitor to detect the clients where the SonicWall NetExtender deployment is needed on their agents.                                                                                                                                                                                                                       |
| SonicWall NetExtender Exclude                                                                 | Location-EDF    | This EDF check at the location level will exclude the agents of the locations from the SonicWall NetExtender deployment.                                                                                                                                                                                                                                        |
| SonicWall NetExtender Exclude                                                                 | Computer-EDF    | This EDF check will exclude the agents from the SonicWall NetExtender deployment.                                                                                                                                                                                                                                                                              |

## Implementation

1. Import the scripts [SWM - Software - Install/Update SonicWall NetExtender [Winget]](/docs/d7f9015f-0d7c-4bfb-b624-4600f4774b65) and [SonicWall NetExtender - Latest Version [Winget]](/docs/5eca56c8-7035-41f7-b5d0-ef8d58bf532a).
2. Import the internal monitors [SonicWall NetExtender Deployment](/docs/b0ca57d2-351c-4f1d-9d98-954c1d77777e) and [SonicWall NetExtender - Latest Version Detection](/docs/62ad1299-3e65-4bf7-a415-307fdf9a162c).
3. Import the alert templates '△ Custom - Autofix - SonicWall NetExtender - Latest Version Collector' and '△ Custom - Autofix - SonicWall NetExtender - Install/Update'.
4. Apply the '△ Custom - Autofix - SonicWall NetExtender - Install/Update' alert template to the [SonicWall NetExtender Deployment](/docs/b0ca57d2-351c-4f1d-9d98-954c1d77777e) monitor.
5. Apply the '△ Custom - Autofix - SonicWall NetExtender - Latest Version Collector' alert template to the [SonicWall NetExtender - Latest Version Detection](/docs/62ad1299-3e65-4bf7-a415-307fdf9a162c) monitor.
6. Run the [SonicWall NetExtender - Latest Version [Winget]](/docs/5eca56c8-7035-41f7-b5d0-ef8d58bf532a) script and ensure the script populates the system property.  
   ![Image](../../static/img/SonicWall-NetExtender---InstallUpdate/image_1.png)
7. Enable the deployment monitor.


