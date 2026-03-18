---
id: '4140af67-f072-4d69-81c1-ee6a4fdd5ba7'
slug: /4140af67-f072-4d69-81c1-ee6a4fdd5ba7
title: 'Restart NinjaRMM Agent Service'
title_meta: 'Restart NinjaRMM Agent Service'
keywords: ['service','ninja','rmm']
description: 'Schedules a one-time task to restart NinjaRMMAgent and ncstreamer services after 3 minutes.'
tags: ['application','diagnostic','windows']
draft: false
unlisted: false
last_update:
  date: 2026-03-18
---

## Overview

    This script performs the following actions:

    - Checks if the 'EnsureNinjaServiceRunning' scheduled task exists before proceeding

    - Creates a restart script on disk

    - Registers a one-time scheduled task to restart NinjaRMMAgent and ncstreamer 3 minutes after execution

    - The scheduled task runs as SYSTEM with highest privileges

## Sample Run

`Play Button` > `Run Automation` > `Script`  
![SampleRun1](../../../static/img/docs/4140af67-f072-4d69-81c1-ee6a4fdd5ba7/sample-run.webp)

## Automation Setup/Import

[Automation Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/scripts/restart-ninja-rmm-agent-services.ps1)

## Output

- Activity Details

## Changelog

### 2026-03-18

- Changes that were made

  - Checks if the 'EnsureNinjaServiceRunning' scheduled task exists before proceeding
  - Creates a restart script on disk
  - Registers a one-time scheduled task to restart NinjaRMMAgent and ncstreamer 3 minutes after execution
  - The scheduled task runs as SYSTEM with highest privileges

### 2026-03-10

- Initial version of the document
