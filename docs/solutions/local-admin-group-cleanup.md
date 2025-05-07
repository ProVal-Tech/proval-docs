---
id: 'f65e32ea-dd71-436e-bb50-5607d23b8adb'
slug: /f65e32ea-dd71-436e-bb50-5607d23b8adb
title: 'Local Admin Group Cleanup'
title_meta: 'Local Admin Group Cleanup'
keywords: ['local', 'admin', 'cleanup', 'windows', 'monitor']
description: 'This document outlines the steps for implementing the Local Admin Group Cleanup solution to manage members in the local admin group on Windows machines. It includes update notices, associated content, and detailed implementation instructions.'
tags: ['security', 'setup', 'windows']
draft: false
unlisted: false
---

## Purpose

The purpose of this solution is to manage the members in the local admin group for Windows machines.

## Update Notice: 27 September 2024

The solution's Extra Data Fields have been modified. Update the [Local Admin Group Cleanup - Add/Remove](/docs/e228540f-e4f4-4e67-801f-cdff876f955f) script from the `Prosync` plugin and run/debug against an online Windows machine with `Set_Environment` set to `1` to implement the changes.

![Image](../../static/img/docs/e228540f-e4f4-4e67-801f-cdff876f955f/image_1.webp)

## Associated Content

| Content                                                                 | Type           | Function                                                                                                     |
|-------------------------------------------------------------------------|----------------|--------------------------------------------------------------------------------------------------------------|
| [Local Admin Group Cleanup - Add/Remove](/docs/e228540f-e4f4-4e67-801f-cdff876f955f) | Script         | Manage the addition and removal of members from the local admin group.                                      |
| [Local Admin Group Cleanup](/docs/d49db584-9380-486d-a179-c014352f8be1)            | Internal Monitor | Detects Windows computers where the local admin group cleanup process is enabled, but the script has not been executed in the past 7 days. |
| △ Custom - Local Admin Group Cleanup                                     | Alert Template | Run the script against the computers detected by the internal monitor.                                      |

## Implementation

1. Import the following content using the ProSync Plugin:
   - [Script - Local Admin Group Cleanup - Add/Remove](/docs/e228540f-e4f4-4e67-801f-cdff876f955f)
   - [Internal Monitor - Local Admin Group Cleanup](/docs/d49db584-9380-486d-a179-c014352f8be1)  
   - Alert Template - △ Custom - Local Admin Group Cleanup

2. Reload the system cache:  
   ![Image](../../static/img/docs/e228540f-e4f4-4e67-801f-cdff876f955f/image_2.webp)

3. **First Execution:** Run the script against any online Windows computer with the `Set_Environment` parameter set to `1` to create the system properties and the EDFs used by the solution.  
   ![Image](../../static/img/docs/e228540f-e4f4-4e67-801f-cdff876f955f/image_1.webp)

4. Configure the solution as outlined below:
   - Navigate to Automation → Monitors within the CWA Control Center and set up the following:
     - [Internal Monitor - Local Admin Group Cleanup](/docs/d49db584-9380-486d-a179-c014352f8be1)  
       - `Alert Template: △ Custom - Local Admin Group Cleanup`
       - Right-click and Run Now to start the monitor

5. Confirm with the consultant before enabling ticketing by setting a ticket category for the [Local Admin Group Cleanup](/docs/d49db584-9380-486d-a179-c014352f8be1) internal monitor.  
   ![Image](../../static/img/docs/e228540f-e4f4-4e67-801f-cdff876f955f/image_3.webp)

6. Set the appropriate values for the system properties and EDFs defined in the [script's](/docs/e228540f-e4f4-4e67-801f-cdff876f955f) document, which should be provided by the consultant.

