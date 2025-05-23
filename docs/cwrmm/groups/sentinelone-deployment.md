---
id: 'e7b258e9-436c-499c-8532-3ba7b3d8e6e3'
slug: /e7b258e9-436c-499c-8532-3ba7b3d8e6e3
title: 'SentinelOne Deployment'
title_meta: 'SentinelOne Deployment'
keywords: ['sentinelone', 'deployment', 'windows', 'linux', 'mac', 'group', 'criteria']
description: 'This document outlines the configuration of a dynamic group for deploying the SentinelOne agent across Windows, Linux, and Mac machines, including the necessary dependencies and criteria for group membership.'
tags: ['deployment', 'linux', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

The purpose of this group is to deploy the SentinelOne agent on Windows, Linux, and Mac machines.

## Dependencies

- [CW RMM - Custom Field - Flag - SentinelOne Deployment Exclusion](/docs/a2967009-ef20-4ce5-823e-8b80349325a0)  
- [CW RMM - Custom Field - Site - SentinelOne Site Key](/docs/0c2128f8-2f99-47e7-a0ff-82b854ff2701)  
- [CW RMM - Custom Field - Site - SentinelOne Group Key](/docs/ecb78b4e-fa63-4bd0-b59a-e0e0412b6cd5)  

## Overview

![Image](../../../static/img/docs/e7b258e9-436c-499c-8532-3ba7b3d8e6e3/image_1.webp)

**Group Type:** Dynamic  
**Group Name:** SentinelOne Deployment  
**Description:** The purpose of this group is to deploy the SentinelOne agent on Windows, Linux, and Mac machines.

### Criteria

![Image](../../../static/img/docs/e7b258e9-436c-499c-8532-3ba7b3d8e6e3/image_2.webp)

- Installed Software does not contain any of `Sentinel Agent, Sentinelone`
- Endpoint type is not equal to `Vmware-ESXi`
- `SentinelOne Deployment Exclusion` custom field is equal to false.
- Service Display name does not contain any of the `Sentinel agent`
- Available should be True.
- OS does not include any of the out-of-support machines like `Windows 7, 8, and Server 2003, 2008, 2012`  
  Click on the Dropdown --> expand Microsoft --> Click on 7, 8 Pro, 8.1  
  ![Image](../../../static/img/docs/e7b258e9-436c-499c-8532-3ba7b3d8e6e3/image_3.webp)  
  Now expand Server and click on 2003 R2 Service Pack 2, 2008, and 2012  
  ![Image](../../../static/img/docs/e7b258e9-436c-499c-8532-3ba7b3d8e6e3/image_4.webp)  

- SentinelOne Group Key should not equal `NA`
- SentinelOne Site Key should not equal `NA`

## Group

Once you have added the above criteria, click the Save button to save the Group.  
![Image](../../../static/img/docs/e7b258e9-436c-499c-8532-3ba7b3d8e6e3/image_5.webp)  

![Image](../../../static/img/docs/e7b258e9-436c-499c-8532-3ba7b3d8e6e3/image_6.webp)  