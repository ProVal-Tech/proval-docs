---
id: '8e107867-6d8d-4b6c-aa10-20f8da59fdca'
slug: /8e107867-6d8d-4b6c-aa10-20f8da59fdca
title: 'NTLMv1.1 Detection'
title_meta: 'NTLMv1.1 Detection'
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
| System       | 127.0.0.1     | Run File    | **REDACTED**    | State Based   | 900      | ![](../../../static/img/docs/8e107867-6d8d-4b6c-aa10-20f8da59fdca/image_1.webp) |

## Target

Managed Windows Computers

## Dependencies

[EPM - Windows Configuration - Dataview - NTLMv1.1 Status [Remote Monitor]](/docs/5a6640f6-f0cb-4231-845f-e48c9445aa22)

## How to Import

[Import - Remote Monitor - NTLMv1.1 Detection](/docs/92ad2db8-528e-4bce-8011-ed0e3563e335)