---
id: '458b387d-e369-4ea5-bbc6-608e4ea7f993'
slug: /458b387d-e369-4ea5-bbc6-608e4ea7f993
title: 'Autofix - CWC RMM+ - Offline Agent Remediation'
title_meta: 'Autofix - CWC RMM+ - Offline Agent Remediation'
keywords: ['restart', 'agent', 'services', 'reinstall', 'monitor', 'ticketing', 'automation']
description: 'This document describes a script that restarts agent services or reinstalls the agent if the services fail to restart. It outlines the dependencies, global parameters, process flow, and expected output, making it essential for managing agents in ConnectWise RMM.'
tags: ['ticketing']
draft: false
unlisted: false
---

## Summary

This script will restart agent services or attempt to reinstall the agent if restarting the services fails.

Replaces:
- CW Control RMM+ API - Offline Agent Remediation (Agent Reinstall) [Autofix, Globals, Ticket]*
- CW Control RMM+ API - Offline Agent Remediation (Agent Restart) [Autofix, Globals, Ticket] - V2

## Sample Run

This script is an autofix to a monitor and should not be manually run.

## Dependencies

- Agent Install - Generate Location URL
- [CWM - Control - Script - CW Control RMM+ API - Is Online [Properties]*](/docs/18562eaa-d162-4362-98d3-4bbaa2922458)
- [CWM - Control - Script - CW Control RMM+ API - Execute Command*](/docs/b713bbc8-a1d9-4e08-ac77-d02b634569f6)
- [SWM - Software Install - Script - CW Control RMM+ API - LTPosh Redo-LTService*](/docs/567b8db7-a87a-45c1-a81a-b3178090fb52)
- [CWM - Automate - Monitor - No Checkin for More Than 30 Days*](/docs/4bc06cc4-3b78-452a-b602-063e57221234)
- LTPoSH Community Module ([https://bit.ly/LTPoSH](https://bit.ly/LTPoSH))
- RMM+ Plugin Configured in CW Control portal
- System Properties (See below)

#### Global Parameters

| Name                     | Example               | Required             | Description                                                                                                                                                                                                                      |
|--------------------------|-----------------------|----------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Re-Install               | 1 or anything else    | Defaulted to 1       | 1 enables the reinstallation of the agent if restarting the services fails; 0 will not attempt a reinstall if restarting services fail.                                                                                       |
| TicketingEnabled         | 1 or anything else    | Defaults to 1        | 1 enables the creation of tickets; anything else disables it.                                                                                                                                                                  |
| TicketCreationCategory    | 0 or anything else    | Defaults to 164      | This is used in the event of a success status to determine if a finish ticket is appropriate; 0 indicates no ticket finishing is required.                                                                                     |
| DuplicateCheck           | 0 or anything else    | Defaults to 0        | Anything but 0 enables a duplicate check; 0 will not check for duplicates.                                                                                                                                                    |

#### Script States

| Name         | Example                       | Description                                |
|--------------|-------------------------------|--------------------------------------------|
| AgentStatus  | Broken for computer 1234      | Reflects an agent status (online, offline, broken). |

## Process

1. If Status is False
   1. If DuplicateCheck is anything but 0
      1. Get SerialNumber
      2. Count the number of identical serial numbers in the database
      3. If Count does not equal 0
         1. Log message
         2. Select the most recent Computer ID for this computer
         3. Delete WHERE ComputerId is anything except the most recent Computer ID and BIOS version is the Serial Number and ClientId is the Client ID.
         4. If the last contact of this machine is within the last 15 minutes
            1. Log that the computer is online
            2. Exit the script
         5. Start initial check
   2. Start initial check
2. Initial check
   1. Run the API - is online script
   2. If the computer is not online
      1. Log agent offline
      2. Set the script state to Offline for computer ###
      3. Exit script
   3. Log agent is online
   4. Set the registry key `DisableRootAutoUpdate` = 0 at the path `HKLM://SOFTWARE//Policies//Microsoft//SystemCertificates//AuthRoot`.
   5. Push agent service restart command to ConnectWise control via RMM+
   6. While contact attempt is less than three
      1. Sleep 5 minutes
      2. Add 1 to attempt
      3. Check the connection state
      4. If the state of the agent is not online
         1. If it's not the 3rd attempt
            - Return to 5.1
         2. If Re-Install agent is on
            1. Log state
            2. Run LTPoSH redo LTService script
            3. While contact attempt is less than 3
               1. Sleep 5 minutes
               2. Add 1 to attempt
               3. Check the connection state
               4. If the agent is still offline
                  1. If it's not the 3rd attempt
                     - Return to 5.4.2.3
               5. Log that the agent is online
               6. Clear the script state
               7. Exit script
         3. Log broken agent
         4. Set state to broken for Computer ###
         5. If ticketing is not enabled
            1. Exit with error
         6. Create ticket
   7. Log the situation
   8. Set the state to Broken for Computer ###
   9. Reset the value of the registry key `DisableRootAutoUpdate`, if it was 1 before restarting the agent.
   10. If ticketing is not enabled
       1. Exit with error
   11. Set the ticket subject, body, and ID
   12. If the ticket ID is anything but 0
       1. Comment ticket to admin
       2. Exit script
   13. Create ticket
   14. Exit
3. Reset the value of the registry key `DisableRootAutoUpdate`, if it was 1 before restarting the agent.
4. Log that the Automate Agent is online
5. Clear the script state
6. Exit script

## Output

- Script log
- Script state

## Change Log

01-2023: Added functionality to handle registry key entry preventing repair.

