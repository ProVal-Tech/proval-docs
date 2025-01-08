---
id: 'vsa-automation-time-saved-cf-update'
title: 'Automation Time Saved CF Update'
title_meta: 'Automation Time Saved CF Update'
keywords: ['cf', 'update', 'agent', 'procedure', 'logs', 'tracking']
description: 'This document outlines the main procedure used by all others to perform the CF update logic, including a detailed log of the agent procedure and its dependencies. It explains the steps taken to update the CF values and track automation time saved.'
tags: ['automation', 'procedure', 'tracking', 'logs', 'configuration']
draft: false
unlisted: false
---
## Summary

This is the main Procedure used by all others to perform the CF update logic.

## Example Agent Procedure Log

| Time                     | Procedure                                     | Status                                    | User                             |
|--------------------------|-----------------------------------------------|-------------------------------------------|----------------------------------|
| 2:57:46 pm 18-Oct-22     | Automation Time Saved CF Update                | Success THEN                              | [provaltech.com/dan.hicks](https://provaltech.com/dan.hicks) |
| 2:57:46 pm 18-Oct-22     | Automation Time Saved CF Update                | dev-win11-danvm has now saved 60 Minutes This Month and 60 Overall. | [provaltech.com/dan.hicks](https://provaltech.com/dan.hicks) |
| 2:57:46 pm 18-Oct-22     | Execute Shell command - Get Results to Variable | Success THEN                              | [provaltech.com/dan.hicks](https://provaltech.com/dan.hicks) |
| 2:57:44 pm 18-Oct-22     | Execute Shell command - Get Results to Variable-0007 | Executing command in standard shell as user: set /a 0 + 60 >"c:\provaltech\commandresults-671888159.txt" 2>&1 | [provaltech.com/dan.hicks](https://provaltech.com/dan.hicks) |
| 2:57:43 pm 18-Oct-22     | Execute Shell command - Get Results to Variable | Success THEN                              | [provaltech.com/dan.hicks](https://provaltech.com/dan.hicks) |
| 2:57:41 pm 18-Oct-22     | Execute Shell command - Get Results to Variable-0007 | Executing command in standard shell as user: set /a 0 + 60 >"c:\provaltech\commandresults-883386547.txt" 2>&1 | [provaltech.com/dan.hicks](https://provaltech.com/dan.hicks) |
| 2:57:40 pm 18-Oct-22     | Automation Time Saved CF Update                | Adding 60 to the Automation Timer on agent dev-win11-danvm. | [provaltech.com/dan.hicks](https://provaltech.com/dan.hicks) |
| 2:57:40 pm 18-Oct-22     | Universal Variable - Read                      | Success THEN                              | [provaltech.com/dan.hicks](https://provaltech.com/dan.hicks) |
| 2:57:40 pm 18-Oct-22     | Universal Variable - Read-0002                 | Persisting variable data.                 | [provaltech.com/dan.hicks](https://provaltech.com/dan.hicks) |
| 2:57:33 pm 18-Oct-22     | Run Now - Automation Time Saved CF Update      | Admin provaltech.com/dan.hicks scheduled procedure Run Now - Automation Time Saved CF Update to run at Oct 18 2022 2:57PM | [provaltech.com/dan.hicks](https://provaltech.com/dan.hicks) |
| 2:55:31 pm 18-Oct-22     | Automation Time Init                            | Success THEN                              | [provaltech.com/dan.hicks](https://provaltech.com/dan.hicks) |
| 2:55:24 pm 18-Oct-22     | Run Now - Automation Time Init                  | Admin provaltech.com/dan.hicks scheduled procedure Run Now - Automation Time Init to run at Oct 18 2022 2:55PM | [provaltech.com/dan.hicks](https://provaltech.com/dan.hicks) |

## Dependencies

[VSA - VSA Configuration - Solution - Automation Time Saved Tracking](https://proval.itglue.com/DOC-5078775-11143659)

## Process

1. Gets the current value of both CFs
2. Gets the current Universal Variables
3. Adds the universal value to the CF values
4. Saves the cmdresults back to each CF

## Output

Agent Procedure Logs  
Solution CFs


