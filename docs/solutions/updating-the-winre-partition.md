---
id: 'c0aa9260-1daa-4614-9daf-1c898315b3c8'
slug: /c0aa9260-1daa-4614-9daf-1c898315b3c8
title: 'Updating the WinRE Partition'
title_meta: 'Updating the WinRE Partition'
keywords: ['winre', 'update', 'cve', 'security', 'patch']
description: 'This document provides detailed instructions on updating the WinRE partition on deployed devices to address security vulnerabilities identified in CVE-2024-20666 by pushing the KB5034957 update. It includes associated scripts, dataviews, and monitors necessary for implementation.'
tags: ['cve', 'security', 'update', 'windows']
draft: false
unlisted: false
---

## Purpose

Updating the WinRE partition on deployed devices to address security vulnerabilities in CVE-2024-20666 by pushing the KB5034957 update.

## Associated Content

| Content                                                                                                 | Type            | Function                                                                                                                                                                                                                       |
|---------------------------------------------------------------------------------------------------------|-----------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [Script - KB5034957 - CVE-2024-20666 - Updating the WinRE partition](/docs/e3be5c3e-c492-4ea5-8dbe-1d1c7b546c52) | Script          | This script automates the updating of WinRE images on supported Windows OS. It updates the WinRE partition on deployed devices to address security vulnerabilities in CVE-2024-20666. Refer to article: [link](https://support.microsoft.com/en-us/topic/kb5034957-updating-the-winre-partition-on-deployed-devices-to-address-security-vulnerabilities-in-cve-2024-20666-0190331b-1ca3-42d8-8a55-7fc406910c10) |
| [Dataview - KB5034957 - CVE-2024-20666 - WinRE Partition Update Status](/docs/b364da24-ecf9-4237-857b-27de875b898c) | Dataview        | This dataview contains the status of the WinRE update on the agent stored by the script [CWA Script - KB5034957 - CVE-2024-20666 - Updating the WinRE partition](/docs/e3be5c3e-c492-4ea5-8dbe-1d1c7b546c52) at computer-EDF 'Update WinRE Partition KB5034957'. |
| [Internal Monitor - Update WinRE Partition Detection](/docs/857bac8a-a3f1-408d-9b1f-73b0e5ec6e07) | Internal Monitor | This monitor detects the online Windows machines whose OS falls under the supported OS criteria using the query (c.os NOT REGEXP 'Windows.* (XP|20(03|12)|8|7)' AND c.version REGEXP '22(621|631|000)|190(41|42|44|45)|20348'). It also ensures the script runs once on the agent. |
| **△ Custom - Execute Script - WinRE Partition Updating**                                                | Alert Template   | This executes the script [KB5034957 - CVE-2024-20666 - Updating the WinRE partition](/docs/e3be5c3e-c492-4ea5-8dbe-1d1c7b546c52) on the detected device of monitor [Update WinRE Partition Detection](/docs/857bac8a-a3f1-408d-9b1f-73b0e5ec6e07). |

## Other Content

| Content                                                                                                 | Type       | Function                                                                                                                                                                                                                       |
|---------------------------------------------------------------------------------------------------------|------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [KB5034957 - CVE-2024-20666 - Updating the WinRE partition](/docs/e3be5c3e-c492-4ea5-8dbe-1d1c7b546c52) | Agnostic   | Download the required CAB file for the endpoint to patch WinRE for CVE-2024-20666.                                                                                                                                         |

## Implementation

1. **Import Contents:**

   - [Script - KB5034957 - CVE-2024-20666 - Updating the WinRE partition](/docs/e3be5c3e-c492-4ea5-8dbe-1d1c7b546c52)
   - [Dataview - KB5034957 - CVE-2024-20666 - WinRE Partition Update Status](/docs/b364da24-ecf9-4237-857b-27de875b898c)
   - [Internal Monitor - Update WinRE Partition Detection](/docs/857bac8a-a3f1-408d-9b1f-73b0e5ec6e07)
   - **△ Custom - Execute Script - WinRE Partition Updating**

2. **Reload the system cache:**

   ![Reload System Cache](../../static/img/docs/c0aa9260-1daa-4614-9daf-1c898315b3c8/image_1.png)

3. **Enable Solution:**

   - Navigate to Automation → Monitors within the CWA Control Center and set up the following:  
     [Internal Monitor - Update WinRE Partition Detection](/docs/857bac8a-a3f1-408d-9b1f-73b0e5ec6e07)  
     ![Setup Internal Monitor](../../static/img/docs/c0aa9260-1daa-4614-9daf-1c898315b3c8/image_2.png)  

   - Set up with the **△ Custom - Execute Script - WinRE Partition Updating** alert template.  
     ![Setup Custom Alert Template](../../static/img/docs/c0aa9260-1daa-4614-9daf-1c898315b3c8/image_3.png)  

   - Right-click and select Run Now to start the monitor.  
     ![Run Now](../../static/img/docs/c0aa9260-1daa-4614-9daf-1c898315b3c8/image_4.png)  

   - The automation will automatically update the WinRE partition on all supported OS.

4. **Audit Data:**

   The Dataview is designed to store the result of the status for the Update WinRE partition.  
   [Dataview - KB5034957 - CVE-2024-20666 - WinRE Partition Update Status](/docs/b364da24-ecf9-4237-857b-27de875b898c)

5. **Ticket/Email Creation:**

   - The script has a feature to enable ticketing or sending emails. To set ticketing, it is required to set the ticket category in the monitor itself:  
     ![Set Ticket Category](../../static/img/docs/c0aa9260-1daa-4614-9daf-1c898315b3c8/image_5.png)  

   - Once the ticket category is set, adjust the global parameter value to 1 in the script for EnableTicketing:  
     ![Set Enable Ticketing](../../static/img/docs/c0aa9260-1daa-4614-9daf-1c898315b3c8/image_6.png)  

   - To send emails, it is mandatory to set the email address. Multiple email addresses can be set, separated by semicolons:  
     e.g., [abc@def.com](mailto:abc@def.com); [ghi@jkl.com](mailto:ghi@jkl.com); [mno@pqr.com](mailto:mno@pqr.com)  
     Once the email address is set, you can set the value to 1 for the failure email if you need an email only on failure, set 1 for success email if you want an email for success, or set 1 for both for emails on both success and failure.


