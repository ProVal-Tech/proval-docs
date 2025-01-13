---
id: 'cwa-automate-wrapper-update-office'
title: 'Automate Wrapper for Agnostic Update-Office Script'
title_meta: 'Automate Wrapper for Agnostic Update-Office Script'
keywords: ['automate', 'update', 'office', 'script', 'wrapper']
description: 'This document describes an Automate Wrapper designed to execute the Agnostic Update-Office script, detailing its dependencies, variables, user parameters, global parameters, and ticketing features. It provides a comprehensive guide for users to effectively utilize the script for updating Microsoft Office applications.'
tags: ['update', 'ticketing', 'script', 'log', 'error', 'warning']
draft: false
unlisted: false
---
## Summary

This script is an Automate Wrapper to run the Agnostic Update-Office script.

## Sample Run

![Sample Run](..\..\..\static\img\SWM---Software-Configuration---Script---Microsoft-Office-365---Update\image_1.png)  
Set force to 1 to force Microsoft office applications to close during the update process.

## Dependencies

- [SWM - Software Configuration - Agnostic - Update-Office](https://proval.itglue.com/DOC-5078775-12083647)

## Variables

Document the various variables in the script. Delete any section that is not relevant to your script.

| Name              | Description                                                                                      |
|-------------------|--------------------------------------------------------------------------------------------------|
| WorkingDirectory   | Standard Template Variable.                                                                      |
| PS1Log            | Standard Template Variable.                                                                      |
| PS!DataLog        | Standard Template Variable.                                                                      |
| PS1ErrorLog       | Standard Template Variable.                                                                      |
| LogContent        | Standard Template Variable.                                                                      |
| QueriedLog        | Necessary to determine if a warning is present in the log, since the agnostic script sets a warning, Selects The last two lines of the log file. |
| AlertType         | This sets the alert type found can be a warning or error.                                       |
| ErrorMsg          | The associated error message for the specific script section.                                   |
| DataLogContent    | Standard Template Variable.                                                                       |
| TicketSubject     | The subject of the ticket.                                                                        |
| TicketBody        | The body of the ticket.                                                                           |

## User Parameters

| Name   | Example | Description                                                                                   |
|--------|---------|-----------------------------------------------------------------------------------------------|
| Force  | 1 or 0  | 1 will force the shutdown of office applications during the update process. O does not force the shutdown of office applications during the process. |

### Global Parameters

| Name                | Example         | Required | Description                                                  |
|---------------------|-----------------|----------|--------------------------------------------------------------|
| ProjectName         | Update-Office   | True     | The name of the agnostic script minus the .ps1              |
| TicketOnError       | 0 or 1          | True     | Toggles on / off ticketing on error.                        |
| TicketOnWarning     | 0 or 1          | True     | Toggles on / off ticketing on warning.                      |

## Output

- Script log

## Ticketing

![Ticketing](..\..\..\static\img\SWM---Software-Configuration---Script---Microsoft-Office-365---Update\image_2.png)


