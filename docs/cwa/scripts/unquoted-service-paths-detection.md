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
last_update:
  date: 2025-05-09
---

## Summary

The script should be called by the monitor set [ProVal - Development - Unquoted Service Paths Detection](/docs/ab811d99-365c-4ad7-84dd-3ff8575d5b15). It will run a PowerShell script on the machine to fix the services with an unquoted path.

## Sample Run

![Sample Run 1](../../../static/img/docs/2dd77709-9172-4cbe-94cc-b5f664f2f2ce/image_1.webp)

![Sample Run 2](../../../static/img/docs/2dd77709-9172-4cbe-94cc-b5f664f2f2ce/image_2.webp)

## Dependencies

[ProVal - Development - Unquoted Service Paths Detection](/docs/ab811d99-365c-4ad7-84dd-3ff8575d5b15)

## Process

The script will fetch the new paths to be set for each unquoted service on the machine and will run a PowerShell script to add quotes to the service paths.

## Output

Script log

## Changelog

### 2025-09-04

- The script was incorrectly quoting the path if both sys and exe were available in the service path. Updated the PowerShell script at step 3 to enclose the path in quotes if it contains spaces, applying this to whichever comes first between .exe and .sys

### 2025-04-10

- Initial version of the document
