---
id: 'rmm-s1-management-server-discrepancy'
title: 'S1 Management Server Discrepancy'
title_meta: 'S1 Management Server Discrepancy'
keywords: ['sentinelone', 'management', 'server', 'discrepancy', 'group']
description: 'This document provides a step-by-step guide on creating a dynamic group in ConnectWise RMM to identify computers with different SentinelOne management servers configured for the client. It includes detailed instructions and visuals for each step of the process.'
tags: ['connectwise', 'group', 'dynamic', 'setup', 'configuration']
draft: false
unlisted: false
---
## Summary

The group contains computers with the different SentinelOne management server as configured for the client in CW RMM.

## Dependencies

[CW RMM - Custom Field - Endpoint - S1 Mgmt Server Discrepancy](https://proval.itglue.com/DOC-5078775-17312742)

## Group Creation

1. Navigate to `Devices` > `Device Groups`.
   ![Image](../../../static/img/S1-Management-Server-Discrepancy/image_1.png)

2. Create a new dynamic group by clicking the `Dynamic Group` button.

   ![Image](../../../static/img/S1-Management-Server-Discrepancy/image_2.png)

   This page will appear after clicking on the `Dynamic Group` button:
   ![Image](../../../static/img/S1-Management-Server-Discrepancy/image_3.png)

3. Set the group name to `S1 Management Server Discrepancy`.  
   Description: `The group contains computers with the different SentinelOne management server as configured for the client in CW RMM.`
   ![Image](../../../static/img/S1-Management-Server-Discrepancy/image_4.png)

4. Click the `+ Add Criteria` in the `Criteria` section of the group.
   ![Image](../../../static/img/S1-Management-Server-Discrepancy/image_5.png)  
   This search box will appear.
   ![Image](../../../static/img/S1-Management-Server-Discrepancy/image_6.png)

5. Search and select the [`S1 Mgmt Server Discrepancy`](https://proval.itglue.com/DOC-5078775-17312742) custom field from the search box.
   ![Image](../../../static/img/S1-Management-Server-Discrepancy/image_7.png)  
   Set `Yes` in the comparison condition.
   ![Image](../../../static/img/S1-Management-Server-Discrepancy/image_8.png)  

   **Condition:** [`S1 Mgmt Server Discrepancy`](https://proval.itglue.com/DOC-5078775-17312742) `Contains any of` `Yes`

6. Click the `Save` button to save/create the group.
   ![Image](../../../static/img/S1-Management-Server-Discrepancy/image_9.png)

## Completed Group

![Image](../../../static/img/S1-Management-Server-Discrepancy/image_10.png)  
![Image](../../../static/img/S1-Management-Server-Discrepancy/image_11.png)



