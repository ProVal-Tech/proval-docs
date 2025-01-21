---
id: '772c0498-4505-4f1c-afc4-46788294b3e2'
title: 'Setting the Update Channel for Microsoft 365 Click-to-Run'
title_meta: 'Setting the Update Channel for Microsoft 365 Click-to-Run'
keywords: ['update', 'channel', 'microsoft', 'click-to-run', 'rmm']
description: 'This document provides a detailed overview of how to set the Update Channel for Microsoft 365 Click-to-Run using CW RMM. It outlines the available options, dependencies, and provides a table of relevant field details, along with screenshots for reference.'
tags: ['software', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

Select the Update Channel from the drop-down menu to set for the computer. It is used by the [CW RMM - Task - Microsoft 365 - Click-to-Run - Set Update Channel](https://proval.itglue.com/DOC-5078775-17430050).

Available options are:  
- Current Channel  
- Monthly Enterprise Channel  
- Semi-Annual Enterprise Channel  
- Beta Channel  
- None  

## Dependencies

[CW RMM - Solution - Microsoft 365 - Click-to-Run - Set Update Channel](https://proval.itglue.com/DOC-5078775-17435723)

## Details

| Field Name         | Level    | Type       | Default Value | Description                                                                                                                                                                                                                   | Editable |
|--------------------|----------|------------|---------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|
| Update Channel      | ENDPOINT | Drop Down  | None          | Select the Update Channel from the drop-down menu to set for the computer. Available options are: Current Channel, Monthly Enterprise Channel, Semi-Annual Enterprise Channel, Beta Channel, None. Computer Level EDF can be used to override the value set in the Client Level EDF. | Yes      |

## Screenshots

![Screenshot 1](../../../static/img/Endpoint---Update-Channel/image_1.png)  
![Screenshot 2](../../../static/img/Endpoint---Update-Channel/image_2.png)  

