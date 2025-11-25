---
id: '0289f7dd-f98f-47a3-a957-fc3b9ab36cda'
slug: /0289f7dd-f98f-47a3-a957-fc3b9ab36cda
title: 'Disk Health Checkup'
title_meta: 'Disk Health Checkup'
keywords: ['disk', 'ntfs', 'error', 'datto']
description: 'Monitors Windows Event Logs for disk and NTFS errors (Event IDs: 55, 7, 33, 52, 57) in the last 24 hours. If found, reports the error with event ID and timestamp. Also checks Wininit Event ID 1001 to confirm if the issue has been resolved.'
tags: ['disk', 'windows']
draft: false
unlisted: false
---

## Overview  
Monitors Windows Event Logs for disk and NTFS errors (Event IDs: 55, 7, 33, 52, 57) in the last 24 hours. If found, reports the error with event ID and timestamp. Also checks Wininit Event ID 1001 to confirm if the issue has been resolved.  

Note: This Component is a monitoring component and can only be able to execute through a monitor policy.

## Implementation  

1. Download the component [Disk Health Checkup](../../../static/attachments/Disk%20Health%20Checkup.cpt) from the attachments.

2. After downloading the attached file, click on the `Import` button
3. Select the component just downloaded and add it to the Datto RMM interface.  
![Image 1](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/template1.webp)  

## Sample Run

To implement the `component` over a policy, follow these steps:  

1. Under the `Policies> Monitoring` section, click on create policy.  

    - State the name of the policy `Run Disk Health Checkup` 
    - Provide the description.  
    -  State the Scope of the policy.  
    ![Image1](../../../static/img/docs/0289f7dd-f98f-47a3-a957-fc3b9ab36cda/snapshot1.webp)  

    - Within the Monitors section, click on `Add Monitor`.  
    ![Image2](../../../static/img/docs/0289f7dd-f98f-47a3-a957-fc3b9ab36cda/snapshot2.webp)     

    - Under the `Monitor Type`, click on `Select` and then select the `Component`option.  
![image3](../../../static/img/docs/0289f7dd-f98f-47a3-a957-fc3b9ab36cda/snapshot3.webp).  

    -  Inorder to configure your `component` via alerting, follow the below steps:  
        - Click on `Select a Component Monitor` and then select  
           the component `Disk Health Checkup` from the search bar.  
        -  Set the interval to `execute the component monitor`.  
        - Select the `priority to raise an alert`.  
        - Select the time to `auto resolve the alert`.
        ![Image4](../../../static/img/docs/0289f7dd-f98f-47a3-a957-fc3b9ab36cda/snapshot4.webp)    
        - Click on `Add Monitor`.  

3. Click on `Add Target` to provide the targeted machines.  
4. Click on `Save and Deploy Now` to save the policy.




## Output  
- stdOut  
- stdError  


## Attachments  
[Disk Health Checkup](../../../static/attachments/Disk%20Health%20Checkup.cpt)