---
id: '30cfa851-01a9-4446-b06e-4b8103a34be1'
slug: /30cfa851-01a9-4446-b06e-4b8103a34be1
title: 'Remove McAfee Software'
title_meta: 'Remove McAfee Software'
keywords: ['mcafee', 'uninstall', 'script', 'endpoint', 'software']
description: 'This document provides a detailed guide on removing all McAfee products from an endpoint using Datto implementation of the agnostic script Remove-McAfeeSoftware.'
tags: ['application', 'software', 'uninstallation', 'windows']
draft: false
unlisted: false
---

## Overview
This document outlines the process to remove all McAfee products from an endpoint using the Datto implementation of the agnostic script [Remove-McAfeeSoftware](/docs/4c93e57c-0959-4f9e-9557-6f5974866782).

## Dependencies
[Remove-McAfeeSoftware](/docs/4c93e57c-0959-4f9e-9557-6f5974866782)

## Implementation  

1. Download the component [Remove McAfee Software](../../../static/attachments/Remove%20McAfee%20Software.cpt) from the attachments.

2. After downloading the attached file, click on the `Import` button
3. Select the component just downloaded and add it to the Datto RMM interface.  
![Image 1](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/template1.webp)  

## Sample Run

To execute the `component` over a specific machine, follow these steps:  

1. Select the machine you want to run the `component` on from the Datto RMM.  

2. Click on the `Quick Job` button.  
![Image 2](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/template2.webp)  

3. Search the component `Remove McAfee Software` and click on `Select`
 ![Image 3](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/template3.webp)

4.  Click `Run` to initiate the component
    ![Image 2](../../../static/img/docs/30cfa851-01a9-4446-b06e-4b8103a34be1/image1.webp)  



## Output

- stdOut  
- stdError  

## Attachments
[Remove McAfee Software](../../../static/attachments/Remove%20McAfee%20Software.cpt)