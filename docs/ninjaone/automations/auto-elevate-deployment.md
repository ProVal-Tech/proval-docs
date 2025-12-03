---
id: '45b83c20-5a25-4321-a253-5239633ecbd4'
slug: /45b83c20-5a25-4321-a253-5239633ecbd4
title: 'AutoElevate Agent Deployment'
title_meta: 'AutoElevate Agent Deployment Script'
keywords: ['agent','windows','deployment','elevate']
description: 'This script automates the deployment of the AutoElevate Agent on Windows machines by downloading the latest installer, running the installation silently, and validating that the agent has been successfully installed.'
tags:  ['windows','security','installation']
draft: false
unlisted: false
---

## Overview

This script automates the deployment and update of the AutoElevate on Windows machines by downloading the latest installer, running the installation silently, and validating that the agent has been successfully installed.

## Sample Run

`Play Button` > `Run Automation` > `Script` 

![SampleRun1](../../../static/img/docs/45b83c20-5a25-4321-a253-5239633ecbd4/scriptrun1.webp)

## Parameters

**Note:** `If the value is present under the custom field then variables do not need to be put during the script execution. As the script get the data from either Custom field or variables.`

| Name | Description | Type | Mandatory | Default | Options | Source |
|------|-------------|------:|:---------:|:-------:|:-------:|--------|
| LICENSE_KEY | AutoElevate license key for agent activation | String | Yes | — | — | `cPVAL License Key` Custom Field |
| COMPANY_NAME | Organization name for agent identification | String | No | "UnknownCompany" | — | `cPVAL Ninja Organization Name` Custom Field |
| LOCATION_NAME | Location name for agent organization | String | No | "Main" | — | `cPVAL Ninja Location` Name Custom Field |
| ELEVATION_MODE | AutoElevate elevation mode setting | String | No | "audit" | "audit", "enforce" | `cPVAL Elevation Mode` Custom Field |
| BLOCKER_MODE | AutoElevate blocker mode setting | String | No | "Disabled" | "Disabled", "Enabled" | `cPVAL Blocker_Mode` Custom Field |

## Dependencies

- [cPVAL Blocker_Mode](/docs/dba79f8f-132d-41cd-ae1c-6da6964bc418)
- [cPVAL Elevation Mode](/docs/03094753-93f5-41da-8a0a-d948b1165b88)
- [cPVAL License_Key](/docs/370d64a2-0799-48ca-9661-d24bd75b7f67)
- [cPVAL Ninja Location Name](/docs/4bfe4881-3687-4a30-bf00-d85067d5c6d8)
- [cPVAL Ninja Organization Name](/docs/f6050cf6-67c8-4563-888e-8f34651cf4bb)

## Automation Setup/Import

[Automation Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/scripts/autoelevate-install.ps1)

## Output

- Activity Details
