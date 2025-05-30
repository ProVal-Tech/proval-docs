---
id: 'e2ca200f-885f-412e-b214-f798bb47ea67'
slug: /e2ca200f-885f-412e-b214-f798bb47ea67
title: 'SWM - Software Uninstall - Component - Microsoft Office - Uninstall'
title_meta: 'SWM - Software Uninstall - Component - Microsoft Office - Uninstall'
keywords: ['uninstall', 'microsoft', 'office', 'utility', 'component']
description: 'This document provides a detailed guide on using the Microsoft Office Uninstall component, which runs the Office Scrub utility to remove specified Microsoft Office products from a Datto RMM instance. It includes implementation steps, usage instructions, and expected output.'
tags: ['software', 'uninstallation', 'windows']
draft: false
unlisted: false
---

## Summary

This component will run the Office Scrub utility and remove all or specified Microsoft Office products.

## Dependencies

- [Invoke-Offscrub](/docs/e9253255-9a1f-4392-8ec6-9f7fb6e401ed)

## Implementation

1. Export the component from ProVal's Datto RMM instance.  
   **Name:** Microsoft Office - Uninstall  
   ![Image](../../../static/img/docs/e2ca200f-885f-412e-b214-f798bb47ea67/image_1.webp)  
   The export will download the necessary component (cpt) file.  
   ![Image](../../../static/img/docs/e2ca200f-885f-412e-b214-f798bb47ea67/image_2.webp)  
   
2. Import this component file into the partner's Datto RMM instance.  
   ![Image](../../../static/img/docs/e2ca200f-885f-412e-b214-f798bb47ea67/image_3.webp)  

**Proval Plug & Play:** This component requires no configuration once imported.

## Usage

The component will prompt with several options during a job.  
Select the versions you wish to uninstall.  
![Image](../../../static/img/docs/e2ca200f-885f-412e-b214-f798bb47ea67/image_4.webp)  

## Output

A job status of **Success** is expected.  
![Image](../../../static/img/docs/e2ca200f-885f-412e-b214-f798bb47ea67/image_5.webp)  

A job status of **Expired** may also occur. If "Expired" is displayed, verification will be required to determine if the uninstall was successful.  

**StdOut**  
StdOut is not expected.  

**StdErr**  
StdErr is not expected.  