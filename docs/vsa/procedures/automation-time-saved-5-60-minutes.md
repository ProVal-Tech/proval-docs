---
id: '6d0aca76-28b6-4a21-9617-75ffd5868977'
slug: /6d0aca76-28b6-4a21-9617-75ffd5868977
title: 'Automation Time Saved (5-60) Minutes'
title_meta: 'Automation Time Saved (5-60) Minutes'
keywords: ['incremental', 'cf', 'update', 'script', 'automation', 'tracking']
description: 'This document outlines the use of Agent Procedures (APs) with incremental time values that call the main CF Update Script, providing ease of scheduling within other content. It includes an example agent procedure log and details on dependencies and process flow.'
tags: []
draft: false
unlisted: false
---

## Summary

APs with incremental time values that call the main CF Update Script are designed for ease of scheduling within other content.

## Example Agent Procedure Log

| Time                      | Action                                          | Status                                   | Link                           |
|---------------------------|-------------------------------------------------|------------------------------------------|--------------------------------|
| 2:51:04 PM 18-Oct-22     | Automation Time Saved - 1 Hour                 | Success THEN                            | [provaltech.com/dan.hicks](https://provaltech.com/dan.hicks) |
| 2:51:04 PM 18-Oct-22     | Automation Time Saved CF Update                 | Success THEN                            | [provaltech.com/dan.hicks](https://provaltech.com/dan.hicks) |
| 2:51:04 PM 18-Oct-22     | Automation Time Saved CF Update                 | dev-win11-danvm has now saved 65 this month and 65 overall. | [provaltech.com/dan.hicks](https://provaltech.com/dan.hicks) |
| 2:51:04 PM 18-Oct-22     | Execute Shell command - Get Results to Variable | Success THEN                            | [provaltech.com/dan.hicks](https://provaltech.com/dan.hicks) |
| 2:51:01 PM 18-Oct-22     | Execute Shell command - Get Results to Variable-0007 | Executing command in standard shell as user: set /a 5 + 60 > "c://provaltech//commandresults-723191113.txt" 2>&1 | [provaltech.com/dan.hicks](https://provaltech.com/dan.hicks) |
| 2:51:01 PM 18-Oct-22     | Execute Shell command - Get Results to Variable | Success THEN                            | [provaltech.com/dan.hicks](https://provaltech.com/dan.hicks) |
| 2:50:58 PM 18-Oct-22     | Execute Shell command - Get Results to Variable-0007 | Executing command in standard shell as user: set /a 5 + 60 > "c://provaltech//commandresults-461135504.txt" 2>&1 | [provaltech.com/dan.hicks](https://provaltech.com/dan.hicks) |
| 2:50:57 PM 18-Oct-22     | Automation Time Saved CF Update                 | Adding 60 to the Automation Timer on agent dev-win11-danvm. | [provaltech.com/dan.hicks](https://provaltech.com/dan.hicks) |
| 2:50:57 PM 18-Oct-22     | Universal Variable - Read                       | Success THEN                            | [provaltech.com/dan.hicks](https://provaltech.com/dan.hicks) |
| 2:50:57 PM 18-Oct-22     | Universal Variable - Read-0002                  | Persisting variable data.               | [provaltech.com/dan.hicks](https://provaltech.com/dan.hicks) |
| 2:50:57 PM 18-Oct-22     | Universal Variable - Create                     | Success THEN                            | [provaltech.com/dan.hicks](https://provaltech.com/dan.hicks) |
| 2:50:57 PM 18-Oct-22     | Universal Variable - Create-0003                | Universal Variable 3 set. Access this as '#global:universal3#' once you select the 'Universal Variable - Read' step in another procedure. | [provaltech.com/dan.hicks](https://provaltech.com/dan.hicks) |
| 2:50:57 PM 18-Oct-22     | Universal Variable - Create-0002                | Universal Variable 2 set. Access this as '#global:universal2#' once you select the 'Universal Variable - Read' step in another procedure. | [provaltech.com/dan.hicks](https://provaltech.com/dan.hicks) |
| 2:50:57 PM 18-Oct-22     | Universal Variable - Create-0001                | Universal Variable 1 set. Access this as '#global:universal1#' once you select the 'Universal Variable - Read' step in another procedure. | [provaltech.com/dan.hicks](https://provaltech.com/dan.hicks) |
| 2:50:50 PM 18-Oct-22     | Run Now - Automation Time Saved - 1 Hour        | Admin provaltech.com/dan.hicks scheduled procedure Run Now - Automation Time Saved - 1 Hour to run at Oct 18 2022 2:50 PM | [provaltech.com/dan.hicks](https://provaltech.com/dan.hicks) |

## Dependencies

[VSA - VSA Configuration - Solution - Automation Time Saved Tracking](/docs/81ac366c-a635-4419-9a29-94a1fe7ddac0)

## Process

Uses Global Variables to set incremental values to the Automation Tracking CF.

## Output

N/A