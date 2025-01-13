---
id: 'cwa-agent-checking-wrong-location'
title: 'Agent Checking in with Wrong Location Autofix Script'
title_meta: 'Agent Checking in with Wrong Location Autofix Script'
keywords: ['autofix', 'monitor', 'location', 'computer', 'agent']
description: 'This document outlines the process and requirements for running the Agent Checking in with Wrong Location Autofix script. It details the necessary variables, dependencies, and the expected output when the script is executed as part of a monitor set in ProVal.'
tags: ['monitor', 'location', 'agent', 'script', 'automation']
draft: false
unlisted: false
---
## Summary

The script must be run as an Autofix script from [ProVal - Development - Agent Checking in with Wrong Location](https://proval.itglue.com/DOC-5078775-9421789) monitor set. It will set the Move the computer to New_Location detected in the monitor set.

## Sample Run

Since `@FieldName@` and `@Result@` are compulsory variables to make the script work. So, it would not work for manual executions.

## Dependencies

[ProVal - Development - Agent Checking in with Wrong Location](https://proval.itglue.com/DOC-5078775-9421789)

## Variables

| Name       | Description                                    |
|------------|------------------------------------------------|
| STATUS     | Success or Failed status of monitor set.      |
| RESULT     | Result or test value from the monitor set.    |
| FIELDNAME  | Field name or identity field from the monitor set. |

## Process

Monitor set will call the script. The script will move the computer to the new location as per the monitor set.

## Output

Removal of agents from the Monitor set's detection.



