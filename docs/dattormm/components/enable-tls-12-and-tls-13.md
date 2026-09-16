---
id: 'c78243b9-5811-451e-b714-b748246574e2'
slug: /c78243b9-5811-451e-b714-b748246574e2
title: 'Enable TLS 1.2 and TLS 1.3'
title_meta: 'Enable TLS 1.2 and TLS 1.3'
keywords: ['tls','ssl','disable','enable','security-hardening','tls-1.2']
description: 'Enables supported TLS 1.2 and TLS 1.3 protocols for Windows client and server communication.'
tags: ['azure', 'windows']
draft: false
unlisted: false 
last_update:
  date: 2026-09-16
---

## Overview

Enables supported TLS 1.2 and TLS 1.3 protocols for Windows client and server communication.

## Implementation  

1. Download the component from the [`datto-rmm` repository](https://github.com/ProVal-Tech/datto-rmm):
   [Enable TLS 1.2 and TLS 1.3](https://github.com/ProVal-Tech/datto-rmm/blob/main/components/enable-tls-12-and-tls-13.cpt)

2. After downloading the file, click on the `Import` button in the Datto RMM interface.

3. Select the component just downloaded and add it to the Datto RMM interface.  
![Image 1](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/template1.webp)  

4. After Importing the component to the Datto RMM, make sure to add the component to the `PVAL` Group always.  
    - Steps to Add the component under `PVAL` Group.  
    i. Click on `Drop Down Icon`.  
    ii. Click on `Add to Group`.  
    ![Image 4](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/Image1.webp)  
    iii. Select the group as `PVAL`  
    ![Image 5](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/Image2.webp)


## Sample Run

To execute the `component` over a specific machine, follow these steps:  

1. Select the machine you want to run the `component` on from the Datto RMM.  

2. Click on the `Quick Job` button.  
![Image 2](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/template2.webp)  

3. Search the component `Enable TLS 1.2 and TLS 1.3` and click on `Select`
 ![Image 3](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/template3.webp)

4. Click on `Run` to execute the script:  
![Image](../../../static/img/docs/c78243b9-5811-451e-b714-b748246574e2/image1.webp)


## Datto Variables

| Variable Name | Type | Default | Description |
| ------------- | ---- | ------- | ----------- |
| ForceReboot | Boolean | False | Select this option to reboot the machine and apply the changes immediately |

## Output

- stdOut  
- stdError

## Attachments  

- [Enable TLS 1.2 and TLS 1.3](https://github.com/ProVal-Tech/datto-rmm/blob/main/components/enable-tls-12-and-tls-13.cpt)

## Changelog
 
### 2026-09-16
 
- Initial version of the document