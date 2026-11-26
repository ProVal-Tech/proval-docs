---
id: 'ffc02ba6-8c07-4075-9844-2e7327723023'
slug: /ffc02ba6-8c07-4075-9844-2e7327723023
title: 'Patch Failure Monitoring'
title_meta: 'Patch Failure Monitoring'
keywords: ['patching', 'patch-failure', 'scheduled-task', 'schedule', 'report']
description: 'Runs the Patch Failure Monitoring automation and then the status report once a day on one primary machine.'
tags: ['windows', 'report']
draft: false
unlisted: false
last_update:
  date: 2026-11-23
---

## Summary

This scheduled task runs the [Patch Failure Monitoring - NinjaOne](/docs/020ff3c5-06a6-4f98-9eaa-7f7392b2257a) solution. Once a day it runs two automations, one after the other, on **one** primary machine:

1. [Patch Failure Monitoring](/docs/28302386-1560-4468-be5c-c9d683b99e65) reads the NinjaOne patch activity of every monitored Windows device, counts the consecutive failed patch windows and records the failed updates.
2. [WYSIWYG Custom Field Report - Organization and Global KB](/docs/67df14cd-3c20-4a40-bb7a-80caae242687) then turns the status of every device into the [Patch Failure Monitoring Status](/docs/e475c21b-05a9-40a5-bea2-efd7e0515930) report.

Without this task, no patch window is ever counted, so no repair runs and no ticket is created.

## How It Works

The task reads every device through the NinjaOne API, so one run on one machine covers every client. Nothing changes on the primary machine itself.

Each run reads the last 48 hours of patch activity: the day since the previous run plus one day of overlap, so a device that reports late isn't missed. A patch window is counted only once, even when two runs read it. Within about an hour of the run, the autofix and ticket compound conditions act on the new counts.

:::note

- **Run it after patching.** Start the task after the day's patch windows have finished, for example at 06:05 when patching runs overnight, so each run sees the results of the night's patching.
- **The primary machine must be online.** If it's offline when the task is due, that run doesn't happen. The next run catches up, but patch windows older than 48 hours by then aren't counted.
- **Times follow the time zone of the primary machine.** Every time in the status field, the detail field and the report is in the primary machine's time zone, which they show.
- **The report refreshes once a day.** [Patch Failure Monitoring Status](/docs/e475c21b-05a9-40a5-bea2-efd7e0515930) shows the result of the latest run.

:::

## Dependencies

- [Automation: Patch Failure Monitoring](/docs/28302386-1560-4468-be5c-c9d683b99e65)
- [Automation: WYSIWYG Custom Field Report - Organization and Global KB](/docs/67df14cd-3c20-4a40-bb7a-80caae242687)
- [Audit Report: Patch Failure Monitoring Status](/docs/e475c21b-05a9-40a5-bea2-efd7e0515930)
- [Custom Field: cPVAL Ninja API Client ID](/docs/32142af2-d352-4d0d-9ec3-9dae0a5fef88)
- [Custom Field: cPVAL Ninja API Client Secret](/docs/58b01634-4e1a-4793-aafd-18526ea8c80e)
- [Custom Field: cPVAL Patch Failure Status](/docs/6d0d7b7c-f71d-4db9-9767-e3b7cd4846cd)
- [Solution: Patch Failure Monitoring - NinjaOne](/docs/020ff3c5-06a6-4f98-9eaa-7f7392b2257a)

## Task Creation

[Task Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/tasks/patch-failure-monitoring.toml)

## Changelog

### 2026-11-23

- Initial version of the document
