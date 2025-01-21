---
id: '0d3e8cd2-8055-42bb-8559-098e60a9db42'
title: 'Overview of Network Probes (Gen1 and Gen2)'
title_meta: 'Overview of Network Probes (Gen1 and Gen2)'
keywords: ['network', 'probe', 'scan', 'deployment', 'subnet']
description: 'This document presents comprehensive information about Network Probes (Gen1 and Gen2), including details on subnet settings, scan configurations, and deployment options. It also provides recommendations for the best computer to use when a network probe is not present at a location.'
tags: ['deployment']
draft: false
unlisted: false
---

## Summary

This document presents information related to Network Probes (Gen1 and Gen2). It also suggests the best computer to use at a location if a network probe is not present.

Information from the following tabs of a Network Probe settings page is displayed in the Dataview:

### Subnet
![Subnet](../../../static/img/Network-Probes/image_1.png)

### Scan
![Scan](../../../static/img/Network-Probes/image_2.png)

### Deployment
![Deployment](../../../static/img/Network-Probes/image_3.png)

## Dependencies

- [CWM - Automate - Custom View - plugin_proval_probeconfig](<../views/plugin_proval_probeconfig.md>)
- [CWM - Automate - Script - Create View "plugin_proval_probeconfig"](../scripts/MySQL - View - Create (plugin_proval_probeconfig).md)

## Columns

| Column                          | Description                                                                                      |
|---------------------------------|--------------------------------------------------------------------------------------------------|
| Client                          | Client Name                                                                                     |
| Location                        | Location Name                                                                                   |
| Probe Status                    | Indicates if the probe is enabled or not; shows the name of the probe if enabled.              |
| Recommended Probe                | Name of the recommended computer if the probe is disabled; otherwise, it shows the probe name. |
| Probe Version                   | Version of the Probe, e.g., Generation 1 or Generation 2.                                     |
| IsMacAddressScanningEnabled      | Indicates if scanning for MAC addresses is enabled or disabled for the probe.                  |
| IsDataCollectionEnabled         | Indicates if data collection is enabled or disabled for the probe.                             |
| MaxDeploymentAttempts           | Number of attempts to deploy the agent.                                                         |
| AutomatedDeploymentEnabled       | Indicates if automated agent deployment is enabled or not.                                     |
| Network                         | Network(s) being scanned by the probe.                                                         |
| SubnetMask                      | Subnet Mask(s) of the Network(s) scanned by the probe.                                         |
| Credentials Title               | Title of the credentials being used for agent deployment.                                       |
| Credentials Username            | Usernames of the credentials being used for agent deployment.                                   |
| Discovery Scan Frequency         | Discovery scan frequency of the Network Probe.                                                 |
| Status Scan Frequency            | Status scan frequency of the Network Probe.                                                    |
| Scan Network Port               | Default | Custom | Disabled; Network Ports allowed to scan.                                        |
| Status Scan Port Number         | Network port numbers allocated for scanning.                                                    |
| Created By                      | Creator of the Network Probe.                                                                   |
| Updated By                      | Last user to make changes to the probe.                                                        |
| Creation Date                   | Date of creation.                                                                                |
| Last Update Date                | Last update date for the network probe.                                                         |

