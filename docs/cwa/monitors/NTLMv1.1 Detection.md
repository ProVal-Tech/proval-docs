---
id: '8e107867-6d8d-4b6c-aa10-20f8da59fdca'
title: 'Check NTLMv1.1 Status on Managed Windows Computers'
title_meta: 'Check NTLMv1.1 Status on Managed Windows Computers'
keywords: ['ntlm', 'status', 'windows', 'monitor', 'security']
description: 'This document provides a detailed guide on checking whether NTLMv1.1 is enabled on managed Windows machines. It includes suggested configurations for alerts, dependencies, and import instructions for remote monitoring.'
tags: ['security', 'windows']
draft: false
unlisted: false
---

## Summary

This document checks whether NTLMv1.1 is enabled on the end machine.

## Details

**Suggested "Limit to"**: Managed Windows Computers  
**Suggested Alert Style**: Once  
**Suggested Alert Template**: Default Do Nothing  

Insert the details of the monitor in the table below.

| Check Action | Server Address | Check Type | Check Value | Comparator   | Interval | Result                                       |
|--------------|----------------|-------------|-------------|---------------|----------|----------------------------------------------|
| System       | 127.0.0.1     | Run File    | REDACTED    | State Based   | 900      | ![](../../../static/img/NTLMv1.1-Detection/image_1.png) |

## Target

Managed Windows Computers

## Dependencies

[EPM - Windows Configuration - Dataview - NTLMv1.1 Status [Remote Monitor]](<../dataviews/NTLMv1.1 Status Remote Monitor.md>)

## How to Import

[Import - Remote Monitor - NTLMv1.1 Detection](<./NTLMv1.1 Detection.md>)
