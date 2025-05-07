---
id: '8e25f0d8-8a04-4f5b-853a-282b9f005d9c'
slug: /8e25f0d8-8a04-4f5b-853a-282b9f005d9c
title: 'EPM - Windows Configuration - Component - Windows 11 - Upgrade'
title_meta: 'EPM - Windows Configuration - Component - Windows 11 - Upgrade'
keywords: ['windows', 'rearm', 'license', 'evaluation', 'datto', 'component']
description: 'This document outlines the process for checking whether a machine is an evaluation copy of Windows. It details the steps to export and import the necessary component in Datto RMM, along with the variables for performing a rearm and restarting the endpoint if required.'
tags: ['datto', 'setup', 'windows']
draft: false
unlisted: false
---

## Summary

This document checks if the machine is an evaluation copy of Windows. If so, it checks the available re-arms. Variables to perform the rearm and restart are available.

## Implementation

1. Export the component from ProVal's Datto RMM instance:  
   **Name:** Windows Evaluation License (Rearm)  
   ![Image](../../../static/img/docs/8e25f0d8-8a04-4f5b-853a-282b9f005d9c/image_1.webp)  
   The export will download the necessary component (cpt) file.  
   ![Image](../../../static/img/docs/8e25f0d8-8a04-4f5b-853a-282b9f005d9c/image_2.webp)  
   
2. Import this component file into the partner's Datto RMM instance:  
   ![Image](../../../static/img/docs/8e25f0d8-8a04-4f5b-853a-282b9f005d9c/image_3.webp)  

**Proval Plug & Play:** This component requires no configuration once imported.

## Usage

The component will prompt for two variables during a job:  
![Image](../../../static/img/docs/8e25f0d8-8a04-4f5b-853a-282b9f005d9c/image_4.webp)  

- **Rearm:** Specifies whether to perform a rearm if there are available re-arms.  
- **Restart:** Specifies whether to restart the endpoint after a successful rearm