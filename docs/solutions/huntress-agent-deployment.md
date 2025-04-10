---
id: '0c1599a5-7c64-41a2-8900-9eba22b1b0c1'
slug: /0c1599a5-7c64-41a2-8900-9eba22b1b0c1
title: 'Huntress Agent Deployment'
title_meta: 'Huntress Agent Deployment'
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
| [CW RMM - Custom Fields - Huntress Acct_Key](/docs/b8ce44cf-a4a7-4b17-a292-43615b2b192a) | Custom Field | This custom field is to be filled with the Huntress Account Key                                           |
| [CW RMM - Custom Fields - Huntress Org_Key](/docs/00d66215-fe07-4bae-b6cb-d96a73486694) | Custom Field | This custom field is to be filled with the Huntress Organization Key                                      |
| [CW RMM - Custom Fields - Huntress Tag](/docs/30690dec-ecd0-448f-8429-24a5d2854953) | Custom Field | This custom field is to be filled with the Huntress Tag                                                  |
| [CW RMM - Custom Fields - Exclude Huntress](/docs/a65dbf66-6cfe-4136-aba1-0b75b3068485) | Custom Field | Select this custom field to exclude a site from Huntress Deployment                                       |
| [CW RMM - Custom Fields - Exclude Huntress Deployment](/docs/caedfebd-73ec-43cb-a978-02283622f430) | Custom Field | Select this custom field to exclude a machine from Huntress Deployment                                     |
| [CW RMM - Custom Fields - Huntress Deploy_Result](/docs/822e9dc0-d455-4706-8482-175b85dbd491) | Custom Field | The task [CW RMM - Task - Huntress Agent (INSTALL)](/docs/e1f40d15-13f1-465e-9870-653927ad0434) utilizes this custom field to store the number of times the task failed to install Huntress on the machine |
| [CW RMM - Task - Huntress Agent (INSTALL)](/docs/e1f40d15-13f1-465e-9870-653927ad0434) | Task         | Installs the Huntress agent on the Windows machine if it is not already installed.                        |
| [CW RMM - Task - Huntress Agent (Install) - MAC](/docs/3a0c2a5d-0d46-4c3b-b0a7-bdffd60c6fd2) | Task         | This task checks if Huntress is installed. If not, it attempts to install the agent and log the result for MAC machines. |
| [CW RMM - Task - Huntress Agent (UNINSTALL)](/docs/12b83efc-afab-463a-a26e-d94e9e963d96) | Task         | Uninstalls the Huntress agent on Windows machines.                                                         |
| [CW RMM - Task - Huntress Agent (Uninstall) - MAC](/docs/d21f56f3-43d8-4080-a7f0-ae57c27465e2) | Task         | This script uninstalls the agent from MAC machines.                                                       |
| [CW RMM - Task - Huntress Agent (REPAIR)](/docs/ebe382f4-d3cb-47be-84e1-c82009fd745a) | Task         | This task repairs the Huntress Agent.                                                                      |
| [CW RMM - Task - Huntress Agent (Reinstall)](/docs/cdcd950b-9843-4fed-bea8-7a4092c7eadc) | Task         | This task reinstalls the Huntress Agent.                                                                   |
| [CW RMM - Task - Huntress Agent (Re-Register)](/docs/91408668-745e-49f8-8ed3-020c68faf754) | Task         | This task re-registers the Huntress Agent in the portal for the endpoint.                                 |
| [CW RMM - Device Group - Deploy Huntress](/docs/c19dc248-c6a0-4f9c-88c5-b3058245d74a) | Device Group | Filters Windows machines where the Huntress agent is not installed.                                       |
| [CW RMM - Device Group - Deploy Huntress - Mac](/docs/a2195808-ed8d-4f56-9c17-d5ebaf0cf5b2) | Device Group | This group filters the MAC machines where the Huntress agent is not installed.                            |
| [CW RMM - Device Group - Machines with Huntress Agent](/docs/7fc0874b-154c-49c0-aed4-a89be18798f4) | Device Group | Filters out Windows machines with the Huntress agent installed.                                           |
| [CW RMM - Monitor - HuntressAgent Service](/docs/57b02fcd-0a4e-4c90-93d8-f81caa4c0835) | Monitor      | Alerts on machines if the HuntressAgent Service is stopped and fails to restart.                          |

## Implementation

- Read all the associated documents carefully.
- Create the custom field: [Custom Fields - Huntress Acct_Key](/docs/b8ce44cf-a4a7-4b17-a292-43615b2b192a)
- Create the custom field: [Custom Fields - Huntress Org_Key](/docs/00d66215-fe07-4bae-b6cb-d96a73486694)
- Create the custom field: [Custom Fields - Huntress Tag](/docs/30690dec-ecd0-448f-8429-24a5d2854953)
- Create the custom field: [Custom Fields - Exclude Huntress](/docs/a65dbf66-6cfe-4136-aba1-0b75b3068485)
- Create the custom field: [Custom Fields - Exclude Huntress Deployment](/docs/caedfebd-73ec-43cb-a978-02283622f430)
- Create the custom field: [Custom Fields - Huntress Deploy_Result](/docs/822e9dc0-d455-4706-8482-175b85dbd491)
- Create the task: [Task - Huntress Agent (INSTALL)](/docs/e1f40d15-13f1-465e-9870-653927ad0434)
- Create the task: [Task - Huntress Agent (UNINSTALL)](/docs/12b83efc-afab-463a-a26e-d94e9e963d96)
- Create the task: [Task - Huntress Agent (REPAIR)](/docs/ebe382f4-d3cb-47be-84e1-c82009fd745a)
- Create the group: [Device Group - Deploy Huntress](/docs/c19dc248-c6a0-4f9c-88c5-b3058245d74a)
- Create the deployment schedule as described in this document: [Task - Huntress Agent (INSTALL)](/docs/e1f40d15-13f1-465e-9870-653927ad0434)
- Create the group: [Device Group - Deploy Huntress - Mac](/docs/a2195808-ed8d-4f56-9c17-d5ebaf0cf5b2)
- Create the deployment schedule for MAC agents as described in this document: [Task - Huntress Agent (Install) - MAC](/docs/3a0c2a5d-0d46-4c3b-b0a7-bdffd60c6fd2)
- Create the group: [Machines with Huntress Agent](/docs/7fc0874b-154c-49c0-aed4-a89be18798f4)
- Create the monitor: [Monitor - HuntressAgent Service](/docs/57b02fcd-0a4e-4c90-93d8-f81caa4c0835)


