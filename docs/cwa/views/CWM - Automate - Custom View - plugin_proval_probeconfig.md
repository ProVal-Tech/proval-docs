---
id: 'cwa-probe-config-view'
title: 'Network Probe Configuration View'
title_meta: 'Network Probe Configuration View'
keywords: ['network', 'probe', 'configuration', 'view', 'audit']
description: 'This document outlines the creation and purpose of the Network Probe Configuration View, which consolidates information for both Generation 1 and Generation 2 probes. It details the dependencies, table structure, and the specific columns included in the view for effective monitoring and management of network probes.'
tags: ['configuration', 'database', 'network', 'report', 'setup']
draft: false
unlisted: false
---
## Purpose

The view is created to present information related to Network Probe configurations in the environment. It will present the information for both Generation 1 and Generation 2 probes in one place. The view is used for the data displayed in the dataview [CWM - Automate - Dataview - Probe Deployment Audit Re-Defined [View]](https://proval.itglue.com/DOC-5078775-8288021).

This view was created to bypass the word count limit of 2500 for the "SQLBody" column in the Dataviews table. The view is created by the script, [CWM - Automate - Script - Create View "plugin_proval_probeconfig"](https://proval.itglue.com/DOC-5078775-8288023).

## Dependencies

- [CWM - Automate - Dataview - Probe Deployment Audit Re-Defined [View]](https://proval.itglue.com/DOC-5078775-8288021)
- [CWM - Automate - Script - Create View "plugin_proval_probeconfig"](https://proval.itglue.com/DOC-5078775-8288023)

## Table

### plugin_proval_probeconfig

| Column                                   | Type     | Explanation                                                          |
|------------------------------------------|----------|----------------------------------------------------------------------|
| ComputerID                               | INT      | Computerid of the network probe, only if it's available for the location. |
| LocationID                               | INT      | LocationID                                                          |
| ClientID                                 | INT      | ClientID                                                            |
| Client                                   | VARCHAR  | Client Name                                                         |
| Location                                 | VARCHAR  | Location Name                                                       |
| Probe Status                             | VARCHAR  | If probe is enabled or not. Name of the probe if enabled.         |
| Recommended Probe                        | VARCHAR  | Name of the recommended computer if probe is disabled else name of the probe. |
| Probe Version                            | VARCHAR  | Version of Probe, like generation 1 or generation 2.               |
| StatDate                                 | VARCHAR  | MAX(statdate) from h_locationstats for the locationid.             |
| IsMacAddresScanningEnabled               | INT      | Is enabled or disabled for the probe.                               |
| IsdatacollectionEnabled                  | INT      | Is enabled or disabled for the probe.                               |
| MaxdeploymentAttempts                    | INT      | Number of attempts to deploy agent.                                 |
| AutomatedDeploymentEnabled                | INT      | If Automate agent deployment is enabled or not.                    |
| Network                                  | VARCHAR  | Network(s) being scanned by the probe.                              |
| SubnetMask                               | VARCHAR  | SubnetMask(s) of the Network(s) scanned by the probe.              |
| Credentials Title                        | VARCHAR  | Title of credentials being used for agent deployment.              |
| Credentials Username                     | VARCHAR  | Usernames of the credentials being used for agent deployment.      |
| Discovery Scan Frequency                  | VARCHAR  | Discovery Scan Frequency of the Network Probe                       |
| Status Scan Frequency                    | VARCHAR  | Status Scan Frequency of the Network Probe                          |
| Only Run Discovery in Scan Window        | TinyInt  | If probe's discovery scan is running in limited time only or not (1 or 0) |
| Discovery Start Time                     | time     | Discovery Scan Start Time                                           |
| Discovery End Time                       | time     | Discovery Scan End Time                                             |
| Spawned Threads                          | INT      | Number of Spawned Threads                                           |
| Scan Network Port                        | VARCHAR  | Default | Custom | Disabled, Network Ports allowed to scan |
| Status Scan Port Number                  | VARCHAR  | Network Port Numbers allocated for the scanning                     |
| Created By                               | VARCHAR  | Network Probe's creator                                            |
| Updated By                               | VARCHAR  | Last user to make any changes to the probe                          |
| Creation Date                            | datetime | Date of creation                                                   |
| Last Update Date                         | datetime | Last Update date for the network probe                              |

