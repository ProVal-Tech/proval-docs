---
id: '9cd465c4-1fed-40fb-8ac2-0b170c9c50b4'
title: 'Speed Test Audit Summary'
title_meta: 'Speed Test Audit Summary'
keywords: ['speed', 'audit', 'network', 'bandwidth', 'performance', 'latency', 'jitter', 'packetloss', 'isp']
description: 'This document provides a summary of the latest audited speed test information from the custom table related to network performance. It details the dependencies and columns used in the audit, including metrics such as jitter, latency, download and upload bandwidth, and packet loss.'
tags: ['network', 'performance', 'audit', 'bandwidth', 'latency', 'jitter', 'packetloss', 'isp', 'database']
draft: false
unlisted: false
---
## Summary

Displays the latest audited speed test information of the last script ran from the custom table [EPM - Network - Custom Table - plugin_proval_speedtest_audit](https://proval.itglue.com/DOC-5078775-9166228).

## Dependencies

- [EPM - Network - Agnostic - Test-InternetSpeed](https://proval.itglue.com/DOC-5078775-9099825)
- [EPM - Network - Script - Internet Speed - Audit](https://proval.itglue.com/DOC-5078775-9166226)
- [EPM - Network - Custom Table - plugin_proval_speedtest_audit](https://proval.itglue.com/DOC-5078775-9166228)

## Columns

| Column          | Explanation                                                        |
|-----------------|--------------------------------------------------------------------|
| ComputerID      | The ID of the audited agent.                                       |
| Client          | The client of the audited computer.                                |
| Location        | The location of the audited computer.                              |
| Computer        | The name of the audited computer.                                  |
| Timestamp       | The time of the audit.                                            |
| Jitter          | Amount of Jitter detected.                                        |
| Latency         | Amount of Latency detected.                                       |
| DLBandwidth     | The measured bandwidth for download speed.                        |
| DLBytes         | The total number of bytes received in the audit.                 |
| DLElapsed       | The total time taken to receive the bytes.                       |
| ULBandwidth     | The measured bandwidth for upload speed.                          |
| ULBytes         | The total number of bytes sent in the audit.                     |
| ULElapsed       | The total time taken to send the bytes.                          |
| PacketLoss      | Amount of packet loss detected.                                   |
| ISP             | The name of the ISP.                                             |
| InternalIP      | The internal IP of the audited agent.                             |
| MACAddress      | The MAC address of the audited agent.                             |
| IsVPN           | 1 if the speedtest was run on a detected VPN connection.        |
| ExternalIP      | The external IP of the audited agent.                             |
| ServerHost      | The server host that the speed test was performed against.       |
| ServerName      | The name of the server host that the speed test was performed against. |
| ServerLocation  | The location of the server host that the speed test was performed against. |
| ServerCountry   | The country of the server host that the speed test was performed against. |
| ServerIP        | The IP address of the server host that the speed test was performed against. |
| ResultID        | The GUID of the speed test result.                               |
| ResultURL       | The URL of the speed test result.                                |
| DownloadMbps    | The download speed detected in Mbps.                             |
| UploadMbps      | The upload speed detected in Mbps.                               |






