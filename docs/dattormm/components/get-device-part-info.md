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

## Sample Run

To execute the `component` over a specific machine, follow these steps:  

1. Select the machine you want to run the `component` on from the Datto RMM.  

2. Click on the `Quick Job` button.  
![Image 2](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/template2.webp)  

3. Search the component within the search bar `Get-Device Part Info` and click on `Select`  
 ![Image 3](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/template3.webp)  

 4. After selecting the `component`, you will notice a below pop-up to define a UDF.  

 5. Input the `ID of the UDF` to populate the data upon, and then click on `Run`.
![Image 4](../../../static/img/docs/a4ad64c9-7b85-4d7d-9be1-e11b842f3ef5/Snapshot1.webp)
## Datto Variables

| Variable Name | Type | Default | Description |
| ------------- | ---- | ------- | ----------- |
| usrUDF | String |  | Enter the UDF ID to store the Output |

## Output

- stdOut  
- stdError  

## Attachments

[Get-Device Part Info](../../../static/attachments/get-device-part-info.cpt)