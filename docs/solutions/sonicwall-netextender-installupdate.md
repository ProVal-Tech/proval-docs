---
id: '70d9b103-f73f-4e68-a4aa-d2651e44d09a'
slug: /70d9b103-f73f-4e68-a4aa-d2651e44d09a
title: 'SonicWall NetExtender - Install/Update'
title_meta: 'SonicWall NetExtender - Install/Update'
keywords: ['sonicwall', 'netextender', 'installation', 'update', 'winget']
description: 'This document provides a comprehensive guide on installing and updating the SonicWall NetExtender application using Winget. It includes associated scripts, internal monitors, and alert templates necessary for effective deployment and version detection of SonicWall NetExtender.'
tags: ['installation', 'software', 'update', 'sonicwall']
draft: false
unlisted: false
---

## Purpose

This solution ensures that the SonicWall NetExtender is installed or updated to the latest version.

## Associated Content

| Content                                                                                      | Type            | Function                                                                                                                                                                                                                                                                                                                                                       |
|----------------------------------------------------------------------------------------------|-----------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [Script - SonicWall NetExtender - Install/Update](/docs/823c8e22-0b24-4cf9-9e25-4048d2973b98) | Script          | This script installs/updates the latest version of the SonicWall NetExtender dynamically.                                                                                                                                                                                                                                        |
| [Monitor - SonicWall NetExtender - Update](/docs/b0ca57d2-351c-4f1d-9d98-954c1d77777e) | Internal Monitor | This internal monitor detects the online Windows agent where the SonicWall NetExtender is installed for the upgrade. It depends on the client-based EDF 'SonicWall NetExtender Deployment' to check for the deployment. It also relies on the location-based and computer-based EDF 'SonicWall NetExtender Exclude' to exclude particular locations/agents from the deployed clients. To install the SonicWall using this monitor, check the implementation steps.|
| [Script - Application - Latest Version [Winget]](/docs/ffb77c6c-8dd7-4ca5-82a2-327b1658cbde) | Script          | This script is designed to store the latest version of SonicWall NetExtender in the system properties 'SonicWall_Netextender_Version'.                                                                                                                                                                                                                         |
| [Monitor - SonicWall NetExtender - Latest Version Detection](/docs/62ad1299-3e65-4bf7-a415-307fdf9a162c) | Internal Monitor | This monitor schedules the script [Script - Application - Latest Version [Winget]](/docs/ffb77c6c-8dd7-4ca5-82a2-327b1658cbde) to collect the latest version details of the SonicWall NetExtender application every month and update it to the system properties `SonicWall.NetExtender`.                                                                         |
| **△ Custom - Autofix - SonicWall NetExtender - Latest Version Collector**                   | Alert Template   | This alert template runs the script [Script - Application - Latest Version [Winget]](/docs/ffb77c6c-8dd7-4ca5-82a2-327b1658cbde) for the latest version detection of SonicWall NetExtender and stores it in the system properties. It should be scheduled with the monitor [Monitor - SonicWall NetExtender - Latest Version Detection](/docs/62ad1299-3e65-4bf7-a415-307fdf9a162c).                     |
| **△ Custom - Autofix - SonicWall NetExtender - Install/Update**                           | Alert Template   | This alert template runs the script [Script - SonicWall NetExtender - Install/Update](/docs/823c8e22-0b24-4cf9-9e25-4048d2973b98) for the SonicWall NetExtender install/update. It should be scheduled with the monitor [Monitor - SonicWall NetExtender - Update](/docs/b0ca57d2-351c-4f1d-9d98-954c1d77777e).                                            |
| SonicWall NetExtender Deployment                                                              | Client-EDF      | This EDF needs to be checked for the monitor to detect the clients where the SonicWall NetExtender deployment is needed on their agents.  ![ClientEDF](../../static/img/SonicWall-NetExtender---InstallUpdate/clientEDF.png)                                                                                                                                                                                                            |
| SonicWall NetExtender Exclude                                                                 | Location-EDF    | This EDF check at the location level will exclude the agents of the locations from the SonicWall NetExtender deployment.  ![LocationEDF](../../static/img/SonicWall-NetExtender---InstallUpdate/LocationEDF.png)                                                                                                                                                                                                                                |
| SonicWall NetExtender Exclude                                                                 | Computer-EDF    | This EDF check will exclude the agents from the SonicWall NetExtender deployment.  ![ComputerEDF](../../static/img/SonicWall-NetExtender---InstallUpdate/ComputerEDF.png)                                |

## Implementation

1. Import the scripts [Script - SonicWall NetExtender - Install/Update](/docs/823c8e22-0b24-4cf9-9e25-4048d2973b98) and [Script - Application - Latest Version [Winget]](/docs/ffb77c6c-8dd7-4ca5-82a2-327b1658cbde).
2. Import the internal monitors [Monitor - SonicWall NetExtender - Update](/docs/b0ca57d2-351c-4f1d-9d98-954c1d77777e) and [Monitor - SonicWall NetExtender - Latest Version Detection](/docs/62ad1299-3e65-4bf7-a415-307fdf9a162c).
3. Import the alert templates `△ Custom - Autofix - SonicWall NetExtender - Latest Version Collector` and `△ Custom - Autofix - SonicWall NetExtender - Install/Update`.
4. Apply the `△ Custom - Autofix - SonicWall NetExtender - Install/Update` alert template to the [Monitor - SonicWall NetExtender - Update](/docs/b0ca57d2-351c-4f1d-9d98-954c1d77777e).
5. Apply the `△ Custom - Autofix - SonicWall NetExtender - Latest Version Collector` alert template to the [Monitor - SonicWall NetExtender - Latest Version Detection](/docs/62ad1299-3e65-4bf7-a415-307fdf9a162c).
6. Run the [Monitor - SonicWall NetExtender - Install/Update](/docs/b0ca57d2-351c-4f1d-9d98-954c1d77777e). and ensure the script populates the system property.  

   ![Image](../../static/img/SonicWall-NetExtender---InstallUpdate/Property.png)
7. Enable the deployment monitor.
8. The current solution is built for the SonicWall NetExtender update only. If the Install is required then please make the required changes in the monitor as highlighted in the screenshot:

![Image1](../../static/img/docs/sonicwall-netextender-installupdate/image-1.png)

