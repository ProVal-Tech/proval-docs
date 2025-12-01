---
id: 'f65a7e4b-1120-4ed3-8444-a3d1f4245a78'
slug: /f65a7e4b-1120-4ed3-8444-a3d1f4245a78
title: 'Install Zoom Windows VDI'
title_meta: 'Install Zoom Windows VDI'
keywords: ['application', 'windows', 'datto', 'zoom', 'vdi']
description: 'This script checks whether Zoom Windows VDI is already installed on the system. If not found, it downloads the Zoom VDI Universal Plugin and installs it silently.'
tags: ['datto', 'application', 'windows']
draft: false
unlisted: false
---

## Overview  

This script checks whether Zoom Windows VDI is already installed on the system. If not found, it downloads the Zoom VDI Universal Plugin and installs it silently.

## Implementation  

1. Download the component [Install Zoom Windows VDI](../../../static/attachments/Install%20Zoom%20Windows%20VDI.cpt) from the attachments.

2. After downloading the attached file, click on the `Import` button
3. Select the component just downloaded and add it to the Datto RMM interface.  
![Image 1](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/template1.webp)  

## Sample Run

To execute the `component` over a specific machine, follow these steps:  

1. Select the machine you want to run the `component` on from the Datto RMM.  

2. Click on the `Quick Job` button.  
![Image 2](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/template2.webp)  

3. Search the component `Install Zoom Windows VDI` and click on `Select`
 ![Image 3](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/template3.webp)

4. After selecting the compoment you'll receive a popup.
5. Click on `Run` to execute it.  
![Image 4](../../../static/img/docs/f65a7e4b-1120-4ed3-8444-a3d1f4245a78/S1.webp)


## Output  
A job status of `Success` is expected.  
- `Activity Log`  
![Image 5](../../../static/img/docs/f65a7e4b-1120-4ed3-8444-a3d1f4245a78/S2.webp)
- `StdErr`  
 StdErr is not expected.

## Attachments  

[Install Zoom Windows VDI](../../../static/attachments/Install%20Zoom%20Windows%20VDI.cpt)