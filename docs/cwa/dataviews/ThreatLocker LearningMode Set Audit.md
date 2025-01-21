---
id: '33f561fb-e60a-4240-a4e7-03542a45b347'
title: 'ThreatLocker LearningMode Set Audit'
title_meta: 'ThreatLocker LearningMode Set Audit'
keywords: ['threatlocker', 'dataview', 'learning', 'mode', 'script', 'audit']
description: 'This document provides a comprehensive overview of the Threatlocker Learning Mode Dataview, detailing its dependencies, columns, and the information it captures regarding the learning mode settings applied through the specified script.'
tags: ['database', 'report', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

This dataview stores the result of the Threatlocker learning mode setting done via the script [Script - Threatlocker - Set Learning Mode](<../scripts/Threatlocker - Set Learning Mode.md>).

## Dependencies

- [Script - Threatlocker - Set Learning Mode](<../scripts/Threatlocker - Set Learning Mode.md>)
- [Custom Table - pvl_threatlocker-disable_audit](<../tables/pvl_threatlocker-disable_audit.md>)

## Columns

| Column                           | Description                                                                                               |
|----------------------------------|-----------------------------------------------------------------------------------------------------------|
| Client                           | Client name of the agent                                                                                 |
| Location                         | Location name of the agent                                                                                 |
| Computer                         | Name of the agent                                                                                          |
| Operating System                 | This displays the OS name of the agent                                                                     |
| Last Contact                     | It shows the agent's last contact with the Automate control center                                         |
| LT User Name                     | This stores the LT user name who scheduled the learning mode by executing the script [Script - Threatlocker - Set Learning Mode](<../scripts/Threatlocker - Set Learning Mode.md>) |
| Learning Mode Reason             | This stores the learning mode reason set by the LT user.                                                  |
| Learning Mode Start Time         | This shows the learning mode start date and time                                                          |
| Learning Mode End Time           | This shows the learning mode end date and time                                                            |
| Learning Mode Duration (Hours)   | This shows the learning mode duration in hours                                                            |
| Learning Mode Set Status         | This stores the learning mode status, indicating whether it was successfully set or failed.               |
| Learning Mode Log Record         | This stores the learning mode logs of success or failure.                                                 |



