---
id: '9d9148ad-26f7-45c6-ab6a-37e85dc259e8'
slug: /9d9148ad-26f7-45c6-ab6a-37e85dc259e8
title: 'Install Windows 11'
title_meta: 'Install Windows 11'
keywords: ['windows', 'installation', 'upgrade', 'policy', 'device', 'group']
description: 'This document provides a step-by-step guide to enable the installation of Windows 11 on compatible Windows 10 computers through the ConnectWise RMM platform. It includes necessary dependencies, package creation instructions, and how to assign policies to device groups.'
tags: ['setup', 'windows']
draft: false
unlisted: false
---

## Summary

Enable Windows 11 installation for compatible Windows 10 computers.

## Dependencies

- [CW RMM - Device Group - Upgrade Enabled Windows 11 Compatible Machines](/docs/9c422249-e949-4bcd-83ea-2c91b8365a96)
- [CW RMM - Policy - Install Windows 11](/docs/4664a942-cb4f-425a-ae16-4615d2b14cae)

## Package Creation

1. Navigate to `Endpoints` > `Packages`.  
   ![Image1](../../../static/img/docs/27f8240b-603a-4af2-b9d9-480a560f8747/image_2.webp)

2. Go to `Policy Groups` and select the `OS Patching Desktop` group.  
   ![Image2](../../../static/img/docs/27f8240b-603a-4af2-b9d9-480a560f8747/image_3.webp)

3. Click the `Add Existing Device Group` button.  
   ![Image3](../../../static/img/docs/27f8240b-603a-4af2-b9d9-480a560f8747/image_4.webp)

4. This screen will appear.  
   ![Image4](../../../static/img/docs/27f8240b-603a-4af2-b9d9-480a560f8747/image_5.webp)

5. **Policy Group Name:** `Install Windows 11`  
   **Description:** `Enable Windows 11 installation for compatible Windows 10 computers.`  
   ![Image5](../../../static/img/docs/27f8240b-603a-4af2-b9d9-480a560f8747/image_6.webp)

6. Search and select the [Upgrade Enabled Windows 11 Compatible Machines](/docs/9c422249-e949-4bcd-83ea-2c91b8365a96) Device group.
   ![](../../../static/img/docs/27f8240b-603a-4af2-b9d9-480a560f8747/image_7.webp)

7. Click the `Assign` button.  
   ![Image7](../../../static/img/docs/27f8240b-603a-4af2-b9d9-480a560f8747/image_8.webp)

8. This screen will appear.  
   ![Image8](../../../static/img/docs/27f8240b-603a-4af2-b9d9-480a560f8747/image_9.webp)

9. Select the [Install Windows 11](/docs/4664a942-cb4f-425a-ae16-4615d2b14cae) policy and click the `Assign` button.
   ![](../../../static/img/docs/27f8240b-603a-4af2-b9d9-480a560f8747/image_10.webp)

10. ![Image10](../../../static/img/docs/27f8240b-603a-4af2-b9d9-480a560f8747/image_11.webp)

11. Click the `Save` button to save the `Policy Group`.  
   ![Image11](../../../static/img/docs/27f8240b-603a-4af2-b9d9-480a560f8747/image_12.webp)

## Completed Policy Group

![](../../../static/img/docs/27f8240b-603a-4af2-b9d9-480a560f8747/image_13.webp)

