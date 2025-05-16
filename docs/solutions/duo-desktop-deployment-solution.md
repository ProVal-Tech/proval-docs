---
id: '8adb49f7-d8be-4725-a136-bc59e185743c'
slug: /8adb49f7-d8be-4725-a136-bc59e185743c
title: 'DUO Desktop Deployment Solution'
title_meta: 'DUO Desktop Deployment Solution'
keywords: ['DUO', 'Desktop', 'Security', 'Authentication', 'Token', 'Install', 'Update']
description: 'This solution contains the content for the auto-deployment/on demand execution of the DUO Desktop application'
tags: ['software', 'security', 'windows']
draft: false
unlisted: false
---

## Purpose
This solution contains the content for the auto-deployment/on demand execution of the DUO Desktop application

## Associated Content

| **Name**                                               | **Type**           | **Description**                                                                                                                                         |
|--------------------------------------------------------|--------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------|
| [Script - DUO Desktop - Install/Upgrade](/docs/c0019fe0-7411-4c3d-981b-f2bb70733c26)                    | Script             | This script performs the installation/upgrade of the DUO Desktop to the latest version.                                                                |
| [Monitor - DUO Desktop - Latest Version Detection](/docs/c2082154-028d-40fc-beb4-2e8137d2aa57)| Internal Monitor   | This monitor is designed to fetch the latest version of the DUO Desktop every month and store it in the system property `DUO_Desktop_Latest_Version`. |
| [Monitor - DUO Desktop - Install/Update](/docs/af4b8838-ad2d-4b77-90ce-4447873c4b5c) | Internal Monitor   | This internal monitor is built to upgrade the DUO Desktop every month if a newer version is released. It also provides an option to install the application with the upgrade. |
| **Alert Template - △ Custom - Execute Script - DUO Desktop** | Alert Template   | This alert template is build to run with both monitors [Monitor - DUO Desktop - Install/Update](/docs/af4b8838-ad2d-4b77-90ce-4447873c4b5c) and [Monitor - DUO Desktop - Latest Version Detection](/docs/c2082154-028d-40fc-beb4-2e8137d2aa57) to run the [Script - DUO Desktop - Install/Upgrade](/docs/c0019fe0-7411-4c3d-981b-f2bb70733c26) as an autofix for the latest version detection and the install/upgrade deployment respectively
 |


## Implementation

- Import the [Script - DUO Desktop - Install/Upgrade](/docs/c0019fe0-7411-4c3d-981b-f2bb70733c26) 
- Import the [Monitor - DUO Desktop - Install/Update](/docs/af4b8838-ad2d-4b77-90ce-4447873c4b5c)
- Import the [Monitor - DUO Desktop - Latest Version Detection](/docs/c2082154-028d-40fc-beb4-2e8137d2aa57)
- Import the **Alert Template - △ Custom - Execute Script - DUO Desktop** |

- Navigate to the Automation->Monitors
- Apply the **Alert Template - △ Custom - Execute Script - DUO Desktop** with both the monitors [Monitor - DUO Desktop - Install/Update](/docs/af4b8838-ad2d-4b77-90ce-4447873c4b5c) and [Monitor - DUO Desktop - Latest Version Detection](/docs/c2082154-028d-40fc-beb4-2e8137d2aa57) to run the [Script - DUO Desktop - Install/Upgrade](/docs/c0019fe0-7411-4c3d-981b-f2bb70733c26) as an autofix for the latest version detection and the install/upgrade deployment respectively.
- Run now and reset the monitor.


## FAQ