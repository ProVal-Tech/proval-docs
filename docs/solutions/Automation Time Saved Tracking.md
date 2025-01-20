---
id: '81ac366c-a635-4419-9a29-94a1fe7ddac0'
title: 'Automation Time Tracking for ProVal'
title_meta: 'Automation Time Tracking for ProVal'
keywords: ['automation', 'time', 'tracking', 'proval', 'client']
description: 'This document outlines the purpose and implementation of tracking estimated time saved for clients through ProVal automation. It includes associated content, initial implementation steps, and content integration instructions for agent procedures, policies, and monitors.'
tags: ['performance', 'report', 'setup', 'software']
draft: false
unlisted: false
---
## Purpose

To track the estimated time saved to the client via ProVal automation

## Associated Content

| Content                                                                                                     | Type   | Function                                                                                     |
|-------------------------------------------------------------------------------------------------------------|--------|----------------------------------------------------------------------------------------------|
| Link to the documentation of the content piece                                                             | What is the type of content? (Script, Custom Table, VSA Policy, CWM Dataview, etc.) | What does this content piece do in the whole of the solution?                               |
| [VSA - VSA Configuration - Agent Procedure - Automation Time CF Update](<../vsa/procedures/Automation Time CF Update.md>) | AP     | This is the main Procedure used by all others to perform the CF update logic.               |
| [VSA - VSA Configuration - Agent Procedure - Monthly Automation Time Reset](<../vsa/procedures/Monthly Automation Time Reset.md>) | AP     | Resets the value of the Monthly CF                                                          |
| [VSA - VSA Configuration - Agent Procedure - Automation Time Saved (5-60) Minutes](<../vsa/procedures/Automation Time Saved (5-60) Minutes.md>) | AP     | APs with incremental time values that call the main CF Update Script. These are for ease of scheduling within other content. |
| [VSA - VSA Configuration - Agent Procedure - Automation Time Saved Initialize](<../vsa/procedures/Automation Time Saved Initialize.md>) | AP     | Sets both CFs to 0. This is for ease of implementation, as empty Custom Fields cannot be polled with Database Views. |
| [VSA - VSA Host Procedure - Agent Procedure - Automation Time Saved Reports](<../vsa/procedures/Automation Time Saved Reports.md>) | AP     | Runs [VSA - VSA Host Procedure - Agnostic - Get-VsaTimeSaved.ps1](<../vsa/procedures/Get-VsaTimeSaved.ps1.md>) and places the CSV it generates into GetFiles for client and consultant access. |
| [VSA - VSA Host Procedure - Agnostic - Get-VsaTimeSaved.ps1](<../vsa/procedures/Get-VsaTimeSaved.ps1.md>) | Powershell | Generates a CSV report for the end client to show cumulative and monthly time saved values for each org in their environment, as well as the total for all orgs. |
| [VSA - VSA Configuration - Custom Fields - xPVAL Automation Time Saved](https://proval.itglue.com/DOC-5078775-11143830) | Machine CF | Where the Cumulative and Monthly time saved data is stored                                   |
| [VSA - VSA Configuration - Policy - Automation Time Monthly Reset Schedule](<../vsa/policies/Automation Time Monthly Reset Schedule.md>) | Policy | Schedules the Monthly CF Field Reset AP.                                                    |
| [VSA - VSA Configuration - Policy - Automation Time Saved Report Schedule](<../vsa/policies/Automation Time Saved Report Schedule.md>) | Policy | Schedules the Report AP                                                                      |

### Initial Implementation
- Create both custom fields
- Import all Agent Procedures and check to ensure they reference the proper Custom Fields.
- Import the Policy and ensure it properly schedules the Monthly Reset AP
- Continue to the next section.

### Content Integration
For all content that needs saved time tracked, and any new content that will save the client considerable (5+ minutes) of manual configuration/labor, do the following:

#### Agent Procedures
- Determine the location in the agent procedure where the automation is completed successfully.
- Add an executeProcedure() function, and select one of the incremental APs.
- If you would like a custom time to be entered, you can also use a getVariableUniversalWrite() function to set the custom time, directly before calling the Automation Time Saved CF Update procedure. Be sure to utilize universal1 only. i.e:
  - `getVariableUniversalWrite("7"," "," ",All Operating Systems,Halt On Fail)`
  - `executeProcedure("Automation Time Saved CF Update"," ",Immediate,All Operating Systems,Halt On Fail)`

#### Policy
- Schedule the appropriate incremental AP. If the amount of time you wish to set does not exist as an incremental AP, create a new incremental AP with the desired time, in minutes.

#### Monitors & Alerts
- Set an ATSE action, Script, with the appropriate incremental AP. If the amount of time you wish to set does not exist as an incremental AP, create a new incremental AP with the desired time, in minutes.












