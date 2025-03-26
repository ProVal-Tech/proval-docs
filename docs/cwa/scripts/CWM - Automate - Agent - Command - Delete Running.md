---
id: 'c9ae6663-8100-457c-abb8-d210f9fd8f87'
slug: /c9ae6663-8100-457c-abb8-d210f9fd8f87
title: 'CWM - Automate - Agent - Command - Delete Running'
title_meta: 'CWM - Automate - Agent - Command - Delete Running'
keywords: ['autofix', 'stuck', 'commands', 'monitor', 'database']
description: 'This document describes a script designed to automatically fix issues with stuck commands in the ProVal monitor. It identifies and deletes commands that are stuck in an executing state, ensuring smoother operation of the monitoring system.'
tags: ['database']
draft: false
unlisted: false
---

## Summary

This script should be used as an autofix for our internal monitor, 'ProVal - Production - Automate - Machines With Stuck Commands [G]'. The script will delete the stuck commands from the target machine. It will check for the command status ID '2' (status 2 indicates the commands that are stuck in an executing state) on the target machine and will remove them from the database.

## Sample Run

The script is a function script that cannot run manually.

## Dependencies

[CWA - Automate - Monitor - Machines With Stuck Commands](/docs/5630a369-2912-485b-a5f9-0c25b28eb432)

## Variables

Document the various variables in the script. Delete any section that is not relevant to your script.

| Name  | Description                                                                                     |
|-------|-------------------------------------------------------------------------------------------------|
| Check | This variable stores the count of commands detected in an executing state                      |

## Process

This script will execute with the monitor and will delete all the executable commands from the database of the machine.

## Output

- Script log



