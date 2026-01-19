---
id: 'db76a502-1c00-4105-9458-a0530ddf5fe0'
slug: /db76a502-1c00-4105-9458-a0530ddf5fe0
title: 'AutoElevate Deployment'
title_meta: 'AutoElevate Deployment'
keywords: ['autoelevate', 'cyberfox']
description: 'This solution provides feature to install and uninstall the autoelevate application silently for the MAC and Windows'
tags: ['installation', 'deployment', 'application', 'uninstallation']
draft: false
unlisted: false
---

## Purpose

This solution provides feature to install and uninstall the AutoElevate application silently for the MAC and Windows.

## Associated Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [AutoElevate Install - [MAC/Windows]](/docs/89cb899c-e0ea-438f-903e-0bea83eb8f6c)      | Script | It installs the AutoElevate to both MAC and Windows OS. |
| [AutoElevate Deployment](/docs/5ef04731-9532-4b2c-b1fc-d18ad7d7a44e) | Internal Monitor | This monitor helps to deploy the AutoElevate to the Windows and MAC agents. |
| **△ Custom - Execute Script - AutoElevate Install** | Alert Template | This alert template is required to be applied with the monitor to set the automation for the AutoElevate deployment |

## Optional Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [AutoElevate Uninstall](/docs/eecaf7d2-d98a-49ba-9479-7bc84476c3de) | Script | This script assists in uninstalling the AutoElevate applications from the Windows agent. **Note: IT IS NOT RECOMMEND TO PERFORM UNINSTALLATION VIA SCRIPT IF THE AGENT HAS BEEN INSTALLED FOR ANY LENGTH OF TIME AND IS BEING REPORTED IN THE AE ADMIN PORTAL.** |

## Implementation

- Import the [Script - AutoElevate Install - [MAC/Windows]](/docs/89cb899c-e0ea-438f-903e-0bea83eb8f6c)
- Import the alert template `△ Custom - Execute Script - AutoElevate Install`
- Import the [Monitor - ProVal - Production - AutoElevate Deployment](/docs/5ef04731-9532-4b2c-b1fc-d18ad7d7a44e)
- Apply the alert template to the monitor and Save the monitor
- Right Click and select `Run Now and Reset Monitor`.
- Import the [Script - AutoElevate Uninstall](/docs/eecaf7d2-d98a-49ba-9479-7bc84476c3de). This script assists in uninstalling the AutoElevate applications from the Windows agent, but it is not recommended for use. Therefore, we have left it as an optional script to use on demand.

## FAQ

**Q. Can this solution create a ticket during installation failure?**
  
**A.** Yes, you just need to set the ticket category at the monitor level to receive a failed installation ticket.
