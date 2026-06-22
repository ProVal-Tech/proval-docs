---
id: '6ea2b1cf-0329-4622-b681-25659af9cae7'
slug: /6ea2b1cf-0329-4622-b681-25659af9cae7
title: 'Repair Windows Update'
title_meta: 'Repair Windows Update'
keywords: ['repair', 'windows', 'update', 'settings', 'script', 'dism', 'sfcscan']
description: 'This document outlines a script designed to repair and reset Windows update settings, aiming to resolve potential patching issues on Windows devices. It details the script’s dependencies, global and user parameters, process, and expected output, including logging of successes and failures.'
tags: ['performance', 'software', 'update', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-06-22
---

## Overview
This script attempts to repair and reset Windows update settings using the ProVal script: [Repair-WindowsUpdate](/docs/39345bfd-d9e2-4e68-9d7a-3e8b443140cc)  
The goal of this script is to fix potential patching issues for Windows devices.

## Dependencies

[Repair-WindowsUpdate](/docs/39345bfd-d9e2-4e68-9d7a-3e8b443140cc)


## Implementation  

1. Download the component [Repair Windows Update](../../../static/attachments/repair-windows-udpate.cpt) from the attachments.

2. After downloading the attached file, click on the `Import` button
3. Select the component just downloaded and add it to the Datto RMM interface.  
![Image 1](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/template1.webp)  

## Sample Run

To execute the `Repair Windows Update` over a specific machine, follow these steps:  

1. Select the machine you want to run the `Repair Windows Update` on from the Datto RMM.  

2. Click on the `Quick Job` button.  
![Image 2](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/template2.webp)  

3. Search the component `Repair Windows Update` and click on `Select`   
 ![Image 3](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/template3.webp)

4. Select the desired action to perform and click Run   
![Image 1](../../../static/img/docs/6ea2b1cf-0329-4622-b681-25659af9cae7/image1.webp) 

## Datto Variables

| Variable Name | Type | Default | Description |
| ------------- | ---- | ------- | ----------- |
|SfcScan | Boolean|False|Performs a System File Check (sfc /scannow)|
|DISMRepair| Boolean|False|Performs a DISM repair (dism /Online /Cleanup-Image /RestoreHealth)|


## Output

- stdOut  
- stdError  

## Attachments  

[Repair Windows Update](../../../static/attachments/repair-windows-udpate.cpt)

## Changelog
 
### 2026-06-22

- Initial version of the document
