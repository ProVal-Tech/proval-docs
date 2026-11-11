---
id: '33d689db-0f80-4f9d-928a-eb76fe283ff5'
slug: /33d689db-0f80-4f9d-928a-eb76fe283ff5
title: 'Auto Reboot Management'
title_meta: 'Auto Reboot Management'
keywords: ['reboot', 'restart', 'auto-reboot', 'scheduled-task', 'schedule', 'report']
description: 'Runs the Auto Reboot Management automation and then the status report every hour, at 5 minutes past the hour, on one primary machine.'
tags: ['windows', 'report']
draft: false
unlisted: false
last_update:
  date: 2026-11-11
---

## Summary

This scheduled task runs the [Auto Reboot Management - NinjaOne](/docs/52091463-99b7-4a21-8ad0-7ade5b8212e7) solution. Every hour, at 5 minutes past the hour, it runs two automations, one after the other, on **one** primary machine:

1. [Auto Reboot Management](/docs/15697579-8f51-4c51-9812-d909edebfc8b) works out the restart schedule of every enabled Windows device, requests the restarts due before the next run, and checks whether earlier restarts happened.
2. [WYSIWYG Custom Field Report - Organization and Global KB](/docs/67df14cd-3c20-4a40-bb7a-80caae242687) then turns the status of every device into the [Auto Reboot Management Status](/docs/413d9e77-6f09-457a-9ff1-f9142b0e38e9) report.

Without this task, no restart is ever requested.

## How It Works

The task reads every device through the NinjaOne API, so one run on one machine covers every client. Nothing changes on the primary machine itself.

Restart times are on the hour or the half hour. Each run requests the restarts due before the next run:

| Task Runs At | Restart Time | Requested | Notice to the Signed-in User |
| ------------ | ------------ | --------- | ---------------------------- |
| 09:05 | 09:30 | About 25 minutes ahead | About 20 minutes |
| 09:05 | 10:00 | About 55 minutes ahead | About 50 minutes |
| 10:05 | 10:30 | About 25 minutes ahead | About 20 minutes |

Within about 6 minutes of a request, the device schedules the restart and Windows shows the signed-in user a notice with the restart time.

:::note

- **Changes take up to an hour.** A change to the auto reboot settings applies from the next run of the task.
- **The primary machine must be online.** If it's offline when the task is due, the restarts due in the next hour aren't requested.
- **Restart times follow the time zone of the primary machine.**
- **The report refreshes every hour.** [Auto Reboot Management Status](/docs/413d9e77-6f09-457a-9ff1-f9142b0e38e9) shows the result of the latest run.

:::

## Dependencies

- [Automation: Auto Reboot Management](/docs/15697579-8f51-4c51-9812-d909edebfc8b)
- [Automation: WYSIWYG Custom Field Report - Organization and Global KB](/docs/67df14cd-3c20-4a40-bb7a-80caae242687)
- [Audit Report: Auto Reboot Management Status](/docs/413d9e77-6f09-457a-9ff1-f9142b0e38e9)
- [Custom Field: cPVAL Ninja API Client ID](/docs/32142af2-d352-4d0d-9ec3-9dae0a5fef88)
- [Custom Field: cPVAL Ninja API Client Secret](/docs/58b01634-4e1a-4793-aafd-18526ea8c80e)
- [Compound Condition: Auto Reboot Management - Reboot Trigger [Windows Servers]](/docs/41ccbc86-b7f0-4674-9c7c-f765a0e0df01)
- [Compound Condition: Auto Reboot Management - Reboot Trigger [Windows Workstations]](/docs/5313102f-bd2a-4350-a775-07c150632573)
- [Solution: Auto Reboot Management - NinjaOne](/docs/52091463-99b7-4a21-8ad0-7ade5b8212e7)

## Task Creation

[Task Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/tasks/auto-reboot-management.toml)

## Changelog

### 2026-11-11

- Initial version of the document
