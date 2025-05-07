---
id: '820319b1-66c6-43b0-be35-136ac4c82ccd'
slug: /820319b1-66c6-43b0-be35-136ac4c82ccd
title: 'S1 Management Server Discrepancy'
title_meta: 'S1 Management Server Discrepancy'
keywords: ['sentinelone', 'management', 'server', 'discrepancy', 'group']
description: 'This document provides a step-by-step guide on creating a dynamic group in ConnectWise RMM to identify computers with different SentinelOne management servers configured for the client. It includes detailed instructions and visuals for each step of the process.'
tags: ['connectwise', 'setup']
draft: false
unlisted: false
---

## Summary

The group contains computers with different SentinelOne management servers as configured for the client in CW RMM.

## Dependencies

[CW RMM - Custom Field - Endpoint - S1 Mgmt Server Discrepancy](/docs/c600a6e2-bd09-4172-8784-d969838eea23)

## Group Creation

1. Navigate to `Devices` > `Device Groups`.
   ![Image](../../../static/img/docs/820319b1-66c6-43b0-be35-136ac4c82ccd/image_1.png)

2. Create a new dynamic group by clicking the `Dynamic Group` button.

   ![Image](../../../static/img/docs/820319b1-66c6-43b0-be35-136ac4c82ccd/image_2.png)

   This page will appear after clicking on the `Dynamic Group` button:
   ![Image](../../../static/img/docs/820319b1-66c6-43b0-be35-136ac4c82ccd/image_3.png)

3. Set the group name to `S1 Management Server Discrepancy`.  
   Description: `The group contains computers with different SentinelOne management servers as configured for the client in CW RMM.`
   ![Image](../../../static/img/docs/820319b1-66c6-43b0-be35-136ac4c82ccd/image_4.png)

4. Click the `+ Add Criteria` in the `Criteria` section of the group.
   ![Image](../../../static/img/docs/820319b1-66c6-43b0-be35-136ac4c82ccd/image_5.png)  
   This search box will appear.
   ![Image](../../../static/img/docs/820319b1-66c6-43b0-be35-136ac4c82ccd/image_6.png)

5. Search and select the [`S1 Mgmt Server Discrepancy`](/docs/c600a6e2-bd09-4172-8784-d969838eea23) custom field from the search box.
   ![Image](../../../static/img/docs/820319b1-66c6-43b0-be35-136ac4c82ccd/image_7.png)  
   Set `Yes` in the comparison condition.
   ![Image](../../../static/img/docs/820319b1-66c6-43b0-be35-136ac4c82ccd/image_8.png)  

   **Condition:** [`S1 Mgmt Server Discrepancy`](/docs/c600a6e2-bd09-4172-8784-d969838eea23) `Contains any of` `Yes`

6. Click the `Save` button to save/create the group.
   ![Image](../../../static/img/docs/820319b1-66c6-43b0-be35-136ac4c82ccd/image_9.png)

## Completed Group

![Image](../../../static/img/docs/820319b1-66c6-43b0-be35-136ac4c82ccd/image_10.png)  
![Image](../../../static/img/docs/820319b1-66c6-43b0-be35-136ac4c82ccd/image_11.png)

