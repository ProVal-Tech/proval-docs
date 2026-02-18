---
id: '7d348f5c-3c23-4efb-b402-0ffba0492117'
slug: /7d348f5c-3c23-4efb-b402-0ffba0492117
title: 'Winget Enablement Status'
title_meta: 'Winget Enablement Status'
keywords: ['winget', 'enablement-status', 'availability', 'winget-status']
description: 'The purpose of this solution is to collect and display whether Winget is available on Windows machines.'
tags: ['windows', 'application']
draft: false
unlisted: false
---

## Purpose

The purpose of this solution is to collect and display whether Winget is available on Windows machines.

## Associated Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [Get Winget Enablement Status](/docs/a5e852f4-0ca3-11f1-963a-92000234cfc2) | Script | Checks whether Winget is enabled and available on Windows machines. A user must be logged in for the script to run. |
| [Winget Enablement Status](/docs/0beb37c7-823a-4dd3-9c5a-79db928cdc3b) | Dataview | Displays the Winget enablement status for Windows machines, indicating whether Winget is available or not. |
| [Execute Script - Get Winget Enablement Status](/docs/52e8e3aa-75ec-47fe-8f23-6f8378cff4bf) | Internal Monitor | Runs the [Get Winget Enablement Status](/docs/a5e852f4-0ca3-11f1-963a-92000234cfc2) script on Windows machines. The script will run daily on any machine where Winget is not available or where no user was logged in during the previous audit. It will not run again on machines where Winget was already confirmed as available. |
| `△ Custom - Execute Script - Get Winget Enablement Status` | Alert Template | Runs the script on the machines detected by the internal monitor. |

## Implementation

1. Import the following content using the ProSync Plugin:
   - [Script: Get Winget Enablement Status](/docs/a5e852f4-0ca3-11f1-963a-92000234cfc2)
   - [Dataview: Winget Enablement Status](/docs/0beb37c7-823a-4dd3-9c5a-79db928cdc3b)
   - [Internal Monitor: Execute Script - Get Winget Enablement Status](/docs/52e8e3aa-75ec-47fe-8f23-6f8378cff4bf)
   - Alert Template - △ Custom - Execute Script - Get Winget Enablement Status

2. Reload the system cache (Ctrl + R).

3. Configure the solution as outlined below:
   - Navigate to Automation → Monitors within the CWA Control Center and set up the following:
     - [Internal Monitor - Execute Script - Get Winget Enablement Status](/docs/52e8e3aa-75ec-47fe-8f23-6f8378cff4bf)
       - Alert Template - `△ Custom - Execute Script - Get Winget Enablement Status`
       - Right-click and Run Now to start the monitor
