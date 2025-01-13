---
id: 'cwa-monitor-failure-count'
title: 'Monitor Failure Count Dataview'
title_meta: 'Monitor Failure Count Dataview'
keywords: ['monitor', 'failure', 'count', 'tickets', 'dataview']
description: 'This document describes a dataview that tracks the number of times a monitor detects a failure. It is particularly useful for understanding potential ticket generation over the past three days, even when tickets are not being created.'
tags: ['monitor', 'failure', 'client', 'computer', 'report']
draft: false
unlisted: false
---
## Summary

This dataview pulls in the number of times the monitor is detecting a 'failure'. This is useful when the monitor isn't making tickets, and you still want to see how many tickets would have been generated in the last 3 days.

## Dependencies

None

## Columns

| Column          | Description                                                        |
|-----------------|--------------------------------------------------------------------|
| Monitor         | The Monitor that is showing the failure count                      |
| ComputerID      | The computer that has the monitor running on it (if remote only)   |
| Computer Name   | The computer name of the agent (if remote monitor)                 |
| Client Name     | Client name                                                         |
| Type            | Shows 'Internal' or 'Remote' depending on the type of monitor      |
| Times Failed    | Shows the cumulative number of failures in the last 3 days         |


