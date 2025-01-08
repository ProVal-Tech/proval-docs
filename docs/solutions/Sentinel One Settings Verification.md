---
id: 'cwa-sentinel-agent-verification'
title: 'Sentinel Agent Verification Process'
title_meta: 'Sentinel Agent Verification Process'
keywords: ['sentinel', 'agent', 'verification', 'monitor', 'script']
description: 'This document outlines the process for verifying that computers are using the correct Sentinel Agent associated with their respective clients. It includes implementation steps, associated scripts, and monitors for effective management.'
tags: ['configuration', 'monitoring', 'software', 'security', 'setup']
draft: false
unlisted: false
---
## Purpose

The purpose of this solution is to identify instances where computers are utilizing a Sentinel Agent from a different company than the one to which they rightfully belong.

## Associated Content

| Content                                                                                                                                                                       | Type           | Function                                                                                                               |
|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------|------------------------------------------------------------------------------------------------------------------------|
| [SWM - Software Configuration - Script - Sentinel One Settings Verification](https://proval.itglue.com/DOC-5078775-12924820)                                             | Script         | Compares the sentinel one token available on the computer with the one present in the client-level Sentinel Token EDF. |
| [CWM - Automate - Internal Monitor - Execute Script - Sentinel One Settings Verification](https://proval.itglue.com/DOC-5078775-12924830)                                 | Internal Monitor| Executes the [SWM - Software Configuration - Script - Sentinel One Settings Verification](https://proval.itglue.com/DOC-5078775-12924820) script once per 14 days against the Sentinel Managed client with the Sentinel Agent Installed. |
| △ CUSTOM - Execute Script - Sentinel One Settings Verification                                                                                                             | Alert Template  | Executes the script against the computers detected in the monitor set.                                               |

## Implementation

- Read the solution-related documents carefully.
- Import the [SWM - Software Configuration - Script - Sentinel One Settings Verification](https://proval.itglue.com/DOC-5078775-12924820) script.
- Import the [CWM - Automate - Internal Monitor - Execute Script - Sentinel One Settings Verification](https://proval.itglue.com/DOC-5078775-12924830) internal monitor.
- Create/import the `△ CUSTOM - Execute Script - Sentinel One Settings Verification` alert template, and ensure that the alert template is running the [SWM - Software Configuration - Script - Sentinel One Settings Verification](https://proval.itglue.com/DOC-5078775-12924820) script.
- Importing the script and internal monitor is not going to create the EDF(s), as both of the contents are using existing Sentinel One EDF.
- Go to the client-level EDFs, find the name of the EDF that the partner is using to store the Sentinel One Installation Token and set it to the Script's global variable `Client_Level_Sentinel_One_Token_EDF_Name`.  
  ![Image](5078775/docs/13390806/images/19203998)  
  ![Image](5078775/docs/13390806/images/19204047)  
- If the partner is using different names for the client-level Installation OptIn and location and computer-level Installation OptOut EDFs then change the name of the EDFs in the internal monitor's additional condition too.  
  ![Image](5078775/docs/13390806/images/19204185)  
- Execute the script against a few random machines with Sentinel One Installed and ensure that it's delivering as expected.
- Implement the alert template to the internal monitor.

