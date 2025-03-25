---
id: '7367ea61-b4bf-4449-b7dd-a68569dc7b75'
slug: /7367ea61-b4bf-4449-b7dd-a68569dc7b75
title: 'pvl_threatlocker-disable_audit'
title_meta: 'pvl_threatlocker-disable_audit'
keywords: ['threatlocker', 'learning', 'data', 'audit', 'logs']
description: 'This document outlines the structure of the data table used for the Threatlocker Set Learning Mode script, detailing the key fields such as computer ID, learning mode duration, timestamps, user information, and status logs.'
tags: ['database', 'report', 'security']
draft: false
unlisted: false
---

## Purpose

This table stores the data of the script [Script - Threatlocker - Set Learning Mode](<../scripts/Threatlocker - Set Learning Mode.md>). It includes the computer ID, learning mode duration, start time of the learning mode, end time of the learning mode, the reason for learning mode, the LT user who set the learning mode, the status of the learning mode (whether successfully set or failed), and the complete log.

## Dependencies

[Script - Threatlocker - Set Learning Mode](<../scripts/Threatlocker - Set Learning Mode.md>)

## Tables

### pvl_threatlocker_disable_audit

| Column                | Type     | Explanation                                                                                                         |
|-----------------------|----------|---------------------------------------------------------------------------------------------------------------------|
| computerid            | INT      | The computer ID of the agent                                                                                        |
| Username              | VARCHAR  | Stores the LT username who ran the script "[Script - Threatlocker - Set Learning Mode](<../scripts/Threatlocker - Set Learning Mode.md>)" to set Threatlocker learning mode. |
| StartTime             | DATETIME | Stores the start time from which the learning mode disabled started.                                              |
| EndTime               | DATETIME | Stores the end time when the Threatlocker protection will resume.                                                 |
| Reason                | VARCHAR  | Stores the reason why the learning mode is set. This needs to be provided by the LT Run user who executes the script "[Script - Threatlocker - Set Learning Mode](<../scripts/Threatlocker - Set Learning Mode.md>)" manually. |
| LearningModeDuration   | INT      | Stores the number of hours for which the Threatlocker learning mode is set.                                       |
| Status                | VARCHAR  | Stores either "Success" or "Failed" for the learning mode set result.                                            |
| LogRecord             | VARCHAR  | Stores the logs of script success or failure.                                                                      |


