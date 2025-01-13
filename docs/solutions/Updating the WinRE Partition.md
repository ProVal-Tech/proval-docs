---
id: 'cwa-kb5034957-update-winre-partition'
title: 'Updating the WinRE Partition for CVE-2024-20666'
title_meta: 'Updating the WinRE Partition for CVE-2024-20666'
keywords: ['winre', 'update', 'cve', 'security', 'patch']
description: 'This document provides detailed instructions on updating the WinRE partition on deployed devices to address security vulnerabilities identified in CVE-2024-20666 by pushing the KB5034957 update. It includes associated scripts, dataviews, and monitors necessary for implementation.'
tags: ['cve', 'monitor', 'script', 'update', 'windows', 'security']
draft: false
unlisted: false
---
## Purpose

Updating the WinRE partition on deployed devices to address security vulnerabilities in CVE-2024-20666 by pushing the 'KB5034957'.

## Associated Content

| Content                                                                                                 | Type       | Function                                                                                                                                                                                                                       |
|---------------------------------------------------------------------------------------------------------|------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [Script - KB5034957 - CVE-2024-20666 - Updating the WinRE partition](https://proval.itglue.com/DOC-5078775-15721390) | Script     | This script automates the updating of WinRE images on supported Windows OS. It updates the WinRE partition on deployed devices to address security vulnerabilities in CVE-2024-20666. Refer to article: [link](https://support.microsoft.com/en-us/topic/kb5034957-updating-the-winre-partition-on-deployed-devices-to-address-security-vulnerabilities-in-cve-2024-20666-0190331b-1ca3-42d8-8a55-7fc406910c10) |
| [Dataview - KB5034957 - CVE-2024-20666 - WinRE Partition Update Status](https://proval.itglue.com/DOC-5078775-15237727) | Dataview   | This dataview contains the status of the WinRE update on the agent stored by the script [CWA Script - KB5034957 - CVE-2024-20666 - Updating the WinRE partition](https://proval.itglue.com/DOC-5078775-15721390) at computer-EDF 'Update WinRE Partition KB5034957'. |
| [Internal Monitor - Update WinRE Partition Detection](https://proval.itglue.com/DOC-5078775-15725325) | Internal Monitor | This monitor detects the online Windows machine whose OS falls under the supported OS criteria detection using the query (c.os NOT REGEXP 'Windows.* (XP|20(03|12)|8|7)' AND c.version REGEXP '22(621|631|000)|190(41|42|44|45)|20348'). It also ensures to run the script once on the agent. |
| **△ Custom - Execute Script - WinRE Partition Updating**                                                | Alert Template | This executes the script [KB5034957 - CVE-2024-20666 - Updating the WinRE partition](https://proval.itglue.com/DOC-5078775-15721390) on the detected device of monitor [Update WinRE Partition Detection](https://proval.itglue.com/DOC-5078775-15725325). |

## Other Content

| Content                                                                                                 | Type       | Function                                                                                                                                                                                                                       |
|---------------------------------------------------------------------------------------------------------|------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [KB5034957 - CVE-2024-20666 - Updating the WinRE partition](https://proval.itglue.com/DOC-5078775-15721389) | Agnostic   | Download the required CAB file for the endpoint to patch WinRE for CVE-2024-20666.                                                                                                                                         |

## Implementation

1. **Import Contents:**

   - [Script - KB5034957 - CVE-2024-20666 - Updating the WinRE partition](https://proval.itglue.com/DOC-5078775-15721390)
   - [Dataview - KB5034957 - CVE-2024-20666 - WinRE Partition Update Status](https://proval.itglue.com/DOC-5078775-15237727)
   - [Internal Monitor - Update WinRE Partition Detection](https://proval.itglue.com/DOC-5078775-15725325)
   - **△ Custom - Execute Script - WinRE Partition Updating**

2. **Reload the system cache:**

   ![Reload System Cache](../../static/img/Updating-the-WinRE-Partition/image_1.png)

3. **Enable Solution:**

   - Navigate to Automation → Monitors within the CWA Control Center and setup the following:  
     [Internal Monitor - Update WinRE Partition Detection](https://proval.itglue.com/DOC-5078775-15725325)  
     ![Setup Internal Monitor](../../static/img/Updating-the-WinRE-Partition/image_2.png)  

   - Setup with **△ Custom - Execute Script - WinRE Partition Updating** alert template.  
     ![Setup Custom Alert Template](../../static/img/Updating-the-WinRE-Partition/image_3.png)  

   - Right-click and Run Now to start the monitor  
     ![Run Now](../../static/img/Updating-the-WinRE-Partition/image_4.png)  

   - The automation will automatically update the WinRE partition to all the supported OS.

4. **Audit Data:**

   The Dataview is built to store the result of the status for the Update WinRE partition.  
   [Dataview - KB5034957 - CVE-2024-20666 - WinRE Partition Update Status](https://proval.itglue.com/DOC-5078775-15237727)

5. **Ticket/Email Creation:**

   - The script has a feature to enable ticketing or sending emails. To set ticketing, it is required to set the ticket category in the monitor itself:  
     ![Set Ticket Category](../../static/img/Updating-the-WinRE-Partition/image_5.png)  

   - Once the ticket category is set, set the global parameter value to 1 in the script for EnableTicketing:  
     ![Set Enable Ticketing](../../static/img/Updating-the-WinRE-Partition/image_6.png)  

   - To send emails, it is mandatory to set the Email address. Multiple email addresses can be set with a semicolon-separated  
     e.g., [abc@def.com](mailto:abc@def.com); [ghi@jkl.com](http://%3Bghi@jkl.com); [mno@pqr.com](http://%3Bmno@pqr.com)  
     Once the email address is set, you can set the value to 1 for the failureemail if you need an email only on the failure case, set 1 for successemail if you want an email for the success case, set 1 on both for both success and failure emails.



