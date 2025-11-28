---
id: '06b6d11b-92b0-478d-9323-3f599d5caa46'
slug: /06b6d11b-92b0-478d-9323-3f599d5caa46
title: 'BlackPoint SNAP Installer - Windows'
title_meta: 'BlackPoint SNAP Installer - Windows'
keywords: ['agent','windows','deployment','blackpoint']
description: 'This script automates the deployment of the blackpoint agent installation on Windows machines by downloading the latest installer, running the installation silently, and validating that the agent has been successfully installed.'
tags:  ['windows','security','installation']
draft: false
unlisted: false
---

## Overview

This script automates the deployment and update of the AutoElevate on Windows machines by downloading the latest installer, running the installation silently, and validating that the agent has been successfully installed.

## Sample Run

`Play Button` > `Run Automation` > `Script`  

![SampleRun1](../../../static/img/docs/06b6d11b-92b0-478d-9323-3f599d5caa46/blackpoint-samplerun1.webp)

## Parameters

`Note: If the value is present under the custom filed then variables do not need to be put during the script execution. As the script get the data from either Custom filed or variables.`

| Name | Description | Type | Mandatory | Default | Options | Source |
|------|-------------|------:|:---------:|:-------:|:-------:|--------|
|BP_AccountUID | Used to hold the blackpoint Account ID | String | Yes | "" | — | cPVAL_BP_AccountUID |
| BP_Win_CompanyEXE | Used to hold the blackpoint exe name | String | No | "" | — | cPVAL-BP_Win_CompanyEXE |

## Dependencies

- [BP-Accountid](/docs/83df96df-47eb-43f4-860a-af3f686641c4)
- [BP-companyEXE](/docs/dd410db2-6305-425c-93e7-378efbf145c3)

## Automation Setup/Import

[Automation Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/scripts/black-point-deployment.ps1)

## Output

- Activity Details
