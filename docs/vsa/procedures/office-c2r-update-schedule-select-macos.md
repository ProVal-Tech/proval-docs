---
id: '47d714f5-714e-4078-9464-54b3e62ae093'
slug: /47d714f5-714e-4078-9464-54b3e62ae093
title: 'Office Update Schedule Select (macOS)'
title_meta: 'Office Update Schedule Select (macOS)'
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
   ![Image](../../../static/img/docs/47d714f5-714e-4078-9464-54b3e62ae093/image1.webp)  
   The export will download the necessary XML file.  
   ![Image](../../../static/img/docs/47d714f5-714e-4078-9464-54b3e62ae093/image2.webp)  
   
2. Import this XML file into the partner's VSA RMM instance.  
   ![Image](../../../static/img/docs/47d714f5-714e-4078-9464-54b3e62ae093/image3.webp)  

## Output

- Agent Procedure Log  

### Custom Field

![Image](../../../static/img/docs/47d714f5-714e-4078-9464-54b3e62ae093/image4.webp)  