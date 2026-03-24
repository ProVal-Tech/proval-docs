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

This script performs the following actions:

  - The script first Checks if the `EnsureNinjaServiceRunning` scheduled task exists before proceeding.
  - Creates a restart service script on disk.
  - Registers a one-time scheduled task to restart NinjaRMMAgent and ncstreamer 3 minutes after execution from Ninja.
  - The scheduled task runs as SYSTEM with highest privileges

## Note

#### Before running the script `Restart NinjaRMM Agent Service`, please run the script `Ensure Ninja Service is Running`. As the `Restart NinjaRMM Agent Service` willnot get executed if the `EnsureNinjaServiceRunning` is not exists.

#### If the `EnsureNinjaServiceRunning` task is exists then script `Restart NinjaRMM Agent Service` will schedule another task to restart the NinjaRMMAgent and ncstreamer Services even if they are running.

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

- Changes that were made

  - The script first Checks if the `EnsureNinjaServiceRunning` scheduled task exists before proceeding.

  - Creates a restart service script on disk.

  - Registers a one-time scheduled task to restart NinjaRMMAgent and ncstreamer 3 minutes after execution from Ninja.

  - The scheduled task runs as SYSTEM with highest privileges

### 2026-03-10

- Initial version of the document
