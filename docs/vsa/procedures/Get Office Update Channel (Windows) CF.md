---
id: 'ed6559df-a8d5-48d9-8a9e-fe26b84a056b'
title: 'Get Office Update Channel (Windows) CF'
title_meta: 'Get Office Update Channel (Windows) CF'
keywords: ['office', 'update', 'channel', 'cf', 'agent', 'procedure']
description: 'This document outlines the procedure to check and update the Microsoft Office update channel using VSA RMM. It details the various update channels available, the dependencies required, and the implementation steps to successfully export and import the agent procedure.'
tags: ['software', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

This agent procedure is used to check the update channel for Microsoft Office and update to a CF.

The following channels are checked:

- Current (Monthly)
- Current Preview (Monthly Targeted/Insiders)
- Semi-Annual Enterprise (Broad)
- Semi-Annual Enterprise Preview (Targeted)
- Monthly Enterprise
- Beta
- LTSC
- LTSC Preview
- LTSC 2021 (Office 2021+)

## Dependencies

Custom Field: **cPVAL Office Update Channel**

## Implementation

1. Export the agent procedure from ProVal's VSA RMM instance.  
   Name: Get Office Update Channel (Windows) [CF]  
   ![Image](../../../static/img/Get-Office-Update-Channel-(Windows)-CF/image_1.png)  
   The export will download the necessary XML file.  
   ![Image](../../../static/img/Get-Office-Update-Channel-(Windows)-CF/image_2.png)  
   
2. Import this XML file into the partner's VSA RMM instance.  
   ![Image](../../../static/img/Get-Office-Update-Channel-(Windows)-CF/image_3.png)  

3. Once imported, create a custom field in the partner environment.  
   Name: cPVAL Office Update Channel  
   Custom Field Type: String  
   ![Image](../../../static/img/Get-Office-Update-Channel-(Windows)-CF/image_4.png)  

## Output

A Last Exec Status of success is expected.  
![Image](../../../static/img/Get-Office-Update-Channel-(Windows)-CF/image_5.png)  
Agent Procedure Log  
![Image](../../../static/img/Get-Office-Update-Channel-(Windows)-CF/image_6.png)  

Custom Field  
![Image](../../../static/img/Get-Office-Update-Channel-(Windows)-CF/image_7.png)  



