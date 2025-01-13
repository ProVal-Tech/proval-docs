---
id: 'cwa-reinstall-automate-agent'
title: 'Reinstall Automate Agent Script'
title_meta: 'Reinstall Automate Agent Script for Agent ID Discrepancies'
keywords: ['automate', 'agent', 'ticket', 'reinstall', 'discrepancy']
description: 'This document provides a detailed overview of a script designed to reinstall the Automate agent for machines that share the same agent ID. It outlines the process of creating tickets for failed installations and highlights specific dependencies and variables necessary for successful execution. The script is intended for environments where Mac Signup Matching is not enabled.'
tags: ['ticket', 'agent', 'monitoring', 'status', 'installation', 'configuration']
draft: false
unlisted: false
---
## Summary

This script will reinstall the Automate agent for the machines which are checking into Automate with the same agentid as another agent. It will create a ticket if it fails to re-install the agents with a new agentid.

Also, it will work reliably only for the customers where Mac Signup Matching is not enabled.

![Image](..\..\..\static\img\Agent-ID-assignment-discrepancy-Autofix\image_1.png)

Sample Ticket:  
![Image](..\..\..\static\img\Agent-ID-assignment-discrepancy-Autofix\image_2.png)

## How To Use

- Import the script
- Create an alert template say ~Autofix - Agent ID assignment discrepancy.
- Assign that alert template to the [CWM - Automate - Internal Monitor - ProVal - Development - Agent ID assignment discrepancy](https://proval.itglue.com/DOC-5078775-10829954) monitor set.
- Import the monitor set, if it's already not imported.

## Dependencies

- [CWM - Automate - Internal Monitor - ProVal - Development - Agent ID assignment discrepancy](https://proval.itglue.com/DOC-5078775-10829954)
- [CWM - Control - Script - CW Control RMM+ API - Is Online [Properties]*](https://proval.itglue.com/DOC-5078775-8143436)
- [CWM - Control - Script - CW Control RMM+ API - Execute Command*](https://proval.itglue.com/DOC-5078775-8141008)
- [SWM - Software Install - Script - CW Control RMM+ API - LTPosh Redo-LTService*](https://proval.itglue.com/DOC-5078775-7761438)
- LTPoSH Community Module ([https://bit.ly/LTPoSH](https://bit.ly/LTPoSH))
- RMM+ Plugin Configured in CW Control portal

## Variables

| Name              | Description                                                    |
|-------------------|---------------------------------------------------------------|
| Online            | Will indicate if the agent is online in CW Control           |
| Command           | The command to issue to the endpoint to perform the reinstall |
| Cid               | Current Computerid                                           |
| CName             | Current Name of the Computer                                 |
| CLocalAddress     | Local IP Address                                            |
| CRouterAddress    | Router/Public Address                                        |
| AnotherAgent      | Distinct Names of the agents checking into the same computerid |
| NewAgentID        | New Agent ID of the machine after successful reinstall       |
| Comment           | Comment to add to the ticket                                 |
| Subject           | Ticket Subject                                              |
| Ticid             | Ticket id                                                  |

## Process

Step 1: Determine whether computer is offline or online in Control.  
Step 2: Attempt to reinstall agent.  
Step 3: Determine whether installation was a success or not, by verifying the presence of new computerid for the same machine.  
Step 4: Create/comment ticket for failure and to finish any open ticket for success.

## Output

- Ticket
- Script logs


