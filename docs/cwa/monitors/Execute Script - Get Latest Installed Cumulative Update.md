---
id: 'cwa-internal-monitor-execute-script'
title: 'Internal Monitor to Execute Script for Latest Installed Cumulative Update'
title_meta: 'Internal Monitor to Execute Script for Latest Installed Cumulative Update'
keywords: ['monitor', 'cumulative', 'update', 'script', 'windows']
description: 'This document outlines the purpose and setup of an internal monitor designed to execute the script for retrieving the latest installed cumulative updates on supported Windows machines. The monitor runs weekly and is limited to 100 machines per hour, ensuring efficient patch management.'
tags: ['configuration', 'update', 'windows', 'notification', 'performance']
draft: false
unlisted: false
---
## Summary

The purpose of the internal monitor is to execute the [CWM - Automate - Script - Get Lastest Installed Cumulative Update](https://proval.itglue.com/DOC-5078775-12849478) script once per week against the patch-managed supported Windows machines for which Microsoft releases the Cumulative Updates.

By default, it's limited to running the script against 100 machines per hour.

## Dependencies

[CWM - Automate - Script - Get Lastest Installed Cumulative Update](https://proval.itglue.com/DOC-5078775-12849478)

## Target

The SQL Query is limiting the monitor set to the patch-managed supported Windows machines for which Microsoft releases the Cumulative Updates.

## Alert Template

**Name:** △ Custom - Execute Script - Get Latest Installed Cumulative Update

- The alert template should run the [CWM - Automate - Script - Get Lastest Installed Cumulative Update](https://proval.itglue.com/DOC-5078775-12849478) script.

