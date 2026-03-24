---
id: '4140af67-f072-4d69-81c1-ee6a4fdd5ba7'
slug: /4140af67-f072-4d69-81c1-ee6a4fdd5ba7
title: 'Restart NinjaRMM Agent Service'
title_meta: 'Restart NinjaRMM Agent Service'
keywords: ['Ninja','Service','NinjaRMMAgent']
description: 'The script is designed to restart the NinjaRMM Agent and Ninja Remote services even if they are running via task Scheduler.'
tags: ['application','diagnostic','windows']
draft: false
unlisted: false
last_update:
  date: 2026-03-26
---

## Overview

This is an on-demand script that schedules a one-time task to restart `NinjaRMM Agent` and `Ninja Remote services` after 3 minutes. It performs the following actions:

  - Checks if the `EnsureNinjaServiceRunning` scheduled task exists before proceeding.
  - This script will not execute unless the `EnsureNinjaServiceRunning` scheduled task exists.
  - Creates a restart service script on disk.
  - Registers a one-time scheduled task to restart NinjaRMMAgent and ncstreamer 3 minutes after execution from Ninja.
  - The scheduled task runs as SYSTEM with highest privileges

**Please Note:**  If the `EnsureNinjaServiceRunning` scheduled task is missing, the script [Ensure Ninja Service is Running](/docs/cb7a9cf6-e5ea-40db-8249-2daec21d793d) must be executed first.

## Dependencies

- [Ensure Ninja Service is Running](/docs/cb7a9cf6-e5ea-40db-8249-2daec21d793d)

## Sample Run

`Play Button` > `Run Automation` > `Script`  

![SampleRun1](../../../static/img/docs/4140af67-f072-4d69-81c1-ee6a4fdd5ba7/sample-run.webp)

## Automation Setup/Import

[Automation Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/scripts/restart-ninjarmm-agent-service.ps1)

## Output

- Activity Details

## Changelog

### 2026-03-24

  - The script modified to run as an on-demand script to restart the services only when the scheduled task `EnsureNinjaServiceRunning` exists on the computer.

### 2026-03-10

- Initial version of the document
