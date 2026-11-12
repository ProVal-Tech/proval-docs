---
id: '10d97d05-1a88-4144-83b5-90c1b2eb5bc2'
slug: /10d97d05-1a88-4144-83b5-90c1b2eb5bc2
title: 'Check Uptime and Reboot Pending Flag'
title_meta: 'Check Uptime and Reboot Pending Flag'
keywords: ['check', 'uptime', 'reboot-pending', 'reboot-flag']
description: 'Checks system uptime and pending reboot status on a Windows endpoint. Conditionally runs each check based on the UptimeDays and PendingReboot environment variables passed by Datto RMM.'
tags: ['alerting', 'reboot', 'update', 'monitoring']
draft: false
unlisted: false
last_update:
  date: 2026-11-09
---

## Overview

Checks system uptime and pending reboot status on a Windows endpoint. Conditionally runs each check based on the UptimeDays and PendingReboot environment variables passed by Datto RMM.

## Import

1. Download the component [Check Uptime and Reboot Pending Flag](https://github.com/ProVal-Tech/datto-rmm/blob/main/components/check-uptime-and-reboot-pending-flag.cpt) from the attachments.

2. After downloading the file, click on the `Import` button in the Datto RMM interface.

3. Select the component just downloaded and add it to the Datto RMM interface.  

  - ![Image 1](../../../static/img/docs/10d97d05-1a88-4144-83b5-90c1b2eb5bc2/import.webp)  


For detailed instructions on importing a Datto component, see [Workflow for Implementing Engineers](https://github.com/ProVal-Tech/datto-rmm#-workflow-for-implementing-engineers).

To implement the `Check Uptime and Reboot Pending Flag` over a policy, follow these steps:  

## Implementation

1. Under the `Policies > Monitoring` section, click on create policy.  
  ![Image1](../../../static/img/docs/10d97d05-1a88-4144-83b5-90c1b2eb5bc2/Create-policy.webp)

    - State the name of the policy `xPVAL Uptime and Reboot check` 
    - Provide the description.  
    - State the Scope of the policy.  

    - ![Image1](../../../static/img/docs/10d97d05-1a88-4144-83b5-90c1b2eb5bc2/policy1.webp)  

    - Within the Monitors section, click on `Add Monitor`.  

    - ![Image2](../../../static/img/docs/010c49eb-e316-4134-9a7d-f31deb6eb1de/image2.webp)     
   
    - Under the `Monitor Type`, click on `Select` and then select the `Component`option.  
    
    - ![image3](../../../static/img/docs/10d97d05-1a88-4144-83b5-90c1b2eb5bc2/monitor.webp).

    ### Add Alert

    -  Inorder to configure your `component` via alerting, follow the below steps:  
        - Click on `Select a Component Monitor` and then select the component `Check Uptime and Reboot Pending Flag` from the search bar.
        - Set the `UptimeDays` and `PendingReboot` Value as per requirement. 
        - Set the interval to `execute the component monitor`. 

        - ![image3](../../../static/img/docs/10d97d05-1a88-4144-83b5-90c1b2eb5bc2/monitor1.webp)

    ### Response

      - Click Run a component `Reboot Nag [Restart Alert] [Prompter]`.
      - Update the variables of reboot Nag.
      
      - ![image3](../../../static/img/docs/10d97d05-1a88-4144-83b5-90c1b2eb5bc2/rebootnag.webp)

      - Click Save

3. Click on `Add Target` to provide the targeted machines.  
  
  - ![Image6](../../../static/img/docs/10d97d05-1a88-4144-83b5-90c1b2eb5bc2/save-monitor.webp) 

5. Click on `Save and Deploy Now` to save the policy.

## Datto Variables

| Variable Name | Type | Default | Description |
| ------------- | ---- | ------- | ----------- |
| `UptimeDays` | `String` | `0` | `Please enter the number of uptime days.` |
| `PendingReboot` | `Boolean` | `True` | `Please set false if the pending reboot do not need to check.` |

## Output

- Alert Tab

## Attachments

- [Check Uptime and Reboot Pending Flag](https://github.com/ProVal-Tech/datto-rmm/blob/main/components/check-uptime-and-reboot-pending-flag.cpt)

## Changelog

### 2026-11-09

- Initial version of the document
