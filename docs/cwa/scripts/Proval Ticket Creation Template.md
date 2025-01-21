---
id: '9385b560-6005-4a7e-b7f3-de9a9baa5d8a'
title: 'New Ticket Creation Standard for Clients'
title_meta: 'New Ticket Creation Standard for Clients'
keywords: ['ticket', 'creation', 'standard', 'clients', 'script']
description: 'This document outlines a new standard for creating tickets for clients, including required global properties, implementation details, and example scripts. It aims to streamline ticket management and improve efficiency in handling client requests.'
tags: ['report', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

This document establishes a new standard for creating tickets for our clients.

## Implementation of this Script

### Required Globals

1. Set a global property named `TicketCreateSubject` and populate it with the desired ticket subject line for tickets created from your script.
2. Set a global property named `TicketCreationCategory` and populate it with the desired ticket creation category that should be assigned to any ticket created by this script.
3. Set a global property named `TicketFinishUserName` and populate it with the desired username to be used when creating, commenting on, or finishing a ticket created by this script.
4. Set a global property named `DoNotCommentOpenTicket` and populate it with a 1 or 0; setting this to 1 will disable commenting on open tickets, reducing noise in ticket management.

### In the Script Requirements

1. Set the following variable at the beginning of your script:
   - Set a variable named `TickID`. It must be set as follows: 
     ```
     SELECT IFNULL(MAX(Ticketid),0) FROM Tickets WHERE subject LIKE '@TicketCreateSubject@' AND status IN (1,2,3) AND computerid = '%Computerid%'
     ```
2. When you are in your resolved state (or success state), do the following:
   - Set a variable check:
     - If `TickID = 0`, then you should exit.
   - Set a variable named `TicketFinishBody`; it should contain the constant value you wish to set as the body of a ticket when you finish it.
   - Call a label named `ticketing`.
3. When you are in your problem state (failed state), do the following:
   - Set a variable named `TicketBody`; it should contain the constant value you wish to set as the body of a ticket when you are creating or commenting on a ticket.
     - You can technically modify and add to this body if you desire by doing something like `TicketBody = TicketBody + (add whatever you want here after)`.
   - Call a label named `ticketing`.
4. Set a label named `ticketing`:
   1. Run the Proval Ticket Creation Template.
   2. Return from the call to `ticketing`.

## Example Script

- The Proval Ticket Creation Template example can be referenced to see how to use this script.
- [SWM - Software Configuration - Script - Sentinel One Settings Verification](https://proval.itglue.com/DOC-5078775-12183318) uses this script.

## Variables

| Name    | Description                                                                 |
|---------|-----------------------------------------------------------------------------|
| VarLog  | A running variable to hold information on important steps in this script.  |

## Output

- Adds to a variable `VarLog` to be displayed in a parent ticket.
