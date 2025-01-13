---
id: 'rmm-huntress-agent-deployment'
title: 'Huntress Agent Deployment and Management in CW RMM'
title_meta: 'Huntress Agent Deployment and Management in CW RMM'
keywords: ['huntress', 'agent', 'deployment', 'management', 'cw', 'rmm']
description: 'This document outlines the procedures for deploying, repairing, reinstalling, re-registering, and removing the Huntress Agent within ConnectWise RMM. It includes associated content, implementation steps, and custom fields necessary for effective management.'
tags: ['cw', 'custom-field', 'task', 'device-group', 'monitor', 'windows', 'mac']
draft: false
unlisted: false
---
## Purpose

Deploy, Repair, Reinstall, Re-register, and Remove the Huntress Agent in CW RMM.

## Associated Content

| Content                                                                 | Type         | Function                                                                                                   |
|-------------------------------------------------------------------------|--------------|------------------------------------------------------------------------------------------------------------|
| [CW RMM - Custom Fields - Huntress Acct_Key](https://proval.itglue.com/DOC-5078775-15293648) | Custom Field | This Custom field is to be filled with Huntress Account Key                                               |
| [CW RMM - Custom Fields - Huntress Org_Key](https://proval.itglue.com/DOC-5078775-15293647) | Custom Field | This Custom field is to be filled with Huntress Organization Key                                          |
| [CW RMM - Custom Fields - Huntress Tag](https://proval.itglue.com/DOC-5078775-15293470) | Custom Field | This Custom field is to be filled with Huntress Tag                                                      |
| [CW RMM - Custom Fields - Exclude Huntress](https://proval.itglue.com/DOC-5078775-15294130) | Custom Field | Select this custom Field to exclude a site from Huntress Deployment                                       |
| [CW RMM - Custom Fields - Exclude Huntress Deployment](https://proval.itglue.com/DOC-5078775-15294129) | Custom Field | Select this custom Field to exclude a machine from Huntress Deployment                                     |
| [CW RMM - Custom Fields - Huntress Deploy_Result](https://proval.itglue.com/DOC-5078775-15294634) | Custom Field | [CW RMM - Task - Huntress Agent (INSTALL)](https://proval.itglue.com/DOC-5078775-13684933) task utilizes this custom field to store the number of times the task failed to install Huntress on the machine |
| [CW RMM - Task - Huntress Agent (INSTALL)](https://proval.itglue.com/DOC-5078775-13684933) | Task         | Installs Huntress agent on the Windows machine if it's not already installed.                              |
| [CW RMM - Task - Huntress Agent (Install) - MAC](https://proval.itglue.com/DOC-5078775-17718604) | Task         | This task will check first if Huntress is installed or not. If not, then it attempts to install the agent and log the result for the MAC machines. |
| [CW RMM - Task - Huntress Agent (UNINSTALL)](https://proval.itglue.com/DOC-5078775-15297907) | Task         | Uninstall the Huntress agent on Windows machines.                                                         |
| [CW RMM - Task - Huntress Agent (Uninstall) - MAC](https://proval.itglue.com/DOC-5078775-17718610) | Task         | This script uninstalls the Mac from the MAC agent.                                                       |
| [CW RMM - Task - Huntress Agent (REPAIR)](https://proval.itglue.com/DOC-5078775-15297908) | Task         | This task repairs the Huntress Agent.                                                                      |
| [CW RMM - Task - Huntress Agent (Reinstall)](https://proval.itglue.com/DOC-5078775-17718376) | Task         | This task reinstalls the Huntress Agent.                                                                   |
| [CW RMM - Task - Huntress Agent (Re-Register)](https://proval.itglue.com/DOC-5078775-17718396) | Task         | This task re-registers the Huntress Agent in the portal for the endpoint.                                 |
| [CW RMM - Device Group - Deploy Huntress](https://proval.itglue.com/DOC-5078775-15302736) | Device Group | Filters Windows machines where Huntress agent is not installed                                            |
| [CW RMM - Device Group - Deploy Huntress - Mac](https://proval.itglue.com/DOC-5078775-17718620) | Device Group | The purpose of this group is to filter the MAC machines where the Huntress agent is not installed.        |
| [CW RMM - Device Group - Machines with Huntress Agent](https://proval.itglue.com/DOC-5078775-15303347) | Device Group | Filters out Windows machines with Huntress agent installed on them                                         |
| [CW RMM - Monitor - HuntressAgent Service](https://proval.itglue.com/DOC-5078775-15303190) | Monitor      | Alerts on the machines if HuntressAgent Service is stopped and fails to restart.                          |

## Implementation

- Read all the associated documents carefully.
- Create the custom field: [Custom Fields - Huntress Acct_Key](https://proval.itglue.com/DOC-5078775-15293648)
- Create the custom field: [Custom Fields - Huntress Org_Key](https://proval.itglue.com/DOC-5078775-15293647)
- Create the custom field: [Custom Fields - Huntress Tag](https://proval.itglue.com/DOC-5078775-15293470)
- Create the custom field: [Custom Fields - Exclude Huntress](https://proval.itglue.com/DOC-5078775-15294130)
- Create the custom field: [Custom Fields - Exclude Huntress Deployment](https://proval.itglue.com/DOC-5078775-15294129)
- Create the custom field: [Custom Fields - Huntress Deploy_Result](https://proval.itglue.com/DOC-5078775-15294634)
- Create the task: [Task - Huntress Agent (INSTALL)](https://proval.itglue.com/DOC-5078775-13684933)
- Create the task: [Task - Huntress Agent (UNINSTALL)](https://proval.itglue.com/DOC-5078775-15297907)
- Create the task: [Task - Huntress Agent (REPAIR)](https://proval.itglue.com/DOC-5078775-15297908)
- Create the Group: [Device Group - Deploy Huntress](https://proval.itglue.com/DOC-5078775-15302736)
- Create the deployment schedule as described in this document: [Task - Huntress Agent (INSTALL)](https://proval.itglue.com/DOC-5078775-13684933)
- Create the Group: [Device Group - Deploy Huntress - Mac](https://proval.itglue.com/DOC-5078775-17718620)
- Create the deployment schedule for MAC agents as described in this document: [Task - Huntress Agent (Install) - MAC](https://proval.itglue.com/DOC-5078775-17718604)
- Create the Group: [Machines with Huntress Agent](https://proval.itglue.com/DOC-5078775-15303347)
- Create the monitor: [Monitor - HuntressAgent Service](https://proval.itglue.com/DOC-5078775-15303190)


