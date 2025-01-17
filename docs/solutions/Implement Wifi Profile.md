---
id: '1b38dbb7-848f-4605-b8c9-80e7ebf069d3'
title: 'Removing Unapproved Wi-Fi Profiles from Windows Machines'
title_meta: 'Removing Unapproved Wi-Fi Profiles from Windows Machines'
keywords: ['wifi', 'profiles', 'windows', 'monitor', 'script', 'implementation', 'automation']
description: 'This document outlines the process for finding and removing unapproved Wi-Fi profiles from Windows machines using various scripts and monitors within the ConnectWise Automate platform. It includes steps for auditing, automation, and implementation to ensure compliance with approved Wi-Fi configurations.'
tags: ['windows']
draft: false
unlisted: false
---
## Purpose

The purpose of the solution is to find and remove any unapproved Wi-Fi Profiles from Windows machines.

## Associated Content

## Auditing

| Content                                                                 | Type            | Function                                                                                               |
|-------------------------------------------------------------------------|-----------------|--------------------------------------------------------------------------------------------------------|
| [Internal Monitor - Execute Script - Get Wifi Profile](https://proval.itglue.com/DOC-5078775-16116790) | Internal Monitor | Executes the [Get Wifi Profile](https://proval.itglue.com/DOC-5078775-16111355) script weekly against Windows 10 and 11 machines. |
| [Script - Get Wifi Profile](https://proval.itglue.com/DOC-5078775-16111355) | Script          | Fetches data                                                                                          |
| [Custom Table - pvl_wifi_profiles](https://proval.itglue.com/DOC-5078775-12979849) | Custom Table    | Stores data                                                                                           |
| [Dataview - Wi-Fi Profile - Audit [Script]](https://proval.itglue.com/DOC-5078775-12979850) | Dataview        | Displays data                                                                                         |
| △ Custom - Execute Script - Get Wifi Profile                            | Alert Template   | Executes the script against the machines detected by the [Execute Script - Get Wifi Profile](https://proval.itglue.com/DOC-5078775-16116790) monitor set. |

## Automation

| Content                                                                  | Type            | Function                                                                                               |
|--------------------------------------------------------------------------|-----------------|--------------------------------------------------------------------------------------------------------|
| [Internal Monitor - Wifi Profiles - Add](https://proval.itglue.com/DOC-5078775-16111358) | Internal Monitor | Detects the machines where approved Wifi profiles are not available.                                   |
| [Script - Implement Wifi Profile](https://proval.itglue.com/DOC-5078775-16111356) | Script          | Adds and removes the Wifi profiles.                                                                    |
| △ Custom - Execute Script - Implement Wifi Profile                       | Alert Template   | Executes the script against the machines detected by the [Wifi Profiles - Add](https://proval.itglue.com/DOC-5078775-16111358) monitor set. |

## Implementation

1. Import the following scripts using the Prosync plugin:
   - [Script - Get Wifi Profile](https://proval.itglue.com/DOC-5078775-16111355)
   - [Script - Implement Wifi Profile](https://proval.itglue.com/DOC-5078775-16111356)

2. Import the following internal monitors using the Prosync plugin:
   - [Internal Monitor - Execute Script - Get Wifi Profile](https://proval.itglue.com/DOC-5078775-16116790)
   - [Internal Monitor - Wifi Profiles - Add](https://proval.itglue.com/DOC-5078775-16111358)

3. Import the following Alert Templates using the Prosync plugin:
   - △ Custom - Execute Script - Get Wifi Profile
   - △ Custom - Execute Script - Implement Wifi Profile

4. Import the [Dataview - Wi-Fi Profile - Audit [Script]](https://proval.itglue.com/DOC-5078775-12979850) dataview using the Prosync plugin.

5. Reload the system cache:
   ![Reload System Cache](../../static/img/Implement-Wifi-Profile/image_15.png)

6. Configure the solution as outlined below:
   - Enable the desired monitors in the Workstation Service Plan groups.
   - Navigate to Automation → Monitors within the CWA Control Center and set up the following:
     - [Internal Monitor - Execute Script - Get Wifi Profile](https://proval.itglue.com/DOC-5078775-16116790)
       - Alert Template: △ Custom - Execute Script - Get Wifi Profile
       - Right-click and Run Now to start the monitor
     - [Internal Monitor - Wifi Profiles - Add](https://proval.itglue.com/DOC-5078775-16111358)
       - Alert Template: △ Custom - Execute Script - Implement Wifi Profile
       - Right-click and Run Now to start the monitor











