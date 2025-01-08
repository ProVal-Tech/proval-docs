---
id: 'cwa-retire-duplicate-agents'
title: 'Retire Duplicate Agents in ConnectWise Automate'
title_meta: 'Retire Duplicate Agents in ConnectWise Automate'
keywords: ['duplicate', 'agents', 'automate', 'retire', 'email', 'ticketing']
description: 'This document provides a comprehensive guide on retiring duplicate agents in the ConnectWise Automate environment. It explains how the script identifies duplicate agents based on their serial number, name, and client affiliation, and outlines the process for keeping only the most recent agent. Additionally, it covers the configuration options for email notifications and ticket generation for retired agents.'
tags: ['automation', 'email', 'ticketing', 'configuration', 'windows']
draft: false
unlisted: false
---
## Summary

The script retires duplicate agents from the Automate environment. The duplicate agent is identified based on its serial number, name, and Client affiliation. Agents are removed based on their last contact with the Automate server, keeping only the agent with the most recent date. The script also emails/tickets the list of duplicate agents that have been retired.

This is a client script and will work only for the Physical Machines. Virtual Machines are excluded to prevent any accidental deletion. It can be set up to email the list of duplicate agents that have been retired by the script to any email address or a ticket can also be generated.

## Update Notice: 27-December-2024

Introduced the following system properties:
- `_sysDuplicateAgent_Contact_Threshold`
- `_sysDuplicateAgent_Retire_VM`

Run the script with the `Set_Environment` parameter to import the newly introduced properties.

![Update Notice Image](5078775/docs/15646427/images/27927154)

Remove the `Automate Agent - Duplicate Serial Number - Retire` script if it exists.

## Sample Run

Set the parameter `Set_environment` for the first execution.

![Sample Run Image](5078775/docs/15646427/images/22854169)

Specify the email address where you would like to receive the output of the result.

![Email Specification Image](5078775/docs/15646427/images/22854157)

## Schedule

It is suggested to run the script once per script.

![Schedule Image](5078775/docs/15646427/images/27927142)

## System Property

| Name                                          | Required | Example                          | Description                                                                                                                                                                                                                 |
|-----------------------------------------------|----------|----------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `_sysDuplicateAgentEmailAddress`              | False    | [xyz@something.com](mailto:xyz@something.com) | Universal email address where you would like to receive the list of duplicate agents that have been retired by the script.                                                                                                 |
| `_sysDuplicateAgentTicketingEnable`           | False    | 1                                | Fill it as '1' if you would like to receive the Ticket with a list of Duplicate agents else leave it blank or '0'.                                                                                                        |
| `_sysDuplicateAgentTicketCategory`            | False    | 234                              | Mention the ticket creation category to direct the tickets to the right board in Manage. **Note:** If no ticket creation category is mentioned in this property, the script will use the universal ticket creation category mentioned in the global System property `MonitorTicketCategory`. |
| `_sysDuplicateAgent_NoDuplicate_Ticketing`    | False    | 0                                | Set its value to '1' to receive tickets/emails when there are no Duplicate agents. Its default value is '0' which means by default, the script will not generate tickets/emails in case no duplicate agents are found.      |
| `_sysDuplicateAgent_Ticketing_DefaultClientid`| False    | 1                                | Client ID of the client under which tickets should be generated. Its default value is '1', meaning tickets will be generated under the client whose client ID is '1' in the environment.                                  |
| `_sysDuplicateAgent_Contact_Threshold`        | False    | 15                               | Define the threshold for the number of days after which duplicate agents should be retired. If this system property is not specified, duplicate agents with a last contact time of more than an hour will be automatically removed. |
| `_sysDuplicateAgent_Retire_VM`                | False    | 1                                | Fill it as '1' to retire duplicate virtual machines as well (duplicates on the basis of serial number). If nothing is mentioned in this property, the script will not retire duplicate virtual machines.                     |

## User Parameters

| Name             | Required                  | Example                          | Description                                                                                                                                                                                                                 |
|------------------|---------------------------|----------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `Email_Address`   | False                     | [xyz@something.com](mailto:xyz@something.com) | Fill it with an email address where you would like to receive the list of Duplicate agents retired by the script. **Note:** If nothing is mentioned in this user parameter, the script will check the system property `_sysDuplicateAgentEmailAddress`. If any email address is mentioned there, it will send an email to it. If not, it will not send any email to anyone. |
| `Set_Environment` | True (For First execution) | 1                                | Set it to '1' to create the system properties if they're not already made in the environment. It has to be set to '1' for the first execution.                                                                              |

## Output

- Script Logs
- Ticketing
- Email

## Ticketing

Tickets will only be generated if the system property `_sysDuplicateAgentTicketingEnable` is set to '1'.

**Subject:** `List of Retired Duplicate Agents Based on Serial Numbers`

**Body:** `"%ScriptName% ran on the machines and has retired below duplicate agents:<br>@Machines@"`

In case there is no duplicate serial number:

`No duplicate Machines identified based on Serial Number.`

