---
id: 'cwa-network-probes-overview'
title: 'Overview of Network Probes (Gen1 and Gen2)'
title_meta: 'Overview of Network Probes (Gen1 and Gen2)'
keywords: ['network', 'probe', 'scan', 'deployment', 'subnet']
description: 'This document presents comprehensive information about Network Probes (Gen1 and Gen2), including details on subnet settings, scan configurations, and deployment options. It also provides recommendations for the best computer to use when a network probe is not present at a location.'
tags: ['network', 'probe', 'scan', 'deployment', 'subnet', 'status', 'frequency']
draft: false
unlisted: false
---
## Summary

Presents information related to Network Probes (Gen1 and Gen2). Also, it will suggest the best computer from the location, if a network probe is not present there.

Information from the following tabs of a Network probe setting page is displayed in the Dataview:

### Subnet
![Subnet](..\..\..\static\img\Network-Probes\image_1.png)

### Scan
![Scan](..\..\..\static\img\Network-Probes\image_2.png)

### Deployment
![Deployment](..\..\..\static\img\Network-Probes\image_3.png)

## Dependencies

- [CWM - Automate - Custom View - plugin_proval_probeconfig](https://proval.itglue.com/DOC-5078775-8288022)
- [CWM - Automate - Script - Create View "plugin_proval_probeconfig"](https://proval.itglue.com/DOC-5078775-8288023)

## Columns

| Column                          | Description                                                                                      |
|---------------------------------|--------------------------------------------------------------------------------------------------|
| Client                          | Client Name                                                                                     |
| Location                        | Location Name                                                                                   |
| Probe Status                    | If probe is enabled or not. Name of the probe if enabled.                                     |
| Recommended Probe                | Name of the recommended computer if probe is disabled else name of the probe.                  |
| Probe Version                   | Version of Probe, like generation 1 or generation 2.                                          |
| IsMacAddresScanningEnabled      | Is enabled or disabled for the probe.                                                          |
| IsdatacollectionEnabled         | Is enabled or disabled for the probe.                                                          |
| MaxdeploymentAttempts           | Number of attempts to deploy agent.                                                             |
| AutomatedDeploymentEnabled       | If Automate agent deployment is enabled or not.                                                |
| Network                         | Network(s) being scanned by the probe.                                                         |
| SubnetMask                      | SubnetMask(s) of the Network(s) scanned by the probe.                                          |
| Credentials Title               | Title of credentials being used for agent deployment.                                          |
| Credentials Username            | Usernames of the credentials being used for agent deployment.                                  |
| Discovery Scan Frequency         | Discovery Scan Frequency of the Network Probe                                                   |
| Status Scan Frequency            | Status Scan Frequency of the Network Probe                                                      |
| Scan Network Port               | Default | Custom | Disabled, Network Ports allowed to scan                                       |
| Status Scan Port Number         | Network Port Numbers allocated for the scanning                                                 |
| Created By                      | Network Probe's creator                                                                          |
| Updated By                      | Last user to make any changes to the probe                                                     |
| Creation Date                   | Date of creation                                                                                 |
| Last Update Date                | Last Update date for the network probe                                                          |


