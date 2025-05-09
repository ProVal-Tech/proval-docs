---
id: '54531eb6-553a-4730-8afc-558adbab450d'
slug: /54531eb6-553a-4730-8afc-558adbab450d
title: 'Probe Scanned Machines Missing Automate Agent'
title_meta: 'Probe Scanned Machines Missing Automate Agent'
keywords: ['probe', 'machines', 'port', 'open', 'agent', 'readiness', 'network', 'device']
description: 'This document provides a detailed overview of the dataview that lists probe-detected machines with port 139 open, which may be missing the Automate agent. It includes information on the columns available, their descriptions, and the necessary dependencies for accurate data retrieval.'
tags: ['networking', 'performance', 'report', 'security', 'setup']
draft: false
unlisted: false
---

## Summary

This document shows the list of probe-detected machines with port 139 open that may be missing the Automate agent. This dataview also assesses agent readiness.

## Columns

| Column                   | Description                                                                                               |
|--------------------------|-----------------------------------------------------------------------------------------------------------|
| clientid                 | Client ID of the Probe that runs the scan.                                                               |
| Client Name              | Client Name of the Probe that runs the scan.                                                             |
| Location Name            | Location Name of the Probe that runs the scan.                                                           |
| LocationID               | Location ID of the Probe that runs the scan.                                                             |
| computerid               | Computer ID of the Probe.                                                                                 |
| DeviceID                 | Device ID of the network device detected by the probe.                                                   |
| Device Name              | Network Device name that has been scanned by the Probe.                                                  |
| Device Type              | Type of the Network Device.                                                                                |
| Open Ports               | The port through which scanned computers communicate with the Probe.                                       |
| Manufacturer Name        | Name of the network Device Manufacturer.                                                                   |
| IPAddress                | IP address of the scanned computer.                                                                        |
| MacAddress               | MAC address of the scanned computer.                                                                       |
| MAC Check                | 'No Match' if the MAC Address of the network device doesn't match any of the machines from the computers table. |
| LastContact              | Last contact of the scanned computer with the Probe.                                                     |
| Device LastContact       | Cross-check of scanned computer MAC addresses with matching MAC addresses at the same location. Machines indicating "Matching MAC" may already be deployed in the environment. |
| Readiness Status         | Status from the Probe's last readiness attempt on the network device.                                     |
| Last Checked for Readiness| Last date when the Probe checked the Network Device readiness.                                           |
| Last Deployment Attempt   | Last deployment attempted on the Network device. 'NA' means no data available.                          |
| Total Attempt Count      | Number of attempts to install the Automate agent on the network device. 'NA' means no data available.    |

## Dependency

Schedule the [CWM - Automate - Script - MySQL - Permission - Set agentdeploymentreadinesscheck Table Permissions](/docs/417bc415-aa42-401f-b748-0f2715e4a239) script to run every 12-24 hours to provide permission for the `agentdeploymentreadinesscheck` table for both hosted and on-prem clients. Otherwise, the dataview will not provide any results.