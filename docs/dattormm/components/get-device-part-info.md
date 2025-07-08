---
id: 'a4ad64c9-7b85-4d7d-9be1-e11b842f3ef5'
slug: /a4ad64c9-7b85-4d7d-9be1-e11b842f3ef5
title: 'Get-Device Part Info'
title_meta: 'Get-Device Part Info'
keywords: ['datto', 'windows', 'part-number', 'part']
description: 'This PowerShell script retrieves the hardware part number from a physical Windows workstation based on its manufacturer. It supports HP and Lenovo devices by identifying the appropriate attribute (either SystemSKUNumber or Model) and outputs the result.  Important:This script is designed to run only on physical workstations. It may not return valid results on virtual machines or cloud-based systems where hardware information is abstracted or unavailable.'
tags: ['windows', 'datto']
draft: false
unlisted: false
---

## Overview  

This PowerShell script retrieves the hardware part number from a physical Windows workstation based on its manufacturer. `It supports HP and Lenovo devices by identifying the appropriate attribute` (either SystemSKUNumber or Model) and outputs the result.  

**Important:** 
- This script is designed to run only on HP and Lenovo devices. 
- It may not return valid results on virtual machines or cloud-based systems where hardware information is abstracted or unavailable.  

## Dependencies  

Create a filter that includes manufacturer as `HP` OR `Lenovo` to get a better view over the machines.

## Implementation  

1. Download the `component` [Get-Device Part Info](../../../static/attachments/get-device-part-info.cpt) from attachments.

2. After downloading the attached file, click on the `Import` button
3. Select the component just downloaded and add it to the Datto RMM interface.   
![Image 1](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/template1.webp)

## Datto Variables

| Variable Name | Type | Default | Description |
| ------------- | ---- | ------- | ----------- |
| usrUDF | String | 0 | Enter the UDF ID to store the Secure Boot Check Status |

## Output

- stdOut  
- stdError  

## Attachments

[Get-Device Part Info](../../../static/attachments/get-device-part-info.cpt)