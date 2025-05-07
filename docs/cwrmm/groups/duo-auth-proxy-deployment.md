---
id: '64da30ad-04ef-486e-b152-855b51be5896'
slug: /64da30ad-04ef-486e-b152-855b51be5896
title: 'DUO Auth Proxy Deployment'
title_meta: 'DUO Auth Proxy Deployment'
keywords: ['duo', 'proxy', 'deployment', 'group', 'authentication']
description: 'This document provides a comprehensive guide on setting up a dynamic group for the DUO Security Authentication Proxy deployment in ConnectWise RMM. It details the necessary custom fields, group creation steps, and criteria for agent inclusion based on specific conditions.'
tags: ['deployment', 'windows']
draft: false
unlisted: false
---

## Summary

This group adds the agent to the group for the "DUO Security Authentication Proxy" deployment. The agent gets added if the company custom field "DUO Proxy Deployment" is checked.

## Dependencies

[CW RMM Custom Fields - DUO Auth Proxy Deployment](/docs/94f21e35-d184-4fb5-9215-898bb367a0e9)

## Details

| Field Name                     | Type of Field (Machine or Organization) | Description                                                                                                                                                   |
|--------------------------------|-----------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------|
| DUO Auth Proxy Deployment       | Dynamic                                 | This group adds the agent to the group for the "DUO Security Authentication Proxy" deployment. The agent gets added if the company custom field "DUO Proxy Deployment" is checked. |

## Group Creation

1. Navigate to `Devices` > `Device Groups`.  
   ![Image](../../../static/img/docs/94f21e35-d184-4fb5-9215-898bb367a0e9/image_6.webp)

2. Create a new dynamic group by clicking the `Dynamic Group` button.  
   ![Image](../../../static/img/docs/94f21e35-d184-4fb5-9215-898bb367a0e9/image_7.webp)  
   This page will appear after clicking on the `Dynamic Group` button:  
   ![Image](../../../static/img/docs/94f21e35-d184-4fb5-9215-898bb367a0e9/image_8.webp)

3. Set the group name to `DUO Auth Proxy Deployment`.  
   Description: `This group adds the agent to the group for the "DUO Security Authentication Proxy" deployment. The agent gets added if the company custom field "DUO Proxy Deployment" is checked.`  
   ![Image](../../../static/img/docs/94f21e35-d184-4fb5-9215-898bb367a0e9/image_9.webp)

4. Click the `+ Add Criteria` in the `Criteria` section of the group.  
   ![Image](../../../static/img/docs/94f21e35-d184-4fb5-9215-898bb367a0e9/image_10.webp)  
   This search box will appear.  
   ![Image](../../../static/img/docs/94f21e35-d184-4fb5-9215-898bb367a0e9/image_11.webp)

5. - Search and select the `OS` from the search box.  
   - Mark and select `Microsoft Windows 10` and `Microsoft Windows 11` in the comparison field.  
   ![Image](../../../static/img/docs/94f21e35-d184-4fb5-9215-898bb367a0e9/image_12.webp)  
   **Condition:** `OS` `Contains any of` `Microsoft Windows 10, Microsoft Windows 11`

6. - Search and select the `Duo Proxy Deployment` custom field from the search box.  
   - Set `True` in the comparison condition.  
   ![Image](../../../static/img/docs/94f21e35-d184-4fb5-9215-898bb367a0e9/image_13.webp)  
   **Condition:** `Duo Proxy Deployment` `Equal` `True`

7. - Search and select the `Duo Proxy Exclusion` custom field from the search box.  
   - Set `False` in the comparison condition.  
   ![Image](../../../static/img/docs/94f21e35-d184-4fb5-9215-898bb367a0e9/image_14.webp)  
   **Condition:** `Duo Proxy Exclusion` `Equal` `False`

8. - Search and select the `Duo Auth Proxy Result` custom field from the search box.  
   - Set `Failed` in the comparison condition.  
   ![Image](../../../static/img/docs/94f21e35-d184-4fb5-9215-898bb367a0e9/image_15.webp)  
   **Condition:** `Duo Auth Proxy Result` `Does Not Contain any of` `Failed`

