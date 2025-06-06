---
id: 'ab3118dc-bc06-4443-9af0-78ccfb594844'
slug: /ab3118dc-bc06-4443-9af0-78ccfb594844
title: 'ScreenConnect - Offline Agent Remediation Autofix,RMM+'
title_meta: 'ScreenConnect - Offline Agent Remediation Autofix,RMM+'
keywords: ['automate', 'agents', 'rmm', 'ticket', 'service', 'monitoring', 'offline', 'control']
description: 'This document provides a detailed overview of a script that utilizes the RMM+ extension in CW Control to reinstall Automate Agents. It addresses scenarios where agents are online in Control but offline in Automate, and includes functionality for creating tickets for offline servers or broken agents. The script aims to enhance efficiency by automating the agent restart process and ticket creation for better monitoring and management.'
tags: []
draft: false
unlisted: false
---

## Summary

This script utilizes the RMM+ extension in CW Control to reinstall Automate Agents. If the agent is found to be online in Control but offline in Automate, it will attempt to restart the agent service via the Control portal.

This script also allows for the creation of tickets for offline servers or broken agents. To enable the ticket creation feature, a ticket category ID should be set for the global variable `TicketCreationCategory`.

**Time Saved by Automation:** 15 Minutes

## Sample Run

**Intended Target:** An Autofix script for Offline Server Monitoring.  
![Sample Run](../../../static/img/docs/ab3118dc-bc06-4443-9af0-78ccfb594844/image_1.webp)

## Dependencies

- [CWM - Control - Script - CW Control RMM+ API - Execute Command*](/docs/b713bbc8-a1d9-4e08-ac77-d02b634569f6)
- [CWM - Control - Script - CW Control RMM+ API - Is Online [Properties]*](/docs/18562eaa-d162-4362-98d3-4bbaa2922458)
- [CWM - Automate - RMM+ Plugin Configuration](/docs/f99ddaae-0cb3-4941-b2aa-dc93671dd246)

## Variables

| Name    | Description                                                     |
|---------|-----------------------------------------------------------------|
| Online  | 1 or 0. Indicates the status of the computer in the CW Control portal. |
| Command | Agent Restart Command for each Operating System.                |
| Subject | Subject of the ticket.                                         |
| Body    | Ticket Body.                                                  |
| Tickid  | Ticket ID of Existing Ticket.                                   |

## Global Variables

| **Name**                  | **Example** | **Required** | **Description**                                |
|---------------------------|-------------|--------------|------------------------------------------------|
| TicketCreationCategory     | 118         | True         | ID for the ticket category to be created in    |

## System Properties

| Name                          | Example                            | Required | Description                                                                                                                                       |
|-------------------------------|------------------------------------|----------|---------------------------------------------------------------------------------------------------------------------------------------------------|
| RMMPlus_AccessKey             | ajw8fh2p93ufn;o31ifu2091j23oif    | True     | This is the key set up in the CW Control RMM+ Plugin so Automate can reach out to gain access to the API.                                       |
| RMMPlus_Headers               | Origin: [site.site.com](http://site.site.com/) | True     | This is the URL (without http/https) for the CW Control server. This value needs to match the value in the RMM+ Plugin configuration in CW Control. |
| RMMPlus_StaleAgentThreshold   | 30                                 | True     | The number of days to indicate what a "stale" agent is to the scripts. 30 is the default.                                                       |
| RMMPlus_Timeout               | 1000                               | True     | The default timeout for commands run via RMM+ through Automate. 1000 is the default.                                                          |

## Script States

| Name        | Example                      | Description                                                                                                                                                             |
|-------------|------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| AgentStatus | Broken | Verified Offline | This script state is used for the dataview: [CWM - Automate - Dataview - Agent - Agent Check-in Over 30 Days](/docs/a326b230-2a55-42c6-a9bd-59ad1b1c3288) and will display the results of this autofix. |

## Process

### For Failed Monitor Status: 

This script will first run the [CWM - Control - Script - CW Control RMM+ API - Is Online [Properties]*](/docs/18562eaa-d162-4362-98d3-4bbaa2922458) script to determine if the agent is online or not in CW Control. If the agent is offline in both systems, the script will create an offline server ticket if `TicketCreationCategory` is defined; otherwise, it will exit with a log message that the agent is offline in both systems. It will put this output into the `AgentStatus` script state.

If the agent is found online in CW Control but offline in CW Automate, it will attempt to perform a restart of the Automate agent services on the target device. It will issue the command via the [CWM - Control - Script - CW Control RMM+ API - Execute Command*](/docs/b713bbc8-a1d9-4e08-ac77-d02b634569f6) script. A command depending on the OS type will be issued.

After the command is issued to restart the services, the script will check for 15 minutes to see if the agent checks back in successfully in Automate. If the agent is found, the script will exit with success. It will also clear the `AgentStatus` script state from the target device.

If it does not find a match, it will create a broken agent ticket if `TicketCreationCategory` is defined; otherwise, it will output a log message stating that the agent is "broken" and needs to be reinstalled manually or reviewed by a technician. The script will update the `AgentStatus` script state to indicate the agent is "broken" and needs to be reinstalled. This data is visible in the [CWM - Automate - Dataview - Agent - Agent Check-in Over 30 Days](/docs/a326b230-2a55-42c6-a9bd-59ad1b1c3288) Info dataview.

**Offline Server Ticket Description:**  
- **Ticket Subject:** LT - Server Offline for %Clientname%/%ComputerName% (%Computerid%)  
- **Ticket Body:** Server Offline Alert for %ComputerName% (%Computerid%) at %Clientname%. Last contact was @Result@  

**Broken Agent Ticket Description:**  
- **Ticket Subject:** LT - Broken Agent Detected for %Clientname%/%ComputerName% (%Computerid%)  
- **Ticket Body:** Server %ComputerName% (%Computerid%) at %Clientname% is offline in Automate, but Control is working fine. An autofix attempt to restart the Ltechagent service was made from Automate, but it failed. Please check it out manually.  

The script prefers adding a comment in a new or existing ticket rather than creating a new ticket every time.  

### For Success Monitor Status:

It will clear the `AgentStatus` script state and will finish any open offline server or broken agent ticket for the computer.

## Output

- Script Log
- Script State
- Ticket