---
id: 'vsa-remove-scheduled-task-restart-agent'
title: 'Remove Scheduled Task for Restarting VSA Agent'
title_meta: 'Remove Scheduled Task for Restarting VSA Agent'
keywords: ['vsa', 'agent', 'scheduled', 'task', 'restart', 'remove']
description: 'This document provides a detailed guide on removing the scheduled task that attempts to restart the VSA Agent every 15 minutes. This helps prevent VSA agents from going offline without notification, ensuring better management and performance of your VSA environment.'
tags: ['agent', 'configuration', 'performance', 'security', 'windows']
draft: false
unlisted: false
---
## Summary

Removes the Scheduled task that attempts to restart the VSA Agent every 15 minutes to prevent VSA agents from going offline without notification.

## Sample Run

| Time                   | Action                                             | Result                                                                                                 | User                       |
|------------------------|---------------------------------------------------|--------------------------------------------------------------------------------------------------------|----------------------------|
| 13:56:56 28-Apr-22     | Scheduled Task for Restart Agent - Remove         | Success THEN                                                                                           | provaltech.com/dan.hicks   |
| 13:56:48 28-Apr-22     | Run Now - Scheduled Task for Restart Agent - Remove | Admin provaltech.com/dan.hicks scheduled procedure Run Now - Scheduled Task for Restart Agent - Remove to run at Apr 28 2022 1:56PM | provaltech.com/dan.hicks   |

## Dependencies

- [VSA - Agent - Agent Procedure - Scheduled Task for Agent Restart - Create](https://proval.itglue.com/DOC-5078775-9791995)
- [Restart VSA Agent on Schedule](https://proval.itglue.com/DOC-5078775-9792122)

## Process

Deletes the scheduled task created by [VSA - Agent - Agent Procedure - Scheduled Task for Agent Restart - Create](https://proval.itglue.com/DOC-5078775-9791995).

## Output

The location and method by which this script returns data.

- Agent Procedure Log

## Export Attachment

Attach the content XML VSA Export to this document.

