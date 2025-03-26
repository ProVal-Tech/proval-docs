---
id: '1b38dbb7-848f-4605-b8c9-80e7ebf069d3'
slug: /1b38dbb7-848f-4605-b8c9-80e7ebf069d3
title: 'Implement Wifi Profile'
title_meta: 'Implement Wifi Profile'
keywords: ['wifi', 'profiles', 'windows', 'monitor', 'script', 'implementation', 'automation']
description: 'This document outlines the process for finding and removing unapproved Wi-Fi profiles from Windows machines using various scripts and monitors within the ConnectWise Automate platform. It includes steps for auditing, automation, and implementation to ensure compliance with approved Wi-Fi configurations.'
tags: ['windows']
draft: false
unlisted: false
---

## Purpose

The purpose of this solution is to find and remove any unapproved Wi-Fi profiles from Windows machines.

## Associated Content

## Auditing

| Content                                                                 | Type            | Function                                                                                               |
|-------------------------------------------------------------------------|-----------------|--------------------------------------------------------------------------------------------------------|
| [Internal Monitor - Execute Script - Get Wifi Profile](/docs/ab5fe07a-d644-4011-96bf-67aa8019216f) | Internal Monitor | Executes the [Get Wifi Profile](/docs/d97282c0-4d81-46f9-b821-d553c2d8a596) script weekly against Windows 10 and 11 machines. |
| [Script - Get Wifi Profile](/docs/d97282c0-4d81-46f9-b821-d553c2d8a596) | Script          | Fetches data                                                                                          |
| [Custom Table - pvl_wifi_profiles](/docs/f317da6e-0ea2-4c1e-bad9-4d0ad25684d3) | Custom Table    | Stores data                                                                                           |
| [Dataview - Wi-Fi Profile - Audit [Script]](/docs/40d25f32-9014-44ea-8332-0ab24d59ab43) | Dataview        | Displays data                                                                                         |
| △ Custom - Execute Script - Get Wifi Profile                            | Alert Template   | Executes the script against the machines detected by the [Execute Script - Get Wifi Profile](/docs/ab5fe07a-d644-4011-96bf-67aa8019216f) monitor set. |

## Automation

| Content                                                                  | Type            | Function                                                                                               |
|--------------------------------------------------------------------------|-----------------|--------------------------------------------------------------------------------------------------------|
| [Internal Monitor - Wifi Profiles - Add](/docs/3a1d1f7d-a655-40bf-a048-5e861aee00ae) | Internal Monitor | Detects the machines where approved Wi-Fi profiles are not available.                                   |
| [Script - Implement Wifi Profile](/docs/cffbdce7-7390-4b11-9300-6a34799b7d82) | Script          | Adds and removes the Wi-Fi profiles.                                                                    |
| △ Custom - Execute Script - Implement Wifi Profile                       | Alert Template   | Executes the script against the machines detected by the [Wifi Profiles - Add](/docs/3a1d1f7d-a655-40bf-a048-5e861aee00ae) monitor set. |

## Implementation

1. Import the following scripts using the Prosync plugin:
   - [Script - Get Wifi Profile](/docs/d97282c0-4d81-46f9-b821-d553c2d8a596)
   - [Script - Implement Wifi Profile](/docs/cffbdce7-7390-4b11-9300-6a34799b7d82)

2. Import the following internal monitors using the Prosync plugin:
   - [Internal Monitor - Execute Script - Get Wifi Profile](/docs/ab5fe07a-d644-4011-96bf-67aa8019216f)
   - [Internal Monitor - Wifi Profiles - Add](/docs/3a1d1f7d-a655-40bf-a048-5e861aee00ae)

3. Import the following Alert Templates using the Prosync plugin:
   - △ Custom - Execute Script - Get Wifi Profile
   - △ Custom - Execute Script - Implement Wifi Profile

4. Import the [Dataview - Wi-Fi Profile - Audit [Script]](/docs/40d25f32-9014-44ea-8332-0ab24d59ab43) dataview using the Prosync plugin.

5. Reload the system cache:
   ![Reload System Cache](../../static/img/Implement-Wifi-Profile/image_15.png)

6. Configure the solution as outlined below:
   - Enable the desired monitors in the Workstation Service Plan groups.
   - Navigate to Automation → Monitors within the CWA Control Center and set up the following:
     - [Internal Monitor - Execute Script - Get Wifi Profile](/docs/ab5fe07a-d644-4011-96bf-67aa8019216f)
       - Alert Template: △ Custom - Execute Script - Get Wifi Profile
       - Right-click and Run Now to start the monitor
     - [Internal Monitor - Wifi Profiles - Add](/docs/3a1d1f7d-a655-40bf-a048-5e861aee00ae)
       - Alert Template: △ Custom - Execute Script - Implement Wifi Profile
       - Right-click and Run Now to start the monitor



