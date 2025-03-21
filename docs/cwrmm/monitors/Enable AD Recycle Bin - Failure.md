---
id: '2d98b419-3d5d-4278-a4ce-f2cacba569c5'
title: 'Enable AD Recycle Bin - Failure'
title_meta: 'Enable AD Recycle Bin - Failure'
keywords: ['monitor', 'ad', 'recycle', 'bin', 'tickets', 'alerts']
description: 'This document outlines the steps to create a monitor that generates tickets if the task to enable the Active Directory Recycle Bin fails on the Infrastructure master for more than three attempts. It details the necessary dependencies and step-by-step instructions for setting up the monitor in Alert Management.'
tags: ['windows']
draft: false
unlisted: false
---

## Summary

This monitor will create tickets if the [Task - Enable AD Recycle Bin](<../tasks/Enable AD Recycle Bin.md>) fails to enable the AD Recycle Bin on the Infrastructure master for more than three attempts.

## Dependencies

- [Task - Enable AD Recycle Bin](<../tasks/Enable AD Recycle Bin.md>)
- [CW RMM - Custom Fields - AD Recycle Bin](<../custom-fields/AD Recycle Bin.md>)

## Monitor

1. Go to **Alert Management > Monitors**.  
   ![Image](../../../static/img/Enable-AD-Recycle-Bin---Failure/image_1.png)  

2. Click the **Create Monitor** button.  
   ![Image](../../../static/img/Enable-AD-Recycle-Bin---Failure/image_2.png)  

3. This screen will appear.  
   ![Image](../../../static/img/Enable-AD-Recycle-Bin---Failure/image_3.png)  

4. Fill in the following details:  
   - **Name:** Enable AD Recycle Bin - Failure  
   - **Description:** This monitor will create tickets if the Task - Enable AD Recycle Bin fails to enable the AD Recycle Bin on the Infrastructure master for more than three attempts.  
   - **Type:** Custom Fields  
   - **Severity:** Critical Non-Impact Alerts  
   - **Family:** Windows Server  
   ![Image](../../../static/img/Enable-AD-Recycle-Bin---Failure/image_4.png)  

5. Select **Text Box** in the Custom Field Type.  
   - Select **AD Recycle Bin** from the Custom Field Name dropdown.  
   - Add **failed more than 3 times** in the Value.  
   ![Image](../../../static/img/Enable-AD-Recycle-Bin---Failure/image_5.png)  

6. Click the **Select Targets** button to select the clients to monitor.  
   ![Image](../../../static/img/Enable-AD-Recycle-Bin---Failure/image_6.png)  

7. Select all companies and click the **Save Selection** button.  
   ![Image](../../../static/img/Enable-AD-Recycle-Bin---Failure/image_7.png)  

8. Confirm that this is the final appearance of the monitor set, then save it by clicking the **Save** button.  
   ![Image](../../../static/img/Enable-AD-Recycle-Bin---Failure/image_8.png)  




