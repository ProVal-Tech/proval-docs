---
id: '9e16691c-a81f-4a59-865c-ac38530ae29f'
title: 'SentinelOne Deployment Failure'
title_meta: 'SentinelOne Deployment Failure'
keywords: ['monitor', 'sentinelone', 'deployment', 'failure', 'tickets']
description: 'This document provides a step-by-step guide to create a monitor in ConnectWise RMM that generates tickets when the SentinelOne Deployment task fails to install on machines. It includes details on dependencies, monitor setup, and configuration steps.'
tags: ['security', 'setup']
draft: false
unlisted: false
---

## Summary

This monitor will create tickets if [CW RMM - Task - SentinelOne Deployment](<../tasks/SentinelOne Deployment.md>) fails to install SentinelOne on the machines.

## Dependencies

- [CW RMM - Task - SentinelOne Deployment](<../tasks/SentinelOne Deployment.md>)
- [CW RMM - Custom Field - Endpoint - SentinelOne Deployment Result](<../custom-fields/Endpoint - SentinelOne Deployment Result.md>)

## Monitor

1. Go to **Alert Management > Monitors**.  
   ![Image](../../../static/img/SentinelOne-Deployment-Failure/image_1.png)  

2. Click the **Create Monitor** button.  
   ![Image](../../../static/img/SentinelOne-Deployment-Failure/image_2.png)  

3. This screen will appear.  
   ![Image](../../../static/img/SentinelOne-Deployment-Failure/image_3.png)  

4. Fill in the following details:  
   **Name:** SentinelOne Deployment Failure  
   **Description:** This monitor will create tickets if CW RMM - Task - SentinelOne Deployment fails to install SentinelOne on the machines.  
   **Type:** Custom Fields  
   **Severity:** Critical Non-Impact Alerts  
   **Family:** Desktop Security  
   ![Image](../../../static/img/SentinelOne-Deployment-Failure/image_4.png)  

5. Select **Text Box** in the Custom Field Type.  
   Select **SentinelOne Deployment Result** from the Custom Field Name drop-down.  
   Add **Error** in the Value.  
   ![Image](../../../static/img/SentinelOne-Deployment-Failure/image_5.png)  

6. Click the **Select Targets** button to select the clients to monitor.  
   ![Image](../../../static/img/SentinelOne-Deployment-Failure/image_6.png)  

7. Select all companies and click the **Save Selection** button.  
   ![Image](../../../static/img/SentinelOne-Deployment-Failure/image_7.png)  

8. In Ticket Resolution,  
   Set **Text Box** as the Custom Field Type.  
   Select **SentinelOne Deployment Result** from the Custom Field Name drop-down.  
   Replace **Equals** with **Does not Contain**.  
   Add **Error** in the Value.  
   ![Image](../../../static/img/SentinelOne-Deployment-Failure/image_8.png)  

9. Confirm that this is the final appearance of the monitor set, then save it by clicking the **Save** button.  
   ![Image](../../../static/img/SentinelOne-Deployment-Failure/image_9.png)  






