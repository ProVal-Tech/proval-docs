---
id: '0fd0215c-d6d5-40c8-9ba6-79b69721f4c1'
slug: /0fd0215c-d6d5-40c8-9ba6-79b69721f4c1
title: 'Dash - Missing Patch - Count by Machines - Client Filter'
title_meta: 'Dash - Missing Patch - Count by Machines - Client Filter'
keywords: ['client', 'patch', 'status', 'machines', 'breakdown']
description: 'This document provides an RMM-specific display of the client-level breakdown of machines that are missing a certain number of patches, including detailed columns for client ID, name, operating system, patch status, and machine count.'
tags: ['report', 'security', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

This Dataview is the RMM-specific display of the client-level breakdown of machines missing a certain number of patches.

**Sample Screenshot:**  
![Sample Screenshot](../../../static/img/docs/0fd0215c-d6d5-40c8-9ba6-79b69721f4c1/image_1.webp)

## Dependencies

- [CWM - Automate - View - Plugin_ProVal_V_Patch_Count_Status](/docs/c1fad1cd-7320-472e-b20e-3d8fa620f0db)  
- [CWM - Automate - Script - MySQL - View - Create - Plugin_ProVal_V_Patch_Count_Status](/docs/7b802d5b-f445-41d6-b3e4-30986c3102a0)  

## Columns

| Column        | Description                                                                                  |
|---------------|----------------------------------------------------------------------------------------------|
| Client ID     | Client ID                                                                                     |
| Client Name   | Client Name                                                                                  |
| OS            | Operating System (Server | Workstation)                                                     |
| Patch Status  | Category Name (Full | 1-2 Missing | 3-4 Missing | 5+ Missing | Missing Patch Info)         |
| Machine Count | Number of machines falling under the concerned category/patch status for the client.       |