---
id: 'c793b2af-4369-4c31-8a56-db1a1728d12d'
title: 'Autofix Script for Offline Server Monitoring'
title_meta: 'Autofix Script for Offline Server Monitoring'
keywords: ['offline', 'server', 'monitoring', 'ticket', 'agent', 'remediation']
description: 'This document provides details about an updated autofix script designed for monitoring offline servers. The script checks the status of agents in both Automate and Control, attempts to restart offline agents, and can create tickets for offline servers and broken agents. It includes setup instructions, dependencies, and global variables required for optimal functionality.'
tags: ['agent', 'ticket', 'monitoring', 'offline', 'remediation', 'status']
draft: false
unlisted: false
---
## Summary

It is an updated version of [CWM - Automate - Script - CW Control RMM+ API - Offline Agent Remediation [Autofix]*](https://proval.itglue.com/DOC-5078775-8008294) script.

It will check whether the Agent is offline in both Automate and Control or not. If the agent is found to be online in Control, then it will attempt to restart the agent service via the Control portal.

Also, the script has the functionality to create a ticket for Offline Servers and as well as for Broken Agents. To enable the Ticket creation feature, a ticket category id should be set for the Global Variable "TicketCreationCategory."

It is suggested to set the ticket category in the Global Variables before setting this up with the Offline Server Monitoring solution.

**Intended Target:** An Autofix script for Offline Server Monitoring.

## Sample Run

![Sample Run](../../static/img/Feature-CW-Control-RMM+-API---Offline-Agent-Remediation-Autofix,Global/image_1.png)

## Dependencies

- [CWM - Control - Script - CW Control RMM+ API - Execute Command*](https://proval.itglue.com/DOC-5078775-8141008)
- [CWM - Control - Script - CW Control RMM+ API - Is Online [Properties]*](https://proval.itglue.com/DOC-5078775-8143436)
- [CWM - Automate - RMM+ Plugin Configuration](https://proval.itglue.com/DOC-5078775-9770217)

## Variables

| Name    | Description                                                 |
|---------|-------------------------------------------------------------|
| Online  | 1 or 0. Indicating the status of computer in the CW Control portal. |
| Command | Agent Restart Command for each Operating System.            |
| Subject | Subject of the ticket.                                     |
| Body    | Ticket Body.                                              |
| Tickid  | TicketId of Existing Ticket.                               |

## Global Variables

| **Name**                  | **Example** | **Required** | **Description**                             |
|---------------------------|-------------|--------------|---------------------------------------------|
| TicketCreationCategory     | 118         | True         | ID for the ticket category to be created in|

## System Properties

| Name                          | Example                         | Required | Description                                                                                   |
|-------------------------------|---------------------------------|----------|-----------------------------------------------------------------------------------------------|
| RMMPlus_AccessKey             | ajw8fh2p93ufn;o31ifu2091j23oif | True     | This is the key set up in the CW Control RMM+ Plugin so Automate can reach out to gain access to the API. |
| RMMPlus_Headers               | Origin: [site.site.com](http://site.site.com/) | True     | This is the URL (without http/https) for the CW Control server. This value needs to match the value in the RMM+ Plugin configuration in CW Control. |
| RMMPlus_StaleAgentThreshold   | 30                              | True     | The number of days to indicate what a "stale" agent is to the scripts. 30 is the default.   |
| RMMPlus_Timeout               | 1000                            | True     | The default timeout for commands runs via RMM+ through Automate. 1000 is the default.       |

## Script States

| Name          | Example                  | Description                                                                                  |
|---------------|--------------------------|----------------------------------------------------------------------------------------------|
| AgentStatus   | Broken | Verified Offline | This script state is used for the dataview: [CWM - Automate - Dataview - Agent - Agent Check-in Over 30 Days](https://proval.itglue.com/DOC-5078775-7998522) and will display the results of this autofix. |

## Process

For Failed Monitor Status:

This script will first run the [CWM - Control - Script - CW Control RMM+ API - Is Online [Properties]*](https://proval.itglue.com/DOC-5078775-8143436) script to determine if the agent is online or not in CW Control.

If the agent is offline in both systems, the script will create an Offline server ticket if ticketcreationcategory is defined otherwise will exit with a log message that the agent is offline in both systems. It will put this output into the AgentStatus script state.

If the agent is found online in CW Control but offline in CW Automate it will attempt to perform a restart of the Automate agent services on the target device.

It will issue the command via the [CWM - Control - Script - CW Control RMM+ API - Execute Command*](https://proval.itglue.com/DOC-5078775-8141008) script. A command depending on the OS Type will be issued.

After the command is issued to restart the services, the script will check for 15 minutes to see if the agent checks back in successfully in Automate. If the agent is found, the script will exit with success. It will also clear the AgentStatus script state from the target device.

If it does not find a match it will create a broken agent ticket if ticketcreationcategory is defined otherwise will output a log message stating that the agent is "broken" and needs to be reinstalled manually or reviewed by a technician. The script will update the AgentStatus script state to indicate the agent is "broken" and needs to be reinstalled. This data is visible in the [CWM - Automate - Dataview - Agent - Agent Check-in Over 30 Days](https://proval.itglue.com/DOC-5078775-7998522) Info dataview.

**Offline Server Ticket Description:**
- Ticket Subject: LT - Server Offline for %Clientname%/%ComputerName% (%Computerid%)
- Ticket Body: Server Offline Alert for %ComputerName% (%Computerid%) at %Clientname%. Last contact was @Result@

**Broken Agent Ticket Description:**
- Ticket Subject: LT - Broken Agent Detected for %Clientname%/%ComputerName% (%Computerid%)
- Ticket Body: Server %ComputerName% (%Computerid%) at %Clientname% is offline in Automate but Control is working fine. An autofix attempt to restart the Ltechagent service was made from Automate but it failed. Please check it out manually.

The script prefers adding a comment in a new/open existing ticket rather than creating a new ticket every time.

For Success Monitor Status:

It will clear the Agent status script state and will finish any open offline Server or Broken Agent ticket for the computer.

## Output

- Script Log
- Script State
- Ticket







