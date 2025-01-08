---
id: 'cwa-get-dcdiagreport-wrapper'
title: 'Automate Wrapper for Get-DCDiagReport'
title_meta: 'Automate Wrapper for Get-DCDiagReport'
keywords: ['automate', 'wrapper', 'ticket', 'diagnostic', 'report']
description: 'This document describes an automate wrapper for the agnostic Get-DCDiagReport.ps1 script. It details how the script creates a ticket when the PowerShell script fails or when the diagnostic report indicates any failure. It includes sample runs, dependencies, variables, and parameters for both global and user-defined settings.'
tags: ['ticket', 'diagnostic', 'script', 'failure', 'report']
draft: false
unlisted: false
---
## Summary

This is an automate wrapper for the agnostic Get-DCDiagReport.ps1. The script will create a ticket for either the PowerShell script fails on the computer for some reason or the diagnostic report returns any failure.

## Sample Run

Run the script without setting the `Excluded_TestNames` parameter to perform available tests during the diagnostic.  
![Sample Run 1](5078775/docs/12664605/images/19760715)

A set of specific test names can be passed to the `Excluded_TestNames` parameters to exclude from the diagnostic.  
![Sample Run 2](5078775/docs/12664605/images/19760792)

## Dependencies

- [EPM - Data Collection - Agnostic - Get-DCDiagReport.ps1](https://proval.itglue.com/DOC-5078775-12528541)

## Variables

Document the various variables in the script. Delete any section that is not relevant to your script.

| Name                  | Description                                               |
|-----------------------|-----------------------------------------------------------|
| PsExecuteCommand      | The command to send to PowerShell to execute the agnostic script. |
| PowerShellResult      | The result of the dcdiag report.                          |
| TicketFinishBody      | The body of a finished ticket                             |
| TicketBody            | The body of a created ticket or comment.                 |
| TickID                | The id of any currently open ticket for this issue.      |

#### Global Parameters

| Name                     | Example                           | Required | Description                                           |
|--------------------------|-----------------------------------|----------|-------------------------------------------------------|
| ProjectName              | Get-DCDiagReport                 | True     | The name of the agnostic solution                     |
| ExpectedSuccessReturn     | TestName                         | True     | Validates the results of the PowerShell execution.    |
| TicketCreateSubject      | DC Diag Results for %ComputerName%| True     | The subject of any ticket created from this script.   |
| TicketCreationCategory    | 1                                 | False    | The ticket creation category for any created ticket from this script. |
| DoNotCommentOpenTicket   | 0                                 | False    | Toggles on commenting on open tickets for subsequent runs. |

#### User Parameters

| Name                  | Example                                         | Required | Description                                               |
|-----------------------|-------------------------------------------------|----------|-----------------------------------------------------------|
| Excluded_TestNames    | DNS,Advertising,FrsEvent,VerifyReplicas,Services| False    | Names of the tests to exclude from diagnostic. Names should be separated by a comma (do not use spaces). Allowed test names are as follows: 'Advertising', 'CutoffServers', 'FrsEvent', 'DFSREvent', 'SysVolCheck', 'FrsSysVol', 'KccEvent', 'MachineAccount', 'NCSecDesc', 'NetLogons', 'ObjectsReplicated', 'Replications', 'RidManager', 'Services', 'SystemLog', 'Topology', 'VerifyReferences', 'VerifyReplicas', 'DNS', 'CheckSDRefDom', 'CrossRefValidation', 'LocatorCheck', 'FsmoCheck', 'Intersite'. |

## Output

- Script log
- Ticket

## Ticketing

![Ticketing](5078775/docs/12664605/images/19609440)  
**Script will not close/finish any ticket.**

