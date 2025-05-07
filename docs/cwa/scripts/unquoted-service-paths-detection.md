---
id: '2dd77709-9172-4cbe-94cc-b5f664f2f2ce'
slug: /2dd77709-9172-4cbe-94cc-b5f664f2f2ce
title: 'Unquoted Service Paths Detection'
title_meta: 'Unquoted Service Paths Detection'
keywords: ['unquoted', 'service', 'paths', 'detection', 'fix']
description: 'This document outlines a script designed to detect and fix unquoted service paths on a machine. It details the process of running a PowerShell script to properly quote service paths, ensuring system security and stability. The script is intended to be called by the ProVal monitor set for effective service management.'
tags: ['security', 'setup', 'windows']
draft: false
unlisted: false
---

## Summary

The script should be called by the monitor set [ProVal - Development - Unquoted Service Paths Detection](/docs/ab811d99-365c-4ad7-84dd-3ff8575d5b15). It will run a PowerShell script on the machine to fix the services with an unquoted path.

## Sample Run

![Sample Run 1](../../../static/img/docs/2dd77709-9172-4cbe-94cc-b5f664f2f2ce/image_1.png)

![Sample Run 2](../../../static/img/docs/2dd77709-9172-4cbe-94cc-b5f664f2f2ce/image_2.png)

## Dependencies

[ProVal - Development - Unquoted Service Paths Detection](/docs/ab811d99-365c-4ad7-84dd-3ff8575d5b15)

## Process

The script will fetch the new paths to be set for each unquoted service on the machine and will run a PowerShell script to add quotes to the service paths.

## Output

Script log


