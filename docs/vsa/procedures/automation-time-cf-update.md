---
id: 'd4f85104-753b-470e-a620-749cf24a32c2'
slug: /d4f85104-753b-470e-a620-749cf24a32c2
title: 'Automation Time CF Update'
title_meta: 'Automation Time CF Update'
keywords: ['cf', 'update', 'agent', 'procedure', 'logs', 'tracking']
description: 'This document outlines the main procedure used by all others to perform the CF update logic, including a detailed log of the agent procedure and its dependencies. It explains the steps taken to update the CF values and track automation time saved.'
tags: []
draft: false
unlisted: false
---

## Summary

This is the main procedure used by all others to perform the CF update logic.

## Example Agent Procedure Log

| Time                     | Procedure                                     | Status                                    | User                             |
|--------------------------|-----------------------------------------------|-------------------------------------------|----------------------------------|
| 2:57:46 pm 18-Oct-22     | Automation Time Saved CF Update                | Success THEN                              | [provaltech.com/dan.hicks](https://provaltech.com/dan.hicks) |
| 2:57:46 pm 18-Oct-22     | Automation Time Saved CF Update                | dev-win11-danvm has now saved 60 minutes this month and 60 overall. | [provaltech.com/dan.hicks](https://provaltech.com/dan.hicks) |
| 2:57:46 pm 18-Oct-22     | Execute Shell command - Get Results to Variable | Success THEN                              | [provaltech.com/dan.hicks](https://provaltech.com/dan.hicks) |
| 2:57:44 pm 18-Oct-22     | Execute Shell command - Get Results to Variable-0007 | Executing command in standard shell as user: set /a 0 + 60 > "c:/provaltech/commandresults-671888159.txt" 2>&1 | [provaltech.com/dan.hicks](https://provaltech.com/dan.hicks) |
| 2:57:43 pm 18-Oct-22     | Execute Shell command - Get Results to Variable | Success THEN                              | [provaltech.com/dan.hicks](https://provaltech.com/dan.hicks) |
| 2:57:41 pm 18-Oct-22     | Execute Shell command - Get Results to Variable-0007 | Executing command in standard shell as user: set /a 0 + 60 > "c:/provaltech/commandresults-883386547.txt" 2>&1 | [provaltech.com/dan.hicks](https://provaltech.com/dan.hicks) |
| 2:57:40 pm 18-Oct-22     | Automation Time Saved CF Update                | Adding 60 to the Automation Timer on agent dev-win11-danvm. | [provaltech.com/dan.hicks](https://provaltech.com/dan.hicks) |
| 2:57:40 pm 18-Oct-22     | Universal Variable - Read                      | Success THEN                              | [provaltech.com/dan.hicks](https://provaltech.com/dan.hicks) |
| 2:57:40 pm 18-Oct-22     | Universal Variable - Read-0002                 | Persisting variable data.                 | [provaltech.com/dan.hicks](https://provaltech.com/dan.hicks) |
| 2:57:33 pm 18-Oct-22     | Run Now - Automation Time Saved CF Update      | Admin provaltech.com/dan.hicks scheduled procedure Run Now - Automation Time Saved CF Update to run at Oct 18 2022 2:57 PM | [provaltech.com/dan.hicks](https://provaltech.com/dan.hicks) |
| 2:55:31 pm 18-Oct-22     | Automation Time Init                            | Success THEN                              | [provaltech.com/dan.hicks](https://provaltech.com/dan.hicks) |
| 2:55:24 pm 18-Oct-22     | Run Now - Automation Time Init                  | Admin provaltech.com/dan.hicks scheduled procedure Run Now - Automation Time Init to run at Oct 18 2022 2:55 PM | [provaltech.com/dan.hicks](https://provaltech.com/dan.hicks) |

## Dependencies

[VSA - VSA Configuration - Solution - Automation Time Saved Tracking](/docs/81ac366c-a635-4419-9a29-94a1fe7ddac0)

## Process

1. Get the current value of both CFs.
2. Get the current Universal Variables.
3. Add the universal value to the CF values.
4. Save the command results back to each CF.

## Output

- Agent Procedure Logs  
- Solution CFs