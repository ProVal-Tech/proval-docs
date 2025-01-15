---
id: '4ad38519-386a-4645-8cea-a498e0cd0e25'
title: 'User Prompt for Reboot Tracking'
title_meta: 'User Prompt for Reboot Tracking - Overview and Dependencies'
keywords: ['reboot', 'tracking', 'user', 'prompt', 'dependencies', 'computer', 'system', 'property']
description: 'This document provides a summary of the User Prompt for Reboot solution, detailing its dependencies, the columns tracked in the dataview, and the specific attributes related to computer reboot prompts. It covers critical information such as the number of prompts sent, last reboot time, and system properties that govern the behavior of the reboot prompts.'
tags: ['client', 'location', 'computer', 'operating-system', 'performance', 'security', 'setup']
draft: false
unlisted: false
---
## Summary

The dataview tracks the working of the [User Prompt for Reboot](https://proval.itglue.com/DOC-5078775-9088563) solution.

## Dependencies

- [EPM - Windows Configuration - Script - User Prompt - Reboot](https://proval.itglue.com/DOC-5078775-9076644)
- [EPM - Windows Configuration - Script - Reset Reboot Pending EDFs](https://proval.itglue.com/DOC-5078775-9077421)

## Columns

| Column                                | Description                                                                                                           |
|---------------------------------------|-----------------------------------------------------------------------------------------------------------------------|
| Clientid                              | Clientid (Hidden)                                                                                                   |
| Locationid                            | Locationid (Hidden)                                                                                                 |
| Computerid                            | Computerid (Hidden)                                                                                                 |
| Client                                | Client Name                                                                                                         |
| Location                              | Location Name                                                                                                       |
| Computer                              | Computer Name                                                                                                       |
| Operating System                      | Operating System                                                                                                    |
| Form Factor                           | Form Factor (Laptop/Desktop/Virtual Machine)                                                                        |
| Last Contact                          | Last Contact With RMM                                                                                               |
| Last LoggedIn User                   | Name of the last logged-in user (Hidden)                                                                            |
| Active User                           | Name of the currently active user (Hidden)                                                                          |
| Last Reboot Time                     | Last Reboot Time of the computer                                                                                   |
| Idle Time (Seconds)                  | Idle Time of the computer in seconds (Hidden)                                                                      |
| Pending Reboot EDF                    | Is the computer-level `pending` reboot EDF flagged? (0/1)                                                          |
| Times Prompted                        | Number of times prompts are sent                                                                                     |
| Last Prompt Date                      | Last time the prompt was sent                                                                                        |
| Global Maximum Prompts                | Maximum number of prompts to be sent as set in the `proval_RebootPromptCount` system property                       |
| Global Duration Between Prompts (Hours)| Duration set in the `proval_RebootPromptDurBetweenPrompt` system property for two consecutive prompts.              |
| Global Uptime Days to Send Prompts    | Uptime in days set in the `proval_RebootPromptUptimeDays` system property to automatically send the prompt. (0 --> Disabled) |
| Global Prompt for Reboot Pending      | Is prompting enabled for the computers with the reboot flag enabled? Set in the `proval_RebootPromptWhenPendingReboot` system property. |
| Login Bug                             | True for machines where Automate has attempted to fix the False Login Error for more than 05 times and issue is still not resolved. |







