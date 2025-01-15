---
id: '64476262-ad0f-474e-aebb-70ec1e0ccd97'
title: 'Unexpected Restart Monitor Setup'
title_meta: 'Unexpected Restart Monitor Setup for ConnectWise Automate'
keywords: ['restart', 'monitor', 'shutdown', 'event', 'alert', 'template', 'bluescreen', 'power']
description: 'This document provides a detailed guide on setting up an Unexpected Restart Monitor in ConnectWise Automate. It aims to reduce unnecessary notifications caused by power outages by implementing a second level of verification and alert templates for monitoring unexpected shutdowns.'
tags: ['alert', 'monitor', 'system', 'event', 'template', 'bluescreen', 'automation']
draft: false
unlisted: false
---
## Purpose

The Unexpected restart monitor creates a lot of noise as a lot of the time the shutdown is caused by a power outage rather than an actionable issue. This solution will provide a second level of verification to attempt to reduce the notifications of unexpected shutdown due to normal power issues.

## Associated Content

| Content                                                                                                   | Type     | Function                                                                                                 |
|-----------------------------------------------------------------------------------------------------------|----------|----------------------------------------------------------------------------------------------------------|
| [EPM - Data Collection - Script - Remote Event Log Monitor - Create](https://proval.itglue.com/DOC-5078775-9742626) | Script   | You will use this script to create a remote monitor to look for System events with an id of 41 or 6008. |
| [EPM - Data Collection - Script - Get-CrashDump](https://proval.itglue.com/DOC-5078775-11956458)          | Script   | Gathers the data from a dmp file that should have been created after a bluescreen issue.                |
| [SWM - Software Management - Powershell - Invoke-WingetProcessor](https://proval.itglue.com/DOC-5078775-11310973) | Agnostic | Used by Winget - Install to install winget packages.                                                    |
| [SWM - Software Installation - Script - Winget - Install](https://proval.itglue.com/DOC-5078775-11956636) | Script   | Uses agnostic script to install bluescreenview.                                                         |
| [EPM - Data Collection - Custom Table - plugin_proval_crash_dumps](https://proval.itglue.com/DOC-5078775-11960289) | Custom Table | Stores crash dump data, saves last 1 dump per computer.                                                |

## Implementation

### Initial Monitor Setup

1. Look through your automate groups and find the id of the group you wish to monitor for bluescreens.
2. Using any computer, Run the [EPM - Data Collection - Script - Remote Event Log Monitor - Create](https://proval.itglue.com/DOC-5078775-9742626) script with the groupId set to that ID, the logtype set to System, and the eventid set to 41,6008  
   ![Image](../../static/img/EPM---Data-Collection---Solution--Unexpected-Reboots-caused-by-Bluescreens./image_1.png)
3. Import the [EPM - Data Collection - Script - Get-CrashDump](https://proval.itglue.com/DOC-5078775-11956458) script.

### Alert Template Setup

1. Select automation / templates / alert templates
2. Hit New Template and name your template.
3. Hit Add Alerts, then on the next box hit New Alert
4. In the Alert actions Section select the box for Script Error
5. In the script selection box select the Get-Crashdump Script.
6. In the days of the week select EveryDay
7. Select the appropriate User/Technician
8. Hit Save.
9. Hit Save and Close.

![Image](../../static/img/EPM---Data-Collection---Solution--Unexpected-Reboots-caused-by-Bluescreens./image_2.png)

![Image](../../static/img/EPM---Data-Collection---Solution--Unexpected-Reboots-caused-by-Bluescreens./image_3.png)

### Adding the alert to the monitor

1. Open the group you selected earlier.
2. Select computers
3. Select remote monitors
4. Look for a monitor named System - Event 41,8006 click on it once.
5. Modify the Alert template to be the template you created in the prior step.

![Image](../../static/img/EPM---Data-Collection---Solution--Unexpected-Reboots-caused-by-Bluescreens./image_4.png)

## FAQ








