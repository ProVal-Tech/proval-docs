---
id: 'cwa-setupdiag-execution'
title: 'SetupDiag Execution and Reporting'
title_meta: 'SetupDiag Execution and Reporting'
keywords: ['setupdiag', 'execution', 'reporting', 'email', 'results']
description: 'This document provides a guide on how to download and execute SetupDiag.exe, capturing the results in a variable and optionally sending an email report. It includes sample runs, dependencies, user parameters, and output details for effective usage.'
tags: ['setup', 'email', 'windows', 'report']
draft: false
unlisted: false
---
## Summary

Download (if necessary) and execute [SetupDiag.exe](https://learn.microsoft.com/en-us/windows/deployment/upgrade/setupdiag), returning the results to a variable and optionally e-mailing them.

## Sample Run

![Sample Run](5078775/docs/12028459/images/16869637)

## Dependencies

- [Invoke-SetupDiag](https://proval.itglue.com/DOC-5078775-12024896)

## Variables

| Name              | Description                               |
|-------------------|-------------------------------------------|
| SetupDiagResult   | Contains the return from the run of SetupDiag. |

#### User Parameters

| Name          | Example                                   | Required | Description                                   |
|---------------|-------------------------------------------|----------|-----------------------------------------------|
| EmailAddress  | [myemail@provaltech.com](mailto:myemail@provaltech.com) | False    | Send an e-mail report to a specified address. |

## Output

Outputs to a variable (@SetupDiagResult@) that can be referenced in parent scripts.

See [Invoke-SetupDiag](https://proval.itglue.com/DOC-5078775-12024896) for additional output information.


