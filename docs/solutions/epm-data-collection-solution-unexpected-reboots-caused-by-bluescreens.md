---
id: '64476262-ad0f-474e-aebb-70ec1e0ccd97'
slug: /64476262-ad0f-474e-aebb-70ec1e0ccd97
title: 'EPM - Data Collection - Solution -Unexpected Reboots caused by Bluescreens.'
title_meta: 'EPM - Data Collection - Solution -Unexpected Reboots caused by Bluescreens.'
keywords: ['restart', 'monitor', 'shutdown', 'event', 'alert', 'template', 'bluescreen', 'power']
description: 'This document provides a detailed guide on setting up an Unexpected Restart Monitor in ConnectWise Automate. It aims to reduce unnecessary notifications caused by power outages by implementing a second level of verification and alert templates for monitoring unexpected shutdowns.'
tags: ['bluescreen']
draft: false
unlisted: false
---

## Purpose

The Unexpected Restart Monitor generates a lot of noise, as often the shutdown is caused by a power outage rather than an actionable issue. This solution will provide a second level of verification to help reduce notifications of unexpected shutdowns due to normal power issues.

## Associated Content

| Content                                                                                                   | Type     | Function                                                                                                 |
|-----------------------------------------------------------------------------------------------------------|----------|----------------------------------------------------------------------------------------------------------|
| [EPM - Data Collection - Script - Remote Event Log Monitor - Create](/docs/144d7d52-8764-4aa4-bcce-205c756f6203) | Script   | You will use this script to create a remote monitor to look for System events with an ID of 41 or 6008. |
| [EPM - Data Collection - Script - Get-CrashDump](/docs/dde000a0-373a-4023-a594-04e532b5ad57)          | Script   | Gathers the data from a DMP file that should have been created after a bluescreen issue.                |
| [SWM - Software Management - Powershell - Invoke-WingetProcessor](/docs/8496c2e9-0e52-4961-a1f1-4a95296e8cf7) | Agnostic | Used by Winget - Install to install Winget packages.                                                    |
| [SWM - Software Installation - Script - Winget - Install](/docs/dd445ce7-a149-452c-9b35-dc1adbab4e06) | Script   | Uses an agnostic script to install BluescreenView.                                                     |
| [EPM - Data Collection - Custom Table - plugin_proval_crash_dumps](/docs/e562d1d6-a18e-4941-be1b-95117d0b2fa6) | Custom Table | Stores crash dump data, saving the last dump per computer.                                            |

## Implementation

### Initial Monitor Setup

1. Look through your Automate groups and find the ID of the group you wish to monitor for bluescreens.
2. Using any computer, run the [EPM - Data Collection - Script - Remote Event Log Monitor - Create](/docs/144d7d52-8764-4aa4-bcce-205c756f6203) script with the `groupId` set to that ID, the `logtype` set to System, and the `eventid` set to 41,6008.
3. Import the [EPM - Data Collection - Script - Get-CrashDump](/docs/dde000a0-373a-4023-a594-04e532b5ad57) script.

### Alert Template Setup

1. Select Automation / Templates / Alert Templates.
2. Click New Template and name your template.
3. Click Add Alerts, then in the next box click New Alert.
4. In the Alert Actions section, select the box for Script Error.
5. In the script selection box, select the Get-CrashDump script.
6. In the Days of the Week, select Every Day.
7. Select the appropriate User/Technician.
8. Click Save.
9. Click Save and Close.

![Image](../../static/img/docs/64476262-ad0f-474e-aebb-70ec1e0ccd97/image_2.png)

![Image](../../static/img/docs/64476262-ad0f-474e-aebb-70ec1e0ccd97/image_3.png)

### Adding the Alert to the Monitor

1. Open the group you selected earlier.
2. Select Computers.
3. Select Remote Monitors.
4. Look for a monitor named System - Event 41,8006 and click on it once.
5. Modify the Alert Template to be the template you created in the prior step.

![Image](../../static/img/docs/64476262-ad0f-474e-aebb-70ec1e0ccd97/image_4.png)

## FAQ



