---
id: '57b02fcd-0a4e-4c90-93d8-f81caa4c0835'
title: 'HuntressAgent Service'
title_meta: 'HuntressAgent Service'
keywords: ['huntress', 'service', 'monitoring', 'alerts', 'rmm']
description: 'This document outlines the steps to set up monitoring for the HuntressAgent Service, ensuring alerts are triggered if the service stops and fails to restart. It includes detailed instructions on configuring the monitor in ConnectWise RMM.'
tags: []
draft: false
unlisted: false
---

## Summary

This document provides instructions to set up alerts on machines if the HuntressAgent Service is stopped and fails to restart.

## Dependencies

[CW RMM - Device Group - Machines with Huntress Agent](<../groups/Machines with Huntress Agent.md>)

## Monitor

1. Go to **Alert Management > Monitors**.  
   ![](../../../static/img/HuntressAgent-Service/image_1.png)  

2. Click the **Create Monitor** button.  
   ![](../../../static/img/HuntressAgent-Service/image_2.png)  

3. The following screen will appear.  
   ![](../../../static/img/HuntressAgent-Service/image_3.png)  

4. Fill in the following details:  
   - **Name:** HuntressAgent Service  
   - **Description:** Alerts on the machines if HuntressAgent Service is stopped and fails to restart.  
   - **Type:** Service  
   - **Severity:** Others  
   - **Family:** RMM agent  
   ![](../../../static/img/HuntressAgent-Service/image_4.png)  

5. Select **Huntress Agent Service** from the Service dropdown.  
   ![](../../../static/img/HuntressAgent-Service/image_5.png)  

6. Ensure both the **Automatically Start Huntress Agent Service** toggle and the **Automatically resolve when Huntress Agent service is running** toggle are enabled.  
   ![](../../../static/img/HuntressAgent-Service/image_6.png)  

7. Click the **Select Targets** button to choose the clients to monitor.  
   ![](../../../static/img/HuntressAgent-Service/image_7.png)  

8. Select the **Machines with Huntress Agent** device group to monitor and click the **Save Selection** button.  
   ![](../../../static/img/HuntressAgent-Service/image_8.png)  

9. Confirm that this is the final appearance of the monitor set, then save it by clicking the **Save** button.  
   ![](../../../static/img/HuntressAgent-Service/image_9.png)  



