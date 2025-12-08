---
id: '45b83c20-5a25-4321-a253-5239633ecbd4'
slug: /45b83c20-5a25-4321-a253-5239633ecbd4
title: 'AutoElevate Agent Deployment'
title_meta: 'AutoElevate Agent Deployment'
keywords: ['agent','windows','deployment','elevate']
description: 'This script automates the deployment of the AutoElevate Agent on Windows machines by downloading the latest installer, running the installation silently, and validating that the agent has been successfully installed.'
tags:  ['windows','security','installation']
draft: false
unlisted: false
---

## Overview

This script automates the deployment and update of the AutoElevate on windows machines by downloading the latest installer, running the installation silently, and validating that the agent has been successfully installed.

## Sample Run

`Play Button` > `Run Automation` > `Script`

![SampleRun1](../../../static/img/docs/45b83c20-5a25-4321-a253-5239633ecbd4/scriptrun.webp)

## Parameters

**Note:** `If the value is present under the custom field then variables do not need to be put during the script execution. As the script get the data from either Custom field or variables.`

| Name | Description | Type | Mandatory | Default | Options | Source |
|------|-------------|------:|:---------:|:-------:|:-------:|--------|
| License_key | Stores the AutoElevate License Key required for activating the agent during installation. | `String/text` | Yes | — | — | `cPVAL License_Key` |
| Elevation_Mode | Defines how AutoElevate handles privilege elevation requests during deployment (Live, Audit, or Policy mode). | `Drop-Down` | Yes | `Audit` | `Live`, `Audit`, `Policy` | `cPVAL Elevation_Mode` |
| Blocker_Mode | Determines how AutoElevate responds to blocked or unauthorized elevation attempts `(Disabled, Audit, or Live)`. | `Drop-Down` | Yes | `Disabled` | `Disabled`, `Audit`, `Live` | `cPVAL Blocker_Mode` |

## Dependencies

The script is dependent on below custom fileds during the deployment.

- [Custom Field - Blocker Mode](/docs/dba79f8f-132d-41cd-ae1c-6da6964bc418)
- [Custom Field - Elevation Mode](/docs/03094753-93f5-41da-8a0a-d948b1165b88)
- [Custom Field - License Key](/docs/370d64a2-0799-48ca-9661-d24bd75b7f67)
- [Solution Document - AutoElevate Deployment - NinjaOne](/docs/58fe4653-c2ac-49d3-bdf5-b8ba1e50f0c9)

## Automation Setup/Import

[Automation Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/scripts/autoelevate-install.ps1)

## Output

- Activity Details
