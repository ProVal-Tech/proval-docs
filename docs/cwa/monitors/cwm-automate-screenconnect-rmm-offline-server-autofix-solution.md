---
id: 'c53aa0aa-4c52-4cd7-9971-f99662b4cbec'
slug: /c53aa0aa-4c52-4cd7-9971-f99662b4cbec
title: 'CWM - Automate - ScreenConnect RMM+ - Offline Server AutoFix Solution'
title_meta: 'CWM - Automate - ScreenConnect RMM+ - Offline Server AutoFix Solution'
keywords: ['autofix', 'offline', 'server', 'agent', 'connectwise', 'monitor']
description: 'This document outlines a solution for accurate offline server and critical agent reporting in ConnectWise Automate, including remediation steps when discrepancies between ScreenConnect and Automate are detected. It also details the implementation of associated scripts and monitors, ensuring efficient ticket management and automation.'
tags: []
draft: false
unlisted: false
---

## Purpose

The goal of this solution is to provide accurate offline server/critical agent reporting while also validating that the machine is actually offline in ScreenConnect. If the machine is online in ScreenConnect but offline in Automate, remediation steps will be taken, and the output will be logged into the ticket. If the remediation is successful, the tickets will be auto-closed.

## Associated Content

| Content                                                                 | Type          | Function                                                                                                                                                                                                                                                                                       |
|-------------------------------------------------------------------------|---------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [Script - Agent - Remote Repair - RMM +](/docs/13151439-b80d-4746-b804-1d55a6206462) | Script        | The script utilizes the ConnectWise Automate RMM+ plugin to reinstall the Automate agent on machines that are showing offline while the ScreenConnect agent is online. This script deprecates the CW Control RMM+ API - Offline Server AutoFix.                                             |
| [Monitor - Offline Server](/docs/f0a04369-c67b-49e1-a042-8ca3a343881f)                      | Monitor       | This internal monitor detects offline servers based on the last contact and last heartbeat time with the RMM.                                                                                                                                                                                |
| **△ Custom - Autofix - Critical Machine Offline (RMM+)**               | Alert Template | This alert template is used with the [Monitor - Offline Server](/docs/f0a04369-c67b-49e1-a042-8ca3a343881f) to run the [Script - Agent - Remote Repair - RMM +](/docs/13151439-b80d-4746-b804-1d55a6206462) as an autofix. In this template, the script performs the autofix and manages ticket creation/commenting/finishing as well. |
| **△ Custom - Default Ticket - Autofix - Critical Machine Offline (RMM+)** | Alert Template | This alert template is used with the [Monitor - Offline Server](/docs/f0a04369-c67b-49e1-a042-8ca3a343881f) to run the [Script - Agent - Remote Repair - RMM +](/docs/13151439-b80d-4746-b804-1d55a6206462) as an autofix. In this template, the ticket is created separately using the default create ticket functionality of Alert Template, and the script performs the autofix, along with ticket commenting and finishing based on the autofix status of failure and success respectively. |

Note: For this solution to work, it is mandatory to have the RMM+ configured in the CW Control.

## Additional Content

| Content                                                                 | Type          | Function                                                                                                                                                                                                                                           |
|-------------------------------------------------------------------------|---------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [CWM - Automate - RMM+ Plugin Configuration](/docs/f99ddaae-0cb3-4941-b2aa-dc93671dd246) | Document      | This document helps with configuring the RMM+ Plugin and explains how to create sessions for machines that have not checked in for over '**X**' number of days.                                                                                                                                 |

## Implementation

1. Import the following content using the ProSync Plugin:
   - Import the Script [Script - Agent - Remote Repair - RMM +](/docs/13151439-b80d-4746-b804-1d55a6206462)
   - Import the monitor [Internal Monitor - Offline Server](/docs/f0a04369-c67b-49e1-a042-8ca3a343881f)
   - Import the Alert Template "**△ Custom - Autofix - Critical Machine Offline (RMM+)**"
   - Import the Alert Template "**△ Custom - Default Ticket - Autofix - Critical Machine Offline (RMM+)**"

2. Reload the system cache:
   ![Cache Reload](../../../static/img/docs/c53aa0aa-4c52-4cd7-9971-f99662b4cbec/image_1.webp)

3. Configure the solution as outlined below:
   - Navigate to Automation -> Monitors within the CWA Control Center and set up the following:
     - [Monitor - ProVal - Production - Agent - Offline Server](/docs/f0a04369-c67b-49e1-a042-8ca3a343881f)
       - Here are two options for the alert template applicability:
         - `△ Custom - Default Ticket - Autofix - Critical Machine Offline (RMM+)` OR
         - `△ Custom - Autofix - Critical Machine Offline (RMM+)`
       - **If this has not been specified by the consultant, the default should be:**
         - `△ Custom - Default Ticket - Autofix - Critical Machine Offline (RMM+)`
       - Right-click and Run Now to start the monitor

### Things to Note about the Alert Templates:

- `△ Custom - Default Ticket - Autofix - Critical Machine Offline (RMM+)`
  - This will create a ticket using the default create ticket functionality rather than using the script to create the ticket. This ensures that the ticket gets generated whether the scripting engine is overloaded or not. The downside of using this is that the initial description of the tickets is not as detailed with additional computer information.
  ![Default Ticket Example](../../../static/img/docs/c53aa0aa-4c52-4cd7-9971-f99662b4cbec/image_2.webp)

- `△ Custom - Autofix - Critical Machine Offline (RMM+)`
  - This will create the ticket entirely through the autofix script, ensuring the initial description of the ticket contains helpful computer information and is automatically adapted for different types of machines, such as critical workstations, Linux, and Mac machines.
  ![Autofix Ticket Example](../../../static/img/docs/c53aa0aa-4c52-4cd7-9971-f99662b4cbec/image_3.webp)

## FAQ

1. **Does this create a ticket during agent reinstallation failure, and does it have an auto-ticket close feature once the agent starts check-in?**
   - Yes, it creates a ticket for the failed attempt at agent reinstallation and also automatically finishes the ticket if the agent checks in.

2. **What are the differences between the two tickets, and how do they look?**
   - For the Default Ticket creation alert template, the initial description should look something like this:
     ![Default Ticket Description](../../../static/img/docs/c53aa0aa-4c52-4cd7-9971-f99662b4cbec/image_4.webp)

   - For the ticket creation from the script, the initial description should look something like this:
     ![Script Ticket Description](../../../static/img/docs/c53aa0aa-4c52-4cd7-9971-f99662b4cbec/image_5.webp)
     - Keep in mind that for any other machine types, the word 'Server' will be replaced with the type of critical machine that is offline. Those potential options are as follows:
       - 'Critical Mac Machine'
       - 'Linux Machine'
       - 'Critical Workstation'
       - 'Server'
     - It is recommended that you use this alert template only if you are confident that the scripting engine should not get overloaded based on your current configuration OR if you are okay with accepting the potential risk if the scripting engine has a problem during an offline server issue.
