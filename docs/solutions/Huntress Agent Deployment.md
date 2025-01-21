---
id: '0c1599a5-7c64-41a2-8900-9eba22b1b0c1'
title: 'Huntress Agent Deployment and Management in CW RMM'
title_meta: 'Huntress Agent Deployment and Management in CW RMM'
keywords: ['huntress', 'agent', 'deployment', 'management', 'cw', 'rmm']
description: 'This document outlines the procedures for deploying, repairing, reinstalling, re-registering, and removing the Huntress Agent within ConnectWise RMM. It includes associated content, implementation steps, and custom fields necessary for effective management.'
tags: ['windows']
draft: false
unlisted: false
---

## Purpose

Deploy, Repair, Reinstall, Re-register, and Remove the Huntress Agent in CW RMM.

## Associated Content

| Content                                                                 | Type         | Function                                                                                                   |
|-------------------------------------------------------------------------|--------------|------------------------------------------------------------------------------------------------------------|
| [CW RMM - Custom Fields - Huntress Acct_Key](<../cwrmm/custom-fields/Huntress Acct_Key.md>) | Custom Field | This custom field is to be filled with the Huntress Account Key                                           |
| [CW RMM - Custom Fields - Huntress Org_Key](<../cwrmm/custom-fields/Huntress Org_Key.md>) | Custom Field | This custom field is to be filled with the Huntress Organization Key                                      |
| [CW RMM - Custom Fields - Huntress Tag](<../cwrmm/custom-fields/Huntress Tag.md>) | Custom Field | This custom field is to be filled with the Huntress Tag                                                  |
| [CW RMM - Custom Fields - Exclude Huntress](<../cwrmm/custom-fields/Exclude Huntress.md>) | Custom Field | Select this custom field to exclude a site from Huntress Deployment                                       |
| [CW RMM - Custom Fields - Exclude Huntress Deployment](<../cwrmm/custom-fields/Exclude Huntress Deployment.md>) | Custom Field | Select this custom field to exclude a machine from Huntress Deployment                                     |
| [CW RMM - Custom Fields - Huntress Deploy_Result](<../cwrmm/custom-fields/Huntress Deploy_Result.md>) | Custom Field | The task [CW RMM - Task - Huntress Agent (INSTALL)](<../cwrmm/tasks/Huntress Agent (INSTALL).md>) utilizes this custom field to store the number of times the task failed to install Huntress on the machine |
| [CW RMM - Task - Huntress Agent (INSTALL)](<../cwrmm/tasks/Huntress Agent (INSTALL).md>) | Task         | Installs the Huntress agent on the Windows machine if it is not already installed.                        |
| [CW RMM - Task - Huntress Agent (Install) - MAC](<../cwrmm/tasks/Huntress Agent (Install) - MAC.md>) | Task         | This task checks if Huntress is installed. If not, it attempts to install the agent and log the result for MAC machines. |
| [CW RMM - Task - Huntress Agent (UNINSTALL)](<../cwrmm/tasks/Huntress Agent (UNINSTALL).md>) | Task         | Uninstalls the Huntress agent on Windows machines.                                                         |
| [CW RMM - Task - Huntress Agent (Uninstall) - MAC](<../cwrmm/tasks/Huntress Agent (Uninstall) - MAC.md>) | Task         | This script uninstalls the agent from MAC machines.                                                       |
| [CW RMM - Task - Huntress Agent (REPAIR)](<../cwrmm/tasks/Huntress Agent (REPAIR).md>) | Task         | This task repairs the Huntress Agent.                                                                      |
| [CW RMM - Task - Huntress Agent (Reinstall)](<../cwrmm/tasks/Huntress Agent (Reinstall).md>) | Task         | This task reinstalls the Huntress Agent.                                                                   |
| [CW RMM - Task - Huntress Agent (Re-Register)](<../cwrmm/tasks/Huntress Agent (Re-Register).md>) | Task         | This task re-registers the Huntress Agent in the portal for the endpoint.                                 |
| [CW RMM - Device Group - Deploy Huntress](<../cwrmm/groups/Deploy Huntress.md>) | Device Group | Filters Windows machines where the Huntress agent is not installed.                                       |
| [CW RMM - Device Group - Deploy Huntress - Mac](<../cwrmm/groups/Deploy Huntress - Mac.md>) | Device Group | This group filters the MAC machines where the Huntress agent is not installed.                            |
| [CW RMM - Device Group - Machines with Huntress Agent](<../cwrmm/groups/Machines with Huntress Agent.md>) | Device Group | Filters out Windows machines with the Huntress agent installed.                                           |
| [CW RMM - Monitor - HuntressAgent Service](<../cwrmm/monitors/HuntressAgent Service.md>) | Monitor      | Alerts on machines if the HuntressAgent Service is stopped and fails to restart.                          |

## Implementation

- Read all the associated documents carefully.
- Create the custom field: [Custom Fields - Huntress Acct_Key](<../cwrmm/custom-fields/Huntress Acct_Key.md>)
- Create the custom field: [Custom Fields - Huntress Org_Key](<../cwrmm/custom-fields/Huntress Org_Key.md>)
- Create the custom field: [Custom Fields - Huntress Tag](<../cwrmm/custom-fields/Huntress Tag.md>)
- Create the custom field: [Custom Fields - Exclude Huntress](<../cwrmm/custom-fields/Exclude Huntress.md>)
- Create the custom field: [Custom Fields - Exclude Huntress Deployment](<../cwrmm/custom-fields/Exclude Huntress Deployment.md>)
- Create the custom field: [Custom Fields - Huntress Deploy_Result](<../cwrmm/custom-fields/Huntress Deploy_Result.md>)
- Create the task: [Task - Huntress Agent (INSTALL)](<../cwrmm/tasks/Huntress Agent (INSTALL).md>)
- Create the task: [Task - Huntress Agent (UNINSTALL)](<../cwrmm/tasks/Huntress Agent (UNINSTALL).md>)
- Create the task: [Task - Huntress Agent (REPAIR)](<../cwrmm/tasks/Huntress Agent (REPAIR).md>)
- Create the group: [Device Group - Deploy Huntress](<../cwrmm/groups/Deploy Huntress.md>)
- Create the deployment schedule as described in this document: [Task - Huntress Agent (INSTALL)](<../cwrmm/tasks/Huntress Agent (INSTALL).md>)
- Create the group: [Device Group - Deploy Huntress - Mac](<../cwrmm/groups/Deploy Huntress - Mac.md>)
- Create the deployment schedule for MAC agents as described in this document: [Task - Huntress Agent (Install) - MAC](<../cwrmm/tasks/Huntress Agent (Install) - MAC.md>)
- Create the group: [Machines with Huntress Agent](<../cwrmm/groups/Machines with Huntress Agent.md>)
- Create the monitor: [Monitor - HuntressAgent Service](<../cwrmm/monitors/HuntressAgent Service.md>)

