---
id: '706c1dcb-998c-4d1e-a046-ab7538429aa7'
slug: /706c1dcb-998c-4d1e-a046-ab7538429aa7
title: 'Internet Speed - Audit'
title_meta: 'Internet Speed - Audit'
keywords: ['speed', 'audit', 'network', 'performance', 'bandwidth', 'latency', 'jitter', 'packet loss', 'ISP']
description: 'This document provides detailed information on the audited speed test results from the custom table EPM - Network - Custom Table - plugin_proval_speedtest_audit, including various metrics such as latency, jitter, download and upload speeds, and more.'
tags: ['networking', 'performance', 'report', 'setup']
draft: false
unlisted: false
---

## Summary

Displays audited speed test information from the custom table [EPM - Network - Custom Table - plugin_proval_speedtest_audit](/docs/38fbe617-1c50-443b-b69b-07eae7135652).

## Dependencies

- [EPM - Network - Agnostic - Test-InternetSpeed](/docs/12946fed-d74f-4977-b59d-85d5c639b56b)  
- [EPM - Network - Script - Internet Speed - Audit](/docs/54ed691f-e7be-4709-8967-72a4c9c782f6)  
- [EPM - Network - Custom Table - plugin_proval_speedtest_audit](/docs/38fbe617-1c50-443b-b69b-07eae7135652)  

## Columns

| Column           | Explanation                                                                                 |
|------------------|---------------------------------------------------------------------------------------------|
| ComputerID       | The ID of the audited agent.                                                                |
| Client           | The client of the audited computer.                                                         |
| Location         | The location of the audited computer.                                                      |
| Computer         | The name of the audited computer.                                                           |
| Timestamp        | The time of the audit.                                                                      |
| Jitter           | Amount of jitter detected.                                                                   |
| Latency          | Amount of latency detected.                                                                  |
| DLBandwidth      | The measured bandwidth for download speed.                                                  |
| DLBytes          | The total number of bytes received in the audit.                                            |
| DLElapsed        | The total time taken to receive the bytes.                                                 |
| ULBandwidth      | The measured bandwidth for upload speed.                                                    |
| ULBytes          | The total number of bytes sent in the audit.                                               |
| ULElapsed        | The total time taken to send the bytes.                                                    |
| PacketLoss       | Amount of packet loss detected.                                                             |
| ISP              | The name of the ISP.                                                                        |
| InternalIP       | The internal IP of the audited agent.                                                       |
| MACAddress       | The MAC address of the audited agent.                                                       |
| IsVPN            | 1 if the speed test was run on a detected VPN connection.                                   |
| ExternalIP       | The external IP of the audited agent.                                                      |
| ServerHost       | The server host that the speed test was performed against.                                  |
| ServerName       | The name of the server host that the speed test was performed against.                      |
| ServerLocation   | The location of the server host that the speed test was performed against.                  |
| ServerCountry    | The country of the server host that the speed test was performed against.                   |
| ServerIP         | The IP address of the server host that the speed test was performed against.                |
| ResultID         | The GUID of the speed test result.                                                          |
| ResultURL        | The URL of the speed test result.                                                           |
| DownloadMbps     | The download speed detected in Mbps.                                                        |
| UploadMbps       | The upload speed detected in Mbps.                                                          |