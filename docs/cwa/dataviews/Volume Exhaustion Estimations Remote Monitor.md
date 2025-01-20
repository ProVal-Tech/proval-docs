---
id: '0db68132-d16e-4098-877c-8da269dfe587'
title: 'Volume Exhaustion Monitor'
title_meta: 'Volume Exhaustion Monitor'
keywords: ['volume', 'monitor', 'exhaustion', 'disk', 'space', 'collection']
description: 'This document provides an overview of the Volume Exhaustion Monitor, detailing how it displays volume information along with the estimated exhaustion date collected by the Volume Space Sampling remote monitor. It includes dependencies, column descriptions, and the data collected for effective monitoring.'
tags: ['disk', 'report', 'virtualization', 'windows']
draft: false
unlisted: false
---
## Summary

Displays volume information along with the estimated exhaustion date collected by the [Volume Space Sampling](<../monitors/EPM - Disk - Remote Monitor - Volume Space Sampling.md>) remote monitor.

## Dependencies

- [EPM - Disk - Script - Predictive Volume Exhaustion Monitor Creation](<../scripts/Predictive Volume Exhaustion Monitor Creation.md>) 
- [EPM - Disk - Remote Monitor - Volume Space Sampling](<../monitors/EPM - Disk - Remote Monitor - Volume Space Sampling.md>) 

## Columns

| Column                     | Description                                                                   |
|---------------------------|-------------------------------------------------------------------------------|
| Clientid                  | Clientid (Hidden)                                                             |
| Locationid                | Locationid (Hidden)                                                           |
| Computerid                | Computerid (Hidden)                                                           |
| Client                    | Client Name                                                                   |
| Location                  | Location Name                                                                 |
| Computer                  | Computer Name                                                                 |
| Operating System           | Operating System                                                               |
| Last Logged-In User       | Last Logged-In User                                                           |
| Form Factor               | Form Factor (Virtual Server/Physical Server/Hyper-V Host/Laptop/Desktop)     |
| DriveLetter               | The drive letter of the volume                                                |
| Size (GB)                | The size of the volume in GigaBytes                                           |
| Size Remaining (GB)      | The amount of space remaining in GigaBytes                                    |
| Estimated Exhaustion      | The date and time that this volume is estimated to run out of space          |
| Days Until Exhaustion     | Number of days left before the volume will run out of space                   |
| Data Collection Time      | The last time data was gathered for this volume                               |













