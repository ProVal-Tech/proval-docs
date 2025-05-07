---
id: '2487a1f4-6f85-42f3-91d0-4aab8c875021'
slug: /2487a1f4-6f85-42f3-91d0-4aab8c875021
title: 'Update/Deploy Target Application to Latest Version Winget'
title_meta: 'Update/Deploy Target Application to Latest Version Winget'
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
| [Application - Latest Version Detection [Winget]](/docs/ffb77c6c-8dd7-4ca5-82a2-327b1658cbde) | Script       | This script is designed to gather the latest version of applications supported by Winget, which is provided in the monitor "[ProVal - Production - Latest Version Detection](/docs/f5315643-b01b-48e6-ae4c-b89e5c0f20d6)".                                                  |
| [Winget - Install/Update [Autofix,Param]](/docs/3a2f4004-624d-47c4-a5d0-c3c43e103e25)         | Script       | This script is created to update the application whose PackageID and Source are provided in the monitor "[ProVal - Production - Install/Update [Winget]](/docs/9b40d1cd-7886-416f-b56e-11ab3a44befb)".                                                                    |
| [Internal Monitor - Application - Latest Version Detection](/docs/f5315643-b01b-48e6-ae4c-b89e5c0f20d6) | Monitor      | This monitor is created to fetch the latest version of the application for which you want Winget to control the upgrade.                                                                                                                                                         |
| [Internal Monitor - Application - Install/Update [Winget]](/docs/9b40d1cd-7886-416f-b56e-11ab3a44befb) | Monitor      | This monitor is designed to update the application based on the PackageID, Source, and Application Name provided inside the monitor.                                                                                                                                              |
| **△ Custom - Execute Script - Application Latest Version**                                          | Alert Template | This alert template is designed to be used with the monitor "[ProVal - Production - Latest Version Detection](/docs/f5315643-b01b-48e6-ae4c-b89e5c0f20d6)" to run the script "[Application - Latest Version Detection [Winget]](/docs/ffb77c6c-8dd7-4ca5-82a2-327b1658cbde)". |
| **△ CUSTOM - Application Install/Update - Winget**                                                | Alert Template | This alert template is designed to be used with the monitor "[ProVal - Production - Install/Update [Winget]](/docs/9b40d1cd-7886-416f-b56e-11ab3a44befb)" to run the script "[Winget - Install/Update [Autofix,Param]](/docs/3a2f4004-624d-47c4-a5d0-c3c43e103e25).        |

## Implementation

- Import scripts [Application - Latest Version Detection [Winget]](/docs/ffb77c6c-8dd7-4ca5-82a2-327b1658cbde) and [Winget - Install/Update [Autofix,Param]](/docs/3a2f4004-624d-47c4-a5d0-c3c43e103e25).
- Import monitors [ProVal - Production - Latest Version Detection](/docs/f5315643-b01b-48e6-ae4c-b89e5c0f20d6) and [ProVal - Production - Install/Update [Winget]](/docs/9b40d1cd-7886-416f-b56e-11ab3a44befb).
- Import the alert templates "**△ Custom - Execute Script - Application Latest Version**" and "**△ CUSTOM - Application Install/Update - Winget**".
- Create a duplicate of both monitors and remove the imported monitors to avoid confusion:  
  ![Image](../../static/img/UpdateDeploy-Target-Application-to-Latest-Version-Winget/image_1.png)  
- Remove the 'Copy of' from the monitor names and modify the new monitors with the required details below:  
  ![Image](../../static/img/UpdateDeploy-Target-Application-to-Latest-Version-Winget/image_2.png)  

  ![Image](../../static/img/UpdateDeploy-Target-Application-to-Latest-Version-Winget/image_3.png)  
- Apply the alert template "**△ Custom - Execute Script - Application Latest Version**" with monitor [ProVal - Production - Latest Version Detection](/docs/f5315643-b01b-48e6-ae4c-b89e5c0f20d6) first and run it once before implementing the other monitor so that the system property gets created.
- Apply the alert template "**△ CUSTOM - Application Install/Update - Winget**" with monitor [ProVal - Production - Install/Update [Winget]](/docs/9b40d1cd-7886-416f-b56e-11ab3a44befb) and make the adjustments as mentioned in the screenshot.


