---
id: '656f037b-8dba-4e59-b135-33dcd5b0b7dc'
title: 'Set Update Channel for Microsoft 365 Clients'
title_meta: 'Set Update Channel for Microsoft 365 Clients'
keywords: ['update', 'channel', 'microsoft365', 'client', 'computer']
description: 'This document provides guidance on selecting the Update Channel for Microsoft 365 clients within the ConnectWise RMM environment. It outlines the available options, dependencies, and details about the configuration settings for the Update Channel.'
tags: ['configuration', 'microsoft365', 'client', 'update', 'rmm']
draft: false
unlisted: false
---
## Summary

Select the Update Channel from the drop-down menu to set for the client's computers. It is used by the [CW RMM - Task - Microsoft 365 - Click-to-Run - Set Update Channel](https://proval.itglue.com/DOC-5078775-17430050)  

Available options are:  
- Current Channel  
- Monthly Enterprise Channel  
- Semi-Annual Enterprise Channel  
- Beta Channel  
- None  

## Dependencies

[CW RMM - Solution - Microsoft 365 - Click-to-Run - Set Update Channel](https://proval.itglue.com/DOC-5078775-17435723)  

## Details

| Field Name         | Level   | Type      | Default Value | Description                                                                                                                                                                                                                                                                                                                                                     | Editable |
|--------------------|---------|-----------|---------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|
| Update Channel      | Company | Drop Down | None          | Select the Update Channel from the drop-down menu to set for the computer. Available options are: Current Channel, Monthly Enterprise Channel, Semi-Annual Enterprise Channel, Beta Channel, None. Computer Level EDF can be used to override the value set in the Client Level EDF.                                                                                 | Yes      |

![Image](../../../static/img/Client---Update-Channel/image_1.png)  
![Image](../../../static/img/Client---Update-Channel/image_2.png)  






