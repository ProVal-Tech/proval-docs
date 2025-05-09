---
id: '9df5a58f-f44f-4af8-8620-c5670c9d8524'
slug: /9df5a58f-f44f-4af8-8620-c5670c9d8524
title: 'CRI Agent Deployment Status Check'
title_meta: 'CRI Agent Deployment Status Check'
keywords: ['monitor', 'ticket', 'deployment', 'failure', 'security']
description: 'This document outlines the steps to create a monitor that generates a ticket for CRI Agent deployment failures, ensuring timely alerts for critical non-impact issues.'
tags: ['deployment', 'security']
draft: false
unlisted: false
---

## Summary

This monitor is designed to create a ticket for the CRI Agent deployment failure.

## Create and Implement Monitor

- Click on **Alert Management** -> **Monitors** -> **Create Monitor**  
  ![Image 1](../../../static/img/docs/9df5a58f-f44f-4af8-8620-c5670c9d8524/image_1_1.webp)  
  ![Image 2](../../../static/img/docs/9df5a58f-f44f-4af8-8620-c5670c9d8524/image_2_1.webp)  

- **Name**: CRI Agent Deployment Status Check  
  **Description**: This monitor is designed to create a ticket for the CRI Agent deployment failure  
  **Type**: Custom Field  
  **Severity**: Critical Non-Impact Alerts  
  **Family**: Security  
  ![Image 3](../../../static/img/docs/9df5a58f-f44f-4af8-8620-c5670c9d8524/image_3_1.webp)  

- Set the **Conditions** as shown below:  
  ![Image 4](../../../static/img/docs/9df5a58f-f44f-4af8-8620-c5670c9d8524/image_4_1.webp)  

- Set **Target** as shown below:  
  ![Image 5](../../../static/img/docs/9df5a58f-f44f-4af8-8620-c5670c9d8524/image_5_1.webp)  

- Once all is done, click **Save**. The monitor will be created, and ticket creation will be set for the [CW RMM - Task - CRI Agent Deployment](/docs/344a3ab5-d05c-41a5-9303-45fc387ec2e8) status check.

## Target

Dynamic Group: Cyrisma Deployment Failure Check
