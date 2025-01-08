---
id: 'cwa-autofix-stuck-commands'
title: 'Autofix for Stuck Commands in ProVal Monitor'
title_meta: 'Autofix for Stuck Commands in ProVal Monitor'
keywords: ['autofix', 'stuck', 'commands', 'monitor', 'database']
description: 'This document describes a script designed to automatically fix issues with stuck commands in the ProVal monitor. It identifies and deletes commands that are stuck in an executing state, ensuring smoother operation of the monitoring system.'
tags: ['monitor', 'database', 'execution', 'automation', 'internal']
draft: false
unlisted: false
---
## Summary

This script should be used as an Autofix for our internal monitor 'ProVal - Production - Automate - Machines With Stuck Commands [G]'. The script will delete the Stuck commands from the target machine. It will check for the command status id '2' (status 2 indicates the commands that are stuck in executing state) on the target machine and will remove them from the database.

## Sample Run

The script is a function script, that can't run manually.

## Dependencies

[CWA - Automate - Monitor - Machines With Stuck Commands](https://proval.itglue.com/DOC-5078775-12419536)

## Variables

Document the various variables in the script. Delete any section that is not relevant to your script.

| Name  | Description                                                                                     |
|-------|-------------------------------------------------------------------------------------------------|
| Check | This variable stores the count of commands detected in executing state                          |

## Process

This script will execute with the monitor and will delete all the executable commands from the database of the machine.

## Output

- Script log

