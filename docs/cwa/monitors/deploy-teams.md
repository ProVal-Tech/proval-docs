---
id: '3f036a74-e39e-4802-86a3-7087b1f0f7cb'
slug: /3f036a74-e39e-4802-86a3-7087b1f0f7cb
title: 'Deploy Teams'
title_meta: 'Deploy Teams'
keywords: ['teams', 'installer', 'monitor', 'windows', 'workstations']
description: 'This document outlines the process to detect computers that are missing the Teams Machine-Wide Installer application. It includes details on suggested limits, alert styles, and implementation steps for effective monitoring of Windows workstations.'
tags: ['installation', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

The purpose of this document is to outline the process for detecting computers that are missing the `Teams Machine-Wide Installer` application.

## Details

**Suggested "Limit to"**: Windows Workstations  
**Suggested Alert Style**: Once  
**Suggested Alert Template**: △ Custom - Execute Script - Winget - Install/Update - Teams  

Insert the details of the monitor in the table below.

| Check Action | Server Address | Check Type | Execute Info | Comparator | Interval | Result |
|--------------|----------------|------------|---------------|------------|----------|--------|
| System       | 127.0.0.1     | Run File   | `REDACTED`    | State Based| 86400    | ![Result](../../../static/img/SWM---Software-Install--Deploy-Teams/image_1.png) |

## Dependencies

[**EPM - Software Install - Script - Winget - Install/Update - Teams**](/docs/d5ce6f1c-94ef-4e78-8e0a-61dd74f8d2cc)  

## Target

Managed Windows Workstations

## Alert Template

**Name**: `△ Custom - Execute Script - Winget - Install/Update - Teams`  

**Note**: The [**EPM - Software Install - Script - Winget - Install/Update - Teams**](/docs/d5ce6f1c-94ef-4e78-8e0a-61dd74f8d2cc) script should be imported prior to creating or importing the alert template, as the alert template should run this script on failures.  

## Implementation

Follow the steps provided in this private document to implement the solution:  
[**Import - Remote Monitor - Deploy Teams**](/docs/5cc62311-8109-43b8-af64-e0aac4292d19)   
