---
id: 'c598c18f-25a9-43fd-a7b6-86e8f186c38b'
slug: /c598c18f-25a9-43fd-a7b6-86e8f186c38b
title: 'DUO Auth for Windows Login Deployment'
title_meta: 'DUO Auth for Windows Login Deployment'
keywords: ['duo', 'deployment', 'windows', 'group', 'authentication']
description: 'This document outlines the steps to create a dynamic group for DUO Authentication for Windows Login Deployment in ConnectWise RMM. It details the necessary custom fields and conditions required for the group setup.'
tags: ['deployment', 'windows']
draft: false
unlisted: false
---

## Summary

This group adds members where the DUO Deployment is enabled. The agent is added if the company custom field "DUO Deployment" is checked.

## Dependencies

[CW RMM Custom Fields - Duo Authentication for Windows Logon Deployment](/docs/a9578dd1-1f6b-4932-a614-5ed823656416)

## Details

| Field Name                                     | Type of Field (Machine or Organization) | Description                                                                                                                                                    |
|------------------------------------------------|-----------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------|
| DUO Auth for Windows Login Deployment           | Dynamic                                 | This group adds members where the DUO Deployment is enabled. The agent is added if the company custom field "DUO Deployment" is checked.                   |

## Group Creation

1. Navigate to `Devices` > `Device Groups`.
   ![Step 1](../../../static/img/docs/c598c18f-25a9-43fd-a7b6-86e8f186c38b/image_1.webp)

2. Create a new dynamic group by clicking the `Dynamic Group` button.
   ![Step 2](../../../static/img/docs/c598c18f-25a9-43fd-a7b6-86e8f186c38b/image_2.webp)  
   This page will appear after clicking on the `Dynamic Group` button:  
   ![Step 2 - Continued](../../../static/img/docs/c598c18f-25a9-43fd-a7b6-86e8f186c38b/image_3.webp)

3. Set the group name to `DUO Auth for Windows Login Deployment`.  
   Description: `This group adds members where the DUO Deployment is enabled. The agent is added if the company custom field "DUO Deployment" is checked.`  
   ![Step 3](../../../static/img/docs/c598c18f-25a9-43fd-a7b6-86e8f186c38b/image_4.webp)

4. Click `+ Add Criteria` in the `Criteria` section of the group.  
   ![Step 4](../../../static/img/docs/c598c18f-25a9-43fd-a7b6-86e8f186c38b/image_5.webp)  
   This search box will appear.  
   ![Step 4 - Continued](../../../static/img/docs/c598c18f-25a9-43fd-a7b6-86e8f186c38b/image_6.webp)

5. - Search and select the `OS` from the search box.
   - Mark and select `Microsoft Windows 10` and `Microsoft Windows 11` in the comparison field.  
   ![Step 5](../../../static/img/docs/c598c18f-25a9-43fd-a7b6-86e8f186c38b/image_7.webp)  
   **Condition:** `OS` `Contains any of` `Microsoft Windows 10, Microsoft Windows 11`

6. - Search and select the `Duo Deployment` custom field from the search box.
   - Set `True` in the comparison condition.  
   ![Step 6](../../../static/img/docs/c598c18f-25a9-43fd-a7b6-86e8f186c38b/image_8.webp)  
   **Condition:** `Duo Deployment` `Equal` `True`

7. - Search and select the `Duo Deployment Exclude` custom field from the search box.
   - Set `False` in the comparison condition.  
   ![Step 7](../../../static/img/docs/c598c18f-25a9-43fd-a7b6-86e8f186c38b/image_9.webp)  
   **Condition:** `Duo Deployment Exclude` `Equal` `False`

8. - Search and select the `Duo Deployment Result` custom field from the search box.
   - Set `Failed` in the comparison condition.  
   ![Step 8](../../../static/img/docs/c598c18f-25a9-43fd-a7b6-86e8f186c38b/image_10.webp)  
   **Condition:** `Duo Deployment Result` `Does Not Contain any of` `Failed`
