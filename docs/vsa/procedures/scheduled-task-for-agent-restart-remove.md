---
id: 'b4f78d3c-4c41-46eb-9fee-94b9f7d3caab'
slug: /b4f78d3c-4c41-46eb-9fee-94b9f7d3caab
title: 'Scheduled Task for Agent Restart - Remove'
title_meta: 'Scheduled Task for Agent Restart - Remove'
keywords: ['vsa', 'agent', 'scheduled', 'task', 'restart', 'remove']
description: 'This document provides a detailed guide on removing the scheduled task that attempts to restart the VSA Agent every 15 minutes. This helps prevent VSA agents from going offline without notification, ensuring better management and performance of your VSA environment.'
tags: ['performance', 'security', 'windows']
draft: false
unlisted: false
---

## Summary

This document outlines the steps to remove the scheduled task that attempts to restart the VSA Agent every 15 minutes, preventing VSA agents from going offline without notification.

## Sample Run

| Time                   | Action                                             | Result                                                                                                 | User                       |
|------------------------|---------------------------------------------------|--------------------------------------------------------------------------------------------------------|----------------------------|
| 13:56:56 28-Apr-22     | Scheduled Task for Restart Agent - Remove         | Success THEN                                                                                           | provaltech.com/dan.hicks   |
| 13:56:48 28-Apr-22     | Run Now - Scheduled Task for Restart Agent - Remove | Admin provaltech.com/dan.hicks scheduled procedure Run Now - Scheduled Task for Restart Agent - Remove to run at Apr 28 2022 1:56 PM | provaltech.com/dan.hicks   |

## Dependencies

- [VSA - Agent - Agent Procedure - Scheduled Task for Agent Restart - Create](/docs/7eb2b58e-9f5e-4732-8457-6518060f0cc3)
- [Restart VSA Agent on Schedule](/docs/e028ad3f-fecc-4701-83b8-0537db4e8494)

## Process

This process deletes the scheduled task created by [VSA - Agent - Agent Procedure - Scheduled Task for Agent Restart - Create](/docs/7eb2b58e-9f5e-4732-8457-6518060f0cc3).

## Output

The location and method by which this script returns data.

- Agent Procedure Log

## Export Attachment

Attach the content XML VSA Export to this document.


