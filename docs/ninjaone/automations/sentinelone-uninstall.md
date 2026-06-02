---
id: '5b5a3254-de28-4ea1-8a7a-4f5d465ce7f1'
slug: /5b5a3254-de28-4ea1-8a7a-4f5d465ce7f1
title: 'SentinelOne Uninstall'
title_meta: 'SentinelOne Uninstall'
keywords: ['remove-sentinelone', 'remove', 'sentinelone', 'antivirus', 'uninstall']
description: 'This script uninstalls the SentinelOne agent from a Windows system. It dynamically detects the SentinelOne agent''s installation directory and executes the uninstallation process.'
tags: ['uninstallation', 'security', 'antivirus',  'software']
draft: false
unlisted: false
last_update:
  date: 2026-06-02
---

## Overview

This script uninstalls the SentinelOne agent from a Windows system. It dynamically detects the SentinelOne agent's installation directory and executes the uninstallation process.

## Sample Run

`Play Button` > `Run Automation` > `Script`  
![SampleRun1](../../../static/img/docs/b97b3d2c-ecc6-42ff-9236-36b14765c9b7/samplerun1.webp)

Search and select `SentinelOne Uninstall`
![Image1](../../../static/img/docs/5b5a3254-de28-4ea1-8a7a-4f5d465ce7f1/image3.webp)

Set the required arguments and click the `Run` button to run the script.

- **Run As:** `System`  
- **Preset Parameter:** `<Leave it Blank>`  
- **PassPhrase:** `<Required PassPhrase>`  
![Image2](../../../static/img/docs/5b5a3254-de28-4ea1-8a7a-4f5d465ce7f1/image4.webp)

**Run Automation:** `Yes`  
![RunAutomation](../../../static/img/docs/b97b3d2c-ecc6-42ff-9236-36b14765c9b7/runautomation.webp)

## Dependencies

- [Remove-SentinelOne](/docs/c64c47e7-8da3-46c6-9765-29da85addc2f)

## Parameters

| Name | Example | Accepted Values | Required | Default | Type | Description |
| ---- | ------- | --------------- | -------- | ------- | ---- | ----------- |
| PassPhrase | `ROAM GIN ELAN GWEN LOP FORK JUT REND PRY PUN KARL GULF` | | False |  | String/Text | Enter the PassPhrase to Uninstall the S1 Agent. This is required if Anti-Tamper protection is enabled. |

## Automation Setup/Import

[Automation Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/scripts/sentinelone-uninstall.ps1)

## Output

- Activity Details

## Changelog

### 2026-06-02

- Written up the better PS1, and also signed it.

### 2025-06-26

- Initial version of the document
