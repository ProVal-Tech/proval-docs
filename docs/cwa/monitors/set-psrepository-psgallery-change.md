---
id: '5e33196d-a1ce-4a8d-bc78-825c45ce8329'
slug: /5e33196d-a1ce-4a8d-bc78-825c45ce8329
title: 'Set-PsRepository PSGallery [Change]'
title_meta: 'Set-PsRepository PSGallery [Change]'
keywords: ['psgallery', 'repository', 'monitor', 'windows', 'trust']
description: 'This document provides a summary and details on a remote monitor that sets PSGallery as a trusted PowerShell repository if it is not already configured. It highlights the changes made to the systems, the target environment, and implementation steps, ensuring that users can effectively manage their PowerShell repositories.'
tags: ['security', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

This remote monitor attempts to set `PSGallery` as a trusted PowerShell repository if it is not already configured. You might have encountered this error at least once; this remote monitor attempts to resolve it.

![Image](../../../static/img/docs/5e33196d-a1ce-4a8d-bc78-825c45ce8329/image_1.webp)

This monitor will make changes to all systems it is deployed to.  
![Police Car Light](https://c.tenor.com/8vSJsVW-1pQAAAAj/police-car-light-joypixels.gif)

**What will change?**  
This monitor will check to see if the PSGallery is a trusted repository and will set it properly if needed.  
This automatically installs the prerequisite that is needed by a lot of ProVal content.

*This action will happen regardless of what alert template is set against the monitor.*  
*Monitors that make changes to the environment can be difficult to audit actions taken. Use with caution.*

## Details

**Suggested "Limit to"**: Windows Machines (PowerShell 5.0+)  
**Suggested Alert Style**: Once  
**Suggested Alert Template**: Default - Do Nothing  

Insert the details of the monitor in the table below.

| Check Action | Server Address | Check Type | Execute Info | Condition | Interval |
|--------------|----------------|-------------|---------------|-----------|----------|
| System       | 127.0.0.1      | Run File    | **REDACTED**  | State Based| 86400    |

## Target

Managed Windows Machines

## Implementation

[Import - Remote Monitor - Set-PsRepository PSGallery](/docs/5cb1373f-6cdc-4576-8b3e-e8bfc4d664de)