---
id: 'cc6575e1-f95a-495a-ab89-65e165e1c85f'
title: 'Monitor Failure Count Dataview'
title_meta: 'Monitor Failure Count Dataview'
keywords: ['monitor', 'failure', 'count', 'tickets', 'dataview']
description: 'This document describes a dataview that tracks the number of times a monitor detects a failure. It is particularly useful for understanding potential ticket generation over the past three days, even when tickets are not being created.'
tags: ['report']
draft: false
unlisted: false
---

## Summary

This dataview pulls in the number of times the monitor detects a 'failure'. This is useful when the monitor isn't generating tickets, and you still want to see how many tickets would have been created in the last three days.

## Dependencies

None

## Columns

| Column          | Description                                                        |
|-----------------|--------------------------------------------------------------------|
| Monitor         | The monitor that is showing the failure count                      |
| Computer ID     | The computer that has the monitor running on it (if remote only)   |
| Computer Name    | The computer name of the agent (if remote monitor)                |
| Client Name     | Client name                                                         |
| Type            | Shows 'Internal' or 'Remote' depending on the type of monitor      |
| Times Failed    | Shows the cumulative number of failures in the last three days     |
