---
id: '6042c7c0-dd54-4eda-8889-ef2ff879e5a2'
slug: /6042c7c0-dd54-4eda-8889-ef2ff879e5a2
title: 'Get SetupDiag Report'
title_meta: 'Get SetupDiag Report'
keywords: ['setupdiag', 'execution', 'reporting', 'email', 'results']
description: 'This document provides a guide on how to download and execute SetupDiag.exe, capturing the results in a variable and optionally sending an email report. It includes sample runs, dependencies, user parameters, and output details for effective usage.'
tags: ['email', 'report', 'setup', 'windows']
draft: false
unlisted: false
---

## Summary

Download (if necessary) and execute [SetupDiag.exe](https://learn.microsoft.com/en-us/windows/deployment/upgrade/setupdiag), returning the results to a variable and optionally emailing them.

## Sample Run

![Sample Run](../../../static/img/docs/6042c7c0-dd54-4eda-8889-ef2ff879e5a2/image_1.webp)

## Dependencies

- [Invoke-SetupDiag](/docs/43e03fcc-e736-4d19-b231-76403f71c4e2)

## Variables

| Name              | Description                               |
|-------------------|-------------------------------------------|
| SetupDiagResult   | Contains the return from the run of SetupDiag. |

### User Parameters

| Name          | Example                                   | Required | Description                                   |
|---------------|-------------------------------------------|----------|-----------------------------------------------|
| EmailAddress  | [myemail@provaltech.com](mailto:myemail@provaltech.com) | False    | Send an email report to a specified address. |

## Output

Outputs to a variable (`SetupDiagResult`) that can be referenced in parent scripts.

See [Invoke-SetupDiag](/docs/43e03fcc-e736-4d19-b231-76403f71c4e2) for additional output information.