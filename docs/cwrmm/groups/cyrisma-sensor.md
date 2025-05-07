---
id: 'bdea3d9e-acca-4b87-96a6-632c488fef1f'
slug: /bdea3d9e-acca-4b87-96a6-632c488fef1f
title: 'Cyrisma Sensor'
title_meta: 'Cyrisma Sensor'
keywords: ['cyrisma', 'sensor', 'deployment', 'audit', 'monitor', 'dynamic', 'groups']
description: 'This document outlines the creation and management of dynamic groups for deploying and auditing the Cyrisma Sensor within ConnectWise RMM. It details the necessary criteria for each group and their respective functions in monitoring the deployment status and installed agents.'
tags: ['report', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

The groups mentioned below are created to deploy and audit the Cyrisma Sensor.

## Dependencies

[CW RMM - Cyrisma Custom Fields](/docs/2d448750-129b-4cff-aaf1-e73d2a296418)

## Details

| Field Name                     | Type of Field (Machine or Organization) | Description                                                                                       |
|--------------------------------|-----------------------------------------|---------------------------------------------------------------------------------------------------|
| Cyrisma Sensor Deployment       | Dynamic Group                          | This group is created to deploy the task [CW RMM - Task - CRI Agent Deployment](/docs/344a3ab5-d05c-41a5-9303-45fc387ec2e8) |
| Cyrisma Deployment Failure Check | Dynamic Group                          | This group is designed to schedule the monitor [CW RMM - Monitor - CRI Agent Deployment Status Check](/docs/9df5a58f-f44f-4af8-8620-c5670c9d8524) |
| Cyrisma Installed               | Dynamic Group                          | This group contains the agents where the Cyrisma sensor is installed for auditing.               |

## Create Group

Create Dynamic Groups:

![Image](../../../static/img/docs/bdea3d9e-acca-4b87-96a6-632c488fef1f/image_1.png)

1. **Cyrisma Sensor Deployment**

   ![Image](../../../static/img/docs/bdea3d9e-acca-4b87-96a6-632c488fef1f/image_2.png)

   Criteria:

   - CryismaAgent_Key should not be blank
   - CryismaAgent_URL should not be blank
   - Installed Software does not contain any of 'CYRISMA'
   - The agent should be online
   - OS contains any of (Windows 10, Windows 11, Windows Server 2016, Windows Server 2019, and Windows Server 2022).

2. **Cyrisma Deployment Failure Check**

   ![Image](../../../static/img/docs/bdea3d9e-acca-4b87-96a6-632c488fef1f/image_3.png)

   Criteria:

   - Cryisma_Status should not be blank

3. **Cyrisma Installed**

   ![Image](../../../static/img/docs/bdea3d9e-acca-4b87-96a6-632c488fef1f/image_4.png)

   Criteria:

   - Installed Software contains any of 'CYRISMA'

