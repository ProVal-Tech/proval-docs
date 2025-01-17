---
id: 'bdea3d9e-acca-4b87-96a6-632c488fef1f'
title: 'Cyrisma Sensor Deployment and Audit Groups'
title_meta: 'Cyrisma Sensor Deployment and Audit Groups'
keywords: ['cyrisma', 'sensor', 'deployment', 'audit', 'monitor', 'dynamic', 'groups']
description: 'This document outlines the creation and management of dynamic groups for deploying and auditing the Cyrisma Sensor within ConnectWise RMM. It details the necessary criteria for each group and their respective functions in monitoring the deployment status and installed agents.'
tags: ['report', 'software', 'windows']
draft: false
unlisted: false
---
## Summary

The groups mentioned below are created to deploy and audit the Cyrisma Sensor.

## Dependencies

[CW RMM - Cyrisma Custom Fields](https://proval.itglue.com/DOC-5078775-15298953)

## Details

| Field Name                     | Type of Field (Machine or Organization) | Description                                                                                       |
|--------------------------------|-----------------------------------------|---------------------------------------------------------------------------------------------------|
| Cyrisma Sensor Deployment       | Dynamic Group                          | This group is created to deploy the task [CW RMM - Task - CRI Agent Deployment](https://proval.itglue.com/DOC-5078775-15298955) |
| Cyrisma Deployment Failure Check | Dynamic Group                          | This group is designed to schedule the monitor [CW RMM - Monitor - CRI Agent Deployment Status Check](https://proval.itglue.com/DOC-5078775-15298956) |
| Cyrisma Installed               | Dynamic Group                          | This group contains the agents where the Cyrisma sensor is installed for the auditing.           |

## Create Group

Create Dynamic Groups:

![Image](../../../static/img/Cyrisma-Sensor/image_1.png)

1. **Cyrisma Sensor Deployment**

   ![Image](../../../static/img/Cyrisma-Sensor/image_2.png)

   Criteria:

   - CryismaAgent_Key should not be blank
   - CryismaAgent_URL should not be blank
   - Installed Software does not contain any of 'CYRISMA'
   - The agent should be online
   - OS contains any of (Windows 10, Windows 11, Windows Server 2016, Windows Server 2019, and Windows Server 2022).

2. **Cyrisma Deployment Failure Check**

   ![Image](../../../static/img/Cyrisma-Sensor/image_3.png)

   Criteria:
   - Cryisma_Status should not be blank

3. **Cyrisma Installed**

   ![Image](../../../static/img/Cyrisma-Sensor/image_4.png)

   Criteria:
   - Installed Software Contains any of 'CYRISMA'











