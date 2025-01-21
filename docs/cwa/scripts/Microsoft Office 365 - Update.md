---
id: 'f63488bf-e843-494e-89a0-d464f4a6c1ad'
title: 'Automate Wrapper for Agnostic Update-Office Script'
title_meta: 'Automate Wrapper for Agnostic Update-Office Script'
keywords: ['automate', 'update', 'office', 'script', 'wrapper']
description: 'This document provides an overview of an Automate Wrapper designed to execute the Agnostic Update-Office script. It includes sample runs, dependencies, variable descriptions, global parameters, output details, and ticketing information.'
tags: ['software', 'ticketing', 'update']
draft: false
unlisted: false
---

## Summary

This script is an Automate Wrapper to run the Agnostic Update-Office script.

## Sample Run

![Sample Run](../../../static/img/Microsoft-Office-365---Update/image_1.png)

## Dependencies

- [SWM - Software Configuration - Agnostic - Update-Office](<../../powershell/Update-Office.md>)

## Variables

Document the various variables in the script. Delete any section that is not relevant to your script.

| Name              | Description                                                                                     |
|-------------------|-------------------------------------------------------------------------------------------------|
| WorkingDirectory   | Standard Template Variable.                                                                     |
| PS1Log            | Standard Template Variable.                                                                     |
| PS1DataLog        | Standard Template Variable.                                                                     |
| PS1ErrorLog       | Standard Template Variable.                                                                     |
| LogContent        | Standard Template Variable.                                                                     |
| QueriedLog        | Necessary to determine if a warning is present in the log, since the agnostic script sets a warning; selects the last two lines of the log file. |
| AlertType         | This sets the alert type, which can be a warning or error.                                      |
| ErrorMsg          | The associated error message for the specific script section.                                   |
| DataLogContent    | Standard Template Variable.                                                                     |
| TicketSubject     | The subject of the ticket.                                                                      |
| TicketBody        | The body of the ticket.                                                                         |

#### Global Parameters

| Name               | Example         | Required | Description                                                    |
|--------------------|----------------|----------|----------------------------------------------------------------|
| ProjectName        | Update-Office  | True     | The name of the agnostic script minus the .ps1                |
| TicketOnError      | 0 or 1        | True     | Toggles on/off ticketing on error.                             |
| TicketOnWarning     | 0 or 1        | True     | Toggles on/off ticketing on warning.                           |

## Output

- Script log

## Ticketing

![Ticketing](../../../static/img/Microsoft-Office-365---Update/image_2.png)

