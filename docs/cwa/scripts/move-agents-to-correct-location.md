---
id: 'f01cab64-00bf-4f94-92ea-280c87cf06ca'
slug: /f01cab64-00bf-4f94-92ea-280c87cf06ca
title: 'Move Agents to Correct Location'
title_meta: 'Move Agents to Correct Location'
keywords: ['autofix', 'monitor', 'location', 'computer', 'agent']
description: 'This document outlines the process and requirements for running the Agent Checking in with Wrong Location Autofix script. It details the necessary variables, dependencies, and the expected output when the script is executed as part of a monitor set in ProVal.'
tags: []
draft: false
unlisted: false
---

## Summary

The script must be run as an Autofix script from the [ProVal - Development - Agent Checking in with Wrong Location](/docs/b8313365-d95d-41bd-b2fc-e3e77f4fdcf7) monitor set. It will move the computer to the New_Location detected in the monitor set.

## Sample Run

Since `@FieldName@` and `@Result@` are compulsory variables for the script to function, it will not work for manual executions.

## Dependencies

[ProVal - Development - Agent Checking in with Wrong Location](/docs/b8313365-d95d-41bd-b2fc-e3e77f4fdcf7)

## Variables

| Name      | Description                                     |
|-----------|-------------------------------------------------|
| STATUS    | Success or Failed status of the monitor set.   |
| RESULT    | Result or test value from the monitor set.     |
| FIELDNAME | Field name or identity field from the monitor set. |

## Process

The monitor set will call the script, which will move the computer to the new location as specified in the monitor set.

## Output

Removal of agents from the monitor set's detection.

