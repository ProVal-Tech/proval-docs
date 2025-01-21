---
id: 'bf426f89-7da1-4f4b-88b7-03983136458c'
title: 'Office C2R Update Schedule Select (macOS)'
title_meta: 'Office C2R Update Schedule Select (macOS)'
keywords: ['office', 'macos', 'update', 'channel', 'procedure']
description: 'This document outlines the procedure for setting the update channel for Microsoft Office on macOS endpoints, including the available channels and implementation steps for exporting and importing the agent procedure in VSA RMM.'
tags: ['macos', 'software', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

This agent procedure is used to set the update channel for Microsoft Office for macOS endpoints.

The following [channels](https://learn.microsoft.com/en-us/microsoft-365-apps/insider/deploy/preference) are available for macOS:

- Current
- Preview
- Beta

## Dependencies

## Implementation

1. Export the agent procedure from ProVal's VSA RMM instance.  
   **Name:** Office Update Schedule Select (macOS)  
   ![Image](../../../static/img/Office-C2R-Update-Schedule-Select-(macOS)/image_1.png)  
   The export will download the necessary XML file.  
   ![Image](../../../static/img/Office-C2R-Update-Schedule-Select-(macOS)/image_2.png)  
   
2. Import this XML file into the partner's VSA RMM instance.  
   ![Image](../../../static/img/Office-C2R-Update-Schedule-Select-(macOS)/image_3.png)  

## Output

The expected Last Exec Status is "success."  
![Image](../../../static/img/Office-C2R-Update-Schedule-Select-(macOS)/image_4.png)  

### Agent Procedure Log

Two log entries are expected. The procedure will first check the existing channel.  
![Image](../../../static/img/Office-C2R-Update-Schedule-Select-(macOS)/image_5.png)  

### Custom Field

![Image](../../../static/img/Office-C2R-Update-Schedule-Select-(macOS)/image_6.png)  



