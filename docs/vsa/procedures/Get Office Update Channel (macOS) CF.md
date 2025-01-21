---
id: 'db1a41df-d87a-4a48-adbd-187b7c082834'
title: 'Get Office Update Channel (macOS) [CF]'
title_meta: 'Get Office Update Channel (macOS) [CF]'
keywords: ['office', 'update', 'channel', 'macos', 'customfield']
description: 'This agent procedure checks the update channel for Microsoft Office on macOS endpoints and updates the corresponding custom field. It outlines the necessary steps to implement the procedure, including dependencies, export/import instructions, and expected output for successful execution.'
tags: ['macos', 'software', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

This agent procedure is used to check the update channel for Microsoft Office on macOS endpoints and update the value to a custom field (CF).

The following [channels](https://learn.microsoft.com/en-us/microsoft-365-apps/insider/deploy/preference) are available for macOS:  
- Current  
- Preview  
- Beta  

## Dependencies

- Custom Field: **cPVAL Office Update Channel**  
- Agent Procedure: **Office Update Schedule Select (macOS)**  

![Police Car Light](https://c.tenor.com/8vSJsVW-1pQAAAAj/police-car-light-joypixels.gif)  
The data this procedure gathers does not exist by default on macOS. To populate the custom field with this procedure, first use the agent procedure: **Office Update Schedule Select (macOS)** to set the channel.

## Implementation

1. Export the agent procedure from ProVal's VSA RMM instance  
   - Name: Get Office Update Channel (macOS) [CF]  
   ![Export Image 1](../../../static/img/Get-Office-Update-Channel-(macOS)-CF/image_1.png)  
   The export will download the necessary XML file.  
   ![Export Image 2](../../../static/img/Get-Office-Update-Channel-(macOS)-CF/image_2.png)  
   
2. Import this XML file into the partner's VSA RMM instance  
   ![Import Image](../../../static/img/Get-Office-Update-Channel-(macOS)-CF/image_3.png)  

3. Once imported, create a custom field in the partner environment  
   - Name: cPVAL Office Update Channel  
   - Custom Field Type: String  
   ![Custom Field Image](../../../static/img/Get-Office-Update-Channel-(macOS)-CF/image_4.png)  

## Output

The expected result is a Last Exec Status of success.  
![Output Image 1](../../../static/img/Get-Office-Update-Channel-(macOS)-CF/image_5.png)  
Agent Procedure Log  
![Output Image 2](../../../static/img/Get-Office-Update-Channel-(macOS)-CF/image_6.png)  

Custom Field  
![Custom Field Image 2](../../../static/img/Get-Office-Update-Channel-(macOS)-CF/image_7.png)  
