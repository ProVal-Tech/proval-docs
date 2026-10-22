---
id: '010c49eb-e316-4134-9a7d-f31deb6eb1de'
slug: /010c49eb-e316-4134-9a7d-f31deb6eb1de
title: 'Monitor Inetpub Directory Size'
title_meta: 'Monitor Inetpub Directory Size'
keywords: ['monitor', 'directory', 'datto']
description: 'Monitors the Inetpub directory size on IIS Servers and alerts when it exceeds 20 GB.'
tags: ['windows']
draft: false
unlisted: false 
last_update:
  date: 2026-10-20
---

## Overview  

Monitors the Inetpub directory size on IIS servers and generates an alert if it exceeds the specified threshold. If no threshold is provided, the default threshold is set to 20 GB.

## Implementation  

1. Download the component [Monitor Inetpub Directory Size](https://github.com/ProVal-Tech/datto-rmm/blob/main/components/monitor-inetpub-directory-size.cpt) from the attachments.

2. After downloading the attached file, click on the `Import` button
3. Select the component just downloaded and add it to the Datto RMM interface.  
![Image 1](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/template1.webp)  

## Sample Run

To implement the `component` over a policy, follow these steps:  

1. Under the `Policies> Monitoring` section, click on create policy.  

    - State the name of the policy `xPVAL - Monitor Inetpub directory size` 
    - Provide the description.  
    - State the Scope of the policy.  
    ![Image1](../../../static/img/docs/010c49eb-e316-4134-9a7d-f31deb6eb1de/image1.webp)  

    - Within the Monitors section, click on `Add Monitor`.  
    ![Image2](../../../static/img/docs/010c49eb-e316-4134-9a7d-f31deb6eb1de/image2.webp)     

    - Under the `Monitor Type`, click on `Select` and then select the `Component`option.  
![image3](../../../static/img/docs/010c49eb-e316-4134-9a7d-f31deb6eb1de/image3.webp).  

    -  Inorder to configure your `component` via alerting, follow the below steps:  
        - Click on `Select a Component Monitor` and then select the component `Monitor Inetpub Directory Size` from the search bar.
        - Set the `Threshold` Value as per requirement. Leave it blank to set threshold to 20GB.
        - Set the interval to `execute the component monitor`.  
        - Select the `priority to raise an alert`.  
        - Select the time to `auto resolve the alert`.
        - Select `Create Ticket` Option.
        - Set Subject line to `Inetpub directory size threshold exceeded`
        ![Image4](../../../static/img/docs/010c49eb-e316-4134-9a7d-f31deb6eb1de/image4.webp) 
        ![Image5](../../../static/img/docs/010c49eb-e316-4134-9a7d-f31deb6eb1de/image5.webp)      
        - Click on `Add Monitor`.  

3. Click on `Add Target` to provide the targeted machines.  
4. Select `IIS Webservers` from the Device Filters.
  ![Image6](../../../static/img/docs/010c49eb-e316-4134-9a7d-f31deb6eb1de/image6.webp) 
5. Click on `Save and Deploy Now` to save the policy.

## Datto Variables

| Variable Name | Type | Default | Description |
| ------------- | ---- | ------- | ----------- |
| Threshold | String | 20 | Enter the directory size threshold in GB. The script will generate an error if the directory size exceeds the specified threshold. The default value is 20 GB. For example, enter 15 to set the monitoring threshold to 15 GB. |


## Output

- stdOut  
- stdError  

## Attachments  

[Monitor Inetpub Directory Size](https://github.com/ProVal-Tech/datto-rmm/blob/main/components/monitor-inetpub-directory-size.cpt)

## Changelog

### 2026-10-20

- Added a custom variable to the script to configure the threshold.

### 2026-10-15

- Initial version of the document
