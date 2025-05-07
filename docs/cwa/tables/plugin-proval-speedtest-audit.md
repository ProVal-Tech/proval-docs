---
id: '38fbe617-1c50-443b-b69b-07eae7135652'
slug: /38fbe617-1c50-443b-b69b-07eae7135652
title: 'plugin_proval_speedtest_audit'
title_meta: 'plugin_proval_speedtest_audit'
keywords: ['speedtest', 'audit', 'bandwidth', 'latency', 'jitter', 'packet loss', 'VPN', 'ISP']
description: 'This document outlines the structure and purpose of the database table used to store results from internet speed tests conducted by the EPM Network script. It details the dependencies, the columns in the database table, and their explanations to facilitate understanding and usage of the stored data.'
tags: ['database', 'networking', 'performance', 'security', 'windows']
draft: false
unlisted: false
---

## Purpose

Stores results from speed tests run by the script [EPM - Network - Script - Internet Speed - Audit](/docs/54ed691f-e7be-4709-8967-72a4c9c782f6).

## Dependencies

[EPM - Network - Script - Internet Speed - Audit](/docs/54ed691f-e7be-4709-8967-72a4c9c782f6).

## Tables

#### plugin_proval_speedtest_audit

| Column          | Type     | Explanation                                                                 |
|-----------------|----------|-----------------------------------------------------------------------------|
| ComputerID      | INT      | The ID of the audited agent.                                               |
| Timestamp       | DATETIME | The time of the audit.                                                    |
| Jitter          | FLOAT    | Amount of jitter detected.                                                |
| Latency         | FLOAT    | Amount of latency detected.                                               |
| DLBandwidth     | BIGINT   | The measured bandwidth for download speed.                                |
| DLBytes         | BIGINT   | The total number of bytes received in the audit.                         |
| DLElapsed       | INT      | The total time taken to receive the bytes.                               |
| ULBandwidth     | BIGINT   | The measured bandwidth for upload speed.                                  |
| ULBytes         | BIGINT   | The total number of bytes sent in the audit.                             |
| ULElapsed       | INT      | The total time taken to send the bytes.                                  |
| PacketLoss      | TINYINT  | Amount of packet loss detected.                                           |
| ISP             | VARCHAR  | The name of the ISP.                                                     |
| InternalIP      | VARCHAR  | The internal IP of the audited agent.                                    |
| MACAddress      | VARCHAR  | The MAC address of the audited agent.                                    |
| IsVPN           | TINYINT  | 1 if the speed test was run on a detected VPN connection.                |
| ExternalIP      | VARCHAR  | The external IP of the audited agent.                                    |
| ServerHost      | VARCHAR  | The server host that the speed test was performed against.               |
| ServerName      | VARCHAR  | The name of the server host that the speed test was performed against.   |
| ServerLocation  | VARCHAR  | The location of the server host that the speed test was performed against.|
| ServerCountry   | VARCHAR  | The country of the server host that the speed test was performed against. |
| ServerIP        | VARCHAR  | The IP address of the server host that the speed test was performed against.|
| ResultID        | VARCHAR  | The GUID of the speed test result.                                        |
| ResultURL       | VARCHAR  | The URL of the speed test result.                                         |
| DownloadMbps    | FLOAT    | The download speed detected in Mbps.                                      |
| UploadMbps      | FLOAT    | The upload speed detected in Mbps.                                        |


