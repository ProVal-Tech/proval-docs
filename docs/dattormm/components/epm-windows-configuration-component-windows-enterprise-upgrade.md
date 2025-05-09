---
id: 'e6c76294-af5e-465d-9824-2e5a58734451'
slug: /e6c76294-af5e-465d-9824-2e5a58734451
title: 'EPM - Windows Configuration - Component - Windows Enterprise Upgrade'
title_meta: 'EPM - Windows Configuration - Component - Windows Enterprise Upgrade'
keywords: ['windows', 'enterprise', 'upgrade', 'kms', 'component']
description: 'This document outlines the steps to update the Windows edition for Windows 10/11 workstations to Enterprise. It includes dependencies on KMS host setup, implementation details for exporting and importing components in Datto RMM, and expected output upon successful execution.'
tags: ['installation', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

This document updates the Windows edition for Windows 10/11 workstations to Enterprise.

## Dependencies

![Police Car Light](https://c.tenor.com/8vSJsVW-1pQAAAAj/police-car-light-joypixels.gif)  
The partner must have a KMS host setup; otherwise, this component will not function.  
Refer the partner to [How to create a KMS Host](https://learn.microsoft.com/en-us/windows-server/get-started/kms-create-host) if no KMS host exists.

## Implementation

Export the component from ProVal's Datto RMM instance.  
**Name:** Windows Enterprise Upgrade  

![Component Export](../../../static/img/docs/e6c76294-af5e-465d-9824-2e5a58734451/image_1.webp)  

The export will download the necessary component (cpt) file.  

![Import Component](../../../static/img/docs/e6c76294-af5e-465d-9824-2e5a58734451/image_2.webp)  

Import this component file into the partner's Datto RMM instance.  

![Component Import](../../../static/img/docs/e6c76294-af5e-465d-9824-2e5a58734451/image_3.webp)  

Proval Plug & Play: This component requires no configuration once imported.

## Output

A job status of Success is expected.  

![Job Status](../../../static/img/docs/e6c76294-af5e-465d-9824-2e5a58734451/image_4.webp)  

**StdOut**  
![StdOut](../../../static/img/docs/e6c76294-af5e-465d-9824-2e5a58734451/image_5.webp)  
![StdOut](../../../static/img/docs/e6c76294-af5e-465d-9824-2e5a58734451/image_6.webp)  

**StdErr**  
StdErr is not expected.