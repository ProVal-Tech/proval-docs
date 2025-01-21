---
id: '70f5868c-7006-4393-afed-156fbae86ab5'
title: 'Remote Monitor - Emulate Send Fail After Success'
title_meta: 'Remote Monitor - Emulate Send Fail After Success'
keywords: ['remote', 'monitor', 'ticket', 'management', 'autofix', 'status']
description: 'This document describes an autofix solution for remote monitors that enables them to mimic the behavior of internal monitors by allowing automatic ticket closure based on monitor status changes. It includes details on dependencies, variables, and the processing logic of the script.'
tags: []
draft: false
unlisted: false
---

## Summary

Remote monitors do not have the ability to perform "Send fail after success" style actions like internal monitors do. This autofix will help a remote monitor behave more like an internal monitor. This "autofix" should be implemented in scenarios where a client would like to use "Default - Create Automate Ticket" but allow for the ticket to automatically close if the remote monitor changes statuses. Note that this is a function script and cannot be run manually. This script is also an offline machine script, meaning it can run even if the agent is offline.

**Time Saved by Automation:** 5 Minutes

## Sample Run

This script should not be run manually and will fail if it is forced to run manually.

## Dependencies

This script requires a remote monitor to function properly.

## Variables

- `@Ticketid@` - This variable is either populated with previous ticket ID information or will gather data from the script state to be used in this script. It is the ticket ID the script is using to take action.
- `@agentid@` - This is the database ID number of the monitor used to track which monitor generated the ticket.

#### Script States

| Name      | Example  | Description                                                                                          |
|-----------|----------|------------------------------------------------------------------------------------------------------|
| AgentID   | 123456   | This is the database ID number of the monitor used to track which monitor generated the ticket.      |
| TicketID  | 123456   | This variable is either populated with previous ticket ID information or will gather data from the script state to be used in this script. It is the ticket ID the script is using to take action. |

## Process

First, the script will determine if the monitor issuing the script is reporting "success" or "failure." If the script evaluates the monitor as "Failed," it will proceed to the Then section. If the monitor is "successful," the script will go to the Else section.

**Then section**  
The script will first check if there is an open ticket related to the situation detected by the monitor. If the ticket exists, the script will jump to the existing ticket section and update the ticket with a comment. This comment should include the latest result from the monitor. If the ticket number does not exist, the script will generate a ticket with the available data from the remote monitor.

**Else section**  
If the script determines the monitor is in a "success" state, it will go through the Else section. In the Else section, the script will first check if the script state ticket number exists. If a ticket exists, the script will close the ticket, indicating that the monitor has returned to "Success," so the ticket was safe to close. If there was no ticket, the script will simply exit.

## Output

**Script log messages**

The script will create a ticket if necessary.



