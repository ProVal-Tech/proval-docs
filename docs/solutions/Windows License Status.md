---
id: '3020781e-8710-4582-b4f5-83f963523536'
slug: /3020781e-8710-4582-b4f5-83f963523536
title: 'Windows License Status'
title_meta: 'Windows License Status'
keywords: ['windows', 'license', 'monitor', 'status', 'ticket']
description: 'This document outlines a solution for monitoring the Windows License Status across computers, detailing the implementation steps, associated content, and alert templates for ticket creation when licenses are unlicensed or about to expire.'
tags: []
draft: false
unlisted: false
---

## Purpose

The purpose of this solution is to pull the Windows License Status from the computers, determining whether it is licensed, unlicensed, or about to expire.

## Associated Content

| Content                                                                                                    | Type          | Function                                                                                                                                                                          |
|------------------------------------------------------------------------------------------------------------|---------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [EPM - Windows Configuration - Monitor - Windows License Status](<../cwa/monitors/Windows License Status.md>) | Remote Monitor | This remote monitor checks and returns the Windows License Status via CIMInstance. It will create a ticket for the statuses other than Licensed.                                 |
| [CWM - Automate - Script - Ticket Creation - Computer](<../cwa/scripts/Ticket Creation - Computer.md>)      | Script        | This will be used in the alert template `△ Custom - Ticket Creation Computer - Warning and Failed` and will create a ticket for the statuses other than Licensed.                |
| △ Custom - Ticket Creation Computer - Warning and Failed                                                    | Alert Template | To be applied to the remote monitor [EPM - Windows Configuration - Monitor - Windows License Status](<../cwa/monitors/Windows License Status.md>)                            |
| [EPM - Windows Configuration - Dataview - Windows License Status [Remote Monitor]](<../cwa/dataviews/Windows License Status Remote Monitor.md>) | Dataview      | This will display the status of the Windows License fetched by the remote monitor [EPM - Windows Configuration - Monitor - Windows License Status](<../cwa/monitors/Windows License Status.md>) |

## Implementation

**1.** Import the following content using the ProSync Plugin:  
- [Dataview - Windows License Status [Remote Monitor]](<../cwa/dataviews/Windows License Status Remote Monitor.md>)  
- Alert Template - `△ Custom - Ticket Creation Computer - Warning and Failed`  

**2.** Import the following remote monitor using the instructions outlined within the document:  
- [Import - Remote Monitor - Windows License Status](<../cwa/monitors/Windows License Status.md>)  
  - This should be placed on the groups you wish to audit or ticket if the license is not correct.

**3.** Reload the system cache:  
- ![Reload Cache](../../static/img/Windows-License-Status/image_19.png)

**4.** If ticketing is desired for when a machine has an issue with its Windows license (the consultant should specify this):  
- Apply the following alert template to the remote monitor:  
  - `△ Custom - Ticket Creation Computer - Warning and Failed`  



