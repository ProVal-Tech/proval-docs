---
id: 'cwa-client-agent-edfs-duo-installation'
title: 'Client and Agent Level EDFs for DUO Installation'
title_meta: 'Client and Agent Level EDFs for DUO Installation'
keywords: ['duo', 'installation', 'edf', 'monitor', 'agent', 'client']
description: 'This document outlines the use of Client and Agent Level EDFs along with an internal monitor to ensure that DUO software is installed for all agents within a client. It includes sample runs, dependencies, global parameters, and the process for installation.'
tags: ['installation', 'monitor', 'client', 'agent', 'ticketing', 'software']
draft: false
unlisted: false
---
## Summary

Uses Client and Agent Level EDFs and an Internal monitor to ensure DUO software is installed for all agents within a client.

## Sample Run

![Sample Run](5078775/docs/8311963/images/11586949)

## Dependencies

- Client EDF  
![Client EDF](5078775/docs/8311963/images/11586938)

- Agent EDF for exclusion (Will prevent monitor from picking up agent / forcing DUO install)  
![Agent EDF](5078775/docs/8311963/images/11586939)

## Variables

Document the various variables in the script. Delete any section that is not relevant to your script.

#### Global Parameters

| Name                     | Example | Required | Description                                                      |
|--------------------------|---------|----------|------------------------------------------------------------------|
| AUTOPUSH                 | #0      | True     | Duo Install Parameter - review DUO documentation                 |
| FAILOPEN                 | #1      | True     | Duo Install Parameter - review DUO documentation                 |
| RDPONLY                  | #0      | True     | Duo Install Parameter - review DUO documentation                 |
| Ticketing                | 1       | True     | 1 = Ticket on Failure                                            |
| TicketCreationCategory    | 123     | False    | If set will override default ticket category if Ticketing = 1   |

## Process

Sets all variables from EDFs and Script Globals. Will exit if required variables are not set. Downloads DUO MSI File from [https://dl.duosecurity.com](https://dl.duosecurity.com). Installs according to DUO documentation, confirms software is installed. Will create ticket on failure if global is set.

## Output

- Script Log
- Ticket - Optional


