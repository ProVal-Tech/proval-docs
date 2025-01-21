---
id: '2487a1f4-6f85-42f3-91d0-4aab8c875021'
title: 'Application Upgrade with Winget'
title_meta: 'Application Upgrade with Winget - Guide'
keywords: ['upgrade', 'winget', 'application', 'monitor', 'script']
description: 'This document provides a comprehensive guide for achieving the appropriate application upgrade to the latest version detected by Winget. It includes associated scripts, monitors, and alert templates necessary for implementation.'
tags: ['application', 'installation']
draft: false
unlisted: false
---

## Purpose

This solution is designed to achieve the appropriate application upgrade to the latest version detected by Winget.

## Associated Content

| Content                                                                                             | Type         | Function                                                                                                                                                                                                                                                                             |
|-----------------------------------------------------------------------------------------------------|--------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [Application - Latest Version Detection [Winget]](<../cwa/scripts/Application - Latest Version Detection Winget.md>) | Script       | This script is designed to gather the latest version of applications supported by Winget, which is provided in the monitor "[ProVal - Production - Latest Version Detection](<../cwa/monitors/Application - Latest Version Detection.md>)".                                                  |
| [Winget - Install/Update [Autofix,Param]](<../cwa/scripts/Script - Winget - InstallUpdate Autofix,Param.md>)         | Script       | This script is created to update the application whose PackageID and Source are provided in the monitor "[ProVal - Production - Install/Update [Winget]](<../cwa/monitors/Application - InstallUpdate Winget.md>)".                                                                    |
| [Internal Monitor - Application - Latest Version Detection](<../cwa/monitors/Application - Latest Version Detection.md>) | Monitor      | This monitor is created to fetch the latest version of the application for which you want Winget to control the upgrade.                                                                                                                                                         |
| [Internal Monitor - Application - Install/Update [Winget]](<../cwa/monitors/Application - InstallUpdate Winget.md>) | Monitor      | This monitor is designed to update the application based on the PackageID, Source, and Application Name provided inside the monitor.                                                                                                                                              |
| **△ Custom - Execute Script - Application Latest Version**                                          | Alert Template | This alert template is designed to be used with the monitor "[ProVal - Production - Latest Version Detection](<../cwa/monitors/Application - Latest Version Detection.md>)" to run the script "[Application - Latest Version Detection [Winget]](<../cwa/scripts/Application - Latest Version Detection Winget.md>)". |
| **△ CUSTOM - Application Install/Update - Winget**                                                | Alert Template | This alert template is designed to be used with the monitor "[ProVal - Production - Install/Update [Winget]](<../cwa/monitors/Application - InstallUpdate Winget.md>)" to run the script "[Winget - Install/Update [Autofix,Param]](<../cwa/scripts/Script - Winget - InstallUpdate Autofix,Param.md>).        |

## Implementation

- Import scripts [Application - Latest Version Detection [Winget]](<../cwa/scripts/Application - Latest Version Detection Winget.md>) and [Winget - Install/Update [Autofix,Param]](<../cwa/scripts/Script - Winget - InstallUpdate Autofix,Param.md>).
- Import monitors [ProVal - Production - Latest Version Detection](<../cwa/monitors/Application - Latest Version Detection.md>) and [ProVal - Production - Install/Update [Winget]](<../cwa/monitors/Application - InstallUpdate Winget.md>).
- Import the alert templates "**△ Custom - Execute Script - Application Latest Version**" and "**△ CUSTOM - Application Install/Update - Winget**".
- Create a duplicate of both monitors and remove the imported monitors to avoid confusion:  
  ![Image](../../static/img/UpdateDeploy-Target-Application-to-Latest-Version-Winget/image_1.png)  
- Remove the 'Copy of' from the monitor names and modify the new monitors with the required details below:  
  ![Image](../../static/img/UpdateDeploy-Target-Application-to-Latest-Version-Winget/image_2.png)  
  ![Image](../../static/img/UpdateDeploy-Target-Application-to-Latest-Version-Winget/image_3.png)  
- Apply the alert template "**△ Custom - Execute Script - Application Latest Version**" with monitor [ProVal - Production - Latest Version Detection](<../cwa/monitors/Application - Latest Version Detection.md>) first and run it once before implementing the other monitor so that the system property gets created.
- Apply the alert template "**△ CUSTOM - Application Install/Update - Winget**" with monitor [ProVal - Production - Install/Update [Winget]](<../cwa/monitors/Application - InstallUpdate Winget.md>) and make the adjustments as mentioned in the screenshot.
