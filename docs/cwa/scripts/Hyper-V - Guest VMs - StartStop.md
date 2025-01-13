---
id: 'cwa-hyperv-vm-control'
title: 'Hyper-V VM Control Script'
title_meta: 'Hyper-V VM Control Script for Managing Virtual Machines'
keywords: ['hyper-v', 'vm', 'control', 'shutdown', 'startup']
description: 'This document describes a script that enables the management of virtual machines on a Hyper-V host, allowing users to start or shut down VMs based on previous executions of the script, ultimately saving time in the process.'
tags: ['hyper-v', 'virtualization', 'windows', 'script', 'logging']
draft: false
unlisted: false
---
## Summary

This script allows for the shut down or start up of VMs on the target Hyper-V host based on previous runs of the script.

Time Saved by Automation: 5 Minutes

## Sample Run

![Sample Run Image 1](../../../static/img/Hyper-V---Guest-VMs---StartStop/image_1.png)

![Sample Run Image 2](../../../static/img/Hyper-V---Guest-VMs---StartStop/image_2.png)

## Dependencies

[Toggle-VMGuests](https://proval.itglue.com/DOC-5078775-7410870)

## Variables

#### User Parameters

| Name    | Example | Required | Description                                                                                     |
|---------|---------|----------|-------------------------------------------------------------------------------------------------|
| Action  | Start   | True     | This parameter determines if the VMs will be started or stopped. Can only be set to "Start" or "Stop". |

## Process

Please see [Toggle-VMGuests](https://proval.itglue.com/DOC-5078775-7410870) for information on how this script processes the VMs.

## Output

- Outputs logs to the script log
- Outputs logs to log/data files in the script directory.




