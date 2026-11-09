---
id: '10d97d05-1a88-4144-83b5-90c1b2eb5bc2'
slug: /10d97d05-1a88-4144-83b5-90c1b2eb5bc2
title: 'Check Uptime and Reboot Pending Flag'
title_meta: 'Check Uptime and Reboot Pending Flag'
keywords: ['check', 'uptime', 'reboot-pending', 'reboot-flag']
description: ''
tags: ['alerting', 'reboot', 'update', 'monitoring']
draft: false
unlisted: false
last_update:
  date: 2026-11-09
---

## Overview

Checks system uptime and pending reboot status on a Windows endpoint. Recommends a reboot when the system uptime exceeds the configured threshold or when a pending reboot is detected. If no threshold is provided, only the pending reboot check is evaluated.

## Import

1. Download the component [Check Uptime and Reboot Pending Flag](https://github.com/ProVal-Tech/datto-rmm/blob/main/components/check-uptime-and-reboot-pending-flag.cpt) from the attachments.

2. After downloading the file, click on the `Import` button in the Datto RMM interface.

3. Select the component just downloaded and add it to the Datto RMM interface.  
  ![Image 1](../../../static/img/docs/10d97d05-1a88-4144-83b5-90c1b2eb5bc2/import.webp)  


For detailed instructions on importing a Datto component, see [Workflow for Implementing Engineers](https://github.com/ProVal-Tech/datto-rmm#-workflow-for-implementing-engineers).

To implement the `Check Uptime and Reboot Pending Flag` over a policy, follow these steps:  

## Implementation

1. Under the `Policies > Monitoring` section, click on create policy.  
  ![Image1](../../../static/img/docs/10d97d05-1a88-4144-83b5-90c1b2eb5bc2/Create-policy.webp)

    - State the name of the policy `xPVAL Uptime and Reboot check` 
    - Provide the description.  
    - State the Scope of the policy.  
    ![Image1](../../../static/img/docs/10d97d05-1a88-4144-83b5-90c1b2eb5bc2/craetepolicy-setting.webp)  

    - Within the Monitors section, click on `Add Monitor`.  
    ![Image2](../../../static/img/docs/010c49eb-e316-4134-9a7d-f31deb6eb1de/image2.webp)     
   
    - Under the `Monitor Type`, click on `Select` and then select the `Component`option.  
    ![image3](../../../static/img/docs/10d97d05-1a88-4144-83b5-90c1b2eb5bc2/monitor.webp).

    ### Add Alert

    -  Inorder to configure your `component` via alerting, follow the below steps:  
        - Click on `Select a Component Monitor` and then select the component `Check Uptime and Reboot Pending Flag` from the search bar.
        - Set the `ThresholdDays` Value as per requirement. 
        - Set the interval to `execute the component monitor`.  
        ![image3](../../../static/img/docs/10d97d05-1a88-4144-83b5-90c1b2eb5bc2/alerting.webp)

    ### Response
      - Click Run a component `Reboot Nag [Restart Alert] [Prompter]`.
      - Update the variables of reboot Nag.
      ![image3](../../../static/img/docs/10d97d05-1a88-4144-83b5-90c1b2eb5bc2/rebootnag.webp)
      - Click Save

3. Click on `Add Target` to provide the targeted machines.  
  ![Image6](../../../static/img/docs/10d97d05-1a88-4144-83b5-90c1b2eb5bc2/updated-monitor.webp) 
5. Click on `Save and Deploy Now` to save the policy.

## Datto Variables

| Variable Name | Type | Default | Description |
| ------------- | ---- | ------- | ----------- |
| `ThresholdDays` | `String` | -- | `Please enter the number of uptime days.` |

## Output

- Alert Tab

## Attachments

- [Check Uptime and Reboot Pending Flag](https://github.com/ProVal-Tech/datto-rmm/blob/main/components/check-uptime-and-reboot-pending-flag.cpt)

## Changelog

### 2026-11-09

- Initial version of the document
