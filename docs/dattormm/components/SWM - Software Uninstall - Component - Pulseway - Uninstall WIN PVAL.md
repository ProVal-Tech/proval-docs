---
id: 'f375aa2e-d7cd-4974-a8bb-986e95bb47d7'
title: 'Automated Uninstallation of Pulseway'
title_meta: 'Automated Uninstallation of Pulseway'
keywords: ['uninstallation', 'pulseway', 'cleanup', 'datto', 'rmm']
description: 'This document outlines the steps to perform an automated uninstallation of Pulseway, including necessary cleanup procedures and integration with Datto RMM. It provides detailed implementation instructions and expected output for successful execution.'
tags: ['uninstallation', 'cleanup', 'datto', 'software', 'installation']
draft: false
unlisted: false
---
## Summary

Performs an automated uninstallation of Pulseway, with additional cleanup steps.

## Implementation

Export the component from ProVal's Datto RMM instance  
**Name:** Pulseway - Uninstall [WIN] [PVAL]  
![Image](../../../static/img/SWM---Software-Uninstall---Component---Pulseway---Uninstall-WIN-PVAL/image_1.png)  
The export will download the necessary component (cpt) file.  
![Image](../../../static/img/SWM---Software-Uninstall---Component---Pulseway---Uninstall-WIN-PVAL/image_2.png)  
Import this component file into the partner's Datto RMM instance  
![Image](../../../static/img/SWM---Software-Uninstall---Component---Pulseway---Uninstall-WIN-PVAL/image_3.png)  

Proval Plug & Play: This component requires no configuration once imported.

## Output

A job status of Success is expected.  
![Image](../../../static/img/SWM---Software-Uninstall---Component---Pulseway---Uninstall-WIN-PVAL/image_4.png)  

**StdOut**  
![Image](../../../static/img/SWM---Software-Uninstall---Component---Pulseway---Uninstall-WIN-PVAL/image_5.png)  

**StdErr**  
StdErr is not expected.






