---
id: '7eb2b58e-9f5e-4732-8457-6518060f0cc3'
title: 'Scheduled Task for VSA Agent Restart'
title_meta: 'Scheduled Task for VSA Agent Restart'
keywords: ['scheduled', 'task', 'vsa', 'agent', 'restart']
description: 'This document outlines the process of creating a scheduled task that attempts to restart the VSA Agent every 15 minutes to ensure that VSA agents remain online and notify users of any issues. It includes sample run logs, dependencies, and the process involved in setting up the task.'
tags: ['configuration', 'performance', 'windows', 'notification', 'software']
draft: false
unlisted: false
---
## Summary

Creates a Scheduled task that attempts to restart the VSA Agent every 15 minutes to prevent VSA agents from going offline without notification.

## Sample Run

| Time                   | Action                                        | Status                                             | User                        |
|------------------------|-----------------------------------------------|---------------------------------------------------|-----------------------------|
| 13:49:09 28-Apr-22    | Scheduled Task for Agent Restart - Create     | Success THEN                                      | provaltech.com/dan.hicks    |
| 13:49:08 28-Apr-22    | Scheduled Task for Agent Restart - Create-0001| Batch file created successfully. Scheduling task. | provaltech.com/dan.hicks    |
| 13:49:08 28-Apr-22    | Write text to file                            | Success THEN                                      | provaltech.com/dan.hicks    |
| 13:48:59 28-Apr-22    | Run Now - Scheduled Task for Agent Restart - Create | Admin provaltech.com/dan.hicks scheduled procedure Run Now - Scheduled Task for Agent Restart - Create to run at Apr 28 2022 1:48PM | provaltech.com/dan.hick     |

## Dependencies

This should be a list of ITGlue documents listed in the Related Items sidebar on which this script depends.

- [VSA - Agent - Agent Procedure - Scheduled Task for Agent Restart - Remove](https://proval.itglue.com/DOC-5078775-9792117)
- [Restart VSA Agent on Schedule](https://proval.itglue.com/DOC-5078775-9792122) (Solution)

## Process

Creates a batch file on the endpoint that restarts the agent service (which needs to be configured per environment based on Service Name) and runs the schtask command to schedule this check every 15 minutes, as system user.

Note: `#serviceName#` MUST be manually filled for each client deployment.

## Output

The location and method by which this script returns data.

- Agent Procedure Log

## Export Attachment

Attach the content XML VSA Export to this document.






