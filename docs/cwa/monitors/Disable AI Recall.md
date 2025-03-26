---
id: 'c9ef3af9-ea83-467d-a5b7-e34248ab65c5'
slug: /c9ef3af9-ea83-467d-a5b7-e34248ab65c5
title: 'Disable AI Recall'
title_meta: 'Disable AI Recall'
keywords: ['windows', 'ai', 'recall', 'monitor', 'disable']
description: 'This document provides a detailed guide on disabling the AI recall feature on Windows 11 machines, including suggested alert styles, ticketing information, and import instructions for remote monitoring.'
tags: ['ticketing', 'windows']
draft: false
unlisted: false
---

## Summary

This monitor disables the AI recall feature on Windows 11 machines.

For more details on this feature, visit the following link:  
[https://learn.microsoft.com/en-us/windows/client-management/manage-recall](https://learn.microsoft.com/en-us/windows/client-management/manage-recall)

## Details

**Suggested "Limit to"**: Windows 11 machines  
**Suggested Alert Style**: Once  
**Suggested Alert Template**: △ Custom - Ticket Creation - Computer  

| Check Action | Server Address | Check Type | Execute Info | Comparator | Interval | Result |
|--------------|----------------|------------|---------------|------------|----------|--------|
| System       | 127.0.0.1     | Run File   | **REDACTED**  | Regex Match | 1800     | ![Image](../../../static/img/ProVal---Production---Disable-AI-Recall/image_1.png) |

## Target

Windows 11 machines only.

## Ticketing

**Subject**: `Failed to Disable AI Recall on %COMPUTERNAME%`

**Body**: `Failed to Disable AI Recall on %COMPUTERNAME% on %CLIENTNAME%\%COMPUTERNAME% at %LOCATIONNAME%` 

## How To Import

[Import - Remote Monitor - Disable AI Recall](<./Import%20-%20Remote%20Monitor%20-%20Disable%20AI%20Recall.md>)
