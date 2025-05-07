---
id: 'bb8f2562-4744-4349-a661-62f64f0d05b2'
slug: /bb8f2562-4744-4349-a661-62f64f0d05b2
title: 'Stuck Service Action'
title_meta: 'Stuck Service Action'
keywords: ['service', 'detection', 'script', 'automation', 'process']
description: 'This document provides details about a script that detects services stuck in a state other than Running or Stopped and attempts to forcefully stop those services. It includes sample runs, dependencies, variables, global parameters, and the overall process involved in executing the script.'
tags: ['windows']
draft: false
unlisted: false
---

## Summary

This script detects any service that is stuck in a state other than Running or Stopped and attempts to forcefully stop that process.

**Time Saved by Automation:** 10 Minutes

## Sample Run

![Sample Run](../../../static/img/docs/bb8f2562-4744-4349-a661-62f64f0d05b2/image_1.png)

## Dependencies

[Stuck Service Detection](/docs/be3ca430-f53d-4198-9360-52894e5e6a6a)

## Variables

| Variable | Description                                                   |
|----------|---------------------------------------------------------------|
| Output   | Contains PowerShell output of stuck commands and their actions |

### Global Parameters

| Name    | Example | Required | Description                                           |
|---------|---------|----------|-------------------------------------------------------|
| Action  | 0       | True     | 0 - No start of service; 1 - Attempt to start the stuck service |

### Script States

| Name            | Example   | Description          |
|----------------|-----------|----------------------|
| StoppingService | Ticket_ID | Contains ticket record |

## Process

- This script checks for services in a status other than Running or Stopped.
- If a stuck service is found, the script will attempt to stop it forcefully.
- The script depends on the global parameter "Action." If set to 0, the stuck service will only be stopped. If set to 1, it will attempt to start the stuck service.
- If the action fails to stop or start the service, depending on the option selected, a ticket will be created.

## Output

- Script log
- Script state
- Ticket

