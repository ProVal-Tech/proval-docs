---
id: 'e5e3bdab-105f-46bc-b1cd-0068ebdd7541'
slug: /e5e3bdab-105f-46bc-b1cd-0068ebdd7541
title: 'Volume Exhaustion Estmations'
title_meta: 'Volume Exhaustion Estmations'
keywords: ['volume', 'monitor', 'space', 'computer', 'client', 'location', 'drive', 'size', 'timestamp']
description: 'This document provides a summary of the volume information gathered by the CWM - Automate script for monitoring free space. It details the columns used to display relevant data about computer volumes, including size, remaining space, and estimated exhaustion date.'
tags: []
draft: false
unlisted: true
---

## Summary

Displays volume information gathered by [Script - Volume Free Space - Monitor Creation](/docs/dee853b7-69a6-4f0d-ad2f-7238a10851f4).

## Dependencies

- [Script - Volume Free Space - Monitor Creation](/docs/dee853b7-69a6-4f0d-ad2f-7238a10851f4)
- [Solution - Predictive Volume Space Exhaustion Monitoring](/docs/a367bf9d-8782-4500-a1b8-adbb757f23fc/)

## Columns

| Column                     | Description                                                        |
|---------------------------|--------------------------------------------------------------------|
| ComputerID                | The ID of the target computer                                       |
| Computer                  | The name of the target computer                                     |
| Client                    | The client of the target computer                                   |
| Location                  | The location of the target computer                                 |
| Drive Letter              | The drive letter of the volume                                      |
| Size (GB)                 | The size of the volume in Gigabytes                                 |
| Size Remaining (GB)       | The amount of space remaining in Gigabytes                          |
| Estimated Exhaustion       | The date and time that this volume is estimated to run out of space. |
| Timestamp                 | The last time data was gathered for this volume.                   |