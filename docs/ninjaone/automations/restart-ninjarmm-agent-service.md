---
id: '4140af67-f072-4d69-81c1-ee6a4fdd5ba7'
slug: /4140af67-f072-4d69-81c1-ee6a4fdd5ba7
title: 'Restart NinjaRMM Agent Service'
title_meta: 'Restart NinjaRMM Agent Service'
keywords: ['service','ninja','rmm']
description: 'The script is designed to ensure the NinjaRMM Agent remains operational and automatically recovers from service failures.'
tags: ['application','diagnostic','windows']
draft: false
unlisted: false
last_update:
  date: 2026-03-10
---

## Overview

This script performs the following actions:

- Verifies the NinjaRMMAgent service exists on the system.
- Sets the service startup type to Automatic.
- Configures Windows Service Recovery settings to restart on failure.
- Creates a monitoring script that checks service status and restarts if stopped.
- Registers a scheduled task to run the monitoring script at regular intervals `(15 minutes for servers, 60 minutes for workstations)`.
- Attempts to start the service if it's not currently running.
- Logs events to the Application event log for monitoring purposes
The script is designed to ensure the NinjaRMM Agent remains operational and automatically recovers from service failures.

## Sample Run

`Play Button` > `Run Automation` > `Script`  
![SampleRun1](../../../static/img/docs/4140af67-f072-4d69-81c1-ee6a4fdd5ba7/sample-run.webp)

## Automation Setup/Import

[Automation Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/scripts/restart-ninjarmm-agent-service.ps1)

## Output

- Activity Details

## Changelog

2026-03-10

- Initial version of the document
