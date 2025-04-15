---
id: 'c793b2af-4369-4c31-8a56-db1a1728d12d'
slug: /c793b2af-4369-4c31-8a56-db1a1728d12d
title: 'Feature CW Control RMM+ API - Offline Agent Remediation Autofix,Global'
title_meta: 'Feature CW Control RMM+ API - Offline Agent Remediation Autofix,Global'
keywords: ['offline', 'server', 'monitoring', 'ticket', 'agent', 'remediation']
description: 'This document provides details about an updated autofix script designed for monitoring offline servers. The script checks the status of agents in both Automate and Control, attempts to restart offline agents, and can create tickets for offline servers and broken agents. It includes setup instructions, dependencies, and global variables required for optimal functionality.'
tags: []
draft: false
unlisted: true
---

## Summary

This is an updated version of [CWM - Automate - Script - CW Control RMM+ API - Offline Agent Remediation [Autofix]](/docs/ab3118dc-bc06-4443-9af0-78ccfb594844) script.

The script checks whether the agent is offline in both Automate and Control. If the agent is found to be online in Control, it will attempt to restart the agent service via the Control portal.

Additionally, the script has the functionality to create a ticket for offline servers as well as for broken agents. To enable the ticket creation feature, a ticket category ID should be set for the global variable **TicketCreationCategory**.

It is recommended to set the ticket category in the global variables before integrating this with the Offline Server Monitoring solution.

**Intended Target:** An autofix script for offline server monitoring.

## Sample Run

![Sample Run](../../static/img/Feature-CW-Control-RMM+-API---Offline-Agent-Remediation-Autofix,Global/image_1.png)

## Dependencies

- [CWM - Control - Script - CW Control RMM+ API - Execute Command](/docs/b713bbc8-a1d9-4e08-ac77-d02b634569f6)
- [CWM - Control - Script - CW Control RMM+ API - Is Online [Properties]](/docs/18562eaa-d162-4362-98d3-4bbaa2922458)
- [CWM - Automate - RMM+ Plugin Configuration](/docs/f99ddaae-0cb3-4941-b2aa-dc93671dd246)

## Variables

| Name    | Description                                                 |
|---------|-------------------------------------------------------------|
| Online  | 1 or 0. Indicates the status of the computer in the CW Control portal. |
| Command | Agent restart command for each operating system.            |
| Subject | Subject of the ticket.                                     |
| Body    | Ticket body.                                              |
| Tickid  | Ticket ID of the existing ticket.                           |

## Global Variables

| **Name**                  | **Example** | **Required** | **Description**                             |
|---------------------------|-------------|--------------|---------------------------------------------|
| TicketCreationCategory     | 118         | True         | ID for the ticket category to be created in|

## System Properties

| Name                          | Example                         | Required | Description                                                                                   |
|-------------------------------|---------------------------------|----------|-----------------------------------------------------------------------------------------------|
| RMMPlus_AccessKey             | ajw8fh2p93ufn;o31ifu2091j23oif | True     | This is the key set up in the CW Control RMM+ Plugin so Automate can access the API.        |
| RMMPlus_Headers               | Origin: [site.site.com](http://site.site.com/) | True     | This is the URL (without http/https) for the CW Control server. This value must match the value in the RMM+ Plugin configuration in CW Control. |
| RMMPlus_StaleAgentThreshold   | 30                              | True     | The number of days to indicate what a "stale" agent is to the scripts. 30 is the default.   |
| RMMPlus_Timeout               | 1000                            | True     | The default timeout for commands run via RMM+ through Automate. 1000 is the default.       |

## Script States

| Name          | Example                  | Description                                                                                  |
|---------------|--------------------------|----------------------------------------------------------------------------------------------|
| AgentStatus   | Broken | Verified Offline | This script state is used for the dataview: [CWM - Automate - Dataview - Agent - Agent Check-in Over 30 Days](/docs/a326b230-2a55-42c6-a9bd-59ad1b1c3288) and will display the results of this autofix. |

## Process

### For Failed Monitor Status:

This script will first run the [CWM - Control - Script - CW Control RMM+ API - Is Online [Properties]](/docs/18562eaa-d162-4362-98d3-4bbaa2922458) script to determine if the agent is online in CW Control.

If the agent is offline in both systems, the script will create an offline server ticket if **TicketCreationCategory** is defined; otherwise, it will exit with a log message stating that the agent is offline in both systems. This output will be recorded in the **AgentStatus** script state.

If the agent is found online in CW Control but offline in CW Automate, it will attempt to restart the Automate agent services on the target device.

The command will be issued via the [CWM - Control - Script - CW Control RMM+ API - Execute Command](/docs/b713bbc8-a1d9-4e08-ac77-d02b634569f6) script. A command based on the OS type will be issued.

After issuing the command to restart the services, the script will check for 15 minutes to see if the agent checks back in successfully in Automate. If the agent is found, the script will exit with success and clear the **AgentStatus** script state from the target device.

If it does not find a match, it will create a broken agent ticket if **TicketCreationCategory** is defined; otherwise, it will output a log message stating that the agent is "broken" and needs to be reinstalled manually or reviewed by a technician. The script will update the **AgentStatus** script state to indicate that the agent is "broken" and needs to be reinstalled. This data is visible in the [CWM - Automate - Dataview - Agent - Agent Check-in Over 30 Days](/docs/a326b230-2a55-42c6-a9bd-59ad1b1c3288) info dataview.

**Offline Server Ticket Description:**
- Ticket Subject: LT - Server Offline for %Clientname%/%ComputerName% (%Computerid%)
- Ticket Body: Server Offline Alert for %ComputerName% (%Computerid%) at %Clientname%. Last contact was @Result@

**Broken Agent Ticket Description:**
- Ticket Subject: LT - Broken Agent Detected for %Clientname%/%ComputerName% (%Computerid%)
- Ticket Body: Server %ComputerName% (%Computerid%) at %Clientname% is offline in Automate, but Control is working fine. An autofix attempt to restart the Ltechagent service was made from Automate, but it failed. Please check it out manually.

The script prefers adding a comment in a new or existing ticket rather than creating a new ticket every time.

### For Success Monitor Status:

The script will clear the **AgentStatus** script state and finish any open offline server or broken agent ticket for the computer.

## Output

- Script Log
- Script State
- Ticket

