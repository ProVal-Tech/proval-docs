---
id: '20f500f3-77da-48a8-aeb2-4661f1865421'
title: 'Audit Active Directory Group Changes'
title_meta: 'Audit Active Directory Group Changes'
keywords: ['active-directory', 'audit', 'changes', 'ticketing', 'log']
description: 'This document describes a script that audits a specified Active Directory group for changes since the last execution. It optionally creates a ticket if changes are detected, facilitating better tracking and management of AD group modifications.'
tags: ['active-directory', 'ticketing']
draft: false
unlisted: false
---
## Summary

Audits the target AD group for changes since the last time the script was run. Sends an optional ticket after finding changes in the target group.

Time Saved by Automation: 5 Minutes

## Sample Run

![Sample Run](../../../static/img/AD---Audit-Group-Members/image_1.png)

## Dependencies

[Compare-ADGroupMembers](<../../powershell/Compare-ADGroupMembers.md>)

## Variables

### Global Parameters

| Name                     | Example | Required          | Description                                                                                      |
|--------------------------|---------|-------------------|--------------------------------------------------------------------------------------------------|
| TicketCreationCategory    | 178     | False (Default 0) | Sets the ticket category for ticketing. If set to 0, ticketing will be skipped.                |

### User Parameters

| Name          | Example        | Required | Description                                                |
|---------------|----------------|----------|------------------------------------------------------------|
| ADGroupName   | Domain Admins  | True     | The name of the AD group to check for changes against.     |

## Process

See [Compare-ADGroupMembers](<../../powershell/Compare-ADGroupMembers.md>) for details on the underlying script logic.

If [Compare-ADGroupMembers](<../../powershell/Compare-ADGroupMembers.md>) returns `1` in the `@datalogcontent@` variable, then a ticket will be created if the `@TicketCreationCategory@` variable is set.

## Output

- Script Log
- Log Files
- Ticketing













