---
id: '81ac366c-a635-4419-9a29-94a1fe7ddac0'
slug: /81ac366c-a635-4419-9a29-94a1fe7ddac0
title: 'Automation Time Saved Tracking'
title_meta: 'Automation Time Saved Tracking'
keywords: ['automation', 'time', 'tracking', 'proval', 'client']
description: 'This document outlines the purpose and implementation of tracking estimated time saved for clients through ProVal automation. It includes associated content, initial implementation steps, and content integration instructions for agent procedures, policies, and monitors.'
tags: ['performance', 'report', 'setup', 'software']
draft: false
unlisted: false
---

## Purpose

To track the estimated time saved to the client via ProVal automation.

## Associated Content

| Content                                                                                                     | Type   | Function                                                                                     |
|-------------------------------------------------------------------------------------------------------------|--------|----------------------------------------------------------------------------------------------|
| Link to the documentation of the content piece                                                             | What is the type of content? (Script, Custom Table, VSA Policy, CWM Dataview, etc.) | What does this content piece do in the whole of the solution?                               |
| [VSA - VSA Configuration - Agent Procedure - Automation Time CF Update](/docs/d4f85104-753b-470e-a620-749cf24a32c2) | AP     | This is the main procedure used by all others to perform the CF update logic.               |
| [VSA - VSA Configuration - Agent Procedure - Monthly Automation Time Reset](/docs/1552dec9-04ae-484f-b217-922542928af3) | AP     | Resets the value of the Monthly CF                                                          |
| [VSA - VSA Configuration - Agent Procedure - Automation Time Saved (5-60) Minutes](/docs/6d0aca76-28b6-4a21-9617-75ffd5868977) | AP     | APs with incremental time values that call the main CF Update Script. These are for ease of scheduling within other content. |
| [VSA - VSA Configuration - Agent Procedure - Automation Time Saved Initialize](/docs/813b9d8d-8c30-4595-a700-740fd65b3942) | AP     | Sets both CFs to 0. This is for ease of implementation, as empty Custom Fields cannot be polled with Database Views. |
| [VSA - VSA Host Procedure - Agent Procedure - Automation Time Saved Reports](/docs/52d14c0f-fe3e-4520-bed5-b05db491bf26) | AP     | Runs [VSA - VSA Host Procedure - Agnostic - Get-VsaTimeSaved.ps1](/docs/b2661e46-518b-4a4f-9b4b-21f9b69ff100) and places the CSV it generates into GetFiles for client and consultant access. |
| [VSA - VSA Host Procedure - Agnostic - Get-VsaTimeSaved.ps1](/docs/b2661e46-518b-4a4f-9b4b-21f9b69ff100) | Powershell | Generates a CSV report for the end client to show cumulative and monthly time saved values for each org in their environment, as well as the total for all orgs. |
| [VSA - VSA Configuration - Custom Fields - xPVAL Automation Time Saved](/docs/12ee4e1c-ebde-43ec-bcc1-ee5388d31010) | Machine CF | Where the cumulative and monthly time saved data is stored                                   |
| [VSA - VSA Configuration - Policy - Automation Time Monthly Reset Schedule](/docs/a49d1e3f-e2d8-444d-a4fc-fd91bccea30c) | Policy | Schedules the Monthly CF Field Reset AP.                                                    |
| [VSA - VSA Configuration - Policy - Automation Time Saved Report Schedule](/docs/a85247d0-7fe8-4221-8f25-6f3841297f38) | Policy | Schedules the Report AP                                                                      |

### Initial Implementation
- Create both custom fields.
- Import all Agent Procedures and check to ensure they reference the proper Custom Fields.
- Import the Policy and ensure it properly schedules the Monthly Reset AP.
- Continue to the next section.

### Content Integration
For all content that needs saved time tracked, and any new content that will save the client considerable (5+ minutes) of manual configuration/labor, do the following:

#### Agent Procedures
- Determine the location in the agent procedure where the automation is completed successfully.
- Add an `executeProcedure()` function, and select one of the incremental APs.
- If you would like a custom time to be entered, you can also use a `getVariableUniversalWrite()` function to set the custom time, directly before calling the Automation Time Saved CF Update procedure. Be sure to utilize `universal1` only. For example:
  - `getVariableUniversalWrite("7", " ", " ", All Operating Systems, Halt On Fail)`
  - `executeProcedure("Automation Time Saved CF Update", " ", Immediate, All Operating Systems, Halt On Fail)`

#### Policy
- Schedule the appropriate incremental AP. If the amount of time you wish to set does not exist as an incremental AP, create a new incremental AP with the desired time in minutes.

#### Monitors & Alerts
- Set an ATSE action, Script, with the appropriate incremental AP. If the amount of time you wish to set does not exist as an incremental AP, create a new incremental AP with the desired time in minutes.



