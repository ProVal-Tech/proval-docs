---
id: '0894c8ab-7630-40fe-81bd-e8af8744c186'
title: 'Ookla Speed Test Automation Script'
title_meta: 'Ookla Speed Test Automation Script'
keywords: ['speedtest', 'ookla', 'internet', 'performance', 'automation']
description: 'This script automates the process of gathering internet speed test records from Ookla, saving time and providing accurate performance metrics. It downloads and executes the speed test, storing the results for further analysis.'
tags: ['performance']
draft: false
unlisted: false
---
## Summary

This script will gather an internet speed test record from Ookla.  
Time Saved by Automation: 15 Minutes

## Sample Run

![Sample Run](../../../static/img/SpeedTest---Ookla/image_1.png)

## Dependencies

[Speedtest Record (Script)](<../dataviews/Speedtest Record Script.md>)

## Variables

| Variable | Description |
|----------|-------------|
| Ookla    | This variable contains information about whether ookla package downloaded and extracted properly |
| Speedtest| This variable contains information of the ookla speedtest executable file output |

#### Script States

| Name         | Example                                                                                  | Description                     |
|--------------|------------------------------------------------------------------------------------------|---------------------------------|
| SpeedTestCLI | @ServerName@ -- @ServerId@ -- @Latency@ -- @Jitter@ -- @PacketLoss@ -- @Download@ -- @Upload@ -- @Downloadbytes@ -- @Uploadbytes@ -- @ExecuteDate@ -- @ShareURL@ | This stores all speedtest output |

## Process

This script will download the speed test zip file from Ookla and extract it. After extraction, it executes it and stores the output to a script state.

## Output

- Script log
- Script state
- Dataview













