---
id: 'bf426f89-7da1-4f4b-88b7-03983136458c'
slug: /bf426f89-7da1-4f4b-88b7-03983136458c
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
   ![Image](../../../static/img/docs/bf426f89-7da1-4f4b-88b7-03983136458c/image_1.webp)  
   The export will download the necessary XML file.  
   ![Image](../../../static/img/docs/bf426f89-7da1-4f4b-88b7-03983136458c/image_2.webp)  
   
2. Import this XML file into the partner's VSA RMM instance.  
   ![Image](../../../static/img/docs/bf426f89-7da1-4f4b-88b7-03983136458c/image_3.webp)  

## Output

The expected Last Exec Status is "success."  
![Image](../../../static/img/docs/bf426f89-7da1-4f4b-88b7-03983136458c/image_4.webp)  

### Agent Procedure Log

Two log entries are expected. The procedure will first check the existing channel.  
![Image](../../../static/img/docs/bf426f89-7da1-4f4b-88b7-03983136458c/image_5.webp)  

### Custom Field

![Image](../../../static/img/docs/bf426f89-7da1-4f4b-88b7-03983136458c/image_6.webp)  