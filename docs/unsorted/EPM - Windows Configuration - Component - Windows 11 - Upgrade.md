---
id: '8e25f0d8-8a04-4f5b-853a-282b9f005d9c'
title: 'Windows Evaluation License (Rearm)'
title_meta: 'Windows Evaluation License (Rearm)'
keywords: ['windows', 'rearm', 'license', 'evaluation', 'datto', 'component']
description: 'This document outlines the process for checking whether a machine is an evaluation copy of Windows. It details the steps to export and import the necessary component in Datto RMM, along with the variables for performing a rearm and restarting the endpoint if required.'
tags: ['datto', 'setup', 'windows']
draft: true
unlisted: false
---

## Summary

This document checks if the machine is an evaluation copy of Windows. If so, it checks the available re-arms. Variables to perform the rearm and restart are available.

## Implementation

1. Export the component from ProVal's Datto RMM instance:  
   **Name:** Windows Evaluation License (Rearm)  
   ![Image](../../static/img/EPM---Windows-Configuration---Component---Windows-11---Upgrade/image_1.png)  
   The export will download the necessary component (cpt) file.  
   ![Image](../../static/img/EPM---Windows-Configuration---Component---Windows-11---Upgrade/image_2.png)  
   
2. Import this component file into the partner's Datto RMM instance:  
   ![Image](../../static/img/EPM---Windows-Configuration---Component---Windows-11---Upgrade/image_3.png)  

**Proval Plug & Play:** This component requires no configuration once imported.

## Usage

The component will prompt for two variables during a job:  
![Image](../../static/img/EPM---Windows-Configuration---Component---Windows-11---Upgrade/image_4.png)  

- **Rearm:** Specifies whether to perform a rearm if there are available re-arms.  
- **Restart:** Specifies whether to restart the endpoint after a successful rearm

