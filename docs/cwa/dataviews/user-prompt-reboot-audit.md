---
id: '4ad38519-386a-4645-8cea-a498e0cd0e25'
slug: /4ad38519-386a-4645-8cea-a498e0cd0e25
title: 'User Prompt - Reboot Audit'
title_meta: 'User Prompt - Reboot Audit'
keywords: ['reboot', 'tracking', 'user', 'prompt', 'dependencies', 'computer', 'system', 'property']
description: 'This document provides a summary of the User Prompt for Reboot solution, detailing its dependencies, the columns tracked in the dataview, and the specific attributes related to computer reboot prompts. It covers critical information such as the number of prompts sent, last reboot time, and system properties that govern the behavior of the reboot prompts.'
tags: ['performance', 'security', 'setup']
draft: false
unlisted: false
---

## Summary

The dataview tracks the functioning of the [User Prompt for Reboot](/docs/32d2254e-c2a4-4f2d-a029-b74f6d3c8b1a) solution.

## Dependencies

- [EPM - Windows Configuration - Script - User Prompt - Reboot](/docs/1789b867-61db-436d-ac0b-07d5aac3f4b8)
- [EPM - Windows Configuration - Script - Reset Reboot Pending EDFs](/docs/e188d9ff-44e7-40e5-a255-d7d2bf0e2f7c)

## Columns

| Column                                | Description                                                                                                           |
|---------------------------------------|-----------------------------------------------------------------------------------------------------------------------|
| Clientid                              | Client ID (Hidden)                                                                                                   |
| Locationid                            | Location ID (Hidden)                                                                                                 |
| Computerid                            | Computer ID (Hidden)                                                                                                 |
| Client                                | Client Name                                                                                                         |
| Location                              | Location Name                                                                                                       |
| Computer                              | Computer Name                                                                                                       |
| Operating System                      | Operating System                                                                                                    |
| Form Factor                           | Form Factor (Laptop/Desktop/Virtual Machine)                                                                        |
| Last Contact                          | Last Contact With RMM                                                                                               |
| Last Logged-In User                   | Name of the last logged-in user (Hidden)                                                                            |
| Active User                           | Name of the currently active user (Hidden)                                                                          |
| Last Reboot Time                     | Last Reboot Time of the computer                                                                                   |
| Idle Time (Seconds)                  | Idle Time of the computer in seconds (Hidden)                                                                      |
| Pending Reboot EDF                    | Is the computer-level `pending` reboot EDF flagged? (0/1)                                                          |
| Times Prompted                        | Number of times prompts are sent                                                                                     |
| Last Prompt Date                      | Last time the prompt was sent                                                                                        |
| Global Maximum Prompts                | Maximum number of prompts to be sent as set in the `proval_RebootPromptCount` system property                       |
| Global Duration Between Prompts (Hours)| Duration set in the `proval_RebootPromptDurBetweenPrompt` system property for two consecutive prompts.              |
| Global Uptime Days to Send Prompts    | Uptime in days set in the `proval_RebootPromptUptimeDays` system property to automatically send the prompt. (0 --> Disabled) |
| Global Prompt for Reboot Pending      | Is prompting enabled for computers with the reboot flag enabled? Set in the `proval_RebootPromptWhenPendingReboot` system property. |
| Login Bug                             | True for machines where Automate has attempted to fix the False Login Error for more than 5 times and the issue is still not resolved. |