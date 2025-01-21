---
id: 'b3a711f5-7e0f-4b8a-948c-19cf5721539e'
title: 'h_plugin_proval_uptime_'
title_meta: 'h_plugin_proval_uptime_'
keywords: ['connectwise', 'uptime', 'measurement', 'database', 'events']
description: 'This document explains the purpose and dependencies of the h_plugin_proval_uptime and h_plugin_proval_uptime_days tables in ConnectWise Automate, which are used to track the uptime of machines over time. It details the structure of these tables and the events that populate them.'
tags: ['connectwise', 'database']
draft: false
unlisted: false
---

## Purpose

The tables `h_plugin_proval_uptime` and `h_plugin_proval_uptime_days` are used to measure the uptime of machines over a long period. They are dependent on two events that pull the current agent online status from the CWA database. All four SQL items must be present for this solution to function properly.

## Dependencies

These tables are populated by the events `ProvalUptime` and `ProvalUptimeDays`. The SQL for these two events is detailed in the SQL section of this article.

## Tables

### h_plugin_proval_uptime

| Column      | Type     | Explanation                                             |
|-------------|----------|--------------------------------------------------------|
| ComputerID  | INT      | The ComputerID of the measured agent.                 |
| Online      | TINYINT  | 1 or 0 based on whether the agent was online during the measurement. |
| Timestamp   | TIMESTAMP| The date and time of the measurement.                  |

### h_plugin_proval_uptime_days

| Column        | Type     | Explanation                                             |
|---------------|----------|--------------------------------------------------------|
| ComputerID    | INT      | The ComputerID of the measured agent.                 |
| PercentOnline  | DOUBLE   | The percentage of time that the agent was online on the specified SampleDate. |
| SampleDate    | DATE     | The date of the measurements used to calculate the PercentOnline. |



