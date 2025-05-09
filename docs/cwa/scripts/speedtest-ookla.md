---
id: '0894c8ab-7630-40fe-81bd-e8af8744c186'
slug: /0894c8ab-7630-40fe-81bd-e8af8744c186
title: 'SpeedTest - Ookla'
title_meta: 'SpeedTest - Ookla'
keywords: ['speedtest', 'ookla', 'internet', 'performance', 'automation']
description: 'This script automates the process of gathering internet speed test records from Ookla, saving time and providing accurate performance metrics. It downloads and executes the speed test, storing the results for further analysis.'
tags: ['performance']
draft: false
unlisted: false
---

## Summary

This script gathers an internet speed test record from Ookla.  
**Time Saved by Automation:** 15 Minutes

## Sample Run

![Sample Run](../../../static/img/docs/0894c8ab-7630-40fe-81bd-e8af8744c186/image_1.webp)

## Dependencies

[Speedtest Record (Script)](/docs/a15c39f0-c19e-413a-8d21-7ea44529be05)

## Variables

| Variable   | Description                                                                 |
|------------|-----------------------------------------------------------------------------|
| Ookla      | This variable contains information about whether the Ookla package was downloaded and extracted properly. |
| Speedtest  | This variable contains information about the Ookla speed test executable file output. |

### Script States

| Name         | Example                                                                                  | Description                     |
|--------------|------------------------------------------------------------------------------------------|---------------------------------|
| SpeedTestCLI | @ServerName@ -- @ServerId@ -- @Latency@ -- @Jitter@ -- @PacketLoss@ -- @Download@ -- @Upload@ -- @Downloadbytes@ -- @Uploadbytes@ -- @ExecuteDate@ -- @ShareURL@ | This stores all speed test output. |

## Process

This script downloads the speed test zip file from Ookla and extracts it. After extraction, it executes the file and stores the output in a script state.

## Output

- Script log
- Script state
- Dataview
