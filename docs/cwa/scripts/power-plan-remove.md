---
id: '43d84d2d-f385-4bd4-938a-0989956a8a38'
slug: /43d84d2d-f385-4bd4-938a-0989956a8a38
title: 'Power Plan - Remove'
title_meta: 'Power Plan - Remove'
keywords: ['automate', 'epm', 'powerplan', 'configuration', 'script']
description: 'This document provides an implementation guide for the Remove Power Plan script within ConnectWise Automate. It includes details on file paths, sample runs, dependencies, user parameters, and output logs. Ensure the correct Power Plan name is used for successful execution.'
tags: ['software', 'windows']
draft: false
unlisted: false
---

## Summary

This is an Automate implementation of the agnostic script [EPM - Windows Configuration - Agnostic - Remove-PowerPlan](/docs/ffac4670-f9ec-4896-8338-78c92669ee53).

- **File Path:** `C:/ProgramData/_Automation/script/Remove-PowerPlan/Remove-PowerPlan.ps1`
- **File Hash (Sha256):** `5CA9E22892E872DE4020E41E6BB4840CD47BBDBBFB4002D6D622E7828D63E64F`
- **File Hash (MD5):** `D1A1BB2B61D2507BF59E10CB23D140E8`

## Sample Run

![Sample Run](../../../static/img/Power-Plan---Remove/image_1.png)

**Notes:**
- Ensure that the name of the `PowerPlan` matches exactly with the `Power Plan` column in the [EPM - Data Collection - Dataview - Power Plan - Audit [Script]](/docs/3c11e893-b78e-4dc9-a8c2-c80060da203b) dataview.
- The Active Power Plan cannot be removed from the machine directly. To remove the active power plan, you must first set another Power Plan as active on the computer before removing it. This action can be achieved using the [EPM - Windows Configuration - Script - Power Plan - Enable](/docs/a170b385-7464-478e-b1cc-d357a8840e45) script.
- The information of the removed power plan will be removed from the [EPM - Data Collection - Dataview - Power Plan - Audit [Script]](/docs/3c11e893-b78e-4dc9-a8c2-c80060da203b) dataview as well.

## Dependencies

- [EPM - Windows Configuration - Agnostic - Remove-PowerPlan](/docs/ffac4670-f9ec-4896-8338-78c92669ee53)
- [EPM - Data Collection - Script - Power Plan - Audit [DV]](/docs/6e9ec56b-ba57-48cd-8dff-e659c30d2f3d)
- [EPM - Data Collection - Dataview - Power Plan - Audit [Script]](/docs/3c11e893-b78e-4dc9-a8c2-c80060da203b)

## Variables

| Name              | Description                                         |
|-------------------|-----------------------------------------------------|
| ProjectName       | Remove-PowerPlan                                   |
| WorkingDirectory   | C:/ProgramData/_Automation/Script/Remove-PowerPlan |

## User Parameters

| Name        | Example          | Required | Description                        |
|-------------|------------------|----------|------------------------------------|
| PowerPlan   | Latest Testing    | True     | Name of the Power Plan to remove   |

## Output

- Script Log
- Dataview


