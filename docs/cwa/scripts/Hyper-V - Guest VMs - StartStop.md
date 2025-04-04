---
id: '52d001b4-7152-4616-92de-99a002e2d22c'
slug: /52d001b4-7152-4616-92de-99a002e2d22c
title: 'Hyper-V - Guest VMs - StartStop'
title_meta: 'Hyper-V - Guest VMs - StartStop'
keywords: ['hyper-v', 'vm', 'control', 'shutdown', 'startup']
description: 'This document describes a script that enables the management of virtual machines on a Hyper-V host, allowing users to start or shut down VMs based on previous executions of the script, ultimately saving time in the process.'
tags: ['hyper-v', 'logging', 'virtualization', 'windows']
draft: false
unlisted: false
---

## Summary

This script allows for the shutdown or startup of VMs on the target Hyper-V host based on previous runs of the script.

**Time Saved by Automation:** 5 Minutes

## Sample Run

![Sample Run Image 1](../../../static/img/Hyper-V---Guest-VMs---StartStop/image_1.png)

![Sample Run Image 2](../../../static/img/Hyper-V---Guest-VMs---StartStop/image_2.png)

## Dependencies

[Toggle-VMGuests](/docs/63bb684c-e259-46a2-8630-95847705fe6a)

## Variables

#### User Parameters

| Name    | Example | Required | Description                                                                                     |
|---------|---------|----------|-------------------------------------------------------------------------------------------------|
| Action  | Start   | True     | This parameter determines if the VMs will be started or stopped. Can only be set to "Start" or "Stop". |

## Process

Please see [Toggle-VMGuests](/docs/63bb684c-e259-46a2-8630-95847705fe6a) for information on how this script processes the VMs.

## Output

- Outputs logs to the script log.
- Outputs logs to log/data files in the script directory.


