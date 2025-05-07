---
id: '4d2a667d-ba87-4148-ba5d-d6da484acccf'
slug: /4d2a667d-ba87-4148-ba5d-d6da484acccf
title: 'Execute Script - Get Latest Installed Cumulative Update'
title_meta: 'Execute Script - Get Latest Installed Cumulative Update'
keywords: ['monitor', 'cumulative', 'update', 'script', 'windows']
description: 'This document outlines the purpose and setup of an internal monitor designed to execute the script for retrieving the latest installed cumulative updates on supported Windows machines. The monitor runs weekly and is limited to 100 machines per hour, ensuring efficient patch management.'
tags: ['performance', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

The purpose of the internal monitor is to execute the [CWM - Automate - Script - Get Latest Installed Cumulative Update](/docs/bd99d6b2-2d31-4611-9682-3c8518c53998) script once per week against the patch-managed supported Windows machines for which Microsoft releases the Cumulative Updates.

By default, it is limited to running the script against 100 machines per hour.

## Dependencies

[CWM - Automate - Script - Get Latest Installed Cumulative Update](/docs/bd99d6b2-2d31-4611-9682-3c8518c53998)

## Target

The SQL query limits the monitor set to the patch-managed supported Windows machines for which Microsoft releases the Cumulative Updates.

## Alert Template

**Name:** △ Custom - Execute Script - Get Latest Installed Cumulative Update

- The alert template should run the [CWM - Automate - Script - Get Latest Installed Cumulative Update](/docs/bd99d6b2-2d31-4611-9682-3c8518c53998) script.


