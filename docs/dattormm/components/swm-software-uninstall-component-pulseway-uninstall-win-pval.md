---
id: 'f375aa2e-d7cd-4974-a8bb-986e95bb47d7'
slug: /f375aa2e-d7cd-4974-a8bb-986e95bb47d7
title: 'SWM - Software Uninstall - Component - Pulseway - Uninstall WIN PVAL'
title_meta: 'SWM - Software Uninstall - Component - Pulseway - Uninstall WIN PVAL'
keywords: ['uninstallation', 'pulseway', 'cleanup', 'datto', 'rmm']
description: 'This document outlines the steps to perform an automated uninstallation of Pulseway, including necessary cleanup procedures and integration with Datto RMM. It provides detailed implementation instructions and expected output for successful execution.'
tags: ['cleanup', 'datto', 'installation', 'software', 'uninstallation']
draft: false
unlisted: false
---

## Summary

This document describes the automated uninstallation of Pulseway, including additional cleanup steps.

## Implementation

1. Export the component from ProVal's Datto RMM instance  
   **Name:** Pulseway - Uninstall [WIN] [PVAL]  
   ![Image](../../../static/img/docs/f375aa2e-d7cd-4974-a8bb-986e95bb47d7/image_1.webp)  
   The export will download the necessary component (cpt) file.  
   ![Image](../../../static/img/docs/f375aa2e-d7cd-4974-a8bb-986e95bb47d7/image_2.webp)  
   
2. Import this component file into the partner's Datto RMM instance  
   ![Image](../../../static/img/docs/f375aa2e-d7cd-4974-a8bb-986e95bb47d7/image_3.webp)  

**Proval Plug & Play:** This component requires no configuration once imported.

## Output

A job status of **Success** is expected.  
![Image](../../../static/img/docs/f375aa2e-d7cd-4974-a8bb-986e95bb47d7/image_4.webp)  

**StdOut**  
![Image](../../../static/img/docs/f375aa2e-d7cd-4974-a8bb-986e95bb47d7/image_5.webp)  

**StdErr**  
StdErr is not expected.