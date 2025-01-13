---
id: 'cwa-restart-agent-services'
title: 'Restart Agent Services Script'
title_meta: 'Restart Agent Services Script for ConnectWise RMM'
keywords: ['restart', 'agent', 'services', 'reinstall', 'monitor', 'ticketing', 'automation']
description: 'This document describes a script that restarts agent services or reinstalls the agent if the services fail to restart. It outlines the dependencies, global parameters, process flow, and expected output, making it essential for managing agents in ConnectWise RMM.'
tags: ['agent', 'monitor', 'ticketing', 'rmm', 'service', 'configuration']
draft: false
unlisted: false
---
## Summary

This script will restart agent services, or restart and attempt a re-install of the agent if restarting the services fail.

Replaces:
- CW Control RMM+ API - Offline Agent Remediation (Agent Reinstall) [Autofix, Globals, Ticket]*
- CW Control RMM+ API - Offline Agent Remediation (Agent Restart) [Autofix, Globals, Ticket] - V2

## Sample Run

This script is an autofix to a monitor and should not be manually run.

## Dependencies

- Agent Install - Generate Location URL
- [CWM - Control - Script - CW Control RMM+ API - Is Online [Properties]*](https://proval.itglue.com/DOC-5078775-8143436)
- [CWM - Control - Script - CW Control RMM+ API - Execute Command*](https://proval.itglue.com/DOC-5078775-8141008)
- [SWM - Software Install - Script - CW Control RMM+ API - LTPosh Redo-LTService*](https://proval.itglue.com/DOC-5078775-7761438)
- [CWM - Automate - Monitor - No Checkin for More Than 30 Days*](https://proval.itglue.com/DOC-5078775-8041387)
- LTPoSH Community Module ([https://bit.ly/LTPoSH](https://bit.ly/LTPoSH))
- RMM+ Plugin Configured in CW Control portal
- System Properties (See below)

#### Global Parameters

| Name                     | Example               | Required             | Description                                                                                                                                                                                                                      |
|--------------------------|-----------------------|----------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Re-Install               | 1 or anything else    | Defaulted to 1       | 1 enables the Re-installation of the agent if restarting the services fails, 0 will not attempt a reinstall if restarting services fail.                                                                                       |
| TicketingEnabled         | 1 or anything else    | Defaults to 1        | 1 enables the creation of tickets, anything else.                                                                                                                                                                             |
| TicketCreationCategory    | 0 or anything else    | Defaults to 164      | This is used in the event of a Success status and determining if a finish ticket is appropriate, 0 indicates no Ticket finishing is required.                                                                                   |
| DuplicateCheck           | 0 or anything else    | Defaults to 0        | anything but 0 enables a duplicate check, 0 will not check for duplicates.                                                                                                                                                    |

#### Script States

| Name         | Example                       | Description                                |
|--------------|-------------------------------|--------------------------------------------|
| AgentStatus  | Broken for computer 1234      | Reflects an agent status. (online, offline, broken). |

## Process

1. If Status is False
   1. If DuplicateCheck is anything but 0
      1. Get SerialNumber
      2. Count the amount of identical serial numbers in the database
      3. If Count does not equal 0
         1. Log message
         2. Select the most recent Computer ID for this computer
         3. Delete WHERE Computerid is anything except the most recent computer id and biosver is the serial Number and Clientid is the Client id.
         4. if the last contact of this machine is within the last 15 minutes
            1. Log that the computer is online
            2. Exit the script
         5. Start initial check
   2. start initial check
2. Initial check
   1. Run the api - is online script
   2. if the computer is not online
      1. Log agent offline
      2. Set the script state to Offline for computer ###
      3. Exit script
   3. Log agent is online
   4. Sets the registry key `DisableRootAutoUpdate` = 0 at the path `HKLM://SOFTWARE//Policies//Microsoft//SystemCertificates//AuthRoot`.
   5. Push agent service restart command to ConnectWise control via rmm+
   6. While contact attempt is less than three
      1. Sleep 5 minutes
      2. Add 1 to attempt
      3. Check the connection state
      4. if the state of the agent is not online
         1. If it's not the 3rd attempt
            - Return to 5.1
         2. If Re-Install agent is on
            1. Log state
            2. run ltposh redo ltservice script
            3. While contact attempt is less than 3
               1. Sleep 5 minutes
               2. Add 1 to attempt
               3. Check the connection state
               4. If the agent is offline still
                  1. If it's not the 3rd attempt
                     - return to 5.4.2.3
               5. Log the agent is online
               6. Clear the script state
               7. exit script
         3. Log broken agent
         4. Set state to broken for Computer ###
         5. if ticketing is not enabled
            1. Exit with error
         6. Create ticket
   7. Log the situation
   8. Set the state to Broken for Computer ###
   9. Reset the value of the registry key `DisableRootAutoUpdate`, if it was one before restarting the agent.
   10. if ticketing is not enabled
       1. exit with error
   11. Set the ticket subject, body, and id
   12. if the ticket id is anything but 0
       1. Comment ticket to admin
       2. exit script
   13. Create ticket
   14. exit
3. Reset the value of the registry key `DisableRootAutoUpdate`, if it was one before restarting the agent.
4. Log The Automate Agent is online
5. Clear the script State
6. Exit script

## Output

- Script log
- Script state

## Change Log

01-2023: Added functionality to handle registry key entry preventing repair.




