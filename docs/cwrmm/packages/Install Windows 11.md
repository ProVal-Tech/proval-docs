---
id: '9d9148ad-26f7-45c6-ab6a-37e85dc259e8'
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

- [CW RMM - Device Group - Upgrade Enabled Windows 11 Compatible Machines](<../groups/Upgrade Enabled Windows 11 Compatible Machines.md>)
- [CW RMM - Policy - Install Windows 11](<../policies/Install Windows 11.md>)

## Package Creation

1. Navigate to `Endpoints` > `Packages`.  
   ![Image1](../../../static/img/Install-Windows-11/image_2.png)

2. Go to `Policy Groups` and select the `OS Patching Desktop` group.  
   ![Image2](../../../static/img/Install-Windows-11/image_3.png)

3. Click the `Add Existing Device Group` button.  
   ![Image3](../../../static/img/Install-Windows-11/image_4.png)

4. This screen will appear.  
   ![Image4](../../../static/img/Install-Windows-11/image_5.png)

5. **Policy Group Name:** `Install Windows 11`  
   **Description:** `Enable Windows 11 installation for compatible Windows 10 computers.`  
   ![Image5](../../../static/img/Install-Windows-11/image_6.png)

6. Search and select the [Upgrade Enabled Windows 11 Compatible Machines](<../groups/Upgrade Enabled Windows 11 Compatible Machines.md>) Device group.
   ![Image6](../../../static/img/Install-Windows-11/image_7.png)  

7. Click the `Assign` button.  
   ![Image7](../../../static/img/Install-Windows-11/image_8.png)

8. This screen will appear.  
   ![Image8](../../../static/img/Install-Windows-11/image_9.png)

9. Select the [Install Windows 11](<../policies/Install Windows 11.md>) policy and click the `Assign` button.  
   ![Image9](../../../static/img/Install-Windows-11/image_10.png)

10. ![Image10](../../../static/img/Install-Windows-11/image_11.png)

11. Click the `Save` button to save the `Policy Group`.  
   ![Image11](../../../static/img/Install-Windows-11/image_12.png)

## Completed Policy Group

![Image12](../../../static/img/Install-Windows-11/image_13.png)
