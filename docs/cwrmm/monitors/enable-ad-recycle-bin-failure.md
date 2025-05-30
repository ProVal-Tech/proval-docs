---
id: '2d98b419-3d5d-4278-a4ce-f2cacba569c5'
slug: /2d98b419-3d5d-4278-a4ce-f2cacba569c5
title: 'Enable AD Recycle Bin - Failure'
title_meta: 'Enable AD Recycle Bin - Failure'
keywords: ['monitor', 'ad', 'recycle', 'bin', 'tickets', 'alerts']
description: 'This document outlines the steps to create a monitor that generates tickets if the task to enable the Active Directory Recycle Bin fails on the Infrastructure master for more than three attempts. It details the necessary dependencies and step-by-step instructions for setting up the monitor in Alert Management.'
tags: ['windows']
draft: false
unlisted: false
---

## Summary

This monitor will create tickets if the [Task - Enable AD Recycle Bin](/docs/bb53445d-532a-4ec4-b4c5-3f8d0610d6f7) fails to enable the AD Recycle Bin on the Infrastructure master for more than three attempts.

## Dependencies

- [Task - Enable AD Recycle Bin](/docs/bb53445d-532a-4ec4-b4c5-3f8d0610d6f7)
- [CW RMM - Custom Fields - AD Recycle Bin](/docs/e4801a6f-1945-4aee-bd39-1601a185b9eb)

## Monitor

1. Go to **Alert Management > Monitors**.  
   ![Image](../../../static/img/docs/2d98b419-3d5d-4278-a4ce-f2cacba569c5/image_1_1.webp)  

2. Click the **Create Monitor** button.  
   ![Image](../../../static/img/docs/2d98b419-3d5d-4278-a4ce-f2cacba569c5/image_2_1.webp)  

3. This screen will appear.  
   ![Image](../../../static/img/docs/2d98b419-3d5d-4278-a4ce-f2cacba569c5/image_3_1.webp)  

4. Fill in the following details:  
   - **Name:** Enable AD Recycle Bin - Failure  
   - **Description:** This monitor will create tickets if the Task - Enable AD Recycle Bin fails to enable the AD Recycle Bin on the Infrastructure master for more than three attempts.  
   - **Type:** Custom Fields  
   - **Severity:** Critical Non-Impact Alerts  
   - **Family:** Windows Server  
   ![Image](../../../static/img/docs/2d98b419-3d5d-4278-a4ce-f2cacba569c5/image_4_1.webp)  

5. Select **Text Box** in the Custom Field Type.  
   - Select **AD Recycle Bin** from the Custom Field Name dropdown.  
   - Add **failed more than 3 times** in the Value.  
   ![Image](../../../static/img/docs/2d98b419-3d5d-4278-a4ce-f2cacba569c5/image_5_1.webp)  

6. Click the **Select Targets** button to select the clients to monitor.  
   ![Image](../../../static/img/docs/2d98b419-3d5d-4278-a4ce-f2cacba569c5/image_6_1.webp)  

7. Select all companies and click the **Save Selection** button.  
   ![Image](../../../static/img/docs/2d98b419-3d5d-4278-a4ce-f2cacba569c5/image_7_1.webp)  

8. Confirm that this is the final appearance of the monitor set, then save it by clicking the **Save** button.  
   ![Image](../../../static/img/docs/2d98b419-3d5d-4278-a4ce-f2cacba569c5/image_8_1.webp)  