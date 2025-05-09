---
id: 'a15c39f0-c19e-413a-8d21-7ea44529be05'
slug: /a15c39f0-c19e-413a-8d21-7ea44529be05
title: 'Speedtest Record Script'
title_meta: 'Speedtest Record Script'
keywords: ['speed', 'test', 'dataview', 'latency', 'upload', 'download', 'packet', 'loss', 'jitter', 'performance']
description: 'This document provides an overview of the Speed Test Dataview, detailing how it displays key metrics such as upload speed, download speed, and latency. It also outlines the dependencies and columns included in the Dataview for enhanced performance monitoring.'
tags: ['networking', 'performance', 'report', 'setup']
draft: false
unlisted: false
---

## Summary

This Dataview displays information from the Speed Test, including upload speed, download speed, latency, and much more.

## Dependencies

The information in this Dataview is populated by a script titled "SpeedTest - Ookla [DV]".  
@SpeedTest - Ookla

## Columns

| Column           | Description                                                       |
|------------------|-------------------------------------------------------------------|
| Client Name      | Displays the name of the client                                   |
| Client ID        | Displays the Client ID                                            |
| Location Name    | Displays the name of the location                                 |
| Location ID      | Displays the Location ID                                          |
| Computer Name    | Displays the name of the computer                                 |
| Computer ID      | Displays the computer ID                                          |
| Share Name       | Displays the nearest Server Name                                  |
| Server ID        | Displays the nearest Server ID                                    |
| Latency          | Displays the latency, or measure of the delay, in milliseconds    |
| Jitter           | Displays the jitter, or time delay in sending packets, in milliseconds |
| Packet Loss      | Displays the number of packets lost                               |
| Total Download    | Displays total download in MB                                     |
| Total Upload     | Displays total upload in MB                                       |
| Download Speed   | Displays the download speed                                       |
| Upload Speed     | Displays the upload speed                                         |
| Execute Date     | Displays the date the script was executed against the machine     |
| Share URL        | Displays the Share URL                                            |