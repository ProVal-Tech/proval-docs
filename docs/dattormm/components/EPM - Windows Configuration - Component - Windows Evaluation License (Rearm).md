---
id: '214a790c-6c28-4135-9ada-8a2971c140c4'
title: 'EPM - Windows Configuration - Component - Windows Evaluation License (Rearm)'
title_meta: 'EPM - Windows Configuration - Component - Windows Evaluation License (Rearm)'
keywords: ['windows', 'license', 'rearm', 'evaluation', 'component']
description: 'This document outlines the process for checking if a machine is running an evaluation copy of Windows, verifying available re-arms, and executing a rearm if necessary. It includes implementation steps for exporting and importing the component in Datto RMM, usage instructions, and expected output.'
tags: ['setup', 'software', 'windows']
draft: true
unlisted: false
---

## Summary

This document checks to see if the machine is an evaluation copy of Windows. If so, it verifies the available re-arms. Variables to perform the rearm and restart are available.

## Implementation

1. Export the component from ProVal's Datto RMM instance.  
   **Name:** Windows Evaluation License (Rearm)  
   ![Image 1](../../static/img/EPM---Windows-Configuration---Component---Windows-Evaluation-License-(Rearm)/image_1.png)  
   The export will download the necessary component (cpt) file.  
   ![Image 2](../../static/img/EPM---Windows-Configuration---Component---Windows-Evaluation-License-(Rearm)/image_2.png)  
   
2. Import this component file into the partner's Datto RMM instance.  
   ![Image 3](../../static/img/EPM---Windows-Configuration---Component---Windows-Evaluation-License-(Rearm)/image_3.png)  

Proval Plug & Play: This component requires no configuration once imported.

## Usage

The component will prompt for two variables during a job.  
![Image 4](../../static/img/EPM---Windows-Configuration---Component---Windows-Evaluation-License-(Rearm)/image_4.png)  

- **Rearm:** Specifies whether to perform a re-arm if there are available re-arms.  
- **Restart:** Specifies whether to restart the endpoint after a successful re-arm.

## Output

A job status of Success is expected.  
![Image 5](../../static/img/EPM---Windows-Configuration---Component---Windows-Evaluation-License-(Rearm)/image_5.png)  

**StdOut**  
![Image 6](../../static/img/EPM---Windows-Configuration---Component---Windows-Evaluation-License-(Rearm)/image_6.png)  
![Image 7](../../static/img/EPM---Windows-Configuration---Component---Windows-Evaluation-License-(Rearm)/image_7.png)  

**StdErr**  
StdErr is not expected.



